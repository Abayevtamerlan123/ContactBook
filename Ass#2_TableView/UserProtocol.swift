
import Foundation

protocol UserProtocol {
    
    func addUser(nameSurname:String, phoneNumber:String,gender:String)
    func deleteContact(nameSurname:String,phoneNumber:String,index: Int)
}
