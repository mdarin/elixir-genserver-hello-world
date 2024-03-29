defmodule Gs do
  use GenServer

  @name __MODULE__ 

  @moduledoc """
  Documentation for Gs.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Gs.hello()
      :world

  """
  def hello do
    :world
  end

  ## API

  def start_link(opts \\ []) do
    IO.puts "starting..."
    IO.puts @name
    GenServer.start_link(@name, :ok, [name: @name] ++ opts)
  end

  def stop(pid) do
    IO.puts "stopping..."
    IO.puts @name
    GenServer.cast(@name, :stop)
  end

  def hello_async() do
    GenServer.cast(@name, :hello) 
  end

  def wazap_async() do
    GenServer.cast(@name, :wazap)
  end

  def hello_sync() do
    GenServer.call(@name, :hello, 5000) 
  end

  ## Callbacks

  def init(:ok) do
    {:ok,%{}}
  end

  def terminate(reason, state) do
    # We could write to a file, database etc
    IO.puts "server terminated because of #{inspect reason} #{inspect state}"
    :ok
  end


  # async

  def handle_cast(:hello = msg, state) do
    IO.puts "HELLO THERE!"
    {:noreply, state}
  end

  def handle_cast(:wazap = msg, state) do
    IO.puts "What's up!"
    {:noreply, state}
  end

  def handle_cast(:stop, state) do
    {:stop,:normal,state}
  end


  # sync

  def handle_call(:hello = msg, _from, state) do
    {:reply, "HELLO THERE!", state}
  end


  # info

  # to send an info messgage try
  #
  # {:ok,pid} = Gs.start_link
  # send pid, "It's raining men"
  #

  def handle_info(msg, state) do
    IO.puts "received #{inspect msg}"
    {:noreply, state}
  end


  ## Internals
  


end
