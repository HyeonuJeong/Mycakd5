#사용중인요금제, 데이터쓴 요금값,추천요금제

util=[[29900,300],[34900,1000],[39900,2000],[49900,6000],[59900,11000],[69900,999999]]


input=list(map(int,'59900 5900'.split()))
#사용중인 요금제
print(input)
for i in util:
    if i[0]==input[0]:
        choice=i[0]
        use=i[1]
        # print(choice)
        # print(use)

#현재요금제사용시 월요금
if input[1]>use:
    overcharge=(input[1]-use)*20
    
    if overcharge>=180000: #18만원이상이면 18만원고정
        overcharge=179999

    elif overcharge>25000 and input[1]<(5000+use): # 25000원넘고 5기가초과하면 25000원
        overcharge=25000
    
elif use =='무제한': 
    overcharge=0

# print(overcharge)

# print(choice+overcharge)


#추천요금제
lst=[]
for i in util:
    choice=i[0]
    use=i[1]
    if input[1]>use:
        overcharge=(input[1]-use)*20
        if overcharge>=180000: #18만원이상이면 18만원고정
            overcharge=179999
        elif overcharge>25000 and input[1]<(5000+use): # 25000원넘고 5기가초과하면 25000원
            overcharge=25000
    else: 
        use ==999999
        overcharge=0

    print(choice,use,overcharge)

    lst.append(choice+overcharge)
    print(lst)
 
print(min(lst))#추천 요금제 사용시 월요금
print(util[lst.index(min(lst))][0])#추천 요금제
