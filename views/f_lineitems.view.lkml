view: f_lineitems {
  sql_table_name: "DATA_MART"."F_LINEITEMS" ;;

#Dimensions
  dimension: l_availqty {
    type: number
    sql: ${TABLE}."L_AVAILQTY" ;;
  }
  dimension: l_clerk {
    label: "Clerk ID"
    type: string
    sql: ${TABLE}."L_CLERK" ;;
  }
  dimension: l_commitdatekey {
    label: "Commit Date Key"
    type: number
    sql: ${TABLE}."L_COMMITDATEKEY" ;;
  }
  dimension: l_custkey {
    label: "Customer Key"
    type: number
    sql: ${TABLE}."L_CUSTKEY" ;;
  }
  dimension: l_discount {
    label: "Discount"
    type: number
    sql: ${TABLE}."L_DISCOUNT" ;;
  }
  dimension: l_extendedprice {
    label: "Extended Price"
    type: number
    sql: ${TABLE}."L_EXTENDEDPRICE" ;;
  }
  dimension: l_linenumber {
    label: "Line Number"
    type: number
    sql: ${TABLE}."L_LINENUMBER" ;;
  }
  dimension: l_orderdatekey {
    label: "Order Date Key"
    type: number
    sql: ${TABLE}."L_ORDERDATEKEY" ;;
  }
  dimension: l_orderkey {
    label: "Order Key"
    type: number
    sql: ${TABLE}."L_ORDERKEY" ;;
  }
  dimension: l_orderpriority {
    label: "Order Priority"
    type: string
    sql: ${TABLE}."L_ORDERPRIORITY" ;;
  }
  dimension: l_orderstatus {
    label: "Order Status"
    type: string
    sql: ${TABLE}."L_ORDERSTATUS" ;;
  }
  dimension: l_partkey {
    label: "Part Key"
    type: number
    sql: ${TABLE}."L_PARTKEY" ;;
  }
  dimension: l_quantity {
    label: "Quantity"
    type: number
    sql: ${TABLE}."L_QUANTITY" ;;
  }
  dimension: l_receiptdatekey {
    label: "Reciept Date Key"
    type: number
    sql: ${TABLE}."L_RECEIPTDATEKEY" ;;
  }
  dimension: l_returnflag {
    label: "Return Flag"
    type: string
    sql: ${TABLE}."L_RETURNFLAG" ;;
  }
  dimension: l_shipdatekey {
    label: "Shippment Date Key"
    type: number
    sql: ${TABLE}."L_SHIPDATEKEY" ;;
  }
  dimension: l_shipinstruct {
    label: "Shippment Instruction"
    type: string
    sql: ${TABLE}."L_SHIPINSTRUCT" ;;
  }
  dimension: l_shipmode {
    label: "Shippment Mode"
    type: string
    sql: ${TABLE}."L_SHIPMODE" ;;
  }
  dimension: l_shippriority {
    label: "Shippment Priority"
    type: number
    sql: ${TABLE}."L_SHIPPRIORITY" ;;
  }
  dimension: l_suppkey {
    label: "Supply Key"
    type: number
    sql: ${TABLE}."L_SUPPKEY" ;;
  }
  dimension: l_supplycost {
    label: "Supply Cost"
    type: number
    sql: ${TABLE}."L_SUPPLYCOST" ;;
  }
  dimension: l_tax {
    label: "Tax"
    type: number
    sql: ${TABLE}."L_TAX" ;;
  }
  dimension: l_totalprice {
    label: "Total Price"
    type: number
    sql: ${TABLE}."L_TOTALPRICE" ;;
  }

#Measures
  measure: total_count {
    type: count
  }
  measure: total_sale_price {
    label: "Total Sale Price"
    description: "Total sales from items sold"
    type:  sum
    sql: ${l_totalprice} ;;
    value_format_name: usd
  }
  measure: average_sale_price {
    label: "Average Sale Price"
    description: "Average sale price of items sold"
    type: average
    sql: ${l_totalprice} ;;
    value_format_name: usd
  }
  measure: cumulative_total_sales {
    label: "Cumulative Total Sales"
    description: "Cumulative total sales from items sold (also known as a running total)"
    type: running_total
    sql: ${total_sale_price} ;;
    value_format_name: usd
  }
  measure: total_sale_price_by_air {
    label: "Total Sale Price by Air"
    description: "Total sales of items shipped by air"
    type:  sum
    sql: ${l_totalprice} ;;
    filters: [l_shipmode: "AIR"]
    value_format_name: usd
  }
  measure: total_canada_sales {
    label: "Total Canada Sales"
    description: "Total sales by customers from Canada"
    type: sum
    sql: ${l_totalprice}  ;;
    filters: [d_customer.c_nation: "CANADA"]
    value_format_name: usd
  }
  measure: total_gross_revenue {
    label: "Total Gross Revenue"
    description: "Total price of completed sales"
    type: sum
    filters: [l_orderstatus: "F"]
    sql: ${l_totalprice} ;;
    value_format_name: usd
  }
  measure: total_cost {
    label: "Total Cost"
    description: "Total cost of items sold"
    type: sum
    sql: ${l_supplycost} ;;
    value_format_name: usd
  }
  measure: total_gross_margin_amount {
    label: "Total Gross Margin Amount"
    description: "Total Gross Revenue – Total Cost"
    type: number
    sql: ${total_gross_revenue} - ${total_cost} ;;
    value_format_name: usd
  }
  measure: gross_margin_percentage {
    label: "Gross Margin Percentage"
    description: "Total Gross Margin Amount / Total Gross Revenue"
    sql: ${total_gross_margin_amount} / NULLIF(${total_gross_revenue},0) ;;
    value_format_name: percent_2
  }
  measure: total_items_returned {
    label: "Number of Items Returned"
    description: "Number of items that were returned by dissatisfied customers"
    type:  sum
    sql: ${l_quantity} ;;
    filters: [l_returnflag: "R" ]
  }
  measure: total_items_sold {
    label: "Total Number of Items Sold"
    description: "Number of items that were sold"
    type: sum
    sql: ${l_quantity} ;;
  }
  measure: items_return_rate {
    label: "Item Return Rate"
    description: "Number Of Items Returned / Total Number Of Items Sold"
    type: number
    sql: ${total_items_returned} / NULLIF(${total_items_sold},0) ;;
    value_format_name: decimal_2
  }
  measure: total_customers_count {
    hidden:  yes
    type: count_distinct
    sql: ${l_custkey} ;;
  }
  measure: avg_spend_per_customer {
    label: "Average Spend per Customer"
    description: "Total Sale Price / Total Number of Customers"
    sql: ${total_sale_price} / NULLIF(${total_customers_count},0) ;;
    value_format_name: usd
  }
}
