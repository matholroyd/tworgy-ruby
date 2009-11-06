class Object
  def pms
    public_methods.sort.join('  ')
  end
end

class String 
  def /(str_to_join) 
    File.join(self, str_to_join) 
  end 
  
  def self.unique_append(options)
    root = options[:root]
    append = options[:append]
    join = options[:join]
    
    if root.blank?
      append
    elsif append.blank? || root.include?(append)
      root
    else
      "#{root}#{join} #{append}"
    end
  end 
end

class Time
  def to_short
    to_s('')
  end
end

