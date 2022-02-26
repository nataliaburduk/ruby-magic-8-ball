require_relative 'fix_windows_encoding'
require_relative 'config'
require_relative 'magic_ball'

languages = LOCALIZATION_CONFIG.keys
puts "Default language is English, if you want to change - enter other language (#{languages.join(', ')})"

local = gets.chomp.to_sym

if local.empty?
  local = :en
elsif !languages.include?(local)
  puts 'We don\'t support this language'
  return
end

mb = MagicBall.new(local)

loop do
  mb.ask
  mb.prediction
  
  puts LOCALIZATION_CONFIG[local][:wanna_prediction?]
  one_more = gets.chomp
  
  case one_more.downcase 
  when *LOCALIZATION_CONFIG[local][:possible_yeses]
    sleep(2)
  when *LOCALIZATION_CONFIG[local][:possible_noes]
    puts LOCALIZATION_CONFIG[local][:goodbye]
    break
  else 
    puts LOCALIZATION_CONFIG[local][:see_you_later]
    break
  end
end
