# AGENTS: Module Authoring Guide

The repository follows the dendritic pattern: every file under `modules/` is a self-contained flake-parts module that registers itself under a `flake.*` registry. This page explains how to author those modules so future changes stay consistent.

## Creating a nix-darwin module
1. Pick a descriptive file under `modules/darwin/` (e.g., `modules/darwin/homebrew.nix`).
2. Export a function that registers a named module inside `flake.darwinModules`.
3. Return pure option/config definitions—no side effects at the top level.

**Template**
```nix
# modules/darwin/<name>.nix
{ ... }: {
  flake.darwinModules.<name> = {
    pkgs,
    ...
  }: {
    # Declare options/config here.
    environment.systemPackages = [ pkgs.git ];
  };
}
```
- Arguments come from nix-darwin (`pkgs`, `lib`) plus anything passed through `specialArgs` (e.g., `username`).
- Keep each module focused. Multiple related modules are fine—just give each a unique registry key.

## Creating a Home-Manager module
Home-Manager programs live under `modules/dev/` or `modules/shells/`. They register under `flake.homeManagerModules` and are later threaded into the host’s `homeManagerModules` list.

**Template**
```nix
# modules/dev/<tool>.nix
{ ... }: {
  flake.homeManagerModules.<tool> = {
    pkgs,
    lib,
    config,
    ...
  }: {
    programs.<tool> = {
      enable = true;
      # Program-specific settings…
    };
  };
}
```
- Use `config` for HM helpers (e.g., `config.lib.file.mkOutOfStoreSymlink`).
- Avoid side effects or `pkgs.callPackage` at the top level; keep everything inside the returned attrset.

## Defining a host
Hosts live under `modules/hosts/<host>.nix` and construct the actual `flake.darwinConfigurations.<name>` attribute. The host pulls in whatever modules it needs from `self.darwinModules` / `self.homeManagerModules`.

**Template**
```nix
# modules/hosts/<host>.nix
{
  self,
  inputs,
  ...
}: let
  system = "aarch64-darwin";
  username = "voidptr";
  baseModule = { ... };
in {
  flake.darwinConfigurations.<name> = inputs.nix-darwin.lib.darwinSystem {
    inherit system;
    specialArgs = {
      inherit username;
      homeManagerModules = builtins.attrValues self.homeManagerModules;
    };
    modules =
      [ baseModule ]
      ++ [ self.darwinModules.system self.darwinModules.homebrew ]
      ++ [
        inputs.nix-homebrew.darwinModules.nix-homebrew
        inputs.home-manager.darwinModules.home-manager
      ];
  };
}
```
- `baseModule` typically pins platform defaults (state version, `allowUnfreePredicate`, etc.).
- Append whichever darwin modules and HM modules the host needs.

## Checklist
- Place darwin-related files under `modules/darwin/` and register them via `flake.darwinModules.<name>`.
- Place Home-Manager files under `modules/dev/` or `modules/shells/` and register them via `flake.homeManagerModules.<name>`.
- Define hosts under `modules/hosts/` and expose `flake.darwinConfigurations.<host>`.
- After adding/renaming modules, run `nix build .#darwinConfigurations.<host>.system` (or your `rebuild` alias) to ensure everything evaluates.
}
