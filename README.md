# Table Flipper (╯°□°）╯︵ ┻━┻

TableFlipper is a useless package that prepends a table flip to Elixir
error logs.

Inspired by [iridakos/table_flipper](https://github.com/iridakos/table_flipper).

## Installation

Add this to your `mix.exs`:

```elixir
def deps do
  [
    {:table_flipper, "~> 0.1.0"}
  ]
end
```

Afterwards update your `config/config.exs` file:

```elixir
configure :logger,
  backends: [TableFlipper]
```

**The table flip is only added for `:error` level logs.**

## Configuration

TableFlipper passes everything down to the default `:console` logger. So you can
just configure the console logger like you normally would. For example:

```elixir
config :logger, :console,
  format: "\n$time $metadata[$level] $message\n"
```

will output the following:

```elixir
iex> Logger.error fn -> "heeeeeyyyyy macarena!" end

12:09:16.179 [error] (╯°□°）╯︵ ┻━┻: heeeeeyyyyy macarena!

iex> Logger.info fn -> "nvm i don't like macarena" end

12:09:20.040 [info] nvm i don't like macarena
```

## wait a minute can't I just configure the logger?

Yep. I told you this was useless.

If you want to add the table flip to every level add the following to the
`config/config.exs` file:

```elixir
config :logger, :console,
  format: "\n(╯°□°）╯︵ ┻━┻: $time $metadata[$level] $levelpad$message\n"
```
 and you don't even need this package! If you just want to add it to error,
 though, you're probably better off using this. I don't know why, but I don't
 judge.

## this is so useless I actually want to help

All contributions are welcome! Even if they are a PR to delete everything and
end this nonsense.

1. Fork it (https://github.com/fribmendes/table_flipper/fork)
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

Feel free to make suggestions as well and to [open an
issue](https://github.com/fribmendes/table_flipper/issues/new) if you found some of
them bugs.
