

import UIKit

class DetailViewController: UIViewController {

    var myProtocol2: UserProtocol?
    var name_surname:String?
    var number:String?
    var image:UIImage?
    var indexcurrent:Int?

    @IBOutlet weak var aboutImage: UIImageView!
    
    @IBOutlet weak var aboutName: UILabel!

    @IBOutlet weak var aboutNumber: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aboutImage.image = image
        aboutName.text = name_surname
        aboutNumber.text = number
        
    }
    

    @IBAction func deleteButton(_ sender: Any) {
        myProtocol2?.deleteContact(nameSurname: name_surname!,phoneNumber: number!,index: indexcurrent!)
        navigationController?.popViewController(animated: true)
//        print(indexcurrent!)
    }
    
    
    
}
