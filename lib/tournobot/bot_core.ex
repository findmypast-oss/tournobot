defmodule Tournobot.BotCore do
  use Slack
  require Logger
  alias Tournobot.Message

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {Slack.Bot, :start_link, [__MODULE__, [], opts]},
      type: :worker,
      restart: :permanent,
      shutdown: 500
    }
  end

  def handle_connect(slack, state) do
    Logger.info "Connected as #{slack.me.name}"
    {:ok, state}
  end

  def handle_event(message = %{type: "message"}, slack, state) do
    IO.inspect message
    if (response = Message.process(message)) != nil,
      do: send_message(response, message.channel, slack)
    {:ok, state}
  end
  def handle_event(_, _, state), do: {:ok, state}

end
