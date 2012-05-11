module Tuxedo
  def generate_reek_output
    "---
    - !ruby/object:Reek::SmellWarning
      smell:
        class: IrresponsibleModule
        subclass: IrresponsibleModule
        message: has no descriptive comment
        module_name: AddressesController
      status:
        is_active: true
      location:
        context: AddressesController
        lines:
        - 1
        source: ./app/controllers/addresses_controller.rb
    - !ruby/object:Reek::SmellWarning
      smell:
        class: Duplication
        subclass: DuplicateMethodCall
        message: calls address.id twice
        call: address.id
        occurrences: 2
      status:
        is_active: true
      location:
        context: AddressesController#create
        lines:
        - 8
        - 10
        source: ./app/controllers/addresses_controller.rb
    - !ruby/object:Reek::SmellWarning
      smell:
        class: LongMethod
        subclass: TooManyStatements
        message: has approx 6 statements
        statement_count: 6
      status:
        is_active: true
      location:
        context: AddressesController#create
        lines:
        - 2
        source: ./app/controllers/addresses_controller.rb
    - !ruby/object:Reek::SmellWarning
      smell:
        class: UncommunicativeName
        subclass: UncommunicativeVariableName
        message: has the variable name 'c'
        variable_name: c
      status:
        is_active: true
      location:
        context: ApplicationController#find_or_create_cart
        lines:
        - 34
        source: ./app/controllers/application_controller.rb
    - !ruby/object:Reek::SmellWarning
      smell:
        class: Duplication
        subclass: DuplicateMethodCall
        message: calls session twice
        call: session
        occurrences: 2
      status:
        is_active: true
      location:
        context: ApplicationController#mobile_device?
        lines:
        - 10
        - 11
        source: ./app/controllers/application_controller.rb
"
  end

  def generate_full_reek_output
    "---
