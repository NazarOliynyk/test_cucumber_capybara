require 'yaml'

class LoginPrism < SitePrism::Page

    test_data = YAML.load(File.read("testdata/gmail_testdata.yml"))
    set_url test_data[:main_url]
    element :id_input, '#identifierId'
    element :id_submit, '#identifierNext'
    element :password_input, "input[type='password']"
    element :password_submit, '#passwordNext'

    def type_email_and_submit(email)
        id_input.set(email)
        id_submit.click()
    end

    def type_password_and_submit(password)
        password_input.set(password)
        password_submit.click()
    end

end