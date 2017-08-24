defmodule MusicalElements do
  @moduledoc """
  Documentation for MusicalElements.
  """

  @doc """
  Hello world.

  ## Examples
      iex> path_to_file = "path/to/file.mp3"
      iex> MusicalElements.get_id3_tags(path_to_file)
      :musical_error

  """

  def get_id3_tags(path_to_file) do
    if MundaneElements.get_file_type(path_to_file) == :mp3 do
      :hey
    else
      :musical_error
    end
  end
end