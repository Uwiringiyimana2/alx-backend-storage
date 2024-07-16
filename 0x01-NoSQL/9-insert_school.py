#!/usr/bin/env python3
""" inserts a new document in a collection based on kwarg"""
import pymongo


def insert_school(mongo_collection, **kwargs):
    """ inserts a new document in a collection based on kwarg"""
    new = mongo_collection.insert_one(kwargs)
    return new.inserted_id
