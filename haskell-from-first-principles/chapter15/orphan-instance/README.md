### Orphan Instance and duplicated instances definitions

See pg. 919 

Starts with a quick compilation and built of Monoidal instances for ListyInstances.hs into the `*.o` and `*.hi` files. This is accomplished with 

```shell
$ ghc I. --make ListyInstances.hs
```

and is a quick alternative to Cabal & Stack for compilation of a single module.

### Safety practices when dealing with Orphan Instances

- 1. You defined the type but not the typeclass? Put the in-stance in the same module as the type so that the type cannot be imported without its instances.   
- 2. You defined the typeclass but not the type? Put the in- stance in the same module as the typeclass definition so that the typeclass cannot be imported without its in- stances.   
- 3. Neither the type nor the typeclass are yours? Define your own newtype wrapping the original type and now you’ve got a type that “belongs” to you for which you can rightly define typeclass instances. There are means of making this less annoying which we’ll discuss later.   
