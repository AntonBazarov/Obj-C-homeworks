//
//  AppDelegate.m
//  day5_homework_14_NSString
//
//  Created by Predki on 25.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSString* string = @"The NSString class declares the programmatic interface for an object that manages immutable strings. An immutable string is a text string that is defined when it is created and subsequently cannot be changed. NSString is implemented to represent an array of Unicode characters, in other words, a text string. The mutable subclass of NSString is NSMutableString. The NSString class has two primitive methods—length and characterAtIndex:—that provide the basis for all other methods in its interface. The length method returns the total number of Unicode characters in the string. characterAtIndex: gives access to each character in the string by index, with index values starting at 0. NSString declares methods for finding and comparing strings. It also declares methods for reading numeric values from strings, for combining strings in various ways, and for converting a string to different forms (such as encoding and case changes). The Application Kit also uses NSParagraphStyle and its subclass NSMutableParagraphStyle to encapsulate the paragraph or ruler attributes used by the NSAttributedString classes. Additionally, methods to support string drawing are described in NSString Additions, found in the Application Kit. NSString is “toll-free bridged” with its Core Foundation counterpart, CFStringRef. See “Toll-Free Bridging” for more information on toll-free bridging. String Objects NSString objects represent character strings in frameworks. Representing strings as objects allows you to use strings wherever you use other objects. It also provides the benefits of encapsulation, so that string objects can use whatever encoding and storage are needed for efficiency while simply appearing as arrays of characters. The cluster’s two public classes, NSString and NSMutableString, declare the programmatic interface for non-editable and editable strings, respectively.";
    
    NSString* text1 = [string substringToIndex:string.length/2];
    NSString* text2 = [string substringFromIndex:string.length/2];
    
    NSLog(@"%@", text1);
    NSLog(@"-=**********=-");
    NSLog(@"%@", text2);
    
    NSArray* array = [string componentsSeparatedByString:@"."];
    NSLog(@"%@", array);
    
    NSMutableArray* arrayWithStrings = [NSMutableArray array];
    
    for (NSString* element in array) {
        if([element containsString:@"NSString"]) {
            [arrayWithStrings addObject:element];
        }
    }
    NSLog(@" ");
    NSLog(@"-=**********=-");
    NSLog(@" ");
    NSLog(@"%@", arrayWithStrings);
    
    // Master level
    NSMutableArray* reverseArray = [NSMutableArray array];
    
    for (NSString* oldString in arrayWithStrings) {
        NSMutableString* newString = [[NSMutableString alloc] init];
        NSArray* arrayWithWords = [oldString componentsSeparatedByString:@" "];
        for (int i = (int)[arrayWithWords count] - 1; i >= 0; i--) {
            [newString appendFormat:@" %@", [arrayWithWords objectAtIndex:i]];
        }
        [reverseArray addObject:newString];
        
    }
    NSLog(@"%@", reverseArray);
    
    
    // Suoerman level
    
    NSMutableString* str = [[NSMutableString alloc] init];
    NSArray* words = [[string lowercaseString] componentsSeparatedByString:@" "];
    int wordLength = 0;
    
    for (NSString* word in words) {
        wordLength = (int)[word length] - 1;
        NSString* firstString;
        NSString* secondString;
        NSString* newString;
        if(wordLength > 0) {
            firstString = [word substringToIndex:wordLength];
            secondString = [[word substringFromIndex:wordLength] uppercaseString];
            newString = [firstString stringByAppendingString:secondString];
            [str appendFormat:@"%@ ", newString];
            
        }
        
    }
    NSLog(@"%@", str);
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
