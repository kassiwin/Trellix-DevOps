import os

response = os.system('echo "obase=2; ibase=16; ABC" | bc')
print(response)


print(os.system('eval "ip"'))


