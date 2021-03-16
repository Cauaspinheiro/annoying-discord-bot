defmodule AnnoyingBot.Discord.ReplyMessageHandler do
  alias AnnoyingBot.Users
  alias AnnoyingBot.Curses
  alias AnnoyingBot.User
  alias AnnoyingBot.Curse
  alias Nostrum.Api


  def call(msg) do
    discord_id = "<@!#{msg.author.id}>"

    IO.inspect(msg)

    with {:ok, user: user} <- get_author(discord_id),
    {:ok, curse} <- curse_by_lucky(user) do
      Api.create_message(msg.channel_id, curse)
    end
  end

  defp get_author(discord_id) do
    Users.Read.get_by_discord(discord_id)
  end

  defp curse_by_lucky(user) do
    random_index = Enum.random(0..10)

    with 0 <- rem(random_index, 2) do
      curse_user(user)
    end
  end

  defp curse_user(%User{discord_id: discord_id }) do
    {:ok, curse: %Curse{phrase: phrase}} = Curses.Read.get_random_curse("general")

    Curses.CurseUser.replace_phrase_with_user(phrase, discord_id)
  end
end
