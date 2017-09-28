defmodule CfpWeb.PageController do
  use CfpWeb, :controller

  plug :put_layout, "public.html"

  def index(conn, _params) do
    render conn, "index.html"
  end


  def slack(conn, _params) do
    render conn, "slack.html"
  end

  
end