- !ruby/object:Reek::SmellWarning
  smell:
    class: IrresponsibleModule
    subclass: IrresponsibleModule
    message: has no descriptive comment
    module_name: Customer
  status:
    is_active: true
  location:
    context: SalesEngine::Customer
    lines:
    - 2
    source: ./lib/sales_engine/customer.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: Duplication
    subclass: DuplicateMethodCall
    message: calls invoice.merchant 3 times
    call: invoice.merchant
    occurrences: 3
  status:
    is_active: true
  location:
    context: SalesEngine::Customer#favorite_merchant
    lines:
    - 26
    - 27
    - 29
    source: ./lib/sales_engine/customer.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: LowCohesion
    subclass: FeatureEnvy
    message: refers to merchant_invoice_counter more than self
    receiver: merchant_invoice_counter
    references: 4
  status:
    is_active: true
  location:
    context: SalesEngine::Customer#favorite_merchant
    lines:
    - 23
    source: ./lib/sales_engine/customer.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: NestedIterators
    subclass: NestedIterators
    message: contains iterators nested 2 deep
    depth: 2
  status:
    is_active: true
  location:
    context: SalesEngine::Customer#transactions
    lines:
    - 18
    source: ./lib/sales_engine/customer.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: LowCohesion
    subclass: FeatureEnvy
    message: refers to customer_transactions more than self
    receiver: customer_transactions
    references: 2
  status:
    is_active: true
  location:
    context: SalesEngine::Customer#transactions
    lines:
    - 15
    source: ./lib/sales_engine/customer.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: LargeClass
    subclass: TooManyMethods
    message: has at least 26 methods
    method_count: 26
  status:
    is_active: true
  location:
    context: SalesEngine::Database
    lines:
    - 2
    source: ./lib/sales_engine/database.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: IrresponsibleModule
    subclass: IrresponsibleModule
    message: has no descriptive comment
    module_name: Database
  status:
    is_active: true
  location:
    context: SalesEngine::Database
    lines:
    - 2
    source: ./lib/sales_engine/database.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: LowCohesion
    subclass: FeatureEnvy
    message: refers to attribute_value more than self
    receiver: attribute_value
    references: 3
  status:
    is_active: true
  location:
    context: SalesEngine::Database#find_all_by
    lines:
    - 121
    source: ./lib/sales_engine/database.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: Duplication
    subclass: DuplicateMethodCall
    message: calls Time.parse(record.created_at) twice
    call: Time.parse(record.created_at)
    occurrences: 2
  status:
    is_active: true
  location:
    context: SalesEngine::Database#find_all_created_on
    lines:
    - 155
    - 156
    source: ./lib/sales_engine/database.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: Duplication
    subclass: DuplicateMethodCall
    message: calls record.created_at twice
    call: record.created_at
    occurrences: 2
  status:
    is_active: true
  location:
    context: SalesEngine::Database#find_all_created_on
    lines:
    - 155
    - 156
    source: ./lib/sales_engine/database.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: Duplication
    subclass: DuplicateMethodCall
    message: calls invoice.merchant_id 3 times
    call: invoice.merchant_id
    occurrences: 3
  status:
    is_active: true
  location:
    context: SalesEngine::Database#find_all_invoices_by_merchant_id
    lines:
    - 144
    - 144
    - 148
    source: ./lib/sales_engine/database.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: LowCohesion
    subclass: FeatureEnvy
    message: refers to invoice more than self
    receiver: invoice
    references: 3
  status:
    is_active: true
  location:
    context: SalesEngine::Database#find_all_invoices_by_merchant_id
    lines:
    - 141
    source: ./lib/sales_engine/database.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: Duplication
    subclass: DuplicateMethodCall
    message: calls item.merchant_id 3 times
    call: item.merchant_id
    occurrences: 3
  status:
    is_active: true
  location:
    context: SalesEngine::Database#find_all_items_by_merchant_id
    lines:
    - 134
    - 134
    - 138
    source: ./lib/sales_engine/database.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: LowCohesion
    subclass: FeatureEnvy
    message: refers to item more than self
    receiver: item
    references: 3
  status:
    is_active: true
  location:
    context: SalesEngine::Database#find_all_items_by_merchant_id
    lines:
    - 131
    source: ./lib/sales_engine/database.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: LowCohesion
    subclass: FeatureEnvy
    message: refers to attribute_value more than self
    receiver: attribute_value
    references: 3
  status:
    is_active: true
  location:
    context: SalesEngine::Database#find_by
    lines:
    - 111
    source: ./lib/sales_engine/database.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: Duplication
    subclass: DuplicateMethodCall
    message: calls self.send(class_name) twice
    call: self.send(class_name)
    occurrences: 2
  status:
    is_active: true
  location:
    context: SalesEngine::Database#get_random_record
    lines:
    - 55
    - 55
    source: ./lib/sales_engine/database.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: IrresponsibleModule
    subclass: IrresponsibleModule
    message: has no descriptive comment
    module_name: Invoice
  status:
    is_active: true
  location:
    context: SalesEngine::Invoice
    lines:
    - 2
    source: ./lib/sales_engine/invoice.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: LowCohesion
    subclass: FeatureEnvy
    message: refers to values more than self
    receiver: values
    references: 3
  status:
    is_active: true
  location:
    context: SalesEngine::Invoice#charge
    lines:
    - 37
    source: ./lib/sales_engine/invoice.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: Duplication
    subclass: DuplicateMethodCall
    message: calls values[:transaction] twice
    call: values[:transaction]
    occurrences: 2
  status:
    is_active: true
  location:
    context: SalesEngine::Invoice#self.create
    lines:
    - 32
    - 32
    source: ./lib/sales_engine/invoice.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: IrresponsibleModule
    subclass: IrresponsibleModule
    message: has no descriptive comment
    module_name: InvoiceItem
  status:
    is_active: true
  location:
    context: SalesEngine::InvoiceItem
    lines:
    - 2
    source: ./lib/sales_engine/invoice_item.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: IrresponsibleModule
    subclass: IrresponsibleModule
    message: has no descriptive comment
    module_name: Item
  status:
    is_active: true
  location:
    context: SalesEngine::Item
    lines:
    - 2
    source: ./lib/sales_engine/item.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: Duplication
    subclass: DuplicateMethodCall
    message: calls inv_item.quantity twice
    call: inv_item.quantity
    occurrences: 2
  status:
    is_active: true
  location:
    context: SalesEngine::Item#add_quantity_to_date
    lines:
    - 41
    - 43
    source: ./lib/sales_engine/item.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: LowCohesion
    subclass: UtilityFunction
    message: doesn't depend on instance state
  status:
    is_active: true
  location:
    context: SalesEngine::Item#add_quantity_to_date
    lines:
    - 37
    source: ./lib/sales_engine/item.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: LowCohesion
    subclass: FeatureEnvy
    message: refers to inv_item more than self
    receiver: inv_item
    references: 3
  status:
    is_active: true
  location:
    context: SalesEngine::Item#add_quantity_to_date
    lines:
    - 37
    source: ./lib/sales_engine/item.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: LowCohesion
    subclass: FeatureEnvy
    message: refers to tracker_hash more than self
    receiver: tracker_hash
    references: 3
  status:
    is_active: true
  location:
    context: SalesEngine::Item#add_quantity_to_date
    lines:
    - 37
    source: ./lib/sales_engine/item.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: IrresponsibleModule
    subclass: IrresponsibleModule
    message: has no descriptive comment
    module_name: Merchant
  status:
    is_active: true
  location:
    context: SalesEngine::Merchant
    lines:
    - 2
    source: ./lib/sales_engine/merchant.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: LowCohesion
    subclass: FeatureEnvy
    message: refers to invoice more than self
    receiver: invoice
    references: 2
  status:
    is_active: true
  location:
    context: SalesEngine::Merchant#customers_with_pending_invoices
    lines:
    - 56
    source: ./lib/sales_engine/merchant.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: Duplication
    subclass: DuplicateMethodCall
    message: calls invoice.customer 3 times
    call: invoice.customer
    occurrences: 3
  status:
    is_active: true
  location:
    context: SalesEngine::Merchant#favorite_customer
    lines:
    - 47
    - 48
    - 50
    source: ./lib/sales_engine/merchant.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: LowCohesion
    subclass: FeatureEnvy
    message: refers to customer_invoice_counter more than self
    receiver: customer_invoice_counter
    references: 4
  status:
    is_active: true
  location:
    context: SalesEngine::Merchant#favorite_customer
    lines:
    - 44
    source: ./lib/sales_engine/merchant.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: Duplication
    subclass: DuplicateMethodCall
    message: calls invoice.total_revenue twice
    call: invoice.total_revenue
    occurrences: 2
  status:
    is_active: true
  location:
    context: SalesEngine::Merchant#revenue
    lines:
    - 32
    - 36
    source: ./lib/sales_engine/merchant.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: LowCohesion
    subclass: FeatureEnvy
    message: refers to invoice more than self
    receiver: invoice
    references: 3
  status:
    is_active: true
  location:
    context: SalesEngine::Merchant#revenue
    lines:
    - 29
    source: ./lib/sales_engine/merchant.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: IrresponsibleModule
    subclass: IrresponsibleModule
    message: has no descriptive comment
    module_name: Record
  status:
    is_active: true
  location:
    context: SalesEngine::Record
    lines:
    - 2
    source: ./lib/sales_engine/record.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: LowCohesion
    subclass: UtilityFunction
    message: doesn't depend on instance state
  status:
    is_active: true
  location:
    context: SalesEngine::Record#convert_to_big_decimal
    lines:
    - 11
    source: ./lib/sales_engine/record.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: LowCohesion
    subclass: FeatureEnvy
    message: refers to value more than self
    receiver: value
    references: 3
  status:
    is_active: true
  location:
    context: SalesEngine::Record#convert_to_big_decimal
    lines:
    - 11
    source: ./lib/sales_engine/record.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: Duplication
    subclass: DuplicateMethodCall
    message: calls Time.now twice
    call: Time.now
    occurrences: 2
  status:
    is_active: true
  location:
    context: SalesEngine::Record#initialize
    lines:
    - 7
    - 8
    source: ./lib/sales_engine/record.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: Duplication
    subclass: DuplicateMethodCall
    message: calls Time.now.to_s twice
    call: Time.now.to_s
    occurrences: 2
  status:
    is_active: true
  location:
    context: SalesEngine::Record#initialize
    lines:
    - 7
    - 8
    source: ./lib/sales_engine/record.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: IrresponsibleModule
    subclass: IrresponsibleModule
    message: has no descriptive comment
    module_name: Transaction
  status:
    is_active: true
  location:
    context: SalesEngine::Transaction
    lines:
    - 2
    source: ./lib/sales_engine/transaction.rb
- !ruby/object:Reek::SmellWarning
  smell:
    class: IrresponsibleModule
    subclass: IrresponsibleModule
    message: has no descriptive comment
    module_name: Array
  status:
    is_active: true
  location:
    context: Array
    lines:
    - 1
    source: ./lib/utilities.rb
"
  end
end
