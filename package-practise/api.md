


# RESTful API

## Please be note, different API has different url format. You need to check official document. 

You communicate with the database via groups and endpoints in the form of a **Uniform Resource Identifier (URI)** 

https://api.foursquare.com/v2/venues/search?client_id=xxxx&client_secret=xxx&v=20200716&||=40.73,-74&query=coffee
- Group: venues
  - Venue --> Unique ID, Name, Location, Category
- endpoint: Search,Explore
- Crentials.  CLient ID, CLient Secret, Version -- a date
- search endpoints.
- Result: Get JSON data

When create the URI, only need to change parameter. 

Another Example
- https://api.foursquare.com/v2/venues/<unique ID>?client_id=xxxx&client_secret=xxx&v=20200716&||=40.73,-74&query=coffee
- tips of specific venue
  - https://api.foursquare.com/v2/venues/<unique ID>/tips?client_id=xxxx&client_secret=xxx&v=20200716&||=40.73,-74&query=coffee
- specific user
  - https://api.foursquare.com/v2/users/<unique ID>?client_id=xxxx&client_secret=xxx&v=20200716
- Explore Venues. ---> **different endpoint**
  - https://api.foursquare.com/v2/venues/explore?client_id=xxxx&client_secret=xxx&v=20200716&||=40.73,-74
- Trending venues. --- the popular been called
  - use trending endpoint
  - https://api.foursquare.com/v2/venues/trending?client_id=xxxx&client_secret=xxx&v=20200716&||=40.73,-74

Using the API such as yelp, Foursquare, we can:
1. Search for a specific type of venue around a given location -- regular
2. Learn more about a specific venue - Premium
3. Learn more about a specific Foursquare user - regular
4. Explore a given location - Regular
5. explore trending venue around location


# Coding
```

import requests # library to handle requests
import pandas as pd # library for data analsysis
import numpy as np # library to handle data in a vectorized manner
import random # library for random number generation

!conda install -c conda-forge geopy --yes 
from geopy.geocoders import Nominatim # module to convert an address into latitude and longitude values

# libraries for displaying images
from IPython.display import Image 
from IPython.core.display import HTML 
    
# tranforming json file into a pandas dataframe library
from pandas.io.json import json_normalize

!conda install -c conda-forge folium=0.5.0 --yes
import folium # plotting library

print('Folium installed')
print('Libraries imported.')


# Search for a specific venue category

https://api.foursquare.com/v2/venues/search?client_id=CLIENT_ID&client_secret=CLIENT_SECRET&ll=LATITUDE,LONGITUDE&v=VERSION&query=QUERY&radius=RADIUS&limit=LIMIT
result=requests.get(url).json()
