defmodule AnnoyingBot.Discord.CreateMessageConsumer do
  use Nostrum.Consumer

  alias AnnoyingBot.Discord.{CreateMessageHandler, ReplyMessageHandler}

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    with true <- String.starts_with?(msg.content, "!") do
      CreateMessageHandler.call(msg)
    else _ -> ReplyMessageHandler.call(msg)
    end
  end

  # Default event handler, if you don't include this, your consumer WILL crash if
  # you don't have a method definition for each event type.
  def handle_event(_event) do
    :noop
  end
end
