class Bottles
  def verse(count)
    <<~EOBOTTLES
#{bottles(count, capitalize: true)} of beer on the wall, #{bottles(count)} of beer.
#{action(count)}
EOBOTTLES
  end

  def verses(start, finish)
    start
      .downto(finish)
      .map { |count| verse(count) }
      .join("\n")
  end

  def song
    verses(99, 0)
  end

  private

  def bottles(count, capitalize: false)
    case count
    when 1
      "1 bottle"
    when 0
      "no more bottles"
        .tap { |str| str.capitalize! if capitalize }
    else
      "#{count} bottles"
    end
  end

  def action(count)
    if count == 0
      "Go to the store and buy some more, 99 bottles of beer on the wall."
    else
      <<~ACTION
        Take #{article(count)} down and pass it around, #{bottles(count-1)} of beer on the wall.
      ACTION
    end.chomp
  end

  def article(count)
    case count
    when 1
      "it"
    else
      "one"
    end
  end
end
