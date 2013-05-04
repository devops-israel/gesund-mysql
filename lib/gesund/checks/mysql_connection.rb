require "mysql"

module Gesund::Checks
  class MysqlConnection
    include Gesund::Check
    def initialize(options)
      begin
        require 'pp'
        ::Mysql.new.ping.close # raises exception on failure
        self.message = "MySQL is answering to a ping"
        self.success = true
      rescue => e
        self.message = "#{e.class}: #{e.message}"
        self.success = false
      end
    end
  end
end
