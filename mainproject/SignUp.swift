import UIKit
import Foundation


class SignUp: UIViewController {
    

    
    
    @IBAction func signup(_ sender: Any) {
    
    
    
    print("1")
        
        print("4")
        // 这个session可以使用刚才创建的。
        let session = URLSession(configuration: .default)
        // 设置URL
        let url = "https://a2054c9b.ngrok.io/rest-auth/registration/"
        var request = URLRequest(url: URL(string: "https://a2054c9b.ngrok.io/rest-auth/registration/")!)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        // 设置要post的内容，字典格式
        
        let postData = ["username":"fuck","Email":"10546026@ntub.edu.tw","password1":"asd12345678","password2":"asd12345678"]
        let postString = postData.compactMap({ (key, value) -> String in
            return "\(key)=\(value)"
        }).joined(separator: "&")
        request.httpBody = postString.data(using: .utf8)
        // 后面不解释了，和GET的注释一样
        print("5")
        let task = session.dataTask(with: request) {(data, response, error) in
            do {
                let r = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                print(r)
                print("2")
            } catch {
                print("无法连接到服务器")
                return
            }
        }
        task.resume()
        
        
        print("3")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}
