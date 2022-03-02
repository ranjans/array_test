defmodule ArrayTest do
  @moduledoc """
  Documentation for `ArrayTest`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ArrayTest.hello()
      :world

  """
  def new(size) do
	:array.new(size)	
  end
  def from_list(list) do
	from_list_tl(list, :array.new) 
  end
  def from_list_tl([], acc), do: (IO.puts("in empty list"); acc)
  def from_list_tl(nl, acc) when is_list(nl) == false do 
	IO.puts("in non list #{inspect(nl)}")
			acc = :array.set(:array.size(acc), nl, acc)
			acc
  end


  def from_list_tl([h | t], acc) do

	IO.puts("in gen - h: #{inspect(h)}")
	IO.puts("in gen - t: #{inspect(t)}")

	hh=:array.new
	hh = :array.set(:array.size(hh), from_list(h), hh) 
	#hhh = :array.set(:array.size(hh), hh, hhh)
        IO.puts("in gen - hh: #{inspect(hh)}")
	from_list_tl(t, :array.set(:array.size(acc), hh, acc))
	#from_list_tl(t, :array.set(:array.size(acc), :array.set(:array.size(acc), from_list(h), acc), acc))
	#IO.puts("in gen - acc: #{inspect(acc)}")
	#from_list_tl(t, acc)
  end
end
