connection: "snowflake_connection"

label: "Atlan POC"

include: "/views/vehicle_d.view.lkml"
include: "/views/ymms_md.view.lkml"
include: "/views/ymm_md.view.lkml"
include: "/views/vehicle_type_d.view.lkml"
include: "/views/atlan_poc_ext.view.lkml"


include: "/explores/Atlan_poc.*.lkml"

include: "/dashboards/Atlan_poc.dashboard.lookml"
