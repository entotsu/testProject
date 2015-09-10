//
//  QiitaAPI.swift
//  tst
//
//  Created by Takuya Okamoto on 2015/09/09.
//  Copyright © 2015年 Uniface. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import RealmSwift

class QiitaArticle: Object {
    dynamic var title = ""
    dynamic var url = ""
}



/**
# QiitaAPI
This is test
* afae
* aefae
* afaefa

aa aaa aa

> tets

```
test
```
*/
class QiitaAPI {
    static func randomURL() -> String {
        let page: Int = Int(arc4random_uniform(100) + 1)
        return "http://qiita.com/api/v2/tags/swift/items?page=\(page)&per_page=10"
    }
    static func fetchArticlesJSON(url: String, onSuccess:(JSON)->()) {
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: sessionConfig)
        let task = session.dataTaskWithURL(NSURL(string: url)!) { data, response, error in
            do {
                let nsJson = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
                let json = JSON(nsJson)
                onSuccess(json)
            } catch {
                print("Error")
            }
        }
        task.resume()
    }
    
    static func fetchArticles(url:String, onSuccess:([QiitaArticle]->Void)) {
        var articles: [QiitaArticle] = []
        fetchArticlesJSON(url) { json in
            for item in json {
                let (_, data) = item
                if let title:String = data["title"].stringValue, url:String = data["url"].stringValue {
                    let article = QiitaArticle()
                    article.title = title
                    article.url = url
                    articles.append(article)
                }
            }
            onSuccess(articles)
        }
    }
}



