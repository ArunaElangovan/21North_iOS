import UIKit

class CountryView: UIView {
    
//    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryCodeLabel: UILabel!
    @IBOutlet weak var flagLabel: UILabel!
//    var pickFlag = [String]()
//    pickFlag.append(getFlag(country: "DE"))
//    pickFlag.append(getFlag(country: "IN"))
//
//    pickFlag[row]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(country: Country) {
        if let countryCode = country.code {
            flagLabel.text = Helper.getFlag(country: countryCode)
        }
        
        countryNameLabel.text = country.name
        countryCodeLabel.text = country.phoneCode
    }

}
