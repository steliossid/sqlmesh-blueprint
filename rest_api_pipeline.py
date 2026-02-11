import dlt
from dlt.sources.rest_api import rest_api_source

crypto_config = {
    "client": {
        "base_url": "https://api.coingecko.com/api/v3/",
    },
    "resource_defaults": {
        "write_disposition": "replace",
        "endpoint": {
            "params": {
                "vs_currency": "usd",
                "order": "market_cap_desc",
                "per_page": 100,
            },
        },
    },
    "resources": [
        {
            "name": "crypto_markets",
            "endpoint": "coins/markets",
        }
    ],
}

crypto_source = rest_api_source(crypto_config)

# 3. Create and run the pipeline
pipeline = dlt.pipeline(
    pipeline_name="crypto_tracker",
    destination="duckdb",
    dataset_name="market_data"
)

if __name__ == "__main__":
    load_info = pipeline.run(crypto_source)
    print(load_info)
