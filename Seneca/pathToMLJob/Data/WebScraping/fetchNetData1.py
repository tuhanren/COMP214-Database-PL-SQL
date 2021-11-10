import urllib.request
# use json module to work with this type of data
import json
# TODO: PYTHON documentation for JSON encoder decoder 

def printResultsGeoJSON(data):
    #TODO: get the json as dict
    # load json into dict
    theJSON = json.loads(data)
    if theJSON['metadata']: 
    # TODO: based on the default format of GeoJSON (https://earthquake.usgs.gov/earthquakes/feed/v1.0/geojson.php)
        if ("title" in theJSON["metadata"] ):
            print(theJSON["metadata"]["title"])
        count = theJSON["metadata"]["count"]
        print(f"{count} events recorded.")

        for i in theJSON["features"]:
            print(i["properties"]["place"])

        print("----------\n", "Events that were felt.")

        for i in theJSON["features"]:
            feltTimes = i["properties"]["felt"]
            # TODO: how to get not null and not 0 counts
            if feltTimes != None:
                if feltTimes > 0:
                    print("%5.1f" % feltTimes + " times reported.")


def testRequest():
    # TODO: the process is similar with local file open and read,
    # webUrl = urllib.request.urlopen("http://www.baidu.com")

    # earthquake data
    webUrl = urllib.request.urlopen("https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson")
    # getcode 200 means everything ok
    # 404 not found 
    returnCode = webUrl.getcode()
    print(f"Result Code: {returnCode}")
    if returnCode == 200:
        data = webUrl.read()
        printResultsGeoJSON(data)
    else:
        print("Error.")

if __name__ == "__main__":
    testRequest()   