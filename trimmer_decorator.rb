require_relative 'decorator'

# This class represent the trimmer decorator
class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name[0, 10]
  end
end
