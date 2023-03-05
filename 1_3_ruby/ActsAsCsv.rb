module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    include Enumerable

    attr_accessor :headers, :contents

    def initialize(directory_path=nil)
      read(directory_path)
    end

    def each
      @contents.each do |row|
        yield CsvRow.new(row, @headers)
      end
    end

    private

    def read(directory_path=nil)
      @headers = []
      @contents = []

      file_path = "#{self.class.to_s.downcase}.csv"
      file_path = File.join(directory_path, file_path) unless directory_path.nil?

      file = File.open(file_path)
      @headers = split_text_line(file.gets)
      file.each { |line_text| @contents.push(split_text_line(line_text)) }
    end

    def split_text_line(line)
      line.chomp.split(',')
    end
  end
end

class CsvRow
  attr_accessor :row, :headers

  def initialize(row, headers)
    @row = row
    @headers = headers
  end

  def method_missing(method_id)
    @row[@headers.index(method_id.to_s)]
  end

  def respond_to_missing?(method_id)
    !@headers.index(method_id.to_s).nil?
  end
end
