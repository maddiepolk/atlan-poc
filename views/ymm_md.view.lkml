
view: ymm_md {
  sql_table_name: @{schema}."YMM_MD"
    ;;

  dimension: ymm_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}."YMM_WID" ;;
    primary_key: yes
    hidden: yes
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}."COUNTRY_CODE" ;;
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

  dimension: make_name {
    type: string
    sql: ${TABLE}."MAKE_NAME" ;;
  }

  dimension: make_number {
    type: number
    sql: ${TABLE}."MAKE_NUMBER" ;;
  }

  dimension: model_name {
    type: string
    sql: ${TABLE}."MODEL_NAME" ;;
  }

  dimension: model_number {
    type: number
    sql: ${TABLE}."MODEL_NUMBER" ;;
  }

  dimension: model_year {
    type: number
    sql: ${TABLE}."MODEL_YEAR" ;;
  }

}
