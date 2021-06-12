class ExceptionUtil
  def self.printLinesOfBackTrace( exception, numberOfLines )
    ValidateUtil.raiseIfValueIsNotA( exception, StandardError )
    ValidateUtil.raiseIfValueIsNotA( numberOfLines, Integer )
    lastLine = numberOfLines-1
    linesOfBackTrace = exception.backtrace[0..lastLine]
    puts exception.message()
    puts linesOfBackTrace
  end
end