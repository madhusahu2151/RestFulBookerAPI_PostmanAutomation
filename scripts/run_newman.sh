#!/bin/bash

newman run RestFulBooker.postman_collection.json -e environments/qa.json -r htmlextra --reporter-htmlextra-showEnvironmentData
