class Quest

  def initialize
    current_path = File.dirname(__FILE__)
    file_name = current_path + "/../data/story.txt"

    if !File.exist?(file_name)
      abort "Невозможно загрузить файл story.txt !"
    end

    f = File.new(file_name, "r:UTF-8")
    @story = f.readlines
    f.close

    current_path = File.dirname(__FILE__)
    file_name = current_path + "/../data/variants.txt"

    if !File.exist?(file_name)
      abort "Не загрузить файс variants.txt !"
    end

    f = File.new(file_name, "r:UTF-8")
    @variants = f.readlines
    f.close

  end

  def age_inquiry
    age = gets.to_i
    if (age == nil || age == "" || age == 0)
      abort "Задано не верное или пустое значение возраста. Укажите свой возраст"
    elsif (age <= 15)
      cls
      first_step
      second_step
    elsif (age >= 15)
      abort "Вы слишком старый для этого квеста :-)"
    end
  end

  def user_answer

    user_input = nil

    until (user_input == 1 or user_input == 2 or user_input == 3)
      puts "введите число: 1 – да, 2 – нет, 3 – иногда, и нажмите Enter"
      user_input = gets.to_i
      @user_choice = user_input
    end
  end

  def first_step

    puts @story[0]
    puts
    puts @variants[0..2]
    puts

    user_answer

    cls
  end

  def second_step

    puts @story[1]
    puts

    hour = gets.to_i

    if (hour >= 0 && hour < 14)
      abort @variants[3]
    end

    if (hour >= 14 && hour < 16)
      puts @variants[4]
      sleep(2)
      cls
      third_step
    end

    if (hour >= 16 && hour < 17)
      puts @variants[5]
      sleep(2)
      cls
      third_step
    end

    if (hour >= 17 && hour < 23)
      abort @variants[6]
    end

  end

  def third_step
    puts @story[2]
    puts
    puts @variants[7..9]
    puts

    user_answer

    cls

    if @user_choice == 1
      puts @story[3]
    elsif @user_choice == 2
      puts @story[4]
    else
      puts @story[5]
    end

    puts
    puts @story[6..7]

  end

  def cls
    system 'clear' or system 'cls'
  end

end
