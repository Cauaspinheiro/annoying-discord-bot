defmodule AnnoyingBot.Discord.Start do
  alias AnnoyingBot.Discord.Supervisor

  Supervisor.start_link()

  System.cmd("iex", [])
end
