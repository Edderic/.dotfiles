
all_branches = `git branch`.split("\n").map(&:strip)
branches = all_branches.select do |b|
  ['master', 'staging'].none? do |reject_branch|
    b.scan(reject_branch).any?
  end
end

branches.each do |branch|
  puts "Would you like to remove branch '#{branch}'? [y/n/q]"
  answer = gets.chomp
  if answer.downcase == 'y'
    puts `git branch -D #{branch}`
    puts "Deleted #{branch}..."
  elsif answer.downcase == 'n'
    puts "Skipping #{branch}..."
  elsif answer.downcase == 'q'
    puts "Quitting..."
    break
  end
end

