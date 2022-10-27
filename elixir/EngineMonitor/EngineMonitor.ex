defmodule EngineMonitor do 
  def latest(list) do 
    hd(list)
  end

  def new_reading(list, a) do 
    [a | list]
  end

  #------------------------------------MAX_READING------------------------------------------ 
  def max_reading([]), do: :empty_list_error

  def max_reading([head | tail]) do 
    max_reading(tail, head)
  end

  defp max_reading([], max) do 
    max
  end

  defp max_reading([head | tail], max) when head > max do 
    max_reading(tail, head)
  end

  defp max_reading([_ | tail], max) do 
    max_reading(tail, max)
  end

  #---------------------------------------RISING-------------------------------------------- 
  # example function guards
  def gt(a, b) when a > b, do: a
  def gt(a, b) when a < b, do: b

  # name: rising 
  # purpose: exported module function
  # param: takes a single list, pattern matched to [head | tail]
  # returns: count of number of rising values in a given list
  def rising([head | tail]) do 
    if head > hd(tail) do
      rising(tail, 1) # rise
    else  
      rising(tail, 0) # no rise
    end
  end

  # guard 1 - check if tail has elements, eg: tail = [800], length = 1
  defp rising([head | tail], count) when length(tail) > 0 do
    if head > hd(tail) do 
      rising(tail, count+1)
    else
      rising(tail, count)
    end
  end

  # guard 2 - check if tail has NO elements, eg: tail = [], length = 1,
  #           because - we must not call hd(tail) on an empty list
  defp rising([head | tail], count) when length(tail) == 0 do 
    count
  end

  #-----------------------------------DANGER------------------------------------------------ 
  def danger?([head | tail]) do 
    if length(tail) > 0 do 
      if abs(head - hd(tail)) > 50 do
        true
      else
        danger?(tail)
      end
    else
      false # base case, but cant early return, so it goes here. eg length(tail) == 0
    end
  end
end
