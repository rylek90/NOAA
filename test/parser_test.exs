defmodule ParserTest do
  use ExUnit.Case
  doctest Noaa.Parser

  import Noaa.Parser, only: [parse_response: 1 ]

  @test_data """
  <current_observation version="1.0"
   xmlns:xsd="http://www.w3.org/2001/XMLSchema"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xsi:noNamespaceSchemaLocation="http://www.weather.gov/view/current_observation.xsd">
  <weather>WEATHER</weather>
  <temperature_string>TEMPERATURE</temperature_string>
  <wind_string>WIND</wind_string>
  <observation_time>OBSERVATION_TIME</observation_time>
  <location>LOCATION</location>
  </current_observation>
  """

  test "should properly get data", do:
    assert parse_response(@test_data) == ['WEATHER', 'OBSERVATION_TIME', 'LOCATION', 'TEMPERATURE', 'WIND']
end
