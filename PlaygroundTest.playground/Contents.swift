//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class ViewController : UIViewController, UITableViewDataSource{
    var tableView : UITableView!
    let items = ["Completar los retos","Tomar Examen", "Estudiar","Manejar","Jugar","Aprender IOS","Celebrar","Prueba","etc","etc","etc","etc","etc"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
        self.tableView = UITableView(frame: self.view.frame)
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = 50
        self.tableView.backgroundColor = UIColor.black
        self.view.addSubview(self.tableView)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(self.items[indexPath.row])"
        cell.backgroundColor = colorForRowAt(indexPathRow: indexPath.row)
        cell.textLabel?.textColor = UIColor(white: 1.0, alpha: CGFloat(1.0))
        return cell
    }
    
    func colorForRowAt(indexPathRow : Int) -> UIColor {
        let totalItems = self.items.count
        let val = (CGFloat(indexPathRow) / CGFloat(totalItems))
        return UIColor(red: 255, green: val, blue: 0.0, alpha: CGFloat(1.0))
    }
}
let controller = ViewController()
PlaygroundPage.current.liveView = controller.view
