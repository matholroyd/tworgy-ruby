def capture_stderr
  result = ""
  begin
    $stderr = StringIO.new 
    yield
    $stderr.rewind
    result = $stderr.read
  ensure 
    $stderr = STDERR
  end
  result
end
