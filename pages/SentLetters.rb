class SentLettersPrism < SitePrism::Page

    element :subject_holder, :xpath, "//div[@class='BltHke nH oy8Mbf']//div[@class='Cp' and preceding-sibling::div[@class='Cp']]//table/tbody/tr[1]//span[@class='bog']/span"
    elements :all_sent_letters, :xpath, "//div[@class='BltHke nH oy8Mbf']//div[@class='Cp' and preceding-sibling::div[@class='Cp']]//table/tbody/tr"
    element :last_letter_checkbox,  :xpath, "//div[@class='BltHke nH oy8Mbf']//div[@class='Cp' and preceding-sibling::div[@class='Cp']]//table/tbody/tr[1]/td[@class='oZ-x3 xY']"
    element :delete_button, :xpath, "//div[@class='BltHke nH oy8Mbf']//div[@class='Cp' and preceding-sibling::div[@class='Cp']]//table/tbody/tr[1]/td[@class='bq4 xY']/ul/li[@class='bqX bru']"
   
    def get_subject_of_the_last_letter()
        return subject_holder.text()
    end

    def get_the_size_of_letters_list()
        return all_sent_letters.length()
    end

    def delete_the_last_letter()
        last_letter_checkbox.click()
        delete_button.click()
    end

end