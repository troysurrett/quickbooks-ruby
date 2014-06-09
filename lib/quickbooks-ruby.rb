require 'bigdecimal'
require 'json'
# require 'iconv'
require 'roxml'

module ROXML::ClassMethods::Declarations
  def xml_accessor(*syms, &block)
    xml_attr(*syms, &block).each do |attr|
      add_reader(attr, syms[1][:as])
      attr_writer(attr.attr_name)
    end
  end

  def add_reader(attr, as)
    define_method(attr.accessor) do
      if instance_variable_get(attr.instance_variable_name).nil?
        instance_variable_set(attr.instance_variable_name, attr.default)
      end
      result = instance_variable_get(attr.instance_variable_name)
      if result.is_a?(Array) && !as.is_a?(Array)
        return instance_variable_get(attr.instance_variable_name).first
      else
        return instance_variable_get(attr.instance_variable_name)
      end
    end
  end
end

require 'logger'
require 'nokogiri'
require 'active_model'
require 'cgi'
require 'uri'
require 'date'
require 'forwardable'
require 'oauth'
require 'quickbooks/util/logging'
require 'quickbooks/util/http_encoding_helper'
require 'quickbooks/util/name_entity'
require 'quickbooks/service_handle'

#== Models
require 'quickbooks/model/base_model'
require 'quickbooks/model/base_reference'
require 'quickbooks/model/meta_data'
require 'quickbooks/model/custom_field'
require 'quickbooks/model/sales_item_line_detail'
require 'quickbooks/model/sub_total_line_detail'
require 'quickbooks/model/discount_override'
require 'quickbooks/model/linked_transaction'
require 'quickbooks/model/payment_line_detail'
require 'quickbooks/model/account_based_expense_line_detail'
require 'quickbooks/model/line'
require 'quickbooks/model/item'
require 'quickbooks/model/account'
require 'quickbooks/model/check_payment'
require 'quickbooks/model/credit_card_payment'
require 'quickbooks/model/telephone_number'
require 'quickbooks/model/other_contact_info'
require 'quickbooks/model/email_address'
require 'quickbooks/model/web_site_address'
require 'quickbooks/model/physical_address'
require 'quickbooks/model/invoice_line_item'
require 'quickbooks/model/tax_line_detail'
require 'quickbooks/model/tax_line'
require 'quickbooks/model/transaction_tax_detail'
require 'quickbooks/model/tax_rate'
require 'quickbooks/model/invoice'
require 'quickbooks/model/company_info'
require 'quickbooks/model/customer'
require 'quickbooks/model/sales_receipt'
require 'quickbooks/model/payment'
require 'quickbooks/model/payment_method'
require 'quickbooks/model/credit_memo'
require 'quickbooks/model/bill_line_item'
require 'quickbooks/model/bill'
require 'quickbooks/model/bill_payment_line_item'
require 'quickbooks/model/bill_payment_check'
require 'quickbooks/model/bill_payment_credit_card'
require 'quickbooks/model/bill_payment'
require 'quickbooks/model/vendor'
require 'quickbooks/model/employee'
require 'quickbooks/model/term'
require 'quickbooks/model/markup_info'
require 'quickbooks/model/group_line_detail'
require 'quickbooks/model/item_based_expense_line_detail'
require 'quickbooks/model/purchase_line_item'
require 'quickbooks/model/purchase'
require 'quickbooks/model/purchase_order'
require 'quickbooks/model/vendor_credit'
require 'quickbooks/model/estimate'

#== Services
require 'quickbooks/service/base_service'
require 'quickbooks/service/service_crud'
require 'quickbooks/service/company_info'
require 'quickbooks/service/customer'
require 'quickbooks/service/invoice'
require 'quickbooks/service/item'
require 'quickbooks/service/sales_receipt'
require 'quickbooks/service/account'
require 'quickbooks/service/payment_method'
require 'quickbooks/service/credit_memo'
require 'quickbooks/service/bill'
require 'quickbooks/service/bill_payment'
require 'quickbooks/service/vendor'
require 'quickbooks/service/employee'
require 'quickbooks/service/payment'
require 'quickbooks/service/term'
require 'quickbooks/service/purchase'
require 'quickbooks/service/purchase_order'
require 'quickbooks/service/vendor_credit'
require 'quickbooks/service/estimate'
require 'quickbooks/service/tax_rate'
require 'quickbooks/service/disconnect'

module Quickbooks
  @@logger = nil

  class << self
    def logger
      @@logger ||= ::Logger.new($stdout) # TODO: replace with a real log file
    end

    def logger=(logger)
      @@logger = logger
    end

    # set logging on or off
    attr_writer :log

    # Returns whether to log. Defaults to 'false'.
    def log?
      @log ||= false
    end

    def log(msg)
      if log?
        logger.info(msg)
        logger.flush if logger.respond_to?(:flush)
      end
    end
  end # << self

  class InvalidModelException < StandardError; end

  class AuthorizationFailure < StandardError; end

  class IntuitRequestException < StandardError
    attr_accessor :message, :code, :detail, :type
    def initialize(msg)
      self.message = msg
      super(msg)
    end
  end

  class Collection
    attr_accessor :entries

    # Legacy Attributes (v2)
    attr_accessor :count, :current_page

    # v3 Attributes
    attr_accessor :start_position, :max_results, :total_count
  end

end

class Object
  def public_send(method, *args)
    if respond_to?(method)
      send(method, args)
    else
      method_missing(method, args)
    end
  end
end

# Backport of Ruby 1.9.2 URI methods to 1.8.7.
module URIFormEncoding

  def encode_www_form_component( str )
    encoded = URI.encode(str)
    encoded.gsub!('+', '%20')
    encoded
  end

  def decode_www_form_component( str )
    decoded = URI.decode(str)
    decoded.gsub!('%20', '+')
    decoded
  end

  def encode_www_form( enum )
    encoded = URI.encode(enum)
    encoded
  end

  def decode_www_form( str )
    new_str = URI.decode(str)
    new_str
  end

end


unless URI.methods.include?( :encode_www_form )
  URI.extend( URIFormEncoding )
end
