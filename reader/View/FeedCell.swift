import UIKit
import Foundation

class FeedCell: UICollectionViewCell {
    
    var post: Post? {
        didSet {
            
            if let name = post?.name {
                
                let attributedText = NSMutableAttributedString(string: name, attributes: [NSFontAttributeName: UIFont.boldSystemFontOfSize(14)])
                
                attributedText.appendAttributedString(NSAttributedString(string: "\nDecember 18  •  San Francisco ", attributes: [NSFontAttributeName: UIFont.systemFontOfSize(12), NSForegroundColorAttributeName:
                    UIColor.rgb(155, green: 161, blue: 161)]))
                
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.lineSpacing = 4
                
                attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.characters.count))
                
                nameLabel.attributedText = attributedText
                
            }
            
            if let statusText = post?.statusText {
                statusTextView.text = statusText
            }
            
            if let profileImagename = post?.profileImageName {
                profileImageView.image = UIImage(named: profileImagename)
            }
            
            if let statusImageName = post?.statusImageName {
                statusImageView.image = UIImage(named: statusImageName)
            }
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        
        
        
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "zuckprofile")
        imageView.contentMode = .ScaleAspectFit
        return imageView
    }()
    
    let statusTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Beast turned to the dark side"
        textView.font = UIFont.systemFontOfSize(14)
        textView.scrollEnabled = false
        textView.userInteractionEnabled = false
        
        return textView
    }()
    
    let titleTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Beast turned to the dark side"
        textView.font = UIFont.systemFontOfSize(26)
        textView.scrollEnabled = false
        textView.userInteractionEnabled = false
        textView.textColor = UIColor.whiteColor()
        textView.backgroundColor = UIColor.clearColor()
        
        return textView
    }()
    
    let statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "zuckdog")
        imageView.contentMode = .ScaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    
    func setupViews() {
        backgroundColor = UIColor.whiteColor()
        
        addSubview(statusImageView)
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(statusTextView)
        addSubview(titleTextView)
        
        // Horizontal constraints
        addConstraintsWithFormat("H:|-8-[v0(44)]-8-[v1]|", views: profileImageView, nameLabel)
        
        addConstraintsWithFormat("H:|-4-[v0]-4-|", views: statusTextView)
        
        addConstraintsWithFormat("H:|[v0]|", views: statusImageView)
        
        addConstraintsWithFormat("H:|[v0]|", views: titleTextView)
        
        // Vertical constrains
        addConstraintsWithFormat("V:|[v0(200)]-8-[v1(44)]-4-[v2]|", views: statusImageView, profileImageView, statusTextView)
        
        addConstraintsWithFormat("V:|[v0]-8-[v1(44)]", views: statusImageView, nameLabel)
        
        addConstraintsWithFormat("V:[v0]-8-[v1]", views: titleTextView, nameLabel)
        
    }
    
}
