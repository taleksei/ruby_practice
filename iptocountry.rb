# Returns country from IP
# Example call: iptocountry.rb 1.2.3.4
# Result: Country: AU

module IpToCountry

  def self.find_country(ip, file_name)
    ip = ip[3] + (ip[2] * 256) + (ip[1] * 256**2) + (ip[0] * 256**3)
    puts search_in_file(ip, file_name)
  end

  def self.search_in_file(ip, file_name)
    File.open(file_name, 'r') do |infile|
      while (line = infile.gets)
        next if line[0] == '#'
        ip_from = line.split(',')[0].slice(1..-2).to_i
        ip_to = line.split(',')[1].slice(1..-2).to_i

        if ip.between?(ip_from, ip_to)
          country =  line.split(',')[4].slice(1..-2)
          break
        end
      end
      "Country: #{country.nil? ? 'not found': country}"
    end
  rescue => exception
    puts "Error! #{exception.inspect}"
  end
end

IpToCountry.find_country(ARGV.first.split('.').map(&:to_i), 'IpToCountry.csv')