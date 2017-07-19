defmodule Noaa.CLI do

  def run, do: main(["kdto"])
  
  def main(argv), do:
    argv
    |> parse_args
    |> process

  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [help: :boolean],
                        aliases: [h: :help])

    case parse do
      { [help: true], _, _ } -> :help
      { _, [ code ], _} -> code
      _ -> :help
    end
  end

  defp process(:help) do
    IO.puts """
      usage noaa <code>
    """
    System.halt(0)
  end

  defp process(code) do
    Noaa.Service.fetch(code)
    |> decode_response
    |> Noaa.TableFormatter.print_table_for_columns(["weather", "observation_time", "location", "temperature_string", "wind_string"])
  end

  defp decode_response({:ok, body}), do: body
  defp decode_response({:error, error}) do
    IO.puts "Error fetching from NOAA"
    System.halt(2)
  end

end
