# Problem statement:
# Write a simple grep that will print the lines of a file having any occurrences of a phrase
# anywhere in that line. You will need to do a simple regular expression match and read lines from a
# file. (This is surprisingly simple in Ruby.) If you want, include line numbers.

# Usage: ruby ./grep.rb PATTERN FILE_PATH

pattern = Regexp.new(ARGF.argv[0])
file_path = ARGF.argv[1]

file = File.open(file_path)
file.each_with_index do |line_text, line_number|
  if pattern =~ line_text
    puts "#{line_number+1}: #{line_text}"
  end
end
