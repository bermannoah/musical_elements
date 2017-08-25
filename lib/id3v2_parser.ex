defmodule MusicalElements.ID3V2Parser do

  def extract_id3_v2(file_path) do
    read_file = File.read!(file_path)
    tag_frames = ID3v2.frames(read_file)
    parse_id3_v2(tag_frames)
  end

  def parse_id3_v2(tag_frames) do
    # album_cover returns an album cover if there is one
    %{
      title: tag_frames["TIT2"],
      artist: tag_frames["TPE1"],
      album: tag_frames["TALB"],
      album_cover: tag_frames["APIC"]
    }
  end

end
