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

class ViewController: UIViewController, tapToGetQiitaArticles, SuggestionViewControllerDesign {
    
    var suggestionView: SuggestionView? = nil
    let numOfSuggestion = 3

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.brownColor()
        let (refreshButton, testButton) = addSubviews()
        startTapToGetStream(refreshButton.bnd_tap).next()
        
        testButton.addTarget(self, action: "onTapTestButton", forControlEvents: .TouchUpInside)
    }
    
    func onTapTestButton() {
        print("ontaptestbutton")
    }
    
    func didGetNewArticle(var articles:[QiitaArticle]) {
        let dispArticles: [QiitaArticle] = articles.removeRandom(numOfSuggestion)
        if self.suggestionView == nil {
            dispatch_async(dispatch_get_main_queue()) {
                self.suggestionView = self.addSuggestionView(dispArticles)
            }
        }
        else {
            // TODO: update view
        }
    }
}

