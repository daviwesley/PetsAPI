defmodule Apiexample.Auth.Pipeline do
    use Guardian.Plug.Pipeline,
      otp_app: :Apiexample,
      module: Apiexample.Auth.Guardian,
      error_handler: Apiexample.Auth.ErrorHandler
  
    plug(Guardian.Plug.VerifyHeader)
    plug(Guardian.Plug.EnsureAuthenticated)
    plug(Guardian.Plug.LoadResource)
  end