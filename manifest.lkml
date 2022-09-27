project_name: "enterprisefleetmanagement"

localization_settings: {
  default_locale: en
  localization_level: permissive
}

constant: date_format {
  value: "{{ rendered_value | date: \"%m/%d/%Y\" }}"
}

constant: eom_last_month {
  value: "last_day(dateadd(month,-1,CURRENT_DATE()))"
}

constant: current_date {
  value: "CURRENT_DATE()"
}

constant: fiscal_year_start {
  value: "2021-08-01"
}

constant: schema {
  # value: "LEGACY"
  value: "EFM_DW"
}

constant: org_list {
  value: "('66','77','98','1B','1C','1E','1F','1G','1H','1J','1K','1M','1N','1P','1Q','1R','1S','1T','1U','1V','1X','1Y','1Z','2C','2D','2F','2M','2N','2P','2Q','2R','2S','2T','2U','2V','2W','2Z','3C','3D','3E','3F','3G','3H','3J','3N','CB','CG','CW','CZ','F9','IT','MT')"
}
