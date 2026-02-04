#!/bin/bash

newman run RestFulBooker.postman_collection.json -e QA.postman_environment.json -r htmlextra --reporter-htmlextra-showEnvironmentData
