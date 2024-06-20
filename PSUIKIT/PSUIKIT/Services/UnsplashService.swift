//
//  UnsplashService.swift
//  PSUIKIT
//
//  Created by Jedidiaz Fagundez on 19/06/24.
//

import Foundation
import Alamofire

final class UnsplashService {
    
    //MARK: - Variables
    static let kShared = UnsplashService()
    private let kURL = "https://api.unsplash.com/search/photos?page=1&client_id=ZaU7ZMg2TxMmWbAws5wIs8IfdHBuTyw0a5U_kLqZA_I&per_page=20"
    private let kHeaders: HTTPHeaders = [
        "Authorization": "ZaU7ZMg2TxMmWbAws5wIs8IfdHBuTyw0a5U_kLqZA_I",
        "Accept": "application/json",
        "Accept-Version": "v1"
    ]
    private let kStatusOk = 200...299
    
    //MARK: - Functions
    func getImagesTo (query: String, success: @escaping (_ image: [ImageObject]) -> (), failure: @escaping (_ error: Error?) -> ()) {
        AF.request("\(kURL)&query=\(query)", method: .get, headers: kHeaders)
            .validate(statusCode: kStatusOk)
            .responseDecodable(of: UnsplashResponse.self) { response in
                switch response.result {
                case .success(let value):
                    success(value.results ?? [])
                case .failure(let error):
                    failure(error)
                }
            }
    }
}
