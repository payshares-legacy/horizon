# 
# Generic format conversion module
# 
module Convert
  require 'base64'

  def to_hex(string)
    string.unpack("H*").first
  end

  def from_hex(hex_string)
    [hex_string].pack("H*")
  end

  def to_base64(string)
    Base64.strict_encode64(string)
  end

  def from_base64(base64_string)
    Base64.strict_decode64(base64_string)
  end

  def base58
    Payshares::Util::Base58.payshares
  end

  extend self
end