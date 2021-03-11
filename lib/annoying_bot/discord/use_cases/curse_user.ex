defmodule AnnoyingBot.Discord.CurseUserByCommand do
  alias Nostrum.Api

  def call(channel_id, msg) do
    return_message = get_message(msg)

    Api.create_message(channel_id, return_message)
  end

  defp get_message(msg) do
    with "<@!" <- String.slice(msg, 0..2) do
      {:ok, message} = AnnoyingBot.curse_user(%{
        "user_id" => "688a49c5-57b1-49df-a84e-eb4c2b82b64b",
        "type" => "general"
      })
      message
      else _ -> "Ops... Você precisa passar um usuário válido"
    end
  end
end
