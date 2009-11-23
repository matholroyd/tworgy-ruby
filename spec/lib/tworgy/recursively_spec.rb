require File.expand_path(File.dirname(__FILE__) + '../../../spec_helper')

describe "recursively" do
  
  describe Hash do
  
    it 'should symbolize the keys recursively' do
      {'a' => {'b' => 3}}.recursively { |hash| symbolize_keys(hash) }.should == {:a => {:b => 3}}
    end
    
    describe 'ostructify' do
      before :each do
        @object = {:person => {:name => 'bob', :age => 5}}.ostructify
      end
      
      it 'should turn a nested hash into nested OpenStructs' do
        @object.person.name.should == 'bob'
        @object.person.age.should == 5
      end
    end
  end
end

def symbolize_keys(hash)
  hash.inject({}) do |result, (key, value)|
    result[key.to_sym] = value
    result
  end
end


