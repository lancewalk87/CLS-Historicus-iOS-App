//
//  ViewController.h
//  History IQ
//
//  Created by Lance Walker on 2/17/15.
//  Copyright (c) 2015 Lance Walker. All rights reserved.
//

//Frameworks
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#pragma mark - Ints, Integers and Booliens:
    //Ints
int QuestionInt; int ChapterQuestionInt; int TimerSeconds; int TimerMinutes; int QuestionNumberInt; int PreviousQuestionInt;

int PreviousTermInt; int BeginningInt; int PreviousResultInt; int FirstResult; int TimerHour; int LogSeconds; int LogMinutes; int LogHours; int InitialLoad;

int ConvertSeconds; int ConvertMinutes;

    //Integers
NSInteger *IntegerLogSeconds; NSInteger *IntegerLogMinutes; NSInteger *IntegerLogMinutes;

    //Booliens
        //Main:
BOOL InitalLoad; BOOL SearchBOOL; BOOL BeginningBOOL; BOOL FlashCards; BOOL Terms; BOOL NoResults; BOOL RetrunBOOL; BOOL Answer; BOOL Condition;

BOOL NextResultBOOL; BOOL ResultBOOL; BOOL PreviousSelect; BOOL NextSelect; BOOL FirstResultBOOL; BOOL PauseBOOL; BOOL IntroScreen;

        //Unit Booliens:
BOOL Unit1BOOL; BOOL Unit2BOOL; BOOL Unit3BOOL; BOOL Unit4BOOL; BOOL Unit5BOOL;

        //Term Booliens:
BOOL Ch1; BOOL Ch2; BOOL Ch3; BOOL Ch4; BOOL Ch5; BOOL Ch6; BOOL Ch7; BOOL Ch8; BOOL Ch9; BOOL Ch10; BOOL Ch11; BOOL Ch12; BOOL Ch13; BOOL Ch14; BOOL Ch15;

BOOL Ch16; BOOL Ch17; BOOL Ch18; BOOL Ch19; BOOL Ch20; BOOL Ch21; BOOL Ch22; BOOL Ch23;

#pragma mark - Transferable Data Objects:
    //Study Log
NSMutableArray *LogArray;
    //BookMarks
NSMutableArray *TitleArray;
NSMutableArray *NoteArray;

#pragma mark - Strings:
NSString *NoteOutPutString;

NSString *ReadOutLine; NSString *ReturnString; NSString *Readoutstring; NSString *AnswerString; NSString *UpperCase; NSString *LowerCase;

NSString *FirstCase; NSString *UppercaseEnd; NSString *LowercaseEnd; NSString *NextStringUpper; NSString *NextStringLower; NSString *EndStringUpper;

NSString *EndStringLower; NSString *LastStringUpper; NSString *LastStringLower; NSString *Mutal; NSString *FirstResultString; NSString *dateString;

NSString *intialTimeString; NSString *finalTimeString; NSString *dateTimeString; NSString *BookMTitle; NSString *BookMNote; NSString *Zero;

NSString *HourReadout; NSString *MinuteReadout; NSString *SecondsReadout; NSString *Object; NSString *zeroString; NSString *totalTimeString;


@interface ViewController : UIViewController  <UISearchBarDelegate>{
#pragma mark - IBOutlets:
    //Labels:
    IBOutlet UILabel *MainTitle; IBOutlet UIImageView *MarginLine; IBOutlet UILabel *FlashCardTitle;
    
    IBOutlet UILabel *AnswertocardLabel; IBOutlet UILabel *QuestionNumber; IBOutlet UILabel *TimerLabelSeconds;

    //Buttons:
    IBOutlet UIButton *FlashCardsButton; IBOutlet UIButton *TermsButton; IBOutlet UIButton *BackButton;
    
    IBOutlet UIButton *Unit1Button; IBOutlet UIButton *Unit2Button; IBOutlet UIButton *Unit3Button; IBOutlet UIButton *Unit4Button;
    
    IBOutlet UIButton *Unit5Button; IBOutlet UIButton *ReturnButton; IBOutlet UIButton *ResumeButton; IBOutlet UIButton *QuitButton;
    
