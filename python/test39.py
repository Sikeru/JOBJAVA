import datetime
print(datetime.datetime.now())
print(datetime.datetime.now().strftime("%Y-%m-%d"))
now = datetime.datetime.now()
print(now.year)
print(now.month)
print(now)
now.replace(day = (now.day+5))
print(now)