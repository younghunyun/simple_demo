connection: "youn_cloudsql_demos"

# include all the views
include: "/views/**/*.view"

datagroup: simple_demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: simple_demo_default_datagroup

explore: delivery_calls {
  join: seoul_weather {
    type: inner
    sql_on: ${delivery_calls.addr_sido} = ${seoul_weather.sido}
      AND ${delivery_calls.addr_gungu} = ${seoul_weather.gungu}
      AND SUBSTR(${delivery_calls.addr_dong}, 0, 2) = ${seoul_weather.dong}
      AND ${delivery_calls.call_date} = ${seoul_weather.date_date}
      AND ${delivery_calls.call_time_tier} = ${seoul_weather.hour} ;;
    relationship: one_to_one
  }
}

explore: seoul_households {}

explore: seoul_population {}

explore: seoul_weather {
  hidden: yes
}
