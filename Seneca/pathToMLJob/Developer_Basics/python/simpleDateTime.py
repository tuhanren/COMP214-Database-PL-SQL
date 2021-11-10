# use the datetime Lib
from datetime import date, time, datetime

def mainDT():
    # TODO:use the date class
    # date.today
    today = date.today()
    # get components of date
    print(f"Today is {today}, which is composed of {today.day}, {today.month}, {today.year}")
    # retrieve weekday 0 for Mon.
    print(f"Today's weekday number: {today.weekday()}")
    # TODO: use the time Class
    # print(f"Now is {time.microsecond }")

    # TODO: use the datetime Class
    print(f"Now is {datetime.now()}")
    # get the current time
    print(f"Now is {datetime.time(datetime.now())}")

def mainDtFormat():
    # get datetime
    testNow = datetime.now()
    # basic format from the now function
    # use % to format and strftime()
    # TODO: time format 

    print(testNow.strftime("The current year is: %Y %y. Current Day is: %d %D. Month is: %B. Weekday is: %a %A"))

    # TODO: locale time date, the system time  
    # system location proper format 
    print(testNow.strftime("The Locale date and time: %c, %p, locale date: %x, locale time: %X \n, hour %H, minute: %M, second: %s %S"))

    # format time 
    # %I 12H time 
    print(testNow.strftime("The current time is %I:%M:%S %p"))


# TODO: time related calculation
# timedelta is the span of time     
from datetime import timedelta

def fromNow():
     # get datetime
    testNow = datetime.now()
    # plus the time span
    print(f"One year and a week from now {testNow + timedelta(days = 365, weeks = 1)}")
    print(f"A week ago {testNow - timedelta(weeks = 1)}")
    # get the time then format 
    t = datetime.now() - timedelta(weeks = 2)
    st = t.strftime("%B %d, %Y. %H:%M:%S")
    print(f"Two weeks ago: {st}")

def daysTo(aDate):
    from datetime import date
    tmpNow = date.today()
    if aDate < tmpNow:
        aDate = aDate.replace(year = tmpNow.year+1)
        # (dayA - dayB).days
        print(f"There are {(aDate - tmpNow).days} days to the next one.")
    else:
        print(f"There are {(aDate - tmpNow).days} days to this day.")


# TODO: work with calendar
def meetFirstFriday(year = 2020):
    import calendar 
    for i in range(1, 13):
        weekone = calendar.monthcalendar(year, i)[0]
        if weekone[calendar.FRIDAY] != 0:
            meetday = weekone[calendar.FRIDAY]
        else:
            weektwo = calendar.monthcalendar(year, i)[1]
            meetday = weektwo[calendar.FRIDAY]
        print("%9s %2d" %(calendar.month_name[i], meetday))
        print(f"{calendar.month_name[i]:9s} {meetday:2d}")

# # the first day of the week will start from the sunday
# testC = calendar.TextCalendar(calendar.SUNDAY)
# # testC = calendar.TextCalendar(calendar.MONDAY)
# print(testC.formatmonth(2020, 9, w=1, l=1))

# # HTML calendar
# testHC = calendar.HTMLCalendar(calendar.SUNDAY)
# print(testHC.formatmonth(2020, 9))

# print(calendar.monthcalendar(2020, 1))
# print(calendar.monthcalendar(2020, 1)[0][calendar.TUESDAY])
def nextDay():
    from datetime import date
    days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    # TODO: the modulo trick 
    print(days[(date.today().weekday() + 1)%7  ])


if __name__ == "__main__":
    # mainDT()
    mainDtFormat()
    fromNow()
    daysTo(date(date.today().year, 4, 1))
    meetFirstFriday()
    nextDay()
    # # largest time span is "days"
    # print(timedelta(days = 1, hours = 5, minutes = 1))



# today=date.today()
# # Option B:
# tomorrow=date(today.year,today.month,today.day+1)
# print(today)
# print(tomorrow)
# # Option A: 
# tomorrow=today+timedelta(days=1)
# print(tomorrow)
