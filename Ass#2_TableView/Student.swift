
import Foundation
import  UIKit

class  Student {
    
    var name_surname:String?
    var number: String?
    var image:UIImage?
    
    init(_ name_surname:String,_ number:String,_ image:UIImage) {
        self.name_surname = name_surname
        self.number = number
        self.image = image
    }
}
