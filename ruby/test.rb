ar = [1, 2, 3, 5]
my_proc = Proc.new {|x| x**2}

ar_proc = ar.map(&my_proc)
ar_classes = ar.map(&:class) # == ar.map {|x| x.class}

print ar_classes
puts
print ar_proc
