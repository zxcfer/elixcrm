defmodule CrmWeb.Router do
  use CrmWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {CrmWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CrmWeb do
    pipe_through :browser

    get "/", PageController, :home

    live "/countries", CountryLive.Index, :index
    live "/countries/new", CountryLive.Index, :new
    live "/countries/:id/edit", CountryLive.Index, :edit

    live "/countries/:id", CountryLive.Show, :show
    live "/countries/:id/show/edit", CountryLive.Show, :edit

    live "/companies", CompanyLive.Index, :index
    live "/companies/new", CompanyLive.Index, :new
    live "/companies/:id/edit", CompanyLive.Index, :edit

    live "/companies/:id", CompanyLive.Show, :show
    live "/companies/:id/show/edit", CompanyLive.Show, :edit

    live "/contacts", ContactLive.Index, :index
    live "/contacts/new", ContactLive.Index, :new
    live "/contacts/:id/edit", ContactLive.Index, :edit

    live "/contacts/:id", ContactLive.Show, :show
    live "/contacts/:id/show/edit", ContactLive.Show, :edit

    live "/contracts", ContractLive.Index, :index
    live "/contracts/new", ContractLive.Index, :new
    live "/contracts/:id/edit", ContractLive.Index, :edit

    live "/contracts/:id", ContractLive.Show, :show
    live "/contracts/:id/show/edit", ContractLive.Show, :edit

    live "/devices", DeviceLive.Index, :index
    live "/devices/new", DeviceLive.Index, :new
    live "/devices/:id/edit", DeviceLive.Index, :edit

    live "/devices/:id", DeviceLive.Show, :show
    live "/devices/:id/show/edit", DeviceLive.Show, :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", CrmWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:crm, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: CrmWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
