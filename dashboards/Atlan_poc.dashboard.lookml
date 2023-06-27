- dashboard: atlan_poc
  title: Atlan POC
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: XeXyjcHLyqTW9i6ywgzmrH
  elements:

  - title: Distribution by Model Year and Make Name for Cargo
    name: Distribution by Model Year and Make Name for Cargo
    model: atlan_poc
    explore: atlan_poc
    type: looker_column
    fields: [atlan_poc_ext.vehicle_count, atlan_poc.model_year, ymm_md.make_name]
    pivots: [ymm_md.make_name]
    filters:
      atlan_poc.current_flg: 'Yes'
      vehicle_type_d.veh_type_name: "%Cargo%"

      atlan_poc.model_year: 20%
    sorts: [ymm_md.make_name, atlan_poc.model_year]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    series_types: {}
    series_colors: {}
    defaults_version: 1
    row: 0
    col: 8
    width: 16
    height: 9
  - title: Make Name - Mismatch across tables
    name: Make Name - Mismatch across tables
    model: atlan_poc
    explore: atlan_poc
    type: looker_grid
    fields: [atlan_poc.make_descr, ymms_md.make_name, ymm_md.make_name, atlan_poc_ext.vehicle_count]
    filters:
      mismatch_across_tables: '1'
    sorts: [atlan_poc_ext.vehicle_count desc 0]
    limit: 500
    total: true
    dynamic_fields: [{category: dimension, expression: 'if(${atlan_poc.make_descr}!=coalesce(${ymms_md.make_name},"empty"),
          1,if(${atlan_poc.make_descr} != coalesce(${ymm_md.make_name},"empty"),1,0))',
        label: Mismatch across tables, value_format: !!null '', value_format_name: !!null '',
        dimension: mismatch_across_tables, _kind_hint: dimension, _type_hint: number}]
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      atlan_poc.make_descr: VEHICLE_D
      ymm_md.make_name: YMM_MD
      ymms_md.make_name: YMMS_MD
      atlan_poc_ext.vehicle_count: VIN Count
    series_cell_visualizations:
      atlan_poc_ext.vehicle_count:
        is_active: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    row: 0
    col: 0
    width: 8
    height: 9
  - title: Every single field in a table for red cars
    name: Every single field in a table for red cars
    model: atlan_poc
    explore: atlan_poc
    type: looker_grid
    fields: [atlan_poc.brake_type, atlan_poc.country_code, atlan_poc.current_flg,
      atlan_poc.default_currency_indicator, atlan_poc.cylinder_config, atlan_poc.drive_train,
      atlan_poc.exterior_color, atlan_poc.fleet_status, atlan_poc.fleet_status_code,
      atlan_poc.fleet_status_description, atlan_poc.fleet_status_filter, atlan_poc.fuel_type,
      atlan_poc.gross_veh_weight, atlan_poc.gross_veh_weight_rating_num, atlan_poc.gross_veh_weight_ratio,
      atlan_poc.gross_veh_weight_ratio_edit, atlan_poc.gross_veh_weight_ratio_spec,
      atlan_poc.horsepower, atlan_poc.interior_color, atlan_poc.license_plate_country,
      atlan_poc.license_plate_expiration, atlan_poc.license_plate_number, atlan_poc.license_plate_state,
      atlan_poc.license_plate_type, atlan_poc.make_descr, atlan_poc.make_number, atlan_poc.model_descr,
      atlan_poc.model_number, atlan_poc.model_year, atlan_poc.months_to_license_plate_expiration,
      atlan_poc.num_of_cylinders, atlan_poc.num_of_passengers, atlan_poc.passenger_edit_num,
      atlan_poc.passenger_edit_code, atlan_poc.series_descr, atlan_poc.series_id,
      atlan_poc.series_number, atlan_poc.source_system_id, atlan_poc.style_name, atlan_poc.total_factory_inv,
      atlan_poc.total_factory_msrp, atlan_poc.trailer_flag, atlan_poc.transmission,
      atlan_poc.user_entered_exp_annual_miles, atlan_poc.vehicle_id, atlan_poc.veh_type_name,
      atlan_poc.veh_type_parent, atlan_poc.veh_type_report_name, atlan_poc.veh_type_number,
      atlan_poc.vin, atlan_poc_ext.average_model_year, atlan_poc_ext.median_model_year,
      atlan_poc_ext.vehicle_count, vehicle_type_d.veh_type_name, vehicle_type_d.veh_type_number,
      vehicle_type_d.veh_type_parent, vehicle_type_d.veh_type_report_name, ymm_md.country_code,
      ymm_md.make_name, ymm_md.make_number, ymm_md.model_name, ymm_md.model_number,
      ymm_md.model_year, ymms_md.country_code, ymms_md.est_lead_time_2, ymms_md.est_lead_time_end_days,
      ymms_md.est_lead_time_1, ymms_md.lead_time_range_weeks, ymms_md.make_name, ymms_md.make_number,
      ymms_md.model_name, ymms_md.model_number, ymms_md.model_year, ymms_md.series_name,
      ymms_md.series_id, ymms_md.series_number, ymms_md.category_descr, ymms_md.vehicle_size_code,
      ymms_md.vehicle_size_short_descr]
    filters:
      atlan_poc.exterior_color: "%Red%"
    sorts: [atlan_poc.license_plate_expiration desc]
    limit: 500
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_cell_visualizations:
      atlan_poc_ext.average_model_year:
        is_active: true
    defaults_version: 1
    row: 9
    col: 0
    width: 24
    height: 7
