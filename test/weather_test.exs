defmodule Weather.WeatherFunctionsTest do
    use ExUnit.Case

    test "Test a unknow location" do
        location = "asdasd"
        assert Weather.WeatherFunctions.previsao_em(location) == "#{location} not found" 
    end

    test "Test a ok responde" do
        location  = "louveira"
        assert Weather.WeatherFunctions.previsao_em(location) != "#{location} not found" 
    end

    test "Validate if the Kelvin to Celsius conversion is ok" do
        temp = 300
        assert Weather.WeatherFunctions.kelvin_to_celsius(temp) == 26.9
    end
end