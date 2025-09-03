import UIKit
import SnapKit

class FirstTableViewCell: UITableViewCell {
        var dataLabel = UILabel()
    
    func configure(data: String) {
        dataLabel.text = data
    }
}
