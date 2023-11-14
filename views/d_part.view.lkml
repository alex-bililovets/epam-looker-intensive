view: d_part {
  sql_table_name: "DATA_MART"."D_PART" ;;

#Dimension
  dimension: p_brand {
    label: "Part Brand"
    type: string
    sql: ${TABLE}."P_BRAND" ;;
  }
  dimension: p_mfgr {
    label: "Part MFGR"
    type: string
    sql: ${TABLE}."P_MFGR" ;;
  }
  dimension: p_name {
    label: "Part Name"
    type: string
    sql: ${TABLE}."P_NAME" ;;
  }
  dimension: p_partkey {
    label: "Part Key"
    type: number
    sql: ${TABLE}."P_PARTKEY" ;;
  }
  dimension: p_size {
    label: "Part Size"
    type: number
    sql: ${TABLE}."P_SIZE" ;;
  }
  dimension: p_type {
    label: "Part Type"
    type: string
    sql: ${TABLE}."P_TYPE" ;;
  }

#Measures
  measure: count {
    type: count
    drill_fields: [p_name]
  }
}
