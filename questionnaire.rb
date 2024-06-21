require "pstore" # https://github.com/ruby/pstore

STORE_NAME = "tendable.pstore"
@store = PStore.new(STORE_NAME)

QUESTIONS = {
  "q1" => "Can you code in Ruby?",
  "q2" => "Can you code in JavaScript?",
  "q3" => "Can you code in Swift?",
  "q4" => "Can you code in Java?",
  "q5" => "Can you code in C#?"
}.freeze

# TODO: FULLY IMPLEMENT
def do_prompt
  answers = []
  QUESTIONS.each_value do |question|
    print "#{question} (Yes/No): "
    ans = gets.chomp.strip.downcase
    until %w[yes no y n].include?(ans)
      print "Invalid input. Please answer 'Yes' or 'No': "
      ans = gets.chomp.strip.downcase
    end
    answers << (ans == 'yes' || ans == 'y' ? 'yes' : 'no')
  end
  store_answers(answers)
end

# Storing Answers
def store_answers(answers)
  @store.transaction do
    @store[:surveys] ||= []
    @store[:surveys] << answers
  end
end

# Calculating the Rating
def calculate_rating(answers)
  yes_count = answers.count('yes')
  rating = (100 * yes_count / QUESTIONS.count)
end

def do_report
  # TODO: IMPLEMENT
@store.transaction do
    surveys = @store[:surveys] || []
    return puts "No surveys found." if surveys.empty?

    current_rating = calculate_rating(surveys.last)
    average_rating = (surveys.map { |answers| calculate_rating(answers) }.sum / surveys.size)

    puts "Current rating: #{current_rating}%"
    puts "Average rating over all runs: #{average_rating}%"
  end
end

do_prompt
do_report
