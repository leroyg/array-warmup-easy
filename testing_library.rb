require "faraday"
def colorize(color_code, string)
  puts "\e[#{color_code}m#{string}\e[0m"
end

def red(string)
  red_color_code = 31
  colorize(red_color_code, string)
end

def green(string)
  green_color_code = 32
  colorize(green_color_code, string)
end

def check(method_to_check, returned_value, expected_value)
  if returned_value == expected_value
    green("Awesome! #{method_to_check} works")
    "passed"
  else
    red("#{method_to_check} doesn't work yet: Expected #{expected_value}, got #{returned_value}\n")
    "failed"
  end
end

def send_results(results)
  conn = Faraday.new(:url => 'http://localhost:3000') do |faraday|
    faraday.request  :url_encoded
    faraday.adapter  Faraday.default_adapter
  end

  counts = Hash.new 0

  results.each do |result|
    counts[result] += 1
  end

  name = File.open(".name").read

  conn.post '/submissions', { :user => name, passed: counts["passed"], failed: counts["failed"], exercise: "array-warmup-easy" }
end
