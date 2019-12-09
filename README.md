# KV

Criado modulo Bucket para armazenamento de valores usando Agent.

Teste para as funções já ok -- Testes alterados para uso de callback

Incluisão de funcionalidade de previsão do tempo em serviço http://127.0.0.1:4000//api/take/#{location}, 
que verifica a previsão do local indicado e armazena os dados na tabela weather para histórico.
A implementação do serviço está no projeto Busi_api

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `kv` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:kv, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/kv](https://hexdocs.pm/kv).

