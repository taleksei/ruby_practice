#Вычисляет страну по IP

begin
ip = ARGV[0].split('.').map(&:to_i)

ip = ip[3] + (ip[2]*256) + (ip[1]*256*256) + (ip[0]*256*256*256)

file = File.open("IpToCountry.csv", "r") do |infile|
  while (line = infile.gets)
    if line[0] != '#' and line.split(',')[0].slice(1..-2).to_i <= ip and line.split(',')[1].slice(1..-2).to_i >= ip
      country =  line.split(',')[4].slice(1..-2)
      break
    end
  end
  puts "Country: #{country.nil? ? 'not found': country}"
end
rescue Exception => e
  puts "Error! #{e.inspect}"
end