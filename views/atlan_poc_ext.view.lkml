
view: atlan_poc_ext {

  measure: vehicle_count {
    type: count_distinct
    sql: ${atlan_poc.vin} ;;
  }

  measure: average_model_year {
    type: average
    sql: ${atlan_poc.model_year} ;;
  }

  measure: median_model_year {
    type: median
    sql: ${atlan_poc.model_year} ;;
  }

}
