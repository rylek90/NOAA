defmodule NoaaServiceTest do
  use ExUnit.Case
  doctest Noaa.Service

  import Noaa.Service, only: [format_url: 1 ]

  test "url should be properly formatted", do:
    assert format_url("apud") == "http://w1.weather.gov/xml/current_obs/APUD.xml"
end
