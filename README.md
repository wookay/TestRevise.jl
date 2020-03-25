```
julia> using Revise

julia> using TestRevise
[ Info: Precompiling TestRevise [1b923e1e-07ac-4ef0-b162-28ecf01a9330]

julia> TestRevise.greet()
Hello World!
```

* edit `TestRevise.greet`

```
julia> TestRevise.greet()
Hello World!2
```
