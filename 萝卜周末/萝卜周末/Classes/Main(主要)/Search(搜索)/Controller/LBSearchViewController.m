//
//  LBSearchViewController.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/18.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBSearchViewController.h"
#import "FSDropDownMenu.h"
#import "LBSearchTextField.h"
#import "LBSearchTypeButton.h"
@interface LBSearchViewController ()<FSDropDownMenuDataSource,FSDropDownMenuDelegate,LBSearchTextFieldDelegate,LBSearchTypeButtonDelegate>
@property(nonatomic,strong) NSArray *cityArr;
@property(nonatomic,strong) NSArray *areaArr;
@property(nonatomic,strong) NSArray *currentAreaArr;
@property (nonatomic,strong)LBSearchTextField *searchTextField;
@end

@implementation LBSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = LBColor(244, 79, 28);
    
    //添加一个搜索的视图
    UIView *searchView=[[UIView alloc]initWithFrame:CGRectMake(0, 44, self.view.width, 162)];
    searchView.backgroundColor=LBColor(244, 79, 28);
    [self.view addSubview:searchView];
    //添加一个searchbar
    LBSearchTextField *searchBar=[[LBSearchTextField alloc]initWithFrame:CGRectMake(20, 56, self.view.width-40, 40)];
    searchBar.delegate=self;
    self.searchTextField=searchBar;
    [searchView addSubview:searchBar];
    //添加分类的界面
    UIView *typeView=[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(searchView.frame), self.view.width, self.view.height-CGRectGetMaxY(searchView.frame)-self.tabBarController.tabBar.height)];
    [self.view addSubview:typeView];
    CGFloat typeButtonWidth=(typeView.width-30*4)/3;
    CGFloat typeButtonHeight=(typeView.height-30*4)/3;
    NSArray *typeButtonName=[NSArray arrayWithObjects:@"全部",@"音乐",@"运动",@"集会",@"美食",@"购物",@"展览",@"电影",@"约会", nil];
    int index=1;
    for (int i=0; i<3; i++) {
        
        for (int j=0; j<3; j++) {
            LBSearchTypeButton *typeButton=[[LBSearchTypeButton alloc]initWithFrame:CGRectMake(i*(typeButtonWidth+30)+30, j*(typeButtonHeight+30)+30, typeButtonWidth, typeButtonHeight)];
            LBLog(@"#####################searchButton_0%d",index);
            [typeButton searchTypeButtonWithNormalImage:[NSString stringWithFormat:@"searchButton_0%d",index] SelectedImage:nil title:[typeButtonName objectAtIndex:index-1] tap:index];
//            [typeButton.imageButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"searchButton_0%d",index+1]] forState:UIControlStateNormal];
            LBLog(@"------%d",index);
            typeButton.delegate=self;
            [typeView addSubview:typeButton];
            index++;
            
        }
    }
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *activityBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 62, 30)];
    activityBtn.titleLabel.font = [UIFont systemFontOfSize:14.f];
    [activityBtn setTitle:@"唐山" forState:UIControlStateNormal];
    [activityBtn setImage:[UIImage imageNamed:@"expandableImage"] forState:UIControlStateNormal];
    activityBtn.imageEdgeInsets = UIEdgeInsetsMake(11, 52, 11, 0);
    [activityBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [activityBtn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    //添加UINavigation的右边的按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:activityBtn];
    UIImage *leftBarItemImage=[UIImage imageNamed:@"list"];
    leftBarItemImage=[leftBarItemImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:leftBarItemImage style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemAction)];
    
    _cityArr = @[@"附近",@"上海",@"北京",@"同城"];
    _areaArr = @[
                 @[@"附近",@"500米",@"1000米",@"2000米",@"5000米"],
                 @[@"徐家汇",@"人民广场",@"陆家嘴"],
                 @[@"三里屯",@"亚运村",@"朝阳公园"],
                 @[@"同城"],
                 ];
    _currentAreaArr = _areaArr[0];
    FSDropDownMenu *menu = [[FSDropDownMenu alloc] initWithOrigin:CGPointMake(0, 64) andHeight:300];
    menu.transformView = activityBtn.imageView;
    menu.tag = 1001;
    menu.dataSource = self;
    menu.delegate = self;
    [self.view addSubview:menu];
    
}
#pragma mark-搜索按钮点击事件的点击代理方法
-(void)SearchTextFieldSearchButtonClick:(LBSearchTextField *)searchBar{
    LBLog(@"搜索按钮被点击了");
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    [self.searchTextField resignFirstResponder];
}
#pragma mark-触摸空白结束编辑
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.searchTextField resignFirstResponder];
}
#pragma mark-左边的navigationItem的点击事件
-(void)leftBarButtonItemAction{
    LBLog(@"");
}
#pragma mark-LBSearchTypeButton的代理方法
-(void)SearchTypeButtonDidClick:(LBSearchTypeButton *)searchTypeButton button:(UIButton *)button{
    if (button.tag==1) {
        LBLog(@"点击了全部的按钮");
    }
}
-(void)btnPressed:(id)sender{
    FSDropDownMenu *menu = (FSDropDownMenu*)[self.view viewWithTag:1001];
    [UIView animateWithDuration:0.2 animations:^{
        
    } completion:^(BOOL finished) {
        [menu menuTapped];
    }];
}

#pragma mark - reset button size

-(void)resetItemSizeBy:(NSString*)str{
    UIButton *btn = (UIButton*)self.navigationItem.rightBarButtonItem.customView;
    [btn setTitle:str forState:UIControlStateNormal];
    NSDictionary *dict = @{NSFontAttributeName:btn.titleLabel.font};
    CGSize size = [str boundingRectWithSize:CGSizeMake(150, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    btn.frame = CGRectMake(btn.frame.origin.x, btn.frame.origin.y,size.width+33, 30);
    btn.imageEdgeInsets = UIEdgeInsetsMake(11, size.width+23, 11, 0);
}


#pragma mark - FSDropDown datasource & delegate

- (NSInteger)menu:(FSDropDownMenu *)menu tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == menu.rightTableView) {
        return _cityArr.count;
    }else{
        return _currentAreaArr.count;
    }
}
- (NSString *)menu:(FSDropDownMenu *)menu tableView:(UITableView*)tableView titleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == menu.rightTableView) {
        
        return _cityArr[indexPath.row];
    }else{
        return _currentAreaArr[indexPath.row];
    }
}


- (void)menu:(FSDropDownMenu *)menu tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(tableView == menu.rightTableView){
        _currentAreaArr = _areaArr[indexPath.row];
        [menu.leftTableView reloadData];
    }else{
        [self resetItemSizeBy:_currentAreaArr[indexPath.row]];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
