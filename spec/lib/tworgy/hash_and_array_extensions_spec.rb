require File.expand_path(File.dirname(__FILE__) + '../../../spec_helper')

describe "recursively" do
  
  describe Hash do
  
    it 'should symbolize the keys recursively' do
      {'a' => {'b' => 3}}.recursively { |hash| symbolize_keys(hash) }.should == {:a => {:b => 3}}
    end
    
    describe 'ostructify' do
      before :each do
        @object = {:person => {:name => 'bob', :age => 5}, :array => [{:something => 'in the array'}]}.ostructify
      end
      
      it 'should turn a nested hash into nested OpenStructs' do
        @object.person.name.should == 'bob'
        @object.person.age.should == 5
      end
      
      it 'should keep ostructify all the way past arrays' do
        @object.array[0].something.should == 'in the array'
      end
    end
  end
  
  describe Array do
    describe 'ostructify' do
      before :each do
        @object = [{:person => {:name => 'bob', :age => 5}}, {:animal => 'dog'}].ostructify
      end
      
      it 'should recursively ostructify things in the array' do
        @object[0].person.name.should == 'bob'
        @object[0].person.age.should == 5
        @object[1].animal.should == 'dog'
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


