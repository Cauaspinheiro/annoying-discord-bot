defmodule AnnoyingBot.Discord.ReplyMessageCommand do
  alias AnnoyingBot.{Curses, User, Curse, Users}
  alias Nostrum.Api

  def call(msg) do
    discord_id = "<@!#{msg.author.id}>"

    with {:ok, user} <- get_author(discord_id), {:ok, curse} <- curse_user(user) do
      Api.create_message(msg.channel_id, curse)
    end
  end

  defp get_author(discord_id) do
    Users.Read.get_by_discord(discord_id)
  end

  defp curse_user(user: %User{discord_id: discord_id }) do
    {:ok, curse: %Curse{phrase: phrase}} = Curses.Read.get_random_curse("reply")

    Curses.CurseUser.replace_phrase_with_user(phrase, discord_id)
  end
end
