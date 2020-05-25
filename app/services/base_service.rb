# frozen_string_literal: true

class BaseService
  class << self
    Result = Struct.new(:success, :value, :error) do
      def success?
        success
      end

      def failure?
        !success
      end
    end

    ResultError = Struct.new(:value) do
      def to_s
        return value.full_messages.join(', ') if value&.respond_to?(:full_messages)

        value.to_s
      end

      def to_h
        return value.messages if value&.respond_to?(:messages)

        {}
      end
    end

    def success(value)
      Result.new(true, value, nil)
    end

    def failure(value, error = nil)
      error = value.errors if error.nil? && value.respond_to?(:errors)

      Result.new(false, value, ResultError.new(error))
    end
  end
end
