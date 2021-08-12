defmodule Free_Fall.Game.Shape do

  def new(:o) do
     [{2, 2}, {3, 2},
      {2, 3}, {3, 3}]
  end

  def new(:i) do
      [{2, 1},
       {2, 2},
       {2, 3},
       {2, 4}]
  end

  def new(:t) do
      [{2, 2}, {3, 2}, {4, 2},
               {3, 3}]
  end

  def new(:z) do
      [{2, 2}, {3, 2},
               {3, 3}, {4, 3}]
  end

  def new(:s) do
           [{2, 2}, {3, 2},
    {1, 3}, {2, 3}]
  end

  def new(:l) do
    [{2, 1},
     {2, 2},
     {2, 3},{3, 3}]
  end

  def new(:j) do
    [         {3, 1},
              {3, 2},
      {2, 3}, {3, 3}]
  end

end
