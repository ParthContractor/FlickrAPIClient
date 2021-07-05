import Foundation

final public class FlickrPhotosSearchClient: LoadJSONData {
    typealias T = FlickrResponseModel
    var methodName: MethodName = .photosSearch
    
    public init(){}
    
    /// Page starts from 1 and default limit set is 25. Keep calling for more records with same page number until total number of photos for that page reached
    /// track page number and total at presentation/app layer
    public func getPhotos(searchText: String, page: Int) -> FlickrResponseModel? {
        if let url = URL(string: str_API_Base_URL + "&api_key=\(str_API_Key)" + "&per_page=\(per_Page_Limit)" + "&text=\(searchText)" + "&page=\(page)" + "&method=\(methodName.rawValue)") {
            return self.loadJsonData(url)
        }
        return nil
    }
}
