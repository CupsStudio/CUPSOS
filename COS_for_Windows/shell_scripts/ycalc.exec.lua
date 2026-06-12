-- development started at 29 of may 2026 6:08 PM
-- entered alpha at 29 of may 2026 6:08 PM
-- 1.5 is the second lua update of YCALC and it's build on top of 1.3 code
-- i started it because i want to have the same fun when i started learning programing and knowed lua in 27 june 2025
--ended development at 29 of  may 2026 10:11 PM

::start::

local texts = {
  ar = {
    Dividend = "ادخل المقسوم: ",
    Divisor = "ادخل المقسوم عليه: ",
    num = "أدخل رقمًا: ",
    How_num = "أدخل عدد الأرقام التي تريد حسابها: ",
    res = "الخارج هو: ",
    num1 = "ادخل الرقم الأول: ",
    choose_lang = "اختر اللغة (ar/en/fr): ",
    operator = "ادخل العملية (+,-,*,/,^,√, M ل max, m ل min): ",
    err = "عملية غير معروفة",
    poerr = "هذه العملية غير مدعومة لهذه الحالة",
    devi_err = "لا يمكنك القسمة على صفر",
    sqrt_err = "لا يمكنك حساب الجذر لأعداد سالبة",
    welcome = "مرحبا بك في التحديث الرسمي 1.5 ON TOP OF LUA",
    again = "هل تريد عملية أخرى؟ (y/n): ",
    bye = "تم إنهاء البرنامج."
  },
  en = {
    Divisor = "enter the Divisor: ",
    Dividend = "enter the Dividend: ",
    num = "enter a number: ",
    How_num = "enter how many numbers you want to calculate: ",
    res = "The result is: ",
    num1 = "Enter the first number: ",
    choose_lang = "Choose a language (ar/en/fr): ",
    operator = "Enter the operation (+,-,*,/,^,√, M for max, m for min): ",
    err = "Unknown operation",
    poerr = "This operator isn't supported for this case",
    devi_err = "Cannot divide by zero",
    sqrt_err = "You can't calculate root of negative numbers",
    welcome = "Welcome to The OFFICIAL UPDATE 1.5 ON TOP OF LUA",
    again = "Do you want another calculation? (y/n): ",
    bye = "Program terminated."
  },
  fr = {
    Dividend = "entrez le dividende: ",
    Divisor = "entrez le diviseur: ",
    num = "entrez un nombre : ",
    How_num = "entrez combien de nombres vous souhaitez calculer: ",
    res = "Le résultat est: ",
    num1 = "entrez la premiére nombre: ",
    choose_lang = "Choisissez une langue (ar/en/fr): ",
    operator = "Entrez l'opération (+,-,*,/,^,√, M pour max, m pour min): ",
    err = "Opération inconnue",
    poerr = "Cet opérateur n'est pas pris en charge pour ce cas",
    devi_err = "Impossible de diviser par zéro",
    sqrt_err = "Vous ne pouvez pas calculer la racine des nombres négatifs",
    welcome = "Bienvenue dans la MISE À JOUR OFFICIELLE 1.5 ON TOP OF LUA",
    again = "Voulez-vous un autre calcul ? (y/n): ",
    bye = "Programme terminé."
  }
}

function Read_number()
      repeat
        local num = tonumber(io.read())
        if not num then
          print(texts[Lang].err)
        else
          return num
        end
      until false
    end

Calc = {}

function Calc.add(...)
    local nums = {...}
    local sum = 0
    for _, v in ipairs(nums) do
        sum = sum + v
    end
    return sum
end

function Calc.sub(...)
    local nums = {...}
    if #nums == 0 then return 0 end

    local res = nums[1]
    for i = 2, #nums do
        res = res - nums[i]
    end
    return res
end

function Calc.mul(...)
    local nums = {...}
    if #nums == 0 then return 0 end

    local res = 1
    for _, v in ipairs(nums) do
        res = res * v
    end
    return res
end

function Calc.div(...)
    local nums = {...}
    if #nums == 0 then return texts[Lang].devi_err end

    local res = nums[1]

    for i = 2, #nums do
        local v = nums[i]
        if v == 0 then
            return texts[Lang].devi_err
        end
        res = res / v
    end

    return res
end

function Calc.pow(...)
    local nums = {...}
    if #nums == 0 then return nil end

    local res = nums[1]
    for i = 2, #nums do
        res = res ^ nums[i]
    end
    return texts[Lang].res.. res
end

function Calc.mod(Dividend, Divisor)
    return Dividend % Divisor
end

function Calc.max(...)
    local nums = {...}
    if #nums == 0 then return nil end

    local m = nums[1]
    for i = 2, #nums do
        if nums[i] > m then
            m = nums[i]
        end
    end
    return m
end

function Calc.min(...)
    local nums = {...}
    if #nums == 0 then return nil end

    local m = nums[1]
    for i = 2, #nums do
        if nums[i] < m then
            m = nums[i]
        end
    end
    return m
end

-- اختيار اللغة
print(texts.ar.choose_lang)
print(texts.en.choose_lang)
print(texts.fr.choose_lang)
Lang_input = io.read()
Lang = (Lang_input == "en") and "en"
    or (Lang_input == "fr") and "fr"
    or "ar

while true do
    print(texts[Lang].welcome)

    local operator
    repeat
        print(texts[Lang].operator)
        operator = io.read()
        local valid_ops = {["+"]=true, ["-"]=true, ["*"]=true, ["/"]=true, ["^"]=true, ["√"]=true, ["%"]=true, ["M"]=true, ["m"]=true}
        if not valid_ops[operator] then
            print(texts[Lang].err)
            operator = nil
        end
    until operator


    if operator == "√" then
        print(texts[Lang].num1)
        local num = tonumber(io.read())
        if not num then
            print(texts[Lang].err)
            goto start
        end
        if num < 0 then
            print(texts[Lang].sqrt_err)
        else
            print("Result: " .. math.sqrt(num))
        end
    else

    if operator == "%" then
        print(texts[Lang].Dividend)
        local Dividend = Read_number()

        print(texts[Lang].Divisor)
        local Divisor = Read_number()

        if Divisor == 0 then
            print(texts[Lang].devi_err)
        else
            print(texts[Lang].res.. Calc.mod(Dividend, Divisor))
        end
    end

    function Read_number()
      repeat
        local num = tonumber(io.read())
        if not num then
          print(texts[Lang].err)
        else
          return num
        end
      until false
    end

    local nums = {}

    local n = tonumber(io.read())
    for i = 1, n do
        print(texts[Lang].num)
        nums[i] = Read_number()
    end

    if operator == "+" then
        print(texts[Lang].res.. Calc.add(table.unpack(nums)))
    elseif operator == "-" then
        print(texts[Lang].res.. Calc.sub(table.unpack(nums)))
    elseif operator == "*" then
        print(texts[Lang].res.. Calc.mul(table.unpack(nums)))
    elseif operator == "^" then
        print(texts[Lang].res.. Calc.pow(table.unpack(nums)))
    elseif operator == "/" then
        print(texts[Lang].res.. Calc.div(table.unpack(nums)))
    elseif operator == "M" then
        print(texts[Lang].res.. Calc.max(table.unpack(nums)))
    elseif operator == "m" then
        print(texts[Lang].res.. Calc.min(table.unpack(nums)))
    end
  end

  ::continue::
  -- هل تريد تكرار العملية؟
  local again
  repeat
  print(texts[Lang].again)
  again = io.read()
  if again == "n" then
      print(texts[Lang].bye)
      return
      elseif again == "y" then
          break
          end
          until false
end
