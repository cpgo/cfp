defmodule CfpWeb.PageController do
  use CfpWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
