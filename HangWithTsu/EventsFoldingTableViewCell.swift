//
//  EventsFoldingTableViewCell.swift
//  HangWithTsu
//
//  Created by Alexander Tsu on 5/5/16.
//  Copyright © 2016 Alexander Tsu. All rights reserved.
//

import UIKit
import FoldingCell

class EventsFoldingTableViewCell: FoldingCell {

    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func animationDuration(itemIndex:NSInteger, type:AnimationType)-> NSTimeInterval {
        
        // durations count equal it itemCount
        let durations = [0.33, 0.26, 0.26] // timing animation for each view
        return durations[itemIndex]
    }
}
