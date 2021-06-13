class StringUtil

    # It returns true, if the value is an integer or a string with a integer value.
    def self.isInteger?( valueString )
        return true if valueString.is_a?(Integer)
        return false if not valueString.is_a?(String)
        return valueString.to_i.to_s == valueString
    end

    def self.timestampString()
        return Time.now().to_i().to_s()
    end

    def self.raiseIfIsEmptyOrNil( value, aditionalMessage="" )
        ValidateUtil.raiseIfValueIsNotA( value, String )
        return if not(value.empty?)
        raise ArgumentError.new("The String is empty. #{aditionalMessage}") 
    end

    def self.raiseIfIsBlankOrNil( value, aditionalMessage="" )
        ValidateUtil.raiseIfValueIsNotA( value, String )
        return if not( value.strip().empty? )
        raise ArgumentError.new("The String is blank. #{aditionalMessage}") 
    end
end