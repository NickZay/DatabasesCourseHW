
def make_big_str(m):
    return "".join([str(i) for i in range(m)])


big_str = make_big_str(50_000)

with open('big.json', 'w') as file:
    file.write('{"' + big_str + '":"' + big_str + '"}')

with open('big.txt', 'w') as file:
    file.write(big_str)
