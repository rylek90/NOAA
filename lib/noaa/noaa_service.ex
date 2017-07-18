defmodule Noaa.Service do
  @user_agent [ {"user_agent", "Elixir rylek90"}]
  @noaa_url "http://w1.weather.gov/xml/current_obs/"

  def fetch(code), do:
    code
    |> format_url
    |> HTTPoison.get(@user_agent)
    |> handle_response

  defp format_url(code) do
    upper_code = code |> String.capitalize
    url = "#{@noaa_url}#{upper_code}.xml"
  end

  def handle_response({:ok, %{status_code: 200, body: body}}), do:
    {:ok, body}

  def handle_response({_, %{status_code: _, body: body}}), do:
    {:error, body}

end
