import xml.dom.minidom

def mainXML():
    # TODO: to load and parse xml
    doc = xml.dom.minidom.parse("somexml.xml")
    # print out document 
    print(doc.nodeName)
    print(doc.firstChild.tagName)

    # get a list of XML tags
    # "skill" can be something else 
    aList = doc.getElementsByTagName("skill")
    print("%d A list of the same tag: " % aList.length)
    for anItem in aList:
        # TODO: "name" can be something else
        print(anItem.getAttribute("name"))

    # create a new XML tag and add it into the document 
    newItem = doc.createElement("skill")
    newItem.setAttribute("name", "R-language")
    doc.firstchild.appendChild(newItem)

if __name__ == "__main__":
    mainXML()