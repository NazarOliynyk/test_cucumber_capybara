class HandleLettersPrism < SitePrism::Page

    element :create_letter_button, 'div.T-I.T-I-KE.L3'
    element :sent_lettes_button, 'div.TN.bzz.aHS-bnu'

    def open_create_letter_form()
        create_letter_button.click() 
    end

    def get_all_sent_letters()
        sent_lettes_button.click()
    end

end