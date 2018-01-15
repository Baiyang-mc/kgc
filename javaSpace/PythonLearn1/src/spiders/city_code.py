#_*_condinf:utf-8_*_


user_info={
    'zhang':{'password':'123'},
    'wang':{'password':'123'},
    'li':{'password':'123'},
     'zhao':{'password':'123'},
     'qian':{'password':'123'},
     'sun':{'password':'123'}
}

black_info=['aaa','bbb']
count = 0
count1=0


while count<3:
    name=input("Please enter the user name:")
    if name in black_info:
        print('please contact administrator!')
        exit()

    if not name in user_info :
        print ("The user is not true !")
        count+=1
    if name in user_info:
        passwd=input("Please enter password:")
        if passwd == user_info[name]["password"]:
            print ("welcome to you,%s" %name)
            break
        else:
            print('wrong password')
            count+=1
else:
    print('your number will be locked !')