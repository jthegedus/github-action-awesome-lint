<div align="center">

# GitHub Action for Awesome Lint

[![Marketplace](https://img.shields.io/badge/GitHub-Marketplace-green.svg)](https://github.com/marketplace/actions/awesome-lint) [![Release](https://img.shields.io/github/release/jthegedus/github-action-awesome-lint.svg)](https://github.com/jthegedus/github-action-awesome-lint/releases) ![.github/workflows/tests.yml](https://github.com/jthegedus/github-action-awesome-lint/workflows/.github/workflows/tests.yml/badge.svg) ![.github/workflows/lint.yml](https://github.com/jthegedus/github-action-awesome-lint/workflows/.github/workflows/lint.yml/badge.svg)

This Action wraps [`awesome-lint`](https://github.com/sindresorhus/awesome-lint/) allowing easy linting of your awesome projects!

For improved security and usage, it allows specifying the version of the [`awesome-lint`](https://github.com/sindresorhus/awesome-lint/) package you wish to install from `npm`! This is achieved by installing the dependency at runtime.

</div>

## Contents

- [Inputs](#inputs)
- [Environment Variables](#environment-variables)
- [Example Usage](#example-usage)
    - [Vanilla](#vanilla)
    - [Custom File](#custom-file)
    - [Specific `awesome-lint` Version](#specific-awesome-lint-version)
    - [Specific `awesome-lint` Version with Custom File](#specific-awesome-lint-version-with-custom-file)
- [Contributions](#contributions)
    - [Todo](#todo-list)
- [License](License)

## Inputs

- `args` - Optional. These are the arguments to pass to the `awesome-lint` CLI.

## Environment Variables

- `AWESOME_LINT_VERSION` - Optional. The `awesome-lint` package version you wish to use.

## Example Usage

### Vanilla

`awesome-lint` CLI will automatically lint `README.md`:

```yaml
on: [push]

jobs:
    awesome-lint:
      - name: Test awesome-lint
        id: custom-action-test
        uses: jthegedus/github-action-awesome-lint
```

### Custom File

Specify the file to lint:

```yaml
on: [push]

jobs:
    awesome-lint:
      - name: Test awesome-lint with custom file path
        id: custom-action-test
        uses: jthegedus/github-action-awesome-lint
        with:
            args: "path/to/file.md
```

### Specific `awesome-lint` Version

Specify the `awesome-lint` package you wish to install from `npm`:

```yaml
on: [push]

jobs:
    awesome-lint:
      - name: Test custom awesome-lint version
        id: custom-action-test
        uses: jthegedus/github-action-awesome-lint
        env:
            AWESOME_LINT_VERSION: "0.11"
```

### Specific `awesome-lint` Version with Custom File

Combination of all custom values:

```yaml
on: [push]

jobs:
    awesome-lint:
      - name: Test custom awesome-lint version
        id: custom-action-test
        uses: jthegedus/github-action-awesome-lint
        env:
            AWESOME_LINT_VERSION: "0.11"
        with:
            args: "path/to/file.md"
```

## Contributions

[Contributions of any kind welcome, just follow the guidelines](.github/contributing.md)!

### Contributors

[Thanks goes to these contributors](https://github.com/jthegedus/github-action-awesome-lint/graphs/contributors)!

### Todo List

After the below are complete we will cut a major semver release: `v1.0.0`.

Repo:

- ~~Badges in readme~~
- ~~Required PR Status Checks~~
- PR Template
- Issue Template
- ~~Contribution Guide~~
- Release on GitHub Marketplace

Tests:

- Expected failure examples
- Better GitHub Actions Annotations output - see https://developer.github.com/v3/checks/runs/#update-a-check-run
- ~~Run [Shellcheck](https://github.com/koalaman/shellcheck) over `entrypoint.sh`~~
- Run [Dockerfile Lint](https://github.com/projectatomic/dockerfile_lint) over `dockerfile`

Functionality:

- Runtime check for new version of Action being used with announcement log in usage
- Improved logging (find out how GitHub Actions performs highlighting and determine nice visual pattern to follow)

Other:

- Blog post about installing deps at runtime
- GitHub Actions template

## Security

[See our policy](.github/security.md)

## License

[MIT License](./LICENSE)
