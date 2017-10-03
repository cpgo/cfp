defmodule CfpWeb.Plugs.CurrentUser do

  @moduledoc """
  Handle the current user
  """

  def init(opts), do: opts

  def call(conn, _opts) do
    conn
  end
  
end
