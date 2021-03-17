defmodule AnnoyingBot.Discord.ReplyMessageHandler do
  alias AnnoyingBot.Discord.ReplyMessageCommand

  def call(msg) do
    with :unlucky <- curse_by_lucky() do
      ReplyMessageCommand.call(msg)
    end
  end

  defp curse_by_lucky() do
    :unlucky
  end
end
