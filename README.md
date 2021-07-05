# FlickrAPIClient

A description of this package.
This swift package is created for consuming Flickr APIs and exposing relevant methods for application layer.
This  package is scalable to expose more methods of Flickr.
* List of exposed methods as below mentioned.
* getPhotos with (searchText and pageNumber params)
  * This  is useful to search all photos with any text.
  * Also, it gives opportunity to load more(for pagination) images by tracking "pageNumber" and "total photos" from application layer.


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

* Scope of Improvement/enhancements
  * More APIs of flickr can be analysed and client can be enhanced to keep it generic and exposing more flickr methods.
  * Creating generic framewrork for image search capability regardess of API provider; this can further be achieved by abstracting flickr models and exposing facade with presentation layer models only. 
