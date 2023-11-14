connection: "tpchlooker"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: looker_intensive12_oleksandr_bililovets_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: looker_intensive12_oleksandr_bililovets_default_datagroup

#Explores list
explore: d_customer {
  label: "Customer"
}

explore: d_dates {
  label: "Dates"
}

explore: d_part {
  label: "Part"
}

explore: d_supplier {
  label: "Supplier"
}

explore: f_lineitems {
  label: "Line Items"

  #Connections
  view_label: "Line Items"
  join: d_dates {
    view_label: "Dates"
    type: left_outer
    sql_on: ${f_lineitems.l_orderdatekey}=${d_dates.datekey} ;;
    relationship: many_to_many
  }
  join: d_part {
    view_label: "Part"
    type: left_outer
    sql_on: ${f_lineitems.l_orderdatekey}=${d_part.p_partkey} ;;
    relationship: many_to_one
  }
  join: d_customer {
    view_label: "Customer"
    type: left_outer
    sql_on: ${f_lineitems.l_orderdatekey}=${d_customer.c_custkey} ;;
    relationship: many_to_one
  }
  join:  d_supplier{
    view_label: "Suppliers"
    type:left_outer
    sql_on: ${f_lineitems.l_suppkey} = ${d_supplier.s_suppkey};;
    relationship: many_to_one
  }
}
