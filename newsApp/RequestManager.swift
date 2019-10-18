//
//  RequestManager.swift
//  newsApp
//
//  Created by Aleksandr Maltsev on 18.10.2019.
//  Copyright © 2019 Aleksandr Maltsev. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class RequestManager {
	
	private let apiKey = "ljGvO44YKHpS4hUn3GG2I5nNH6NscttG"
	private let period = 30
	
	func getEmailed(completionHandler: @escaping([String]) -> Void) {
		let reqUrl = "https://api.nytimes.com/svc/mostpopular/v2/emailed/\(period).json?api-key=\(apiKey)"
		request(reqUrl).responseJSON(completionHandler: { response in
			if response.result.isSuccess {
				let dict = JSON(response.value!)
				let titles = self.parseData(data: dict)
				completionHandler(titles)
			}
			})
	}
	
	func getShared() {
		let reqUrl = "https://api.nytimes.com/svc/mostpopular/v2/shared/\(period).json?api-key=\(apiKey)"
		request(reqUrl).responseJSON(completionHandler: { response in
			if response.result.isSuccess {
				print(response)
			}
			})
	}
	
	func getViewed() {
		let reqUrl = "https://api.nytimes.com/svc/mostpopular/v2/viewed/\(period).json?api-key=\(apiKey)"
		request(reqUrl).responseJSON(completionHandler: { response in
			if response.result.isSuccess {
				print(response)
			}
			})
	}
	
	func parseData(data: JSON) -> [String] {
		guard let array = data["results"].array else { return []}
		var resArray: [String] = []
		for element in array {
			guard let title = element["title"].string else { continue }
			resArray.append(title)
		}
		return resArray
	}
}
