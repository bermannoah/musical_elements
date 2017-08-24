defmodule ID3Parser do
    
  @id3_tag_size 128

  def parse(file_path) do       
    read_file = File.read!(file_path)
    file_length = byte_size(read_file)
    music_data = file_length - @id3_tag_size
    << _ :: binary-size(music_data), id3_section :: binary >> = read_file
    id3_section
    
    # case File.read(file_path) do
    #     {:ok, binary} ->
    #       {title, artist, album, year, comment} = parse_binary(binary)
    #     IO.puts title
    #     mp3_tags = %{title: title,
    #                 artist: artist,
    #                 album: album,
    #                 year: year,
    #                 comment: comment}
    #     mp3_tags
    #   _ ->
    #     :musical_error
    # end
  end

    defp parse_id3(metadata) do
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

  def extract_id3(file) do
    metadata = parse(file)
    parse_id3(metadata)
  end

  def extract_id3_list(folder) do
    folder |> list |> Enum.map(&extract_id3/1)
  end

  def list(folder) do
    folder |> Path.join("**/*.mp3") |> Path.wildcard
  end



  #   def parse_binary(binary) when byte_size(binary) > @id3_tag_size do      
#     mp3_byte_size = (byte_size(binary) - 128)
#     << _ :: binary-size(mp3_byte_size), id3_tag :: binary >> = binary

#     <<  "TAG",
#         title   :: binary-size(30),
#         artist  :: binary-size(30),
#         album   :: binary-size(30),
#         year    :: binary-size(4),
#         comment :: binary-size(30),
#         _rest   :: binary >> = id3_tag

#     {title, artist, album, year, comment}
#   end

end