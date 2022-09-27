view: vehicle_type_d {
  sql_table_name: @{schema}."VEHICLE_TYPE_D"
    ;;

  dimension: vehicle_type_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}."VEHICLE_TYPE_WID" ;;
    hidden: yes
    primary_key: yes
  }

  dimension: current_flg {
    type: number
    sql: ${TABLE}."CURRENT_FLG" ;;
    hidden: yes
  }

  dimension: delete_flg {
    type: number
    sql: ${TABLE}."DELETE_FLG" ;;
    hidden: yes
  }

  dimension_group: effective_from_dt {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.CAST(${TABLE}."EFFECTIVE_FROM_DT" AS TIMESTAMP_NTZ) ;;
    hidden: yes
  }

  dimension_group: effective_to_dt {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.CAST(${TABLE}."EFFECTIVE_TO_DT" AS TIMESTAMP_NTZ) ;;
    hidden: yes
  }

  dimension_group: etl_load_dt {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.CAST(${TABLE}."ETL_LOAD_DT" AS TIMESTAMP_NTZ) ;;
    hidden: yes
  }

  dimension: veh_type_name {
    type: string
    sql: ${TABLE}."VEH_TYPE_NAME" ;;
  }

  dimension: veh_type_number {
    type: number
    sql: ${TABLE}."VEH_TYPE_NUMBER" ;;
  }

  dimension: veh_type_parent {
    type: string
    sql: ${TABLE}."VEH_TYPE_PARENT" ;;
  }

  dimension: veh_type_report_name {
    type: string
    sql: ${TABLE}."VEH_TYPE_REPORT_NAME" ;;
  }

}
