defmodule AnnoyingBot.Discord.ReplyMessageHandler do
  alias AnnoyingBot.Discord.ReplyMessageCommand

  def call(msg) do
    with :unlucky <- curse_by_lucky() do
      ReplyMessageCommand.call(msg)
    end
  end

  defp curse_by_lucky() do
    random_index = Enum.random(1..12)

    with true <- random_index <= 2 do
      :unlucky
      else _ -> :lucky
    end
  end
end
