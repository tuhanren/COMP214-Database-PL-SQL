import urllib.request
from html.parser import HTMLParser

# TODO: use for handle star tag
metacount = 0

# TODO: inherent existing class
class MyHTMLParser(HTMLParser):
    # over writing existing methods 
    def handle_comment(self, data):
        print("Encountered comment: ", data)
        pos = self.getpos()
        print("\tAt line: ", pos[0], " position ", pos[1])
    #TODO: add more handler functions

    def handle_starttag(self, tag, attrs):
        # use global variable 
        global metacount
        if tag == "meta":
            metacount += 1
        print("Encountered comment: ", tag)
        pos = self.getpos()
        print("\tAt line: ", pos[0], " position ", pos[1])
        # TODO: dunder
        if attrs.__len__() > 0:
            print("\tAttributes: ")
            for a in attrs:
                # the attribute name = value 
                print("\t", a[0], "=", a[1])

    def handle_endtag(self, tag):
        print("Encountered tag: ", tag)
        pos = self.getpos()
        print("\tAt line: ", pos[0], " position ", pos[1])
    def handle_data(self, data):
        # TODO: do not print white space
        if (data.isspace()):
            return
        print("Encountered data: ", data)
        pos = self.getpos()
        print("\tAt line: ", pos[0], " position ", pos[1])

def mainUseParser():
    # instantiate the parser and feed it with some HTML
    parser = MyHTMLParser()
    webUrl = urllib.request.urlopen("https://www.baidu.com/")
    if webUrl.getcode() == 200:
        contents = webUrl.read()
        # TODO: make the contents as string
        parser.feed(str(contents))
    # f = open("some.html")
    # if f.mode == "r":
    #     contents = f.read()
    #     parser.feed(contents)
if __name__ == "__main__":
    mainUseParser();
    print(f"Meta tags found: {metacount}")