    IBOutlet UIButton *NextCard; IBOutlet UIButton *PreviousCard; IBOutlet UIButton *Answertocard; IBOutlet UIButton *SearchButton;
    
    IBOutlet UIButton *PreviousQuestion; IBOutlet UIButton *StudyLog; IBOutlet UIButton *SettingButton; IBOutlet UIButton *EraseAllDataButton;
    
    //Scroll Views:
    IBOutlet UIScrollView *Unit1Scroll; IBOutlet UIScrollView *Unit2Scroll; IBOutlet UIScrollView *Unit3Scroll;
    
    IBOutlet UIScrollView *Unit4Scroll; IBOutlet UIScrollView *Unit5Scroll;
    
    //Image Views:
    IBOutlet UIImageView *IntroImg;
#pragma mark - Timers:
    NSTimer *Timer; NSTimer *Cycletimer; NSTimer *LogTimer; NSTimer *SearchProtocols; NSTimer *ConflictTimer;
#pragma mark - Dates
    NSDate *CurrentDate; NSDateFormatter *dateFormat; NSDateFormatter *intialTimeFormat; NSDateFormatter *finalTimeFormat;
    //End Dates
#pragma mark - UserDefaults
    NSUserDefaults *UserDefaults;
}

#pragma mark - Properties
@property (weak, nonatomic) IBOutlet UISearchBar *SearchBar;
#pragma mark - Voids & Action Senders
    //Voids:
-(void)QuestionsVoid;
-(void)ChapterTerms;
-(void)QuestionSelectorVoid;
-(void)SecondsVoid;
-(void)CycleVoid;
-(void)CommonVoidUnits;
-(void)CommonTermUnits;
-(void)Begining;
-(void)PauseVoid;
-(void)SearchResultVoid;
-(void)ConvertDataLog;
-(void)TimeStamp;
-(void)IntroScreen;
-(void)BeginSearch;
-(void)ConflictCheck;
-(void)InitialzeSearch;
-(void)ResumeVoid;
    //Action Senders:
        //Menus:
-(IBAction)FlashCards:(id)sender;
-(IBAction)Terms:(id)sender;
-(IBAction)Settings:(id)sender;
        //Dynamic Action Senders:
-(IBAction)FlashCardNext:(id)sender;
-(IBAction)PreviousCard:(id)sender;
-(IBAction)AnswerToCard:(id)sender;
-(IBAction)Return:(id)sender;
-(IBAction)ResumeButton:(id)sender;
-(IBAction)QuitButton:(id)sender;
-(IBAction)SearchButton:(id)sender;
-(IBAction)RetrunSearch:(id)sender;
-(IBAction)EraseData:(id)sender;
        //FlashCards Menu:
-(IBAction)Unit1:(id)sender;
-(IBAction)Unit2:(id)sender;
-(IBAction)Unit3:(id)sender;
-(IBAction)Unit4:(id)sender;
-(IBAction)Unit5:(id)sender;
        //Terms Menu:
-(IBAction)TermCH1:(id)sender;
-(IBAction)TermCH2:(id)sender;
-(IBAction)TermCH3:(id)sender;
-(IBAction)TermCH4:(id)sender;
-(IBAction)TermCH5:(id)sender;
-(IBAction)TermCH6:(id)sender;
-(IBAction)TermCH7:(id)sender;
-(IBAction)TermCH8:(id)sender;
-(IBAction)TermCH9:(id)sender;
-(IBAction)TermCH10:(id)sender;
-(IBAction)TermCH11:(id)sender;
-(IBAction)TermCH12:(id)sender;
-(IBAction)TermCH13:(id)sender;
-(IBAction)TermCH14:(id)sender;
-(IBAction)TermCH15:(id)sender;
-(IBAction)TermCH16:(id)sender;
-(IBAction)TermCH17:(id)sender;
-(IBAction)TermCH18:(id)sender;
-(IBAction)TermCH19:(id)sender;
-(IBAction)TermCH20:(id)sender;
-(IBAction)TermCH21:(id)sender;
-(IBAction)TermCH22:(id)sender;
-(IBAction)TermCH23:(id)sender;

@end



