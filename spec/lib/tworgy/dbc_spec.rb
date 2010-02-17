require File.expand_path(File.dirname(__FILE__) + '../../../spec_helper')

describe DBC do
  
  describe 'should raise DBC exception for' do
    it 'require with false' do
      lambda { DBC.require(false) }.should raise_error(DBC::PreconditionException)
    end

    it 'require with nil' do
      lambda { DBC.require(nil) }.should raise_error(DBC::PreconditionException)
    end

    it 'require_not_blank with nil' do
      lambda { DBC.require_not_blank(nil) }.should raise_error(DBC::PreconditionException)
    end

    it 'require_not_blank with "  "' do
      lambda { DBC.require_not_blank("  ") }.should raise_error(DBC::PreconditionException)
    end
  
    it 'assert with false' do
      lambda { DBC.assert(false) }.should raise_error(DBC::AssertconditionException)
    end

    it 'assert with nil' do
      lambda { DBC.assert(nil) }.should raise_error(DBC::AssertconditionException)
    end

    it 'ensure with false' do
      lambda { DBC.ensure(false) }.should raise_error(DBC::PostconditionException)
    end

    it 'ensure with nil' do
      lambda { DBC.ensure(nil) }.should raise_error(DBC::PostconditionException)
    end
  end
  
end

