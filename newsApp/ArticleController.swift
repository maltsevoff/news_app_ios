//
//  ArticleController.swift
//  newsApp
//
//  Created by Aleksandr Maltsev on 19.10.2019.
//  Copyright © 2019 Aleksandr Maltsev. All rights reserved.
//

import UIKit
import SwiftyJSON

class ArticleController: UIViewController {
	
	var articleNumber: Int?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if articleNumber != nil {
			imagesForArticle(index: articleNumber!)
		}
	}
}
