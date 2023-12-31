//
//  MockUrlSession.swift
//  NYSchoolsTests
//
//  Created by Dustin Pavy on 9/8/23.
//

import Foundation
@testable import NYSchools

class MockUrlSession: NetworkManagerSessionable {
    private var mockData: Data!
    private var urlResponse: URLResponse!
    private var error: Error?

    func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        if error != nil {
            throw error!
        }

        return (mockData, urlResponse)
    }

    func setError(error: Error) {
        self.error = error
    }

    func setMockData(data: Data) {
        self.mockData = data
    }

    func setUrlResponse(urlResponse :URLResponse) {
        self.urlResponse = urlResponse
    }

}
