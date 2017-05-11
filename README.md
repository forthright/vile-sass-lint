# vile-sass-lint [![Circle CI](https://circleci.com/gh/forthright/vile-sass-lint.svg?style=shield&circle-token=00d3226575f038a2187cfab343423bd9fd3804ec)](https://circleci.com/gh/forthright/vile-sass-lint) [![score-badge](https://vile.io/api/v0/projects/vile-sass-lint/badges/score?token=USryyHar5xQs7cBjNUdZ)](https://vile.io/~brentlintner/vile-sass-lint) [![security-badge](https://vile.io/api/v0/projects/vile-sass-lint/badges/security?token=USryyHar5xQs7cBjNUdZ)](https://vile.io/~brentlintner/vile-sass-lint) [![coverage-badge](https://vile.io/api/v0/projects/vile-sass-lint/badges/coverage?token=USryyHar5xQs7cBjNUdZ)](https://vile.io/~brentlintner/vile-sass-lint) [![dependency-badge](https://vile.io/api/v0/projects/vile-sass-lint/badges/dependency?token=USryyHar5xQs7cBjNUdZ)](https://vile.io/~brentlintner/vile-sass-lint)

A [vile](https://vile.io) plugin for [sass-lint](https://github.com/sasstools/sass-lint).

## Requirements

- [nodejs](http://nodejs.org)
- [npm](http://npmjs.org)

## Installation

*until [this bug](https://github.com/sasstools/sass-lint/issues/955) is fixed upstream, use our fork:*

    npm i -D vile vile-sass-lint github:brentlintner/sass-lint

## Config

The `sass-lint` cli should use a  `.sass-lint.yml` if it exists.

You can specify a custom path as well:

```yaml
sass-lint:
  config: some/custom/sass-lint.yml
```

## Ignoring Files

You can ignore files in your `.sass-lint.yml` config file.

## Allowing Files

You can set `vile.allow` or `sass-lint.allow` and this plugin will honour it.

Example:

```yaml
sass-lint:
  allow:
    - src
```

You can also still include files in your `.sass-lint.yml` config file.

## Versioning

This project ascribes to [semantic versioning](http://semver.org).

## Licensing

This project is licensed under the [MPL-2.0](LICENSE) license.

Any contributions made to this project are made under the current license.

## Contributions

Current list of [Contributors](https://github.com/forthright/vile-sass-lint/graphs/contributors).

Any contributions are welcome and appreciated!

All you need to do is submit a [Pull Request](https://github.com/forthright/vile-sass-lint/pulls).

1. Please consider tests and code quality before submitting.
2. Please try to keep commits clean, atomic and well explained (for others).

### Issues

Current issue tracker is on [GitHub](https://github.com/forthright/vile-sass-lint/issues).

Even if you are uncomfortable with code, an issue or question is welcome.

### Code Of Conduct

This project ascribes to [contributor-covenant.org](http://contributor-covenant.org).

By participating in this project you agree to our [Code of Conduct](CODE_OF_CONDUCT.md).

### Maintainers

- Brent Lintner - [@brentlintner](http://github.com/brentlintner)

## Architecture

`sass-lint` provides a JSON CLI output that is currently used until an
in library solution is implemented.

- `bin` houses any shell based scripts
- `src` is es6+ syntax compiled with [babel](https://babeljs.io)
- `lib` generated js library

## Hacking

    cd vile-sass-lint
    npm install
    npm run dev
    npm test
