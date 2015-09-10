//
//  ViewController.swift
//  tst
//
//  Created by Takuya Okamoto on 2015/09/08.
//  Copyright © 2015年 Uniface. All rights reserved.
//

import UIKit
import Bond
import SwiftyJSON
import RealmSwift

class ViewController: UIViewController, tapToGetQiitaArticles {
    
    var suggestionView: SuggestionView? = nil
    let numOfSuggestion = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let refreshButton = UIButton()
        refreshButton.frame = CGRect(x: 44, y: 44, width: 88, height: 44)
        refreshButton.setTitle("refresh", forState: .Normal)
        refreshButton.backgroundColor = UIColor.greenColor().colorWithAlphaComponent(0.2)
        view.addSubview(refreshButton)
        startTapToGetStream(refreshButton.bnd_tap).next()
    }
    
    func didGetNewArticle(var articles:[QiitaArticle]) {
        let dispArticles: [QiitaArticle] = articles.removeRandom(numOfSuggestion)
        if self.suggestionView == nil {
            dispatch_async(dispatch_get_main_queue()) {
                self.addSuggestionView(dispArticles)
            }
        }
        else {
            // update view
        }
    }
    
    
    func addSuggestionView(suggestArticles:[QiitaArticle]) {
        let headerMargin: CGFloat = 44
        var suggestionViewFrame = self.view.frame
        suggestionViewFrame.y = headerMargin
        suggestionViewFrame.height -= headerMargin
        self.suggestionView = SuggestionView(frame: suggestionViewFrame, articles: suggestArticles)
        self.view.addSubview(self.suggestionView!)
    }
}

