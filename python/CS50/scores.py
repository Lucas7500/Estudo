# scores = [72, 73, 33]

# avg = sum(scores) / len(scores)

# print('Average: %.2f' % avg)

scores = []
for i in range(3):
    score = int(input("Score: "))
    # scores.append(score)
    scores += [score]

avg = sum(scores) / len(scores)

print(avg)
