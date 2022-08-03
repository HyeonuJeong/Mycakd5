
# layers=[3,4,4,2]
# stack=''
# sum=0
# for i in layers:
#     stack+=str(i)
#     # print(stack)
#     if len(stack)==2:
#         sum+=(int(stack[0])*int(stack[1]))
#         print(sum)
#         # print(type(int(stack[0])),int(stack[0]))
#         # print(type(int(stack[1])),int(stack[1]))
#         # print(int(stack[0])*int(stack[1]))
#         stack=stack[1:]



# user_input='5 3'

# splt=user_input.split()

# print(int(splt[0])>>int(splt[1]))
# print(int(splt[0])<<int(splt[1]))



# n=6
# arr=[]

# for i in range(n):
#     print(i)
#     arr[i]=input()
#     print(arr)


# # 7 7 6 7 6 1 
# # 2 9 7 9 4 2 
# # 5 4 0 0 7 7 
# # 0 0 6 5 2 6 
# # 4 6 6 3 8 8 
# # 8 6 3 9 6 5 
# # 2 2

# util=[[29900,300],[34900,1000],[39900,2000],[49900,6000],[59900,11000],[69900,99999]]


# input=list(map(int,'39900 1800'.split()))

# print(input)
# for i in util:
#     if i[0]==input[0]:
#         choice=i[0]
#         use=i[1]
#         print(choice)
#         print(use)
    



# if input[1]>use:
#     overcharge=(input[1]-use)*20

#     if overcharge>25000 and input[1]<(5000+use):
#         overcharge=25000

#     if overcharge>=180000:
#         overcharge=179999

# else: 
#     use =='99999'
#     overcharge=0

# print(choice+overcharge)
        


def solution(stats):
    ins=[]
    room=1
    for i in range(len(stats)-1):
        if stats[i]> stats[i+1]:
            # print(stats[i],stats[i+1],room+1)
            room+=1
            ins[i].append(stats[i-0])
            print(ins)
            
    
    answer = room
    return answer

# lst=[5,3,4,6,2,1]
lst=[2,3,1,4,9,5,10,11,16,14,13,12,19,17]
print(solution(lst))