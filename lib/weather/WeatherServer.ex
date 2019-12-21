defmodule Weather.WeatherServer do
    
    use GenServer

    def start_link(state \\ []) do
        # you may want to register your server with `name: __MODULE__`
        # as a third argument to `start_link`
        GenServer.start_link(__MODULE__, state, name: __MODULE__)
        process_message("")
    end

    def init(state), do: {:ok, state}
    

    def process_message(location) do
        receive do
             {:get, key, caller} ->
                IO.inspect("Debugando")
                IO.inspect(location)
                Weather.WeatherFunction.previsao_em(location)
                # location
                # |>Weather.WeatherFunction.previsao_em
                # |>IO.inspect
            process_message(location)
        end
    end
end
