view: delivery_calls {
  sql_table_name: demos.delivery_calls ;;

  dimension_group: call {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.call_date ;;
  }

  dimension: call_day_of_week {
    type: string
    sql: ${TABLE}.call_day_of_week ;;
  }

  dimension: call_time_tier {
    type: string
    sql: ${TABLE}.call_time_tier ;;
  }

  dimension: addr_sido {
    type: string
    sql: SUBSTR(${TABLE}.addr_sido, 1, 2) ;;
#     sql: ${TABLE}.addr_sido ;;
  }

  dimension: addr_gungu {
    type: string
    sql: ${TABLE}.addr_gungu ;;
  }

  dimension: addr_dong {
    type: string
    sql: ${TABLE}.addr_dong ;;
  }

  dimension: delivery_item {
    type: string
    sql: ${TABLE}.delivery_item ;;
  }

  dimension: call_cnt {
    type: number
    sql: ${TABLE}.call_cnt ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_calls_china {
    type: sum
    sql: CASE WHEN  ${TABLE}.delivery_item = '중국음식' THEN ${TABLE}.call_cnt ELSE 0 END ;;
  }

  measure: total_calls_chicken {
    type:sum
    sql: CASE WHEN  ${TABLE}.delivery_item = '치킨' THEN ${TABLE}.call_cnt ELSE 0 END ;;
  }

  measure: total_calls_pizza {
    type: sum
    sql: CASE WHEN  ${TABLE}.delivery_item = '피자' THEN ${TABLE}.call_cnt ELSE 0 END ;;
  }

  measure: total_calls_pork {
    type: sum
    sql: CASE WHEN  ${TABLE}.delivery_item = '족발/보쌈' THEN ${TABLE}.call_cnt ELSE 0 END ;;
  }

  measure: total_calls {
    type: sum
    sql: ${call_cnt} ;;
  }
}
