

require_relative (Dir.getwd + "/pages/Login.rb")
require_relative (Dir.getwd + "/pages/Home.rb")
require_relative (Dir.getwd + "/pages/HandleLetters.rb")
require_relative (Dir.getwd + "/pages/SingleLetter.rb")
require_relative (Dir.getwd + "/pages/SentLetters.rb")

Given('I go to gmail') do
  
    @login = LoginPrism.new
    @login.load
  end
  
  When('I insert the login {string}') do |string|
  
    @login.type_email_and_submit(string)
  end
  
  When('I insert the password {string}') do |string| 
   
    @login.type_password_and_submit(string)
  end
  
  Then('I should check if I logged in') do
     
    @home = HomePrism.new
    @home.wait_until_icon_visible
    expect(@home).to have_icon
  end
  
  Then('I should send the letter') do
    @handle_letters = HandleLettersPrism.new
    @handle_letters.open_create_letter_form()
   
  end
  
  When('I send a letter to {string} with subject {string} and content {string}') do |string, string2, string3|
    find(:xpath, "//textarea[@class='vO']").click()
   

    # @single_letter = SingleLetterPrism.new
    # @single_letter.fill_letter_form(string, string2, string3)
    # @single_letter.press_send_button()
   
   
  end
  
  Then('I should check if the subject of the last letter is equal to  {string}') do |string|
   
    @handle_letters.get_all_sent_letters()
    @sent_letters = SentLettersPrism.new
    expect( @sent_letters.get_subject_of_the_last_letter()).to eql(string)
   end

  Then('I should delete the letter and check whether it was really deleted') do
    size_of_letters_list_before_deleting =  @sent_letters.get_the_size_of_letters_list()
    log(size_of_letters_list_before_deleting)
    # @sent_letters.delete_the_last_letter()
    # @handle_letters.get_all_sent_letters()
    # size_of_letters_list_after_deleting = @sent_letters.get_the_size_of_letters_list()
    # log(size_of_letters_list_after_deleting)
    # expect(size_of_letters_list_before_deleting).not_to eql(size_of_letters_list_after_deleting)
   
  end