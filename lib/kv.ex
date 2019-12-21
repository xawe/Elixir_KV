defmodule KV do
  @moduledoc """
  Módulo responsável pelo armazenamento de informações usando Key-Value.
  Os dados são persistidos em memória através de um processo dedicado 
  """

  
  @doc """
  KV.start_link/1 - Responsável por iniciar o processo
  """
  def start_link do
    Task.start_link(fn -> loop(%{}) end)
  end

  
  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send(caller, Map.get(map, key))
        loop(map)

      {:put, key, value} ->
        loop(Map.put(map, key, value))
    end
  end
end
