defmodule CfpWeb.Plugs.EnsureNotAuthenticated do

  @moduledoc """
  Ensure that the user is not authenticated
  """
  
  import Plug.Conn
  def init(opts), do: opts

  def call(conn, _opts) do
    conn
  end
  
end
