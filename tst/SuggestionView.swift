//
//  SuggestionView.swift
//  tst
//
//  Created by Takuya Okamoto on 2015/09/09.
//  Copyright © 2015年 Uniface. All rights reserved.
//

import UIKit

class SuggestionView: UIView {
    init(frame: CGRect, articles: [QiitaArticle]) {
        super.init(frame:frame)
        
        let verticalMargin: CGFloat = 10
        let horizontalMargin: CGFloat = 10
        
        let labelHeight = ((frame.height - verticalMargin * CGFloat(articles.count + 1)) / CGFloat(articles.count))
        let labelWidth = frame.width - horizontalMargin * 2
        
        var i = 0
        for article in articles {
            let label = UILabel()
            label.frame = CGRect()
            label.frame.x = horizontalMargin
            label.frame.width = labelWidth
            label.frame.y = verticalMargin + (labelHeight + verticalMargin) * CGFloat(i)
            label.frame.height = labelHeight
            label.text = article.title
            label.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
            self.addSubview(label)
            i++
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
