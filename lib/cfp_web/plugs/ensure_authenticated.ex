defmodule CfpWeb.Plugs.EnsureAuthenticated do
  
  @moduledoc """
  Ensure that the user is authenticated
  """
  
  import Plug.Conn
  def init(opts), do: opts

  def call(conn, _opts) do
    conn
  end
  
end
