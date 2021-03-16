defmodule AnnoyingBot.Discord.ReplyMessageCommand do
  alias AnnoyingBot.{Curses, User, Curse}
  alias Nostrum.Api


  def call(msg, user) do
    with {:ok, curse} <- curse_by_lucky(user) do
      Api.create_message(msg.channel_id, curse)
    end
  end

  defp curse_by_lucky(user) do
    random_index = Enum.random(0..12)

    with 0 <- rem(random_index, 2) do
      curse_user(user)
    end
  end

  defp curse_user(%User{discord_id: discord_id }) do
    {:ok, curse: %Curse{phrase: phrase}} = Curses.Read.get_random_curse("reply")

    Curses.CurseUser.replace_phrase_with_user(phrase, discord_id)
  end
end
