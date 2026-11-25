# src/ingestion/queue_consumer.py: gold_batch excerpt
chunk_failed_years = set()
# ... chunks grouped by year before this excerpt ...
for year, year_chunks in by_year.items():
    try:
        part = self.chunk_store.append_part(year_chunks, year=year)
        # ... telemetry omitted ...
    except Exception as e:
        chunk_failed_years.add(year)
        logger.error("[Worker][Chunks] Failed writing year=%s chunk part: %s", year, e)

# ... bookkeeping omitted ...
for msg, rec, chunks in chunked:
    if _year_of(rec) in chunk_failed_years:
        failed.append((msg, "silver chunk write failed"))
        continue
    try:
        # ... embeddings / refresh handling omitted ...
        if chunks:
            for c, vec in zip(chunks, vecs):
                c["vector"] = vec
            self.qdrant.insert_chunks(chunks)
        # ... bookkeeping omitted ...
    except Exception as e:
        failed.append((msg, f"gold: {e}"))
