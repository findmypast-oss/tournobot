defmodule Tournobot.Message do
  @type message :: %{type: binary, ts: binary, user: binary, text: binary}

  def process(%{text: "tournobot " <> args} = message) do
    args
    |> String.split(" ")
    |> execute(message)
  end
  def process(_), do: nil

  defp execute(["hi"], _), do: "hi there!"
end
