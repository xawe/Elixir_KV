defmodule KV.Bucket do
  use Agent

  @doc """
  Inicialização de um Agent com conteudo vazio
  """
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Obtem um valor do bucket by Key
  """
  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key))
  end

  @doc """
  Bota um valor no bucket de acordo com a chave utilizada
  """
  def put(bucket, key, value) do
    Agent.update(bucket, &Map.put(&1, key, value))
  end


  @doc """
  Apaga a key informada do bucket, caso exista
  """
  def delete(bucket, key) do
      Agent.get_and_update(bucket, &Map.pop(&1, key))
  end
end
