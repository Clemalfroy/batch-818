def salutations(name)
  puts "Hello #{name}"
end

def full_name(first_name, last_name)
  "#{first_name} #{last_name}"
end


puts full_name('toto', 'anderson')


salutations(
  full_name('toto', 'anderson')
)


