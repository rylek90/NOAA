defmodule Noaa.CLI do

  def main(argv), do:
    argv
    |> parse_args
    |> process

  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [help: :boolean],
                        aliases: [h: :help])

    case parse do
      { [help: true], _, _ } -> :help
      _ -> :help
    end
  end

  defp process(:help) do
    IO.puts """
      usage noaa <code>
    """
    System.halt(0)
  end
end
