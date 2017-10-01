defmodule CfpWeb.PublicController do
  use CfpWeb, :controller

  plug :put_layout, "public.html"

  def index(conn, _params) do
    render conn, "index.html"
  end

  
end
