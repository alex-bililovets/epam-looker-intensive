view: d_supplier {
  sql_table_name: "DATA_MART"."D_SUPPLIER" ;;

#Dimesions
  dimension: s_acctbal {
    label: "Supplier Actual Balance"
    type: number
    sql: ${TABLE}."S_ACCTBAL" ;;
  }
  dimension: s_address {
    label: "Supplier Address"
    type: string
    sql: ${TABLE}."S_ADDRESS" ;;
  }
  dimension: s_name {
    label: "Supplier Name"
    type: string
    sql: ${TABLE}."S_NAME" ;;
  }
  dimension: s_nation {
    label: "Supplier nation"
    type: string
    sql: ${TABLE}."S_NATION" ;;
  }
  dimension: s_phone {
    label: "Supplier Phone"
    type: string
    sql: ${TABLE}."S_PHONE" ;;
  }
  dimension: s_region {
    label: "Supplier Region"
    type: string
    sql: ${TABLE}."S_REGION" ;;
  }
  dimension: s_suppkey {
    label: "Supplier Key"
    type: number
    sql: ${TABLE}."S_SUPPKEY" ;;
  }
  dimension: cohort_supplier_by_accbalance {
    label: "Suppliers by Account Balance"
    description: "Cohort of suppliers according to Account Balance: <= 0, 1—3000, 3001—5000, 5001—7000, 7000 <"
    type: tier
    tiers: [0, 3000, 5000, 7000]
    sql: ${s_acctbal}  ;;
    value_format_name: usd
  }

#Measures
  measure: count {
    type: count
    drill_fields: [s_name]
  }
}
