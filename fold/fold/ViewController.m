//
//  ViewController.m
//  fold
//
//  Created by young_jerry on 2020/9/10.
//  Copyright © 2020 young_jerry. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    BOOL flag[5];
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    for(int i = 0; i < 5; i++){
        flag[i] = YES;
    }
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    _tableview.delegate = self;
    _tableview.dataSource = self;
    
    [self.view addSubview:_tableview];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(flag[section]){
        return 0;
    }
    return 8;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return 40;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [_tableview dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld部，第%ld行",indexPath.section,indexPath.row ];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
   
    UIControl *view = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 80)];
    view.tag = section;
    view.backgroundColor = [UIColor grayColor];
    [view addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 70, 30)];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:15];
    label.text = [NSString stringWithFormat:@"第%ld组",section];
    [view addSubview:label];
    return view;

}

-(void)press:(UIControl *)view{
    NSInteger i = view.tag;
       //取反
    flag[i] = !flag[i];
       //刷新列表
       NSIndexSet * index = [NSIndexSet indexSetWithIndex:i];
       [_tableview reloadSections:index withRowAnimation:UITableViewRowAnimationAutomatic];
}
@end

    
