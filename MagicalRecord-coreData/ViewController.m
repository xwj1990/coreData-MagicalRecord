//
//  ViewController.m
//  MagicalRecord-coreData
//
//  Created by baijiahulian on 15/8/25.
//  Copyright (c) 2015年 BJHL. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "PersonEntity.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UITextField *IDNumTextFiled;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
- (IBAction)addNewDataBut:(UIButton *)sender;
- (IBAction)updateDataBut:(UIButton *)sender;
- (IBAction)deleteDataBut:(UIButton *)sender;
- (IBAction)findFirstDataBut:(UIButton *)sender;
- (IBAction)condationFindBut:(UIButton *)sender;
- (IBAction)findAllDataBut:(UIButton *)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    /*
     http://childhood.logdown.com/posts/208957/easy-magicalrecord-01
     coreData和MagicalRecord的介绍
     
     */
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addNewDataBut:(UIButton *)sender {
    [PersonEntity addNewDataWith:[self returnAnPerson]];
}

- (IBAction)updateDataBut:(UIButton *)sender {
    [PersonEntity updateDataWith:[self returnAnPerson] withString:@"age" withConditions:[self returnAnPerson].age];
}
- (IBAction)deleteDataBut:(UIButton *)sender {
    [PersonEntity deleteDataWith:[self returnAnPerson]];
}

- (IBAction)findFirstDataBut:(UIButton *)sender {
    Person * person = [PersonEntity returnFirstData];
    NSString * str = [NSString stringWithFormat:@"person->name:%@\nperson->age:%@\nperson->idNumber:%@\n",person.name,person.age,person.idNumber];
    if (person.name.length<=0) {
        str = @"数据库中暂时没有数据，不如先添加一条数据再试试。";
    }
    self.contentTextView.text = str;
}

- (IBAction)condationFindBut:(UIButton *)sender {
    Person * conditionPerson = [self returnAnPerson];
    NSArray * personArr = [PersonEntity fineDataWithString:@"age" withConditions:conditionPerson.age];
    NSString * str = @"";
    for (Person * person in personArr) {
        str = [NSString stringWithFormat:@"%@\nperson->name:%@\nperson->age:%@\nperson->idNumber:%@\n",str,person.name,person.age,person.idNumber];
    }
    if (str.length<=0) {
        str = @"数据库中暂时没有数据，不如先添加一条数据再试试。";
    }
    self.contentTextView.text = str;
}

- (IBAction)findAllDataBut:(UIButton *)sender {
    NSArray * personArr = [PersonEntity returnAllData];
    NSString * str = @"";
    for (Person * person in personArr) {
        str = [NSString stringWithFormat:@"%@\nperson->name:%@\nperson->age:%@\nperson->idNumber:%@\n",str,person.name,person.age,person.idNumber];
    }
    if (str.length<=0) {
        str = @"数据库中暂时没有数据，不如先添加一条数据再试试。";
    }
    self.contentTextView.text = str;
}

- (Person *)returnAnPerson{
    NSString * age = self.ageTextField.text.length>0?self.ageTextField.text:@"";
    NSString * name = self.nameTextField.text.length>0?self.nameTextField.text:@"";
    NSString * idNumber = self.IDNumTextFiled.text.length>0?self.IDNumTextFiled.text:@"";
    Person * person = [[Person alloc] init];
    person.age = [NSNumber numberWithInt:[age intValue]];
    person.idNumber = [NSNumber numberWithLongLong:[idNumber longLongValue]];
    person.name = name;
    return person;
}

@end
