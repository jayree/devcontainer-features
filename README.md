# Dev Container Features for Salesforce CLI
## Contents

This repository contains a _collection_ of Features for Salesforce CLI.

### `sf plugins (sf-plugins)`

Installs sf plugins.

#### Example Usage

```json
"features": {
    "ghcr.io/jayree/devcontainer-features/sf-plugins:1": {
        "plugins": "@jayree/sfdx-plugin-manifest,@jayree/sfdx-plugin-prettier"
    }
}
```

#### Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| plugins | Comma separated list of sf plugins to install. | string | - |

### `sf autocomplete (sf-autocomplete)`

Enables sf zsh autocompletion.

#### Example Usage

```json
"features": {
    "ghcr.io/jayree/devcontainer-features/sf-autocomplete:1": {}
}
```

### `npm registry (npm-registry)`

Adds npm registry.

#### Example Usage

```json
"features": {
    "ghcr.io/jayree/devcontainer-features/npm-registry:1": {
        "registry": "@SCOPE:registry=https://npm.pkg.github.com\n//npm.pkg.github.com/:_authToken=${localEnv:GITHUB_TOKEN}"
    }
}
```

#### Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| registry | Registry configuration. | string | - |
