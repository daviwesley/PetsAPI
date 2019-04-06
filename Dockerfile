FROM elixir:latest

RUN apt update
RUN apt install postgresql postgresql-contrib -y
RUN mix local.hex --force
RUN mix archive.install hex phx_new 1.4.3 
RUN mix local.rebar --force

EXPOSE 5000
ENV PORT=5000 
#ENV MIX_ENV=prod
#ENV SECRET_KEY_BASE=kvmvc3qqL6jzkhpQgucfMPmU3SaXMLCdcjQV0mzJeE5hPdH5F3McJRc0wym7KLQB

# Cache elixir deps
ADD mix.exs mix.lock ./
RUN mix do deps.get, deps.compile

#USER default

ADD . .

CMD ["mix", "phx.server"]
