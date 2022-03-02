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

  #def from_list(l) do
	#from_list_tl(l, :array.new)
  #end

  #def from_list_tl(l, _arr) when l == [], do: (IO.puts("In empty.."); nil)
  def from_list(l) when l == [], do: (IO.puts("In empty.."); nil)

  #def from_list_tl([h | _t] = l, _arr) when l != [] and is_list(h) == false do 
  def from_list([h | _t] = l) when l != [] and is_list(h) == false do 
		
	IO.puts("In bottom list .. #{inspect(l)}")
	ret = :array.from_list(l, :array.new)
	IO.puts("leaving bottom list .. #{inspect(ret)}")
	ret
  end

  def from_list([h | t] = l) when l != [] and is_list(l) == true do
  #def from_list_tl([h | t] = l, arr) when l != [] and is_list(l) == true do
	arr = :array.new
	IO.puts("In call..")
	IO.puts("list: #{inspect(l)}")
	IO.puts("h: #{inspect(h)}")
	IO.puts("t: #{inspect(t)}")
	arr_sz = :array.size(arr)
	IO.puts("arr_size: #{inspect(arr_sz)}")
	tarr = :array.set(:array.size(arr), from_list(t), :array.new)
	arr = :array.set(arr_sz, from_list(h), arr)
	arr = :array.set(arr_sz, tarr, arr)
	#arr = :array.set(arr_sz, from_list(h), :array.set(:array.size(arr), from_list(t), arr))
	#arr = :array.set(arr_sz, from_list(h), arr )
	arr_sz = :array.size(arr)
	#arr = :array.set(arr_sz, from_list(t), arr)
	#:array.set(0,from_list(h), from_list(t))
	IO.puts("arr: #{inspect(arr)}")
	IO.puts("out: ")
	arr
  end 

  def plist(l) when l == [], do: nil
  def plist([nl | t] = l) when is_list(nl) == false, do: [Enum.max(l)]
  def plist(l) do
	[h |t] = l
	[ plist(h),
 	  plist(t)]
  end
end
