//
//  AppDelegate.h
//  萝卜周末
//
//  Created by Apple_16 on 16/1/18.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "LBNavigationController.h"
#import "LBLeftSlideViewController.h"
#import "LBRootTabbarController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) LBLeftSlideViewController *LeftSlideVC;
@property (strong, nonatomic) LBRootTabbarController *rootTabbarVC;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

