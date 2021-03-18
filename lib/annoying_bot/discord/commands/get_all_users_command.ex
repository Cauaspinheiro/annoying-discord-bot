defmodule AnnoyingBot.Discord.GetAllUsersCommand do
  alias AnnoyingBot.{Users, User}
  alias Nostrum.Api

  def call(msg) do
    case get_all_users() do
      {:error, reason} -> Api.create_message(msg.channel_id, reason)
      {:ok, users} -> Api.create_message(msg.channel_id, users)
    end
  end

  defp get_all_users do
    with {:ok, users: users} <- Users.Read.all() do
      join_users(users)
      else {:error, _reason} -> "ERRO: NÃO ENCONTREI NENHUM USUÁRIO"
    end
  end

  defp join_users(users) do
    message = users
    |> Enum.map(fn value -> format_user(value) end)
    |> IO.inspect()
    |> Enum.join("\n")

    {:ok, message}
  end

  defp format_user(%User{
    discord_id: discord_id, inserted_at: inserted_at,
    id: id, name: name, created_by: created_by}) do

    date = Enum.join([inserted_at.day, inserted_at.month, inserted_at.year], "/")

    first_line = "#{discord_id} --- Criado por #{created_by}\n"
    info = "```Apelido: #{name} - Criado em: #{date} - ID: #{id}```"

    first_line <> info
  end
end
