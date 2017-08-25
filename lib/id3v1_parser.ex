defmodule ID3V1Parser do

  @id3_tag_size 128

  def parse_id3_v1(file_path) do
    read_file = File.read!(file_path)
    file_length = byte_size(read_file)
    music_data = file_length - @id3_tag_size
    << _ :: binary-size(music_data), id3_section :: binary >> = read_file
    id3_section
  end

  defp parse_id3_v1_metadata(metadata) do
     << _ :: binary-size(3), title :: binary-size(30), artist :: binary-size(30), album :: binary-size(30), _ :: binary >> = metadata
     %{
        title: sanitize(title),
        artist: sanitize(artist),
        album: sanitize(album)
     }
  end

  defp sanitize(text) do
    not_zero = &(&1 != <<0>>)
    text |> String.graphemes |> Enum.filter(not_zero) |> to_string |> String.strip
  end

  def extract_id3_v1(file) do
    metadata = parse_id3_v1(file)
    parse_id3_v1_metadata(metadata)
  end

  def extract_id3_list(folder) do
    folder |> list |> Enum.map(&extract_id3_v1/1)
  end

  def list(folder) do
    folder |> Path.join("**/*.mp3") |> Path.wildcard
  end

end
