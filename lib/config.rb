class Config

  def maybe_create_then_read_config(filename='.edderic-config.json')
    File.open(filename, 'a')
    file = File.read(filename)
    JSON.parse(file)
  rescue Exception => e
    puts e
    config = { 'spring_rspec': false }

    File.open(filename, 'a') do |f|
      # probably good if we just have a template file that we copy from
      f.write(JSON.pretty_generate(config))
    end

    config
  end
end
