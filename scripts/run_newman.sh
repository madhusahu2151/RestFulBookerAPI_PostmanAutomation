#!/bin/bash

newman run RestFulBooker.postman_collection.json -e qa.json -r htmlextra --reporter-htmlextra-showEnvironmentData
