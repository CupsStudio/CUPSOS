import math

texts = {
    "ar":{
        "type_input":"كم من عدد تريد ادخاله (1، 2، 3 أو 4): ",
        "num1":"ادخل الرقم الاول: " ,
        "num2":"ادخل الرقم التاني: ",
        "num3":"ادخل الرقم التالت: ",
        "num4":"ادخل الرقم الرابع: ",    
        "operator":"ادخل العملية (√,^,/,*,+,ـ): ",
        "err":"عملية غير معروفة",
        "poerr":"هذه العملية غير مدعومة",    
        "devi_err":"لا يمكنك ان تقسم على 0", 
        "sqrt_err":"لا يمكنك حساب الجذر للاعداد السالبة"    
    },
    "en": {
        "type_input": "Two or three or four numbers? ",
        "num1": "Enter the first number: ",
        "num2": "Enter the second number: ",
        "num3": "Enter the third number: ",
        "num4": "Enter the fourth number:",    
        "operator": "Enter the operator (*,+,-,/,^,√): ",
        "err": "Unknown operation",
        "poerr":"this operator isn't supported",    
        "devi_err":"Unallowed to divide by 0",
        "sqrt_err":"You can't calculate the root of a negative number",
    }
}

while True:
    print("🎊 YCALCULATORS v2.0🔟 The 10th Update — 10ème mise à jour📅 A special release celebrating 10 versions of progress!")
    print("changelog🎉 This release marks the 10th official update of YCALCULATORS.🧠 Started as a basic calculator, now with multilingual support, power operations, and much more.💬 Thank you for being part of this journey.")
    
    lang = input("Choose language (ar/en): ").strip()
    if lang not in texts:
        lang = "ar"  # الافتراضي

    type_input = input(texts[lang]["type_input"])

    if type_input == '1':
        operator = input(texts[lang]["operator"])
        if operator == '√':
            num1 = float(input(texts[lang]["num1"]))
            if num1 < 0:
                print(texts[lang]["sqrt_err"])
            else:
                print(math.sqrt(num1))
        else:
            print(texts[lang]["poerr"])

    elif type_input == '2':
        num1 = float(input(texts[lang]["num1"]))
        operator = input(texts[lang]["operator"])
        num2 = float(input(texts[lang]["num2"]))

        if operator == '+':
            print(num1 + num2)
        elif operator == '^' or operator == '**':
            print(num1 ** num2 )
        elif operator == '-':
            print(num1 - num2)
        elif operator == '*':
            print(num1 * num2) 
        elif operator == '/':
            if num2 == 0:
                print(texts[lang]["devi_err"])
            else:
                print(num1 / num2)
        else:
            print(texts[lang]["err"])

    elif type_input == '3':        
        num1 = float(input(texts[lang]["num1"]))
        operator = input(texts[lang]["operator"])
        num2 = float(input(texts[lang]["num2"]))
        num3 = float(input(texts[lang]["num3"]))   

        if operator == '+':
            print(num1 + num2 + num3)
        elif operator == '-':
            print(num1 - num2 - num3)
        elif operator == '^':
            print(texts[lang]["poerr"])    
        elif operator == '*':
            print(num1 * num2 * num3)
        elif operator == '/':
            if num2 == 0 or num3 == 0:
                print(texts[lang]["devi_err"])
            else:
                print(num1 / num2 / num3)
        else:
            print(texts[lang]["err"])

    elif type_input == '4':
        num1 = float(input(texts[lang]["num1"]))
        operator = input(texts[lang]["operator"])
        num2 = float(input(texts[lang]["num2"]))
        num3 = float(input(texts[lang]["num3"]))
        num4 = float(input(texts[lang]["num4"]))

        if operator == '+':
            print(num1 + num2 + num3 + num4)
        elif operator == '-':
            print(num1 - num2 - num3 - num4)
        elif operator == '*':
            print(num1 * num2 * num3 * num4)
        elif operator == '^':
            print(texts[lang]["poerr"])
        elif operator == '/':
            if num2 == 0 or num3 == 0 or num4 == 0:
                print(texts[lang]["devi_err"])
            else:
                print(num1 / num2 / num3 / num4)
        else:
            print(texts[lang]["err"])

    else:
        print(texts[lang]["err"])

    print("""
----------------------
creator: Yahya Sitray
----------------------
""")              

    repeat = input("\nDo you want to try again? (yes/no) / هل تريد المحاولة مرة أخرى؟ (نعم/لا): ").strip().lower()
    if repeat not in ['yes', 'y', 'نعم', 'ا']:
        print("Goodbye 👋 / وداعاً 👋")
        break