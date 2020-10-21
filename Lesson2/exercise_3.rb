fibonacci_sequence = [1, 1]

fibonacci_number = fibonacci_sequence[-1] + fibonacci_sequence[-2]
while fibonacci_number <= 100
  fibonacci_sequence.push fibonacci_number
  fibonacci_number = fibonacci_sequence[-1] + fibonacci_sequence[-2]
end
