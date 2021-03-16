defmodule AnnoyingBot.Discord.ReplyMessageHandler do
  alias AnnoyingBot.Discord.ReplyMessageCommand

  def call(msg) do
    with :ok <- curse_by_lucky() do
      ReplyMessageCommand.call(msg)
    end
  end

  defp curse_by_lucky() do
    random_index = Enum.random(0..12)

    with 0 <- rem(random_index, 2) do
      :ok
      else _ -> :lucky
    end
  end
end
