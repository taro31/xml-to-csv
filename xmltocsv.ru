require 'rexml/document'
require 'csv'

# xml = <<-EOS
# ここにXMLファイルコピペでも動く
# EOS
# doc = REXML::Document.new(xml)

puts "拡張子を除くファイル名を入力"
filename = gets.chomp

doc = REXML::Document.new(File.new(filename + ".xml"))

array = []
doc.elements.each('root/text/sentence') do |element|
    # array << element.text.gsub("<_ParagraphReturn />", "\n")
    array << element.text
end

csv_data = array.each_slice(4).to_a

CSV.open(filename + ".csv","wb") do |csv|
  csv_data.each do |csvArray|
    csv << csvArray
  end
end