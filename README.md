# vile-sass-lint [![Circle CI](https://circleci.com/gh/forthright/vile-sass-lint.svg?style=svg&circle-token=00d3226575f038a2187cfab343423bd9fd3804ec)](https://circleci.com/gh/forthright/vile-sass-lint)

[![score-badge](https://vile.io/api/v0/users/brentlintner/vile-sass-lint/badges/score?token=uFywUmzZfbg6UboLzn6R)](https://vile.io/~/brentlintner/vile-sass-lint) [![security-badge](https://vile.io/api/v0/users/brentlintner/vile-sass-lint/badges/security?token=uFywUmzZfbg6UboLzn6R)](https://vile.io/~/brentlintner/vile-sass-lint) [![coverage-badge](https://vile.io/api/v0/users/brentlintner/vile-sass-lint/badges/coverage?token=uFywUmzZfbg6UboLzn6R)](https://vile.io/~/brentlintner/vile-sass-lint) [![dependency-badge](https://vile.io/api/v0/users/brentlintner/vile-sass-lint/badges/dependency?token=uFywUmzZfbg6UboLzn6R)](https://vile.io/~/brentlintner/vile-sass-lint)

A [vile](https://vile.io) plugin for [sass-lint](https://github.com/sasstools/sass-lint).

## Requirements

- [nodejs](http://nodejs.org)
- [npm](http://npmjs.org)

## Installation

    npm i --save-dev sass-lint
    npm i --save-dev @forthright/vile
    npm i --save-dev @forthright/vile-sass-lint

## Config

The `sass-lint` cli should use a  `.sass-lint.yml` if it exists.

You can specify a custom path as well:

```yml
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
