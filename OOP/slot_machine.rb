class SlotMachine
  ITEMS = %w[joker star bell seven cherry].reverse



  def initialize(reels)
    @reels = reels
  end

  attr_reader :reels

  def score
    if three_identicals?
      base_score_for(@reels.first) * 2
    elsif two_identicals_and_joker?
      base_score_for(@reels.sort[1])
    else
      0
    end
  end

  def play
    # @reels = @reels.map { ITEMS.sample }
    @reels = []
    3.times do
      @reels << ITEMS.sample
    end
  end

  def three_identicals?
    @reels.uniq.size == 1
  end

  def two_identicals_and_joker?
    @reels.uniq.size == 2 && @reels.any?('joker')
  end

  def base_score_for(item)
    5 * (1 + ITEMS.index(item))
  end
end

# p SlotMachine::ITEMS

joker = SlotMachine.new(['joker', 'joker', 'joker'])
puts joker.score == 50
# p joker.reels
# joker.play
# p joker.reels


puts SlotMachine.new(['bell', 'bell', 'bell']).score == 30
puts SlotMachine.new(['joker', 'joker', 'seven']).score == 25
puts SlotMachine.new(['seven', 'joker', 'seven']).score == 10
puts SlotMachine.new(['seven', 'joker', 'cherry']).score == 0
