//
//  CountriesRequest.swift
//  CountriesExercise
//
//  Created by Marcell Fulop on 7/2/25.
//
import NetworkLayer

struct CountriesRequest: Request {
    var baseURL: String = "https://gist.githubusercontent.com/"
    var path: String = "peymano-wmt/32dcb892b06648910ddd40406e37fdab/" +
    "raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json"
    var httpMethod: HttpMethod = .get
    var params: [String : String] = [:]
    var header: [String : String] = [:]
    static func createRequest() -> CountriesRequest {
        return CountriesRequest()
    }
    
}
