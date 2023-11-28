view: d_customer {
  sql_table_name: "DATA_MART"."D_CUSTOMER" ;;

#Dimensions
  dimension: c_address {
    label: "Customer Address"
    type: string
    sql: ${TABLE}."C_ADDRESS" ;;
  }
  dimension: c_custkey {
    label: "Customer Key"
    type: number
    sql: ${TABLE}."C_CUSTKEY" ;;
  }
  dimension: c_mktsegment {
    label: "Customer Mkt Segment"
    type: number
    sql: ${TABLE}."C_MKTSEGMENT" ;;
  }
  dimension: c_name {
    label: "Customer Name"
    type: string
    sql: ${TABLE}."C_NAME" ;;
  }
  dimension: c_nation {
    label: "Customer Nation"
    type: string
    sql: ${TABLE}."C_NATION" ;;
  }
  dimension: c_phone {
    label: "Customer Phone"
    type: string
    sql: ${TABLE}."C_PHONE" ;;
  }
  dimension: c_region {
    label: "Customer Region"
    type: string
    sql: ${TABLE}."C_REGION" ;;
    link: {
      label: "Go to Target Dashboard"
      url: "https://epam.cloud.looker.com/dashboards/287?Customer+Region={{rendered_value}}"
    }
  }

#Measures
  measure: c_count {
    label: "Customer Count"
    type: count
    drill_fields: [c_name]
  }
}
