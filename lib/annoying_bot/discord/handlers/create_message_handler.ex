defmodule AnnoyingBot.Discord.CreateMessageHandler do
  alias AnnoyingBot.Discord.CurseUserByCommand

  def call(msg) do
    list = String.split(msg.content, " ", trim: true)

    case String.downcase(Enum.at(list, 0)) do
      "!xingar" -> CurseUserByCommand.call(msg.channel_id, Enum.at(list, 1))
      _ -> :ignore
    end
  end
end
