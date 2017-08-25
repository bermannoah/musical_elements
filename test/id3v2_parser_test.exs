defmodule ID3V2ParserTest do
  use ExUnit.Case

  @mp3_fixture Path.join(__DIR__, "fixtures/fixture.mp3")
  @id3v2 Path.join(__DIR__, "fixtures/id3v2.mp3")

  test ".extract_id3_v2 raises musical_error if passed a path it can't read" do
    catch_error(ID3V2Parser.extract_id3_v2('/fake/file/path/hey.mp3'))
  end

  test ".extract_id3_v2 returns a map if passed an mp3" do
    result = ID3V2Parser.extract_id3_v2(@mp3_fixture)
    assert is_map(result)
  end

  test ".extract_id3_v2 returns a title if passed an mp3" do
    result = ID3V2Parser.extract_id3_v2(@id3v2)
    assert result.title == "my placid island"
  end

  test ".extract_id3_v2 returns all relevant data if passed an mp3" do
    result = ID3V2Parser.extract_id3_v2(@id3v2)
    assert result.title == "my placid island"
    assert result.artist == "tryad"
    assert result.album == "public domain"
  end


end
