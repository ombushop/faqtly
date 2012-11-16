# coding: utf-8

module Permalinker

  # Generates a permalink getting rid of unwanted 
  # special characters.
  # 
  # @param [String] Unescaped string
  # @return [String] Clean and escaped string
  def generate_permalink(string = '')
    return '' if string.nil?

    s = String.new(remove_accents(string))

    s.gsub!(/[^\w\d\s]+/,'') # Remove weird chars
    s.gsub!(/[\+\s]/,'-')
    s.downcase!        
    escape_for_url(s)
  end

  private

  ACCENTS_MAPPING = {
    'E' => [200,201,202,203],
    'e' => [232,233,234,235],
    'A' => [192,193,194,195,196,197],
    'a' => [224,225,226,227,228,229,230],
    'C' => [199],
    'c' => [231],
    'O' => [210,211,212,213,214,216],
    'o' => [242,243,244,245,246,248],
    'I' => [204,205,206,207],
    'i' => [236,237,238,239],
    'U' => [217,218,219,220],
    'u' => [249,250,251,252],
    'N' => [209],
    'n' => [241],
    'Y' => [221],
    'y' => [253,255],
    'AE' => [306],
    'ae' => [346],
    'OE' => [188],
    'oe' => [189]}

  # Converts a string into a URL friendly string.
  # 
  # @param [String] Unescaped input
  # @return [String] Escaped URL
  def escape_for_url(string = '')
    result = Rack::Utils.escape(string).gsub(/\+/,'-')
  end

  # Removes accents from the [String]. 
  # Uses String::ACCENTS_MAPPING as the source map.
  # 
  # @param [String] canción
  # @return [String] cancion
  def remove_accents(string)    

    ACCENTS_MAPPING.each {|letter,accents|
      packed = accents.pack('U*')
      rxp = Regexp.new("[#{packed}]", nil)
      string.gsub!(rxp, letter)
    }
    
    string
  end

end
