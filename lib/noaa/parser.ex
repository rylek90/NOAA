defmodule Noaa.Parser do

  import SweetXml

  def parse_response(str), do:
    parse_response(str, ["weather", "observation_time", "location", "temperature_string", "wind_string"])
    |> Enum.reverse 

  defp parse_response(str, list), do: parse_response(str, list, [])
  defp parse_response(str, [], acc), do: acc
  defp parse_response(str, [path | tail], acc), do:
    parse_response(str, tail, [ parse_single_entry(str, path) | acc])

  defp parse_single_entry(str, path), do:
     str |> xpath(~x"//#{path}/text()")

end
