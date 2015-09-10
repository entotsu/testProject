//
//  TapToGetStream.swift
//  tst
//
//  Created by Takuya Okamoto on 2015/09/09.
//  Copyright © 2015年 Uniface. All rights reserved.
//

import UIKit
import Bond
import SwiftyJSON


protocol tapToGetQiitaArticles: Cache {
    func didGetNewArticle(articles:[QiitaArticle])
}

extension tapToGetQiitaArticles {
    func startTapToGetStream(tapStream: EventProducer<Void>) -> EventProducer<Void> {
        let requestStream = tapStream.throttle(0.3, queue: Queue()).map({QiitaAPI.randomURL()})
        let responseStream :EventProducer<[QiitaArticle]> = EventProducer()
        tapStream.observe {
            print("👆")
        }
        requestStream.observe { url in
            print("📡")
            let isExistCache = false
            if isExistCache {
                // TODO: 🍓 キャッシュがあるときはキャッシュからとる(消してとる)ようにする
                //                self.didGetNewArticle(articles)
            }
            else {
                QiitaAPI.fetchArticles(url) { articles in
                    responseStream.next(articles)
                }
            }
        }
        responseStream.observe { articles in
            print("📨")
            self.didGetNewArticle(articles)
            self.cacheArticles(articles)
        }
        return tapStream
    }
}

