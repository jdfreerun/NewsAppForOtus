//
//  TableCell.swift
//  NewsAppForOtus
//
//  Created by Albert Fayzullin on 25.08.2022.
//

import UIKit

class TableCell: UITableViewCell {
    var posts: Datum?
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLbale: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
   
    
    func setupItem(item: Datum) {
        dateLabel.text = item.date
        titleLbale.text = item.title
        authorLabel.text = item.author
    }

}
