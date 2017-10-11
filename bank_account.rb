class BankAccount
    attr_reader :account_number, :checking, :saving
    @@total_accounts = 0 
    def initialize() 
        gen_account_number
        @checking = 0 
        @saving = 0 
        @@total_accounts += 2
        @interest_rate = 0.01 
    end 

    def display_account_number
        puts self.account_number
        return self 
    end 

    def display_checking
        puts self.checking
        return self.checking 
    end 

    def display_saving 
        puts self.saving 
        return self.saving
    end 

    def deposit(account, num)
        if account == "checking"
            @checking += num 
        elsif account == "saving"
            @saving += num
        else
            puts "Please specify either 'checking' or 'saving' for deposit"
        end 
    end 

    def account_information
        display_account_number
        total
        display_checking
        display_saving
        display_interest
    end 

    def withdraw(account, num)
        if account == "checking" and self.checking > num 
            @checking -= num 
        elsif account =="checking" and self.checking < num 
            puts "Insufficient funds in checking account" 
            return "Insufficient funds in checking account" 
        elsif account == "saving" and self.saving > num
            @saving -= num
        elsif account == "saving" and self.saving < num 
            puts "Insufficient funds in saving account" 
            return "Insufficient funds in saving account" 
        elsif account != "saving" and account != "checking" 
            puts "Please specify either 'checking' or 'saving' account"
        end 
    end 

    def total
        value = @checking + @saving 
        puts value 
        return value 
    end 

    private
        def gen_account_number
            @account_number = rand(100000..999999)
            return self 
        end 
        def display_interest
            puts @interest_rate
        end 


end 
