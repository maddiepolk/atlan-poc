view: vehicle_d {
  sql_table_name: @{schema}."VEHICLE_D"
    ;;

  dimension: vehicle_wid {
    type: number
    primary_key: yes
    hidden: yes
    value_format_name: id
    sql: ${TABLE}."VEHICLE_WID" ;;
  }

  dimension: brake_type {
    type: string
    sql: ${TABLE}."BRAKE_TYPE" ;;
    label: "brake_type"
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}."COUNTRY_CODE" ;;
    label: "country_code"
  }

  dimension: current_flg {
    type: yesno
    sql: ${TABLE}."CURRENT_FLG" = 1 ;;
    label: "current_flg"
  }

  dimension: cylinder_config {
    type: string
    sql: ${TABLE}."CYLINDER_CONFIG" ;;
    label: "cylinder_config"
  }

  dimension: delete_flg {
    type: yesno
    sql: ${TABLE}."DELETE_FLG" = 1;;
    hidden: yes
  }

# derived RPD
  dimension: default_currency_indicator {
    type: string
    sql: case
          when ${license_plate_country} is null then null
          when  ${license_plate_country} = 'CAN' then 'CAD'
          else 'USA' end ;;
    label: "default_currency_indicator"
  }

  dimension: drive_train {
    type: string
    sql: ${TABLE}."DRIVE_TRAIN" ;;
    label: "drive_train"
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

  dimension: exterior_color {
    type: string
    sql: ${TABLE}."EXTERIOR_COLOR" ;;
    label: "exterior_color"
  }

  dimension: fleet_status {
    type: string
    sql: ${TABLE}."FLEET_STATUS" ;;
    label: "fleet_status"
  }

# derived RPD
  dimension: fleet_status_code {
    type: string
    sql: case
          when ${fleet_status} = 'NL'
            then 'COV'
          when ${fleet_status} = 'NLA'
            then 'COVA'
          else ${fleet_status}
        end  ;;
    label: "fleet_status_code"
  }

# derived RPD
  dimension: fleet_status_description {
    type: string
    sql: case
          when ${fleet_status} = 'NL'
            then 'Client-Owned'
          when ${fleet_status} = 'NLA'
            then 'Client-Owned with Ancillaries'
          when ${fleet_status} = 'NV'
            then 'Non-Vehicle'
          when ${fleet_status} = 'NVP'
            then 'Non-Vehicle with Ancillaries'
          when ${fleet_status} = 'L'
            then 'Leased Vehicle'
          else 'Unknown'   end
    ;;
    label: "fleet_status_description"
  }

  # derived OBIEE
  dimension: fleet_status_filter {
    type: string
    sql: case when ${fleet_status_code} = 'L' then 'Leased (L)'
        when ${fleet_status_code} = 'COVA' then 'Customer Owned with Ancillaries (COVA)'
        when ${fleet_status_code} = 'COV' then 'Customer Owned (COV)'
        else null end;;
    description: "Include/Exclude vehicles by status (L, COV, COVA)"
    # view_label: "OBIEE Derived Fields"
    label: "fleet_status_filter"
  }

  dimension: fuel_type {
    type: string
    sql: ${TABLE}."FUEL_TYPE" ;;
    label: "fuel_type"
  }

  dimension: gross_veh_weight {
    type: number
    sql: ${TABLE}."GROSS_VEH_WEIGHT" ;;
    label: "gross_veh_weight"
  }

  dimension: gross_veh_weight_rating_num {
    type: number
    sql: ${TABLE}."GROSS_VEH_WEIGHT_RATING_NUM" ;;
    label: "gross_veh_weight_rating_num"
  }

  dimension: gross_veh_weight_ratio {
    type: string
    sql: ${TABLE}."GROSS_VEH_WEIGHT_RATIO" ;;
    label: "gross_veh_weight_ratio"
  }

  dimension: gross_veh_weight_ratio_edit {
    type: number
    sql: ${TABLE}."GROSS_VEH_WEIGHT_RATIO_EDIT" ;;
    label: "gross_veh_weight_ratio_edit"
  }

  dimension: gross_veh_weight_ratio_spec {
    type: number
    sql: ${TABLE}."GROSS_VEH_WEIGHT_RATIO_SPEC" ;;
    label: "gross_veh_weight_ratio_spec"
  }

  dimension: horsepower {
    type: number
    sql: ${TABLE}."HORSEPOWER" ;;
    label: "horsepower"
  }

  dimension: interior_color {
    type: string
    sql: ${TABLE}."INTERIOR_COLOR" ;;
    label: "interior_color"
  }

# derived RPD
  dimension: license_plate_country {
    type: string
    sql: case  when ${license_plate_state} is null then NULL
          when ${license_plate_state} in ('AB', 'BC', 'MB', 'NB', 'NL', 'NS', 'NT', 'NU', 'ON', 'PE', 'QC', 'SK', 'YT') then 'CAN'
          else 'USA' end  ;;
    label: "license_plate_country"
  }

  dimension: license_plate_expiration {
    type: date
    sql: ${TABLE}."LICENSE_PLATE_EXPIRATION_DT" ;;
    label: "license_plate_expiration"
    html: @{date_format} ;;
  }

  dimension: months_to_license_plate_expiration {
    type: number
    description: "This is a calculation being used to evaluate Atlan's reading of Looker-level calculated fields"
    sql: case when substring(${license_plate_expiration},0,4) = 2099 or substring(${license_plate_expiration},0,4) = 9999 then null else datediff(month, current_date(), ${license_plate_expiration}) end ;;
  }

  dimension: license_plate_number {
    type: string
    sql: ${TABLE}."LICENSE_PLATE_NUMBER" ;;
    label: "license_plate_number"
  }

  dimension: license_plate_state {
    type: string
    sql: ${TABLE}."LICENSE_PLATE_STATE" ;;
    label: "license_plate_state"
  }

  dimension: license_plate_type {
    type: string
    sql: ${TABLE}."LICENSE_PLATE_TYPE" ;;
    label: "license_plate_type"
  }

  dimension: make_descr {
    type: string
    label: "make_descr"
    sql: ${TABLE}."MAKE_DESCR" ;;
  }

  dimension: make_number {
    type: number
    sql: ${TABLE}."MAKE_NUMBER" ;;
    label: "make_number"
  }

  dimension: model_descr {
    type: string
    sql: ${TABLE}."MODEL_DESCR" ;;
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

  dimension: num_of_cylinders {
    type: number
    sql: ${TABLE}."NUM_OF_CYLINDERS" ;;
    label: "num_of_cylinders"
  }

  dimension: num_of_passengers {
    type: number
    sql: ${TABLE}."NUM_OF_PASSENGERS" ;;
    label: "num_of_passengers"
  }

  dimension: passenger_edit_code {
    type: string
    sql: ${TABLE}."PASSENGER_EDIT_CODE" ;;
    label: "passenger_edit_code"

  }

  dimension: passenger_edit_num {
    type: number
    sql: ${TABLE}."PASSENGER_EDIT_NUM" ;;
    label: "passenger_edit_num"
  }

  dimension: series_descr {
    type: string
    sql: ${TABLE}."SERIES_DESCR" ;;
    label: "series_descr"
  }

  dimension: series_id {
    type: string
    sql: ${TABLE}."SERIES_ID" ;;
    label: "series_id"
  }

  dimension: series_number {
    type: number
    sql: ${TABLE}."SERIES_NUMBER" ;;
    label: "series_number"
  }

  dimension: source_system_id {
    type: number
    sql: ${TABLE}."SOURCE_SYSTEM_ID" ;;
    label: "source_system_id"
  }

  dimension: style_name {
    type: string
    sql: ${TABLE}."STYLE_NAME" ;;
    label: "style_name"
  }

  dimension: total_factory_inv {
    type: number
    sql: ${TABLE}."TOTAL_FACTORY_INV" ;;
    label: "total_factory_inv"
  }

  dimension: total_factory_msrp {
    type: number
    sql: ${TABLE}."TOTAL_FACTORY_MSRP" ;;
    label: "total_factory_msrp"
    value_format_name: usd
  }

# derived RPD
  dimension: trailer_flag {
    type: string
    sql: case
      when  ${make_descr} like '%Trailer%' then 'Y'
      when   ${model_descr} like '%Trailer%' then 'Y'
      when  ${series_descr} like '%Trailer%' then 'Y'
      when  ${make_descr} like '%TRL%' then 'Y'
      when   ${model_descr} like '%TRL%' then 'Y'
      when  ${series_descr} like '%TRL%' then 'Y'
      else 'N'
      end ;;
    label: "trailer_flag"
  }

  dimension: transmission {
    type: string
    sql: ${TABLE}."TRANSMISSION" ;;
    label: "transmission"
  }

  dimension: user_entered_exp_annual_miles {
    type: number
    sql: ${TABLE}."USER_ENTERED_EXP_ANNUAL_MILES" ;;
    label: "user_entered_exp_annual_miles"
  }

  dimension: veh_type_name {
    type: string
    sql: ${TABLE}."VEH_TYPE_NAME" ;;
    label: "veh_type_name"
  }

  dimension: veh_type_number {
    type: number
    sql: ${TABLE}."VEH_TYPE_NUMBER" ;;
    label: "veh_type_number"
  }

  dimension: veh_type_parent {
    type: string
    sql: ${TABLE}."VEH_TYPE_PARENT" ;;
    label: "veh_type_parent"
  }

  dimension: veh_type_report_name {
    type: string
    sql: ${TABLE}."VEH_TYPE_REPORT_NAME" ;;
    label: "veh_type_report_name"
  }

  dimension: vehicle_id {
    type: number
    sql: ${TABLE}."VEHICLE_ID" ;;
    label: "vehicle_id"
  }

  dimension: vin {
    type: string
    label: "vin"
    sql: ${TABLE}."VIN" ;;
  }

}
