//
//  AppDelegate.m
//  day1_homework_05_NSArray
//
//  Created by Predki on 21.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "AppDelegate.h"
#import "Human.h"
#import "Runner.h"
#import "Cycler.h"
#import "Swimmer.h"
#import "Gamer.h"
#import "Animal.h"
#import "Cat.h"
#import "Dog.h"
#import "Runners.h"
#import "Jumpers.h"
#import "Swimmers.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    Human* human = [[Human alloc] init];
    human.name = @"Human";
    human.weight = 50.4;
    human.height = 160;
    human.sex = @"woman";
    
    Runner* runner = [[Runner alloc] init];
    runner.name = @"John";
    runner.weight = 78.4;
    runner.height = 178;
    runner.sex = @"man";
    runner.speed = 2000;
    runner.snickerFirm = @"Nike";
    
    
    Cycler* cycler = [[Cycler alloc] init];
    cycler.name = @"Dexter";
    cycler.weight = 102.2;
    cycler.height = 190;
    cycler.sex = @"man";
    
    Swimmer* swimmer = [[Swimmer alloc] init];
    swimmer.name = @"Anthony";
    swimmer.weight = 74.2;
    swimmer.height = 180;
    swimmer.sex = @"man";
    swimmer.swim = @"SWIM SWIM SWIMMER";
    swimmer.swim = @"Black";
    
    Gamer* gamer = [[Gamer alloc] init];
    gamer.name = @"Sonya";
    gamer.weight = 56.2;
    gamer.height = 170;
    gamer.sex = @"woman";
    gamer.age = 19;
    gamer.game = @"WoW";
    gamer.speed = 200;
    gamer.heightJump = 1200;
    gamer.swim = @"Gamer SWIMSWIMSWIM";
    
    
    
    // Create new class Animal, Cat, Dog
    
    Animal* animal = [[Animal alloc] init];
    Cat* cat = [[Cat alloc] init];
    cat.monicker = @"Vas'ka";
    cat.howManyLives = 20;
    cat.skinColor = @"Black";
    cat.who = @"I'm a cat";
    cat.heightJump = 120;
    
    
    Dog* dog = [[Dog alloc] init];
    dog.monicker = @"Tuzik";
    dog.howManyLives = 15;
    dog.skinColor = @"Multicolor";
    dog.who = @"I'm a dog";
    dog.swim = @"Tuzik swim";
    dog.speed = 20.5;
    
    /*
    NSArray* humans = [NSArray arrayWithObjects:human, cycler, runner, swimmer, gamer, nil];
    for (Human* human in humans) {
        NSLog(@"Hi my name is %@. My height - %d, weight - %.1f. I am a %@", human.name, human.height, human.weight, human.sex);
        if ([human isKindOfClass:[Gamer class]]) {
            Gamer* gamer = (Gamer*)human;
            NSLog(@"And my age - %d. I play %@", gamer.age, gamer.game);
            [gamer superMovement];
        }
        [human movement];
        NSLog(@" ");
    }
    
    for (int index = (int)[humans count] - 1; index >= 0; index--) {
        Human* human = [humans objectAtIndex:index];
        NSLog(@"Hi my name is %@. My height - %ld, weight - %.1f. I am a %@", human.name, (long)human.height, human.weight, human.sex);
        if ([human isKindOfClass:[Gamer class]]) {
            Gamer* gamer = (Gamer*)human;
            NSLog(@"And my age - %ld. I play %@", (long)gamer.age, gamer.game);
            [gamer superMovement];
        }
        [human movement];
        NSLog(@" ");
    }
   
    NSArray* creatures = [NSArray arrayWithObjects:human, cycler, runner, swimmer, gamer, cat, dog, nil];
    for (int index = 0; index < [creatures count]; index++) {
        NSObject* creature = [creatures objectAtIndex:index];
        if ([creature isKindOfClass:[Human class]]) {
            Human* humanIndex = (Human*)creature;
            NSLog(@"Human!");
            NSLog(@"Hi my name is %@. My height - %ld, weight - %.1f. I am a  %@", humanIndex.name, (long)humanIndex.height, humanIndex.weight, humanIndex.sex);
            [humanIndex movement];
        } else {
            Animal* animalIndex = (Animal*)creature;
            NSLog(@"Animal!");
            NSLog(@"Who are you?. %@, monicker - %@, my skin color %@. I live %ld years.", animalIndex.who, animalIndex.monicker, animalIndex.skinColor, (long)animalIndex.howManyLives);
            [animalIndex animalMovement];
        }
    }
    
    
    NSArray* humans = [NSArray arrayWithObjects:human, cycler, runner, swimmer, gamer, nil];
    NSArray* animals = [NSArray arrayWithObjects:cat, dog, nil];
    
    for (int i = 0; i < ((int)[humans count] + (int)[animals count]); i++) {
        if (i < [humans count]) {
            Human* humanIndex = [humans objectAtIndex:i];
            NSLog(@"Human!");
            NSLog(@"Hi my name is %@. My height - %ld, weight - %.1f. I am a  %@", humanIndex.name, (long)humanIndex.height, humanIndex.weight, humanIndex.sex);
            [human movement];
            NSLog(@" ");
        }
        if (i < [animals count]) {
            Animal* animalIndex = [animals objectAtIndex:i];
            NSLog(@"Animal!");
            NSLog(@"Who are you?. %@, monicker - %@, my skin color %@. I live %ld years.", animalIndex.who, animalIndex.monicker, animalIndex.skinColor, (long)animalIndex.howManyLives);
            [animalIndex animalMovement];
            NSLog(@" ");
        }
    }
    
    NSArray* creatures = [NSArray arrayWithObjects:human, cat, cycler, dog, runner, swimmer, gamer, nil];
    
    creatures = [creatures sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if ([obj1 isKindOfClass:[Human class]] && [obj2 isKindOfClass:[Human class]]) {
            return [[(Human*)obj1 name] compare:[(Human*)obj2 name]];
        } else if ([obj1 isKindOfClass:[Animal class]] && [obj2 isKindOfClass:[Animal class]]) {
            return [[(Animal*)obj1 monicker] compare:[(Animal*)obj2 monicker]];
        } else if ([obj1 isKindOfClass:[Human class]]) {
            return NSOrderedDescending;
        } else {
            return NSOrderedAscending;
        }
    }];
    
    for (int i = 0; i < [creatures count]; i++) {
        NSObject* creature = [creatures objectAtIndex:i];
        NSLog(@"%@", creature);
    }
*/
    
    NSArray* creatures = [NSArray arrayWithObjects:human, cat, cycler, dog, runner, swimmer, gamer, nil];
    
    for (id <Runners,Swimmers,Jumpers> creature in creatures) {
        if ([creature conformsToProtocol:@protocol(Runners)]) {
            [creature sayHelloRunners];
            [creature run];
            NSLog(@"My speed - %.1f", creature.speed);
            if ([creature respondsToSelector:@selector(snickerFirm)]){
                NSLog(@"I wear snicker %@", creature.snickerFirm);
            }
            if ([creature respondsToSelector:@selector(doYouLike)]) {
                [creature doYouLike];
            }
        }
        if ([creature conformsToProtocol:@protocol(Jumpers)]) {
            [creature sayHelloJumpers];
            [creature jump];
            NSLog(@"Height my jump - %.0f ", creature.heightJump);
            if ([creature respondsToSelector:@selector(record)]){
                NSLog(@"Record my jump - %.0f m", creature.record);
            }
            if ([creature respondsToSelector:@selector(thereAreAchievements)]) {
                [creature thereAreAchievements];
            }
        }
        if ([creature conformsToProtocol:@protocol(Swimmers)]) {
            [creature sayHelloSwimmers];
            [creature iCanSwim];
            NSLog(@"%@", creature.swim);
            if ([creature respondsToSelector:@selector(swimSuit)]){
                NSLog(@"Color my swimsuit - %@", creature.swimSuit);
            }
            if ([creature respondsToSelector:@selector(swimButterfly)]) {
                [creature swimButterfly];
            }

    }
    
}
    
    
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
