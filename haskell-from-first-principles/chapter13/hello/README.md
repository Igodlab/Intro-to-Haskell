# hello

Mini book-project for the [Haskell Book](https://haskellbook.com/)

# notes

In pg. 755 we run 


```shell
$ stack build
$ stack setup
$ stack ghci
```

But it is not working for me. Perhaps it is the versioning of my `hello.cabal` file, where `Cabal-version >= 1.10` and the `build-depends: base >= 4.7 && <5` which I've changed to the ones shown below

```haskell
-- hello.cabal
Cabal-Version:       >= 3.6.2
⠇
executable hello
  ⠇
  build-depends:       base >= 8.10.4

```



