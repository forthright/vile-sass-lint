# vile-sass-lint [![Circle CI](https://circleci.com/gh/brentlintner/vile-sass-lint.svg?style=svg&circle-token=00d3226575f038a2187cfab343423bd9fd3804ec)](https://circleci.com/gh/brentlintner/vile-sass-lint)

[![score-badge](https://vile.io/brentlintner/vile-sass-lint/badges/score?token=R3TLDSUV1RV839gt4icJ)](https://vile.io/brentlintner/vile-sass-lint) [![security-badge](https://vile.io/brentlintner/vile-sass-lint/badges/security?token=R3TLDSUV1RV839gt4icJ)](https://vile.io/brentlintner/vile-sass-lint) [![coverage-badge](https://vile.io/brentlintner/vile-sass-lint/badges/coverage?token=R3TLDSUV1RV839gt4icJ)](https://vile.io/brentlintner/vile-sass-lint) [![dependency-badge](https://vile.io/brentlintner/vile-sass-lint/badges/dependency?token=R3TLDSUV1RV839gt4icJ)](https://vile.io/brentlintner/vile-sass-lint)

A [vile](https://vile.io) plugin for [sass-lint](https://github.com/sasstools/sass-lint).

## Requirements

- [nodejs](http://nodejs.org)
- [npm](http://npmjs.org)

## Installation

    npm i --save-dev vile-sass-lint

## Config

The `sass-lint` cli should use a  `.sass-lint.yml` if it exists.

You can specify a custom path as well:

```yml
sass-lint:
  config: some/custom/sass-lint.yml
```

## Ignoring Files

You can ignore files in your `.sass-lint.yml` config file.

## Architecture

SassLint provides a JSON CLI output that is currently used until an
in library solution is implemented.

- `bin` houses any shell based scripts
- `src` is es6+ syntax compiled with [babel](https://babeljs.io)
- `lib` generated js library

## Hacking

    cd vile-sass-lint
    npm install
    npm run dev
    npm test
