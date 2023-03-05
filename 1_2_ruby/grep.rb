# Usage: ruby ./grep.rb PATTERN FILE_PATH

pattern = Regexp.new(ARGF.argv[0])
file_path = ARGF.argv[1]

file = File.open(file_path)
file.each_with_index do |line_text, line_number|
  if pattern =~ line_text
    puts "#{line_number+1}: #{line_text}"
  end
end
