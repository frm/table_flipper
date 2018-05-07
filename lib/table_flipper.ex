defmodule TableFlipper do
  alias Logger.Backends.Console

  @table_flip "(╯°□°）╯︵ ┻━┻: "
  @behaviour :gen_event

  defdelegate handle_info(msg, state), to: Console
  defdelegate handle_call(msg, state), to: Console

  def init(TableFlipper) do
    Console.init(:console)
  end

  def handle_event({_level, gl, {Logger, _, _, _}}, state)
      when node(gl) != node() do
    {:ok, state}
  end

  def handle_event({:error, group_leader, {Logger, msg, timestamp, metadata}}, state) do
    flipped_msg = add_table_flip(msg)

    Console.handle_event(
      {:error, group_leader, {Logger, flipped_msg, timestamp, metadata}},
      state
    )
  end

  def handle_event({:log, group_leader, {Logger, msg, timestamp, metadata}}, state) do
    flipped_msg = add_table_flip(msg)

    Console.handle_event(
      {:error, group_leader, {Logger, flipped_msg, timestamp, metadata}},
      state
    )
  end

  def handle_event(event, state) do
    Console.handle_event(event, state)
  end

  defp add_table_flip(msg) when is_list(msg) do
    [@table_flip | msg]
  end

  defp add_table_flip(msg) when is_binary(msg) do
    @table_flip <> msg
  end
end
