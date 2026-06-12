-- YCALCULATOR.lua test version(DEV.phase)
-- OFFICIALLY WE ENTERED (ALPHA.PHASE)
-- OFFICIALLY WE ENTERED (BETA.PHASE) AT 19:07
-- OFFICIALLY WE ENTERED (PRE.RELEASE.PHASE) AT 27-06-2025 WHEN WE STARTED CODING LANGUAGE CODE
-- OFFICIALLY WE ENTERED (RELEASE CANDIDATES.PHASE)
-- OFFICIAL UPDATE 1.3 THE WORLD OF LUA

::start::

local texts = {
  ar = {
    choose_lang = "اختر اللغة (ar/en): ",
    type_input = "كم من عدد تريد ادخاله (1، 2، 3 أو 4): ",
    num1 = "ادخل الرقم الأول: ",
    num2 = "ادخل الرقم الثاني: ",
    num3 = "ادخل الرقم الثالث: ",
    num4 = "ادخل الرقم الرابع: ",
    operator = "ادخل العملية (+,-,*,/,^,√): ",
    err = "عملية غير معروفة",
    poerr = "هذه العملية غير مدعومة لهذه الحالة",
    devi_err = "لا يمكنك القسمة على صفر",
    sqrt_err = "لا يمكنك حساب الجذر لأعداد سالبة",
    welcome = "مرحبا بك في OFFICIAL UPDATE 1.3 THE WORLD OF LUA",
    again = "هل تريد عملية أخرى؟ (y/n): ",
    bye = "تم إنهاء البرنامج."
  },
  en = {
    choose_lang = "Choose language (ar/en): ",
    type_input = "How many numbers do you want to enter? (1, 2, 3 or 4): ",
    num1 = "Enter the first number: ",
    num2 = "Enter the second number: ",
    num3 = "Enter the third number: ",
    num4 = "Enter the fourth number: ",
    operator = "Enter the operator (+,-,*,/,^,√): ",
    err = "Unknown operation",
    poerr = "This operator isn't supported for this case",
    devi_err = "Cannot divide by zero",
    sqrt_err = "You can't calculate root of negative numbers",
    welcome = "Welcome to OFFICIAL UPDATE 1.3 THE WORLD OF LUA",
    again = "Do you want another calculation? (y/n): ",
    bye = "Program terminated."
  }
}

-- اختيار اللغة
print(texts.ar.choose_lang)
print(texts.en.choose_lang)
local lang_input = io.read()
local lang = (lang_input == "en") and "en" or "ar"

while true do
  -- عدد الأرقام، 1 تدعم فقط الجذر
  local type_input
  repeat
    print(texts[lang].type_input)
    type_input = tonumber(io.read())
    if not (type_input >=1 and type_input <=4) then
      print(texts[lang].err)
    end
  until type_input and type_input >=1 and type_input <=4

  print(texts[lang].welcome)

  local numbers = {}
  
  -- في حالة الجذر (√) نحتاج رقم واحد فقط، لو دخل أكثر نستخدم الرقم الأول فقط
  local operator
  repeat
    print(texts[lang].operator)
    operator = io.read()
    local valid_ops = {["+"]=true, ["-"]=true, ["*"]=true, ["/"]=true, ["^"]=true, ["√"]=true}
    if not valid_ops[operator] then
      print(texts[lang].err)
      operator = nil
    end
  until operator

  -- لو العملية هي الجذر والتعليق التالي:
  if operator == "√" then
    print(texts[lang].num1)
    local num = tonumber(io.read())
    if not num then
      print(texts[lang].err)
      goto start
    end
    if num < 0 then
      print(texts[lang].sqrt_err)
    else
      print("Result: " .. math.sqrt(num))
    end
  else
    -- باقي العمليات تأخذ حسب عدد الأرقام المدخلة
    local function read_number(n)
      repeat
        print(texts[lang]["num"..n])
        local num = tonumber(io.read())
        if not num then
          print(texts[lang].err)
        else
          return num
        end
      until false
    end

    for i = 1, type_input do
      numbers[i] = read_number(i)
    end

    local a,b,c,d = numbers[1], numbers[2], numbers[3], numbers[4]
    local result

    if type_input == 1 then
      -- 1 رقم و ليست الجذر: غير مدعوم
      print(texts[lang].poerr)
      goto continue
    elseif type_input == 2 then
      if operator == "+" then
        result = a + b
      elseif operator == "-" then
        result = a - b
      elseif operator == "*" then
        result = a * b
      elseif operator == "^" then
        result = a ^ b
      elseif operator == "/" then
        if b == 0 then
          print(texts[lang].devi_err)
          goto continue
        else
          result = a / b
        end
      else
        print(texts[lang].err)
        goto continue
      end
    elseif type_input == 3 then
      if operator == "+" then
        result = a + b + c
      elseif operator == "-" then
        result = a - b - c
      elseif operator == "*" then
        result = a * b * c
      elseif operator == "^" then
        print(texts[lang].poerr)
        goto continue
      elseif operator == "/" then
        if b == 0 or c == 0 then
          print(texts[lang].devi_err)
          goto continue
        else
          result = a / b / c
        end
      else
        print(texts[lang].err)
        goto continue
      end
    elseif type_input == 4 then
      if operator == "+" then
        result = a + b + c + d
      elseif operator == "-" then
        result = a - b - c - d
      elseif operator == "*" then
        result = a * b * c * d
      elseif operator == "^" then
        print(texts[lang].poerr)
        goto continue
      elseif operator == "/" then
        if b == 0 or c == 0 or d == 0 then
          print(texts[lang].devi_err)
          goto continue
        else
          result = a / b / c / d
        end
      else
        print(texts[lang].err)
        goto continue
      end
    end

    if result then
      print("Result: " .. result)
    end
  end

  ::continue::
  -- هل تريد تكرار العملية؟
  local again
  repeat
    print(texts[lang].again)
    again = io.read()
    if again == "n" then
      print(texts[lang].bye)
      return
    elseif again == "y" then
      break
    end
  until false
end