defmodule CliTest do
  use ExUnit.Case
  doctest Noaa.CLI

  import Noaa.CLI, only: [parse_args: 1 ]

  test ":help returned by option parsing with -h, --help and no options " do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
    assert parse_args([]) == :help
  end
end
