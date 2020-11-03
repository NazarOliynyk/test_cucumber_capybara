class SingleLetterPrism < SitePrism::Page

    element :recipient_field, "textarea[class='vO']"
    element :subject_field, "input[name='subjectbox']"
    element :content_field,  "div[class='Am Al editable LW-avf tS-tW']"
    element :submit_button,  "div.T-I.J-J5-Ji.aoO.v7.T-I-atl.L3"

    def fill_letter_form(recipient, subject, content)
        recipient_field.set(recipient)
        subject_field.set(subject)
        content_field.set(content)
    end

    def press_send_button()
        wait_until_submit_button_visible(wait: 10)
        submit_button.click()
    end

end