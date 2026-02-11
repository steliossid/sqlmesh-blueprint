MODEL (
  kind INCREMENTAL_BY_TIME_RANGE (
    time_column _dlt_load_time,
  ),
);

SELECT
  CAST(c.id AS TEXT) AS id,
  CAST(c.symbol AS TEXT) AS symbol,
  CAST(c.name AS TEXT) AS name,
  CAST(c.image AS TEXT) AS image,
  CAST(c.current_price AS BIGINT) AS current_price,
  CAST(c.market_cap AS BIGINT) AS market_cap,
  CAST(c.market_cap_rank AS BIGINT) AS market_cap_rank,
  CAST(c.fully_diluted_valuation AS BIGINT) AS fully_diluted_valuation,
  CAST(c.total_volume AS BIGINT) AS total_volume,
  CAST(c.high_24h AS BIGINT) AS high_24h,
  CAST(c.low_24h AS BIGINT) AS low_24h,
  CAST(c.price_change_24h AS DOUBLE) AS price_change_24h,
  CAST(c.price_change_percentage_24h AS DOUBLE) AS price_change_percentage_24h,
  CAST(c.market_cap_change_24h AS BIGINT) AS market_cap_change_24h,
  CAST(c.market_cap_change_percentage_24h AS DOUBLE) AS market_cap_change_percentage_24h,
  CAST(c.circulating_supply AS DOUBLE) AS circulating_supply,
  CAST(c.total_supply AS DOUBLE) AS total_supply,
  CAST(c.max_supply AS DOUBLE) AS max_supply,
  CAST(c.ath AS BIGINT) AS ath,
  CAST(c.ath_change_percentage AS DOUBLE) AS ath_change_percentage,
  CAST(c.ath_date AS TIMESTAMP) AS ath_date,
  CAST(c.atl AS DOUBLE) AS atl,
  CAST(c.atl_change_percentage AS DOUBLE) AS atl_change_percentage,
  CAST(c.atl_date AS TIMESTAMP) AS atl_date,
  CAST(c.last_updated AS TIMESTAMP) AS last_updated,
  CAST(c._dlt_load_id AS TEXT) AS _dlt_load_id,
  CAST(c._dlt_id AS TEXT) AS _dlt_id,
  CAST(c.current_price__v_double AS DOUBLE) AS current_price__v_double,
  CAST(c.high_24h__v_double AS DOUBLE) AS high_24h__v_double,
  CAST(c.low_24h__v_double AS DOUBLE) AS low_24h__v_double,
  CAST(c.ath__v_double AS DOUBLE) AS ath__v_double,
  CAST(c.roi__times AS DOUBLE) AS roi__times,
  CAST(c.roi__currency AS TEXT) AS roi__currency,
  CAST(c.roi__percentage AS DOUBLE) AS roi__percentage,
  CAST(c.market_cap_change_24h__v_double AS DOUBLE) AS market_cap_change_24h__v_double,
  CAST(c.total_volume__v_double AS DOUBLE) AS total_volume__v_double,
  TO_TIMESTAMP(CAST(c._dlt_load_id AS DOUBLE)) as _dlt_load_time
FROM
  market_data.crypto_markets as c
WHERE
  TO_TIMESTAMP(CAST(c._dlt_load_id AS DOUBLE)) BETWEEN @start_ds AND @end_ds
