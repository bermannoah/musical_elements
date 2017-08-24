defmodule ID3ParserTest do
  use ExUnit.Case

  @mp3_fixture Path.join(__DIR__, "fixtures/fixture.mp3")
  @full_of_data_fixture Path.join(__DIR__, "fixtures/full_of_data.mp3")

  test ".get_id3_tags raises musical_error if passed a path it can't read" do
    ID3Parser.parse('/fake/file/path/hey.mp3')
    assert_receive(failure_message)
end

  test ".get_id3_tags returns a map if passed an mp3" do
    result = ID3Parser.parse(@mp3_fixture)
    assert is_map(result)
  end

  test ".get_id3_tags returns a title if passed an mp3" do
    result = ID3Parser.parse(@full_of_data_fixture)
    IO.puts result
    assert result.title == "hey"
  end


end