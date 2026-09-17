# homebrew-ami

Homebrew tap for [ami](https://github.com/Masterminde45/ami) — an installer that fetches
packages from both Arch Linux's official pacman repos and the AUR.

## Install

```
brew tap Masterminde45/ami
brew install ami
```

## Note

ami drives `pacman`, `makepkg`, and the AUR directly. Installing it via Homebrew gets you
the `ami` command itself; the actual install/search/clean commands still need a system
that has pacman and the rest of the Arch toolchain — this tap does not add that.
