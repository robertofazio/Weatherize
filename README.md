Weatherize
==========


Triangle represents a mysterious basic shape used in symbolic patterns across cultures and times. 
It shows the four Elements: Earth, Water, Fire and Air also representing the regularity of a stable element and the irregularity of 
a more elusive and intangible thing.

The triangle as the time: mysterious, uncertain and uncontrollable.
This shape is the most important factor in Weatherize, which is able to visualize meteorological data coming from user selected cities.
The amount of triangles represents local temperature, the color represents weather conditions, 
the degree of opacity represents the local humidity and the speed of movement represents wind speed.

The code was entirely written in Processing, an open source programming language. 

It consists of six main parts:

*****************
- The composition of the grid through keyboard commands or interface IPAD build with TouchOSC. The grid informations are stored into two text edit file, lineV.txt and lineO.txt
- Receiving data from Twitter. We used the java library for the Twitter API  ( http://twitter4j.org/en/index.html ) . With Twitter4J, you can easily integrate your Java application with the Twitter service. 
- Detection-time data via RSS feeds from Yahoo (http://developer.yahoo.com/weather/) The Twitter API functionality uses an oAuth system, which allows people to authenticate applications through a login at twitter.com. More info here ( http://blog.blprnt.com/blog/blprnt/updated-quick-tutorial-processing-twitter ) . It's recommended to replace the right authorization codes in order to run correctly weatherize
- Creation of triangles with different attributes
- Upload screenshots of the remote server triggered the arrival of a tweet. We used a DataUpload java class developed by Philippe Lhoste  - PhiLho(a)GMX.net 
- Color palette for the moment decided arbitrarily.

*****************

The development of Weatherize is not yet completed (we're currently in a late Alpha and we'll release a stable Beta a.s.a.p) 
but have been conceived various possible uses thanks to its adaptability. 

It could be thought as an interactive projection on a particular object or building or you could create
an installation in a room that allows the user to enjoy an immersive experience, 
as if he were in the city he has chosen. After this experience, user can be gifted with a printed postcard, his unique personal "weatherize".

 Weatherize online : www.robertofazio.com/weatherize/online
 
 more info at www.robertofazio.com