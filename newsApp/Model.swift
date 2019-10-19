//
//  Model.swift
//  newsApp
//
//  Created by Aleksandr Maltsev on 18.10.2019.
//  Copyright © 2019 Aleksandr Maltsev. All rights reserved.
//

import UIKit
import SwiftyJSON

struct News {
	var title: String
	var imageUrl: String
	var publishedDate: String
	var articleData: JSON
}

var articles: [News] = []
