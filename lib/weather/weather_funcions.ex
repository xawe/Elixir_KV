defmodule Weather.WeatherFunctions do

    defp get_endpoint(location) do
        "http://127.0.0.1:4000//api/take/#{location}"
    end

    def previsao_em(location) do
        result = get_endpoint(location)
        |> HTTPoison.get()
        |> parser_response

        case result do
            {ok, temp} ->
                "#{location}:#{temp} C"
                
            :error ->
                "#{location} not found"
        end
    end

    defp parser_response({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
        body
        |> JSON.decode!()
        |> compute_temperature
    end

    defp parser_response(_), do: :error

    defp compute_temperature(json) do
        try do
            temp = 
            json["main"]["temp"]
            |> kelvin_to_celsius

        {:ok, temp}
        rescue
        _ -> :error
        end
    end
       
    def kelvin_to_celsius(kelvin) do
        (kelvin - 273.15)
        |> Float.round(1)
    end
end