defmodule Noaa.Service do
  @user_agent [ {"user_agent", "Elixir rylek90"}]
  @noaa_url Application.get_env(:noaa, :noaa_url)

  def fetch(code), do:
    code
    |> format_url
    |> HTTPoison.get(@user_agent)
    |> handle_response

  def format_url(code) do
    upper_code = code |> String.upcase
    "#{@noaa_url}#{upper_code}.xml"
  end

  def handle_response({:ok, %{status_code: 200, body: body}}), do:
    {:ok, Noaa.Parser.parse_response(body)}

  def handle_response({_, %{status_code: _, body: body}}), do:
    {:error, body}

end
