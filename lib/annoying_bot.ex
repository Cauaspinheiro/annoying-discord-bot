defmodule AnnoyingBot do
  defdelegate create_user(params), to: AnnoyingBot.Users.Create, as: :call
end
