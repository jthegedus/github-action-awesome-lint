<div align="center">

# GitHub Action for Awesome Lint (Versionless)!

[![Marketplace](https://img.shields.io/badge/GitHub-Marketplace-green.svg)](https://github.com/marketplace/actions/awesome-lint-versionless) [![Release](https://img.shields.io/github/release/jthegedus/github-action-awesome-lint.svg)](https://github.com/jthegedus/github-action-awesome-lint/releases) ![.github/workflows/tests.yml](https://github.com/jthegedus/github-action-awesome-lint/workflows/.github/workflows/tests.yml/badge.svg) ![.github/workflows/lint.yml](https://github.com/jthegedus/github-action-awesome-lint/workflows/.github/workflows/lint.yml/badge.svg)

This Action wraps [`awesome-lint`](https://github.com/sindresorhus/awesome-lint/) allowing easy linting of your awesome projects!

</div>

## Contents

- [Versionless](#versionless?)
- [Inputs](#inputs)
- [Environment Variables](#environment-variables)
- [Example Usage](#example-usage)
    - [Vanilla](#vanilla)
    - [Custom File](#custom-file)
    - [Specific `awesome-lint` Version](#specific-awesome-lint-version)
    - [Specific `awesome-lint` Version with Custom File](#specific-awesome-lint-version-with-custom-file)
- [Contributions](#contributions)
    - [Todo](#todo-list)
- [Security](#security)
- [License](#license)

## Versionless?

What I mean by _versionless_, is that this Action allows consumers to specify the version of the [`awesome-lint`](https://github.com/sindresorhus/awesome-lint/) package they desire.

<details>
<summary><b>Why do this? What are the downsides?</b></summary>

Pinning your Actions to a commit sha `d007f09bd2de33809fb3c0e43f8461d092d38970` is preferred as it is considered more secure to pinning to release numbers `v1.0.0` or branch names `main` as the code cannot change without you explicitly opting-in.

This design allows people to pin to a commit sha of this Action with the freedom to update the version of `awesome-lint` independently. This is not possible in an Action written in JavaScript, or with Docker build-time dependency installation.

In my opinion, an Action that wraps an existing tool for consumption in GitHub Actions should only provide that convenience. And that convenience shouldn't require them to constantly be updating their usage. It does make updating the version of `awesome-lint` manual, but again, that is the more secure option to take.

__Downsides?__

`npm install` is performed at time of use. The Action still requires to be built with Docker, so even if the `npm install` was performed in the Dockerfile it wouldn't save the ~12 second `npm install` time. If the Action was reused, it would need to `npm install` on each use, even if the Docker image was cached. A small tradeoff if you ask me.

</details>

## Inputs

- `args` - Optional. These are the arguments to pass to the `awesome-lint` CLI.

## Environment Variables

- `AWESOME_LINT_VERSION` - Optional. The `awesome-lint` package version you wish to use.

## Example Usage

### Vanilla

`awesome-lint` CLI will automatically lint `README.md`:

```yaml
name: Lint Awesome List
on: [push]

jobs:
  awesome-lint:
    name: "lint: awesome-lint"
    runs-on: ubuntu-latest
    steps:
      - name: "checkout repo"
        uses: actions/checkout@v2.0.0
        with:
          fetch-depth: 0
      - name: Test awesome-lint with custom file path
        uses: jthegedus/github-action-awesome-lint@68fc989d5a01aa127ce502a59f72ebe4166386f1 # commit_sha of tag v0.1.0
```

### Custom File

Specify the file to lint:

```yaml
name: Lint Awesome List
on: [push]

jobs:
  awesome-lint:
    name: "lint: awesome-lint"
    runs-on: ubuntu-latest
    steps:
      - name: "checkout repo"
        uses: actions/checkout@v2.0.0
        with:
          fetch-depth: 0
      - name: Test awesome-lint with custom file path
        uses: jthegedus/github-action-awesome-lint@68fc989d5a01aa127ce502a59f72ebe4166386f1 # commit_sha of tag v0.1.0
        with:
          args: "path/to/file.md
```

### Specific `awesome-lint` Version

Specify the `awesome-lint` package you wish to install from `npm`:

```yaml
name: Lint Awesome List
on: [push]

jobs:
  awesome-lint:
    name: "lint: awesome-lint"
    runs-on: ubuntu-latest
    steps:
      - name: "checkout repo"
        uses: actions/checkout@v2.0.0
        with:
          fetch-depth: 0
      - name: Test custom awesome-lint version
        uses: jthegedus/github-action-awesome-lint@68fc989d5a01aa127ce502a59f72ebe4166386f1 # commit_sha of tag v0.1.0
        env:
          AWESOME_LINT_VERSION: "0.11"
```

### Specific `awesome-lint` Version with Custom File

Combination of all custom values:

```yaml
name: Lint Awesome List
on: [push]

jobs:
  awesome-lint:
    name: "lint: awesome-lint"
    runs-on: ubuntu-latest
    steps:
      - name: "checkout repo"
        uses: actions/checkout@v2.0.0
        with:
          fetch-depth: 0
      - name: Test custom awesome-lint version
        uses: jthegedus/github-action-awesome-lint@68fc989d5a01aa127ce502a59f72ebe4166386f1 # commit_sha of tag v0.1.0
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

Tests:

- Expected failure examples
- Better GitHub Actions Annotations output - see https://developer.github.com/v3/checks/runs/#update-a-check-run
- ~~Run [Shellcheck](https://github.com/koalaman/shellcheck) over `entrypoint.sh`~~
- Run [hadolint (Dockerfile Linter)](https://github.com/hadolint/hadolint) over `dockerfile`

Functionality:

- Runtime check for new version of Action being used with announcement log in usage
- Improved logging (find out how GitHub Actions performs highlighting and determine nice visual pattern to follow)

Other:

- Blog post about installing deps at runtime
- GitHub Actions template

## Security

[See our policy](.github/security.md)

## License

[MIT License](./license)
