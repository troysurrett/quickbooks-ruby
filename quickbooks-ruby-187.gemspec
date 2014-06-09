# -*- encoding: utf-8 -*-
# stub: quickbooks-ruby-187 0.0.7 ruby lib

Gem::Specification.new do |s|
  s.name = "quickbooks-ruby-187"
  s.version = "0.0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Cody Caughlan", "Troy Surrett"]
  s.date = "2014-06-09"
  s.description = "REST API to Quickbooks Online via Intuit Data Services v3, forked to work with Ruby 1.8.7"
  s.files = ["lib/quickbooks", "lib/quickbooks-ruby.rb", "lib/quickbooks/model", "lib/quickbooks/model/account.rb", "lib/quickbooks/model/account_based_expense_line_detail.rb", "lib/quickbooks/model/base_model.rb", "lib/quickbooks/model/base_reference.rb", "lib/quickbooks/model/bill.rb", "lib/quickbooks/model/bill_line_item.rb", "lib/quickbooks/model/bill_payment.rb", "lib/quickbooks/model/bill_payment_check.rb", "lib/quickbooks/model/bill_payment_credit_card.rb", "lib/quickbooks/model/bill_payment_line_item.rb", "lib/quickbooks/model/check_payment.rb", "lib/quickbooks/model/company_info.rb", "lib/quickbooks/model/credit_card_payment.rb", "lib/quickbooks/model/credit_memo.rb", "lib/quickbooks/model/custom_field.rb", "lib/quickbooks/model/customer.rb", "lib/quickbooks/model/discount_override.rb", "lib/quickbooks/model/email_address.rb", "lib/quickbooks/model/employee.rb", "lib/quickbooks/model/estimate.rb", "lib/quickbooks/model/group_line_detail.rb", "lib/quickbooks/model/invoice.rb", "lib/quickbooks/model/invoice_line_item.rb", "lib/quickbooks/model/item.rb", "lib/quickbooks/model/item_based_expense_line_detail.rb", "lib/quickbooks/model/line.rb", "lib/quickbooks/model/linked_transaction.rb", "lib/quickbooks/model/markup_info.rb", "lib/quickbooks/model/meta_data.rb", "lib/quickbooks/model/other_contact_info.rb", "lib/quickbooks/model/payment.rb", "lib/quickbooks/model/payment_line_detail.rb", "lib/quickbooks/model/payment_method.rb", "lib/quickbooks/model/physical_address.rb", "lib/quickbooks/model/purchase.rb", "lib/quickbooks/model/purchase_line_item.rb", "lib/quickbooks/model/purchase_order.rb", "lib/quickbooks/model/reconnect.rb", "lib/quickbooks/model/sales_item_line_detail.rb", "lib/quickbooks/model/sales_receipt.rb", "lib/quickbooks/model/sub_total_line_detail.rb", "lib/quickbooks/model/tax_line.rb", "lib/quickbooks/model/tax_line_detail.rb", "lib/quickbooks/model/tax_rate.rb", "lib/quickbooks/model/telephone_number.rb", "lib/quickbooks/model/term.rb", "lib/quickbooks/model/transaction_tax_detail.rb", "lib/quickbooks/model/vendor.rb", "lib/quickbooks/model/vendor_credit.rb", "lib/quickbooks/model/web_site_address.rb", "lib/quickbooks/service", "lib/quickbooks/service/account.rb", "lib/quickbooks/service/base_service.rb", "lib/quickbooks/service/bill.rb", "lib/quickbooks/service/bill_payment.rb", "lib/quickbooks/service/company_info.rb", "lib/quickbooks/service/credit_memo.rb", "lib/quickbooks/service/customer.rb", "lib/quickbooks/service/disconnect.rb", "lib/quickbooks/service/employee.rb", "lib/quickbooks/service/estimate.rb", "lib/quickbooks/service/invoice.rb", "lib/quickbooks/service/item.rb", "lib/quickbooks/service/payment.rb", "lib/quickbooks/service/payment_method.rb", "lib/quickbooks/service/purchase.rb", "lib/quickbooks/service/purchase_order.rb", "lib/quickbooks/service/reconnect.rb", "lib/quickbooks/service/sales_receipt.rb", "lib/quickbooks/service/service_crud.rb", "lib/quickbooks/service/tax_rate.rb", "lib/quickbooks/service/term.rb", "lib/quickbooks/service/vendor.rb", "lib/quickbooks/service/vendor_credit.rb", "lib/quickbooks/service_handle.rb", "lib/quickbooks/util", "lib/quickbooks/util/http_encoding_helper.rb", "lib/quickbooks/util/logging.rb", "lib/quickbooks/util/name_entity.rb", "lib/quickbooks/version.rb"]
  s.homepage = "http://github.com/troysurrett/quickbooks-ruby-187"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "REST API to Quickbooks Online via Intuit Data Services v3, forked to work with Ruby 1.8.7"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<oauth>, [">= 0"])
      s.add_runtime_dependency(%q<roxml>, [">= 0"])
      s.add_runtime_dependency(%q<nokogiri>, ["~> 1.6.0"])
      s.add_runtime_dependency(%q<activemodel>, ["= 3.1.12"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rr>, ["~> 1.0.2"])
      s.add_development_dependency(%q<rspec>, ["= 2.13.0"])
      s.add_development_dependency(%q<fakeweb>, [">= 0"])
    else
      s.add_dependency(%q<oauth>, [">= 0"])
      s.add_dependency(%q<roxml>, [">= 0"])
      s.add_dependency(%q<nokogiri>, ["~> 1.5.0"])
      s.add_dependency(%q<activemodel>, ["= 3.1.12"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rr>, ["~> 1.0.2"])
      s.add_dependency(%q<rspec>, ["= 2.13.0"])
      s.add_dependency(%q<fakeweb>, [">= 0"])
    end
  else
    s.add_dependency(%q<oauth>, [">= 0"])
    s.add_dependency(%q<roxml>, [">= 0"])
    s.add_dependency(%q<nokogiri>, ["~> 1.5.0"])
    s.add_dependency(%q<activemodel>, ["= 3.1.12"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rr>, ["~> 1.0.2"])
    s.add_dependency(%q<rspec>, ["= 2.13.0"])
    s.add_dependency(%q<fakeweb>, [">= 0"])
  end
end
