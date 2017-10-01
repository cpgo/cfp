defmodule CfpWeb.GlobalController do
  use CfpWeb, :controller

  plug :put_layout, "global.html"

  def index(conn, _params) do
    render(conn, "index.html")
  end
  
end
