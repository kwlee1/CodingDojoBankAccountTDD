require_relative 'bank_account'

RSpec.describe BankAccount do
    before(:each) do 
        @account1 = BankAccount.new
        @account2 = BankAccount.new
        @account1.deposit("checking",10)
        @account1.deposit("saving",100)
        @account2.deposit("checking",20)
        @account2.deposit("saving",200)
    end

    it 'can get the checking account balance' do 
        expect(@account1.display_checking).to eq(10)
        expect(@account2.display_checking).to eq(20)
    end 

    it 'can get the total account balance' do 
        expect(@account1.total).to eq(110)
        expect(@account2.total).to eq(220)
    end 

    it 'can withdraw cash' do 
        @account1.withdraw("saving",50)
        @account2.withdraw("saving",100)
        expect(@account1.display_saving).to eq(50)
        expect(@account2.display_saving).to eq(100)
    end 

    it "can't withdraw more money than in the account" do
        expect(@account1.withdraw("checking",1000)).to eq("Insufficient funds in checking account" )
        expect(@account2.withdraw("saving",1000)).to eq("Insufficient funds in saving account" )
    end 

    it "can't retrieve total number of bank accounts" do 
        expect{ @account1.total_accounts }.to raise_error(NoMethodError)
        expect{ @account2.total_accounts }.to raise_error(NoMethodError)
    end 

    it "can't set the interest rate" do 
        expect{ @account1.interest_rate = 0.1 }.to raise_error(NoMethodError)
        expect{ @account2.interest_rate = 0.2 }.to raise_error(NoMethodError)
    end 

end 