class StringUtil

    def self.isInteger?( valueString )
        return false if not valueString.is_a?(String)
        return valueString.to_i.to_s == valueString
    end

    def self.timestampString()
        return Time.now().to_i().to_s()
    end

    def self.raiseIfIsEmpty( value, aditionalMessage="" )
        ValidateUtil.raiseIfValueIsNotA( value, String )
        raise ArgumentError.new("The String is empty. #{aditionalMessage}") if value.empty?
    end
end