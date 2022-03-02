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
  def from_list_tl([], acc), do: acc
  def from_list_tl(nl, acc) when is_list(nl) == false do 
	IO.puts("in non list #{inspect(nl)}")
			acc = :array.set(:array.size(acc), nl, acc)
			acc
  end


  def from_list_tl([h | t], acc) do

	IO.puts("in gen - h: #{inspect(h)}")
	IO.puts("in gen - t: #{inspect(t)}")
	from_list_tl(from_list(h), acc= :array.set(:array.size(acc), h, acc)) 
	IO.puts("in gen - acc: #{inspect(acc)}")
	from_list_tl(t, acc)
  end
end
