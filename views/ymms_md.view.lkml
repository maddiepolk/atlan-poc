view: ymms_md {
  sql_table_name: @{schema}."YMMS_MD"
    ;;

  dimension: ymms_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}."YMMS_WID" ;;
    primary_key: yes
    hidden: yes
  }

  dimension: category_descr {
    type: string
    sql: ${TABLE}."CATEGORY_DESCR" ;;
    label: "vehicle_category_descr"
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}."COUNTRY_CODE" ;;
    label: "vehicle_country_code"
  }

  dimension: current_flg {
    type: yesno
    hidden: yes
    sql: ${TABLE}."CURRENT_FLG" = 1;;
  }

  dimension: delete_flg {
    type: yesno
    hidden: yes
    sql: ${TABLE}."DELETE_FLG" = 1;;
  }

  dimension_group: effective_from_dt {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."EFFECTIVE_FROM_DT" ;;
  }

  dimension_group: effective_to_dt {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."EFFECTIVE_TO_DT" ;;
  }

  dimension: est_lead_time_1 {
    type: string
    sql: case when ${TABLE}."EST_LEAD_TIME_1" = '-' then null else ${TABLE}."EST_LEAD_TIME_1" end ;;
    label: "est_lead_time_1"

  }

  dimension: est_lead_time_2 {
    type: number
    sql: cast(case when ${TABLE}."EST_LEAD_TIME_2" = '-' then null else ${TABLE}."EST_LEAD_TIME_2" end as integer) ;;
    label: "est_lead_time_2"
  }

  dimension: est_lead_time_end_days {
    type: number
    sql: ${est_lead_time_2}*7 ;;
    label: "est_lead_time_end_days"
  }

  dimension: lead_time_range_weeks {
    type: string
    sql: ${est_lead_time_1}||' - '||${est_lead_time_2} ;;
    label: "lead_time_range_weeks"
  }

  dimension_group: etl_load_dt {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."ETL_LOAD_DT" ;;
  }

  dimension: make_name {
    type: string
    sql: ${TABLE}."MAKE_NAME" ;;
    label: "make_descr"
  }

  dimension: make_number {
    type: number
    sql: ${TABLE}."MAKE_NUMBER" ;;
    label: "make_number"
  }

  dimension: model_name {
    type: string
    sql: ${TABLE}."MODEL_NAME" ;;
    label: "model_descr"
  }

  dimension: model_number {
    type: number
    sql: ${TABLE}."MODEL_NUMBER" ;;
    label: "model_number"
  }

  dimension: model_year {
    type: string
    sql: ${TABLE}."MODEL_YEAR" ;;
    label: "model_year"
    order_by_field: model_year_sort
  }

  dimension: model_year_sort {
    type: number
    sql: year(current_date()) - ${model_year} ;;
    hidden: yes
  }

  dimension: series_id {
    type: string
    sql: ${TABLE}."SERIES_ID" ;;
    label: "series_id"
  }

  dimension: series_name {
    type: string
    sql: ${TABLE}."SERIES_NAME" ;;
    label: "series_descr"
  }

  dimension: series_number {
    type: number
    sql: ${TABLE}."SERIES_NUMBER" ;;
    label: "series_number"
  }

  dimension: vehicle_size_code {
    type: string
    sql: ${TABLE}."VEHICLE_SIZE_CODE" ;;
    label: "vehicle_size_code"
  }

  dimension: vehicle_size_short_descr {
    type: string
    sql: ${TABLE}."VEHICLE_SIZE_SHORT_DESCR" ;;
    label: "vehicle_size_short_descr"
  }

}
