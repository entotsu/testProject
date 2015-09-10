//
//  CacheArticles.swift
//  tst
//
//  Created by Takuya Okamoto on 2015/09/09.
//  Copyright © 2015年 Uniface. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON





protocol Cache {
}
extension Cache {
    func cacheArticles(articles:[QiitaArticle]) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            autoreleasepool {
                let realm = self.inMemoryRealmForCache()
                realm.beginWrite()
                for article in articles {
                        let cache = QiitaArticle()
                        cache.title = article.title
                        cache.url = article.url
                        realm.add(cache, update: false)
                        print("📥 \(cache.title)")
                }
                try! realm.commitWrite()
                print(self.readCachedArticles())
            }
        }
    }
    func inMemoryRealmForCache() -> Realm {
        return try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "cacheJson"))
    }
    func readCachedArticles() -> Results<(QiitaArticle)> {
        return inMemoryRealmForCache().objects(QiitaArticle)
    }
}


