import getData
import credentials                                                     

city = credentials.city
api_key = credentials.api_key


json_data = getData.fetchJson(city, api_key)

temp = json_data['main']['temp'] - 273.15
des = json_data['weather'][0]['description']

print("  " + str(round(temp,1)) + "°C " + des.capitalize() + "  ")
