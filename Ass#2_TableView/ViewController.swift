

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var students = [Student.init("Abayev Tamirlan","87767932706" , UIImage.init(named:                      "male")!),
                    Student.init("Elamanova Aigerim", "87056048688",UIImage.init(named: "female")!)
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? CustomCell
        cell?.studentName.text = students[indexPath.row].name_surname
        cell?.studentNumber.text = students[indexPath.row].number
        cell?.studentImage.image = students[indexPath.row].image
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    @IBAction func Pressed(_ sender: Any) {
        
        let addVC = self.storyboard?.instantiateViewController(identifier: "AddViewController") as! AddViewController
        addVC.myProtocol = self
        navigationController?.pushViewController(addVC, animated: true)
         
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        if segue.identifier == "mySegue"{
        
        let index = (myTableView.indexPathForSelectedRow?.row)!
        let destination = segue.destination as! DetailViewController
        destination.name_surname = students[index].name_surname
        destination.number = students[index].number
        destination.image = students[index].image
        destination.indexcurrent = index
        destination.myProtocol2=self
        }
        
        
        
        
//        else if segue.identifier == "mySegue2" {
//            
//            let destination2 = segue.destination as! AddViewController
//            
//            
//        }
        
    }
    
//    func deleteContact(index: Int) {
//                    self.students.remove(at: index)
//                    myTableView.reloadData()
//    }
    
   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                students.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
}



extension ViewController: UserProtocol {
    
    
    func addUser(nameSurname:String,phoneNumber:String,gender:String) {
        let newUser = Student.init(nameSurname, phoneNumber, UIImage.init(named: gender)!)
        
        students.append(newUser)
        myTableView.reloadData()
//        print(nameSurname,phoneNumber)
    }
    
    
    func deleteContact(nameSurname:String,phoneNumber:String,index: Int) {
        
        students.remove(at: index)
        myTableView.reloadData()
        }
}
