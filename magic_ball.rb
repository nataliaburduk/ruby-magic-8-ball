class MagicBall 
  attr_reader :local

  def initialize(local)
    @local = local
    puts LOCALIZATION_CONFIG[local][:greetings].sample
  end

  def ask
    puts LOCALIZATION_CONFIG[local][:your_question?]
    gets
  end

  def prediction
    puts LOCALIZATION_CONFIG[local][:thoughts].sample
    sleep(thought_speed)
    puts LOCALIZATION_CONFIG[local][:possible_answers].sample
  end

  private

  def thought_speed
    (1..3).to_a.sample
  end
end
