# Foursquare API Use

import requests # library to handle requests
import pandas as pd # library for data analsysis
import numpy as np # library to handle data in a vectorized manner
import random # library for random number generation

#!conda install -c conda-forge geopy --yes 
from geopy.geocoders import Nominatim # module to convert an address into latitude and longitude values

# libraries for displaying images
from IPython.display import Image 
from IPython.core.display import HTML 
    
# tranforming json file into a pandas dataframe library
from pandas.io.json import json_normalize

#!conda install -c conda-forge folium=0.5.0 --yes
import folium # plotting library

print('Folium installed')
print('Libraries imported.')


CLIENT_ID = 'QA0RTU3OQOYH5PU5GK1C4PXGZZFLW5LDAHZKZL5LZXMSX3QL' # your Foursquare ID
CLIENT_SECRET = '5OMNOGI10KJXVGWRTOIETTVMFSAU3Y32LA2OF2DQ0GP0SFSH' # your Foursquare Secret
VERSION = '20200716'
LIMIT = 30
print('Your credentails:')
print('CLIENT_ID: ' + CLIENT_ID)
print('CLIENT_SECRET:' + CLIENT_SECRET)


address = '102 North End Ave, New York, NY'


geolocator = Nominatim(user_agent="foursquare_agent")
location=geolocator.geocode(address)
latitude=location.latitude
longtitude=location.longitude
print('Latitude',latitude, 'Longitude',longtitude)

# Search for specific venue category


# Foursquare API no longer supports requests that do not pass in a version parameter.
# endpoint = 'https://api.foursquare.com/v2/venues/search'
# header={"client_id":CLIENT_ID,'client_secret':CLIENT_SECRET}
# parm={"client_id":CLIENT_ID,'client_secret':CLIENT_SECRET,'ll':ll,'limit':100,'radius':500}
# r=requests.get(endpoint,params=parm)
# r.text
# print(r.status_code)

search_query = 'Italian'
radius = 500
url = 'https://api.foursquare.com/v2/venues/search?client_id={}&client_secret={}&ll={},{}&v={}&query={}&radius={}&limit={}'.format(CLIENT_ID, CLIENT_SECRET, latitude, longtitude, VERSION, search_query, radius, LIMIT)
results=requests.get(url).json()
print(results)
print(results['response']['venues'])
venue=results['response']['venues']

# transform venues into a dataframe
dataframe=json_normalize(venue)
dataframe.head()


# keep only columns that include venue name, and anything that is associated with location
filtered_columns=['name','categories']+[col for col in dataframe.columns if col.startswith('location.')]+'id'
dataframe_filter=dataframe.loc[:filtered_columns]

# function extracts the categories of the venue
def get_category_type(row):
    try:
        categories_list=row['categoreis']
    except:
        categories_list=row['venue.categoreis']
    if len(categories_list)==0:
        return None
    else:
        return categories_list[0]['name']

dataframe_filter['categories']=dataframe_filter.apply(get_category_type,axis=1)
