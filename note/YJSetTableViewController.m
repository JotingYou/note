//
//  YJSetTableViewController.m
//  note
//
//  Created by 姚家庆 on 16/2/29.
//  Copyright © 2016年 姚家庆. All rights reserved.
//

#import "YJSetTableViewController.h"
#import <ShareSDKUI/ShareSDKUI.h>
#import <ShareSDK/ShareSDK.h>
@interface YJSetTableViewController ()

@end

@implementation YJSetTableViewController
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==4) {
        NSLog(@"已选中");
        //1、创建分享参数
        NSArray* imageArray = @[[UIImage imageNamed:@"shareImg.png"]];
        //（注意：图片必须要在Xcode左边目录里面，名称必须要传正确，如果要分享网络图片，可以这样传iamge参数 images:@[@"http://mob.com/Assets/images/logo.png?v=20150320"]）
        if (imageArray) {
            
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            [shareParams SSDKSetupShareParamsByText:@"分享内容"
                                             images:imageArray
                                                url:[NSURL URLWithString:@"http://mob.com"]
                                              title:@"分享标题"
                                               type:SSDKContentTypeAuto];
            //2、分享（可以弹出我们的分享菜单和编辑界面）
            [ShareSDK showShareActionSheet:nil //要显示菜单的视图, iPad版中此参数作为弹出菜单的参照视图，只有传这个才可以弹出我们的分享菜单，可以传分享的按钮对象或者自己创建小的view 对象，iPhone可以传nil不会影响
                                     items:nil
                               shareParams:shareParams
                       onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
                           
                           switch (state) {
                               case SSDKResponseStateSuccess:
                               {
                                   //                               UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
                                   //                                                                                   message:nil
                                   //                                                                                  delegate:nil
                                   //                                                                         cancelButtonTitle:@"确定"
                                   //                                                                         otherButtonTitles:nil];
                                   //                               [alertView show];
                                   UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"分享失败" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
                                   //                               注意:UIAlertControllerStyleActionSheet 为从下面加载
                                   //设置取消按钮
                                   UIAlertAction *actionCancle=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
                                   
                                   //加载按钮
                                   [alertController addAction:actionCancle];
                                   //[alertController addAction:actionReplay];
                                   //加载AlertView
                                   [self presentViewController:alertController animated:YES completion:nil];
                                   

                                   
                                   break;
                               }
                               case SSDKResponseStateFail:
                               {
                                   //                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                   //                                                                               message:[NSString stringWithFormat:@"%@",error]
                                   //                                                                              delegate:nil
                                   //                                                                     cancelButtonTitle:@"OK"
                                   //                                                                     otherButtonTitles:nil, nil];
                                   //                               [alert show];
                                   UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"分享失败" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
                                   //                               注意:UIAlertControllerStyleActionSheet 为从下面加载
                                   //设置取消按钮
                                   UIAlertAction *actionCancle=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
                                   
                                   //加载按钮
                                   [alertController addAction:actionCancle];
                                   //[alertController addAction:actionReplay];
                                   //加载AlertView
                                   [self presentViewController:alertController animated:YES completion:nil];
                                   
                                   break;
                               }
                               default:
                                   break;
                           }
                       }
             ];}
        

    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
