defmodule AnnoyingBot.Discord.CurseUserByCommand do
  alias Nostrum.Api

  alias AnnoyingBot.Curses.CurseUser

  def call(channel_id, msg) do
    return_message = get_message(msg)

    Api.create_message(channel_id, return_message)
  end

  defp get_message(msg) do
    case String.slice(msg, 0..2) do
      "<@!" -> curse_by_discord(msg)
      "" -> "Ops... Você precisa marcar um usuário ou o apelido dele"
      _ -> curse_by_name(msg)
    end
  end

  defp curse_by_discord(discord) do
    {:ok, message} = CurseUser.by_discord(%{
        "ds_id" => discord,
        "type" => "general"
      })
    message
  end

  defp curse_by_name(name) do
    params = %{"name" => name, "type" => "general"}

    case CurseUser.by_name(params) do
      {:ok, message} -> message
      {:error, reason} -> reason
    end
  end
end
