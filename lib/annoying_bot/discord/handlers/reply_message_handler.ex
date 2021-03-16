defmodule AnnoyingBot.Discord.ReplyMessageHandler do
  alias AnnoyingBot.Discord.{ReplyMessageCommand}
  alias AnnoyingBot.Users

  def call(msg) do
    discord_id = "<@!#{msg.author.id}>"

    with {:ok, user: user} <- get_author(discord_id) do
      ReplyMessageCommand.call(msg, user)
    end
  end

  defp get_author(discord_id) do
    Users.Read.get_by_discord(discord_id)
  end
end
