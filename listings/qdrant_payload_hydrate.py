# src/storage/chunk_store.py
QDRANT_PAYLOAD_FIELDS = ("chunk_id", "paper_id", "year", "primary_category", "section_type")

# src/indexing/qdrant_manager.py: insert_chunks excerpt
payload = {k: c.get(k) for k in QDRANT_PAYLOAD_FIELDS if c.get(k) is not None}
payload["chunk_id"] = raw_id

# src/indexing/qdrant_manager.py: _hydrate
def _hydrate(self, rows: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
    """Fill chunk text/metadata from silver/chunks/ for payloads that no longer carry it."""
    need = [r for r in rows if "text" not in r and r.get("chunk_id")]
    if not need:
        return rows
    try:
        full = {r["chunk_id"]: r for r in self.chunk_store.hydrate(need)}
    except Exception as e:
        logger.error("[Qdrant] chunk hydration from Silver failed: %s", e)
        return rows
    return [full.get(r.get("chunk_id"), r) if "text" not in r else r for r in rows]
