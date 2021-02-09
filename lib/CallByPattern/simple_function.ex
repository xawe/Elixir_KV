defmodule CallByPattern.Simple do
  @moduledoc """
  Este modulo possui alguns exemplos de chamadas a funções usando call by pattern
  Isto é: Funções com mesma aridade (quantidade de parametros) onde a definição de
  qual função será chamada está na estrutura do parametro
  """


  @doc """
  Retorna mensagem para Bob sempre que o parametro for :bob
  Retorna mensagem para Mary sempre que o parametro for :mary
  Retorna mensagem para o nome definido
     sempre que o parametro for uma tupla contendo o atom :ok , e uma variavel de nome

  Retorna mensagem para o nome definido
     sempre que o parametro for uma tupla contendo o atom :fail , e uma variavel de nome

  Caso a entrada seja uma tupla cotendo o atom :multi, retorna todos os nomes
  da variavel lista caso seja do tipo List.
  Caso não seja uma lista, uma mensagem default será exibida
  """
  def hello(:bob), do: "Hi BOB"
  def hello(:mary), do: "Hellooooooo Mary"

  def hello({:ok, name}) do
    "Hi there, #{name}"
  end

  def hello({:fail, name}) do
    "Whats wrong , #{name}"
  end

  def hello({:multi, lista}) do

    if is_list(lista) do
      Enum.each(lista, fn(x) -> IO.puts (x) end)
    else
      IO.puts("Lista nao contem dados")
    end
  end

  @doc """
  Teste da função Hello
  """
  @spec some(String.t()) :: Integer.t()
  def some(str) do
    IO.puts str
    1
  end

end
