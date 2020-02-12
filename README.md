<div align="center">

# GitHub Action for Awesome Lint

![.github/workflows/tests.yml](https://github.com/jthegedus/github-action-awesome-lint/workflows/.github/workflows/tests.yml/badge.svg) ![.github/workflows/lint.yml](https://github.com/jthegedus/github-action-awesome-lint/workflows/.github/workflows/lint.yml/badge.svg)

This Action wraps [`awesome-lint`](https://github.com/sindresorhus/awesome-lint/) allowing easy linting of your awesome projects!

It allows specifying the version of the [`awesome-lint`](https://github.com/sindresorhus/awesome-lint/) package you wish to install from `npm`!

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

Contributions are welcome! See Todo List below for areas to help with.

### Todo List

- PR Template
- Issue Template
- Contribution Guide
- Blog post about installing deps at runtime
- Expected failure examples
- Better GitHub Actions Annotations output
- Runtime check for new version of Action being used with announcement log in usage
- GitHub Actions template
- Required PR Status Checks
- Run Shellcheck over `entrypoint.sh`

## License

[MIT License](./LICENSE)
