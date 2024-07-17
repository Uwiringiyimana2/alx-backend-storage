#!/usr/bin/env python3
"""Writing strings to Redis"""
import redis
import uuid
from typing import Union


class Cache:
    """class Cache"""
    def __init__(self) -> None:
        """Argument:
            _redis: an instance of the Redis client
        """
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, float]) -> str:
        """store the input data in Redis using the
        random key and return the key."""
        random_key = str(uuid.uuid4())
        self._redis.set(random_key, data)
        return random_key
