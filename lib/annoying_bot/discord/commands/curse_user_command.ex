defmodule AnnoyingBot.Discord.CurseUserCommand do
  alias Nostrum.Api

  alias AnnoyingBot.Curses.CurseUser

  def call(msg) do
    return_message = msg.content
      |> String.split(" ")
      |> Enum.filter(fn value -> value != "" end)
      |> Enum.at(1)
      |> get_message()

    Api.create_message(msg.channel_id, return_message)
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
