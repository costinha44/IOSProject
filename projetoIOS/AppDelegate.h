//
//  AppDelegate.h
//  projetoIOS
//
//  Created by Andre Costa on 3/11/18.
//  Copyright © 2018 Andre Costa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) NSManagedObjectContext *context;
@property (readonly, strong) NSPersistentContainer *persistentContainer;
@property NSMutableArray *arrayApiData;

- (void)saveContext;
+(AppDelegate *)appDelegate;

@end

