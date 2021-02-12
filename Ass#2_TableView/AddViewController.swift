

import UIKit

class AddViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    var myProtocol: UserProtocol?
    var gender = ["male","female"]
    var choosegender:String?
//    var entername_surname:String!
//    var enternumber:String!
//    var enterimage:UIImage!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        choosegender = gender[row]
        return gender[row]
    }
    

    @IBOutlet weak var enterName: UITextField!
    
    @IBOutlet weak var enterNumber: UITextField!
    
    
    let picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.center = view.center
        picker.dataSource = self
        picker.delegate = self
        self.view.addSubview(picker)
        
    }
    

    @IBAction func buttonSave(_ sender: Any) {
        
        myProtocol?.addUser(nameSurname: enterName.text!, phoneNumber: enterNumber.text!,gender:choosegender!)
        navigationController?.popViewController(animated: true)
}
}


