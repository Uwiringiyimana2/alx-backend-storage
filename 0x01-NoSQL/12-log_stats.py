#!/usr/bin/env python3
"""provides some stats about Nginx logs stored in MongoDB"""
import pymongo
from pymongo import MongoClient


if __name__ == "__main__":
    client = MongoClient("mongodb://127.0.0.1:27017")
    nginx_collections = client.logs.nginx
    x = nginx_collections.count_documents({})
    methods = ["GET", "POST", "PUT", "PATCH", "DELETE"]
    print(f"{x} logs")
    print("Methods:")
    for method in methods:
        res = nginx_collections.count_documents({"method": method})
        print(f"\tmethod {method}: {res}")

    status_count = nginx_collections.count_documents(
            {"method": "GET", "path": "/status"})
    print("{} status check".format(status_count))
