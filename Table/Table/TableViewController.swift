//
//  TableViewController.swift
//  Table
//
//  Created by 한소희 on 2022/06/27.
//

import UIKit

var items = ["책 구매", "철수와 약속", "스터디 준비하기"]
var itemsImageFile = ["cart.png", "clock.png", "pencil.png"]

class TableViewController: UITableViewController {

    @IBOutlet var tvListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData()  // tvListView.reloadData 함수를 추가하여 테이블 뷰를 다시 불러옴. 다시 말해, 추가된 내용을 목록으로 불러들임.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1  // 보통은 테이블 안에 섹션이 한 개이므로 numberOfSections의 리턴 값을 1.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count  // 섹션 당 열의 개수는 Items의 개수이므로 이 함수의 리턴 값을 items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]  // 셀의 텍스트 레이블에 앞에서 선언한 items 대입
        cell.imageView?.image = UIImage(named: itemsImageFile[(indexPath as NSIndexPath).row])
                                        // 셀의 이미지 뷰에 앞에서 선언한 itemsImageFile을 대입

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            items.remove(at: (indexPath as NSIndexPath).row)
            itemsImageFile.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    // Delete를 한글로 수정
    override func tableView(_ tableView : UITableView, titleForDeleteConfirmationButtonForRowAt indexPath : IndexPath) -> String? {
        return "삭제"
    }
        
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        // 하나의 목록을 선택하여 다른 곳으로 이동하는 소스코드(목록 순서 바꾸기)
        let itemToMove = items[(fromIndexPath as NSIndexPath).row]  // 이동할 아이템의 위치를 itemToMove에 저장
        let itemImageToMove = itemsImageFile[(fromIndexPath as NSIndexPath).row]  // 위와 똑같음.
        items.remove(at: (fromIndexPath as NSIndexPath).row)  // 이동할 아이템을 삭제. 이때 삭제한 아이템 뒤의 아이템들의                                                           인덱스가 재정렬됨.
        itemsImageFile.remove(at: (fromIndexPath as NSIndexPath).row)  // 위와 똑같음.
        items.insert(itemToMove, at: (to as NSIndexPath).row)  // 삭제된 아이템을 이동할 위치로 삽입. 또한 삽입한 아이템 뒤의                                                        아이템들의 인덱스가 재정렬됨.
        itemsImageFile.insert(itemImageToMove, at: (to as IndexPath).row)  // 위와 똑같음.
    }


    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {  // 세그웨이 이용하며 뷰를 이동하는 함수.
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier  == "sgDetail"
        {
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            let detailView = segue.destination as! DetailViewController
            detailView.receiveItem(items[((indexPath! as NSIndexPath).row)])

        }
    }
    

}
