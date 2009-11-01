class Object
  def pms
    public_methods.sort.join('  ')
  end
end

class String 
  def /(str_to_join) 
    File.join(self, str_to_join) 
  end 
end

class Time
  def to_short
    to_s('')
  end
end

