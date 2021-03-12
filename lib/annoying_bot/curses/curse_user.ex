defmodule AnnoyingBot.Curses.CurseUser do
  alias AnnoyingBot.{User, Curse}

  def by_id(%{"user_id" => user_id, "type" => type}) do
    with {:ok, user: %User{name: name}} <- AnnoyingBot.get_user_by_id(user_id),
      {:ok, curse: %Curse{phrase: phrase}} <- AnnoyingBot.get_random_curse(type) do
      replace_phrase_with_user(phrase, name)
    end
  end

  def by_id(_params) do
    {:error, "NOT ALL PARAMS ARE PROVIDED (user_id as param, type as query)"}
  end

  def by_discord(%{"ds_id" => ds_id, "type" => type}) do
    with {:ok, user: %User{}} <- AnnoyingBot.get_user_by_discord(ds_id),
      {:ok, curse: %Curse{phrase: phrase}} <- AnnoyingBot.get_random_curse(type) do
      replace_phrase_with_user(phrase, ds_id)
    end
  end

  def by_discord(_params) do
    {:error, "NOT ALL PARAMS ARE PROVIDED (ds_id as param, type as query)"}
  end

  def by_name(%{"name" => name, "type" => type}) do
    with {:ok, user: %User{discord_id: discord}} <- AnnoyingBot.get_user_by_name(name),
      {:ok, curse: %Curse{phrase: phrase}} <- AnnoyingBot.get_random_curse(type) do
      replace_phrase_with_user(phrase, discord)
    end
  end

   def by_name(_params) do
    {:error, "NOT ALL PARAMS ARE PROVIDED (name as param, type as query)"}
  end

  defp replace_phrase_with_user(phrase, replace_string) do
    message = Regex.replace(~r/{([a-z]+)?}/, phrase, fn -> replace_string end)

    {:ok, message}
  end
end
