# Voyages Geo Networks

Flask microservice for generating geographic network visualizations for the SlaveVoyages.org project.

## Overview

This service runs NetworkX and Pandas to build splined geographic sankey maps that are aggregated in a weighted manner on shared routes.

## Functionality

When initialized for the first time, for voyages and people, at region and place levels (a total of 4 runs):

* Creates a basic geographic network in NetworkX
* Requests relevant geo data from the voyages-api service
* Pulls the full itinerary for:
  * The class in question (voyages or people)
  * At the resolution in question (regions or places)
* For each entity:
  * Draws the full, splined path
  * Stores the touched nodes and edges in a dataframe
* At the end of each run:
  * Loads the full dataframe into memory
  * Dumps the results to a pickle file under /tmp

**Performance**: Initial run can take ~15 minutes. Subsequent runs load pickles into memory in about 2 seconds.

## Requirements

* Python 3.x
* Flask
* NetworkX
* Pandas
* Access to voyages-api service

## Setup

1. Copy the default settings:
   ```bash
   cp localsettings.py-default localsettings.py
   ```

2. Configure the API endpoint and authentication in `localsettings.py`

3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

4. Run the service:
   ```bash
   python app.py
   ```

## API Endpoints

The service exposes Flask endpoints for retrieving geographic network data. Default port: 5005

## Building Routes

To rebuild map routes (can take some time):
```bash
flask pickle rebuild
```
