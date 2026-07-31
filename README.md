# Sumit189/homebrew-termissh

Homebrew tap for [TermiSSH](https://github.com/Sumit189/TermiSSH) — a terminal
manager for your `~/.ssh/config`.

```sh
brew tap Sumit189/termissh
brew install termissh
```

Homebrew 6 asks you to trust a third-party tap the first time. If it does:

```sh
brew trust sumit189/termissh
brew install termissh
```

Upgrade with `brew upgrade termissh`, or track `main` with
`brew install --HEAD termissh`.

## Releasing a new version

1. Tag and release TermiSSH itself.
2. Point the formula at the new tarball:

```sh
brew bump-formula-pr --no-fork --version=X.Y.Z Sumit189/termissh/termissh
```

or by hand — update `url` and `sha256` from
`curl -sL <tarball> | shasum -a 256`, then `brew audit --strict termissh`.
