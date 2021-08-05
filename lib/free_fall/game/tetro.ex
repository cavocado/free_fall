defmodule Tetro do
  defstruct [shape: :l, position: {5,1}, rotation: 0] 

  def new do 
    %__MODULE__{}
  end
  
  def new(shape) do
    %__MODULE__{shape: shape}    
  end

end
