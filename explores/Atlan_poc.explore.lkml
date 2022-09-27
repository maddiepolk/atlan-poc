include: "/views/*.lkml"

explore: atlan_poc {
  from: vehicle_d
  sql_table_name: efm_dw.vehicle_d ;;
  view_label: "vehicle_d"
  label: "Atlan POC"

  join: atlan_poc_ext {
    sql: ;;
    view_label: "vehicle_d"
    relationship: one_to_one
  }

  join: ymms_md {
    view_label: "ymms_md"
    sql_table_name: efm_dw.ymms_md ;;
    sql_on: ${atlan_poc.model_year} = ${ymms_md.model_year}
            and ${atlan_poc.model_descr} = ${ymms_md.model_name}
            and ${atlan_poc.make_descr} = ${ymms_md.make_name}
            and ${atlan_poc.series_id} = ${ymms_md.series_id}
            and ${atlan_poc.current_flg} = ${ymms_md.current_flg}
    ;;
    relationship: many_to_one
  }

  join: ymm_md {
    view_label: "ymm_md"
    sql_table_name: efm_dw.ymm_md ;;
    sql_on: ${atlan_poc.model_year} = ${ymm_md.model_year}
      and ${atlan_poc.model_descr} = ${ymm_md.model_name}
      and ${atlan_poc.make_descr} = ${ymm_md.make_name}
      and ${atlan_poc.current_flg} = ${ymm_md.current_flg}
      ;;
    relationship: many_to_one
  }

  join: vehicle_type_d {
    view_label: "vehicle_type_d"
    sql_table_name: efm_dw.vehicle_type_d ;;
    sql_on: ${atlan_poc.veh_type_name} = ${vehicle_type_d.veh_type_name}
    and ${atlan_poc.veh_type_number} = ${vehicle_type_d.veh_type_number} ;;
    relationship: many_to_one
  }

}
