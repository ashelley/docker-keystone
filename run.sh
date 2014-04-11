#!/bin/bash
docker run -i -t -d -p 3000:3000 --link mongodb:mongodb --name keystonejs adam/keystonejs
