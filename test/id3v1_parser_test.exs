defmodule ID3V1ParserTest do
  use ExUnit.Case

  @mp3_fixture Path.join(__DIR__, "fixtures/fixture.mp3")
  @id3v1 Path.join(__DIR__, "fixtures/id3v1.mp3")

  test ".extract_id3 raises musical_error if passed a path it can't read" do
    catch_error(ID3V1Parser.extract_id3('/fake/file/path/hey.mp3'))
  end

  test ".extract_id3 returns a map if passed an mp3" do
    result = ID3V1Parser.extract_id3(@mp3_fixture)
    assert is_map(result)
  end

  test ".extract_id3 returns a title if passed an mp3" do
    result = ID3V1Parser.extract_id3(@id3v1)
    assert result.title == "[Polka in G]"
  end


end
