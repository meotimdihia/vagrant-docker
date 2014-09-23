GET /mobgame/log_logins/_search?search_type=count
{
    "query": {
      "range" : {
        "created" : {
            "gte": "2014-04-01",
            "lte": "now"
        }
      }
    },  
   "aggs": {
      "dau": {
         "date_histogram": {
            "field": "created",
            "interval": "month",
            "min_doc_count" : 0,
            "extended_bounds" : {
                "min" : "2014-06-01",
                "max" : "2014-12-31"
            }
         },
         "aggs": {
                "distinct_user_id" : {
                    "cardinality" : {
                      "field" : "user_id",
                      "precision_threshold" : 40000
                    }
                }
          }
      }
   }
}
