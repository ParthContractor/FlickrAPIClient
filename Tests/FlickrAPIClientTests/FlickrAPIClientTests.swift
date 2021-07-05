    import XCTest
    @testable import FlickrAPIClient

    final class FlickrAPIClientTests: XCTestCase, LoadJSONData {
        typealias T = FlickrResponseModel
        var methodName: MethodName = .photosSearch

        let flickrPhotosSearchClient = FlickrPhotosSearchClient()

        // MARK: - Load JSON Test Cases
        func testLoadJSONFileDataSuccess() {
            if let url = URL(string: str_API_Base_URL + "&api_key=\(str_API_Key)" + "&per_page=\(per_Page_Limit)" + "&text=river" + "&page=1" + "&method=\(methodName.rawValue)") {
                if let jsonData = self.loadJsonData(url){
                    XCTAssertNotNil(jsonData)
                    XCTAssertEqual(jsonData.photos?.photo?.count, per_Page_Limit)
                    XCTAssertNotNil(jsonData.photos?.photo?.first?.photoUrl)
                }
                else{
                    XCTFail("JSON could not be loaded")
                }
            }
            else{
                XCTFail("JSON could not be loaded")
            }
        }
        
        func testLoadJSONFileDataErrorInvalidAPIKey() {
            if let url = URL(string: str_API_Base_URL + "&per_page=\(per_Page_Limit)" + "&text=river" + "&page=1" + "&method=\(methodName.rawValue)") {
                if let jsonData = self.loadJsonData(url){
                    XCTAssertNotNil(jsonData)
                    XCTAssertEqual(jsonData.error,.invalidAPIKey)
                    XCTAssertNil(jsonData.photos?.photo?.first?.photoUrl)
                }
                else{
                    XCTFail("JSON could not be loaded")
                }
            }
            else{
                XCTFail("JSON could not be loaded")
            }
        }
        
        func testLoadJSONFileDataErrorParameterlessSearches() {
            if let url = URL(string: str_API_Base_URL + "&api_key=\(str_API_Key)" + "&per_page=\(per_Page_Limit)" + "&page=1" + "&method=\(methodName.rawValue)") {
                if let jsonData = self.loadJsonData(url){
                    XCTAssertNotNil(jsonData)
                    XCTAssertEqual(jsonData.error,.parameterlessSearches)
                }
                else{
                    XCTFail("JSON could not be loaded")
                }
            }
            else{
                XCTFail("JSON could not be loaded")
            }
        }
        
        func testLoadJSONFileDataErrorUnknownMethodName() {
            if let url = URL(string: str_API_Base_URL + "&api_key=\(str_API_Key)" + "&per_page=\(per_Page_Limit)" + "&page=1" + "&method=\(methodName)") {
                if let jsonData = self.loadJsonData(url){
                    XCTAssertNotNil(jsonData)
                    XCTAssertEqual(jsonData.error,.unknownMethod)
                }
                else{
                    XCTFail("JSON could not be loaded")
                }
            }
            else{
                XCTFail("JSON could not be loaded")
            }
        }
    }
