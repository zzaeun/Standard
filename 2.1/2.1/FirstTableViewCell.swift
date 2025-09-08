import UIKit
import SnapKit

class FirstTableViewCell: UITableViewCell {
    static let identifier = "FirstTableViewCell"
            
    let dataLabel = UILabel()
    let dataButton = UIButton()

    
    weak var delegate: FirstTableViewCellDelegate?
    
    // UI 설정
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        setConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        [dataLabel, dataButton].forEach {
            contentView.addSubview($0)
        }
            dataButton.setTitle("데이터 추가", for: .normal)
            dataButton.backgroundColor = .red
            dataButton.setTitleColor(.white, for: .normal)
            dataButton.addTarget(self, action: #selector(didTapDataButton), for: .touchUpInside)
        }
    
    func setConstraints() {
        dataLabel.snp.makeConstraints { make in
            make.top.trailing.leading.equalToSuperview().inset(16)
        }
        
        dataButton.snp.makeConstraints { make in
            make.top.equalTo(dataLabel.snp.bottom).offset(16)
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.height.equalToSuperview().inset(25)
        }
    }

    func configure(data: String) {
        dataLabel.text = data
    }
    
    @objc
    func didTapDataButton() {
        let data = dataLabel.text ?? ""
        delegate?.didTapButton(data: data)
    }
}
