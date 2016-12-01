//
//  ViewController.m
//  Historiucs
//
//  Created by Lance Walker on 2/17/15.
//  Copyright (c) 2015 Lance Walker. All rights reserved.
// Add Test review and study help

#import "MainScene.h"

@implementation ViewController
#pragma mark - Sync Properties:
@synthesize SearchBar;
@synthesize AnswerScroll;

#pragma mark - Voids & Action Senders:
    //Voids

- (void)viewDidLoad {
    [super viewDidLoad];
    if (IntroScreen == YES){
        [self Begining];
    } else if (IntroScreen == NO){
        [self IntroScreen];
    }
    
    //NSUser Defaults
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}
-(void)Begining{ //Inital Void
    //Boolien Control
    RetrunBOOL = YES; FlashCards = NO; SearchBOOL = NO; Terms = NO; Unit1BOOL = NO; Unit2BOOL = NO; Unit3BOOL = NO; Unit4BOOL = NO; Unit5BOOL = NO; Ch1 = NO;
    
    Ch2 = NO; Ch3 = NO; Ch4 = NO; Ch5 = NO; Ch6 = NO; Ch7 = NO; Ch8 = NO; Ch9 = NO; Ch10 = NO; Ch11 = NO; Ch12 = NO; Ch13 = NO; Ch14 = NO; Ch15 = NO; Ch16 =
    
    NO; Ch17 = NO; Ch18 = NO; Ch19 = NO; Ch20 = NO; Ch21 = NO; Ch22 = NO; Ch23 = NO; ResultBOOL = NO; NextSelect = NO; PreviousSelect = NO; FirstResultBOOL = NO;
    
    PauseBOOL = NO; NextResultBOOL = NO; IntroScreen = YES;
    //End Boolien Control
    
    //Integer Control
    BeginningInt = 1; QuestionInt = 0; ChapterQuestionInt = 0; TimerMinutes = 0; TimerSeconds = 0; TimerHour = 0;
    //End Integer Control
    
    //End GUI
    
    //Theme: Papyrus egyptian theme
    //UI Element Control
    
    //Timer
    [Timer invalidate]; [Cycletimer invalidate];
    //End Timer
    
    //Fonts/ Styles
    //Texts
    MainTitle.text = @"Historicus"; SearchBar.text = @"";
    
    [PreviousQuestion setTitle:@"Return" forState:UIControlStateNormal]; [QuitButton setTitle:@"Return Home" forState:UIControlStateNormal];
    
    [BackButton setTitle:@"Back" forState:UIControlStateNormal];
    
    [Unit1Button setTitle:@"Unit 1, Time period: Prehistory - 600 CE" forState:UIControlStateNormal];
    
    [Unit2Button setTitle:@"Unit 2, Time period: 600 CE- 1450 CE" forState:UIControlStateNormal];
    
    [Unit3Button setTitle:@"Unit 3, Time period: 1450 CE - 1750 CE" forState:UIControlStateNormal];
    
    [Unit4Button setTitle:@"Unit 4, Time period: 1750 CE - 1914 CE" forState:UIControlStateNormal];
    
    [Unit5Button setTitle:@"Unit 5, Time period: 1914 CE - Present Day" forState:UIControlStateNormal];
    
    TimerLabelSeconds.text = @"Time, 00:00";
    //End Texts
    
    
    //End UI Element Control
    //GUI
    PreviousQuestion.hidden = YES; BackButton.hidden = YES; SearchButton.hidden = YES; SearchBar.hidden = YES; QuestionNumber.hidden = YES;
    
    PreviousCard.hidden = YES; QuitButton.hidden = YES; Unit1Scroll.hidden = YES; Unit2Scroll.hidden = YES; Unit3Scroll.hidden = YES;
    
    Unit4Scroll.hidden = YES; Unit5Scroll.hidden = YES; FlashCardTitle.hidden = YES; AnswertocardLabel.hidden = YES; AnswerScroll.hidden = YES; Unit1Button.hidden = YES;
    
    Unit2Button.hidden = YES; Unit3Button.hidden = YES; Unit4Button.hidden = YES; Unit5Button.hidden = YES; TimerLabelSeconds.hidden = YES;
    
    ReturnButton.hidden = YES; ResumeButton.hidden = YES; NextCard.hidden = YES; Answertocard.hidden = YES; EraseAllDataButton.hidden = YES;
    
    SettingButton.hidden = NO; FlashCardsButton.hidden = NO; TermsButton.hidden = NO; StudyLog.hidden = NO; IntroImg.hidden = YES; MainTitle.hidden = NO;
    
    MarginLine.hidden = NO;
    //End GUI
    
    //Scrolls View GUI
        //Scroll view GUI
    Unit1Scroll.backgroundColor = [UIColor clearColor];
    Unit2Scroll.backgroundColor = [UIColor clearColor];
    Unit3Scroll.backgroundColor = [UIColor clearColor];
    Unit4Scroll.backgroundColor = [UIColor clearColor];
    Unit5Scroll.backgroundColor = [UIColor clearColor];
    
    Unit1Scroll.layer.cornerRadius = 11;
    Unit1Scroll.layer.masksToBounds = YES;
    Unit1Scroll.layer.borderWidth = 2;
    Unit1Scroll.layer.borderColor = [UIColor blackColor].CGColor;
    
    Unit2Scroll.layer.cornerRadius = 11;
    Unit2Scroll.layer.masksToBounds = YES;
    Unit2Scroll.layer.borderWidth = 2;
    Unit2Scroll.layer.borderColor = [UIColor blackColor].CGColor;
    
    Unit3Scroll.layer.cornerRadius = 11;
    Unit3Scroll.layer.masksToBounds = YES;
    Unit3Scroll.layer.borderWidth = 2;
    Unit3Scroll.layer.borderColor = [UIColor blackColor].CGColor;
    
    Unit4Scroll.layer.cornerRadius = 11;
    Unit4Scroll.layer.masksToBounds = YES;
    Unit4Scroll.layer.borderWidth = 2;
    Unit4Scroll.layer.borderColor = [UIColor blackColor].CGColor;
    
    Unit5Scroll.layer.cornerRadius = 11;
    Unit5Scroll.layer.masksToBounds = YES;
    Unit5Scroll.layer.borderWidth = 2;
    Unit5Scroll.layer.borderColor = [UIColor blackColor].CGColor;
    //End UI Element Control
    
    [AnswertocardLabel setNumberOfLines:100];
    [AnswertocardLabel sizeToFit];
    Zero = @"0";
    
    //Data Recalls
    UserDefaults = [NSUserDefaults standardUserDefaults];
    
    InitialLoad = [[NSUserDefaults standardUserDefaults] integerForKey:@"InitialInt"];
    
    [self.AnswerScroll setContentSize:CGSizeMake(553, 400)];
    [self.AnswerScroll setPagingEnabled:YES];
    [self.AnswerScroll addSubview:AnswertocardLabel];
  
    if (InitialLoad == 0){ //First time game is loaded
        //TitleScreen
        InitialLoad = 1;
        
        //Study log == 0,0,0
        LogArray = [[NSMutableArray alloc] init];
        
        LogMinutes = 0;
        LogSeconds = 0;
        LogHours = 0;
        
        [[NSUserDefaults standardUserDefaults] setInteger:InitialLoad forKey:@"InitialInt"];
        
        //Save
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:LogArray forKey:@"StudyLogArray"];
        [userDefaults synchronize];
        
    } else if (InitialLoad == 1) { //Other times game is loaded
        //Data Recalls
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        LogArray = [[userDefaults objectForKey:@"StudyLogArray"]mutableCopy];
        
        //NSUInteger
        LogSeconds = [[NSUserDefaults standardUserDefaults] integerForKey:@"LogSeconds"];
        LogMinutes = [[NSUserDefaults standardUserDefaults] integerForKey:@"LogMinutes"];
        LogHours = [[NSUserDefaults standardUserDefaults] integerForKey:@"LogHours"];
    }
    
    //Develper Log
    NSLog(@"Array: %@", LogArray);
    NSLog(@"Seconds: %i", LogSeconds);
    NSLog(@"Minutes: %i", LogMinutes);
    NSLog(@"Hours: %i", LogHours);
    //End Develper
}
//Tutorial
-(void)IntroScreen{
    [self performSelector:@selector(Begining) withObject:nil afterDelay:2.0];
    
    //GUI
    SettingButton.hidden = YES; FlashCardsButton.hidden = YES; TermsButton.hidden = YES; StudyLog.hidden = YES; IntroImg.hidden = NO; MainTitle.hidden = YES; MarginLine.hidden = YES;
    
    PreviousQuestion.hidden = YES; BackButton.hidden = YES; SearchButton.hidden = YES; SearchBar.hidden = YES; QuestionNumber.hidden = YES;
    
    PreviousCard.hidden = YES; QuitButton.hidden = YES; Unit1Scroll.hidden = YES; Unit2Scroll.hidden = YES; Unit3Scroll.hidden = YES;
    
    Unit4Scroll.hidden = YES; Unit5Scroll.hidden = YES; FlashCardTitle.hidden = YES; AnswertocardLabel.hidden = YES; AnswerScroll.hidden = YES; Unit1Button.hidden = YES;
    
    Unit2Button.hidden = YES; Unit3Button.hidden = YES; Unit4Button.hidden = YES; Unit5Button.hidden = YES; TimerLabelSeconds.hidden = YES;
    
    ReturnButton.hidden = YES; ResumeButton.hidden = YES; NextCard.hidden = YES; Answertocard.hidden = YES;
    
    EraseAllDataButton.hidden = YES;
    //End GUI
    
    //Texts
    MainTitle.text = @"Historicus"; SearchBar.text = @"";
    
    [ResumeButton setTitle:@"Resume Session" forState:UIControlStateNormal];
    
    [PreviousQuestion setTitle:@"Return" forState:UIControlStateNormal]; [QuitButton setTitle:@"Return Home" forState:UIControlStateNormal];
    
    [BackButton setTitle:@"Back" forState:UIControlStateNormal];
    [Unit1Button setTitle:@"Unit 1, Time period: Prehistory - 600 CE" forState:UIControlStateNormal];
    
    [Unit2Button setTitle:@"Unit 2, Time period: 600 CE- 1450 CE" forState:UIControlStateNormal];
    
    [Unit3Button setTitle:@"Unit 3, Time period: 1450 CE - 1750 CE" forState:UIControlStateNormal];
    
    [Unit4Button setTitle:@"Unit 4, Time period: 1750 CE - 1914 CE" forState:UIControlStateNormal];
    
    [Unit5Button setTitle:@"Unit 5, Time period: 1914 CE - Present Day" forState:UIControlStateNormal];
    
    TimerLabelSeconds.text = @"Time, 00:00:00";
    //End Texts
    
}
-(void)PauseVoid{
        if (FlashCards == YES){
            if (FirstResultBOOL == NO & SearchBOOL == NO){
                PreviousQuestionInt = QuestionInt;
                NSLog(@"%i", PreviousQuestionInt);
            } else {
                nil;
            }
        }
        if (Terms == YES){
            if (FirstResultBOOL == NO & SearchBOOL == NO){
                PreviousTermInt = ChapterQuestionInt;
                NSLog(@"%i", PreviousQuestionInt);
            } else {
                nil;
            }
        }
    //Common Implementation
        //GUI
    ReturnButton.hidden = YES; NextCard.hidden = YES; AnswertocardLabel.hidden = YES; AnswerScroll.hidden = YES; Answertocard.hidden = YES;
    
    QuestionNumber.hidden = YES;
        
    QuitButton.hidden = NO; SearchBar.hidden = NO; SearchButton.hidden = NO; PreviousCard.hidden = YES; ResumeButton.hidden = NO;
    
    FlashCardTitle.hidden = YES;
        
    MainTitle.hidden = NO; TimerLabelSeconds.hidden = YES;
        //End GUI
        
        //UI Element Control
    
    MainTitle.text = [NSString stringWithFormat:@"%@ paused", PauseString];
    [ResumeButton setTitle:[NSString stringWithFormat:@"Resume %@", PauseString] forState:UIControlStateNormal];

        //End UI Element Control
    
        //BOOliens
        PauseBOOL = YES; 
        
        //Timer Control
        [Timer invalidate];
        [Cycletimer invalidate];
}

-(void)CycleVoid{ //Search Void == Response
    if (PreviousSelect == NO & NextSelect == NO){ //First Search Method
        //Search Method first
        if (FlashCards == YES){
            QuestionInt = QuestionInt + 1;
            [self QuestionsVoid]; //Database
            
        } else if (Terms == YES){
            ChapterQuestionInt = ChapterQuestionInt + 1;
            [self ChapterTerms];
        }
    } else if (NextSelect == YES){ //Next Result
        //Search Method
        if (FlashCards == YES){
            QuestionInt = QuestionInt + 1;
            [self QuestionsVoid]; //Database
        } else if (Terms == YES){
            ChapterQuestionInt = ChapterQuestionInt + 1;
            [self ChapterTerms];
        }
    } else if (PreviousSelect == YES){ //Previous Result
        //Search Method
        if (FlashCards == YES){
            QuestionInt = QuestionInt - 1;
            [self QuestionsVoid]; //Database
        } else if (Terms == YES){
            ChapterQuestionInt = ChapterQuestionInt - 1;
            [self ChapterTerms];
        }
    }
    if ([ReturnString containsString:EndStringUpper] || [ReturnString containsString:EndStringLower]){
        [self SearchResultVoid];
        
    }
    
    //Terms Here
    if (FlashCards == YES){
        if (QuestionInt == 1100){ //No Result/End of Results
            NSLog(@"Boolien read");
            if (NoResults == YES){
                FlashCardTitle.text = [NSString stringWithFormat:@"No results containing: %@", EndStringUpper];
                QuestionNumber.text = @"Question 1100/1100";
                PreviousCard.hidden = YES;

            } else {
                FlashCardTitle.text = [NSString stringWithFormat:@"No more results containing: %@", EndStringUpper];
                QuestionNumber.text = @"Question 1100/1100";
                PreviousCard.hidden = NO;
                PreviousSelect = YES;
                NextResultBOOL = YES;

            }
            //GUI
            NextCard.hidden = YES; PreviousQuestion.hidden = NO; ReturnButton.hidden = NO; SearchBar.hidden = YES;
            
            SearchBar.text = @"";  Answertocard.hidden = YES;
            //End GUI
            
            //UI Element Control
            [Cycletimer invalidate]; //Stop Search Method
        }
    } else if (Terms == YES){
        if (ChapterQuestionInt == 329){
            if (NoResults == YES){
                FlashCardTitle.text = [NSString stringWithFormat:@"No results containing: %@", EndStringUpper];
                PreviousCard.hidden = YES;

            } else {
                FlashCardTitle.text = [NSString stringWithFormat:@"No more results containing: %@", EndStringUpper];
                PreviousCard.hidden = NO;
                
            }
            //GUI
            NextCard.hidden = YES; PreviousQuestion.hidden = NO; ReturnButton.hidden = NO;  SearchBar.hidden = YES;
            
            SearchBar.text = @""; Answertocard.hidden = YES;
            //End GUI
            
            //UI Element Control
            [Cycletimer invalidate]; //Stop Search Method
            
        }
    }
}

//Search == Response
-(void)SearchResultVoid{
    //Boolien Control
    NoResults = NO; NextResultBOOL = YES; PreviousSelect = NO; NextSelect = NO;
    //End Boolien Control
    if (FirstResultBOOL == YES){
        FirstResultBOOL = NO;
        if (FlashCards == YES){
            FirstResult = QuestionInt;
        } else if (Terms == YES){
            FirstResult = ChapterQuestionInt;
        }
    } else {
        nil;
    }
    
    if (FirstResult == QuestionInt || FirstResult == ChapterQuestionInt){
        PreviousCard.hidden = YES;
    } else if (FirstResult != QuestionInt || FirstResult != ChapterQuestionInt){
        PreviousCard.hidden = NO;
    }
    //GUI
    SearchBar.hidden = YES; NextCard.hidden = NO; PreviousQuestion.hidden = NO; ReturnButton.hidden = NO; QuestionNumber.hidden = NO;  Answertocard.hidden = NO;
    
    MainTitle.hidden = YES; FlashCardTitle.hidden = NO; TimerLabelSeconds.hidden = NO;
    //End GUI
    
    //UI Element Control
    SearchBar.text = @"";
    FlashCardTitle.text = [NSString stringWithFormat:@"%@", ReturnString];
    AnswertocardLabel.text = [NSString stringWithFormat:@"%@", AnswerString];
    
    //Conditional
    if (FlashCards == YES){
        QuestionNumber.text = [NSString stringWithFormat:@"Question %i/1100", QuestionInt];
        //Int Control
        PreviousResultInt = QuestionInt;
        
        [self QuestionsVoid];

        
    } else if (Terms == YES){
        QuestionNumber.text = [NSString stringWithFormat:@"Question %i/329", ChapterQuestionInt];
        //Int Control
        
        PreviousResultInt = ChapterQuestionInt;
        
        [self ChapterTerms];
    }
    //End UI Element Control
    
    [Cycletimer invalidate];
    
    NSLog(@"%i", PreviousResultInt);
    NSLog(@"%i", FirstResult);
}

-(void)QuestionSelectorVoid{ //Database restrictions
    if (FlashCards == YES & SearchBOOL == NO & FirstResultBOOL == NO){
        
        if (Unit1BOOL == YES){ //Unit 1 restrictions
            if (QuestionInt < 2){
                PreviousCard.hidden = YES;
            } else {
                PreviousCard.hidden = NO;
            }
            if (QuestionInt > 127){
                NextCard.hidden = YES;
            } else {
                NextCard.hidden = NO;
            }
        }
        if (Unit2BOOL == YES){ //Unit 2 restrictions
            if (QuestionInt < 129){
                PreviousCard.hidden = YES;
            } else {
                PreviousCard.hidden = NO;
            }
            if (QuestionInt > 410){
                NextCard.hidden = YES;
            } else {
                NextCard.hidden = NO;
            }
        }
        if (Unit3BOOL == YES){ //Unit 3 Restrictions
            if (QuestionInt < 412){
                PreviousCard.hidden = YES;
            } else {
                PreviousCard.hidden = NO;
            }
            if (QuestionInt > 637){
                NextCard.hidden = YES;
            } else {
                NextCard.hidden = NO;
            }
        }
        if (Unit4BOOL == YES){ //Unit 4 Restrictions
            if (QuestionInt < 639){
                PreviousCard.hidden = YES;
            } else {
                PreviousCard.hidden = NO;
            }
            if (QuestionInt > 905){
                NextCard.hidden = YES;
            } else {
                NextCard.hidden = NO;
            }
        }
        if (Unit5BOOL == YES){ //Unit 5 Restrictions
            if (QuestionInt < 906){
                PreviousCard.hidden = YES;
            } else {
                PreviousCard.hidden = NO;
            }
            if (QuestionInt > 1100){
                NextCard.hidden = YES;
            } else {
                NextCard.hidden = NO;
            }
        }
    }
    
    if (Terms == YES){
        if (Ch1 == YES){ //Ch 1 restrictions
            if (ChapterQuestionInt < 115){
                PreviousCard.hidden = YES;
            } else {
                PreviousCard.hidden = NO;
            }
            if (ChapterQuestionInt > 126){
                NextCard.hidden = YES;
            } else {
                NextCard.hidden = NO;
            }
        }
        if (Ch2 == YES){ //Ch 2 restrictions
            if (ChapterQuestionInt < 129){
                PreviousCard.hidden = YES;
            } else {
                PreviousCard.hidden = NO;
            }
            if (ChapterQuestionInt > 138){
                NextCard.hidden = YES;
            } else {
                NextCard.hidden = NO;
            }
        }
        if (Ch3 == YES){ //Ch 3 restrictions
            if (ChapterQuestionInt < 141){
                PreviousCard.hidden = YES;
            } else {
                PreviousCard.hidden = NO;
            }
            if (ChapterQuestionInt > 150){
                NextCard.hidden = YES;
            } else {
                NextCard.hidden = NO;
            }
        }
        if (Ch4 == YES){ //Ch4 restrictions
            if (ChapterQuestionInt < 153){
                PreviousCard.hidden = YES;
            } else {
                PreviousCard.hidden = NO;
            }
            if (ChapterQuestionInt > 161){
                NextCard.hidden = YES;
            } else {
                NextCard.hidden = NO;
            }
        }
        if (Ch5 == YES){ //Ch5 restrictions
            if (ChapterQuestionInt < 175){
                PreviousCard.hidden = YES;
            } else {
                PreviousCard.hidden = NO;
            }
            if (ChapterQuestionInt > 187){
                NextCard.hidden = YES;
            } else {
                NextCard.hidden = NO;
            }
        }
        if (Ch6 == YES){ //Ch6 restrictions
            if (ChapterQuestionInt < 190){
                PreviousCard.hidden = YES;
            } else {
                PreviousCard.hidden = NO;
            }
            if (ChapterQuestionInt > 198){
                NextCard.hidden = YES;
            } else {
                NextCard.hidden = NO;
            }
        }
        if (Ch7 == YES){ //Ch7 restrictions
            if (ChapterQuestionInt < 201){
                PreviousCard.hidden = YES;
            } else {
                PreviousCard.hidden = NO;
            }
            if (ChapterQuestionInt > 208){
                NextCard.hidden = YES;
            } else {
                NextCard.hidden = NO;
            }
        }
        if (Ch8 == YES){ //Ch8 restrictions
            if (ChapterQuestionInt < 211){
                PreviousCard.hidden = YES;
            } else {
                PreviousCard.hidden = NO;
            }
            if (ChapterQuestionInt > 218){
                NextCard.hidden = YES;
            } else {
                NextCard.hidden = NO;
            }
        }
        if (Ch9 == YES){ //Ch9 restrictions
            if (ChapterQuestionInt < 221){
                PreviousCard.hidden = YES;
            } else {
                PreviousCard.hidden = NO;
            }
            if (ChapterQuestionInt > 234){
                NextCard.hidden = YES;
            } else {
                NextCard.hidden = NO;
            }
        }
        if (Ch10 == YES){ //Ch10 restrictions
            if (ChapterQuestionInt < 237){
                PreviousCard.hidden = YES;
            } else {
                PreviousCard.hidden = NO;
            }
            if (ChapterQuestionInt > 250){
                NextCard.hidden = YES;
            } else {
                NextCard.hidden = NO;
            }
        }
        if (Ch11 == YES){ //Ch11 restirctions
            if (ChapterQuestionInt < 253){
                PreviousCard.hidden = YES;
            } else {
                PreviousCard.hidden = NO;
            }
            if (ChapterQuestionInt > 268){
                NextCard.hidden = YES;
            } else {
                NextCard.hidden = NO;
            }
        }
        if (Ch12 == YES){ //Ch12 restrictions
            if (ChapterQuestionInt < 271){
                PreviousCard.hidden = YES;
            } else {
                PreviousCard.hidden = NO;
            }
            if (ChapterQuestionInt > 280){
                NextCard.hidden = YES;
            } else {
                NextCard.hidden = NO;
            }
        }
        if (Ch13 == YES){ //Ch13 restrictions
            if (ChapterQuestionInt < 283){
                PreviousCard.hidden = YES;
            } else {
                PreviousCard.hidden = NO;
            }
            if (ChapterQuestionInt > 298){
                NextCard.hidden = YES;
            } else {
                NextCard.hidden = NO;
            }
        }
        if (Ch14 == YES){ //Ch14 restrictions
            if (ChapterQuestionInt < 301){
                PreviousCard.hidden = YES;
            } else {
                PreviousCard.hidden = NO;
            }
            if (ChapterQuestionInt > 315){
                NextCard.hidden = YES;
            } else {
                NextCard.hidden = NO;
            }
        }
        if (Ch15 == YES){ //Ch15 restrictions
            if (ChapterQuestionInt < 318){
                PreviousCard.hidden = YES;
            } else {
                PreviousCard.hidden = NO;
            }
            if (ChapterQuestionInt > 328){
                NextCard.hidden = YES;
            } else {
                NextCard.hidden = NO;
            }
        }
        if (Ch16 == YES){ //Ch16 restrictions
            if (ChapterQuestionInt < 2){
                PreviousCard.hidden = YES;
            } else {
                PreviousCard.hidden = NO;
            }
            if (ChapterQuestionInt > 13){
                NextCard.hidden = YES;
            } else {
                NextCard.hidden = NO;
            }
        }
        if (Ch17 == YES){ //Ch17 restrictions
            if (ChapterQuestionInt < 16){
                PreviousCard.hidden = YES;
            } else {
                PreviousCard.hidden = NO;
            }
            if (ChapterQuestionInt > 24){
                NextCard.hidden = YES;
            } else {
                NextCard.hidden = NO;
            }
        }
        if (Ch18 == YES){ //Ch18 restrictions
            if (ChapterQuestionInt < 27){
                PreviousCard.hidden = YES;
            } else {
                PreviousCard.hidden = NO;
            }
            if (ChapterQuestionInt > 39){
                NextCard.hidden = YES;
            } else {
                NextCard.hidden = NO;
            }
        }
        if (Ch19 == YES){ //Ch19 restrictions
            if (ChapterQuestionInt < 42){
                PreviousCard.hidden = YES;
            } else {
                PreviousCard.hidden = NO;
            }
            if (ChapterQuestionInt > 54){
                NextCard.hidden = YES;
            } else {
                NextCard.hidden = NO;
            }
        }
        if (Ch20 == YES){ //Ch20 restrictions
            if (ChapterQuestionInt < 57){
                PreviousCard.hidden = YES;
            } else {
                PreviousCard.hidden = NO;
            }
            if (ChapterQuestionInt > 65){
                NextCard.hidden = YES;
            } else {
                NextCard.hidden = NO;
            }
        }
        if (Ch21 == YES){ //Ch21 restrictions
            if (ChapterQuestionInt < 68){
                PreviousCard.hidden = YES;
            } else {
                PreviousCard.hidden = NO;
            }
            if (ChapterQuestionInt > 82){
                NextCard.hidden = YES;
            } else {
                NextCard.hidden = NO;
            }
        }
        if (Ch22 == YES){ //Ch22 restrictions
            if (ChapterQuestionInt < 85){
                PreviousCard.hidden = YES;
            } else {
                PreviousCard.hidden = NO;
            }
            if (ChapterQuestionInt > 98){
                NextCard.hidden = YES;
            } else {
                NextCard.hidden = NO;
            }
        }
        if (Ch23 == YES){ //Ch23 restrictions
            if (ChapterQuestionInt < 101){
                PreviousCard.hidden = YES;
            } else {
                PreviousCard.hidden = NO;
            }
            if (ChapterQuestionInt > 112){
                NextCard.hidden = YES;
            } else {
                NextCard.hidden = NO;
            }
        }
    }
}
-(void)SecondsVoid{ //Timer Control
    TimerSeconds = TimerSeconds + 1;
    
    //Hours
    if (TimerHour < 10){
        HourReadout = [NSString stringWithFormat:@"0%i", TimerHour];
    } else {
        HourReadout = [NSString stringWithFormat:@"%i", TimerHour];
    }
    
    //Minutes
    if (TimerMinutes == 60){
        MinuteReadout = [NSString stringWithFormat:@"00"];
        TimerMinutes = 0;
    }
    if (TimerMinutes < 10){
        MinuteReadout = [NSString stringWithFormat:@"0%i", TimerMinutes];
    } else {
        MinuteReadout = [NSString stringWithFormat:@"%i", TimerMinutes];
    }
    
    //Seconds
    if (TimerSeconds == 60){
        SecondsReadout = [NSString stringWithFormat:@"00"];
        TimerSeconds = 0;
    } else if (TimerSeconds < 10){
        SecondsReadout = [NSString stringWithFormat:@"0%i", TimerSeconds];
    } else {
        SecondsReadout = [NSString stringWithFormat:@"%i", TimerSeconds];
    }
    
    //Update Integers
    if (TimerSeconds == 59){
        TimerMinutes = TimerMinutes + 1;
        
    }
    if (TimerMinutes == 59){
        TimerMinutes = 0;
        TimerHour = TimerHour + 1;
    }
    
    //UI
    if (TimerHour == 0){
        TimerLabelSeconds.text = [NSString stringWithFormat:@"Time, %@:%@", MinuteReadout, SecondsReadout];
    } else {
        TimerLabelSeconds.text = [NSString stringWithFormat:@"Time, %@:%@:%@", HourReadout, MinuteReadout, SecondsReadout];
    }
    //Time Stamp
    totalTimeString = [NSString stringWithFormat:@"Time Studied, %@:%@:%@", HourReadout, MinuteReadout, SecondsReadout];
}
//Converts Seconds > 59 = Mintes & Minutes = Hours > 59 //Days
-(void)ConvertDataLog{
    ConvertSeconds = LogSeconds - 60;
    ConvertMinutes = LogMinutes - 60;
    
    if (ConvertSeconds < 0){
        LogSeconds = LogSeconds;
    } else {
        LogMinutes = LogMinutes + 1;
        LogSeconds = LogSeconds - 60;
        [self ConvertDataLog];
    }
    if (ConvertMinutes < 0){
        LogMinutes = LogMinutes;
    } else {
        LogHours = LogHours + 1;
        LogMinutes = LogMinutes - 60;
        [self ConvertDataLog];
    }
    //Develper
    NSLog(@"Converted Seconds: %i", LogSeconds); //Logs Seconds
    NSLog(@"Converted Minutes: %i", LogMinutes); //Logs Minutes
    NSLog(@"Converted Hours: %i", LogHours);     //Logs Hour
    //End Dervelper
    
    //Re-saved log data
    //[UserDefaults setObject:LogArray forKey:@"BookMarks"]; //Saves BookMarks
    [[NSUserDefaults standardUserDefaults] setInteger:LogSeconds forKey:@"LogSeconds"]; //Resaves logged seconds
    [[NSUserDefaults standardUserDefaults] setInteger:LogMinutes forKey:@"LogMinutes"]; //Resaves logged minutes
    [[NSUserDefaults standardUserDefaults] setInteger:LogHours forKey:@"LogHours"]; //Resaves logged hours
}
-(void)CommonVoidUnits{
    if (FlashCards == YES){
        if (BeginningBOOL == YES){
            BeginningBOOL = NO;
            QuestionNumberInt = 1;
            //GUI
            Unit1Button.hidden = YES; Unit2Button.hidden = YES; Unit3Button.hidden = YES; Unit4Button.hidden = YES; Unit5Button.hidden = YES;
            
            MainTitle.hidden = YES; FlashCardTitle.hidden = NO; Answertocard.hidden = NO; BackButton.hidden = YES; ReturnButton.hidden = NO;
            
            TimerLabelSeconds.hidden = NO; QuestionNumber.hidden = NO;
            //End GUI
            
            //Inital Time Stamp
            CurrentDate = [NSDate date];
            intialTimeFormat = [[NSDateFormatter alloc] init];
            [intialTimeFormat setDateFormat:@"hh:mm a"];
            intialTimeString = [intialTimeFormat stringFromDate:CurrentDate];
            
            Timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(SecondsVoid) userInfo:nil repeats:YES];
            
        }
        //UI Element Control
        FlashCardTitle.text = [NSString stringWithFormat:@"%@", ReturnString];
        AnswertocardLabel.text = [NSString stringWithFormat:@"%@", AnswerString];
        [ReturnButton setTitle:@"Pause" forState:UIControlStateNormal];
        
        if (Unit1BOOL == YES){
            QuestionNumber.text = [NSString stringWithFormat:@"Question %i/128", QuestionNumberInt];
            PauseString = @"Unit 1";
        } else if (Unit2BOOL == YES){
            QuestionNumber.text = [NSString stringWithFormat:@"Question %i/282", QuestionNumberInt];
            PauseString = @"Unit 2";
        } else if (Unit3BOOL == YES){
            QuestionNumber.text = [NSString stringWithFormat:@"Question %i/226", QuestionNumberInt];
            PauseString = @"Unit 3";
        } else if (Unit4BOOL == YES){
            QuestionNumber.text = [NSString stringWithFormat:@"Question %i/267", QuestionNumberInt];
            PauseString = @"Unit 4";
        } else if (Unit5BOOL == YES){
            QuestionNumber.text = [NSString stringWithFormat:@"Question %i/300", QuestionNumberInt];
            PauseString = @"Unit 5";
        }
        
        if (Answer == NO){
            Answer = YES;
            AnswertocardLabel.hidden = YES;
            AnswerScroll.hidden = YES;
            [Answertocard setTitle:@"Reveal Answer" forState:UIControlStateNormal];
        } else {
            nil;
        }
        
        //Develper
        NSLog(@"Previous search method %i", PreviousResultInt); // Previous == Search method
        //End Develper
        
        //Integer Control
        PreviousResultInt = QuestionInt;
        //End Integer Control
    
        [self QuestionSelectorVoid];
    }
}
-(void)CommonTermUnits{
    if (BeginningBOOL == YES){
        //Boolien Control
        BeginningBOOL = NO;
        //End Boolien Control
        
        //GUI Control
        Answertocard.hidden = NO; TimerLabelSeconds.hidden = NO;
        //End GUI Control
        
        //Integer control
        QuestionNumberInt = 1;
        //End Integer Control
        
        //Inital Time Stamp
        CurrentDate = [NSDate date];
        intialTimeFormat = [[NSDateFormatter alloc] init];
        [intialTimeFormat setDateFormat:@"hh:mm a"];
        intialTimeString = [intialTimeFormat stringFromDate:CurrentDate];
        
        Timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(SecondsVoid) userInfo:nil repeats:YES];
        
    }
    //GUI Control
    MainTitle.hidden = YES; FlashCardTitle.hidden = NO; Unit1Scroll.hidden = YES; Unit2Scroll.hidden = YES; Unit3Scroll.hidden = YES;
    
    Unit4Scroll.hidden = YES; Unit5Scroll.hidden = YES; BackButton.hidden = YES; ReturnButton.hidden = NO; QuestionNumber.hidden = NO;
    
    //End GUI Control
    
    //UI Element Control
    FlashCardTitle.text = [NSString stringWithFormat:@"%@", ReturnString];
    AnswertocardLabel.text = [NSString stringWithFormat:@"%@", AnswerString];
    [ReturnButton setTitle:@"Pause" forState:UIControlStateNormal];
    
    if (Ch1 == YES){
        QuestionNumber.text = [NSString stringWithFormat:@"Question %i/14", QuestionNumberInt];
        PauseString = @"Chapter 1";
    } else if (Ch2 == YES){
        QuestionNumber.text = [NSString stringWithFormat:@"Question %i/12", QuestionNumberInt];
        PauseString = @"Chapter 2";
    } else if (Ch3 == YES){
        QuestionNumber.text = [NSString stringWithFormat:@"Question %i/12", QuestionNumberInt];
        PauseString = @"Chapter 3";
    } else if (Ch4 == YES){
        QuestionNumber.text = [NSString stringWithFormat:@"Question %i/12", QuestionNumberInt];
        PauseString = @"Chapter 4";
    } else if (Ch5 == YES){
        QuestionNumber.text = [NSString stringWithFormat:@"Question %i/15", QuestionNumberInt];
        PauseString = @"Chapter 5";
    } else if (Ch6 == YES){
        QuestionNumber.text = [NSString stringWithFormat:@"Question %i/11", QuestionNumberInt];
        PauseString = @"Chapter 6";
    } else if (Ch7 == YES){
        QuestionNumber.text = [NSString stringWithFormat:@"Question %i/10", QuestionNumberInt];
        PauseString = @"Chapter 7";
    } else if (Ch8 == YES){
        QuestionNumber.text = [NSString stringWithFormat:@"Question %i/10", QuestionNumberInt];
        PauseString = @"Chapter 8";
    } else if (Ch9 == YES){
        QuestionNumber.text = [NSString stringWithFormat:@"Question %i/17", QuestionNumberInt];
        PauseString = @"Chapter 9";
    } else if (Ch10 == YES){
        QuestionNumber.text = [NSString stringWithFormat:@"Question %i/16", QuestionNumberInt];
        PauseString = @"Chapter 10";
    } else if (Ch11 == YES){
        QuestionNumber.text = [NSString stringWithFormat:@"Question %i/19", QuestionNumberInt];
        PauseString = @"Chapter 11";
    } else if (Ch12 == YES){
        QuestionNumber.text = [NSString stringWithFormat:@"Question %i/12", QuestionNumberInt];
        PauseString = @"Chapter 12";
    } else if (Ch13 == YES){
        QuestionNumber.text = [NSString stringWithFormat:@"Question %i/18", QuestionNumberInt];
        PauseString = @"Chapter 13";
    } else if (Ch14 == YES){
        QuestionNumber.text = [NSString stringWithFormat:@"Question %i/17", QuestionNumberInt];
        PauseString = @"Chapter 14";
    } else if (Ch15 == YES){
        QuestionNumber.text = [NSString stringWithFormat:@"Question %i/13", QuestionNumberInt];
        PauseString = @"Chapter 15";
    } else if (Ch16 == YES){
        QuestionNumber.text = [NSString stringWithFormat:@"Question %i/14", QuestionNumberInt];
        PauseString = @"Chapter 16";
    } else if (Ch17 == YES){
        QuestionNumber.text = [NSString stringWithFormat:@"Question %i/11", QuestionNumberInt];
        PauseString = @"Chapter 17";
    } else if (Ch18 == YES){
        QuestionNumber.text = [NSString stringWithFormat:@"Question %i/15", QuestionNumberInt];
        PauseString = @"Chapter 18";
    } else if (Ch19 == YES){
        QuestionNumber.text = [NSString stringWithFormat:@"Question %i/15", QuestionNumberInt];
        PauseString = @"Chapter 19";
    } else if (Ch20 == YES){
        QuestionNumber.text = [NSString stringWithFormat:@"Question %i/11", QuestionNumberInt];
        PauseString = @"Chapter 20";
    } else if (Ch21 == YES){
        QuestionNumber.text = [NSString stringWithFormat:@"Question %i/18", QuestionNumberInt];
        PauseString = @"Chapter 21";
    } else if (Ch22 == YES){
        QuestionNumber.text = [NSString stringWithFormat:@"Question %i/16", QuestionNumberInt];
        PauseString = @"Chapter 22";
    } else if (Ch23 == YES){
        QuestionNumber.text = [NSString stringWithFormat:@"Question %i/14", QuestionNumberInt];
        PauseString = @"Chapter 23";
    }
    //End Element Control
    
    if (Answer == NO){
        Answer = YES;
        AnswertocardLabel.hidden = YES;
        AnswerScroll.hidden = YES;
        [Answertocard setTitle:@"Reveal Answer" forState:UIControlStateNormal];
    } else {
        nil;
    }
    [self QuestionSelectorVoid];
}
//Search Bar Set Up:
-(void)BeginSearch{
    if ([SearchBar.text  isEqual: @""]){
        FlashCardTitle.text = @"Nothing Entered"; //User did not enter any string
        
    } else {
        [Answertocard setTitle:@"Reveal Answer" forState:UIControlStateNormal];
        ReadOutLine = SearchBar.text;
        FirstCase = [NSString stringWithFormat:@"%c", [ReadOutLine characterAtIndex:1-1]];
        UpperCase = [FirstCase uppercaseString]; LowerCase = [FirstCase lowercaseString];
        UppercaseEnd = [NSString stringWithFormat:@"%@%@",UpperCase, ReadOutLine];
        LowercaseEnd = [NSString stringWithFormat:@"%@%@", LowerCase, ReadOutLine];
        NextStringUpper = [UppercaseEnd substringWithRange:NSMakeRange(2, [UppercaseEnd length]-2)];
        NextStringLower = [LowercaseEnd substringWithRange:NSMakeRange(2, [LowercaseEnd length]-2)];
        EndStringUpper = [NSString stringWithFormat:@"%@%@", UpperCase, NextStringUpper]; EndStringLower = [NSString stringWithFormat:@"%@%@", LowerCase, NextStringLower];
        
        [SearchBar resignFirstResponder];
        
        Cycletimer = [NSTimer scheduledTimerWithTimeInterval:0.00001 target:self selector:@selector(CycleVoid) userInfo:nil repeats:YES]; //Starts search
        Timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(SecondsVoid) userInfo:nil repeats:YES]; //Restarts the timer
        
        //Boolien Control
        SearchBOOL = YES; Answer = YES; NoResults = YES; FirstResultBOOL = YES; PauseBOOL = NO;
        //End Boolien Control
        
        //GUI
        QuitButton.hidden = YES; SearchButton.hidden = YES; ResumeButton.hidden = YES;
        //End GUI
        
        //Integer Control
        if (FlashCards == YES){
            QuestionInt = 0;
        }
        if (Terms == YES){
            ChapterQuestionInt = 0;
        }
        
    }
    //GUI
    MainTitle.hidden = YES; FlashCardTitle.hidden = NO;
}
-(void)ConflictCheck{
    //Conflict Tree
    if (FlashCards == YES & Terms == YES){
        FlashCards = YES; Terms = NO;
    }
    
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{ //Begins Search Method
    [self BeginSearch];
    NSLog(@"Begining Search Process");
}
    //Search Bar Editing:
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{ //Begin Typing
    //GUI
    ResumeButton.hidden = YES; QuitButton.hidden = YES; QuestionNumber.hidden = YES; TimerLabelSeconds.hidden = YES; MainTitle.hidden = YES; FlashCardTitle.hidden = NO;
    
    FlashCardTitle.text = @"Search For a Term...";
    
        return YES;
}
-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{ //End Typing
    //GUI
    ResumeButton.hidden = NO; QuitButton.hidden = NO; MainTitle.hidden = NO; FlashCardTitle.hidden = YES;
    
        return YES;
}
#pragma mark - UISetup & Protocols
//Orintations Lock into view
- (NSUInteger)supportedInterfaceOrientation //Orintation Lock
{
    return UIInterfaceOrientationMaskLandscape;
}
//Disable keyboard, dismiss keyboard
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UIView * txt in self.view.subviews){
        if ([txt isKindOfClass:[UISearchBar class]] && [txt isFirstResponder]) {
            [txt resignFirstResponder];
        }
    }
}
//Interuption Protocols
- (BOOL)prefersStatusBarHidden {
    return true;
}

#pragma mark - IBAction Senders
-(IBAction)Settings:(id)sender{
    //GUI
    EraseAllDataButton.hidden = NO;
    SettingButton.hidden = YES;
    BackButton.hidden = NO;
    FlashCardsButton.hidden = YES;
    TermsButton.hidden = YES;
    StudyLog.hidden = YES;
    Unit1Button.hidden = YES; Unit2Button.hidden = YES; Unit3Button.hidden = YES; Unit4Button.hidden = YES; Unit5Button.hidden = YES;
    Unit1Scroll.hidden = YES; Unit2Scroll.hidden = YES; Unit3Scroll.hidden = YES; Unit4Scroll.hidden = YES; Unit5Scroll.hidden = YES;
    //End GUI
    
    //BOOL
    FlashCards = NO; Terms = NO;
    
    //UI Changes
    MainTitle.text = @"Settings";
    //End UI Changes
    
    //Timer Control
    [LogTimer invalidate];
    //End Timer Control
}
-(IBAction)EraseData:(id)sender{
    InitialLoad = 0;
    LogSeconds = 0;
    LogMinutes = 0;
    LogHours = 0;
    //GUI
    
    //Saves log data
    [[NSUserDefaults standardUserDefaults] setInteger:InitialLoad forKey:@"InitialInt"]; //Resaves logged seconds
    [[NSUserDefaults standardUserDefaults] setInteger:LogSeconds forKey:@"LogSeconds"];
    [[NSUserDefaults standardUserDefaults] setInteger:LogMinutes forKey:@"LogMinutes"];
    [[NSUserDefaults standardUserDefaults] setInteger:LogHours forKey:@"LogHours"];
    //Develper
    
    //UI Changes
    //User Data logs
    if (LogSeconds < 1 & LogMinutes < 1 & LogHours < 1){
        MainTitle.text = @"Data Log Erased";
    } else {
        nil;
    }
    //End UI Changes
    
    NSLog(@"Seconds logged %@ Erase data: %i", LogSeconds);
    NSLog(@"Minutes logged %@ Erase data: %i", LogMinutes);
    NSLog(@"Hours logged %@ Erase data: %i", LogHours);
    //End Develper
    
}

-(IBAction)StudyLog:(id)sender{
    
}
-(IBAction)Terms:(id)sender{
        //GUI
        Unit1Scroll.hidden = NO; Unit2Scroll.hidden = NO; Unit3Scroll.hidden = NO; Unit4Scroll.hidden = NO; Unit5Scroll.hidden = NO;
    
        Unit1Button.hidden = YES; Unit2Button.hidden = YES; Unit3Button.hidden = YES; Unit4Button.hidden = YES; Unit5Button.hidden = YES;
    
        TermsButton.hidden = YES; FlashCardsButton.hidden = YES; StudyLog.hidden = YES; BackButton.hidden = NO; SettingButton.hidden = YES;
        //End GUI
    
        //Boolien Control
        Terms = YES; FlashCards = NO; BeginningBOOL = YES; RetrunBOOL = NO; Answer = NO;
        //End Boolien Control

        //UI Element Control
        MainTitle.text = @"What's the issue?";
        //End UI Element Control
        
        //Timer Control
        //End Timer Control
}
//All chapter Action sender contain two lines of empty code (EM)
-(IBAction)TermCH1:(id)sender{
    [self performSelector:@selector(ChapterTerms) withObject:nil afterDelay:0.1];
    [self performSelector:@selector(CommonTermUnits) withObject:nil afterDelay:0.1];
    ChapterQuestionInt = 114;
    Ch1 = YES; Ch2 = NO; Ch3 = NO; Ch4 = NO; Ch5 = NO; Ch6 = NO; Ch7 = NO; Ch8 = NO; Ch9 = NO; Ch10 = NO; Ch11 = NO; Ch12 = NO; Ch13 = NO; Ch14 = NO; Ch15 = NO; Ch16 = NO; Ch17 = NO; Ch18 = NO; Ch19 = NO; Ch20 = NO; Ch21 = NO; Ch22 = NO; Ch23 = NO;
}
-(IBAction)TermCH2:(id)sender{
    [self performSelector:@selector(CommonTermUnits) withObject:nil afterDelay:0.01];
    [self performSelector:@selector(ChapterTerms) withObject:nil afterDelay:0.1];
    ChapterQuestionInt = 128;
    QuestionNumberInt = ChapterQuestionInt;
    Ch1 = NO; Ch2 = YES; Ch3 = NO; Ch4 = NO; Ch5 = NO; Ch6 = NO; Ch7 = NO; Ch8 = NO; Ch9 = NO; Ch10 = NO; Ch11 = NO; Ch12 = NO; Ch13 = NO; Ch14 = NO; Ch15 = NO; Ch16 = NO; Ch17 = NO; Ch18 = NO; Ch19 = NO; Ch20 = NO; Ch21 = NO; Ch22 = NO; Ch23 = NO;

}
-(IBAction)TermCH3:(id)sender{
    [self performSelector:@selector(ChapterTerms) withObject:nil afterDelay:0.01];
    [self performSelector:@selector(CommonTermUnits) withObject:nil afterDelay:0.01];
    ChapterQuestionInt = 140;
    QuestionNumberInt = ChapterQuestionInt;
    Ch1 = NO; Ch2 = NO; Ch3 = YES; Ch4 = NO; Ch5 = NO; Ch6 = NO; Ch7 = NO; Ch8 = NO; Ch9 = NO; Ch10 = NO; Ch11 = NO; Ch12 = NO; Ch13 = NO; Ch14 = NO; Ch15 = NO; Ch16 = NO; Ch17 = NO; Ch18 = NO; Ch19 = NO; Ch20 = NO; Ch21 = NO; Ch22 = NO; Ch23 = NO;
}
-(IBAction)TermCH4:(id)sender{
    [self performSelector:@selector(ChapterTerms) withObject:nil afterDelay:0.01];
    [self performSelector:@selector(CommonTermUnits) withObject:nil afterDelay:0.01];
    ChapterQuestionInt = 152;
    QuestionNumberInt = ChapterQuestionInt;
    Ch1 = NO; Ch2 = NO; Ch3 = NO; Ch4 = YES; Ch5 = NO; Ch6 = NO; Ch7 = NO; Ch8 = NO; Ch9 = NO; Ch10 = NO; Ch11 = NO; Ch12 = NO; Ch13 = NO; Ch14 = NO; Ch15 = NO; Ch16 = NO; Ch17 = NO; Ch18 = NO; Ch19 = NO; Ch20 = NO; Ch21 = NO; Ch22 = NO; Ch23 = NO;
}
-(IBAction)TermCH5:(id)sender{
    [self performSelector:@selector(ChapterTerms) withObject:nil afterDelay:0.01];
    [self performSelector:@selector(CommonTermUnits) withObject:nil afterDelay:0.01];
    ChapterQuestionInt = 174;
    QuestionNumberInt = ChapterQuestionInt;
    Ch1 = NO; Ch2 = NO; Ch3 = NO; Ch4 = NO; Ch5 = YES; Ch6 = NO; Ch7 = NO; Ch8 = NO; Ch9 = NO; Ch10 = NO; Ch11 = NO; Ch12 = NO; Ch13 = NO; Ch14 = NO; Ch15 = NO; Ch16 = NO; Ch17 = NO; Ch18 = NO; Ch19 = NO; Ch20 = NO; Ch21 = NO; Ch22 = NO; Ch23 = NO;

}
-(IBAction)TermCH6:(id)sender{
    [self performSelector:@selector(ChapterTerms) withObject:nil afterDelay:0.01];
    [self performSelector:@selector(CommonTermUnits) withObject:nil afterDelay:0.01];
    ChapterQuestionInt = 189;
    QuestionNumberInt = ChapterQuestionInt;
    Ch1 = NO; Ch2 = NO; Ch3 = NO; Ch4 = NO; Ch5 = NO; Ch6 = YES; Ch7 = NO; Ch8 = NO; Ch9 = NO; Ch10 = NO; Ch11 = NO; Ch12 = NO; Ch13 = NO; Ch14 = NO; Ch15 = NO; Ch16 = NO; Ch17 = NO; Ch18 = NO; Ch19 = NO; Ch20 = NO; Ch21 = NO; Ch22 = NO; Ch23 = NO;
}
-(IBAction)TermCH7:(id)sender{
    [self performSelector:@selector(ChapterTerms) withObject:nil afterDelay:0.01];
    [self performSelector:@selector(CommonTermUnits) withObject:nil afterDelay:0.01];
    ChapterQuestionInt = 200;
    QuestionNumberInt = ChapterQuestionInt;
    Ch1 = NO; Ch2 = NO; Ch3 = NO; Ch4 = NO; Ch5 = NO; Ch6 = NO; Ch7 = YES; Ch8 = NO; Ch9 = NO; Ch10 = NO; Ch11 = NO; Ch12 = NO; Ch13 = NO; Ch14 = NO; Ch15 = NO; Ch16 = NO; Ch17 = NO; Ch18 = NO; Ch19 = NO; Ch20 = NO; Ch21 = NO; Ch22 = NO; Ch23 = NO;
}
-(IBAction)TermCH8:(id)sender{
    [self performSelector:@selector(ChapterTerms) withObject:nil afterDelay:0.01];
    [self performSelector:@selector(CommonTermUnits) withObject:nil afterDelay:0.01];
    ChapterQuestionInt = 210;
    QuestionNumberInt = ChapterQuestionInt;
    Ch1 = NO; Ch2 = NO; Ch3 = NO; Ch4 = NO; Ch5 = NO; Ch6 = NO; Ch7 = NO; Ch8 = YES; Ch9 = NO; Ch10 = NO; Ch11 = NO; Ch12 = NO; Ch13 = NO; Ch14 = NO; Ch15 = NO; Ch16 = NO; Ch17 = NO; Ch18 = NO; Ch19 = NO; Ch20 = NO; Ch21 = NO; Ch22 = NO; Ch23 = NO;
}
-(IBAction)TermCH9:(id)sender{
    [self performSelector:@selector(ChapterTerms) withObject:nil afterDelay:0.01];
    [self performSelector:@selector(CommonTermUnits) withObject:nil afterDelay:0.01];
    ChapterQuestionInt = 220;
    QuestionNumberInt = ChapterQuestionInt;
    Ch1 = NO; Ch2 = NO; Ch3 = NO; Ch4 = NO; Ch5 = NO; Ch6 = NO; Ch7 = NO; Ch8 = NO; Ch9 = YES; Ch10 = NO; Ch11 = NO; Ch12 = NO; Ch13 = NO; Ch14 = NO; Ch15 = NO; Ch16 = NO; Ch17 = NO; Ch18 = NO; Ch19 = NO; Ch20 = NO; Ch21 = NO; Ch22 = NO; Ch23 = NO;
}
-(IBAction)TermCH10:(id)sender{
    [self performSelector:@selector(ChapterTerms) withObject:nil afterDelay:0.01];
    [self performSelector:@selector(CommonTermUnits) withObject:nil afterDelay:0.01];
    ChapterQuestionInt = 236;
    QuestionNumberInt = ChapterQuestionInt;
    Ch1 = NO; Ch2 = NO; Ch3 = NO; Ch4 = NO; Ch5 = NO; Ch6 = NO; Ch7 = NO; Ch8 = NO; Ch9 = NO; Ch10 = YES; Ch11 = NO; Ch12 = NO; Ch13 = NO; Ch14 = NO; Ch15 = NO; Ch16 = NO; Ch17 = NO; Ch18 = NO; Ch19 = NO; Ch20 = NO; Ch21 = NO; Ch22 = NO; Ch23 = NO;
}
-(IBAction)TermCH11:(id)sender{
    [self performSelector:@selector(ChapterTerms) withObject:nil afterDelay:0.01];
    [self performSelector:@selector(CommonTermUnits) withObject:nil afterDelay:0.01];
    ChapterQuestionInt = 252;
    QuestionNumberInt = ChapterQuestionInt;
    Ch1 = NO; Ch2 = NO; Ch3 = NO; Ch4 = NO; Ch5 = NO; Ch6 = NO; Ch7 = NO; Ch8 = NO; Ch9 = NO; Ch10 = NO; Ch11 = YES; Ch12 = NO; Ch13 = NO; Ch14 = NO; Ch15 = NO; Ch16 = NO; Ch17 = NO; Ch18 = NO; Ch19 = NO; Ch20 = NO; Ch21 = NO; Ch22 = NO; Ch23 = NO;
}
-(IBAction)TermCH12:(id)sender{
    [self performSelector:@selector(ChapterTerms) withObject:nil afterDelay:0.01];
    [self performSelector:@selector(CommonTermUnits) withObject:nil afterDelay:0.01];
    ChapterQuestionInt = 270;
    QuestionNumberInt = ChapterQuestionInt;
    Ch1 = NO; Ch2 = NO; Ch3 = NO; Ch4 = NO; Ch5 = NO; Ch6 = NO; Ch7 = NO; Ch8 = NO; Ch9 = NO; Ch10 = NO; Ch11 = NO; Ch12 = YES; Ch13 = NO; Ch14 = NO; Ch15 = NO; Ch16 = NO; Ch17 = NO; Ch18 = NO; Ch19 = NO; Ch20 = NO; Ch21 = NO; Ch22 = NO; Ch23 = NO;
}
-(IBAction)TermCH13:(id)sender{
    [self performSelector:@selector(ChapterTerms) withObject:nil afterDelay:0.01];
    [self performSelector:@selector(CommonTermUnits) withObject:nil afterDelay:0.01];
    ChapterQuestionInt = 282;
    QuestionNumberInt = ChapterQuestionInt;
    Ch1 = NO; Ch2 = NO; Ch3 = NO; Ch4 = NO; Ch5 = NO; Ch6 = NO; Ch7 = NO; Ch8 = NO; Ch9 = NO; Ch10 = NO; Ch11 = NO; Ch12 = NO; Ch13 = YES; Ch14 = NO; Ch15 = NO; Ch16 = NO; Ch17 = NO; Ch18 = NO; Ch19 = NO; Ch20 = NO; Ch21 = NO; Ch22 = NO; Ch23 = NO;
}
-(IBAction)TermCH14:(id)sender{
    [self performSelector:@selector(ChapterTerms) withObject:nil afterDelay:0.01];
    [self performSelector:@selector(CommonTermUnits) withObject:nil afterDelay:0.01];
    ChapterQuestionInt = 300;
    QuestionNumberInt = ChapterQuestionInt;
    Ch1 = NO; Ch2 = NO; Ch3 = NO; Ch4 = NO; Ch5 = NO; Ch6 = NO; Ch7 = NO; Ch8 = NO; Ch9 = NO; Ch10 = NO; Ch11 = NO; Ch12 = NO; Ch13 = NO; Ch14 = YES; Ch15 = NO; Ch16 = NO; Ch17 = NO; Ch18 = NO; Ch19 = NO; Ch20 = NO; Ch21 = NO; Ch22 = NO; Ch23 = NO;
}
-(IBAction)TermCH15:(id)sender{
    [self performSelector:@selector(ChapterTerms) withObject:nil afterDelay:0.01];
    [self performSelector:@selector(CommonTermUnits) withObject:nil afterDelay:0.01];
    ChapterQuestionInt = 317;
    QuestionNumberInt = ChapterQuestionInt;
    Ch1 = NO; Ch2 = NO; Ch3 = NO; Ch4 = NO; Ch5 = NO; Ch6 = NO; Ch7 = NO; Ch8 = NO; Ch9 = NO; Ch10 = NO; Ch11 = NO; Ch12 = NO; Ch13 = NO; Ch14 = NO; Ch15 =YES; Ch16 = NO; Ch17 = NO; Ch18 = NO; Ch19 = NO; Ch20 = NO; Ch21 = NO; Ch22 = NO; Ch23 = NO;
}
-(IBAction)TermCH16:(id)sender{
    [self performSelector:@selector(ChapterTerms) withObject:nil afterDelay:0.01];
    [self performSelector:@selector(CommonTermUnits) withObject:nil afterDelay:0.01];
    ChapterQuestionInt = 1;
    QuestionNumberInt = ChapterQuestionInt;
    Ch1 = NO; Ch2 = NO; Ch3 = NO; Ch4 = NO; Ch5 = NO; Ch6 = NO; Ch7 = NO; Ch8 = NO; Ch9 = NO; Ch10 = NO; Ch11 = NO; Ch12 = NO; Ch13 = NO; Ch14 = NO; Ch15 = NO; Ch16 = YES; Ch17 = NO; Ch18 = NO; Ch19 = NO; Ch20 = NO; Ch21 = NO; Ch22 = NO; Ch23 = NO;
}
-(IBAction)TermCH17:(id)sender{
    [self performSelector:@selector(ChapterTerms) withObject:nil afterDelay:0.01];
    [self performSelector:@selector(CommonTermUnits) withObject:nil afterDelay:0.01];
    ChapterQuestionInt = 15;
    QuestionNumberInt = ChapterQuestionInt;
    Ch1 = NO; Ch2 = NO; Ch3 = NO; Ch4 = NO; Ch5 = NO; Ch6 = NO; Ch7 = NO; Ch8 = NO; Ch9 = NO; Ch10 = NO; Ch11 = NO; Ch12 = NO; Ch13 = NO; Ch14 = NO; Ch15 = NO; Ch16 = NO; Ch17 = YES; Ch18 = NO; Ch19 = NO; Ch20 = NO; Ch21 = NO; Ch22 = NO; Ch23 = NO;
}
-(IBAction)TermCH18:(id)sender{
    [self performSelector:@selector(ChapterTerms) withObject:nil afterDelay:0.01];
    [self performSelector:@selector(CommonTermUnits) withObject:nil afterDelay:0.01];
    ChapterQuestionInt = 26;
    QuestionNumberInt = ChapterQuestionInt;
    Ch1 = NO; Ch2 = NO; Ch3 = NO; Ch4 = NO; Ch5 = NO; Ch6 = NO; Ch7 = NO; Ch8 = NO; Ch9 = NO; Ch10 = NO; Ch11 = NO; Ch12 = NO; Ch13 = NO; Ch14 = NO; Ch15 = NO; Ch16 = NO; Ch17 = NO; Ch18 = YES; Ch19 = NO; Ch20 = NO; Ch21 = NO; Ch22 = NO; Ch23 = NO;
}
-(IBAction)TermCH19:(id)sender{
    [self performSelector:@selector(ChapterTerms) withObject:nil afterDelay:0.01];
    [self performSelector:@selector(CommonTermUnits) withObject:nil afterDelay:0.01];
    ChapterQuestionInt = 41;
    QuestionNumberInt = ChapterQuestionInt;
    Ch1 = NO; Ch2 = NO; Ch3 = NO; Ch4 = NO; Ch5 = NO; Ch6 = NO; Ch7 = NO; Ch8 = NO; Ch9 = NO; Ch10 = NO; Ch11 = NO; Ch12 = NO; Ch13 = NO; Ch14 = NO; Ch15 = NO; Ch16 = NO; Ch17 = NO; Ch18 = NO; Ch19 = YES; Ch20 = NO; Ch21 = NO; Ch22 = NO; Ch23 = NO;
}
-(IBAction)TermCH20:(id)sender{
    [self performSelector:@selector(ChapterTerms) withObject:nil afterDelay:0.01];
    [self performSelector:@selector(CommonTermUnits) withObject:nil afterDelay:0.01];
    ChapterQuestionInt = 56;
    QuestionNumberInt = ChapterQuestionInt;
    Ch1 = NO; Ch2 = NO; Ch3 = NO; Ch4 = NO; Ch5 = NO; Ch6 = NO; Ch7 = NO; Ch8 = NO; Ch9 = NO; Ch10 = NO; Ch11 = NO; Ch12 = NO; Ch13 = NO; Ch14 = NO; Ch15 = NO; Ch16 = NO; Ch17 = NO; Ch18 = NO; Ch19 = NO; Ch20 = YES; Ch21 = NO; Ch22 = NO; Ch23 = NO;
}
-(IBAction)TermCH21:(id)sender{
    [self performSelector:@selector(ChapterTerms) withObject:nil afterDelay:0.01];
    [self performSelector:@selector(CommonTermUnits) withObject:nil afterDelay:0.01];
    ChapterQuestionInt = 67;
    QuestionNumberInt = ChapterQuestionInt;
    Ch1 = NO; Ch2 = NO; Ch3 = NO; Ch4 = NO; Ch5 = NO; Ch6 = NO; Ch7 = NO; Ch8 = NO; Ch9 = NO; Ch10 = NO; Ch11 = NO; Ch12 = NO; Ch13 = NO; Ch14 = NO; Ch15 = NO; Ch16 = NO; Ch17 = NO; Ch18 = NO; Ch19 = NO; Ch20 = NO; Ch21 = YES; Ch22 = NO; Ch23 = NO;
}
-(IBAction)TermCH22:(id)sender{
    [self performSelector:@selector(ChapterTerms) withObject:nil afterDelay:0.01];
    [self performSelector:@selector(CommonTermUnits) withObject:nil afterDelay:0.01];
    ChapterQuestionInt = 84;
    QuestionNumberInt = ChapterQuestionInt;
    Ch1 = NO; Ch2 = NO; Ch3 = NO; Ch4 = NO; Ch5 = NO; Ch6 = NO; Ch7 = NO; Ch8 = NO; Ch9 = NO; Ch10 = NO; Ch11 = NO; Ch12 = NO; Ch13 = NO; Ch14 = NO; Ch15 = NO; Ch16 = NO; Ch17 = NO; Ch18 = NO; Ch19 = NO; Ch20 = NO; Ch21 = NO; Ch22 = YES; Ch23 = NO;
}
-(IBAction)TermCH23:(id)sender{
    [self performSelector:@selector(ChapterTerms) withObject:nil afterDelay:0.01];
    [self performSelector:@selector(CommonTermUnits) withObject:nil afterDelay:0.01];
    ChapterQuestionInt = 100;
    QuestionNumberInt = ChapterQuestionInt;
    Ch1 = NO; Ch2 = NO; Ch3 = NO; Ch4 = NO; Ch5 = NO; Ch6 = NO; Ch7 = NO; Ch8 = NO; Ch9 = NO; Ch10 = NO; Ch11 = NO; Ch12 = NO; Ch13 = NO; Ch14 = NO; Ch15 = NO; Ch16 = NO; Ch17 = NO; Ch18 = NO; Ch19 = NO; Ch20 = NO; Ch21 = NO; Ch22 = NO; Ch23 = YES;
}
-(IBAction)FlashCards:(id)sender{ //Flashcard selector
        //GUI
        Unit1Button.hidden = NO; Unit2Button.hidden = NO; Unit3Button.hidden = NO; Unit4Button.hidden = NO; Unit5Button.hidden = NO;
    
        Unit1Scroll.hidden = YES; Unit2Scroll.hidden = YES; Unit3Scroll.hidden = YES; Unit4Scroll.hidden = YES; Unit5Scroll.hidden = YES;
    
        FlashCardsButton.hidden = YES; BackButton.hidden = NO; TermsButton.hidden = YES; StudyLog.hidden = YES; SettingButton.hidden = YES;

        //Boolien Control
        Answer = NO; Condition = YES; RetrunBOOL = NO; FlashCards = YES; Terms = NO; BeginningBOOL = YES;
        //End Bollien Control
        
        //End GUI
        
        //UI element control
        MainTitle.text = @"Select a unit";
        //End UI element control
}
-(IBAction)Unit1:(id)sender{ //PreHistory- 600 BCE Term Numbers: #1-55
    //Unique code
    QuestionInt = 1;
    QuestionNumberInt = QuestionInt;
    Unit1BOOL = YES;
    Unit2BOOL = NO;
    Unit3BOOL = NO;
    Unit4BOOL = NO;
    Unit5BOOL = NO;
    //Common code
    [self QuestionsVoid];
    [self performSelector:@selector(CommonVoidUnits) withObject:nil afterDelay:0.1];
    
}

-(IBAction)Unit2:(id)sender{ //600 BCE - 1450 CE Term Numbers: #128 - 410
    //Unique code
    QuestionInt = 128;
    QuestionNumberInt = QuestionInt;
    Unit1BOOL = NO;
    Unit2BOOL = YES;
    Unit3BOOL = NO;
    Unit4BOOL = NO;
    Unit5BOOL = NO;
    //Common code
    [self QuestionsVoid];
    [self performSelector:@selector(CommonVoidUnits) withObject:nil afterDelay:0.1];
    
}
-(IBAction)Unit3:(id)sender{ //1450 CE - 1750 CE Term Numbers: #411 - 637
    //Unique code
    QuestionInt = 411;
    QuestionNumberInt = QuestionInt;
    Unit1BOOL = NO;
    Unit2BOOL = NO;
    Unit3BOOL = YES;
    Unit4BOOL = NO;
    Unit5BOOL = NO;
    //Common code
    [self QuestionsVoid];
    [self performSelector:@selector(CommonVoidUnits) withObject:nil afterDelay:0.1];
    
}
-(IBAction)Unit4:(id)sender{ //1750 CE - 1914 CE Term Numbers: #638 - 905
    //Unique code
    QuestionInt = 638;
    QuestionNumberInt = QuestionInt;
    Unit1BOOL = NO;
    Unit2BOOL = NO;
    Unit3BOOL = NO;
    Unit4BOOL = YES;
    Unit5BOOL = NO;
    //Common code
    [self QuestionsVoid];
    [self performSelector:@selector(CommonVoidUnits) withObject:nil afterDelay:0.1];
    
}
-(IBAction)Unit5:(id)sender{ //1914 CE - Present day Term
    //Unique code
    QuestionInt = 905;
    QuestionNumberInt = QuestionInt;
    Unit1BOOL = NO;
    Unit2BOOL = NO;
    Unit3BOOL = NO;
    Unit4BOOL = NO;
    Unit5BOOL = YES;
    //Common code
    [self QuestionsVoid];
    [self performSelector:@selector(CommonVoidUnits) withObject:nil afterDelay:0.1];
    
}
-(IBAction)Return:(id)sender{ //Return, Pause
    [self PauseVoid];
}
-(IBAction)ResumeButton:(id)sender{ //Resume Buttons Remains the same for every menu selection
    //FlashCards Resume Method
    if (SearchBOOL == YES){
        //GUI
            //Next Button
        if (QuestionInt == 1100 || ChapterQuestionInt == 329){
            NextCard.hidden = YES;
        
        } else if (QuestionInt < 1100 || ChapterQuestionInt < 329){
            NextCard.hidden = NO;
        }
            //Previous Button
        if (FirstResult == QuestionInt || FirstResult == ChapterQuestionInt){
            PreviousCard.hidden = YES;
        } else if (FirstResult != QuestionInt || FirstResult != ChapterQuestionInt){
            PreviousCard.hidden = NO;
        }
        
        if (FlashCards == YES){
            QuestionNumber.text = [NSString stringWithFormat:@"Question %i/1100", QuestionInt];
        } else if (Terms == YES){
            QuestionNumber.text = [NSString stringWithFormat:@"Question %i/329", ChapterQuestionInt];

        }
        
        
    } else if (SearchBOOL == NO){
        if (FlashCards == YES){
            FlashCards = YES;
            
            [self performSelector:@selector(CommonVoidUnits) withObject:nil afterDelay:0.1];

        } else if (Terms == YES){
            Terms = YES;
            
            [self performSelector:@selector(CommonTermUnits) withObject:nil afterDelay:0.1];
        }
        NoResults = YES;
        
        if (NoResults == YES){
            AnswertocardLabel.hidden = YES;
            AnswerScroll.hidden = YES;
        } else {
            AnswertocardLabel.hidden = NO;
            AnswerScroll.hidden = NO;
        }
        if (FirstResult == QuestionInt){
            NextCard.hidden = NO;
            PreviousCard.hidden = YES;
        } else {
            NextCard.hidden = NO;
            PreviousCard.hidden = NO;
        }
        

    }
    //Common Code
    Timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(SecondsVoid) userInfo:nil repeats:YES];

    //GUI
    SearchButton.hidden = YES; SearchBar.hidden = YES; ResumeButton.hidden = YES; ReturnButton.hidden = NO; TimerLabelSeconds.hidden = NO;
    
    FlashCardTitle.hidden = NO; Answertocard.hidden = NO; MarginLine.hidden = NO; QuestionNumber.hidden = NO; QuitButton.hidden = YES;
    
    MainTitle.hidden = YES; FlashCardTitle.hidden = NO; TimerLabelSeconds.hidden = NO;
    //End GUI
    
    //Booliens
    PauseBOOL = NO;
    
    [self QuestionSelectorVoid];
}
-(IBAction)QuitButton:(id)sender{ //Retrun to main menu
    //GUI
    NextResultBOOL = NO;
    SearchBOOL = NO;
    BackButton.hidden = NO;
    [self performSelector:@selector(Begining) withObject:nil afterDelay:0.001];
        
    //Study Log update
    LogSeconds = TimerSeconds + LogSeconds;
    LogMinutes = TimerMinutes + LogMinutes;
    LogHours = TimerHour + LogHours;
    
    [self ConvertDataLog];
    [self TimeStamp];
    //Timer Control
    [Timer invalidate];
    [Cycletimer invalidate];
}
-(void)TimeStamp{
    //Creates TimeStamp
    CurrentDate = [NSDate date];
    dateFormat = [[NSDateFormatter alloc] init];
    finalTimeFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    [finalTimeFormat setDateFormat:@"hh:mm a"];
    dateString = [dateFormat stringFromDate:CurrentDate];
    finalTimeString = [finalTimeFormat stringFromDate:CurrentDate];
    
    if (TimerSeconds == 0 & TimerMinutes == 0 & TimerHour == 0){
        NSLog(@"No Time Studied");
        nil;
    } else {
        dateTimeString = [NSString stringWithFormat:@"%@, %@ - %@ %@", dateString, intialTimeString, finalTimeString, totalTimeString];
        [LogArray insertObject:dateTimeString atIndex:0];
            //Save
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:LogArray forKey:@"StudyLogArray"];
        [userDefaults synchronize];
    }
        //Develeper
    NSLog(@"Array: %@", LogArray);
}

-(IBAction)FlashCardNext:(id)sender{ //Next Term : Next Notes
    if (NextResultBOOL == YES){
        SearchBOOL = YES; NextSelect = YES;
        //GUI
        ResumeButton.hidden = YES; QuitButton.hidden = YES; SearchButton.hidden = YES;
        //End GUI
        
        [self performSelector:@selector(Reference) withObject:nil afterDelay:0.01];
        
        if (Answer == NO){
            Answer = YES;
            AnswertocardLabel.hidden = YES;
            AnswerScroll.hidden = YES;
            [Answertocard setTitle:@"Reveal Answer" forState:UIControlStateNormal];
        } else {
            nil;
        }

    } else if (NextResultBOOL == NO){
        if (FlashCards == YES){
            //Common code
            [self performSelector:@selector(QuestionsVoid) withObject:nil afterDelay:0.1];
            [self performSelector:@selector(CommonVoidUnits) withObject:nil afterDelay:0.1];
            QuestionInt = QuestionInt + 1;
            QuestionNumberInt = QuestionNumberInt + 1;

        } else if (Terms == YES){
            //Common code
            [self performSelector:@selector(ChapterTerms) withObject:nil afterDelay:0.1];
            [self performSelector:@selector(CommonTermUnits) withObject:nil afterDelay:0.1];
            ChapterQuestionInt = ChapterQuestionInt + 1;
            QuestionNumberInt = QuestionNumberInt + 1;

        }
        
         AnswerScroll.contentSize = CGSizeMake(AnswerScroll.frame.size.width,AnswerScroll.frame.size.height);
        
        [self QuestionSelectorVoid];
    }

}
-(IBAction)PreviousCard:(id)sender{ //Previous Term
    if (NextResultBOOL == YES){
        SearchBOOL = YES; PreviousSelect = YES;
        //GUI
        ResumeButton.hidden = YES; QuitButton.hidden = YES; SearchButton.hidden = YES;
        //End GUI
        
        [self performSelector:@selector(Reference) withObject:nil afterDelay:0.01];
        
        if (Answer == NO){
            Answer = YES;
            AnswertocardLabel.hidden = YES;
            AnswerScroll.hidden = YES;
            [Answertocard setTitle:@"Reveal Answer" forState:UIControlStateNormal];
        } else {
            nil;
        }
        
    } else if (NextResultBOOL == NO){
        if (FlashCards == YES){
            //Common code
            [self performSelector:@selector(QuestionsVoid) withObject:nil afterDelay:0.1];
            [self performSelector:@selector(CommonVoidUnits) withObject:nil afterDelay:0.1];
            QuestionInt = QuestionInt - 1;
            QuestionNumberInt = QuestionNumberInt - 1;

        } else if (Terms == YES){
            //Common code
            [self performSelector:@selector(ChapterTerms) withObject:nil afterDelay:0.1];
            [self performSelector:@selector(CommonTermUnits) withObject:nil afterDelay:0.1];
            ChapterQuestionInt = ChapterQuestionInt - 1;
            ///Chapter == QuestionINt
            
            QuestionNumberInt = QuestionNumberInt - 1;
        }
        [self QuestionSelectorVoid];

    }
}
-(void)Reference{
    if (NextSelect == YES & PreviousSelect == YES){
        NextSelect = NO; PreviousSelect = NO;
    } else {
        Cycletimer = [NSTimer scheduledTimerWithTimeInterval:0.0001 target:self selector:@selector(CycleVoid) userInfo:nil repeats:YES];

    }
    
}
-(IBAction)AnswerToCard:(id)sender{
    if (FlashCards == YES){
        if (Answer == YES){ //Reveals Answer
            Answer = NO;
            AnswertocardLabel.hidden = NO;
            AnswerScroll.hidden = NO;
            Answertocard.hidden = NO;
            [Answertocard setTitle:@"Hide Answer" forState:UIControlStateNormal]; //Common Style
        } else { //Hides Answer
            Answer = YES;
            AnswertocardLabel.hidden = YES;
            AnswerScroll.hidden = YES;
            Answertocard.hidden = NO;
            [Answertocard setTitle:@"Reveal Answer" forState:UIControlStateNormal]; // Common Style
        }
    }
    if (Terms == YES){
        if (Answer == YES){ //Reveals Answer
            Answer = NO;
            AnswertocardLabel.hidden = NO;
            AnswerScroll.hidden = NO;
            Answertocard.hidden = NO;
            [Answertocard setTitle:@"Hide Answer" forState:UIControlStateNormal]; //Common Style
        } else { //Hides Answer
            Answer = YES;
            AnswertocardLabel.hidden = YES;
            AnswerScroll.hidden = NO;
            Answertocard.hidden = NO;
            [Answertocard setTitle:@"Reveal Answer" forState:UIControlStateNormal]; //Common Style
        }
    }
}
-(IBAction)SearchButton:(id)sender{ //Needs to eliminate all spaces
    [self BeginSearch];
    
}
-(IBAction)RetrunSearch:(id)sender{
    if (FlashCards == YES){
        //Boolien Control
        SearchBOOL = NO; FlashCards = YES; NextResultBOOL = NO; NextSelect = NO; PreviousSelect = NO; FirstResultBOOL = NO;
        //End Boolien Control
        
        //Integer Control
        QuestionInt = PreviousQuestionInt;
        //End Integer Control
        
        //GUI
        QuitButton.hidden = YES; SearchButton.hidden = YES; PreviousQuestion.hidden = YES; SearchBar.hidden = YES; ReturnButton.hidden = NO;
        
        TimerLabelSeconds.hidden = NO; Answertocard.hidden = NO; QuestionNumber.hidden = NO; ResumeButton.hidden = YES; MainTitle.hidden = YES;
        
        FlashCardTitle.hidden = NO;
        
        [SearchBar resignFirstResponder];
        //End GUI
        
        [self performSelector:@selector(QuestionsVoid) withObject:nil afterDelay:0.01];
        [self performSelector:@selector(CommonVoidUnits) withObject:nil afterDelay:0.01];
        
        if (PauseBOOL == YES){
            Timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(SecondsVoid) userInfo:nil repeats:YES];
            
        }
    } else if (Terms == YES){
        //Boolien Control
        SearchBOOL = NO; FlashCards = NO; Terms = YES; NextResultBOOL = NO;
        //End Boolien Control
        
        //Integer Control
        ChapterQuestionInt = PreviousTermInt;
        //End Integer Control
        
        //GUI
        QuitButton.hidden = YES; SearchButton.hidden = YES; PreviousQuestion.hidden = YES; SearchBar.hidden = YES; ReturnButton.hidden = NO;
        
        TimerLabelSeconds.hidden = NO; Answertocard.hidden = NO; QuestionNumber.hidden = NO; ResumeButton.hidden = YES;
        
        [SearchBar resignFirstResponder];
        //End GUI
        
        [self performSelector:@selector(ChapterTerms) withObject:nil afterDelay:0.01];
        [self performSelector:@selector(CommonTermUnits) withObject:nil afterDelay:0.01];
        
        if (PauseBOOL == YES){
            Timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(SecondsVoid) userInfo:nil repeats:YES];
        }
    }
    NextResultBOOL = NO; SearchBOOL = NO;
}

#pragma mark - Data Arangments
//All Data Bases
-(void)QuestionsVoid{ //Flash Cards Data Base
    
    if (QuestionInt == 1){
        ReturnString = @"Prehistory vs. History";
        //
        
        AnswerString = @"Prehistory: no written documents; History: written proof of history";
        //
        
    }
    if (QuestionInt == 2){
        ReturnString= @"Features of civilization";
        //
        
        AnswerString = @"Social etiquette, religion, education, literature. The term civilization is normally used to designate large societies with cities and powerful states. While there were many differences between civilizations, they also shared important features. They all produced agricultural surpluses that permitted significant specialization of labor. All civilizations contained cities and generated complex institutions, such as political bureaucracies, armies, and religious hierarchies. They also featured clearly stratified social hierarchies and organized long-distance trading relationships. (AP)";
        
    }
    if (QuestionInt == 3){
        ReturnString= @"Stages of hominid development";
        //
        
        AnswerString = @"Austrolopithecus, homo habilis, homo erectus, homo sapiens";
        //
    }
    if (QuestionInt == 4){
        ReturnString= @"Out of Africa thesis vs. multiregional thesis";
        
        AnswerString = @"Humans originated from Africa and proliferated vs. originated from Africa but multiple geographical locations first 100 million years";
        //
        
    }
    if (QuestionInt == 5){
        ReturnString= @"Paleolithic Era";
        //
        
        AnswerString = @"Old Stone Age";
        //
        
    }
    if (QuestionInt == 6){
        ReturnString= @"Neolithic Era";
        //
        
        AnswerString = @"New Stone Age";
        //
        
    }
    if (QuestionInt == 7){
        ReturnString= @"Family units, clans, tribes";
        //
        
        AnswerString = @"A group of people sharing common ancestry";
        //
        
    }
    if (QuestionInt == 8){
        ReturnString= @"Foraging societies";
        //
        
        AnswerString = @"Nomadic, small communities and population, no political system, economic distribution is more equal";
        //
        
    }
    if (QuestionInt == 9){
        ReturnString= @"Nomadic hunters/gatherers";
        //
        
        AnswerString = @"Move place to place according to environment; adapts to environment";
        //
        
    }
    if (QuestionInt == 10){
        ReturnString= @"Ice Age";
        //
        
        AnswerString = @"Period of time where Earth was covered partly in ice";
        //
        
    }
    if (QuestionInt == 11){
        ReturnString= @"Civilization";
        //
        
        AnswerString = @"Changes when agriculture started";
        //
        
    }
    if (QuestionInt == 12){
        ReturnString= @"Neolithic Revolution";
        //
        
        AnswerString = @"Farming uses; start of agriculture";
        //
        
    }
    if (QuestionInt == 13){
        ReturnString= @"Domestication of plants and animals";
        //
        
        AnswerString = @"Farming system where animals are taken to different locations in order to find fresh pastures";
        //
        
    }
    if (QuestionInt == 14){
        ReturnString= @"Nomadic pastoralism";
        //
        
        AnswerString = @"Slash-and-burn; once land is depleted, moved on to let soil recover";
        //
        
    }
    if (QuestionInt == 15){
        ReturnString= @"Migratory farmers";
        //
        
        AnswerString = @"Farmers that migrate instead of settling after using up the land.";
        //
        
    }
    if (QuestionInt == 16){
        ReturnString= @"Partrilineal/patrilocal";
        //
        
        AnswerString = @"Live with husband’s family. Traced through father’s lineage";
        //
        
    }
    if (QuestionInt == 17){
        ReturnString= @"Irrigation systems";
        //
        
        AnswerString = @"Replacement or supplementation of rainfall with water from another source in order to grow crops";
        //
        
    }
    if (QuestionInt == 18){
        ReturnString= @"Metalworking";
        //
        
        AnswerString = @"Craft and practice of working with metals to create parts or structures. It requires skill and the use of many different types of tools";
        //
        
    }
    if (QuestionInt == 19){
        ReturnString= @"Ethnocentrism";
        //
        
        AnswerString = @"To look at the world primarily from the perspective of one's own culture";
        //
        
        
    }
    if (QuestionInt == 20){
        ReturnString= @"Foraging";
        //4
        
        AnswerString = @"Looking for food";
        //
        
        
    }
    if (QuestionInt == 21){
        ReturnString= @"Sedentary agriculture";
        //
        
        AnswerString = @"Domestication of plants and animals";
        //
        
        
    }
    if (QuestionInt == 22){
        ReturnString= @"Shifting cultivation";
        //
        
        AnswerString = @"Process by which people take an area of land to use for agriculture, only to abandon it a short time later";
        //
        
        
    }
    if (QuestionInt == 23){
        ReturnString= @"Slash-and-burn agriculture";
        //
        
        AnswerString = @"Trees cut down, plots made for agriculture";
        //
        
        
    }
    if (QuestionInt == 24){
        ReturnString= @"Matrilineal";
        //
        
        AnswerString = @"System in which one belongs to mother’s lineage";
        //
        
        
    }
    if (QuestionInt == 25){
        ReturnString= @"Cultural diffusion";
        //
        
        AnswerString = @"Spread of ideas and material culture, especially if these occur independently of population movement";
        //
        
        
    }
    if (QuestionInt == 26){
        ReturnString= @"Independent invention";
        //
        
        AnswerString = @"Creative innovations of new solutions to old and new problems";
        //
        
        
    }
    if (QuestionInt == 27){
        ReturnString= @"Specialization of labor";
        //
        
        AnswerString = @"Specialization of co-operative labor in specific, circumscribed tasks and roles, intended to increase efficiency of output.";
        //
        
        
    }
    if (QuestionInt == 28){
        ReturnString= @"Gender division of labor";
        //
        
        AnswerString = @"Labor divided between man and woman, hunting and gathering etc.";
        //
        
        
    }
    if (QuestionInt == 29){
        ReturnString= @"Metallurgy and metalworking";
        //
        
        AnswerString = @"The physical and chemical behavior of metallic elements and their mixtures, which are called alloys. craft and practice of working with metals to create parts or structures";
        //
        
        
    }
    if (QuestionInt == 30){
        ReturnString= @"Fertile Crescent";
        //
        
        AnswerString = @"A region in the Middle East incorporating present-day Israel, West Bank, and Lebanon and parts of Jordan, Syria, Iraq and south-eastern Turkey.";
        //
        
        
    }
    if (QuestionInt == 31){
        ReturnString= @"Gilgamesh";
        //
        
        AnswerString = @"Gilgamesh became a legendary protagonist in the Epic of Gilgamesh.";
        //
        
        
    }
    if (QuestionInt == 32){
        ReturnString= @"Hammurabi’s Law Code";
        //
        
        AnswerString = @"First set of defined laws within a civilization, stated eye for an eye.";
        //
        
        
    }
    if (QuestionInt == 33){
        ReturnString= @"Egypt";
        //
        
        AnswerString = @"The civilization of the Lower Nile Valley, between the First Cataract and the mouths of the Nile Delta, from circa 3300 BC until the conquest of Alexander the Great in 332 BC. As a civilization based on irrigation, it is the quintessential example of a hydraulic empire.";
        //
        
        
    }
    if (QuestionInt == 34){
        ReturnString= @"Egyptian Book of the Dead";
        //
        
        AnswerString = @"common name for the ancient Egyptian funerary texts. Constituted a collection of spells, charms, passwords, numbers and magical formulas for use by the deceased in the afterlife, describing many of the basic tenets of Egyptian mythology. They were intended to guide the dead through the various trials that they would encounter before reaching the underworld. Knowledge of the appropriate spells was considered essential to achieving happiness after death.";
        //
        
        
    }
    if (QuestionInt == 35){
        ReturnString= @"Pyramids";
        //
        
        AnswerString = @"Tombs for egyptian kings.";
        //
        
        
    }
    if (QuestionInt == 36){
        ReturnString= @"Hieroglyphics";
        //
        
        AnswerString = @"System of writing used by the Ancient Egyptians, using a combination of logographic, syllabic, and alphabetic elements.";
        //
        
        
    }
    if (QuestionInt == 37){
        ReturnString= @"State";
        //
        
        AnswerString = @"States were powerful new systems of rule that mobilized surplus labor and resources over large areas. Early states were often led by a ruler whose source of power was believed to be divine or had divine support and/or who was supported by the military.";
        //
        
        
    }
    if (QuestionInt == 38){
        ReturnString= @"Early China";
        //
        
        AnswerString = @"Xia, Shang, Zhou, Warring States Period, Qin, Han";
        //
        
        
    }
    if (QuestionInt == 39){
        ReturnString= @"The Celts";
        //
        
        AnswerString = @"Group of peoples that occupied lands stretching from the British Isles to Gallatia. Went to war with Romans.";
        //
        
        
    }
    if (QuestionInt == 40){
        ReturnString= @"The Hittites and iron weapons";
        //
        
        AnswerString = @"First to work iron, first to enter Iron Age. controlled central Anatolia, north-western Syria down to Ugarit, and Mesopotamia down to Babylon, lasted from roughly 1680 BC to about 1180 BC. After 1180 BC, the Hittite polity disintegrated into several independent city-states, some of which survived as late as around 700 BC.";
        //
        
        
    }
    if (QuestionInt == 41){
        ReturnString= @"The Assyrians and cavalry warfare";
        //
        
        AnswerString = @"Indigenous people of Mesopotamia and have a history spanning over 6700 years. Started cavalry warfare?";
        //
        
        
    }
    if (QuestionInt == 42){
        ReturnString= @"The Persian Empire";
        //
        
        AnswerString = @"Used to refer to a number of historic dynasties that have ruled the country of Persia (Iran). the Achaemenid Empire that emerged under Cyrus the Great that is usually the earliest to be called ""Persian."" Successive states in Iran before 1935 are collectively called the Persian Empire by Western historians";
        //
        
        
    }
    if (QuestionInt == 43){
        ReturnString= @"The Hebrews and monotheism";
        //
        
        AnswerString = @"Descendants of biblical Patriarch Eber; were people who lived in the Levant, which was politically Canaan when they first arrived in the area. First monotheistic group; Yahweh.";
        //
        
        
    }
    if (QuestionInt == 44){
        ReturnString= @"The Phoenicians and the alphabet";
        //
        
        AnswerString = @"Enterprising maritime trading culture that spread right across the Mediterranean during the first millennium BC. First form of language.";
        //
        
        
    }
    if (QuestionInt == 45){
        ReturnString= @"The Lydians and coinage";
        //
        
        AnswerString = @"Ancient kingdom of Asia Minor, first to mint coins.";
        //
        
        
    }
    if (QuestionInt == 46){
        ReturnString= @"Greek city-states";
        //
        
        AnswerString = @"Region controlled exclusively by Greek, and usually having sovereignty. Ex. Crete";
        //
        
        
    }
    if (QuestionInt == 47){
        ReturnString= @"Democracy";
        //
        
        AnswerString = @"Form of government in which policy is decided by the preference of the majority in a decision-making process, usually elections or referendums, open to all or most citizens.";
        //
        
        
    }
    if (QuestionInt == 48){
        ReturnString= @"Persian Wars";
        //
        
        AnswerString = @"A series of conflicts between the Greek world and the Persian Empire that started about 500 BC and lasted until 448 BC.";
        //
        
        
    }
    if (QuestionInt == 49){
        ReturnString= @"Peloponnesian War";
        //
        
        AnswerString = @"Began in 431 BC between the Athenian Empire (or The Delian League) and the Peloponnesian League which included Sparta and Corinth.";
        //
        
        
    }
    if (QuestionInt == 50){
        ReturnString= @"Alexander the Great";
        //
        
        AnswerString = @"United Ancient Greece; Hellenistic Age, conquered a large empire.";
        //
        
        
    }
    if (QuestionInt == 51){
        ReturnString= @"Hellenism";
        //
        
        AnswerString = @"Shift from a culture dominated by ethnic Greeks to a culture dominated by Greek-speakers of various ethnicities, and from the political dominance of the city-state to that of larger monarchies. In this period the traditional Greek culture was changed by strong Eastern influences, especially Persian, in aspects of religion and government. Cultural centers shifted away from mainland Greece, to Pergamon, Rhodes, Antioch and Alexandria.";
        //
        
        
    }
    if (QuestionInt == 52){
        ReturnString= @"Homer";
        //
        
        AnswerString = @"Legendary early Greek poet and rhapsode traditionally credited with authorship of the major Greek epics Iliad and Odyssey";
        //
        
        
    }
    if (QuestionInt == 53){
        ReturnString= @"Socrates and Plato";
        //
        
        AnswerString = @"Greek philosopher/student.";
        //
        
        
    }
    if (QuestionInt == 54){
        ReturnString= @"Aristotle";
        //
        
        AnswerString = @"Along with Plato, he is often considered to be one of the two most influential philosophers in Western thought. He wrote many books about physics, poetry, zoology, logic, government, and biology.";
        //
        
        
    }
    if (QuestionInt == 55){
        ReturnString= @"Western scientific thought";
        //
        
        AnswerString = @"Systematic apporach of observation, hypothesis formation, hypothesis testing and hypothesis evaluation that forms the basis for modern science.";
        //
    }
    
    if (QuestionInt == 56){
        ReturnString= @"Roman Republic";
        //
        
        AnswerString = @"Srepublican government of the city of Rome and its territories from 510 BC until the establishment of the Roman Empire, which sometimes placed at 44 BC the year of Caesar's appointment as perpetual dictator or, more commonly, 27 BC the year that the Roman Senate granted Octavian the title ""Augustus"".";
        //
    }
    
    if (QuestionInt == 57){
        ReturnString= @"Plebians vs. patricians";
        //
        
        AnswerString = @"peasants/slaves vs. elite/upperclass";
        //
    }
    
    if (QuestionInt == 58){
        ReturnString= @"Punic Wars";
        //
        
        AnswerString = @"Series of three wars fought between Rome and the Phoenician city of Carthage. Reason: clash of interests between the expanding Carthaginian and Roman spheres of influence.";
        //
    }
    if (QuestionInt == 59){
        ReturnString= @"Julius Caesar";
        //
        
        AnswerString = @"Roman military and political leader. He was instrumental in the transformation of the Roman Republic into the Roman Empire. Dictator for life.";
        //
    }
    if (QuestionInt == 60){
        ReturnString= @"Roman Empire";
        //
        
        AnswerString = @"Ancient Roman polity in the centuries following its reorganization under the leadership of Octavian.";
        //
    }
    if (QuestionInt == 61){
        ReturnString= @"Qin, Han, Tang Dynasties";
        //
        
        AnswerString = @"First three dynasties of China that we have recordings of. First of 'centralized' China.";
        //
    }
    if (QuestionInt == 62){
        ReturnString= @"Shi Huangdi";
        //
        
        AnswerString = @"King of the Chinese State of Qin from 247 BC to 221 BC, and then the first emperor of a unified China from 221 BC to 210 BC, ruling under the name First Emperor.";
        //
    }
    if (QuestionInt == 63){
        ReturnString= @"Chinese tributary system";
        //
        
        AnswerString = @"Dorm of conducting diplomatic and political relations with China before the fall of the Qin Dynasty.";
        //
    }
    if (QuestionInt == 64){
        ReturnString= @"The Silk Road";
        //
        
        AnswerString = @"Interconnected series of routes through Southern Asia traversed by caravan and ocean vessel.";
        //
    }
    if (QuestionInt == 65){
        ReturnString= @"Nara and Heian Japan";
        //
        
        AnswerString = @"Ast division of classical Japanese history, running from 794 to 1185. The Heian period is considered the peak of the Japanese imperial court and noted for its art, especially poetry and literature. Nara: agricultural in nature, centered around villages. Most of the villagers followed the Shinto religion, based around the worship of natural and ancestral spirits.";
        //
    }
    if (QuestionInt == 66){
        ReturnString= @"The Fujiwara clan";
        //
        
        AnswerString = @"Dominated the Japanese politics of Heian period.";
        //
    }
    if (QuestionInt == 67){
        ReturnString= @"Lady Murasaki and “The Tale of Genji";
        //
        
        AnswerString = @"Written by Murasaki. First novel of japanese/world literature.";
        //
    }
    if (QuestionInt == 68){
        ReturnString= @"Central Asia and Mongolia";
        //
        
        AnswerString = @"Historically been closely tied to its nomadic peoples and the Silk Road. As a result, it has acted as a crossroads for the movement of people, goods, and ideas between Europe, the Middle East, South Asia, and East Asia";
        //
    }
    if (QuestionInt == 69){
        ReturnString= @"The Aryan invasion of India";
        //
        
        AnswerString = @"Aryans invaded and destroyed Indus River civilization, settled, moved to Ganges River.";
        //
    }
    if (QuestionInt == 70){
        ReturnString= @"Dravidians";
        //
        
        AnswerString = @"People of southern and central India and northern Sri Lanka who speak Dravidian languages, the best known of which are Tamil, Telugu, Kannada and Malayalam.";
        //
    }
    if (QuestionInt == 71){
        ReturnString= @"Indian caste system";
        //
        
        AnswerString = @"sAstem was a basically simple division of society into four castes (Brahman, Kshatriya, Vaishya and Sudra) arranged in a hierarchy, with the ""Untouchable"" (Dalit) outcasts below this structure. But socially the caste system was more complicated, with many more castes and sub-castes and other divisions.";
        //
    }
    if (QuestionInt == 72){
        ReturnString= @"Ashoka";
        //
        
        AnswerString = @"Of the Mauryan empire from 273 BC to 232 BC. A convert to Buddhism.";
        //
    }
    if (QuestionInt == 73){
        ReturnString= @"Constantinople/Byzantine Empire";
        //
        
        AnswerString = @"Made into second capital by Constantine in attempts to help Rome turn its economy around.";
        //
    }
    if (QuestionInt == 74){
        ReturnString= @"Justinian";
        //
        
        AnswerString = @"R. 527 - 565 CE – Justinian is the Eastern Roman emperor who tried to restore the unity of the old Roman Empire. He issued the most famous compilation of Roman Law. He was unable to maintain a hold in Italy and lost the provinces of north Africa. It was the last effort to restore the Mediterranean unity.";
        //
    }
    if (QuestionInt == 75){
        ReturnString= @"Early Medieval Europe “Dark Ages”";
        //
        
        AnswerString = @"A period in history between the last emperor of Rome, 475 A.D., and the Renaissance, about 1450 (15th century). Art production during this period was dominated by the Catholic Church.";
        //
    }
    if (QuestionInt == 76){
        ReturnString= @"Feudalism";
        //
        
        AnswerString = @"The social organization created by exchanging grants of lands r fiefs in return for formal oaths of allegiance and promises of loyal service; typical of Zhou dynasty and European Middle Ages; greater lords provided protection and aid to lesser lords in return for military service.";
        //
    }
    if (QuestionInt == 77){
        ReturnString= @"Charlemagne";
        //
        
        AnswerString = @"Charles the Great; Carolingian monarch who established substantial empire in France and Germany (800 C.E). He helped restore some church-based education in western Europe, and the level of intellectual activity began a slow recovering. After death, the empire could not survive.";
        //
    }
    if (QuestionInt == 78){
        ReturnString= @"Mohammed and the foundation of Islam";
        //
        
        AnswerString = @"In 610/earlier, he received the first of many revelations: Allah transmitted to him through the angel Gabriel. Believed in the five pillars: (1) “There is no God but Allah, and Muhammad is his Prophet.” (2) Pray facing the Mecca five times a day. (3) Fast during the month of Ramadan which enhances community solidarity and allowed the faithful to demonstrate their fervor. (4) The zakat, tithe for charity, strengthened community cohesion. (5) The haji, pilgrimage to the holy city Mecca, to worship Allah at the Ka’ba.";
        //
    }
    if (QuestionInt == 79){
        ReturnString= @"Umayyad and Abbasid caliphates";
        //
        
        AnswerString = @"Umayyad: Clan of Quraysh that dominated politics and commercial economy of Mecca; clan later able to establish dynasty as rulers of Islam.  Abbasid: Dynasty that succeeded the Umayyads as caliphs within Islam (750 C.E.) A caliph is a political and religious successor to Muhammad.";
        //
    }
    if (QuestionInt == 80){
        ReturnString= @"Bantu and their migrations";
        //
        
        AnswerString = @"To the 10th century, the wave reached the east African interior. Bantu-speaking herders in the north and farmers in the south mixed with older populations in the region. Others were moving to the African coast. Thus creating coastal trading ports.";
        //
    }
    if (QuestionInt == 81){
        ReturnString= @"Nubia";
        //
        
        AnswerString = @"The Coptic (Christians of Egypt) influence spread up the Nile into Nubia (the ancient land of Kush). Muslims attempted to penetrate Nubia and met stiff resistance in the 9th century (left Christian descendants of ancient Kush – left as independent Christian kingdom until 13th century).";
        //
    }
    if (QuestionInt == 82){
        ReturnString= @"Ghana";
        //
        
        AnswerString = @"Formed by 8th century by exchanging gold from the forests of west Africa for salt/dates from the Sahara or for goods from Mediterranean north Africa. Camels, were introduced tcreating better trade. By 3rd century C.E. it rose to power by taxing the salt and gold exchanged within its borders. 10th century, rulers had converted to Islam and were at its height of power. Almoravid armies invaded Ghana from north Africa (1076), the power was declining despite the kingdom’s survival. 13th century, new states rose.";
        //
    }
    if (QuestionInt == 83){
        ReturnString= @"Olmec";
        //
        
        AnswerString = @"Cultural tradition that arose at San Lorenzo and La Venta in Mexico (1200 BCE); featured irrigated agriculture, urbanism, elaborate religion, beginnings of calendrical and writing systems.";
        //
    }
    if (QuestionInt == 84){
        ReturnString= @"Maya";
        //
        
        AnswerString = @"Classic culture emerging in southern Mexico and Central American contemporary with Teotihuacán; extended over broad religion; featured monumental architecture, written language, calendrical and mathematical systems, highly developed religion.";
        //
    }
    if (QuestionInt == 85){
        ReturnString= @"Andean societies";
        //
        
        AnswerString = @"developed in the second millennium BCE in the central Andes and the central Pacific coast of South America. While oldest artifacts carbon date around 9750 BCE, evidence of a significant economic surplus begins around 2000 BCE. The Andean civilizations included the urbanized cultures of Chav�n, Moche, Ica-Nazca, Chimu, Tiwanaku, Aymara, Chachapoya, and other Pre-Inca cultures. The semi-urbanized Inca conquered greater Peru in the 15th century. Then, in the 16th century, the European fiefdom of Spain conquered Peru.";
        //
    }
    if (QuestionInt == 86){
        ReturnString= @"Mississippian culture";
        //
        
        AnswerString = @"The Mississippian culture was a Mound-building Native American culture that flourished in the Midwestern, Eastern, and Southeastern United States in the centuries leading up to European contact. The Mississippian way of life began to develop around 900 A.D. in the Mississippi River Valley (for which it is named). Cultures in the Tennessee River Valley may have also begun to develop Mississippian characteristics at this point. The Mississippian (archaeological) Stage is usually considered to come to a close with the arrival of European contact, although the Mississippian way of life continued among their descendants. There are many regional variants of the Mississippian way of life, which are treated together in this article.";
        //
    }
    if (QuestionInt == 87){
        ReturnString= @"Anasazi";
        //
        
        AnswerString = @"Ancestral Puebloans were a prehistoric Native American civilization centered around the present-day Four Corners area of the Southwest United States.";
        //
    }
    if (QuestionInt == 88){
        ReturnString= @"Cultural diffusion versus independent innovation";
        //
        
        AnswerString = @"spread through cultures vs. independent inventing";
        //
    }
    if (QuestionInt == 89){
        ReturnString= @"Aristocracy";
        //
        
        AnswerString = @"System of government with ""rule by the best""";
        //
    }
    if (QuestionInt == 90){
        ReturnString= @"Parliamentary bodies";
        //
        
        AnswerString = @"Senate and ……[peasant voting body]";
        //
    }
    if (QuestionInt == 91){
        ReturnString= @"Oligarchy";
        //
        
        AnswerString = @"Political regime where most political power effectively rests with a small segment of society (typically the most powerful, whether by wealth, military strength, ruthlessness, or political influence).";
        //
    }
    if (QuestionInt == 92){
        ReturnString= @"Republics/democracies";
        //
        
        AnswerString = @"Republic -  state or country that is led by people who do not base their political power on any principle beyond the control of the people living in that state or country. Democracy - form of government in which policy is decided by the preference of the majority in a decision-making process, usually elections or referendums, open to all or most citizens.";
        //
    }
    if (QuestionInt == 93){
        ReturnString= @"Theocracy";
        //
        
        AnswerString = @"Form of government in which a religion or faith plays a dominant role.";
        //
    }
    if (QuestionInt == 94){
        ReturnString= @"Slavery vs. serfdom";
        //
        
        AnswerString = @"Were not property themselves and could not be sold apart from the land which they worked. Serfdom is the forced labour of serfs, on the fields of the privileged land owners, in return for protection and the right to work on their leased fields.";
        //
    }
    if (QuestionInt == 95){
        ReturnString= @"War";
        //
        
        AnswerString = @"State of widespread conflict between states, organisations, or relatively large groups of people, which is characterised by the use of violent, physical force between combatants or upon civilians.";
        //
    }
    
    if (QuestionInt == 96){
        ReturnString= @"Trade routes";
        //
        
        AnswerString = @"Sequence of pathways and stopping places used for the commercial transport of cargo.";
        //
    }
    
    if (QuestionInt == 97){
        ReturnString= @"Polynesian migrations";
        //
        
        AnswerString = @"Most likely began from the islands of Fiji, Tonga and Samoa, spreading east, south, and north, covering millions of square miles of ocean sparsely dotted with islands.Polynesians migrated throughout the Pacific in sailing canoes, ultimately forming a triangle, whose points are Aotearoa (New Zealand) to the southwest, Rapa Nui (Easter Island) to the east, and the Hawaiian Archipelago to the north.";
        //
    }
    
    if (QuestionInt == 98){
        ReturnString= @"Eurasia’s great age of migrations";
        //
        
        AnswerString = @"Increase in migrations from Eurasia.";
        //
    }
    
    if (QuestionInt == 99){
        ReturnString= @"Polytheism";
        //
        
        AnswerString = @"Belief in, or worship of, multiple gods or divinities.";
        //
    }
    
    if (QuestionInt == 100){
        ReturnString= @"Zoroastrianism";
        //
        
        AnswerString = @"One of the world's oldest monotheistic religions. Worship of Wisdom";
        //
    }
    
    if (QuestionInt == 101){
        ReturnString= @"The Ten Commandments";
        //
        
        AnswerString = @"List of religious and moral imperatives which, according to the Bible, was spoken by the god YHWH to Moses on Mount Sinai and engraved on two stone tablets.";
        //
    }
    
    if (QuestionInt == 102){
        ReturnString= @"The Torah";
        //
        
        AnswerString = @"Refers to the first section of the Tanakh–the first five books of the Hebrew Bible, or the Five Books of Moses, but can also be used in the general sense to also include both the Written and Oral Law.";
        //
    }
    
    if (QuestionInt == 103){
        ReturnString= @"The Talmud";
        //
        
        AnswerString = @"Of a series of disputations that took place in Europe during the Middle Ages, a group of rabbis were called upon to defend the Talmud. The attacks against Judaism was based on a long held idea that rabbis had ""distorted"" the Bible through their interpretations, keeping Jews from ""adopting"" Christianity.";
        //
    }
    
    if (QuestionInt == 104){
        ReturnString= @"YHWH";
        //
        
        AnswerString = @"""Yahweh"", God's name.";
        //
    }
    
    if (QuestionInt == 105){
        ReturnString= @"Abraham";
        //
        
        AnswerString = @"The first of the Old Testament patriarchs and the father of Isaac; according to Genesis, God promised to give Abraham's family (the Hebrews) the land of Canaan (the Promised Land); God tested Abraham by asking him to sacrifice his son; ""Judaism, Christianity, and Islam each has a special claim on Abraham""";
        //
    }
    
    if (QuestionInt == 106){
        ReturnString= @"Moses and the Exodus from Egypt – Passover";
        //
        
        AnswerString = @"Passover to celebrate the day the Jews were led out of Egypt and into their land by Moses.";
        //
    }
    
    if (QuestionInt == 107){
        ReturnString= @"David and Solomon";
        //
        
        AnswerString = @"David - Greatest king of jews. Solomon - wisest king on earth; fell to evilness, turned away from his God.";
        //
    }
    
    if (QuestionInt == 108){
        ReturnString= @"Jewish Diaspora";
        //
        
        AnswerString = @"To the dispersion of the Jewish people throughout the world. The notion of diaspora is commonly accepted to have begun with the Babylonian Captivity in 597 BCE.";
        //
    }
    
    if (QuestionInt == 109){
        ReturnString= @"Vedism (Rig-Veda)";
        //
        
        AnswerString = @"Of hymns counted among the four Hindu religious scriptures known as the Vedas, and contains the oldest texts preserved in any Indo-Iranian language.";
        //
    }
    
    if (QuestionInt == 110){
        ReturnString= @"Hinduism (Upanishads, Mahabharata, Bhagavad-Gita)";
        //
        
        AnswerString = @"Encompasses many religious traditions that widely vary by culture, as well as many diverse beliefs and sects. The estimates of Hinduism's origin vary from 3102 BCE to 1300 BCE, and it is generally regarded as the world's oldest major religion.";
        //
    }
    
    if (QuestionInt == 111){
        ReturnString= @"Samsara, karma, dharma";
        //
        
        AnswerString = @"Samsara - transmigration of soul from one body to another, Karma - the law behind reincarnation, Dharma - cosmic ethnics";
        //
    }
    
    if (QuestionInt == 112){
        ReturnString= @"Brahma, Vishnu, Shiva";
        //
        
        AnswerString = @"The Creator, The Preserver, The Destroyer.";
        //
    }
    
    if (QuestionInt == 113){
        ReturnString= @"Laws of Manu";
        //
        
        AnswerString = @"Work of Hindu law and ancient Indian society, written c.200 in India. It is one of the eighteen Smritis of the Dharma Sastra (or ""laws of righteous conduct"");";
        //
    }
    
    if (QuestionInt == 114){
        ReturnString= @"Buddhism";
        //
        
        AnswerString = @"Religion and philosophy based on the teachings of the Buddha, Siddhārtha Gautama. Originating in India, Buddhism gradually spread throughout Asia to Central Asia, Sri Lanka, Tibet, Southeast Asia, as well as the East Asian countries of China, Mongolia, Korea, Japan, Vietnam and Thailand.";
        //
    }
    
    if (QuestionInt == 115){
        ReturnString= @"Four Noble Truths";
        //
        
        AnswerString = @"Fundamental insight or enlightenment of Sakyamuni Buddha (the historical Buddha), which led to the formulation of the Buddhist philosophy.";
        //
    }
    
    if (QuestionInt == 116){
        ReturnString= @"Eightfold Path";
        //
        
        AnswerString = @"Way to the cessation of suffering, the fourth part of the Four Noble Truths.";
        //
    }
    
    if (QuestionInt == 117){
        ReturnString= @"Siddhartha Gautama";
        //
        
        AnswerString = @"Buddha; founder of Buddhism.";
        //
    }
    
    if (QuestionInt == 118){
        ReturnString= @"Nirvana";
        //
        
        AnswerString = @"Not a place nor a state, it is an absolute truth to be realized, and a person can do so without dying.";
        //
    }
    
    if (QuestionInt == 119){
        ReturnString= @"Theravada (Hinayana) and Mahayana Buddhism";
        //
        
        AnswerString = @"T - Buddha is Teacher; M - Buddha is God.";
        //
    }
    
    if (QuestionInt == 120){
        ReturnString= @"Daoism";
        //
        
        AnswerString = @"Set of philosophical teachings and religious practices rooted in a specific metaphysical understanding of the Chinese character Tao. For taoists, Tao could be described as the continuity principle behind the whole process of the constantly changing Universe.";
        //
    }
    
    if (QuestionInt == 121){
        ReturnString= @"Tao-te Chng and the I Ching";
        //
        
        AnswerString = @"The Book of the Way and its Virtue (see chapter below on translating the title) is an ancient Chinese scripture. The work is traditionally said to have been written around 600 BCE by the famous sage called Laozi. oldest of the Chinese classic texts. It describes an ancient system of cosmology and philosophy which is at the heart of Chinese cultural beliefs.";
        //
    }
    
    if (QuestionInt == 122){
        ReturnString= @"Laozi";
        //
        
        AnswerString = @"Founder/teacher of taoism.";
        //
    }
    
    if (QuestionInt == 123){
        ReturnString= @"Confucianism";
        //
        
        AnswerString = @"An East Asian ethical and philosophical system originally developed from the teachings of Confucius.";
        //
    }
    
    if (QuestionInt == 124){
        ReturnString= @"Analects";
        //
        
        AnswerString = @"Record of speeches by Confucius and his disciples, as well as the discussions they held.";
        //
    }
    
    if (QuestionInt == 125){
        ReturnString= @"K’ung Fu-tzu (Confucius)";
        //
        
        AnswerString = @"Teacher/founder of Confucianism.";
        //
    }
    
    if (QuestionInt == 126){
        ReturnString= @"Mandate of Heaven";
        //
        
        AnswerString = @"Blessing of Heaven and that if a king ruled unwisely, Heaven would be displeased and would give the Mandate to someone else.";
        //
    }
    
    if (QuestionInt == 127){
        ReturnString= @"Judeo-Christian tradition";
        //
        
        AnswerString = @"Body of concepts and values which are thought to be held in common by Christianity and Judaism, and typically considered a fundamental basis for Western legal codes and moral values.";
        //
    }
    
    if (QuestionInt == 128){
        ReturnString= @"Jesus of Nazareth";
        //
        
        AnswerString = @"Believed to be the Son of God.";
        //
    }
    
    if (QuestionInt == 129){
        ReturnString= @"The Bible (Old and New Testament)";
        //
        
        AnswerString = @"Holy text of Christianity.";
        //
    }
    
    if (QuestionInt == 130){
        ReturnString= @"Crucifixion and Resurrection (Easter)";
        //
        
        AnswerString = @"Died on Good Friday, resurrected on Easter Sunday.";
        //
    }
    
    if (QuestionInt == 131){
        ReturnString= @"Peter and Paul";
        //
        
        AnswerString = @"Main disciples of Jesus; carried on teaching after death.";
        //
    }
    
    if (QuestionInt == 132){
        ReturnString= @"Constantine and the Edict of Milan";
        //
        
        AnswerString = @"Outlawed/killed people practising christianity.";
        //
    }
    
    if (QuestionInt == 133){
        ReturnString= @"Saint Augustine";
        //
        
        AnswerString = @"Saint and the pre-eminent Doctor of the Church according to Roman Catholicism, and is considered by Evangelical Protestants to be (together with the Apostle Paul) the theological fountainhead of the Reformation teaching on salvation and grace";
        //
    }
    
    if (QuestionInt == 134){
        ReturnString= @"Eastern Orthodoxy and Roman Catholicism (Great Schism of 1054)";
        //
        
        AnswerString = @"Reflecting its claim to be the preserver of the original Christian traditions as well as those established by the church during the first 1000 years of its existence; maintain a belief that their episcopate can be traced directly back to the Apostles";
        //
    }
    
    if (QuestionInt == 135){
        ReturnString= @"Islam (the Qur’ran)";
        //
        
        AnswerString = @"""The submission to God"" is a monotheistic faith, one of the Abrahamic religions, and the world's second largest religion.";
        //
    }
    
    if (QuestionInt == 136){
        ReturnString= @"Allah";
        //
        
        AnswerString = @"God's name in Islam.";
        //
    }
    
    if (QuestionInt == 137){
        ReturnString= @"Mohammed";
        //
        
        AnswerString = @"Last prophet of God.";
        //
    }
    
    if (QuestionInt == 138){
        ReturnString= @"Mecca";
        //
        
        AnswerString = @"The city is revered as the holiest site of Islam, and a pilgrimage to it is required of all Muslims who can afford to go";
        //
    }
    
    if (QuestionInt == 139){
        ReturnString= @"The Kaaba";
        //
        
        AnswerString = @"Building located inside the mosque known as Masjid al Haram in Mecca (Makkah). The mosque has been built around the Kaaba. The Kaaba is the holiest place in Islam.";
        //
    }
    
    if (QuestionInt == 140){
        ReturnString= @"Medina (the Hegira)";
        //
        
        AnswerString = @"Medina is the second holiest city of Islam, after Mecca. Its importance as a religious site derives from the presence there of the Shrine of the Prophet Mohammad by Masjid al-Nabawi or the Mosque of the Prophet";
        //
    }
    
    if (QuestionInt == 141){
        ReturnString= @"Sunni versus Shiite";
        //
        
        AnswerString = @"Sunnis believe this process was conducted in a fair and proper manner and accept Abu Bakr as a righteous and rightful Caliph. The second major sect, the Shia, believe that the Prophet had appointed his son-in-law Ali ibn Abi Talib as his successor years earlier during an announcement at Ghadir Khom.";
        //
    }
    
    if (QuestionInt == 142){
        ReturnString= @"Sufism";
        //
        
        AnswerString = @"School of esoteric philosophy in Islam, which is based on the pursuit of spiritual truth as a definite goal to attain. In modern language it might also be referred to as Islamic spirituality or Islamic mysticism.";
        //
    }
    
    if (QuestionInt == 143){
        ReturnString= @"Abbasid";
        //
        
        AnswerString = @"(750 C.E.) The Sunni dynasty that overthrew the Umayyads as caliphs";
        //
    }
    
    if (QuestionInt == 144){
        ReturnString= @"Abu Bakr";
        //
        
        AnswerString = @"(632-634 C.E.) The first caliph; one of Muhammad's earliest followers and closest friends";
        //
    }
    
    if (QuestionInt == 145){
        ReturnString= @"Ali";
        //
        
        AnswerString = @"The 4th caliph; the cousin and son-in-law of Muhammad who was meant to be the original successor of Muhammad but was too young. Caused warfare between the Sunnis and Shi'a for not punnishing the murderer of the 3rd caliph, Uthman";
        //
    }
    
    if (QuestionInt == 146){
        ReturnString= @"Axum";
        //
        
        AnswerString = @"Form of government in which a religion or faith plays a dominant role.";
        //
    }
    
    if (QuestionInt == 147){
        ReturnString= @"Baghdad";
        //
        
        AnswerString = @"Capital of Abbasid dynasty located in Iraq near ancient Persian capital of Ctesiphone";
        //
    }
    
    if (QuestionInt == 148){
        ReturnString= @"Battle of Tours ";
        //
        
        AnswerString = @"(October 25, 732) Charles Martel, the Frankish Leader went against an Islamic army led by Emir Abd er Rahman; the Islamic army was defeated and Emir Abd er Rahman was killed. The battle stopped the northward advancement from Spain";
        //
    }
    
    if (QuestionInt == 149){
        ReturnString= @"Benin";
        //
        
        AnswerString = @"Capital of Abbasid dynasty located in Iraq near ancient Persian capital of Ctesiphone";
        //
    }
    
    if (QuestionInt == 147){
        ReturnString= @"Baghdad";
        //
        
        AnswerString = @"A powerful city-state formed around the 14th century; was not relatively influence by the Europeans despite coming into contact with the Portuguese'; important commercial and political entity until the 19th century";
        //
    }
    
    if (QuestionInt == 150){
        ReturnString= @"Bourbons";
        //
        
        AnswerString = @"(18th century) A dynasty in Spain which launced a seiries of reforms aimed at strengthening the state and its economy; influenced Charless III";
        //
    }
    
    if (QuestionInt == 151){
        ReturnString= @"Burghers";
        //
        
        AnswerString = @"Dutch equivalence of bourgeoisie; the middle class";
        //
    }
    
    if (QuestionInt == 152){
        ReturnString= @"Byzantine Empire ";
        //
        
        AnswerString = @"Eastern Half of Roman Empire following collapse of western half of old empire; retained Mediterranean culture, particularly Greek; capital at Constantinople";
        //
    }
    
    if (QuestionInt == 153){
        ReturnString= @"Caliphate ";
        //
        
        AnswerString = @"Political and religious successors to Muhammad";
        //
    }
    
    if (QuestionInt == 154){
        ReturnString= @"Carolingian Dynasty";
        //
        
        AnswerString = @"(8-10th century) Royal house of franks that succeeded the Merovingian dynasty; most prominent member was Charlemagne";
        //
    }
    
    if (QuestionInt == 155){
        ReturnString= @"Caste";
        //
        
        AnswerString = @"Social status or position conferred by a system based on class in India";
        //
    }
    
    if (QuestionInt == 156){
        ReturnString= @"Charlemagne";
        //
        
        AnswerString = @"Charles the Great; Carolingian monarch who established substantial empire in France and Germany";
        //
    }
    
    if (QuestionInt == 157){
        ReturnString= @"Charles Martel";
        //
        
        AnswerString = @"Charles the ""Hammer""; led the the Battle of Tours and saved Europe from the Islamic expansion. (732 C.E.)";
        //
    }
    
    if (QuestionInt == 158){
        ReturnString= @"Chichen Itza";
        //
        
        AnswerString = @"Originally a Mayan city; conquered by the Toltecs (1000 C.E)";
        //
    }
    
    if (QuestionInt == 159){
        ReturnString= @"Code of Bushido";
        //
        
        AnswerString = @"(Formulated 14th century) Way of the Warrior for Japanese samurais; defined service and conduct appropriate to their status";
        //
    }
    
    if (QuestionInt == 160){
        ReturnString= @"Code of chivalry";
        //
        
        AnswerString = @"Social codes of knighthood that originated in France in the Middle Ages; associated with ideals of knightly virtues, honour and of courtly love; came to known as 'gentlemanly conduct.'";
        //
    }
    
    if (QuestionInt == 161){
        ReturnString= @"Crusades";
        //
        
        AnswerString = @"Series of military adventures initially launched by western Christians to free Holy Land from Muslims (temporarily succeeded in capturing Jersalem and establishing Christian kingdoms)";
        //
    }
    
    if (QuestionInt == 162){
        ReturnString= @"Czar";
        //
        
        AnswerString = @"Male monarch/emperor of Russia";
        //
    }
    
    if (QuestionInt == 163){
        ReturnString= @"Daimyo";
        //
        
        AnswerString = @"Warlord rulers of 300 small kingdoms following Onin War and disruption of Ashikaga Shogunate";
        //
    }
    
    if (QuestionInt == 164){
        ReturnString= @"Dome of the Rock";
        //
        
        AnswerString = @"Islamic shrine in Jerusalem; believed to be the site where Muhammed ascended to Heaven";
        //
    }
    
    if (QuestionInt == 165){
        ReturnString= @"Dynasty";
        //
        
        AnswerString = @"A family/group that maintains power for several generations";
        //
    }
    
    if (QuestionInt == 166){
        ReturnString= @"Eleanor of Aquitaine ";
        //
        
        AnswerString = @"Queen of France as the wife of Louis VII; married Henry II that marriage was annulled and became Queen of England during 1152-1204";
        //
    }
    
    if (QuestionInt == 167){
        ReturnString= @"Emperor Xuanzong ";
        //
        
        AnswerString = @"(reigned 713-755) Leading Chinese emperor of the Tang dynasty; encouraged overexpansion";
        //
    }
    
    if (QuestionInt == 168){
        ReturnString= @"Ferdinand";
        //
        
        AnswerString = @"Marriage to Isabella created united Spain; responsible for reconquest of Granada, initiation of exploration of New World";
        //
    }
    
    if (QuestionInt == 169){
        ReturnString= @"Feudalism";
        //
        
        AnswerString = @"System where lords provided protection/aid to serfs in return for labor";
        //
    }
    
    if (QuestionInt == 170){
        ReturnString= @"Five Pillars of Islam";
        //
        
        AnswerString = @"Obligatory religious duties of all Muslims: confession of faith, prayer (5 times a day facing Mecca), fasting during Ramadan, zakat (tax for charity), and the hajj (pilgrimage)";
        //
    }
    
    if (QuestionInt == 171){
        ReturnString= @"Franks";
        //
        
        AnswerString = @"A group of Germanic tribes in the early Christian era; spread from the Rhine into the Roman Empire";
        //
    }
    
    if (QuestionInt == 172){
        ReturnString= @"Genghis Khan";
        //
        
        AnswerString = @"(1170s – 1227) from 1206 khagan of all Mongol tribes; responsible for conquest of northern kingdoms of China and territories as far west as the Abbasid regions";
        //
    }
    
    if (QuestionInt == 173){
        ReturnString= @"Golden Horde";
        //
        
        AnswerString = @"one of four subdivisions of the Mongol Empire after Genghis Khan’s death; territory covered much of present south-central Russia";
        //
    }
    
    if (QuestionInt == 174){
        ReturnString= @"Hagia Sophia";
        //
        
        AnswerString = @"Large church constructed in Constantinople during the reign of Justinian";
        //
    }
    
    if (QuestionInt == 175){
        ReturnString= @"Hanseatic League";
        //
        
        AnswerString = @"Hanseatic League";
        //
    }
    
    if (QuestionInt == 176){
        ReturnString= @"Heresies";
        //
        
        AnswerString = @"Any opinions/doctrines at variance with the established or orthodox position; beliefs that reject the orthodox tenets of a religion";
        //
    }
    
    if (QuestionInt == 177){
        ReturnString= @"Holy Roman Empire";
        //
        
        AnswerString = @"A continuation of the Roman Empire in central-western Europe (at least, loosely organized/modeled on it)";
        //
    }
    
    if (QuestionInt == 178){
        ReturnString= @"Hordes";
        //
        
        AnswerString = @"Nomadic Mongol tribes";
        //
    }
    
    if (QuestionInt == 179){
        ReturnString= @"Hundred Years’ War";
        //
        
        AnswerString = @"(1337 – 1453) conflict between England and France –fought over lands England possessed in France (issue of feudal rights vs. emerging claims of national states)";
        //
    }
    
    if (QuestionInt == 180){
        ReturnString= @"Incan";
        //
        
        AnswerString = @"Group of clans centered at Cuzco that were able to create empire incorporating various Andean cultures. Term also used for leader of empire";
        //
    }
    
    if (QuestionInt == 181){
        ReturnString= @"Inquisition";
        //
        
        AnswerString = @"An investigation; A tribunal formerly held in the Roman Catholic Church and directed at the suppression of heresy";
        //
    }
    
    if (QuestionInt == 182){
        ReturnString= @"Interregnum";
        //
        
        AnswerString = @"The interval of time between the end of a sovereign's reign and the accession of a successor";
        //
    }
    
    if (QuestionInt == 183){
        ReturnString= @"Islam";
        //
        
        AnswerString = @" Major world religion originating in 610 CE in the Arabian peninsula; literally meaning submission; based o prophecy of Muhammad";
        //
    }
    
    if (QuestionInt == 184){
        ReturnString= @"Ivan the Terrible";
        //
        
        AnswerString = @"Ivan IV, confirmed power of tsarist autocracy by attacking authority of boyars(aristocrats); continued policy of Russian expansion; established contacts with western European commerce and culture";
        //
    }
    
    if (QuestionInt == 185){
        ReturnString= @"Joan of Arc";
        //
        
        AnswerString = @" A French military leader of the fifteenth century, a national heroine who at the age of seventeen took up arms to establish the rightful king on the French throne. She claimed to have heard God speak to her in voices. These claims eventually led to her trial for heresy and her execution by burning at the stake. Joan of Arc is a saint of the Roman Catholic Church";
        //
    }
    
    if (QuestionInt == 186){
        ReturnString= @"Justinian";
        //
        
        AnswerString = @"Eastern Roman emperor 527-565 CE; tried to restore unity of old Roman Empire; issued most famous compilation of Roman law";
        //
    }
    
    if (QuestionInt == 187){
        ReturnString= @"Justinian Code";
        //
        
        AnswerString = @"Compilation of Roman law";
        //
    }
    
    if (QuestionInt == 188){
        ReturnString= @"King Clovis";
        //
        
        AnswerString = @"Early Frankish king; converted Franks to Christianity C. 496; allowed establishment of Frankish kingdom";
        //
    }
    
    if (QuestionInt == 189){
        ReturnString= @"King Hugh Capet";
        //
        
        AnswerString = @"King of France (987–96), first of the Capetians; son of Hugh the Great; he gave away much of his land to secure the dynasty. He spent much of his reign fighting Charles and later became involved in a controversy with the papacy—unsettled at his death—over deposition of the Carolingian archbishop of Reims";
        //
    }
    
    if (QuestionInt == 190){
        ReturnString= @"Kublai Khan";
        //
        
        AnswerString = @"Grandson of Chinggis Khan; commander of Mongol forces responsible for conquest of China; became khagan in 1260; established sinicized Mongol Yuan dynasty in China in 1271";
        //
    }
    
    if (QuestionInt == 191){
        ReturnString= @"Kush";
        //
        
        AnswerString = @"An African state that developed along the upper reaches of the Nile C 100 BCE; conquered Egypt and ruled it for several centuries";
        //
    }
    
    if (QuestionInt == 192){
        ReturnString= @"Machu Picchu";
        //
        
        AnswerString = @"An ancient Inca fortress city in the Andes northwest of Cuzco, Peru";
        //
    }
    
    if (QuestionInt == 193){
        ReturnString= @"Magna Carta";
        //
        
        AnswerString = @"Great Charter issued by King John of England in 1215; confirmed feudal rights against monarchial claims; represented principle of mutual limits and obligations between rulers and feudal aristocracy";
        //
    }
    
    if (QuestionInt == 194){
        ReturnString= @"Magyars";
        //
        
        AnswerString = @"A Hungarian ethnic group";
        //
    }
    
    if (QuestionInt == 195){
        ReturnString= @"Mali";
        //
        
        AnswerString = @"Country of western Africa; During the Middle Ages, Mali formed a huge territorial empire, noted as a center of Islamic study and as a trade route for gold. Its center was Timbuktu";
        //
    }
    
    if (QuestionInt == 196){
        ReturnString= @"Manors";
        //
        
        AnswerString = @"The district over which a lord had domain and could exercise certain rights and privileges in medieval western Europe";
        //
    }
    
    if (QuestionInt == 197){
        ReturnString= @"Mansa Musa";
        //
        
        AnswerString = @"African King who made pilgrimage to Mecca, and gave out so much gold, that worth of gold dropped rapidly";
        //
    }
    
    if (QuestionInt == 198){
        ReturnString= @"Marco Polo";
        //
        
        AnswerString = @"A Venetian trader that went and learned about China under Kublai Khan";
        //
    }
    
    if (QuestionInt == 199){
        ReturnString= @"Mayan";
        //
        
        AnswerString = @"People occupying the Eastern third of Mesoamerica, particularly the Yucatan Peninsula";
        //
    }
    
    if (QuestionInt == 200){
        ReturnString= @"Mecca";
        //
        
        AnswerString = @"Religious Center of Islam, where Muslims pray towards, controlled by Umayyad";
        //
    }
    
    if (QuestionInt == 201){
        ReturnString= @"Medina";
        //
        
        AnswerString = @"Great trading center where Muhammad fed to and solved their civil war";
        //
    }
    
    if (QuestionInt == 202){
        ReturnString= @"Mesoamerica";
        //
        
        AnswerString = @"Mesoamerica is the region extending from central Mexico south to the northwestern border of Costa Rica that gave rise to a group of stratified, culturally related agrarian civilizations spanning an approximately 3,000-year period before the European discovery of the New World by Columbus";
        //
    }
    
    if (QuestionInt == 203){
        ReturnString= @"Middle Ages";
        //
        
        AnswerString = @"The Middle Ages formed the middle period in a traditional schematic division of European history into three 'ages': the classical civilization of Antiquity, the Middle Ages, and modern times";
        //
    }
    
    if (QuestionInt == 204){
        ReturnString= @"Ming";
        //
        
        AnswerString = @"Succeeded Mongol Yuan in 1360 lasted till 1644, characterized by great trade expeditions that were withdrawn";
        //
    }
    
    if (QuestionInt == 205){
        ReturnString= @"Mohammed";
        //
        
        AnswerString = @"The prophet of Islam: born in 570 in clan of Quraysh tribe in Mecca";
        //
    }
    
    if (QuestionInt == 206){
        ReturnString= @"Mongol";
        //
        
        AnswerString = @"Central asian nomadic people; spread all over asia and Europe spreading their empire while pillaging";
        //
    }
    
    if (QuestionInt == 207){
        ReturnString= @"Muslims";
        //
        
        AnswerString = @"People who believe and follow the Islamic religion";
        //
    }
    
    if (QuestionInt == 208){
        ReturnString= @"Oral literature";
        //
        
        AnswerString = @"Oral literature corresponds in the sphere of the spoken (oral) word to literature as literature operates in the domain of the written word";
        //
    }
    
    if (QuestionInt == 209){
        ReturnString= @"Orthodox Christianity";
        //
        
        AnswerString = @"Orthodox Christianity is a generalized reference to the Eastern traditions of Christianity, as opposed to the Western traditions which descend from the Roman Catholic Church";
        //
    }
    
    if (QuestionInt == 210){
        ReturnString= @"Otto the Great";
        //
        
        AnswerString = @"King of the Germans and arguably the first Holy Roman Emperor";
        //
    }
    
    if (QuestionInt == 211){
        ReturnString= @"Peasant";
        //
        
        AnswerString = @"Agricultural worker that works land they own or rented";
        //
    }
    
    if (QuestionInt == 212){
        ReturnString= @"Pepin";
        //
        
        AnswerString = @"Mayor of the Palace of the whole Frankish kingdom (both Austrasia and Neustria), and later King of the Franks; born 714; died at St. Denis, 24 September, 768. He was the son of Charles Martel";
        //
    }
    
    if (QuestionInt == 213){
        ReturnString= @"Pope";
        //
        
        AnswerString = @"Pope in Rome had top authority, while regional churches had bishops";
        //
    }
    
    if (QuestionInt == 214){
        ReturnString= @"Pope Innocent III";
        //
        
        AnswerString = @"Supported Otto, believing Otto will give church back power but Otto betrayed and seized church’s land and distributed among vassals";
        //
    }
    
    if (QuestionInt == 215){
        ReturnString= @"Primogeniture";
        //
        
        AnswerString = @"An exclusive right of inheritance belonging to the eldest son";
        //
    }
    
    if (QuestionInt == 216){
        ReturnString= @"Prince Shotoku";
        //
        
        AnswerString = @"Important Japanese regent and scholar of the Asuka period… promoted Buddhism and Confucianism, reinstituted embassies to China, and adopted the Chinese calendar and court ranks";
        //
    }
    
    if (QuestionInt == 217){
        ReturnString= @"Queen Isabella ";
        //
        
        AnswerString = @"Queen of Castile (1474–1504) and of Aragon (1479–1504), ruling the two kingdoms jointly from 1479 with her husband, Ferdinand II of Aragon (Ferdinand V of Castile). Their rule effected the permanent union of Spain and the beginning of an overseas empire in the New World, led by Christopher Columbus";
        //
    }
    
    if (QuestionInt == 218){
        ReturnString= @"Quipu";
        //
        
        AnswerString = @"System of knotted strings utilized by the Incas in place of a writing system…could contain numerical and other types of information for censuses and financial records";
        //
    }
    
    if (QuestionInt == 219){
        ReturnString= @"Qur’an";
        //
        
        AnswerString = @"The holy book of Islam… recitations of revelations received by Muhammad";
        //
    }
    
    if (QuestionInt == 220){
        ReturnString= @"Scholasticism";
        //
        
        AnswerString = @"Dominant medieval philosophical approach… based on the use of logic to resolve theological problems";
        //
    }
    
    if (QuestionInt == 221){
        ReturnString= @"Serfs";
        //
        
        AnswerString = @"Peasant agricultural laborers within the manorial system of the Middle Ages";
        //
    }
    
    if (QuestionInt == 222){
        ReturnString= @"Shogun";
        //
        
        AnswerString = @"Military leaders of the bakufu";
        //
    }
    
    if (QuestionInt == 223){
        ReturnString= @"Shogunate (bakufu)";
        //
        
        AnswerString = @"Military government in 12th century Japan… established by the Minamoto after the Gempei Wars… retained emperor but real power resided in military government and samurai";
        //
    }
    
    if (QuestionInt == 224){
        ReturnString= @"Song";
        //
        
        AnswerString = @"Chinese dynasty that united the entire country until 1127 and the southern portion until 1279, during which time northern China was controlled by the Juchen tribes";
        //
    }
    
    if (QuestionInt == 225){
        ReturnString= @"Spanish Inquisition ";
        //
        
        AnswerString = @"In the Middle Ages, a judicial procedure that was used to combat heresy… in Spain, authorized by Sixtus IV in 1478; the pope later tried to limit its powers but was opposed by the Spanish crown…the grand inquisitor Tomás de Torquemada was responsible for burning about 2,000 heretics at the stake";
        //
    }
    
    if (QuestionInt == 226){
        ReturnString= @"St. Cyril";
        //
        
        AnswerString = @"A missionary sent by the Byzantine government to eastern Europe and the Balkans… converted southern Russia and Balkans to Orthodox Christianity…responsible for creation of written script for Slavic known as Cyrillic";
        //
    }
    
    if (QuestionInt == 227){
        ReturnString= @"Sufis";
        //
        
        AnswerString = @"Mystics within Islam… responsible for expansion of Islam in southeastern Asia";
        //
    }
    
    if (QuestionInt == 228){
        ReturnString= @"Sunni/Shia";
        //
        
        AnswerString = @"Political and theological division within Islam… followers of the Umayyads";
        //
    }
    
    if (QuestionInt == 229){
        ReturnString= @"T’ang";
        //
        
        AnswerString = @"Chinese emperor who overthrew the Hsia dynasty and founded the Shang dynasty";
        //
    }
    
    if (QuestionInt == 230){
        ReturnString= @"Taika Reforms";
        //
        
        AnswerString = @"Attempt to remake Japanese monarch into an absolute Chinese- style emperor…also tried to make a professional bureaucracy and peasant conscript army";
        //
    }
    if (QuestionInt == 231){
        ReturnString= @"Tang";
        //
        
        AnswerString = @"Dynasty that succeeded the Sui in 618 C.E… more stable than the previous dynasty";
        //
    }
    
    if (QuestionInt == 232){
        ReturnString= @"Tatars";
        //
        
        AnswerString = @"Mongols; captured Russian cities and largely destroyed Kievan state";
        //
    }
    
    if (QuestionInt == 233){
        ReturnString= @"Temple of the Sun";
        //
        
        AnswerString = @"Inca Religious center located at Cuzco";
        //
    }
    
    if (QuestionInt == 234){
        ReturnString= @"Tenochtitlan";
        //
        
        AnswerString = @"Center of Aztec power, founded on marshy island in Lake Texcoco";
        //
    }
    
    if (QuestionInt == 235){
        ReturnString= @"Thomas Aquinas";
        //
        
        AnswerString = @"Creator of one of the great syntheses of medieval learning; believed that through reason it was possible to know much about natural order, moral law, and nature of God";
        //
    }
    
    if (QuestionInt == 236){
        ReturnString= @"Tikal";
        //
        
        AnswerString = @"A ruined Mayan city of northern Guatemala. It was the largest of the Mayan cities and may also be the oldest";
        //
    }
    
    if (QuestionInt == 237){
        ReturnString= @"Timur Lang";
        //
        
        AnswerString = @"Leader of Turkic nomads - last Mongol nomad ";
        //
    }
    
    if (QuestionInt == 238){
        ReturnString= @"Timur the Lame";
        //
        
        AnswerString = @"Name given to Timur Lang";
        //
    }
    
    if (QuestionInt == 239){
        ReturnString= @"Treaty of Verdun";
        //
        
        AnswerString = @"843 the three surviving sons of Louis the Pious divided his territories, the Carolingian Empire, into three kingdoms";
        //
    }
    
    if (QuestionInt == 240){
        ReturnString= @"Umayidd";
        //
        
        AnswerString = @"Powerful Muslim family";
        //
    }
    
    if (QuestionInt == 241){
        ReturnString= @"Vassals";
        //
        
        AnswerString = @"Members of military elite who received land or benefice from a lord in return for military service and loyalty";
        //
    }
    
    if (QuestionInt == 242){
        ReturnString= @"Viking/Norse";
        //
        
        AnswerString = @"Scandinavian raiders";
        //
    }
    
    if (QuestionInt == 243){
        ReturnString= @"Vladimir";
        //
        
        AnswerString = @"Ruler of Russian kingdom of Kiev – converted kingdom to Christianity";
        //
    }
    
    if (QuestionInt == 244){
        ReturnString= @"William the Conqueror";
        //
        
        AnswerString = @"Invaded England, was Duke of Normandie, and created a centralized feudal systemy";
        //
    }
    
    if (QuestionInt == 245){
        ReturnString= @"Wu Zhao";
        //
        
        AnswerString = @"Empress in China; supported Buddhism";
        //
    }
    
    if (QuestionInt == 246){
        ReturnString= @"Provincial leaders";
        //
        
        AnswerString = @"Regional Rulers";
        //
    }
    
    if (QuestionInt == 247){
        ReturnString= @"Sharia";
        //
        
        AnswerString = @"Islamic Law";
        //
    }
    
    if (QuestionInt == 248){
        ReturnString= @"Ulama";
        //
        
        AnswerString = @"Religious leaders - traditional leanings in Islamic Empire";
        //
    }
    
    if (QuestionInt == 249){
        ReturnString= @"Jihad";
        //
        
        AnswerString = @"Is an Arabic word meaning “striving in the way of God”, but it is often translated as “holy war”. Refer to an armed struggle fought in the defense of Islam to please Allah";
        //
    }
    
    if (QuestionInt == 250){
        ReturnString= @"Bedouins";
        //
        
        AnswerString = @"Nomadic Arabs who originally inhabited desert areas of the Middle East and northern Africa and later began to move to other parts of the region";
        //
    }
    
    if (QuestionInt == 251){
        ReturnString= @"Moors";
        //
        
        AnswerString = @"The Medieval Muslim inhabitants of al-Andalus and the Maghreb. They captured Spain in 700s, and were expelled from Spain in 1492";
        //
    }
    
    if (QuestionInt == 252){
        ReturnString= @"Sephardim";
        //
        
        AnswerString = @"The Jews whose traditions and culture originate from the Mediteranean, including Spain and Portugal";
        //
    }
    
    if (QuestionInt == 253){
        ReturnString= @"Christian monks";
        //
        
        AnswerString = @"Clergy of Christianity, spread the religion";
        //
    }
    
    if (QuestionInt == 254){
        ReturnString= @"Ideographic";
        //
        
        AnswerString = @"A type of character representation in which characters do not represent pronunciation alone, but are also related to the component meanings of words";
        //
    }
    
    if (QuestionInt == 255){
        ReturnString= @"Cyrillic alphabet";
        //
        
        AnswerString = @"An alphabet derived from the Greek alphabet and used for writing Slavic languages";
        //
    }
    
    if (QuestionInt == 256){
        ReturnString= @"Hagia Sofia";
        //
        
        AnswerString = @"It is a 6th century masterpiece of Byzantine architecture in Istanbul; built as a Christian church by Justinian, converted to a mosque in 1453, and made into a museum in the middle of the 20th century";
        //
    }
    
    if (QuestionInt == 257){
        ReturnString= @"Woodblock printing";
        //
        
        AnswerString = @" It is a technique for printing used widely throughout East Asia and originating in China sometime between the mid-6th and late 9th centuries";
        //
    }
    
    if (QuestionInt == 258){
        ReturnString= @"Arabesque";
        //
        
        AnswerString = @"Ornament or surface decoration with intricate curves and flowing lines based on plant forms";
        //
    }
    
    if (QuestionInt == 259){
        ReturnString= @"Astrolabe";
        //
        
        AnswerString = @"An instrument that was used to determine the altitude of objects (like the sun) in the sky. It was first used around 200 BC by astronomers in Greece. The astrolabe was replaced by the sextant";
        //
    }
    
    if (QuestionInt == 260){
        ReturnString= @"Arabic numerals";
        //
        
        AnswerString = @"A written number system created during the Gupta golden age in India, then adopted by the Islamic Empire before spreading further. Most familiar numeral style (1,2,3, etc.,) used on clock and watch dials";
        //
    }
    
    if (QuestionInt == 261){
        ReturnString= @"Mosque";
        //
        
        AnswerString = @"A mosque is a place of worship for followers of the Islamic faith";
        //
    }
    
    if (QuestionInt == 262){
        ReturnString= @"Minaret";
        //
        
        AnswerString = @"A tower attached to a mosque, used for call to prayer";
        //
    }
    
    if (QuestionInt == 263){
        ReturnString= @"Dome";
        //
        
        AnswerString = @"A common structural element of architecture that resembles the hollow upper half of a sphere";
        //
    }
    
    if (QuestionInt == 264){
        ReturnString= @"Pillars ";
        //
        
        AnswerString = @"In architecture and structural engineering, a column is that part of a structure whose purpose is to transmit through compression the weight of the structure";
        //
    }
    
    if (QuestionInt == 265){
        ReturnString= @"Vernacular languages";
        //
        
        AnswerString = @"The native language of a particular locality";
        //
    }
    
    if (QuestionInt == 266){
        ReturnString= @"Polyphonic music";
        //
        
        AnswerString = @"Music in which two or more melodies sound simultaneously";
        //
    }
    
    if (QuestionInt == 267){
        ReturnString= @"Romanesque";
        //
        
        AnswerString = @"A style of European architecture prevalent from the ninth to the twelfth centuries, with round arches and barrel vaults influenced by Roman architecture and characterized by heavy stone construction";
        //
    }
    
    if (QuestionInt == 268){
        ReturnString= @"Avicenna";
        //
        
        AnswerString = @"Persian physician, philosopher, and scientist. He was the author of 450 books on a wide range of subjects. Many of these concentrated on philosophy and medicine. He is considered by many to be ""the father of modern medicine""";
        //
    }
    
    if (QuestionInt == 269){
        ReturnString= @"Al Razi";
        //
        
        AnswerString = @"A Persian Philosopher who made fundamental and lasting contributions to the fields of medicine, chemistry (alchemy) and philosophy. (865-925)";
        //
    }
    
    if (QuestionInt == 270){
        ReturnString= @"Al Khwarizmi";
        //
        
        AnswerString = @"Persian scientist, mathematician, astronomer/astrologer, and author. He is often cited as ""the father of algebra"", which was named after a part of the title of his book, Hisab al-jabr w'al-muqabala, along with the algorism number system";
        //
    }
    
    if (QuestionInt == 271){
        ReturnString= @"Omar Khayyam";
        //
        
        AnswerString = @"He was famous during his lifetime as a mathematician and astronomer who calculated how to correct the Persian calendar. he objected to the notion that every particular event and phenomenon was the result of divine intervention; nor did he believe in any Judgement Day or rewards and punishments after life. Instead he supported the view that laws of nature explained all phenomena of observed life";
        //
    }
    
    if (QuestionInt == 272){
        ReturnString= @"Rubaiyat in Persian";
        //
        
        AnswerString = @"Rubaiyat is a common shorthand name for the collection of Persian verses known more formally as the Rubaiyat of Omar Khayyam. In fact, rubaiyat (a plural word derived from the arabic root meaning 'four') means ""quatrains"" in the Persian language";
        //
    }
    
    if (QuestionInt == 273){
        ReturnString= @"Li Tai-Po";
        //
        
        AnswerString = @"Chinese poet living in Tang Dynasty . He is best known for the extravagant imagination and striking Taoist imagery in his poetry, as well as for his great love for liquor. He is said to have drowned in the Yangtze River, having fallen from his boat while drunkenly trying to embrace (the reflection of) the moon";
        //
    }
    
    if (QuestionInt == 274){
        ReturnString= @"Orthodox";
        //
        
        AnswerString = @"The word orthodoxy, from the Greek ortho ('right', 'correct') and doxa ('thought', 'teaching'), is typically used to refer to the correct theological or doctrinal observance of religion, as determined by some overseeing body. Each is headed by a bishop; most are related to a specific country, as in Serbian, Russian and Greek Orthodox";
        //
    }
    
    if (QuestionInt == 275){
        ReturnString= @"Conservative";
        //
        
        AnswerString = @"Person who generally likes to uphold current conditions and oppose changes; religious movement whose position lies between the Orthodox and Reform";
        //
    }
    
    if (QuestionInt == 276){
        ReturnString= @"Hadith";
        //
        
        AnswerString = @"Traditions of the prophet Mohammad that played a critical role in Islamic law and rituals; recorded by women";
        //
    }
    
    if (QuestionInt == 277){
        ReturnString= @"Legalism";
        //
        
        AnswerString = @"In Christian theology, legalism is belief, stated or supposedly implied, that law, not faith, is the pre-eminent principle of redemption";
        //
    }
    
    if (QuestionInt == 278){
        ReturnString= @"Shinto";
        //
        
        AnswerString = @"Religion of early Japanese culture; devotes worshipped numerous gods and spirits associated with the natural world; offers of food and prayer made to gods and nature spirits";
        //
    }
    
    if (QuestionInt == 279){
        ReturnString= @"Tao Te Ching";
        //
        
        AnswerString = @"The Way of Changes, a Chinese classic written by Lao Tzu around the 3rd century BC It is the fundamental text of Taoism";
        //
    }
    
    if (QuestionInt == 280){
        ReturnString= @"Thousand and One Nights";
        //
        
        AnswerString = @"Arabian Nights' Entertainment: a collection of folktales in Arabic dating from the 10th century";
        //
    }
    
    if (QuestionInt == 281){
        ReturnString= @"Great Schism";
        //
        
        AnswerString = @"Divide of the Christian church whereby for a time there were two popes";
        //
    }
    
    if (QuestionInt == 282){
        ReturnString= @"Patriarch";
        //
        
        AnswerString = @"A man who rules a family, clan or tribe";
        //
    }
    
    if (QuestionInt == 283){
        ReturnString= @"Greek Orthodox Church";
        //
        
        AnswerString = @"The state church of Greece, an autonomous part of the Eastern Orthodox Church";
        //
    }
    
    if (QuestionInt == 284){
        ReturnString= @"Roman Catholic Church";
        //
        
        AnswerString = @"The Christian church characterized by an episcopal hierarchy with the pope as its head and belief in seven sacraments and the authority of tradition";
        //
    }
    
    if (QuestionInt == 285){
        ReturnString= @"Swahili";
        //
        
        AnswerString = @"A Bantu language of the coast and islands of eastern Africa from Somalia to Mozambique";
        //
    }
    
    if (QuestionInt == 286){
        ReturnString= @"Sofala";
        //
        
        AnswerString = @"Southern port with gold produced in the interior, controlled by Kilwa";
        //
    }
    
    if (QuestionInt == 287){
        ReturnString= @"Kilwa";
        //
        
        AnswerString = @"Town on W African coast, wealthy & beautiful town , access to gold (Sofala) and most southern ship stop";
        //
    }
    
    if (QuestionInt == 288){
        ReturnString= @"Monsoons";
        //
        
        AnswerString = @"Winds from the southwest or south that brings heavy rainfall to southern Asia in the summer - method by which Arab merchants travelled";
        //
    }
    
    if (QuestionInt == 289){
        ReturnString= @"Silk Road";
        //
        
        AnswerString = @"Number of trade routes from East Asia to Eastern Europe, one of the trade commodities was silk";
        //
    }
    
    if (QuestionInt == 290){
        ReturnString= @"Mawali";
        //
        
        AnswerString = @"Non-arab converts to Islam";
        //
    }
    
    if (QuestionInt == 291){
        ReturnString= @"Mali Empire";
        //
        
        AnswerString = @"Model of Islamicized (reinforced kingship) Sudanic kingdoms, Malinke merchants traded throughout W Africa";
        //
    }
    
    if (QuestionInt == 292){
        ReturnString= @"Songhay Empire";
        //
        
        AnswerString = @"Successor to Mali empire, fusion of Islam, pagan, took over Niger valley, dominant in area until Muslims with muskets";
        //
    }
    
    if (QuestionInt == 293){
        ReturnString= @"Hajj";
        //
        
        AnswerString = @"Muslim pilgrimage to Mecca";
        //
    }
    
    if (QuestionInt == 294){
        ReturnString= @"Scholar gentry ";
        //
        
        AnswerString = @"Elite, educated bureaucrats who ran the centralized gov’t pf China";
        //
    }
    
    if (QuestionInt == 295){
        ReturnString= @"Ibn Battuta";
        //
        
        AnswerString = @"Arab traveler/trader who commented on African traveling security, cities";
        //
    }
    
    if (QuestionInt == 296){
        ReturnString= @"Mansa Musa ";
        //
        
        AnswerString = @"African prince from Mali who gave out so much gold during a pilgrimage it devalued";
        //
    }
    
    if (QuestionInt == 297){
        ReturnString= @"Ibn Battuta";
        //
        
        AnswerString = @"Arab traveler/trader who commented on African traveling security, cities";
        //
    }
    if (QuestionInt == 298){
        ReturnString= @"Calligraphy ";
        //
        
        AnswerString = @"Writing art form";
        //
    }
    if (QuestionInt == 299){
        ReturnString= @"V";
        //
        
        AnswerString = @"Either black or white";
        //
    }
    if (QuestionInt == 300){
        ReturnString= @"Footbinding as metaphor";
        //
        
        AnswerString = @"The societal restrictions imposed upon women as families became wealthier, women status lowered";
        //
    }
    if (QuestionInt == 301){
        ReturnString= @"Interregnum ";
        //
        
        AnswerString = @"The interval of time between the end of a sovereign's reign and the accession of a successor";
        //
    }
    
    if (QuestionInt == 302){
        ReturnString= @"Shogun ";
        //
        
        AnswerString = @"Japanese lord who wielded most power while the emperor was controlled";
        //
    }
    
    if (QuestionInt == 303){
        ReturnString= @"Puppet emperor";
        //
        
        AnswerString = @"Emperor with no real power. In Japan, the shogun (who acted in the name of the emperor) had all the major power";
        //
    }
    
    if (QuestionInt == 304){
        ReturnString= @"Taika reforms ";
        //
        
        AnswerString = @"Attempt to remake Japanese monarch into an absolute Chinese-style emperor";
        //
    }
    
    if (QuestionInt == 305){
        ReturnString= @"Uji";
        //
        
        AnswerString = @"An aristocratic lineage group of prehistoric origin (for example, the Fujiwara, the Taira)";
        //
    }
    
    if (QuestionInt == 306){
        ReturnString= @"Warlordism ";
        //
        
        AnswerString = @"A military commander exercising civil power in a region, whether in nominal allegiance to the national government or in defiance of it";
        //
    }
    
    if (QuestionInt == 307){
        ReturnString= @"Imperial bureaucracy";
        //
        
        AnswerString = @"System to run centralized gov’t, comprised of educated scholar-gentry";
        //
    }
    
    if (QuestionInt == 308){
        ReturnString= @"Muhammad";
        //
        
        AnswerString = @"Prophet who spread the Islamic religion. Born in 570, received revelations from Allah in 610, before passing away in 630";
        //
    }
    
    if (QuestionInt == 309){
        ReturnString= @"Caliph";
        //
        
        AnswerString = @"Political, religious and militaristic leader of Islam";
        //
    }
    
    if (QuestionInt == 310){
        ReturnString= @"Ali";
        //
        
        AnswerString = @"The fourth caliph or successor of Muhammad. He was also the Prophet's cousin. He is revered by Shi'a Muslims as the rightful first caliph";
        //
    }
    
    if (QuestionInt == 311){
        ReturnString= @"Yuan dynasty";
        //
        
        AnswerString = @"1271 to 1368, also called the Mongol Dynasty. Period of Kublai Kahn and the Mongols dominance over China";
        //
    }
    
    if (QuestionInt == 312){
        ReturnString= @"Junk";
        //
        
        AnswerString = @"Chinese ships equipped with watertight bulkheads, sternpost rudders, compasses, and bamboo fenders. Played major roles in the Asian seas east of the Malayan peninsula";
        //
    }
    
    if (QuestionInt == 313){
        ReturnString= @"Compass";
        //
        
        AnswerString = @"Device used to determine geographic direction";
        //
    }
    
    if (QuestionInt == 300){
        ReturnString= @"Abacus";
        //
        
        AnswerString = @"A calculator that performs arithmetic functions by manually sliding counters on rods";
        //
    }
    
    if (QuestionInt == 315){
        ReturnString= @"Movable type";
        //
        
        AnswerString = @"Invented in China in the mid-eleventh century. Individual characters made of fired clay were assembled and glued onto a plate to create a printing block. Introduced in Europe in the 15th century";
        //
    }
    
    if (QuestionInt == 316){
        ReturnString= @"Landscape painting";
        //
        
        AnswerString = @"Popular artistic style in China during the Tang-Song era. Previously popular Buddhist themes are pushed away by the new scholar-gentry classes interest in nature’s beauty";
        //
    }
    
    if (QuestionInt == 317){
        ReturnString= @"Currency-based economy";
        //
        
        AnswerString = @"Unified monetary and banking systems are present in the economy";
        //
    }
    
    if (QuestionInt == 318){
        ReturnString= @"New strains of rice";
        //
        
        AnswerString = @"New strains of rice - led to population growth in Asia";
        //
    }
    
    if (QuestionInt == 319){
        ReturnString= @"Prince Shotoku";
        //
        
        AnswerString = @"Prince of Japan. When young, received Buddhist influences from relatives that were affected by Paekche and Kokuryo Buddhisms. Established an official rank system (based on Chinese and Korean official rank system) and a constitution (stressed the acceptable behaviors of the people) and spread Buddhism around Japan";
        //
    }
    
    if (QuestionInt == 320){
        ReturnString= @"Yamato clan ";
        //
        
        AnswerString = @"Gained control of the nation over other rival clans around 400 CE. Established an imperial court similar to that of China in 700 CE";
        //
    }
    
    if (QuestionInt == 321){
        ReturnString= @"Compatibility of Chinese values ";
        //
        
        AnswerString = @"Both Confucianism and Daoism co-existed and were patronized side by side, C providing guidelines, and D satifying spiritual need";
        //
    }
    
    if (QuestionInt == 322){
        ReturnString= @"Sedentary agriculture";
        //
        
        AnswerString = @"Where farming occurs in one place, repeatedly, opposed to shifting cultivation";
        //
    }
    
    if (QuestionInt == 323){
        ReturnString= @"Shifting cultivation";
        //
        
        AnswerString = @"When farming occurs over several patches of land, rotatingly so that nutrients of the soil will not be depleted";
        //
    }
    
    if (QuestionInt == 324){
        ReturnString= @"Pastoral nomadism";
        //
        
        AnswerString = @"Herding animals while moving from place to place";
        //
    }
    
    if (QuestionInt == 325){
        ReturnString= @"Foraging";
        //
        
        AnswerString = @"Gathering food, usually nuts, berries, roots, etc";
        //
    }
    
    if (QuestionInt == 326){
        ReturnString= @"Feudalism";
        //
        
        AnswerString = @"Relationship between lord and serfs where protection is exchanged for crops/labor";
        //
    }
    
    if (QuestionInt == 327){
        ReturnString= @"Manorialism ";
        //
        
        AnswerString = @"Organization of rural economy and society by three classes of manors: a lord’s own land, serf holdings, and free peasant land";
        //
    }
    
    if (QuestionInt == 328){
        ReturnString= @"Fiefs";
        //
        
        AnswerString = @"Plots of land owned by a lord, little kingdoms";
        //
    }
    
    if (QuestionInt == 329){
        ReturnString= @"Vassals";
        //
        
        AnswerString = @"Subordinate who, in exchange for land, gives loyalty";
        //
    }
    
    if (QuestionInt == 330){
        ReturnString= @"Reciprocal relationship";
        //
        
        AnswerString = @"System where both parties benefit - such as feudalism in Europe - protection for labor";
        //
    }
    
    if (QuestionInt == 331){
        ReturnString= @"Samurai";
        //
        
        AnswerString = @"Japanese feudal military leaders, rough equivalent of Western knights";
        //
    }
    
    if (QuestionInt == 332){
        ReturnString= @"Nation-states";
        //
        
        AnswerString = @"Autonomous state with people sharing a common culture/history/language";
        //
    }
    
    if (QuestionInt == 333){
        ReturnString= @"Absolute despotism";
        //
        
        AnswerString = @"Where the ruler has complete authority/power";
        //
    }
    
    if (QuestionInt == 334){
        ReturnString= @"William the Conqueror";
        //
        
        AnswerString = @"Duke of Normandy who invaded England in 1066 and conquered it";
        //
    }
    
    if (QuestionInt == 335){
        ReturnString= @"Jury system";
        //
        
        AnswerString = @"Judgment whereby there is a trial and people witnessing the trial deciding the guilt/innocence of a person";
        //
    }
    
    if (QuestionInt == 336){
        ReturnString= @"King John";
        //
        
        AnswerString = @"Younger brother of King Richard, & bad king of England basically";
        //
    }
    
    if (QuestionInt == 337){
        ReturnString= @"Magna Carta";
        //
        
        AnswerString = @"Nobles fed up with King John made him sign Great Charter (Magna Carta) that made sure king got approval of aristocracy before imposing taxes, etc, limited king’s power";
        //
    }
    
    if (QuestionInt == 338){
        ReturnString= @"Parliament";
        //
        
        AnswerString = @"Beginning in England with a House of lords (aristocracy) and House of Commons (rich merchants) governing legislative body";
        //
    }
    
    if (QuestionInt == 339){
        ReturnString= @"Power of the purse";
        //
        
        AnswerString = @"The power to raise and spend money";
        //
    }
    
    if (QuestionInt == 340){
        ReturnString= @"Hugh Capets";
        //
        
        AnswerString = @"After the death of Louis, the son of Hugh the Great, Hugh Capet, requested the crown of France from the archbishop of Reims and the upper nobility";
        //
    }
    
    if (QuestionInt == 341){
        ReturnString= @"Sundiata";
        //
        
        AnswerString = @"“Lion prince”; member of the Keita clan; created a unified state that became the Mali Empire; died in 1260";
        //
    }
    
    if (QuestionInt == 342){
        ReturnString= @"Timbuktu";
        //
        
        AnswerString = @"Port city of Mali; located just off the flood plain on the great bend in the Niger River";
        //
    }
    
    if (QuestionInt == 343){
        ReturnString= @"Louis IX";
        //
        
        AnswerString = @"Louis IX or Saint Louis,1214–70, king of France (1226–70), son and successor of Louis VIII";
        //
    }
    
    if (QuestionInt == 344){
        ReturnString= @"Centralized monarchy";
        //
        
        AnswerString = @"A monarchy whose rule included concentrated far-reaching power";
        //
    }
    
    if (QuestionInt == 345){
        ReturnString= @"Renaissance";
        //
        
        AnswerString = @"Cultural and political movement in Western Europe; began in Italy 1400 CE, rested on urban vitality and expanding commerce; combined art and literature with more secular views";
        //
    }
    
    if (QuestionInt == 346){
        ReturnString= @"Aristotle";
        //
        
        AnswerString = @"Greek philosopher; teacher of Alexander the Great; knowledge based on observation of phenomena in material world";
        //
    }
    
    if (QuestionInt == 347){
        ReturnString= @"Plato";
        //
        
        AnswerString = @"Greek philosopher; knowledge based on consideration of ideal forms outside the material world; proposed ideal abstract form of government abstract principles";
        //
    }
    
    if (QuestionInt == 348){
        ReturnString= @"Cicero";
        //
        
        AnswerString = @"Conservative Roman senator; stoic philosopher; one of the greatest orators of his day; killed in reaction to assassination of Julius Caesar";
        //
    }
    
    if (QuestionInt == 349){
        ReturnString= @"Humanism";
        //
        
        AnswerString = @"Focus on humankind as center of intellectual and artistic endeavor; method of study that emphasized the superiority of classical forms over medieval styles, in particular to the study of ancient languages";
        //
    }
    
    if (QuestionInt == 350){
        ReturnString= @"Scholasticism";
        //
        
        AnswerString = @"Dominant medieval philosophy approach; base in the schools and universities; use of logic to resolve theological problems";
        //
    }
    
    if (QuestionInt == 351){
        ReturnString= @"Byzantine Empire";
        //
        
        AnswerString = @"Eastern half of the Roman Empire following collapse of western half of the old empire; retained Mediterranean culture; capital at Constantinople";
        //
    }
    
    if (QuestionInt == 352){
        ReturnString= @"Iconoclastic controversy";
        //
        
        AnswerString = @"Religious controversy with the Byzantine Empire in the 8th century; emperor attempted to suppress veneration of icons";
        //
    }
    
    if (QuestionInt == 353){
        ReturnString= @"Clergy";
        //
        
        AnswerString = @"Clergy is the generic term used to describe the formal religious leadership within a given religion";
        //
    }
    
    if (QuestionInt == 354){
        ReturnString= @"Avignon";
        //
        
        AnswerString = @"In France, Avignon's architecture is marked by papal history. Where the Palace of the Popes was built in the 14th century";
        //
    }
    
    if (QuestionInt == 355){
        ReturnString= @"Reformation";
        //
        
        AnswerString = @"Religious movement which made its appearance in Western Europe in the sixteenth century, and which, while ostensibly aiming at an internal renewal of the Church, really led to a great revolt against it, and an abandonment of the principal Christian beliefs";
        //
    }
    
    if (QuestionInt == 356){
        ReturnString= @"Counter-reformation";
        //
        
        AnswerString = @"The Catholic Reformation or the Counter-Reformation was a strong reaffirmation of the doctrine and structure of the Catholic Church, climaxing at the Council of Trent, partly in reaction to the growth of Protestantism";
        //
    }
    
    if (QuestionInt == 357){
        ReturnString= @"Charlemagne";
        //
        
        AnswerString = @"King of the Franks and Holy Roman Emperor; conqueror of the Lombards and Saxons (742-814)";
        //
    }
    
    if (QuestionInt == 358){
        ReturnString= @"Eleanor of Aquitaine";
        //
        
        AnswerString = @"Queen of France as the wife of Louis VII; that marriage was annulled in 1152 and she then married Henry II and became Queen of England (1122-1204)";
        //
    }
    
    if (QuestionInt == 359){
        ReturnString= @"Humanists";
        //
        
        AnswerString = @"The focus on humankind as the center o intellectual and artistic endeavor";
        //
    }
    
    if (QuestionInt == 360){
        ReturnString= @"Vikings";
        //
        
        AnswerString = @"A culture originating in Scandinavia (now Norway, Denmark and Sweden) around the mid-8th century AD The Vikings were fierce conquerors, brave explorers, and skilled craftspeople; they invaded and settled countries throughout Western Europe";
        //
    }
    
    if (QuestionInt == 361){
        ReturnString= @"Code of chivalry";
        //
        
        AnswerString = @"The collective term for the social codes of knighthood that originated in France in the Middle Ages. It was based on brave, courteous and honourable behaviour – what came to be known as 'gentlemanly conduct.'";
        //
    }
    
    if (QuestionInt == 362){
        ReturnString= @"Code of the samurai";
        //
        
        AnswerString = @"Also called bushi-do, which literally means ""road of the warrior.""; Based on principles of loyalty, courage and honor";
        //
    }
    
    if (QuestionInt == 363){
        ReturnString= @"Demesne land";
        //
        
        AnswerString = @"The part of the lord's manorial lands reserved for his own use and not allocated to his serfs or freeholder tenants. Serfs worked the demesne for a specified numbers of days a week";
        //
    }
    
    if (QuestionInt == 364){
        ReturnString= @"Guilds";
        //
        
        AnswerString = @"Western European trade associations, grew strongly in the 12th and 13th centuries to protect and promote trade groups";
        //
    }
    
    if (QuestionInt == 365){
        ReturnString= @"Gothic architecture";
        //
        
        AnswerString = @"A style of architecture developed in northern France that spread throughout Europe between the 12th and 16th centuries; characterized by slender vertical piers and counterbalancing buttresses and by vaulting and pointed arches";
        //
    }
    
    if (QuestionInt == 366){
        ReturnString= @"Hanseatic League";
        //
        
        AnswerString = @"A commercial and defensive confederation of free cities in northern Germany and surrounding areas; formed in 1241 and most influential in the 14th century when it included over 100 towns and functioned as an independent political power; the last official assembly was held in 1669";
        //
    }
    
    if (QuestionInt == 367){
        ReturnString= @"Hundred Years War";
        //
        
        AnswerString = @"No description";
        //
    }
    
    if (QuestionInt == 368){
        ReturnString= @"Interdict";
        //
        
        AnswerString = @"A prohibition by the pope that can deprive individual persons, groups, communities and even nations of all priestly ministry. Thus, they no longer had access to the sacraments of the church";
        //
    }
    
    if (QuestionInt == 369){
        ReturnString= @"Inquisition";
        //
        
        AnswerString = @"An investigation or inquiry of an official or judicial nature; in the fifteenth and sixteenth centuries, the Catholic church conducted rigorous tribunals of Inquisition to identify and suppress heresy and punish heretics. These were especially severe in Spain with the inquisition of Jews in the late- 15th century";
        //
    }
    
    if (QuestionInt == 370){
        ReturnString= @"Monasticism";
        //
        
        AnswerString = @"Monasticism is the ancient style of vowed religious life which typically includes community, prayer, common worship, silence, and labour. It is governed by a monastic rule, or way of life, which involves a choice to live apart from society and the world, and so to witness in a radical way to Jesus Christ";
        //
    }
    
    if (QuestionInt == 371){
        ReturnString= @"Northern Renaissance";
        //
        
        AnswerString = @"Flemish, dutch art focus";
        //
    }
    
    if (QuestionInt == 372){
        ReturnString= @"High Renaissance";
        //
        
        AnswerString = @"Later period of the Renaissance, Italy big, Hellenistic influence";
        //
    }
    
    if (QuestionInt == 373){
        ReturnString= @"Papal States";
        //
        
        AnswerString = @"Group of territories in central Italy ruled by the popes from 754 - 1870";
        //
    }
    
    if (QuestionInt == 374){
        ReturnString= @"Russian Orthodox Church";
        //
        
        AnswerString = @"Conservative branch of Christianity that developed in Russia with Byyzantine cue";
        //
    }
    
    if (QuestionInt == 375){
        ReturnString= @"Perspective in art";
        //
        
        AnswerString = @"Development in the Renaissance that included realistic three-dimensional perspective";
        //
    }
    
    if (QuestionInt == 376){
        ReturnString= @"Villein";
        //
        
        AnswerString = @"One of a class of feudal serfs, that held legal status of freedom in dealings with ppl except their lord";
        //
    }
    
    if (QuestionInt == 377){
        ReturnString= @"Seljuk Turks";
        //
        
        AnswerString = @"Major branch of the Oghuz turks, ruled parts of central asia and middle east (11-14 centuries)";
        //
    }
    
    if (QuestionInt == 378){
        ReturnString= @"Ottoman Turks";
        //
        
        AnswerString = @"Ethnic subdivision of Turkish ppl, who dominated ruling class of the ottoman empire";
        //
    }
    
    if (QuestionInt == 379){
        ReturnString= @"Sultan";
        //
        
        AnswerString = @"Islamic title, used for rulers of the muslim country";
        //
    }
    
    if (QuestionInt == 380){
        ReturnString= @"Crusade";
        //
        
        AnswerString = @"Series of military campaigns, where roman catholics tried to capture “holy land” from muslims, some were in Europe";
        //
    }
    if (QuestionInt == 381){
        ReturnString= @"Bantun";
        //
        
        AnswerString = @"Term used to describe 400 diff enthnic groups in Africa, Cameroon to south Africa, which were untied by a common language (Bantu languages)";
        //
    }
    
    if (QuestionInt == 382){
        ReturnString= @"Zimbabwe";
        //
        
        AnswerString = @"Country where Bantu ppl began migrating into, linked to the establishment of trade ties with muslim merchants on Indian ocean (bout 10th century) trading natural resources such as gold, ivory, copper for cloth and glass";
        //
    }
    
    if (QuestionInt == 383){
        ReturnString= @"Mamluks";
        //
        
        AnswerString = @"Arabic word for “owned”, slave soldiers used by muslim caliphs and the ottoman empire";
        //
    }
    
    if (QuestionInt == 384){
        ReturnString= @"Tatars";
        //
        
        AnswerString = @"Name applied to the Turkic ppl of eastern Europe and central asia, derived from Ta-ta a Mongolian tribe that inhabited present northeast Mongolia in 5th centrury AD";
        //
    }
    
    if (QuestionInt == 385){
        ReturnString= @"Genghis Khan";
        //
        
        AnswerString = @"Successful military leader, united mongol tribes, was the founder of the mongol empire (1206-1368)";
        //
    }
    
    if (QuestionInt == 386){
        ReturnString= @"Khanates";
        //
        
        AnswerString = @"Region ruled under a khan, divided kingdoms under the mongol empire";
        //
    }
    
    if (QuestionInt == 287){
        ReturnString= @"Golden Horde";
        //
        
        AnswerString = @"A state established in Russia, one of the four kingdoms in the mongol empire";
        //
    }
    
    if (QuestionInt == 388){
        ReturnString= @"Khazars";
        //
        
        AnswerString = @"Nomadic Turkic people from central asia, many converted to Judaism, basically wandering people, allies of Byzantine empire and sassanid empire";
        //
    }
    
    if (QuestionInt == 389){
        ReturnString= @"Kievan Russia";
        //
        
        AnswerString = @"Early east Slavic state, dominated by city of kieve";
        //
    }
    
    if (QuestionInt == 390){
        ReturnString= @"City-states";
        //
        
        AnswerString = @"A sovereign state consisting of an independent city and its surrounding territory";
        //
    }
    
    if (QuestionInt == 391){
        ReturnString= @"National identity";
        //
        
        AnswerString = @"Distinguishing features of a group, to individual’s sense to belong in it";
        //
    }
    
    if (QuestionInt == 392){
        ReturnString= @"Balkan Peninsula";
        //
        
        AnswerString = @"Geographic name used to describe southern Europe, as it was surrounded by the Adriatic, Ionian, Aegean…seas from southwest , south and southeast";
        //
    }
    
    if (QuestionInt == 393){
        ReturnString= @"Steppes";
        //
        
        AnswerString = @"A vast semiarid grass-covered plain, found in southeast Europe and Mongolia";
        //
    }
    
    if (QuestionInt == 394){
        ReturnString= @"Bubonic plague";
        //
        
        AnswerString = @"A highly contagious disease, that was fatal and otherwise known as the disease spread in Asia and Europe in 1347-1351 by the Chinese and Mongols";
        //
    }
    
    if (QuestionInt == 395){
        ReturnString= @"Black Death";
        //
        
        AnswerString = @"Also known as the Black Plague that wiped out approximately 25 million people in Europe, or 25% of it’s population";
        //
    }
    
    if (QuestionInt == 396){
        ReturnString= @"Bosporus";
        //
        
        AnswerString = @"A narrow strait separating European and Asian Turkey and joining the Black Sea with the Marmara Sea; also an important trade route";
        //
    }
    
    if (QuestionInt == 397){
        ReturnString= @"Dardanelles";
        //
        
        AnswerString = @"A straight connecting the Aegean Sea with the Sea of Marmara";
        //
    }
    
    if (QuestionInt == 398){
        ReturnString= @"Mesoamerica";
        //
        
        AnswerString = @"Known as the strip from Mexico to Midwestern United States and Canada, where the native Americans have inhabited over time";
        //
    }
    
    if (QuestionInt == 399){
        ReturnString= @"Maya";
        //
        
        AnswerString = @"A native American group of people that lived in Central America";
        //
    }
    
    if (QuestionInt == 400){
        ReturnString= @"Toltecs";
        //
        
        AnswerString = @"A member of a Nahuatl-speaking people of central and southern Mexico whose empire flourished from the 10th century under invasion by the Aztes in the 12th Century";
        //
    }
    
    if (QuestionInt == 401){
        ReturnString= @"Quetzalcoatl";
        //
        
        AnswerString = @"A god of the Toltecs and Aztecs, one of the manifestation of the sun god Tezcatlipoca and represented as a plumed serpent";
        //
    }
    
    if (QuestionInt == 402){
        ReturnString= @"Priest-scholars";
        //
        
        AnswerString = @"The higher class people of the native American societies, that controlled the government along with the grand leader";
        //
    }
    
    if (QuestionInt == 403){
        ReturnString= @"Differentiated labor";
        //
        
        AnswerString = @"Labor shared amongst the peasant class";
        //
    }
    
    if (QuestionInt == 404){
        ReturnString= @"Ceremonial centers";
        //
        
        AnswerString = @"Temples, places of Sacrifice";
        //
    }
    
    if (QuestionInt == 405){
        ReturnString= @"Moundsbuilders";
        //
        
        AnswerString = @"In Mississippi region of N. America, civilizations found that created moundlike temples of dirt";
        //
    }
    
    if (QuestionInt == 406){
        ReturnString= @"Pyramids";
        //
        
        AnswerString = @"A solid figure with a polygonal base and triangular faces that meet a common point, a religious burial temple";
        //
    }
    
    if (QuestionInt == 407){
        ReturnString= @"Inca";
        //
        
        AnswerString = @"A member of the group of Quechuan peoples of highland Peru who established an empire from northern Ecuador to central Chile before the Spanish conquest";
        //
    }
    
    if (QuestionInt == 408){
        ReturnString= @"Hillside terracing";
        //
        
        AnswerString = @"Method growing rice in bulk";
        //
    }
    
    if (QuestionInt == 409){
        ReturnString= @"Quipu";
        //
        
        AnswerString = @"A record-keeping device of the Inca empire consisting of a series of variously colored strings attached to a base rope and knotted so as to encode information, used especially for accounting purposes";
        //
    }
    
    if (QuestionInt == 410){
        ReturnString= @"Tribute";
        //
        
        AnswerString = @"The sacrificing to the gods or the offering and payments to the leaders and/or owners of the land";
        //
    }
    
    if (QuestionInt == 411){
        ReturnString= @"Tula";
        //
        
        AnswerString = @"Capital of the Toltec people, established around 968 CE";
        //
    }
    
    if (QuestionInt == 412){
        ReturnString= @"Aztec Empire";
        //
        
        AnswerString = @"Powerful Indian empire founded on Lake Texcoco (Mexico)";
        //
    }
    
    if (QuestionInt == 413){
        ReturnString= @"Hernan Cortes";
        //
        
        AnswerString = @"Spanish explorer who defeated the Aztec Empire and brought most of Mexico under Spanish control";
        //
    }
    
    if (QuestionInt == 414){
        ReturnString= @"Montezuma";
        //
        
        AnswerString = @"Vemperor of the Aztecs who saw his empire defeated by the Spanish";
        //
    }
    
    if (QuestionInt == 415){
        ReturnString= @"Francisco Pizarro";
        //
        
        AnswerString = @"Spanish conquerer who defeated the Incan Empire of Peru from 1535-1540";
        //
    }
    
    if (QuestionInt == 416){
        ReturnString= @"Atahualpa";
        //
        
        AnswerString = @"The 13th and last emperor of the Incan Empire";
        //
    }
    
    if (QuestionInt == 417){
        ReturnString= @"Cuzco";
        //
        
        AnswerString = @"Capital city of the Incan Empire";
        //
    }
    
    if (QuestionInt == 418){
        ReturnString= @"Teotihuacan";
        //
        
        AnswerString = @"City founded by the Aztecs in 1325";
        //
    }
    
    if (QuestionInt == 419){
        ReturnString= @"Acculturation";
        //
        
        AnswerString = @"The obtainment of culture by an individual or a group of people";
        //
    }
    
    if (QuestionInt == 420){
        ReturnString= @"Calpulli";
        //
        
        AnswerString = @"Aztec clans that distributed land and provided labor and warriors";
        //
    }
    
    if (QuestionInt == 421){
        ReturnString= @"Despotism";
        //
        
        AnswerString = @"A system of government where a single authority rules with absolute power";
        //
    }
    
    if (QuestionInt == 422){
        ReturnString= @"Bakufu";
        //
        
        AnswerString = @"Military government established by the Minamoto, a powerful Japanese clan in 1185";
        //
    }
    
    if (QuestionInt == 423){
        ReturnString= @"Bushi";
        //
        
        AnswerString = @"Japanese warrior leaders tasked with law and order, public infrastructure, tax collection, and organizing an army";
        //
    }
    
    if (QuestionInt == 424){
        ReturnString= @"Bushido";
        //
        
        AnswerString = @"Japanese warrior code of conduct, similar to the chivalry system in Europe";
        //
    }
    
    if (QuestionInt == 425){
        ReturnString= @"Celadon";
        //
        
        AnswerString = @"Korean and Japanese pottery with a light green glaze";
        //
    }
    
    if (QuestionInt == 426){
        ReturnString= @"Daimyo";
        //
        
        AnswerString = @"Warlord rulers who divided Japan into 300 little kingdoms";
        //
    }
    
    if (QuestionInt == 427){
        ReturnString= @"Gempei Wars";
        //
        
        AnswerString = @"Five year war fought between two of Japan's powerful families, the Taira and the Minamoto";
        //
    }
    
    if (QuestionInt == 428){
        ReturnString= @"Kowtow";
        //
        
        AnswerString = @"Formal recognition of the Chinese emperor's authority, where representatives from tribute states would present gifts and engage in a formal bowing ceremony";
        //
    }
    
    if (QuestionInt == 429){
        ReturnString= @"Neo-Confucianism";
        //
        
        AnswerString = @"A response by the Confucians to the dominance of the Daoists and Buddhists, severe Confucianism";
        //
    }
    
    if (QuestionInt == 430){
        ReturnString= @"Seppuku";
        //
        
        AnswerString = @"Ritual suicide/disembowelment in Japan (hara-kiri); demonstrating courage and restoring family honor";
        //
    }
    
    if (QuestionInt == 431){
        ReturnString= @"Tea ceremony";
        //
        
        AnswerString = @"Japanese ceremony with Chinese influences symbolizing tranquility";
        //
    }
    
    if (QuestionInt == 432){
        ReturnString= @"Allah";
        //
        
        AnswerString = @"Muslim God";
        //
    }
    
    if (QuestionInt == 433){
        ReturnString= @"Battle of Tours";
        //
        
        AnswerString = @"(October 25, 732) Charles Martel, the Frankish Leader went against an Islamic army led by Emir Abd er Rahman; the Islamic army was defeated and Emir Abd er Rahman was killed. The battle stopped the northward advancement from Spain";
        //
    }
    
    if (QuestionInt == 434){
        ReturnString= @"Five Pillars";
        //
        
        AnswerString = @"Religious duties of Muslims (confession of faith, fasting during Ramadan, zakat, hajj)";
        //
    }
    
    if (QuestionInt == 435){
        ReturnString= @"Harem";
        //
        
        AnswerString = @"Living quarters reserved for wives and concubines and female relatives in a Muslim household";
        //
    }
    
    if (QuestionInt == 436){
        ReturnString= @"Hijrah";
        //
        
        AnswerString = @"Mohammad’s flight from Mecca to Medina";
        //
    }
    
    if (QuestionInt == 437){
        ReturnString= @"Ka'aba";
        //
        
        AnswerString = @"Islamic shrine in Mecca; focus of annual truce among Bedouin tribes";
        //
    }
    
    if (QuestionInt == 438){
        ReturnString= @"People of the Book";
        //
        
        AnswerString = @"(dhimmi) Christians and Jews who shared the Bible with Muslims, could be taxed by Muslims";
        //
    }
    
    if (QuestionInt == 439){
        ReturnString= @"Ramadan";
        //
        
        AnswerString = @"Islamic month of fasting from dawn to sunset";
        //
    }
    
    if (QuestionInt == 440){
        ReturnString= @"Shariah";
        //
        
        AnswerString = @"Islamic law";
        //
    }
    
    if (QuestionInt == 441){
        ReturnString= @"Umma";
        //
        
        AnswerString = @"Community of the faithful within Islam; creating political unity";
        //
    }
    
    if (QuestionInt == 442){
        ReturnString= @"Zakat";
        //
        
        AnswerString = @"Bligatory tax for Muslims used for charity";
        //
    }
    
    if (QuestionInt == 443){
        ReturnString= @"Benefice";
        //
        
        AnswerString = @"A landed estate granted in feudal tenure.";
        //
    }
    
    if (QuestionInt == 444){
        ReturnString= @"Excommunication";
        //
        
        AnswerString = @"Banishment from certain religion & Church";
        //
    }
    
    if (QuestionInt == 445){
        ReturnString= @"Investiture";
        //
        
        AnswerString = @"The act or formal ceremony of conferring the authority and symbols of a high office (there was investiture controversy – who got to do it)";
        //
    }
    
    if (QuestionInt == 446){
        ReturnString= @"Medieval";
        //
        
        AnswerString = @"Relating to the Middle Ages";
        //
    }
    
    if (QuestionInt == 447){
        ReturnString= @"Middle Ages";
        //
        
        AnswerString = @"Time period between the postclassical era and the renaissance. Consists of Dark Ages and the High Middle Ages, in which the latter saw an improvement in trade, economy, and lives of peasants.";
        //
    }
    
    if (QuestionInt == 448){
        ReturnString= @"Moldboard plow";
        //
        
        AnswerString = @"Plow invented during the Middle Ages to improve farming effeciency";
        //
    }
    
    if (QuestionInt == 449){
        ReturnString= @"Age grade";
        //
        
        AnswerString = @"A social category based on age, within a series of such categories, through which individuals pass over the course of their lives. This is in contrast to an age set, to which individuals remain permanently attached as the set itself becomes progressively more senior.";
        //
    }
    
    if (QuestionInt == 450){
        ReturnString= @"Austronesian";
        //
        
        AnswerString = @"A large language family widely dispersed throughout the islands of Southeast Asia and the Pacific, with a few members spoken on continental Asia.";
        //
    }
    
    if (QuestionInt == 451){
        ReturnString= @"Caravel";
        //
        
        AnswerString = @"A small, highly maneuverable, three-masted ship used by the Portuguese and Spanish for long voyages of exploration beginning in the 15th century";
        //
    }
    
    if (QuestionInt == 452){
        ReturnString= @"Griots";
        //
        
        AnswerString = @"West African poet, praise singer, and wandering musician, considered a repository of oral tradition";
        //
    }
    
    if (QuestionInt == 453){
        ReturnString= @"Kamikaze";
        //
        
        AnswerString = @"A legendary typhoon said to have saved Japan from a Mongol invasion fleet in 1281. In Japanese, the word ""kamikaze"" is used only for this typhoon";
        //
    }
    
    if (QuestionInt == 454){
        ReturnString= @"Khan";
        //
        
        AnswerString = @"Mongol ruler";
        //
    }
    
    if (QuestionInt == 455){
        ReturnString= @"Lateen sail";
        //
        
        AnswerString = @"A triangular sail set on a long yard mounted at an angle on the mast, and running in a fore-and-aft direction. Adopted in the Late Middle Ages, and Europeans were able to sail out of the Mediterranean";
        //
    }
    
    if (QuestionInt == 456){
        ReturnString= @"Malay sailors  a lot";
        //
        
        AnswerString = @"Traded and interacted with other Southeast Asian societies a lot";
        //
    }
    
    if (QuestionInt == 457){
        ReturnString= @"Maori";
        //
        
        AnswerString = @"Indigenous people of New Zealand";
        //
    }
    
    if (QuestionInt == 458){
        ReturnString= @"Metropolitan";
        //
        
        AnswerString = @"A big city with a large population";
        //
    }
    
    if (QuestionInt == 459){
        ReturnString= @"Middle Kingdom";
        //
        
        AnswerString = @"What China called itself. Idea of ethnocentrism by the Chinese";
        //
    }
    
    if (QuestionInt == 460){
        ReturnString= @"Ming dynasty";
        //
        
        AnswerString = @"Dynasy after Yuan founded by Zhu Yuanjhan";
        //
    }
    
    if (QuestionInt == 461){
        ReturnString= @"Mongol Peace";
        //
        
        AnswerString = @"Pax Mongolica - Mongols brought peace to almost the entire Asian continent because they tolerated and encouraged diversity, especially religions";
        //
    }
    
    if (QuestionInt == 462){
        ReturnString= @"Stateless society";
        //
        
        AnswerString = @"An ethnic group not represented by its own unique, coterminous state";
        //
    }
    
    if (QuestionInt == 463){
        ReturnString= @"Steppe diplomacy";
        //
        
        AnswerString = @"Institution that the Mongols employed to all empires under its control. Paying tribute was one aspect of it";
        //
    }
    
    if (QuestionInt == 464){
        ReturnString= @"Syncretism";
        //
        
        AnswerString = @"Attempt to merge disparate traditions or practices and combine them with another tradition. (religion also)";
        //
    }
    
    if (QuestionInt == 465){
        ReturnString= @"Anasazi";
        //
        
        AnswerString = @"A native American culture flourishing in southern Colorado and Utah and northern New Mexico and Arizona";
        //
    }
    
    if (QuestionInt == 466){
        ReturnString= @"Ayllus";
        //
        
        AnswerString = @"The basic political unit of pre-Inca and Inca life; core of extended families but nno non-related members were included";
        //
    }
    
    if (QuestionInt == 467){
        ReturnString= @"Chimor";
        //
        
        AnswerString = @"Political grouping of the chimu culture that ruled the northern coast of Peru, from 850-1470";
        //
    }
    
    if (QuestionInt == 468){
        ReturnString= @"Chinampas";
        //
        
        AnswerString = @"Known as floating gardens, small, rectangle-shapes area of fertile arable land used for agriculture in the Xochimilco region of the Basin of Mexico";
        //
    }
    
    if (QuestionInt == 469){
        ReturnString= @"Mexica";
        //
        
        AnswerString = @"What we know today as Mexicans";
        //
    }
    
    if (QuestionInt == 470){
        ReturnString= @"Mississippians";
        //
        
        AnswerString = @"People of the Mississippi plains";
        //
    }
    
    if (QuestionInt == 471){
        ReturnString= @"Mita";
        //
        
        AnswerString = @"Mandatory public service by society in ancient South America. During the Inca empire, public service was required in public works projects such as the building of road and military services";
        //
    }
    
    if (QuestionInt == 472){
        ReturnString= @"Parallel descent";
        //
        
        AnswerString = @"The area southward of Mexico";
        //
    }
    
    if (QuestionInt == 473){
        ReturnString= @"Quechua";
        //
        
        AnswerString = @"The language of the Inca empire, now spoken in the Andes highlands from southern Colombia to Chile";
        //
    }
    
    if (QuestionInt == 474){
        ReturnString= @"Babur";
        //
        
        AnswerString = @"Founded Mughal Dynasty of India";
        //
    }
    
    if (QuestionInt == 475){
        ReturnString= @"Akbar";
        //
        
        AnswerString = @"Greatest ruler of Mughal Dynasty - religious tolerance - created Din-i-Ilahi (""Faith of the Divine""), combo of Hindu, Islam, Christianity patron of the arts/literature";
        //
    }
    
    if (QuestionInt == 476){
        ReturnString= @"Sha Jahan";
        //
        
        AnswerString = @"Indian Mughal ruler - tried (not successfully) to expand frontier - built Taj Mahal";
        //
    }
    
    if (QuestionInt == 477){
        ReturnString= @"Charles V";
        //
        
        AnswerString = @"Holy Roman Emperor - heritage from German Hapsburgs, Burgundy, Spanish heritage - united empires";
        //
    }
    
    if (QuestionInt == 478){
        ReturnString= @"Conquistador";
        //
        
        AnswerString = @"Spanish soldiers, explorers, adventurers who spread across Americas";
        //
    }
    
    if (QuestionInt == 479){
        ReturnString= @"Henry of Navarre";
        //
        
        AnswerString = @"First French monarch - Bourbon dynasty - religious tolerance for Protestant minority - Edict of Nantes - cared about welfare of people";
        //
    }
    
    if (QuestionInt == 379){
        ReturnString= @"Sultan";
        //
        
        AnswerString = @"Islamic title, used for rulers of the muslim country";
        //
    }
    
    if (QuestionInt == 480){
        ReturnString= @"Hideyoshi";
        //
        
        AnswerString = @"Daimyo that unified Japan, only samurai class carry weapons - replaced by Tokugawa";
        //
    }
    
    if (QuestionInt == 481){
        ReturnString= @"Ivan the Great";
        //
        
        AnswerString = @"Quadrulpled size of Russia, made Moscow impressive capital of Third Roman Empire, laid foundation for Russian aristocracy, longest rule";
        //
    }
    
    if (QuestionInt == 482){
        ReturnString= @"Louis XIV";
        //
        
        AnswerString = @"""Sun King"" - did he say ""I am the state"" - longest rule in Europe - made France absolute monarchy, increased France's powers through foreign wars, built Versailles, symbol of European absolutism";
        //
    }
    
    if (QuestionInt == 483){
        ReturnString = @"Prince Henry the Navigator";
        //
        
        AnswerString = @"Pushed Portugues efforts to explore African sea route to Asia";
        //
    }
    
    if (QuestionInt == 484){
        ReturnString= @"Oliver Cromwell";
        //
        
        AnswerString = @"British military leader - based on meritocracy - though a military dictator, England became first Republic";
        //
    }
    
    if (QuestionInt == 485){
        ReturnString= @"Ronin";
        //
        
        AnswerString = @"Masterless samurai between 1180-1868";
        //
    }
    
    if (QuestionInt == 486){
        ReturnString= @"Sikhs";
        //
        
        AnswerString = @"Ten Sikh gurus - Northern India - started religion - Sikhism - unique view of world through one God";
        //
    }
    
    if (QuestionInt == 487){
        ReturnString= @"Suleiman I";
        //
        
        AnswerString = @"Ruler of Ottoman Empire - same time as Charles V - fair ruler/expanded holdings, reconstructed legal system";
        //
    }
    
    if (QuestionInt == 488){
        ReturnString= @"Sunni Ali";
        //
        
        AnswerString = @"15th century - great king of Songhai Empire in sub-Saharan Africa - controlled Timbuktu - surpassed Mali Empire";
        //
    }
    
    if (QuestionInt == 489){
        ReturnString= @"Guinea states";
        //
        
        AnswerString = @"States in West Africa known for gold and African slave labor";
        //
    }
    
    if (QuestionInt == 490){
        ReturnString= @"Indo-Gangetic Plain";
        //
        
        AnswerString = @"A rich, fertile and ancient land encompassing most of northern and eastern India, the most populous parts of Pakistan, and virtually all of Bangladesh.";
        //
    }
    
    if (QuestionInt == 491){
        ReturnString= @"Lepanto";
        //
        
        AnswerString = @"1571 - Coalition of Catholic states navy defeats Ottoman Empire's navy - signals beginning of W. European/Spain/Portuguese dominance of Mediterranean and beyond";
        //
    }
    
    if (QuestionInt == 492){
        ReturnString= @"Act of Toleration";
        //
        
        AnswerString = @"1689 - British law granting tolerance to minority faiths - ends generations of bloodshed ";
        //
    }
    
    if (QuestionInt == 493){
        ReturnString= @"Capitalism";
        //
        
        AnswerString = @"Economic system where government stays out of companies choices, market - supply/demand determine product, goal is to make profit to reinvest in company";
        //
    }
    
    if (QuestionInt == 494){
        ReturnString= @"Entrepreneur";
        //
        
        AnswerString = @"Person who starts up company to compete in capitalist system, must secure capital from financing - bank/currency system useful";
        //
    }
    
    if (QuestionInt == 495){
        ReturnString= @"Joint stock company";
        //
        
        AnswerString = @"W. European financial company with capital from investors, used to make a profit - precursor to corporation";
        //
    }
    
    if (QuestionInt == 496){
        ReturnString= @"Dutch East India Company";
        //
        
        AnswerString = @"Trading corporation for Netherlands - controlled markets and resources of colonies";
        //
    }
    
    if (QuestionInt == 397){
        ReturnString= @"British East India Company";
        //
        
        AnswerString = @"Controlled trade for Britain - became even stronger than some governments - controlled markets and resources";
        //
    }
    
    if (QuestionInt == 498){
        ReturnString= @"Treaty of Tordesillas";
        //
        
        AnswerString = @"Pope divides Latin America between Portugal and Spain - Brazil - Portuguese, Spain - everywhere else";
        //
    }
    
    if (QuestionInt == 499){
        ReturnString= @"Parlement";
        //
        
        AnswerString = @"In France, initially political bodies responsible for recording laws/edicts - eventually pushed power by not recording edicts they didn't agree with";
        //
    }
    
    if (QuestionInt == 500){
        ReturnString= @"Baroque";
        //
        
        AnswerString = @"Exaggerated motion and clear, easily interpreted detail to produce drama, tension, exuberance, and grandeur in sculpture, painting, literature, and music. The style started around 1600 in Rome, Italy and spread to most of Europe";
        //
    }
    
    if (QuestionInt == 501){
        ReturnString= @"Elizabeth I";
        //
        
        AnswerString = @"England monarch 1558-1603, ruled under religious turmoil, Elizabethan Age - golden age of England - Shakespeare, encouraged colonization, didn't give out nobility";
        //
    }
    
    if (QuestionInt == 502){
        ReturnString= @"John Calvin";
        //
        
        AnswerString = @"Calvinism - belief in predestination - anti-witches, ";
        //
    }
    
    if (QuestionInt == 503){
        ReturnString= @"English Enlightenment";
        //
        
        AnswerString = @"1649-1690 - England reduces power of monarchy through overthrow of Cromwell, Glorious Revolution, English Bill of Rights, and writing by John Locke and Thomas Hobbes";
        //
    }
    
    if (QuestionInt == 504){
        ReturnString= @"Footbinding";
        //
        
        AnswerString = @"Began Tang Dynasy - 700, eventually spread to all classes, feet bound on girls at 6 years old, status symbol - only rich could afford to do it, symbol of femininity - women willing to go through pain for appearance - see high heel shoes";
        //
    }
    
    if (QuestionInt == 505){
        ReturnString= @"Huguenots";
        //
        
        AnswerString = @"Protestants living in Catholic France - minority - often persecuted";
        //
    }
    if (QuestionInt == 506){
        ReturnString= @"Italian Renaissance";
        //
        
        AnswerString = @"Rebirth of Classical (Greece/Rome) art/architecture - humanistic focus - patrons - families like Medici and the Catholic Church - blended natural world w/ religion - transition away from religion";
        //
    }
    if (QuestionInt == 507){
        ReturnString= @"Jesuits";
        //
        
        AnswerString = @"Footsoldiers of the Pope, Society of Jesus, branch of Catholicism after Reformation, focused on educational/universities, missionary work and social justice";
        //
    }
    if (QuestionInt == 508){
        ReturnString= @"Northern Renaissance";
        //
        
        AnswerString = @"Spread to Nothern Europe - literature, art - blended human form w/ religion - literature/arts in vernacular for the masses";
        //
    }
    
    if (QuestionInt == 509){
        ReturnString= @"Philosophes";
        //
        
        AnswerString = @"French Enlightened thinkers who tried to explain society/human nature - led to Enlightenment";
        //
    }
    
    if (QuestionInt == 510){
        ReturnString= @"Puritans";
        //
        
        AnswerString = @"Sect of Protestants in England who dismiss Anglican church, want pure form of Christianity based on Bible, predestination, kicked out to New England - known in the US as Pilgrims";
        //
    }
    
    if (QuestionInt == 511){
        ReturnString= @"Rococo";
        //
        
        AnswerString = @"The Rococo style of art emerged in France in the early 18th century as a continuation of the Baroque style, but in contrast to the heavier themes and darker colors of the Baroque, the Rococo was characterized by an opulence, grace, playfulness, and lightness. Rococo motifs focused on the carefree aristocratic life and on lighthearted romance rather than heroic battles or religious figures; they";
        //
    }
    
    if (QuestionInt == 512){
        ReturnString= @"Architecture of the Renaissance";
        //
        
        AnswerString = @"Architecture based on mathematical precision, columns, domes, geometrically perfect designs, revival of Roman architecture";
        //
    }
    
    if (QuestionInt == 513){
        ReturnString= @"Deism";
        //
        
        AnswerString = @"Belief that God stays out of our daily lives - he's a big clockmaker who started the universe, gave us everything we need, and then just watches";
        //
    }
    
    if (QuestionInt == 514){
        ReturnString= @"Patronage of the arts";
        //
        
        AnswerString = @"Catholic Church and rich families paid artists to decorate walls/architecture/fountains/doors";
        //
    }
    
    if (QuestionInt == 515){
        ReturnString= @"Printing Press";
        //
        
        AnswerString = @"Gutenberg - led to increased literacy, writing in vernacular, takes power from the Church monopoly on literacy";
        //
    }
    
    if (QuestionInt == 516){
        ReturnString= @"Absolute monarchy";
        //
        
        AnswerString = @"Heriditary leadership that controls executive, legislative, judicial decisions";
        //
    }
    
    if (QuestionInt == 517){
        ReturnString= @"Boyars";
        //
        
        AnswerString = @"Member of the highest rank of the feudal Russian and Romanian aristocracy, second only to the ruling princes, from the 10th through the 17th century";
        //
    }
    
    if (QuestionInt == 518){
        ReturnString= @"Cossacks";
        //
        
        AnswerString = @"Several peoples living in the southern steppe regions of Eastern Europe and Asiatic Russia, famous for their self-reliance and military skill, particularly horsemanship";
        //
    }
    
    if (QuestionInt == 519){
        ReturnString= @"Creoles";
        //
        
        AnswerString = @"Spanish/Portuguese born in Latin America - on class scale, step below those actually born in Spain/Portugal";
        //
    }
    
    if (QuestionInt == 520){
        ReturnString= @"Devshirme";
        //
        
        AnswerString = @"System of collection of young boys from conquered Christian lands by the Ottoman sultans as a form or regular taxation in order to build a loyal slave army and class of administrators: the Janissaries, or other servants such as tellak";
        //
    }
    
    if (QuestionInt == 521){
        ReturnString= @"Divine right";
        //
        
        AnswerString = @"Belief that God stays out of our daily lives - he's a big clockmaker who started the universe, gave us everything we need, European belief by monarchs, aristocracy that their right to rule was legitimized/sanctioned by God,I was born into a monarchy, I must deserve it";
        //
    }
    
    if (QuestionInt == 522){
        ReturnString= @"Dutch learning";
        //
        
        AnswerString = @"Rangaku - method by which Japan kept abreast of Western technology and medicine in the period when the country was closed to foreigners, 1641–1853, because of the Tokugawa shogunate's policy of national isolation ";
        //
    }
    
    if (QuestionInt == 523){
        ReturnString= @"Encomienda";
        //
        
        AnswerString = @"System of Spanish rule in Americas where Spanish landowners have right to forced labor for all indigenous people living on land grant";
        //
    }
    
    if (QuestionInt == 524){
        ReturnString= @"Enlightenment";
        //
        
        AnswerString = @"Attempt to apply logic from Scientific Revolution to human nature/government/economics";
        //
    }
    
    if (QuestionInt == 525){
        ReturnString= @"Estates-General";
        //
        
        AnswerString = @"Meeting of French governing body called to find way of bringing in more income to the state, backfires and leads to French Revolution";
        //
    }
    
    if (QuestionInt == 526){
        ReturnString= @"Glorious Revolution";
        //
        
        AnswerString = @"1688 overthrow of King James in England";
        //
    }
    
    if (QuestionInt == 527){
        ReturnString= @"Hagia Sophia";
        //
        
        AnswerString = @"Former Eastern Orthodox church converted to a mosque, now converted into a museum, in the Turkish city of Istanbul";
        //
    }
    
    if (QuestionInt == 528){
        ReturnString= @"Janissaries";
        //
        
        AnswerString = @"Christian slave army that fought for Ottoman Empire - later developed monopoly on military and resisted technogical innovation";
        //
    }
    
    if (QuestionInt == 529){
        ReturnString= @"Mancus";
        //
        
        AnswerString = @"Gold coin in Medieval Europe";
        //
    }
    
    if (QuestionInt == 530){
        ReturnString= @"Mercantilism";
        //
        
        AnswerString = @"Economic system where colonies market and resources for the sole use of mother country";
        //
    }
    
    if (QuestionInt == 531){
        ReturnString= @"Mestizos";
        //
        
        AnswerString = @"American that is half indigenous person, half European";
        //
    }
    
    if (QuestionInt == 532){
        ReturnString= @"Mughal dynasty";
        //
        
        AnswerString = @"Muslim dynasty that ruled India";
        //
    }
    
    if (QuestionInt == 533){
        ReturnString= @"Mulatto";
        //
        
        AnswerString = @"Offspring of a European and an African";
        //
    }
    
    if (QuestionInt == 534){
        ReturnString= @"Nation-state";
        //
        
        AnswerString = @"Nation-state"": a sovereign state of which most of the citizens or subjects are united also by factors which define a nation, such as language or common descent. Typically it is a unitary state with a single system of law and government. It is almost by definition a sovereign state, meaning that there is no external authority above the state itself.";
        //
    }
    
    if (QuestionInt == 535){
        ReturnString= @"Parliamentary monarchy";
        //
        
        AnswerString = @"Attempt to control monarchy through parliament - first experiment in England - usually controlled budget which controlled/limited monarch";
        //
    }
    
    if (QuestionInt == 536){
        ReturnString= @"Peninsulares";
        //
        
        AnswerString = @"Highest of Spanish colonial caste system - peninsular was a citizen born in the metropolitan part of the Spanish Empire. Also, they held high official power or positions.";
        //
    }
    
    if (QuestionInt == 537){
        ReturnString= @"Purdah";
        //
        
        AnswerString = @"Practice of requiring women to cover their bodies so as to cover their skin and conceal their form, separates genders, some places more cultural than religious";
        //
    }
    
    if (QuestionInt == 538){
        ReturnString= @"Qing dynasty";
        //
        
        AnswerString = @"Founded by Manch clan from Northeast, not Qin, claimed mandate of heaven, eventually couldn't keep out Europeans, died";
        //
    }
    
    if (QuestionInt == 539){
        ReturnString= @"Reconquista";
        //
        
        AnswerString = @"Reestablishment of Christian rather than Muslim rule in the Iberian Peninsula, taking place between 718 and 1492";
        //
    }
    
    if (QuestionInt == 540){
        ReturnString= @"Sovereignty";
        //
        
        AnswerString = @"Right to exercise supreme political (e.g. legislative, judicial, and/or executive) authority over a geographic region, group of people, or oneself";
        //
    }
    
    if (QuestionInt == 541){
        ReturnString= @"Taj Mahal";
        //
        
        AnswerString = @"Finest example of Mughal architecture - Mughal Emperor Shah Jahan commissioned its construction as a mausoleum for his favorite wife, Arjumand Bano Begum, who is better known as Mumtaz Mahal";
        //
    }
    
    if (QuestionInt == 542){
        ReturnString= @"Tokugawa Shogunate";
        //
        
        AnswerString = @"A feudal military dictatorship of Japan established in 1603 by Tokugawa Ieyasu and ruled by the shoguns of the Tokugawa family until 1868. This period is known as the Edo period and gets its name from the capital city of Edo, now Tokyo based on the strict class hierarchy originally established by Toyotomi Hideyoshi. The warrior-caste of samurai were at the top, followed by farmers, artisans, and traders";
        //
    }
    
    if (QuestionInt == 543){
        ReturnString= @"Viceroyalty";
        //
        
        AnswerString = @"Royal official who governs a country or province in the name of and as representative of the monarch - usually refers to method of colonial rule";
        //
    }
    
    if (QuestionInt == 544){
        ReturnString= @"Caravel";
        //
        
        AnswerString = @"Small, highly maneuverable, three-masted ship used by the Portuguese and Spanish for long voyages of exploration beginning in the 15th century, due to size could explore up river";
        //
    }
    
    if (QuestionInt == 545){
        ReturnString= @"Columbian Exchange";
        //
        
        AnswerString = @"Trade of Americas/Africa/Europeexchange of crops, disease, culture, peoples, pack animals  - led to improved diets, massive immigration (some forced)";
        //
    }
    
    if (QuestionInt == 546){
        ReturnString= @"Northwest Passage";
        //
        
        AnswerString = @"Attempt to find water route through North America - none ever found - led to exploration of bays, rivers";
        //
    }
    
    if (QuestionInt == 547){
        ReturnString= @"Middle Passage";
        //
        
        AnswerString = @"Term given for sea voyage of African slaves on way to Latin America/Caribbean/North America - 25-50% would perish on trip";
        //
    }
    
    if (QuestionInt == 548){
        ReturnString= @"Triangular trade";
        //
        
        AnswerString = @"Trade of African slaves to Caribbean, sugar to industrialized North U.S. and England, manufactured goods to Africa";
        //
    }
    
    if (QuestionInt == 549){
        ReturnString= @"Catholic Reformation – Counter Reformation";
        //
        
        AnswerString = @"Instead of transforming Catholic Church after Protestant Reformation (did get rid of indulgences), stop the spread of Protestantism, both by reforming the Catholic Church, and also by persecuting as heretical those deemed to go too far";
        //
    }
    
    if (QuestionInt == 550){
        ReturnString= @"Commercial revolution";
        //
        
        AnswerString = @"Of European economic expansion, colonialism, and mercantilism which lasted from approximately 1520 until 1650. Voyages of discovery in the fifteenth and sixteenth centuries allowed European powers to build vast networks of international trade, which in turn generating a great deal of wealth for them";
        //
    }
    if (QuestionInt == 551){
        ReturnString= @"Empirical research";
        //
        
        AnswerString = @"Data needed to support logical views - theories made not what you believe, but what you can prove";
        //
    }
    if (QuestionInt == 552){
        ReturnString= @"Excommunication";
        //
        
        AnswerString = @"Kicked out of the Church, threat made for those who had heretical views";
        //
    }
    if (QuestionInt == 553){
        ReturnString= @"Enlightenment";
        //
        
        AnswerString = @"Belief that logic, techniques used in Scientific Revolution could be applied to human behavior, government, economics - series of essays/novels - movement away from the Church";
        //
    }
    if (QuestionInt == 554){
        ReturnString= @"Heliocentric theory";
        //
        
        AnswerString = @"Belief that earth rotates around the sun, contradicts geocentric view held for centuries, and by church that universe revolved around earth";
        //
    }
    if (QuestionInt == 555){
        ReturnString= @"Indulgence";
        //
        
        AnswerString = @"Selling of passes out of pergatory into heaven to pay for Renaissance architecture/art in Rome, big complaint of Martin Luther";
        //
    }
    if (QuestionInt == 556){
        ReturnString= @"Laissez-faire economics";
        //
        
        AnswerString = @"Belief that government should not control business - hands off - let market decide success/failure of a product";
        //
    }
    if (QuestionInt == 557){
        ReturnString= @"Natural laws";
        //
        
        AnswerString = @"Belief that human interaction/rule of law is governed by a set of laws - similar to those found in nature like gravity";
        //
    }
    if (QuestionInt == 558){
        ReturnString= @"Nintey-Five Theses";
        //
        
        AnswerString = @"Complaints made by Martin Luther against Catholic Church - nailed to the church university door, started Protestant Reformation";
        //
    }
    if (QuestionInt == 559){
        ReturnString= @"Predestination";
        //
        
        AnswerString = @"Belief that a long time ago, at the dawn of creation, all spirits/souls were predetermined on who was going to heaven, so…going to heaven not based on works/actions, but on God's choosing";
        //
    }
    if (QuestionInt == 560){
        ReturnString= @"Protestant Reformation";
        //
        
        AnswerString = @"Attempt to reform Church, leads to divide, creation of Protestant faiths that gain legitimacy from the Bible and not from the Church, not as ritualistic as the Church, Bibles written in vernacular, movement divided nations in Europe led to wars";
        //
    }
    if (QuestionInt == 561){
        ReturnString= @"Society of Jesus";
        //
        
        AnswerString = @"Otherwise known as the Jesuits, Catholic response to Protestant Reformation - encouraged education, human rights";
        //
    }
    if (QuestionInt == 562){
        ReturnString= @"Martin Luther";
        //
        
        AnswerString = @"Priest that initiated Protestant Reformation, refused to renounce views, protected by German princes, also wanted clergy to be able to marry";
        //
    }
    if (QuestionInt == 563){
        ReturnString= @"Henry VIII";
        //
        
        AnswerString = @"Created Anglican Church, split from Catholic Church because Pope would annull marriage to women who couldn't produce male heir";
        //
    }
    if (QuestionInt == 564){
        ReturnString= @"Protestant doctrines";
        //
        
        AnswerString = @"Don't believe in holy trinity, only through Bible/faith in Christ can you go to heaven, priests can be married, don't take communion, don't answer to Pope";
        //
    }
    if (QuestionInt == 565){
        ReturnString= @"Saint Ignatius Loyola";
        //
        
        AnswerString = @"Leader of Jesuits - pushed for universities, education, human rights";
        //
    }
    if (QuestionInt == 566){
        ReturnString= @"European religious wars";
        //
        
        AnswerString = @"Following Reformation - European regions fought each other on whether to be Protestant or Catholic, stay Catholic, still pay taxes to Church, Church owns property, but traditional, princes/leaders would change minds & people would have to follow";
        //
    }
    if (QuestionInt == 567){
        ReturnString= @"Thirty Years War";
        //
        
        AnswerString = @"Years 1618 and 1648, principally on the territory of today's Germany, but also involving most of the major continental powers. It occurred for a number of reasons. Although it was from its outset a religious conflict between Protestants and Catholics, the self-preservation of the Habsburg dynasty was also a central motive";
        //
    }
    if (QuestionInt == 568){
        ReturnString= @"Enlightened monarchs/despots";
        //
        
        AnswerString = @"Monarchs embraced the principles of the Enlightenment, especially its emphasis upon rationality, and applied them to their kingdoms. They tended to allow religious toleration, freedom of speech and the press, and the right to hold private property. Most fostered the arts, sciences, and education";
        //
    }
    if (QuestionInt == 569){
        ReturnString= @"Maria Theresa and Joseph II";
        //
        
        AnswerString = @"First and only female head of the Habsburg dynasty. She was Archduchess of Austria, and Queen of Hungary and Bohemia and ruler of other territories from 1740 until her death. She also became the Holy Roman Empress when her husband was elected Holy Roman Emperor. She was one of the so-called ""enlightened despots"" . She was one of the most powerful rulers of her time, ruling over much of central Europe.";
        //
    }
    if (QuestionInt == 570){
        ReturnString= @"Frederick the Great";
        //
        
        AnswerString = @"A king of Prussia from the Hohenzollern dynasty, reigning from 1740 to 1786. - enlightened monarch";
        //
    }
    if (QuestionInt == 571){
        ReturnString= @"Copernicus";
        //
        
        AnswerString = @"Provided the first modern formulation of a heliocentric (sun-centered) theory of the solar system";
        //
    }
    if (QuestionInt == 572){
        ReturnString= @"Galileo";
        //
        
        AnswerString = @"Improvements to the telescope, a variety of astronomical observations, the first and second laws of motion, and effective support for Copernicanism. He has been referred to as the ""father of modern astronomy"", as the ""father of modern physics"", and as ""father of science.""";
        //
    }
    if (QuestionInt == 573){
        ReturnString= @"Sir Isaac Newton";
        //
        
        AnswerString = @"By deriving Kepler's laws of planetary motion from this system, he was the first to show that the motion of bodies on Earth and of celestial bodies are governed by the same set of natural laws. The unifying and deterministic power of his laws was integral to the scientific revolution and the advancement of heliocentrism.";
        //
    }
    if (QuestionInt == 574){
        ReturnString= @"Voltaire";
        //
        
        AnswerString = @"Enlightened thinker spoke out against the Church, corresponded with Enlightened Monarchs";
        //
    }
    if (QuestionInt == 575){
        ReturnString= @"Jean-Jacques Rousseau";
        //
        
        AnswerString = @"Political ideas influenced the French Revolution, the development of socialist theory, and the growth of nationalism. His legacy as a radical and revolutionary is perhaps best demonstrated by his most famous line in The Social Contract: ""Man is born free, and everywhere he is in chains.""";
        //
    }
    if (QuestionInt == 576){
        ReturnString= @"class diversification in Europe";
        //
        
        AnswerString = @"Growth of middle class between aristocracy and peasantry";
        //
    }
    if (QuestionInt == 577){
        ReturnString= @"Population growth and the Agricultural Revolution";
        //
        
        AnswerString = @"Need for more food for Industrialization/growing population (little disease, improving health/diet), improved technology, crop rotation, enclosure movement";
        //
    }
    if (QuestionInt == 578){
        ReturnString= @"Adam Smith";
        //
        
        AnswerString = @"Wealth of Nations author, put forth foundation of capitalism - laissez faire, move away from mercantilism";
        //
    }
    if (QuestionInt == 579){
        ReturnString= @"Proto-industrialization";
        //
        
        AnswerString = @"16th century. The word was initially applied to cottage industries in the countryside. In spite of the opposition of urban guilds, rural residents were performing many industrial tasks.";
        //
    }
    if (QuestionInt == 580){
        ReturnString= @"Lodestone";
        //
        
        AnswerString = @"No given answer";
        //
    }
    if (QuestionInt == 581){
        ReturnString= @"Iberian wave of exploration";
        //
        
        AnswerString = @"Portuguese and Spanish move across coast of Africa,exploring quickest route to India, starts wave of exploration, set up forts on islands on coast";
        //
    }
    if (QuestionInt == 582){
        ReturnString= @"Prince Henry the Navigator";
        //
        
        AnswerString = @"Sparks European interest in exploration, gave Portuguese a head start, known in English as Prince Henry the Navigator or the Seafarer (Portuguese: o Navegador). He promoted early Portuguese efforts to explore an African route to Asia";
        //
    }
    if (QuestionInt == 583){
        ReturnString= @"Christopher Columbus";
        //
        
        AnswerString = @"""discoverer"" of Americas, looking for shortcut/western route to East Indies - controversial character - treatment of indigenous people/African slave introduction vs. Columbian Exchange and starting new wave of exploration, starts era of European dominance";
        //
    }
    if (QuestionInt == 584){
        ReturnString= @"Ferdinand Magellan";
        //
        
        AnswerString = @"1521 - led first attempt to circumnavigate the globe";
        //
    }
    if (QuestionInt == 585){
        ReturnString= @"Colonization";
        //
        
        AnswerString = @"Need for markets, resources for industrializing nations - also needed precious metals to fuel Iberian Peninsula wealth, also Europeans emigrated due to lack of land, overpopulation, chance for new beginning";
        //
    }
    if (QuestionInt == 586){
        ReturnString= @"Northern wave of exploration";
        //
        
        AnswerString = @"France, England, Dutch explore North America set up independent colonies with direct ties to Western Europe, less role of the Catholic Church, greater political independence than Latin America, developed more diverse societies than monoculture of Latin America";
        //
    }
    if (QuestionInt == 587){
        ReturnString= @"Jacques Cartier";
        //
        
        AnswerString = @"Explorer popularly thought of as one of the major discoverers of Canada.";
        //
    }
    if (QuestionInt == 588){
        ReturnString= @"North American fur trade";
        //
        
        AnswerString = @"Indians and French worked together, massive exporters of fur, beaverskin caps became rage in Europe, French colonized differently, mostly male-dominated initially along Mississippi";
        //
    }
    if (QuestionInt == 589){
        ReturnString= @"Henry Hudson";
        //
        
        AnswerString = @"British explorer, Scandinvavia, Canada, and North Eastern Europe, looked for Northwest passage";
        //
    }
    if (QuestionInt == 590){
        ReturnString= @"New Amsterdam";
        //
        
        AnswerString = @"17th century fortified settlement in the New Netherland territory (1614-1674), fortified trading center that later becomes New York City";
        //
    }
    if (QuestionInt == 591){
        ReturnString= @"Osman I";
        //
        
        AnswerString = @"1299 - Osman is regarded as the founder of the Ottoman Empire, and it is from him that its inhabitants, the Turks, called themselves Osmanli until the dissolution of the Ottoman Empire";
        //
    }
    if (QuestionInt == 592){
        ReturnString= @"Sultan";
        //
        
        AnswerString = @"Certain Muslim rulers who claimed full sovereignty in practical terms (i.e. the lack of dependence on any higher ruler), without claiming the overall caliphate. It then developed some further meanings in certain contexts. The dynasty and lands ruled by the Sultan is called Sultanate";
        //
    }
    if (QuestionInt == 593){
        ReturnString= @"Viziers";
        //
        
        AnswerString = @"-Ranking political (and sometimes religious) advisor or Minister, often to a Muslim monarch such as a Caliph, Amir, Malik (king) or Sultan";
        //
    }
    if (QuestionInt == 594){
        ReturnString= @"Istanbul";
        //
        
        AnswerString = @"Officially known as Constantinople until 1930 when its name was changed to Istanbul. Due to its three-thousand-year old history it is considered as one of the oldest still existing cities of the world";
        //
    }
    if (QuestionInt == 595){
        ReturnString= @"Mehmet II";
        //
        
        AnswerString = @"1480 first Ottoman ruler to claim the title of Caesar of the Roman Empire (supreme ruler of all Christians), besides such usual titles as King, Sultan (ruler of a Muslim state), Khan (ruler of Turks), etc. He made this claim after his conquest of Constantinople (1453), and assumption of that imperial regalia along with his own";
        //
    }
    if (QuestionInt == 596){
        ReturnString= @"Millet system";
        //
        
        AnswerString = @"Method of working with religious minorities in Ottoman Empire - millets had a great deal of power - they set their own laws and collected and distributed their own taxes. All that was insisted was loyalty to the Empire. When a member of one millet committed a crime against a member of another, the law of the injured party applied, but the - ruling - Islamic majority being paramount, any dispute involving a Muslim fell under their sharia-based law";
        //
    }
    if (QuestionInt == 597){
        ReturnString= @"Harem";
        //
        
        AnswerString = @"Part of the household forbidden to male strangers. In Western languages such as English, this term refers collectively to the wives in a polygynous household as well as the ""no-males allowed"" area, or in more modern usage to a number of women followers or admirers of a man";
        //
    }
    if (QuestionInt == 598){
        ReturnString= @"Siege of Vienna";
        //
        
        AnswerString = @"Failed attempt by Ottoman Empire to invade Europe, ever since Europe had to fear/keep peace with Ottoman Empire - farthest Westward advance into Central Europe of the Ottoman Empire, and of all the clashes between the armies of Christianity and Islam might be signaled as the battle that finally stemmed the previously-unstoppable Turkish forces ";
        //
    }
    if (QuestionInt == 599){
        ReturnString= @"Safavid Empire";
        //
        
        AnswerString = @"Native Iranian dynasty from Azarbaijan that ruled from 1501 to 1736, and which established Shi'a Islam as Iran's official religion and united its provinces under a single Iranian sovereignty, thereby reigniting the Persian identity and acting as a bridge to modern Iran";
        //
    }
    if (QuestionInt == 600){
        ReturnString= @"Abbas the Great";
        //
        
        AnswerString = @"Strongers leader of Safavid Empire, expanded trade w/ West - Abbas' reign, with its military successes and efficient administrative system, raised Iran to the status of a great power. Abbas was a skilled diplomat, tolerant of his Christian subjects in Armenia";
        //
    }
    if (QuestionInt == 601){
        ReturnString= @"Isfahan";
        //
        
        AnswerString = @"Cultural/political center of Safavid Empire - 3rd largest city in Iran today";
        //
    }
    if (QuestionInt == 602){
        ReturnString= @"Ming dynasty";
        //
        
        AnswerString = @"Ruling dynasty of China from 1368 to 1644. It was the last ethnic Han-led dynasty in China - vast navy and army were built, including four-masted ships of 1,500 tons displacement in the former, and a standing army of one million troops. Over 100,000 tons of iron per year were produced in North China (roughly 1 kg per inhabitant), and many books were printed using movable type";
        //
    }
    if (QuestionInt == 603){
        ReturnString= @"Francis Xavier";
        //
        
        AnswerString = @"Pioneering Christian missionary and co-founder of the Society of Jesus (Jesuit Order). The Roman Catholic Church considers him to have converted more people to Christianity than anyone else since St. Paul";
        //
    }
    if (QuestionInt == 604){
        ReturnString= @"Qing Empire";
        //
        
        AnswerString = @"No Answer";
        //
    }
    if (QuestionInt == 605){
        ReturnString= @"Tea and Chinese trade with Europe";
        //
        
        AnswerString = @"Portuguese discover Chinese tea in 1560s, starts as drink of the wealthy, eventually supply increases, becomes part of daily life of Europe, dominates life";
        //
    }
    if (QuestionInt == 606){
        ReturnString= @"Kangxi";
        //
        
        AnswerString = @"One of the greatest Chinese emperors in history. His reign of 61 years makes him the longest-reigning Emperor of China in history, though it should be noted that having ascended the throne aged 8, he did not exercise much, if any control, over the empire, that role being fulfilled by his 4 guardians and his grandmother the Empress Dowager Xiaozhuang";
        //
    }
    if (QuestionInt == 607){
        ReturnString= @"Ashikaga Shogunate";
        //
        
        AnswerString = @"1336–1573) was a feudal military dictatorship ruled by the shoguns of the Ashikaga family. most of the regional power still remained with the provincial daimyo, and the military power of the shogunate depended largely on their loyalty to the Ashikaga. As the daimyo increasingly feuded among themselves in the pursuit of power, that loyalty grew increasingly strained, until it erupted into open warfare";
        //
    }
    if (QuestionInt == 608){
        ReturnString= @"Onin War";
        //
        
        AnswerString = @"1467-1477 Civil War that entered into Warring States period - mass struggle of Daimyos";
        //
    }
    if (QuestionInt == 609){
        ReturnString= @"Reunification of Japan";
        //
        
        AnswerString = @"The reunification of Japan is accomplished by three strong daimyo who succeed each other: Oda Nobunaga (1543-1582), Toyotomi Hideyoshi (1536-1598), and finally Tokugawa Ieyasu (1542-1616) who establishes the Tokugawa Shogunate, that governs for more than 250 years, following the Battle of Sekigahara in 1600";
        //
    }
    if (QuestionInt == 610){
        ReturnString= @"Oda Nobunaga";
        //
        
        AnswerString = @"Nobunaga lived a life of continuous military conquest, to eventually conquer most of Japan before his untimely death in 1582";
        //
    }
    if (QuestionInt == 611){
        ReturnString= @"Toyotomi Hideyoshi";
        //
        
        AnswerString = @"And brought an end to the Sengoku period. He was also known for his invasion of Korea. He is noted for a number of cultural legacies, including the restriction that only members of the samurai class could bear arms";
        //
    }
    if (QuestionInt == 612){
        ReturnString= @"Delhi Shogunate";
        //
        
        AnswerString = @"Various Afghan dynasties that ruled in India from 1210 to 1526";
        //
    }
    if (QuestionInt == 613){
        ReturnString= @"Babur the Tiger";
        //
        
        AnswerString = @"Founded the Mughal dynasty of India. He was a direct descendant of Timur, and believed himself to be a descendant also of Genghis Khan through his mother";
        //
    }
    if (QuestionInt == 614){
        ReturnString= @"Aurangzeb";
        //
        
        AnswerString = @"ruler of the Mughal Empire from 1658 until 1707. He was and is a very controversial figure in South Asian history, and is considered a tyrant by most Indians, Hindus, Sikhs, and other non-Muslims During his reign many Hindu temples were defaced and destroyed, and many non-Muslims (mostly Hindus) converted (widely believed forcibly) to Islam.";
        //
    }
    if (QuestionInt == 615){
        ReturnString= @"Askia Mohammed";
        //
        
        AnswerString = @"King of the Songhai Empire in the late 15th century. He strengthened his country and made it the largest in West Africa's history. At its peak under Muhammad, the Songhai Empire encompassed the Hausa states as far as Kano (in present-day Nigeria) and much of the territory that had belonged to the Mali Empire in the west. His policies resulted in a rapid expansion of trade with Europe and Asia, the creation of many schools, and made Islam an integral part of the empire";
        //
    }
    if (QuestionInt == 616){
        ReturnString= @"Gold trade in West and Central Africa";
        //
        
        AnswerString = @"Made inland nations rich, relied on slave trade and gold to increase wealth, stunted/slowed industrialization, made African nations dependent, needed to purchase European weapons to expand control of region";
        //
    }
    if (QuestionInt == 617){
        ReturnString= @"Osei Tutu";
        //
        
        AnswerString = @"Leader of loosely run Ashanti confederacy in Africa - of firearms bought from European traders in exchange for gold and slaves he greatly expanded the power of the city-state";
        //
    }
    if (QuestionInt == 618){
        ReturnString= @"Boers";
        //
        
        AnswerString = @"Name given to Dutch immigrants to South Africa, that eventually move inland, come into conflict with Zulus and British who later colonize";
        //
    }
    if (QuestionInt == 619){
        ReturnString= @"Apartheid";
        //
        
        AnswerString = @"Legalized separating of races in South Africa based on color - you're either white, colored or black";
        //
    }
    if (QuestionInt == 620){
        ReturnString= @"Zulu";
        //
        
        AnswerString = @"South African tribe led by Shaka Zulu that united tribes through warfare and then posed threat to Boers and British, one of few instances where non-Europeans able to defeat Europeans in battle";
        //
    }
    if (QuestionInt == 621){
        ReturnString= @"European and Arab domination of the East African-Indian Ocean trade network";
        //
        
        AnswerString = @"Portugal and Islam dominated trade of trees, exotic animals, slaves to Arab world, back to Europe";
        //
    }
    if (QuestionInt == 622){
        ReturnString= @"Atlantic slave trade";
        //
        
        AnswerString = @"Purchase and transport of black Africans into bondage and servitude in the New World. It is sometimes called the Maafa by African Americans, meaning holocaust or great disaster in kiSwahili. The slaves were one element of a three-part economic cycle—the Triangular Trade and its infamous Middle Passage—which ultimately involved four continents, four centuries and the lives and fortunes of millions of people";
        //
    }
    if (QuestionInt == 623){
        ReturnString= @"Sugar production and the slave trade";
        //
        
        AnswerString = @"Labor intensive, dangerous, spurred growth of Atlantic Slave trade to Caribbean/Latin America - numbers kept up through extensive trade, not through reproduction - males primarily brought over - overseers keep order violently, absentee landowners";
        //
    }
    if (QuestionInt == 624){
        ReturnString= @"Hernan Cortes";
        //
        
        AnswerString = @"Defeated Aztecs due to guns, germs, and steel";
        //
    }
    if (QuestionInt == 625){
        ReturnString= @"Francisco Pizarro";
        //
        
        AnswerString = @"Defeated Incas due to guns, germs, and steel and a gullible Montezuma";
        //
    }
    if (QuestionInt == 626){
        ReturnString= @"New Spain";
        //
        
        AnswerString = @"The name given to one of the viceroy-ruled territories of the Spanish Empire from 1525 to 1821 - today it is Central America, plus Mexico, plus Southwest United States";
        //
    }
    if (QuestionInt == 627){
        ReturnString= @"Spanish importation of smallpox and measles";
        //
        
        AnswerString = @"Columbian exchange negative - immunity lacking in indigenous people - led to millions of deaths - huge demographic switch";
        //
    }
    if (QuestionInt == 628){
        ReturnString= @"Bartolome de Las Casas";
        //
        
        AnswerString = @"Demonized role of Spanish and Columbus in treatment of Native Americans";
        //
    }
    if (QuestionInt == 629){
        ReturnString= @"Silver mining";
        //
        
        AnswerString = @"Forever altered world trade - became source of wealth for Portugal/Spain, currency for China, dominated resource of Mexico, extracted minerals from America and sent to Europe";
        //
    }
    if (QuestionInt == 630){
        ReturnString= @"Portuguese sugar production";
        //
        
        AnswerString = @"Portuguese cultivated in Brazil 1532 - surpassed honey as primary sweetener";
        //
    }
    if (QuestionInt == 631){
        ReturnString= @"Peter Stuyvesant";
        //
        
        AnswerString = @"Last Dutch Director-General of the colony of New Netherland from 1647 until it was ceded provisionally to the English in 1664. He was a major figure in the early history of New York City";
        //
    }
    if (QuestionInt == 632){
        ReturnString= @"Jamestown";
        //
        
        AnswerString = @"First British colony in future United States";
        //
    }
    if (QuestionInt == 633){
        ReturnString= @"Plymouth Rock";
        //
        
        AnswerString = @"First British colony in New England - famous Pilgrims - became religious focused w/ semi-theocracy";
        //
    }
    if (QuestionInt == 634){
        ReturnString= @"Massachusetts Bay Colony";
        //
        
        AnswerString = @"First British colony in New England - went on to be Massachusetts - started as joint-stock company";
        //
    }
    if (QuestionInt == 635){
        ReturnString= @"French and Indian Wars";
        //
        
        AnswerString = @"Wars between England and France over land, secession, and power - end up being played out in North America - colonists and British vs. French and Indians - debt from these wars eventually leads to high British taxes which lead to American revolution";
        //
    }
    if (QuestionInt == 636){
        ReturnString= @"Russian-American Company";
        //
        
        AnswerString = @"Russian trading company that had monopoly over trade with Alaska";
        //
    }
    if (QuestionInt == 637){
        ReturnString= @"Absolutism";
        //
        
        AnswerString = @"A political theory that states all power should be held by one ruler";
        //
    }
    if (QuestionInt == 638){
        ReturnString= @"Revolution";
        //
        
        AnswerString = @"The overthrowing of 1 government and the replacement of it, by another";
        //
    }
    if (QuestionInt == 639){
        ReturnString= @"Democracy";
        //
        
        AnswerString = @"Government by people, represented by them or by elected representatives";
        //
    }
    if (QuestionInt == 640){
        ReturnString= @"Mercantilism";
        //
        
        AnswerString = @"The practice of merchants; commercialism";
        //
    }
    if (QuestionInt == 641){
        ReturnString= @"Feudalism";
        //
        
        AnswerString = @"A political and economical system; relation of a vassal and its lord is characterized by homage and protection";
        //
    }
    if (QuestionInt == 642){
        ReturnString= @"Aristocracy";
        //
        
        AnswerString = @"The upper, noble and rich class";
        //
    }
    if (QuestionInt == 643){
        ReturnString= @"Middle class";
        //
        
        AnswerString = @"Between the upper and lower, they often face a stagnant economy, some education";
        //
    }
    if (QuestionInt == 644){
        ReturnString= @"Secular";
        //
        
        AnswerString = @"Not bound by any religious faction";
        //
    }
    if (QuestionInt == 645){
        ReturnString= @"Diplomatic";
        //
        
        AnswerString = @"An arbitrator between 2 or more groups";
        //
    }
    if (QuestionInt == 646){
        ReturnString= @"Conservative backlash";
        //
        
        AnswerString = @"A retaliation from often strict religious groups";
        //
    }
    if (QuestionInt == 647){
        ReturnString= @"Liberalizing elements";
        //
        
        AnswerString = @"Elements needed to free a nation, people";
        //
    }
    if (QuestionInt == 648){
        ReturnString= @"Dmocratizing elements";
        //
        
        AnswerString = @"Elements needed for political freedom";
        //
    }
    if (QuestionInt == 649){
        ReturnString= @"Exploration";
        //
        
        AnswerString = @"The search of new borders and areas";
        //
    }
    if (QuestionInt == 650){
        ReturnString= @"Colonization";
        //
        
        AnswerString = @"The act of acquiring nations for the benefit of the mother nation’s economy";
        //
    }
    if (QuestionInt == 651){
        ReturnString= @"Unprecedented";
        //
        
        AnswerString = @"Lacking previous experience of the sort";
        //
    }
    if (QuestionInt == 652){
        ReturnString= @"Imperialism";
        //
        
        AnswerString = @"A policy of extending a nation’s powers through diplomacy or military practice";
        //
    }
    if (QuestionInt == 653){
        ReturnString= @"Economic exploitation";
        //
        
        AnswerString = @"The misuse, taking advantage of another, often more beneficial economy";
        //
    }
    if (QuestionInt == 654){
        ReturnString= @"Enlightenment";
        //
        
        AnswerString = @"The use of reason to scrutinize humanitarian reforms";
        //
    }
    if (QuestionInt == 655){
        ReturnString= @"Unification";
        //
        
        AnswerString = @"The joining of two or more groups";
        //
    }
    
    if (QuestionInt == 656){
        ReturnString= @"Industrialization";
        //
        
        AnswerString = @"The growing or birth of production";
        //
    }
    
    if (QuestionInt == 657){
        ReturnString= @"Imperialism";
        //
        
        AnswerString = @"A policy of extending a nation’s powers through diplomacy or military practice";
        //
    }
    
    if (QuestionInt == 658){
        ReturnString= @"Western Hemisphere";
        //
        
        AnswerString = @"Often known as Western Europe or USA";
        //
    }
    
    if (QuestionInt == 659){
        ReturnString= @"Nationalism";
        //
        
        AnswerString = @"Devotion to the culture of a nation";
        //
    }
    
    if (QuestionInt == 660){
        ReturnString= @"Eugenics";
        //
        
        AnswerString = @"The study of heredity improvement of the human race controlled by selective breeding";
        //
    }
    
    if (QuestionInt == 661){
        ReturnString= @"Ethnocentrism";
        //
        
        AnswerString = @"Belief in one’s ethnic superiority";
        //
    }
    
    if (QuestionInt == 662){
        ReturnString= @"Social Darwinism";
        //
        
        AnswerString = @"The belief that one achieves more than others by genetic or biological superiority";
        //
    }
    
    if (QuestionInt == 663){
        ReturnString= @"White Man’s Burden/Rudyard Kipling";
        //
        
        AnswerString = @"The belief that god asked Caucasians to enslave or take responsibility of the colored";
        //
    }
    
    if (QuestionInt == 664){
        ReturnString= @"Middle Kingdom";
        //
        
        AnswerString = @"China";
        //
    }
    
    if (QuestionInt == 665){
        ReturnString= @"Communication revolution";
        //
        
        AnswerString = @"A change in the people communicate";
        //
    }
    
    if (QuestionInt == 666){
        ReturnString= @"Urbanization";
        //
        
        AnswerString = @"The change from rural to urban lifestyle";
        //
    }
    
    if (QuestionInt == 667){
        ReturnString= @"Technology";
        //
        
        AnswerString = @"Application of science, for commercial or industrial objectives";
        //
    }
    
    if (QuestionInt == 668){
        ReturnString= @"Manufactured/finished goods";
        //
        
        AnswerString = @"The completion of raw material";
        //
    }
    
    if (QuestionInt == 669){
        ReturnString= @"Raw materials";
        //
        
        AnswerString = @"Unfinished products, at its first stage";
        //
    }
    
    if (QuestionInt == 670){
        ReturnString= @"Atlantic World";
        //
        
        AnswerString = @"The water ways, between continents";
        //
    }
    
    if (QuestionInt == 671){
        ReturnString= @"Plantation system";
        //
        
        AnswerString = @"The use of cotton gins and slaves for production";
        //
    }
    
    if (QuestionInt == 672){
        ReturnString= @"Monroe Doctrine";
        //
        
        AnswerString = @"The proclamation that prevented European nations from colonizing in the Americas";
        //
    }
    
    if (QuestionInt == 673){
        ReturnString= @"Foreign investment";
        //
        
        AnswerString = @"Investing in other countries’ economies";
        //
    }
    
    if (QuestionInt == 674){
        ReturnString= @"Capital";
        //
        
        AnswerString = @"The initial amount of money to start a business";
        //
    }
    
    if (QuestionInt == 675){
        ReturnString= @"Ottoman Empire";
        //
        
        AnswerString = @"Modern Day Turkey";
        //
    }
    
    if (QuestionInt == 676){
        ReturnString= @"Domestic/putting out system";
        //
        
        AnswerString = @"Working on pieces of a product at home and the finalizing and selling them in the marketplace";
        //
    }
    
    if (QuestionInt == 677){
        ReturnString= @"Tanzimat Reforms";
        //
        
        AnswerString = @"Reorganization in the Ottoman Empire";
        //
    }
    
    if (QuestionInt == 678){
        ReturnString= @"Extraterritoriality";
        //
        
        AnswerString = @"Diplomatic jurisdiction, exempted from local jurisdiction";
        //
    }
    
    if (QuestionInt == 679){
        ReturnString= @"Suez Canal";
        //
        
        AnswerString = @"Canal invested in by the US, located in Panama";
        //
    }
    
    if (QuestionInt == 680){
        ReturnString= @"Qing China";
        //
        
        AnswerString = @"The last Chinese dynasty";
        //
    }
    
    if (QuestionInt == 681){
        ReturnString= @"Opium War";
        //
        
        AnswerString = @"The war that led Western imperialism in China";
        //
    }
    
    if (QuestionInt == 682){
        ReturnString= @"Opium Trade";
        //
        
        AnswerString = @"The trade of illegal narcotics in China";
        //
    }
    
    if (QuestionInt == 683){
        ReturnString= @"Serfdom";
        //
        
        AnswerString = @"A person in bondage or servitude";
        //
    }
    
    if (QuestionInt == 684){
        ReturnString= @"Commodore Perry";
        //
        
        AnswerString = @"US Commodore who defeated British on Lake Erie";
        //
    }
    
    if (QuestionInt == 685){
        ReturnString= @"Trans-Atlantic Slave Trade";
        //
        
        AnswerString = @"The triangular slave trade- from Africa to Caribbean and then the Americas";
        //
    }
    
    if (QuestionInt == 686){
        ReturnString= @"Mass production";
        //
        
        AnswerString = @"The generating of produce in vast quantities";
        //
    }
    
    if (QuestionInt == 687){
        ReturnString= @"Capitalism";
        //
        
        AnswerString = @"Capitalism is an evolving concept, which is derived from earlier European economic practices (Feudalism, Imperialism, Mercantilism). Capitalism is widely considered to be the dominant economic system in the world. There is continuing debate over the definition, nature, and scope of this system.";
        //
    }
    
    if (QuestionInt == 688){
        ReturnString= @"Enclosure movement";
        //
        
        AnswerString = @"During the Industrial Revolution, it was the consolidation of many small farms into one large farm, which created a labor force as many people lost their homes";
        //
    }
    
    if (QuestionInt == 689){
        ReturnString= @"Second Agricultural Revolution";
        //
        
        AnswerString = @"A period of technological change from the 1600s to mid-1900s beginning in Western Europe, beginning with preindustrial improvements like crop rotation and better horse collars, and concluding with industrial innovations to replace human labor with machines and to supplement natural fertilizers and pesticides with chemical ones.";
        //
    }
    
    if (QuestionInt == 690){
        ReturnString= @"Steam power";
        //
        
        AnswerString = @"Steam engine is a heat engine that makes use of the thermal energy that exists in steam, converting it to mechanical work. Steam engines were used in pumps, locomotive trains and steam ships, and was essential to the Industrial Revolution. They are still used for electrical power generation using a steam turbine";
        //
    }
    
    if (QuestionInt == 691){
        ReturnString= @"Spinning Jenny";
        //
        
        AnswerString = @"The spinning jenny is a multi-spool spinning wheel. It was invented circa 1764 by James Hargreaves in Stanhill, near Blackburn, in Lancashire in the north west of England. The device dramatically reduced the amount of work needed to produce yarn, with a single worker able to work eight or more spools at once.";
        //
    }
    
    if (QuestionInt == 692){
        ReturnString= @"Protestant work ethic";
        //
        
        AnswerString = @"A value system that stresses the moral value of work, self-discipline, and individual responsibility as the means to improving one's economic well being; important in the industrial revolution because of its stress in hard work, etc.";
        //
    }
    
    if (QuestionInt == 693){
        ReturnString= @"Wealth of Nations/Adam Smith";
        //
        
        AnswerString = @"Considered the founding father of economics, Adam Smith wrote The Wealth of Nations, published in 1776. His most famous concept was that markets guide economic activity and act like an ""invisible hand"" - allocating resources through prices, which rise when there is a shortage of a commodity and fall when it is plentiful.";
        //
    }
    
    if (QuestionInt == 694){
        ReturnString= @"Laissez faire capitalism";
        //
        
        AnswerString = @"Laissez-faire is short for ""laissez-faire, laissez-passer,"" a French phrase meaning idiomatically ""leave to do, leave to pass"" or more accurately ""let things alone, let them pass"". First used by the eighteenth century Physiocrats as an injunction against government interference with trade, it is now used as a synonym for strict free market economics. Laissez-faire economic policy is in direct contrast to statistic economic policy.";
        //
    }
    
    if (QuestionInt == 695){
        ReturnString= @"Bessemer Process";
        //
        
        AnswerString = @"Process of rendering cast iron malleable by the introduction of air into the fluid metal to remove carbon. This was the first process for mass-producing steel inexpensively.";
        //
    }
    
    if (QuestionInt == 696){
        ReturnString= @"Factory system";
        //
        
        AnswerString = @"The factory system was a method of manufacturing adopted in England during the Industrial Revolution. Workers would come to work in a city factory, often making low-quality goods in mass amounts. The method prior to the introduction of factories was the domestic system. The result of the factory system was that the quality of goods declined. Since factories were based in large cities, people from rural areas moved into the city to get work.";
        //
    }
    
    if (QuestionInt == 697){
        ReturnString= @"Interchangeable parts";
        //
        
        AnswerString = @"Important for the industrial revolution because it signified the ability to change parts of products comparatively easier than before";
        //
    }
    
    if (QuestionInt == 698){
        ReturnString= @"Assembly Line";
        //
        
        AnswerString = @"An assembly line is a manufacturing process in which interchangeable parts are added to a product in a sequential manner to create an end product.";
        //
    }
    
    if (QuestionInt == 699){
        ReturnString= @"Transportation revolution";
        //
        
        AnswerString = @"A term often used by historians to describe the dramatic improvement in transportation in the West that took place in the early 1800s. The Transportation Revolution included greatly improved roads, the development of canals, and the invention of the steamboat and railroad. Shipping costs were lowered as much as 90 percent in this era, which gave a big boost to trade and the settlement of new areas of land.";
        //
    }
    
    if (QuestionInt == 700){
        ReturnString= @"Proletariat";
        //
        
        AnswerString = @"New class of factory workers that emerged as a result of the industrial revolution";
        //
    }
    
    if (QuestionInt == 701){
        ReturnString= @"Reform movements";
        //
        
        AnswerString = @"Movements that occurred, often, at the end of the industrial revolution, such as the feminist and labor union movements";
        //
    }
    
    if (QuestionInt == 702){
        ReturnString= @"Labor unions";
        //
        
        AnswerString = @"A union is a group of workers who act collectively to address common issues; emerged at the end of the IR";
        //
    }
    
    if (QuestionInt == 703){
        ReturnString= @"Communist Manifesto/Karl Marx";
        //
        
        AnswerString = @"Document relating proletariat with the IR, proletariat should overthrow bourgeoisie - roots of communism";
        //
    }
    
    if (QuestionInt == 704){
        ReturnString= @"Ladies";
        //
        
        AnswerString = @"Workers in Britain (1810–1820) who responded to replacement of human labor by machines during the Industrial Revolution by attempting to destroy the machines; named after a mythical leader, Ned Ludd.";
        //
    }
    
    if (QuestionInt == 705){
        ReturnString= @"United States Civil War";
        //
        
        AnswerString = @"1861-1865 - First modern war using industrial revolution, ironclad ships, new technology, massive deaths";
        //
    }
    
    if (QuestionInt == 706){
        ReturnString= @"Monoculture";
        //
        
        AnswerString = @"Agriculture based on only one crop; resulted in many European colonies in the 1800-1900 because of mercantilism";
        //
    }
    
    if (QuestionInt == 707){
        ReturnString= @"“Banana Republic”";
        //
        
        AnswerString = @"A small country (especially in Central America) that is politically unstable and whose economy is dominated monoculture because of European mercantilism";
        //
    }
    
    if (QuestionInt == 708){
        ReturnString= @"Popular consumption";
        //
        
        AnswerString = @"Goods that are consumed by a large percentage of the population around the IR, such as textiles";
        //
    }
    
    if (QuestionInt == 709){
        ReturnString= @"Entrepreneurship";
        //
        
        AnswerString = @"Significant to the IR because entrepreneurs are who help begin the IR";
        //
    }
    
    if (QuestionInt == 710){
        ReturnString= @"Partial modernization";
        //
        
        AnswerString = @"Industrialization but only to a certain extent; see Samuel Hungtinton’s Clash of Civilizations (good book…)";
        //
    }
    
    if (QuestionInt == 711){
        ReturnString= @"Meiji Restoration";
        //
        
        AnswerString = @"The Meiji Restoration also known as the Meiji Ishin, Revolution or Renewal, was a chain of events that led to a change in Japan's political and social structure. It occurred from 1866 to 1869, a period of 4 years that transverses both the late Edo (often called Late Tokugawa shogunate) and beginning of the Meiji Era. Probably the most important foreign account of the events of 1862-69 is contained in A Diplomat in Japan by Sir Ernest Satow.";
        //
    }
    
    if (QuestionInt == 712){
        ReturnString= @"Zaibatsu";
        //
        
        AnswerString = @"Huge industrial combines created in Japan in the 1890s as part of the process of industrialization";
        //
    }
    
    if (QuestionInt == 713){
        ReturnString= @"Textile mills";
        //
        
        AnswerString = @"A factory for making textiles, one of the 1st major industries during the IR";
        //
    }
    
    if (QuestionInt == 714){
        ReturnString= @"Class tension";
        //
        
        AnswerString = @"Tension between classes during the IR due to income gap, social treatment, etc.";
        //
    }
    
    if (QuestionInt == 715){
        ReturnString= @"Suffrage";
        //
        
        AnswerString = @"Voting rights; suffrage movement; universal suffrage";
        //
    }
    
    if (QuestionInt == 716){
        ReturnString= @"Traditional family life";
        //
        
        AnswerString = @"Involved a larger family with many children for agricultural work, etc.";
        //
    }
    
    if (QuestionInt == 717){
        ReturnString= @"Cotton gin/Eli Whitney";
        //
        
        AnswerString = @"The cotton gin is a machine invented in 1793 invented by American Eli Whitney (granted a patent on March 14, 1794) to mechanize the production of cotton fiber. Led to increase of Atlantic Slave Trade";
        //
    }
    
    if (QuestionInt == 718){
        ReturnString= @"Muckrakers";
        //
        
        AnswerString = @"A muckraker is a journalist, author or filmmaker who investigates and exposes societal issues such as political corruption, corporate crime, child labor, conditions in slums and prisons, unsanitary conditions in food processing plants, fraudulent claims by manufacturers of patent medicines and similar topics.";
        //
    }
    
    if (QuestionInt == 719){
        ReturnString= @"Settlement Houses";
        //
        
        AnswerString = @"Neighborhood centers in urban areas that provided literacy, classes, daycare, entertainment - like a YMCA";
        //
    }
    
    if (QuestionInt == 720){
        ReturnString= @"Women’s Emancipation movements";
        //
        
        AnswerString = @"Movements for greater female rights; referred to as feminist movement";
        //
    }
    
    if (QuestionInt == 721){
        ReturnString= @"Push factors";
        //
        
        AnswerString = @"Conditions in a location or region that encourage people to migrate from it";
        //
    }
    
    if (QuestionInt == 722){
        ReturnString= @"Pull factors";
        //
        
        AnswerString = @"Attract or pull an organization towards a new location, eg the availability of cheap skilled labor.";
        //
    }
    
    if (QuestionInt == 723){
        ReturnString= @"Settler colonies";
        //
        
        AnswerString = @"Colonies with, you guessed it, settlers";
        //
    }
    
    if (QuestionInt == 724){
        ReturnString= @"Pogroms";
        //
        
        AnswerString = @"A pogrom (from Russian: ""погром"" (meaning ""wreaking of havoc"") is a massive violent attack on a particular ethnic or religious group with simultaneous destruction of their environment (homes, businesses, religious centers). The term has historically been used to denote massive acts of violence, either spontaneous or premeditated, against Jews, but has been applied to similar incidents against other minority groups.";
        //
    }
    
    if (QuestionInt == 725){
        ReturnString= @"Islamic slave trade";
        //
        
        AnswerString = @"Continued slave trade on the west coast of Africa";
        //
    }
    
    if (QuestionInt == 726){
        ReturnString= @"Liberia";
        //
        
        AnswerString = @"Country founded by freed American slaves";
        //
    }
    
    if (QuestionInt == 727){
        ReturnString= @"Life expectancy rates";
        //
        
        AnswerString = @"Expected age until death - improved due to improved health care, brief drop at beginning of Industrial Revolution due to living conditions,";
        //
    }
    
    if (QuestionInt == 728){
        ReturnString= @"Infant mortality rates";
        //
        
        AnswerString = @"Number of babies per 1000 who die at birth";
        //
    }
    
    if (QuestionInt == 729){
        ReturnString= @"Birth rates";
        //
        
        AnswerString = @"Number of births eventually drops again as middle class has less need for many kids";
        //
    }
    
    if (QuestionInt == 730){
        ReturnString= @"Louis Pasteur";
        //
        
        AnswerString = @"Creator of germ theory and pasteurization - led to improved health";
        //
    }
    
    if (QuestionInt == 731){
        ReturnString= @"Sweet potato";
        //
        
        AnswerString = @"Important NA starch in China";
        //
    }
    
    if (QuestionInt == 732){
        ReturnString= @"Finished goods";
        //
        
        AnswerString = @"Manufactured goods";
        //
    }
    
    if (QuestionInt == 733){
        ReturnString= @"Air pollution";
        //
        
        AnswerString = @"Pollution in the air; from coal";
        //
    }
    
    if (QuestionInt == 734){
        ReturnString= @"Water pollution";
        //
        
        AnswerString = @"Pollution in the water; from poor sanitation";
        //
    }
    
    if (QuestionInt == 735){
        ReturnString= @"Cholera/tuberculosis";
        //
        
        AnswerString = @"Various diseases that spread through urban eras during the IR";
        //
    }
    
    if (QuestionInt == 736){
        ReturnString= @"Upper class women";
        //
        
        AnswerString = @"Affluent women with absolutely no lives; led the women’s rights movements at the end of the IR";
        //
    }
    
    if (QuestionInt == 737){
        ReturnString= @"Victorian Age";
        //
        
        AnswerString = @"The era of Britain’s industrial revolution and Queen Victoria’s reign  from 1837 to 1901";
        //
    }
    
    if (QuestionInt == 738){
        ReturnString= @"Social mobility";
        //
        
        AnswerString = @"The ability of an individual to change his/her social status";
        //
    }
    if (QuestionInt == 739){
        ReturnString= @"Abolitionists";
        //
        
        AnswerString = @"Supporters of ending slavery";
        //
    }
    
    if (QuestionInt == 740){
        ReturnString= @"Emancipation of Russian serfs";
        //
        
        AnswerString = @"Edict issued in 1861 by Alexander II";
        //
    }
    
    if (QuestionInt == 741){
        ReturnString= @"Cult of domesticity";
        //
        
        AnswerString = @"American view that preached women’s role was in the house  taking care of the children  ";
        //
    }
    
    if (QuestionInt == 742){
        ReturnString= @"Temperance";
        //
        
        AnswerString = @"A movement to moderate and lessen alcohol consumption";
        //
    }
    
    if (QuestionInt == 743){
        ReturnString= @"Constitutional monarchy";
        //
        
        AnswerString = @"A monarchy whose power is defined and limited by a  constitution (defines monarch as head of state)";
        //
    }
    
    if (QuestionInt == 744){
        ReturnString= @"John Locke";
        //
        
        AnswerString = @"English philosopher who argued that the government’s power came  from the people and that revolution against tyrants was acceptable";
        //
    }
    
    if (QuestionInt == 745){
        ReturnString= @"Social contract";
        //
        
        AnswerString = @"An agreement between a state and its citizens to define the state’s  powers and the citizen’s rights";
        //
    }
    
    if (QuestionInt == 746){
        ReturnString= @"Seven Years War";
        //
        
        AnswerString = @"Global war between France and Britain from 1756 to 1763";
        //
    }
    
    if (QuestionInt == 747){
        ReturnString= @"“Taxation without representation”";
        //
        
        AnswerString = @"Taxes were levied on American colonies, but  they were not represented in Britain’s parliament";
        //
    }
    
    if (QuestionInt == 748){
        ReturnString= @"Common Sense/Thomas Paine";
        //
        
        AnswerString = @"Writing by American revolutionary that advocated  separation from Britain and republican government";
        //
    }
    
    if (QuestionInt == 749){
        ReturnString= @"Declaration of Independence/Thomas Jefferson";
        //
        
        AnswerString = @"Document outlying America’s  separation from Britain and the reasons why, written by American political and revolutionary leader";
        //
    }
    
    if (QuestionInt == 750){
        ReturnString= @"Causes of French Revolution";
        //
        
        AnswerString = @"Absolute monarchy abuses power, policies of Louis  XVI, economic troubles, war debts, and droughts";
        //
    }
    
    if (QuestionInt == 751){
        ReturnString= @"First/Second/Third Estate";
        //
        
        AnswerString = @"Nobility, clergy, everybody else";
        //
    }
    
    if (QuestionInt == 752){
        ReturnString= @"National Assembly";
        //
        
        AnswerString = @"France’s representative body";
        //
    }
    
    if (QuestionInt == 753){
        ReturnString= @"Declaration of the Rights of Man";
        //
        
        AnswerString = @"French revolutionary document that outlined  the rights of the people";
        //
    }
    
    if (QuestionInt == 754){
        ReturnString= @"Reign of Terror";
        //
        
        AnswerString = @"The period where the monarchy and aristocracy were targeted  along with opponents of the French Revolution";
        //
    }
    
    if (QuestionInt == 755){
        ReturnString= @"Directory";
        //
        
        AnswerString = @"The government of revolutionary France from 1795 to 1799";
        //
    }
    
    if (QuestionInt == 756){
        ReturnString= @"Cycle of Revolution";
        //
        
        AnswerString = @"Calls for change from monarchy followed by moderate  government followed by radical government followed by moderate government  followed by monarchy";
        //
    }
    
    if (QuestionInt == 757){
        ReturnString= @"Universal manhood suffrage";
        //
        
        AnswerString = @"Voting rights extended without discrimination";
        //
    }
    
    if (QuestionInt == 758){
        ReturnString= @"Nationalistic uprisings";
        //
        
        AnswerString = @"Independence movements based on loyalty to free states ";
        //
    }
    
    if (QuestionInt == 759){
        ReturnString= @"Guerilla warfare";
        //
        
        AnswerString = @"Unorganized warfare using hit and run tactics  ";
        //
    }
    
    if (QuestionInt == 760){
        ReturnString= @"Napoleon";
        //
        
        AnswerString = @"Absolute leader of France who conquered most of Europe and was  defeated in 1815";
        //
    }
    
    if (QuestionInt == 761){
        ReturnString= @"Congress of Vienna";
        //
        
        AnswerString = @"European meeting after Napoleon’s defeat to try and restore  political stability and settle diplomatic disputes";
        //
    }
    
    if (QuestionInt == 762){
        ReturnString= @"Congress System/Metternich";
        //
        
        AnswerString = @"Austrian diplomat at the Congress of Vienna - system of Europe working together";
        //
    }
    
    if (QuestionInt == 763){
        ReturnString= @"Spirit of conservatism";
        //
        
        AnswerString = @"After era of revolution attempt by European diplomats to return order to the good ol' days when autocracy ruled and people stopped rebelling";
        //
    }
    
    if (QuestionInt == 764){
        ReturnString= @"Radicalism";
        //
        
        AnswerString = @"Democratic movement that called for liberalism and extended rights";
        //
    }
    
    if (QuestionInt == 765){
        ReturnString= @"Parliamentary system";
        //
        
        AnswerString = @"Representative government led by a prime minister";
        //
    }
    
    if (QuestionInt == 766){
        ReturnString= @"Militaristic";
        //
        
        AnswerString = @"Aggressive war based ideology";
        //
    }
    
    if (QuestionInt == 767){
        ReturnString= @"Revolution of 1848";
        //
        
        AnswerString = @"Causes – bad harvests, economic stagnation, reaction against  conservative rule, negative social and economic effects of the Industrial  Revolution, and nationalism";
        //
    }
    
    if (QuestionInt == 768){
        ReturnString= @"Revolution of 1848";
        //
        
        AnswerString = @"Effects – forced King of Prussia to grant constitutional reforms,  highlighted power of nationalism, unified Germany and Italy, political, social, and  economic issues of the people have to be met";
        //
    }
    
    if (QuestionInt == 769){
        ReturnString= @"Toussaint L’Ouverture";
        //
        
        AnswerString = @"A leader of the Haitian revolt against France";
        //
    }
    
    if (QuestionInt == 770){
        ReturnString= @"Louisiana Territory";
        //
        
        AnswerString = @"French territory in the United States";
        //
    }
    
    if (QuestionInt == 771){
        ReturnString= @"Latin America Wars of Independence";
        //
        
        AnswerString = @"Causes -  growing sense of nationalism,  colonial economic policies, social class system, Napoleon";
        //
    }
    
    if (QuestionInt == 772){
        ReturnString= @"Caudillos";
        //
        
        AnswerString = @"Military juntas or governments - military men that take over power - sets precedent";
        //
    }
    
    if (QuestionInt == 773){
        ReturnString= @"Economic backwardness";
        //
        
        AnswerString = @"Latin America – caused by mercantilism and monoculture  system ";
        //
    }
    
    if (QuestionInt == 774){
        ReturnString= @"Miguel Hidalgo";
        //
        
        AnswerString = @"Creole priest in Mexico who led rebellion against Spain  ";
        //
    }
    
    if (QuestionInt == 775){
        ReturnString= @"Pancho Villa";
        //
        
        AnswerString = @"Mexican revolutionary who fought in the revolution from 1910 to  1917";
        //
    }
    
    if (QuestionInt == 776){
        ReturnString= @"Sino-Japanese War";
        //
        
        AnswerString = @"War fought between China and Japan over Korea from 1894 to  1895";
        //
    }
    
    if (QuestionInt == 777){
        ReturnString= @"Empress Cixi";
        //
        
        AnswerString = @"Disastrous Chinese monarch whose policies led to economic  stagnation and China’s decline ";
        //
    }
    
    if (QuestionInt == 778){
        ReturnString= @"“Hundred Days Reform”";
        //
        
        AnswerString = @"103 days of social and institutional reform in 1898  launched by the Qing emperor of China, Guangxu";
        //
    }
    
    if (QuestionInt == 779){
        ReturnString= @"Abdication of Manchu Emperor";
        //
        
        AnswerString = @"Emperor abdicates in 1912 - ends foreign rule - Mandate of Heaven dynasties";
        //
    }
    
    if (QuestionInt == 780){
        ReturnString= @"Sun Yat-sen";
        //
        
        AnswerString = @"Father of modern china and institutes constitutional democracy ";
        //
    }
    
    if (QuestionInt == 781){
        ReturnString= @"People’s Principles";
        //
        
        AnswerString = @"Nationalism, democracy, people’s livelihood ";
        //
    }
    
    if (QuestionInt == 782){
        ReturnString= @"Nationalist Party";
        //
        
        AnswerString = @"Kuomintang – Chinese political party that favored republican  government";
        //
    }
    
    if (QuestionInt == 783){
        ReturnString= @"Chiang Kai-shek";
        //
        
        AnswerString = @"Leader of the Kuomintang and founder of the Republic of China ";
        //
    }
    
    if (QuestionInt == 784){
        ReturnString= @"Simon Bolivar";
        //
        
        AnswerString = @"Creole military leader who fought for Colombian independence  between 1817 and 1822";
        //
    }
    
    if (QuestionInt == 785){
        ReturnString= @"Jose de San Martin";
        //
        
        AnswerString = @"Leader of independence movement in Rio de la Plata; successful  in 1816";
        //
    }
    
    if (QuestionInt == 786){
        ReturnString= @"King John VI";
        //
        
        AnswerString = @"Portuguese King who ruled in Brazil from 1808 to 1820 because of  Napoleon’s invasion ";
        //
    }
    
    if (QuestionInt == 787){
        ReturnString= @"Nothing";
        //
        
        AnswerString = @"Nothing";
        //
    }
    
    if (QuestionInt == 788){
        ReturnString= @"King Pedro/Pedro II";
        //
        
        AnswerString = @"Portuguese king John VI flees to Brazil, Portuguese government from Brazil. John leaves and leaves his son, Pedro, Pedro lives entire life in Brazil and declares independence for brazil and becomes emperor. Pedro gives power to Pedro II rules for most of 19th century. Stable monarchy";
        //
    }
    
    if (QuestionInt == 789){
        ReturnString= @"Catholic Church in Latin America";
        //
        
        AnswerString = @"Very powerful in Latin America. One of the largest land owners in Latin America - lobbies to keep conservative rule, economic/social/political interest";
        //
    }
    
    if (QuestionInt == 790){
        ReturnString= @"Russification";
        //
        
        AnswerString = @"All Russians had to learn Russian language and convert to orthodoxy, anyone who didn’t’ was persecuted, Jews.";
        //
    }
    
    if (QuestionInt == 791){
        ReturnString= @"Czar Nicholas II";
        //
        
        AnswerString = @"Doesn’t reacto to revolution, socialists organize, tried to rally Russians around the falg but lost against Japanese";
        //
    }
    
    if (QuestionInt == 792){
        ReturnString= @"Duma";
        //
        
        AnswerString = @"Something like parliament but has no real power, every time they tried to make change, czar disbands them.";
        //
    }
    
    if (QuestionInt == 793){
        ReturnString= @"Indian National Congress";
        //
        
        AnswerString = @"English speaking, educated upper class, most influential is Mohandas K. Gandhi-1869";
        //
    }
    
    if (QuestionInt == 794){
        ReturnString= @"Mohandas Gandhi";
        //
        
        AnswerString = @"Lived in S. Africa from 1893-1915, defended rights of Indian living under apartheid(areas that has racism), and returned to India as a central figure in freedom movement, nonviolent resistance.";
        //
    }
    
    if (QuestionInt == 795){
        ReturnString= @"Creoles";
        //
        
        AnswerString = @"European born Foreign";
        //
    }
    
    if (QuestionInt == 796){
        ReturnString= @"Mestizos";
        //
        
        AnswerString = @"Indigenous and European mixed";
        //
    }
    
    if (QuestionInt == 797){
        ReturnString= @"Mulattoes";
        //
        
        AnswerString = @"Mixed European and black";
        //
    }
    
    if (QuestionInt == 798){
        ReturnString= @"Marxism";
        //
        
        AnswerString = @"More radical socialism (economic competition is inherently unfair and leads to injustice/ inequality)";
        //
    }
    
    if (QuestionInt == 799){
        ReturnString= @"Liberalism";
        //
        
        AnswerString = @"Willing to respect or accept behavior or opinions different from one’s own. Open to new ideas.";
        //
    }
    
    if (QuestionInt == 800){
        ReturnString= @"Conservatism";
        //
        
        AnswerString = @"Not changing or innovating, holding on to traditional values.";
        //
    }
    
    if (QuestionInt == 801){
        ReturnString= @"Anarchism";
        //
        
        AnswerString = @"Abolition of all government the organization of society on a voluntary, cooperative basis without recourse to force or compulsion.";
        //
    }
    
    if (QuestionInt == 802){
        ReturnString= @"Victor Emmanuel II";
        //
        
        AnswerString = @"King of Sardinia + Count Camillo Cavour, push nationalism, towards the unification of Italy.";
        //
    }
    
    if (QuestionInt == 803){
        ReturnString= @"Giuseppi Garibaldi";
        //
        
        AnswerString = @"Italian nationalist kicks out Spain.";
        //
    }
    
    if (QuestionInt == 804){
        ReturnString= @"Otto von Bismarck";
        //
        
        AnswerString = @"Prime minister of Germany, build the military. Consolidating the region under Prussia’s authority.";
        //
    }
    
    if (QuestionInt == 805){
        ReturnString= @"King William II-";
        //
        
        AnswerString = @"Emperor of the German Empire";
        //
    }
    
    if (QuestionInt == 806){
        ReturnString= @"First/Second Reich";
        //
        
        AnswerString = @"First Reich “Holy Roman Empire”, second Reich “second empire”";
        //
    }
    
    if (QuestionInt == 807){
        ReturnString= @"Irish home rule";
        //
        
        AnswerString = @"Should North, Split Catholic/ Protestant remain British or Irish, Should Ireland be set free.";
        //
    }
    
    if (QuestionInt == 808){
        ReturnString= @"Second and Third Reform Acts";
        //
        
        AnswerString = @"1867/1885 – universal suffrage";
        //
    }
    if (QuestionInt == 809){
        ReturnString= @"Fourth Republic";
        //
        
        AnswerString = @"France becomes democratic republic- universal suffrage.";
        //
    }
    
    if (QuestionInt == 810){
        ReturnString= @"Dreyfus Affair";
        //
        
        AnswerString = @"Jewish officer accused of selling secrets to Germ";
        //
    }
    
    if (QuestionInt == 811){
        ReturnString= @"Augsleich";
        //
        
        AnswerString = @"“compromise” – becomes Austria-Hungary";
        //
    }
    
    if (QuestionInt == 812){
        ReturnString= @"Crimean War";
        //
        
        AnswerString = @"1853-1856, Tsar Alexandar II forced to implement liberal reforms, Modernize Russia, Emancipation of serfs in 1861, lightened censorship, widened powers of local govt, 1881, Alexander II assassinated";
        //
    }
    
    if (QuestionInt == 813){
        ReturnString= @"Tokugawa Shogunate";
        //
        
        AnswerString = @"Seized control in 1600s, authority with emperoer, reality with shogunate, Samurai top, centralized Japan. Warring states to peaceful country. ";
        //
    }
    
    if (QuestionInt == 814){
        ReturnString= @"Samurai";
        //
        
        AnswerString = @"Warrior class, top during Shogunate";
        //
    }
    
    if (QuestionInt == 815){
        ReturnString= @"Stratified society";
        //
        
        AnswerString = @"No chance for social mobility.";
        //
    }
    
    if (QuestionInt == 816){
        ReturnString= @"Meiji Restoration";
        //
        
        AnswerString = @"Japan’s Modern age, Embrace West to survive/ compete.";
        //
    }
    
    if (QuestionInt == 817){
        ReturnString= @"Hereditary privileges-";
        //
        
        AnswerString = @"No more, abolishes feudalism. Meritocracy.";
        //
    }
    
    if (QuestionInt == 818){
        ReturnString= @"Constitution of 1890";
        //
        
        AnswerString = @"Elected parliament, Diet - Japan";
        //
    }
    
    if (QuestionInt == 819){
        ReturnString= @"Diet";
        //
        
        AnswerString = @"Had no real power, hardly representative, Emperor still ahd power.";
        //
    }
    
    if (QuestionInt == 820){
        ReturnString= @"Social hierarchy";
        //
        
        AnswerString = @"During Tokugaw social hierarchy ended, based on merit, civil service exam.";
        //
    }
    
    if (QuestionInt == 821){
        ReturnString= @"Mary Wolstonecraft";
        //
        
        AnswerString = @"English writer, vindication of rights of women- 1792 (Equal rights, education, political, economic pursuits)";
        //
    }
    
    if (QuestionInt == 822){
        ReturnString= @"“Women Question”";
        //
        
        AnswerString = @"What is their sphere and role.";
        //
    }
    
    if (QuestionInt == 823){
        ReturnString= @"“cult of true womanhood”";
        //
        
        AnswerString = @"Virutes of submissiveness, piety, domesticity, modesty, feminity.";
        //
    }
    
    if (QuestionInt == 824){
        ReturnString= @"Early phases of feminist reform";
        //
        
        AnswerString = @"Reform family/ divorce law, own property/ divorce, teaching and nursing (women’s sphere)";
        //
    }
    
    if (QuestionInt == 825){
        ReturnString= @"Later phases of feminist reform";
        //
        
        AnswerString = @"Pushed for suffrage led by upper class women. ";
        //
    }
    
    if (QuestionInt == 826){
        ReturnString= @"“Dismal science”";
        //
        
        AnswerString = @"Negative views of capitalism.";
        //
    }
    
    if (QuestionInt == 827){
        ReturnString= @"Essay on Population/Thomas Malthus";
        //
        
        AnswerString = @"Population growth led to poverty, war diseases, starvation needed to control population.";
        //
    }
    
    if (QuestionInt == 828){
        ReturnString= @"Iron Law of Wages/David Ricardo";
        //
        
        AnswerString = @"Employer will pay lowest possible wage to make money. Supply of labor goes up then salaries will drop.";
        //
    }
    
    if (QuestionInt == 829){
        ReturnString= @"Socialism";
        //
        
        AnswerString = @"Economic competition is inherently unfair and leads to injustice/inequality";
        //
    }
    
    if (QuestionInt == 830){
        ReturnString= @"Communism";
        //
        
        AnswerString = @"Ideally – perfect justice, social equality and plenty";
        //
    }
    
    if (QuestionInt == 831){
        ReturnString= @"Eastern Question";
        //
        
        AnswerString = @"Gradual decline of the Ottoman Empire presented Europe with choices";
        //
    }
    
    if (QuestionInt == 832){
        ReturnString= @"“Sick man of Europe”";
        //
        
        AnswerString = @"Ottoman Empire - falling apart, but better than chaos";
        //
    }
    
    if (QuestionInt == 833){
        ReturnString= @"Literacy rates";
        //
        
        AnswerString = @"Greater access to public education increased through 1800s, Literacy rates rose.";
        //
    }
    
    if (QuestionInt == 834){
        ReturnString= @"Fridrich Nietzche";
        //
        
        AnswerString = @"“God is Dead”, All systems of morality valueless in the materialistic modern age.";
        //
    }
    
    if (QuestionInt == 835){
        ReturnString= @"Romanticism";
        //
        
        AnswerString = @"Most important – emotion/passion, more self expression, Self-realization of the individual, heroism, love of the natural world";
        //
    }
    
    if (QuestionInt == 836){
        ReturnString= @"Realism";
        //
        
        AnswerString = @"Rejected Romanticism’s idealized dramatic outlook, critical view of life. Details of everyday existence, poverty, social hypocrisy, class injustice.";
        //
    }
    
    if (QuestionInt == 837){
        ReturnString= @"Cecil Rhodes- Britain/Africa";
        //
        
        AnswerString = @"“I contend that we are the finest race in the world, and the more of it we inhabit, the better it is.”";
        //
    }
    
    if (QuestionInt == 838){
        ReturnString= @"Economic imperialism";
        //
        
        AnswerString = @"Practice of promoting the economy of one nation in another. It is usually the case that the former is a large economically or militarily powerful nation and the latter is a smaller and less developed.";
        //
    }
    
    if (QuestionInt == 839){
        ReturnString= @"La mission civilisatrice";
        //
        
        AnswerString = @"1867/1885 – universal suffrage";
        //
    }
    
    if (QuestionInt == 840){
        ReturnString= @"British East India Company";
        //
        
        AnswerString = @"A joint-stock company of investors with the intent to favor trade privileges in India. Eventually transformed from a commercial trading venture to one which virtually ruled India.";
        //
    }
    
    if (QuestionInt == 841){
        ReturnString= @"“Sun never sets on the British empire”";
        //
        
        AnswerString = @"A phrase that emerged in response to the British dominance during the Modern Era. Britain was the first nation to industrialize and thus, was able to gain an advantage over all other competing nations.";
        //
    }
    
    if (QuestionInt == 842){
        ReturnString= @"Sepoy Mutiny";
        //
        
        AnswerString = @"May 10th 1857. Sepoys, trained Indians as British soldiers were angered by the rumors that their rifle ammos were greased with lard and beef fat. Thus, they mutinied. The mutiny was harshly crushed by the British.";
        //
    }
    
    if (QuestionInt == 843){
        ReturnString= @"Zamindars";
        //
        
        AnswerString = @"Was employed by the Mughals to collect taxes from peasants";
        //
    }
    
    if (QuestionInt == 844){
        ReturnString= @"Infrastructure";
        //
        
        AnswerString = @"The basic facilities, services, and installations needed for the functioning of a community or society, such as transportation and communications systems, water and power lines, and public institutions including schools, post offices, and prisons.";
        //
    }
    
    if (QuestionInt == 845){
        ReturnString= @"Civil service exam";
        //
        
        AnswerString = @"Exam all Chinese government official-to-be’s had to go through in order to prove themselves. Very rigorous, although once you passed, instant success was guaranteed.";
        //
    }
    
    if (QuestionInt == 846){
        ReturnString= @"Sati";
        //
        
        AnswerString = @"Funeral custom in which the widow immolated herself on her husband’s funeral pyre.";
        //
    }
    
    if (QuestionInt == 847){
        ReturnString= @"Thuggee";
        //
        
        AnswerString = @"The practice of robbery and assassination practiced by the Thugs.";
        //
    }
    
    if (QuestionInt == 848){
        ReturnString= @"Sectarian strife";
        //
        
        AnswerString = @"Violent conflict between Muslims and Coptic Christians in Egypt.";
        //
    }
    
    if (QuestionInt == 849){
        ReturnString= @"Dutch East India Company";
        //
        
        AnswerString = @"Was established on March 20, 1602, when the Estates-General of the Netherlands granted it a monopoly to carry out colonial activities in Asia. It was the first multinational corporation in the world and it was the first company to issue stocks.";
        //
    }
    
    if (QuestionInt == 850){
        ReturnString= @"Singapore";
        //
        
        AnswerString = @"The island of Singapore was ceded to the British East India Company in 1819, and the city was founded the same year by Sir Thomas Raffles. The British took complete control in 1824 and added Singapore to the newly formed Straits Settlements in 1826. Otherwise known as the place we currently live in.";
        //
    }
    
    if (QuestionInt == 851){
        ReturnString= @"King Chulalongkorn";
        //
        
        AnswerString = @"Fifth king of the Chakri dynasty of Thailand.";
        //
    }
    
    if (QuestionInt == 852){
        ReturnString= @"Spanish American War";
        //
        
        AnswerString = @"Took place in 1898, and resulted in the United States of America gaining control over the former colonies of Spain in the Caribbean and Pacific. Cuba would be declared Independent in 1902.";
        //
    }
    
    if (QuestionInt == 853){
        ReturnString= @"“Sleeping dragon”";
        //
        
        AnswerString = @"Term given to China by Napoleon, regarding their untapped population, size and resources.";
        //
    }
    
    if (QuestionInt == 854){
        ReturnString= @"Bullion";
        //
        
        AnswerString = @"Gold or silver considered with respect to quantity rather than value.";
        //
    }
    
    if (QuestionInt == 855){
        ReturnString= @"“Unequal treaties”";
        //
        
        AnswerString = @"A series of treaties signed by several Asian states, including the Qing Empire in China, late Tokugawa Japan, and late Chosun Korea, and foreign powers during the 19th and early 20th centuries. This was a period during which these states were largely unable to resist the military and economic pressures of the primary Western powers. China forced to open up all its ports to Britain.";
        //
    }
    
    if (QuestionInt == 856){
        ReturnString= @"Christian missionaries";
        //
        
        AnswerString = @"Christians who traveled into other countries and attempted to spread the Christian faith. Enthusiastically persecuted in Japan by Tokugawa…";
        //
    }
    
    if (QuestionInt == 857){
        ReturnString= @"Footbinding";
        //
        
        AnswerString = @"Chinese custom of binding women’s feet. They preferred small feet? Confined women to homes. Degrading practice for women of China.";
        //
    }
    
    if (QuestionInt == 858){
        ReturnString= @"White Lotus Rebellion";
        //
        
        AnswerString = @"It apparently began as a tax protest led by the White Lotus Society, a secret religious society that forecast the advent of the Buddha, advocated restoration of the native Chinese Ming dynasty, and promised personal salvation to its followers.";
        //
    }
    
    if (QuestionInt == 859){
        ReturnString= @"Taping Rebellion";
        //
        
        AnswerString = @"Rebellion initiated by Hong Xiuquan to overthrow the Manchurians and establish the kingdom of Heaven in China. Got off to an impressive start militarily but only because Hong avoided attacking large urban centers.";
        //
    }
    
    if (QuestionInt == 860){
        ReturnString= @"Hong Xiuquan";
        //
        
        AnswerString = @"Leader of the Taiping Rebellion. Believed he was the son of Jesus Christ. Failed the civil service examination many times.";
        //
    }
    
    if (QuestionInt == 861){
        ReturnString= @"Open Door Policy";
        //
        
        AnswerString = @"The Open Door Policy is the maintenance in a certain territory of equal commercial and industrial rights for the nationals of all countries.";
        //
    }
    
    if (QuestionInt == 862){
        ReturnString= @"Boxer Rebellion";
        //
        
        AnswerString = @"Was a violent movement against non-Chinese commercial, political, religious and technological influence in China during the final years of the 19th century.";
        //
    }
    
    if (QuestionInt == 863){
        ReturnString= @"Henry Puyi";
        //
        
        AnswerString = @"Last emperor of the Qing Dynasty to rule over China. No more emperors after him.";
        //
    }
    
    if (QuestionInt == 864){
        ReturnString= @"“Dark Continent”";
        //
        
        AnswerString = @"A former name for Africa, so used because its hinterland was largely unknown and therefore mysterious to Europeans until the 19th century";
        //
    }
    
    if (QuestionInt == 865){
        ReturnString= @"“Scramble for Africa”";
        //
        
        AnswerString = @"The Scramble for Africa  began in 1881, when France moved into Tunis with Bismarck's encouragement. After centuries of neglect, Europeans began to expand their influence into Africa. Soon, it took on a full-fledged land grab in Africa by European Powers.";
        //
    }
    
    if (QuestionInt == 866){
        ReturnString= @"Berlin Conference";
        //
        
        AnswerString = @"The Berlin Conference of 1884–85 regulated European colonization and trade in Africa";
        //
    }
    
    if (QuestionInt == 867){
        ReturnString= @"Liberia/Ethiopia";
        //
        
        AnswerString = @"Ethiopia is a republic in northeastern Africa on the Red Sea";
        //
    }
    
    if (QuestionInt == 868){
        ReturnString= @"Coptic Christian Kingdom";
        //
        
        AnswerString = @"One of the few regions in Africa unoccupied by the Europeans.";
        //
    }
    
    if (QuestionInt == 869){
        ReturnString= @"Ashanti Kingdom";
        //
        
        AnswerString = @"Was a powerful state in West Africa in the years prior to European colonization. It was located in what is today southern and central Ghana.";
        //
    }
    
    if (QuestionInt == 870){
        ReturnString= @"Boers/Afrikaners";
        //
        
        AnswerString = @"Indians trained to be British soldiers.";
        //
    }
    
    if (QuestionInt == 871){
        ReturnString= @"Boer War";
        //
        
        AnswerString = @"The Boer Wars was the name given to the South African Wars of 1880-1 and 1899-1902, that were fought between the British and the descendants of the Dutch settlers (Boers) in Africa.";
        //
    }
    
    if (QuestionInt == 872){
        ReturnString= @"Shaka Zulu";
        //
        
        AnswerString = @"Widely credited with transforming the Zulu tribe, from a small clan, into the beginnings of a nation that held sway over that portion of Southern Africa between the Phongolo and Mzimkhulu rivers.";
        //
    }
    
    if (QuestionInt == 873){
        ReturnString= @"African National Congress";
        //
        
        AnswerString = @"Founded to defend the rights of the black majority";
        //
    }
    
    if (QuestionInt == 874){
        ReturnString= @"Muhammad Ali";
        //
        
        AnswerString = @"Egyptian ruler who caused Egypt to industrialize.";
        //
    }
    
    if (QuestionInt == 875){
        ReturnString= @"Suez Canal";
        //
        
        AnswerString = @"A ship canal in northeastern Egypt linking the Red Sea with the Mediterranean Sea";
        //
    }
    
    if (QuestionInt == 876){
        ReturnString= @"Quinine/malaria";
        //
        
        AnswerString = @"An infectious disease characterized by cycles of chills, fever, and sweating = when cure was found, Europe could go internal Africa";
        //
    }
    
    if (QuestionInt == 877){
        ReturnString= @"Intertribal warfare";
        //
        
        AnswerString = @"Conflict between tribes.";
        //
    }
    
    if (QuestionInt == 878){
        ReturnString= @"Belgium – Congo";
        //
        
        AnswerString = @"The formal title of present-day Democratic Republic of the Congo (DRC) between King Léopold II's formal relinquishment of personal control over the state to Belgium on 15 November, 1908, to the dawn of Congolese independence on 30 June, 1960.";
        //
    }
    
    if (QuestionInt == 879){
        ReturnString= @"“Great Game”";
        //
        
        AnswerString = @"Used to describe the rivalry and strategic conflict between the British Empire and the Tsarist Russian Empire for supremacy in Central Asia.";
        //
    }
    
    if (QuestionInt == 880){
        ReturnString= @"Balkans";
        //
        
        AnswerString = @"A major mountain range of southeast Europe extending about 563 km (350 mi) from eastern Yugoslavia through central Bulgaria to the Black Sea. Known as the most dangerous place on Earth, due to the presence of many different racial groups in the region. WWI starts here.";
        //
    }
    
    if (QuestionInt == 881){
        ReturnString= @"Young Turks";
        //
        
        AnswerString = @"A member of a Turkish reformist and nationalist political party active in the early 20th century.";
        //
    }
    
    if (QuestionInt == 882){
        ReturnString= @"Anglo-Egyptian Administration";
        //
        
        AnswerString = @"An Anglo-Egyptian agreement restored Egyptian rule in Sudan but as part of a condominium, or joint authority, exercised by Britain and Egypt. The agreement designated territory south of the twenty-second parallel as the Anglo-Egyptian Sudan.";
        //
    }
    
    if (QuestionInt == 883){
        ReturnString= @"Mahdi";
        //
        
        AnswerString = @"A leader who assumes the role of a messiah.";
        //
    }
    
    if (QuestionInt == 884){
        ReturnString= @"“Long Peace”";
        //
        
        AnswerString = @"Peace between 1871 and 1914 between European nations. Tensions are rising.";
        //
    }
    
    if (QuestionInt == 885){
        ReturnString= @"Alliance System";
        //
        
        AnswerString = @"After the Franco-Prussian War, Bismarck held that Germany was a ""satiated state"" which should give up ideas of further conquest. Thus Bismarck organized a system of alliances designed to maintain Germany's hegemony on the European continent";
        //
    }
    
    if (QuestionInt == 886){
        ReturnString= @"Roosevelt Corollary to the Monroe Doctrine";
        //
        
        AnswerString = @"The Monroe Doctrine had originally been intended to keep European nations out of Latin America, but the Roosevelt corollary was used as a justification for U.S. intervention in Latin America.";
        //
    }
    
    if (QuestionInt == 887){
        ReturnString= @"Panama Canal";
        //
        
        AnswerString = @"Major shipping canal which cuts through the isthmus of Panama in Central America, connecting the Atlantic and Pacific Oceans - US encouraged Panama to rebel to get favorable deal for land";
        //
    }
    
    if (QuestionInt == 888){
        ReturnString= @"Spanish-American War";
        //
        
        AnswerString = @"Took place in 1898, and resulted in the United States of America gaining control over the former colonies of Spain in the Caribbean and Pacific. Cuba would be declared Independent in 1902.";
        //
    }
    
    if (QuestionInt == 889){
        ReturnString= @"Jingoism";
        //
        
        AnswerString = @"Extreme nationalism characterized especially by a belligerent foreign policy";
        //
    }
    
    if (QuestionInt == 890){
        ReturnString= @"Modernization Theory";
        //
        
        AnswerString = @"Developed countries emphasize individuality and capitalism. Economic prosperity due to industrialization is the key to a nation’s advancement.  All countries will naturally modernize.";
        //
    }
    
    if (QuestionInt == 891){
        ReturnString= @"Dependency Theory";
        //
        
        AnswerString = @"Less developed nations either intentionally or unintentionally depend on the developed nations for economic support. Some countries will never be able to break out of dependent cycle...modernization theory doesn't apply. Ex. Latin American nations depend on Europe during colonization. Later result in monoculture.";
        //
    }
    
    if (QuestionInt == 892){
        ReturnString= @"Marxist Theory";
        //
        
        AnswerString = @"Socialism is the only way to a nation’s prosperity. Also known as Communism.";
        //
    }
    
    if (QuestionInt == 893){
        ReturnString= @"“Scramble for Africa”";
        //
        
        AnswerString = @"The Scramble for Africa  began in 1881, when France moved into Tunis with Bismarck's encouragement. After centuries of neglect, Europeans began to expand their influence into Africa. Soon, it took on a full-fledged land grab in Africa by European Powers.";
        //
    }
    
    if (QuestionInt == 894){
        ReturnString= @"Berlin Conference ";
        //
        
        AnswerString = @"The Berlin Conference of 1884–85 regulated European colonization and trade in Africa";
        //
    }
    
    if (QuestionInt == 895){
        ReturnString= @"Liberia/Ethiopia";
        //
        
        AnswerString = @"Only countries that don't fall to colonialism during scramble for Africa";
        //
    }
    
    if (QuestionInt == 896){
        ReturnString= @"Coptic Christian Kingdom";
        //
        
        AnswerString = @"One of the few regions in Africa unoccupied by the Europeans.";
        //
    }
    
    if (QuestionInt == 897){
        ReturnString= @"Ashanti Kingdom";
        //
        
        AnswerString = @"Was a powerful state in West Africa in the years prior to European colonization. It was located in what is today southern and central Ghana.";
        //
    }
    
    if (QuestionInt == 898){
        ReturnString= @"Boers/Afrikaners";
        //
        
        AnswerString = @"Dutch settlers that move into interior of South Africa, later conflict with Zulus and British";
        //
    }
    
    if (QuestionInt == 899){
        ReturnString= @"The Boer Wars";
        //
        
        AnswerString = @"The name given to the South African Wars of 1880-1 and 1899-1902, that were fought between the British in africa";
        //
    }
    
    if (QuestionInt == 900){
        ReturnString= @"Shaka Zulu";
        //
        
        AnswerString = @"Widely credited with transforming the Zulu tribe, from a small clan, into the beginnings of a nation that held sway over that portion of Southern Africa between the Phongolo and Mzimkhulu rivers.  Rare example of indigenous people beating industrialized European country in battle";
        //
    }
    
    if (QuestionInt == 901){
        ReturnString= @"Second and Third Reform Acts";
        //
        
        AnswerString = @"1867/1885 – universal suffrage";
        //
    }
    
    if (QuestionInt == 902){
        ReturnString= @"Muhammad Ali";
        //
        
        AnswerString = @"Egyptian ruler who caused Egypt to industrialize.";
        //
    }
    if (QuestionInt == 903){
        ReturnString= @"Suez Canal";
        //
        
        AnswerString = @"A ship canal in northeastern Egypt linking the Red Sea with the Mediterranean Sea";
        //
    }
    
    if (QuestionInt == 904){
        ReturnString= @"Quinine/malaria";
        //
        
        AnswerString = @"An infectious disease characterized by cycles of chills, fever, and sweating - cure leads to colonization on African interior";
        //
    }
    
    if (QuestionInt == 905){
        ReturnString= @"Intertribal warfare";
        //
        
        AnswerString = @"Conflict between tribes.";
        //
    }
    
    if (QuestionInt == 906){
        ReturnString= @"Genocide";
        //
        
        AnswerString = @"The systematic and planned extermination of an entire national, racial, political, or ethnic group.";
        //
    }
    
    if (QuestionInt == 907){
        ReturnString= @"Social Darwinism";
        //
        
        AnswerString = @"Social theory by Darwin on evolution applied to determine social class (the strong survives, the weak doesn’t, Europeans= the best)";
        //
    }
    
    if (QuestionInt == 908){
        ReturnString= @"Communism";
        //
        
        AnswerString = @"System of government in which every one is equal, property is owned by the government";
        //
    }
    
    if (QuestionInt == 909){
        ReturnString= @"Populism";
        //
        
        AnswerString = @"A political philosophy supporting the right and power of the people in their struggle against he privileged elite";
        //
    }
    
    if (QuestionInt == 910){
        ReturnString= @"Capitalism";
        //
        
        AnswerString = @"Economic system, where means of production and distribution are privately or corporately owned, profits gained in free market";
        //
    }
    
    if (QuestionInt == 911){
        ReturnString= @"Fascism";
        //
        
        AnswerString = @"System of government, under authority of a dictator, through suppression of the opposition by means of terror and censorship";
        //
    }
    
    if (QuestionInt == 912){
        ReturnString= @"Collective security";
        //
        
        AnswerString = @"System for international peace";
        //
    }
    
    if (QuestionInt == 913){
        ReturnString= @"Embargo";
        //
        
        AnswerString = @"A prohibition by a government on certain/all trade with a foreign nation - method of pressuring a nation diplomatically";
        //
    }
    
    if (QuestionInt == 914){
        ReturnString= @"Information revolution";
        //
        
        AnswerString = @"Revolution in that allowed the increasing availability of information due to the use of things like computers, internet and other technologies";
        //
    }
    
    if (QuestionInt == 915){
        ReturnString= @"World depression";
        //
        
        AnswerString = @"A worldwide economic downfall, started in 1929, but different time in differet countries. Basically all countries were affected, worst hit was the industrialized countries like the US.";
        //
    }
    
    if (QuestionInt == 916){
        ReturnString= @"Mohandas Gandhi";
        //
        
        AnswerString = @"Political leader of India, played a key role in gaining independence for India through non-violent protest, boycott.";
        //
    }
    
    if (QuestionInt == 917){
        ReturnString= @"Adolf Hitler";
        //
        
        AnswerString = @"Leader of Germany, and Nazi party. Begun WWII in Europe ";
        //
    }
    
    if (QuestionInt == 918){
        ReturnString= @"Vladimir Lenin";
        //
        
        AnswerString = @"Founder of the Bolsheviks and leader of Russian revolution, first leader of USSR";
        //
    }
    
    if (QuestionInt == 919){
        ReturnString= @"Margaret Thatcher";
        //
        
        AnswerString = @"First woman to serve as a prime minister, of England, conservative – symbolized shift away from welfare economy";
        //
    }
    
    if (QuestionInt == 920){
        ReturnString= @"Mikhail Gorbachev";
        //
        
        AnswerString = @"Soviet leader who brought an end to the cold war through his foreign policy  ";
        //
    }
    
    if (QuestionInt == 921){
        ReturnString= @"Gamal Nasser";
        //
        
        AnswerString = @"Led social revolution in Egypt in 1952 And was an army officer and politician who servedAs both prime minister (1954-56) and president 1956-58). His nationalism of the Suez Canal precipitatedan international crisis in 1956.";
        //
    }
    
    if (QuestionInt == 922){
        ReturnString= @"Nelson Mandela";
        //
        
        AnswerString = @"After being released from prison for helping to lead The black organization, African National Congress, In South Africa, he became the nation’s first Democratically elected president in 1994";
        //
    }
    
    if (QuestionInt == 923){
        ReturnString= @"Mao Tse Tung";
        //
        
        AnswerString = @"Chinese communist leader, Mao, came to power in 1949 and proclaimed the People’s Republic ofChina. While in power, he initiated the Great leap Forward and the founding of communes. He also Led the Cultural Revolution and established ties withThe West. ";
        //
    }
    
    if (QuestionInt == 924){
        ReturnString= @"Akio Morita";
        //
        
        AnswerString = @"During postwar Japan, Akio Morita co-founded the Global company, Sony. ";
        //
    }
    
    if (QuestionInt == 925){
        ReturnString= @"Bill Gates";
        //
        
        AnswerString = @"American computer software designer who Co-founded Microsoft and built it into one of the Largest computer software manufacturers";
        //
    }
    
    if (QuestionInt == 926){
        ReturnString= @"Walt Disney";
        //
        
        AnswerString = @"American film maker who created animated Cartoons and famous characters (Mickey Mouse)";
        //
    }
    
    if (QuestionInt == 927){
        ReturnString= @"Allied Powers";
        //
        
        AnswerString = @"Created by Otto von Bismarck in the 1880’s with Germany, Austria-Hungary, and Italy ";
        //
    }
    
    if (QuestionInt == 928){
        ReturnString= @"Anschluss";
        //
        
        AnswerString = @"A political union including the one unifying Nazi Germany and Austria in 1938";
        //
    }
    
    if (QuestionInt == 929){
        ReturnString= @"Appeasement";
        //
        
        AnswerString = @"The policy of granting concessions to potential enemies to maintain peace. (Such as in the Munich Conference of 1938)";
        //
    }
    
    if (QuestionInt == 930){
        ReturnString= @"British Commonwealth";
        //
        
        AnswerString = @"An association comprising the United Kingdom, its dependencies, and many former British colonies that are now sovereign states with a common allegiance to the British Crown";
        //
    }
    
    if (QuestionInt == 931){
        ReturnString= @"Central Powers";
        //
        
        AnswerString = @"An alliance during WWI with Germany, Austria-Hungary, Italy(though it left and became neutral), and the Ottoman Empire (which joined after Italy left)";
        //
    }
    
    if (QuestionInt == 932){
        ReturnString= @"Great Depression";
        //
        
        AnswerString = @"International economic crisis following WWI. Began With the collapse of the American stock market in 1929 and caused mass unemployment. ";
        //
    }
    
    if (QuestionInt == 933){
        ReturnString= @"Holocaust";
        //
        
        AnswerString = @"Term for Hitler’s attempted genocide of European Jews during WWII. ";
        //
    }
    
    if (QuestionInt == 934){
        ReturnString= @"League of Nations";
        //
        
        AnswerString = @"International diplomatic and peace organization Created in the Treaty of Versailles that ended WWI;One of the chief goals of President Woodrow WilsonIn the peace negotiations";
        //
    }
    
    if (QuestionInt == 935){
        ReturnString= @"Mandate";
        //
        
        AnswerString = @"Governments entrusted to European nations in theMiddle East in the aftermath of WWI. ";
        //
    }
    
    if (QuestionInt == 936){
        ReturnString= @"Pan-Slavic movement";
        //
        
        AnswerString = @"Movement in the 1800's to unite the Slavic people in Austria and the Ottoman Empire";
        //
    }
    
    if (QuestionInt == 937){
        ReturnString= @"Potsdam Conference";
        //
        
        AnswerString = @"Meeting of the Allies of WWII to clarify and implement agreements made at the Yalta Conference";
        //
    }
    
    if (QuestionInt == 938){
        ReturnString= @"Reparations";
        //
        
        AnswerString = @"The act of making amends. (Germany's war payments as agreed to in the Treaty of Versailles)";
        //
    }
    
    if (QuestionInt == 939){
        ReturnString= @"Russification";
        //
        
        AnswerString = @"Cultures under the Russian Empire become a part of a Great Russian Culture- loyalty to the tsar; a form of nationalism";
        //
    }
    
    if (QuestionInt == 940){
        ReturnString= @"Spanish Civil War";
        //
        
        AnswerString = @"Conflict between supporters and opponents of the Spansh republic; there was a Nationalist victory due in part to 'non-intervention' of Western democracies";
        //
    }
    
    if (QuestionInt == 941){
        ReturnString= @"Tehran Conference";
        //
        
        AnswerString = @"A conference in Tehran, Iran involving USSR, US and Britain aimed at strengthening cooperation in WWII";
        //
    }
    
    if (QuestionInt == 942){
        ReturnString= @"Treaty of Brest-Litovsk";
        //
        
        AnswerString = @"Treaty between USSR and the Central Powers, calling for Russia to withdraw from WWI and to surrender territory.";
        //
    }
    
    if (QuestionInt == 943){
        ReturnString= @"Treaty of Versailles";
        //
        
        AnswerString = @"Treaty signed in 1919, ending WWI";
        //
    }
    
    if (QuestionInt == 944){
        ReturnString= @"United Nations";
        //
        
        AnswerString = @"International organization founded in 1945 to promote peace, security and economic development";
        //
    }
    
    if (QuestionInt == 945){
        ReturnString= @"Yalta Conference";
        //
        
        AnswerString = @"Meeting between USSR, US and Britain, demanded Germany's unconditional surrender and called for the division of Germany";
        //
    }
    
    if (QuestionInt == 946){
        ReturnString= @"Nationalism";
        //
        
        AnswerString = @"The belief that nations will benefit from acting independently rather than collectively, emphasizing national rather than international goals";
        //
    }
    
    if (QuestionInt == 947){
        ReturnString= @"Imperialism";
        //
        
        AnswerString = @"Extending a nations authority over another nations economy/politics (new driving force behind Latin American revolutions)";
        //
    }
    
    if (QuestionInt == 948){
        ReturnString= @"Militarism";
        //
        
        AnswerString = @"Predominance of armed forces in the administration/policy of a state (Japan during WWII)";
        //
    }
    
    if (QuestionInt == 949){
        ReturnString= @"Afrikaners";
        //
        
        AnswerString = @"An Afrikaans-speaking South African of European ancestry, especially one descended from 17th-century Dutch settlers.";
        //
    }
    
    if (QuestionInt == 950){
        ReturnString= @"Alliance for Progress";
        //
        
        AnswerString = @"U.S. assistance program for Latin America to counter revolutionary politics (1961)";
        //
    }
    
    if (QuestionInt == 951){
        ReturnString= @"Apartheid";
        //
        
        AnswerString = @"When Dutch Afrikaners were given control by the British and they practiced apartheid, or extreme racial segregation.";
        //
    }
    
    if (QuestionInt == 952){
        ReturnString= @"Ayatollah";
        //
        
        AnswerString = @"Religious teachers that oppose secular views, ex: Ayatollah Khomeini, Islamic fundamentalist who played a pivotal role in the Iranian Revolution.";
        //
    }
    
    if (QuestionInt == 953){
        ReturnString= @"Berlin Wall";
        //
        
        AnswerString = @"Symbol of the iron curtain (separate East Berlin from West), prevented East Berliners access to the West came down in 1989.";
        //
    }
    
    if (QuestionInt == 954){
        ReturnString= @"Brinkmanship";
        //
        
        AnswerString = @"Introduced during the Cold War, policy or practice, especially in international politics and foreign policy, of pushing a dangerous situation to the brink of disaster in order to achieve the most advantageous outcome by forcing the opposition to make concessions. During the Cold War, the threat of nuclear force was often used as such a deterrent.";
        //
    }
    
    if (QuestionInt == 955){
        ReturnString= @"Coalition";
        //
        
        AnswerString = @"Alliance between entities (nations, states, groups). The US used diplomacy to create a wide coalition of support. In the Post Cold war alliances and coalition were always shifting. OPEC is the most successful coalition in history. After WWII a coalition government in China was encouraged, but the communists won in 1949.";
        //
    }
    
    if (QuestionInt == 956){
        ReturnString= @"Cold War";
        //
        
        AnswerString = @"US (democracy) vs. Soviet Union (totalitarian communist). Lasted nearly 50 years, 1945 to early 1990’s. US and Soviets vied for global domination and tried to pull the rest of the world into the war. Arms race between the two nations.";
        //
    }
    
    if (QuestionInt == 957){
        ReturnString= @"Collectivization";
        //
        
        AnswerString = @"Part of Stalin’s Five Year Plans. HE took over private farms and combined them into state-owned enterprises and created large, nationalized factories. ";
        //
    }
    
    if (QuestionInt == 958){
        ReturnString= @"Containment";
        //
        
        AnswerString = @"Where the US prevented the spread of Communism by establishing the Truman Doctrine to aid nations threatened by communism. ";
        //
    }
    
    if (QuestionInt == 959){
        ReturnString= @"Cuban Missile Crisis";
        //
        
        AnswerString = @"In 1962 Soviets were installing their missiles in Cuba and Pres Kennedy established a naval blockade around Cuba. If the missiles were launched the US would retaliate against the Soviet Union. The Soviets backed down and Americans promised not to invade Cuba. ";
        //
    }
    
    if (QuestionInt == 960){
        ReturnString= @"Cultural Revolution";
        //
        
        AnswerString = @"Goal was to discourage a privileged ruling class from forming, he instituted reforms that erased any influence from the West, intellectuals were sent to collective farms for “cultural restraining”, political dissidents were imprisoned or killed. Mao’s Little Red Book became a symbol of the forced egalitarianism.";
        //
    }
    
    if (QuestionInt == 961){
        ReturnString= @"Five Year Plans";
        //
        
        AnswerString = @"Stalin discarded the New Economic Policy (NEP) of Russia and imposed the Five Year Plans and collectivization played a huge part.";
        //
    }
    
    if (QuestionInt == 962){
        ReturnString= @"Geneva Conference";
        //
        
        AnswerString = @"After France lost the battle at Dien Bien Phu, they signed the treaty in 1954.  Nations of Laos, Cambodia, Vietnam were created and Vietnam was divided into north/south – elections in a 2 years. ";
        //
    }
    
    if (QuestionInt == 963){
        ReturnString= @"Glasnost";
        //
        
        AnswerString = @"When Mikhail Gorbachev came to power in the Soviet Union in 1985, he instituted policies of glasnost or openness and urged a perestroika (restructuring) of the soviet economy. ";
        //
    }
    
    if (QuestionInt == 964){
        ReturnString= @"Government of India Act";
        //
        
        AnswerString = @"Created in India in 1935 after Ghandi was jailed and it increased suffrage/provincial gov’t to Indian leaders";
        //
    }
    
    if (QuestionInt == 965){
        ReturnString= @"Great Leap Forward";
        //
        
        AnswerString = @"In the late 1950’s, Mao implemented this, huge communes were created to catapult the revolution towards its goal of a true Marxist state. But the local govts, couldn’t produce the ridiculous amount of agricultural quotas demanded by the central govt, and lied about production, leading to the starvation and deaths of nearly 30 mill Chinese.";
        //
    }
    
    if (QuestionInt == 966){
        ReturnString= @"Guomindang";
        //
        
        AnswerString = @"The Chinese Nationalist Party founded by Sun Yat-sen in 1919, it drew support mainly from local warlords. It initially formed an alliance with Communists in 1924, and after 1925 was dominated by Chiang Kai-shek. ";
        //
    }
    
    if (QuestionInt == 967){
        ReturnString= @"Iron Curtain";
        //
        
        AnswerString = @"After WWII, Winston Churchill coined the phrase to describe the division between free and Communist societies that was occurring in Europe ";
        //
    }
    
    if (QuestionInt == 968){
        ReturnString= @"Korean Conflict";
        //
        
        AnswerString = @"The Korean War was fought from 1950 to 1953. The North was supported by USSR and later People’s Republic of China while the South was supported by U.S. and small United Nations force. The war ended in stalemate, with Korea still divided into North and South. ";
        //
    }
    
    if (QuestionInt == 969){
        ReturnString= @"Kulaks";
        //
        
        AnswerString = @"Russian agricultural entrepreneurs who used the Stolypin reforms to increase agricultural production and buy more land";
        //
    }
    
    if (QuestionInt == 970){
        ReturnString= @"Marshall Plan";
        //
        
        AnswerString = @"A program of substantial loans given by the U.S. to Western Europe in 1947, it was designed to aid in rebuilding efforts after the war’s devastation. It was also an attempt by the U.S. to stop Communism (if countries were economically propped up they would be less likely to turn to Communism) and it helped secure American economic dominance";
        //
    }
    if (QuestionInt == 971){
        ReturnString= @"May Fourth Movement";
        //
        
        AnswerString = @"In 1919 – resistance in China to Japanese encroachments began. This generated a movement of intellectuals aimed at transforming China into a liberal democracy (Confucianism was rejected, etc)";
        //
    }
    
    if (QuestionInt == 972){
        ReturnString= @"New Economic Policy";
        //
        
        AnswerString = @"Instituted by Lenin in 1921 – the state continued to set basic economic policies, but now efforts were combined with individual initiatives. This policy allowed food production to recover";
        //
    }
    
    if (QuestionInt == 973){
        ReturnString= @"Nonalignment";
        //
        
        AnswerString = @"Promotion of alternatives to bloc politics – as in Yugoslavia’s split from the Soviet bloc in 1948. Later Jawaharlal Nehru of India and Gamal Abdul Nasser of Egypt joined in the founding of the Nonaligned Movement in the mid-1950s, which had basic principles of opposition to all foreign intervention and peaceful coexistence. The first meeting of nonaligned states was the Belgrade Conference of Nonaligned Nations in 1961.";
        //
    }
    
    if (QuestionInt == 974){
        ReturnString= @"North Atlantic Treaty Organization";
        //
        
        AnswerString = @"Created in 1949 under U.S. leadership to create an alliance between most of the Western powers (including Canada) in defense against possible Soviet aggression ";
        //
    }
    
    if (QuestionInt == 975){
        ReturnString= @"Perestroika";
        //
        
        AnswerString = @"Mikhail Gorbachev’s policy calling for economic restructuring in the USSR in the late 1980s. This included more scope for private ownership and decentralized control in the areas of industry and agriculture";
        //
    }
    
    if (QuestionInt == 976){
        ReturnString= @"Prague Spring";
        //
        
        AnswerString = @"In 1968, Czechoslovak Communist Party leader Alexander Dubcek tried to liberalize the country's communist regime by introducing democratic reforms such as free speech and freedom of assembly. The period came to be known as the Prague Spring, but it was ended when Warsaw Pact (Soviet) troops invaded in a military crackdown. ";
        //
    }
    
    if (QuestionInt == 977){
        ReturnString= @"Purges";
        //
        
        AnswerString = @"In 1936, Stalin began a series of purges aimed at destroying all political opposition and dissident viewpoints. These also included intensive campaigns within key Soviet institutions and sectors like the Communist Party, the Army, the NKVD (secret police), and scientists/engineers.";
        //
    }
    
    if (QuestionInt == 979){
        ReturnString= @"Sandinistas";
        //
        
        AnswerString = @"Members of Nicaraguan social movement named after Augusto Sandino – during the 1980s successfully carried out a socialist revolution in Nicaragua ";
        //
    }
    
    if (QuestionInt == 980){
        ReturnString= @"Six-Day War";
        //
        
        AnswerString = @"Fought between Egypt and Israel in 1967; was disastrous for Egypt and one of the failed foreign adventures under Gamal Abdul Nasser, adding to the regime’s problems ";
        //
    }
    
    if (QuestionInt == 981){
        ReturnString= @"Solidarity";
        //
        
        AnswerString = @"In 1970s, in the form of widespread Catholic unrest and an independent labor movement. (Against the back drop of a stagnant economy and low morale)";
        //
    }
    
    if (QuestionInt == 982){
        ReturnString= @"Tiananmen Square";
        //
        
        AnswerString = @"In China, student led, believed the Communist party led government was too corrupt and repressive. Government doesn’t permit democratic reform, 1989.";
        //
    }
    
    if (QuestionInt == 983){
        ReturnString= @"Truman Doctrine";
        //
        
        AnswerString = @"United States was prepared to send any money, equipment, or military force to countries that were threatened by the communist government. Assisting countries resisting communism.";
        //
    }
    
    if (QuestionInt == 984){
        ReturnString= @"Warsaw Pact";
        //
        
        AnswerString = @"Military alliance, response to NATO, Soviet Union created own nuclear capability.";
        //
    }
    
    if (QuestionInt == 985){
        ReturnString= @"Al-Qaeda";
        //
        
        AnswerString = @"International Islamic fundamentalist organization. To reduce outside influence upon Islamic affairs. (some classify it as International terrorist organization)";
        //
    }
    
    if (QuestionInt == 986){
        ReturnString= @"Cartels";
        //
        
        AnswerString = @"Association of manufacturers with the purpose of maintaining prices at a high level and restricting competition. In Latin American nations- large foreign debts, huge international drug cartel that threaten government stability.";
        //
    }
    
    if (QuestionInt == 987){
        ReturnString= @"International Monetary Fund";
        //
        
        AnswerString = @"IMF- resources for development usually for badly strapped for investment funds and essential technology.";
        //
    }
    
    if (QuestionInt == 988){
        ReturnString= @"Persian Gulf War";
        //
        
        AnswerString = @"1991 led by US and various European and Middle Easter allies against Iraqi occupation of Kuwait. This led to Iraqi withdrawal and a long confrontation with Iraq about armaments and political regime.";
        //
    }
    
    if (QuestionInt == 989){
        ReturnString= @"World Bank";
        //
        
        AnswerString = @"Concession for aid, for example commit to buy products, favor investors, lend countries to enter into alliances and permit military bases on the territory of the client state.";
        //
    }
    
    if (QuestionInt == 990){
        ReturnString= @"Euro";
        //
        
        AnswerString = @"To dismantle all trade and currency exchange barriers among member nations. A single currency, set up in many member countries by 2001.";
        //
    }
    
    if (QuestionInt == 991){
        ReturnString= @"European Economic Community";
        //
        
        AnswerString = @"European Economic Community- create a single economic entity across national political boundaries.";
        //
    }
    
    if (QuestionInt == 992){
        ReturnString= @"European Union";
        //
        
        AnswerString = @"Started as European Economic Community, an alliance of Germany, France, Italy, Belgium, Luxembourg, and the Netherlands, later joined by Britain, Ireland, Denmark, Greece, Spain, Portugal, Swede, Austria, Finland. It was to create a single economy across national boundaries in 1958.";
        //
    }
    
    if (QuestionInt == 993){
        ReturnString= @"Import substitution industrialization";
        //
        
        AnswerString = @"Cut off from supplies of traditional imports, these countries then experienced a spurt of industrial growth.";
        //
    }
    
    if (QuestionInt == 994){
        ReturnString= @"McDonaldization";
        //
        
        AnswerString = @"Same multinational corporations everywhere";
        //
    }
    
    if (QuestionInt == 995){
        ReturnString= @"North American Free Trade Organization – NAFTA";
        //
        
        AnswerString = @"Free trade agreement, benefits from economic alliances. (United States, Mexico, and Canada)";
        //
    }
    
    if (QuestionInt == 996){
        ReturnString= @"Organization of Petroleum Exporting Countries (OPEC)";
        //
        
        AnswerString = @"Oil cartel that determines supply of oil - of Algeria, Indonesia, Iran, Iraq, Kuwait, Libya, Nigeria, Qatar, Saudi Arabia, the United Arab Emirates and Venezuela; since ";
        //
    }
    
    if (QuestionInt == 997){
        ReturnString= @"World Trade Organization (WTO)";
        //
        
        AnswerString = @"International body that sets the rules for global trade - competitive trading, but give chance for developing nations to join, must follow certain civil rights codes";
        //
    }
    
    if (QuestionInt == 998){
        ReturnString= @"Deoxyribonucleic acid";
        //
        
        AnswerString = @"DNA - building blocks of life - once decoded leads to cloning possibilities, health remedies, tracking people";
        //
    }
    
    if (QuestionInt == 999){
        ReturnString= @"Helsinki Accords";
        //
        
        AnswerString = @"1975 agreement - apply human rights to Soviet bloc countries";
        //
    }
    
    if (QuestionInt == 1000){
        ReturnString= @"Hubble Space Telescope";
        //
        
        AnswerString = @"Space telescope that circles earth - free of atmosphere - took astrophysics to another level";
        //
    }
    if (QuestionInt == 1001){
        ReturnString= @"International Space Station";
        //
        
        AnswerString = @"Permanent human presence outside earth - combined five space agencies - US, USSR, European, Japanese, Canada - teamwork through science";
        //
    }
    
    if (QuestionInt == 1002){
        ReturnString= @"Service industries";
        //
        
        AnswerString = @"Post-industrial economies that provide services to consumer culture - white collar jobs - move away from factory labor";
        //
    }
    
    if (QuestionInt == 1003){
        ReturnString= @"Sputnik";
        //
        
        AnswerString = @"1957 First Soviet satellite into space - set off space race - threat by both sides of nuclear attack from space";
        //
    }
    
    if (QuestionInt == 1004){
        ReturnString= @"Cubism";
        //
        
        AnswerString = @"Most important movement since Renaissance - objects are broken up, analyzed, and re-assembled in an abstracted form ";
        //
    }
    
    if (QuestionInt == 1005){
        ReturnString= @"Evangelical";
        //
        
        AnswerString = @"Not Catholicism - personal experience of conversion, biblically-oriented faith, and a belief in the relevance of Christian faith to cultural issues";
        //
    }
    
    if (QuestionInt == 1006){
        ReturnString= @"Kabuki theater";
        //
        
        AnswerString = @"Japanese cinema - elaborate make-up, singing, drama";
        //
    }
    
    if (QuestionInt == 1007){
        ReturnString= @"Mass consumerism";
        //
        
        AnswerString = @"Wealth now spent on surplus items - consumer goods - industrialized world spends a ton of money bringing their world from a 10>11 instead of bringing everyone else up from a 0>1";
        //
    }
    
    if (QuestionInt == 1008){
        ReturnString= @"National Organization for Women (NOW)";
        //
        
        AnswerString = @"American feminist group - founded 1966 - dedicated to lobbying for women's fertility, employment, marital, education rights";
        //
    }
    
    if (QuestionInt == 1009){
        ReturnString= @"New Deal";
        //
        
        AnswerString = @"Franklin Delano Roosevelt's plan to turn US into welfare state to bring out of Depression - state-sponsored programs for relief, recovery and reform";
        //
    }
    
    if (QuestionInt == 1010){
        ReturnString= @"Noh theater";
        //
        
        AnswerString = @"Japanese classical theater - musical - during meiji reached offical drama status";
        //
    }
    
    if (QuestionInt == 1011){
        ReturnString= @"Welfare state";
        //
        
        AnswerString = @"New activism of western European state in economic policy and welfare issues after WWII; reduced impact of economic inequality (avoid another world war).";
        //
    }
    
    if (QuestionInt == 1012){
        ReturnString= @"Green Revolution";
        //
        
        AnswerString = @"Introduction of improved seed strains, fertilizers, and irrigation to produce higher crop yields; after WWII in densely pop. Asian countries.";
        //
    }
    
    if (QuestionInt == 1013){
        ReturnString= @"Guest workers";
        //
        
        AnswerString = @"Legal workers with no rights for citizenship/permanent recidency who immigrate for work; a threat to citizens for job opportunities; usually from a less developed country > developed country.";
        //
    }
    
    if (QuestionInt == 1014){
        ReturnString= @"Ozone depletion";
        //
        
        AnswerString = @"Caused by industrial revolution due to high pollutions";
        //
    }
    
    if (QuestionInt == 1015){
        ReturnString= @"Axis Powers";
        //
        
        AnswerString = @"Alliance of Germany, Italy, and Japan during World War II.";
        //
    }
    
    if (QuestionInt == 1016){
        ReturnString= @"Ethnic cleansing";
        //
        
        AnswerString = @"Mass expulsion or killings of a certain ethnic or religious group; eg. WWII: the holocaus, massive killings of Tutsis by Hutus in the Rwandan Genocide. ";
        //
    }
    
    if (QuestionInt == 1017){
        ReturnString= @"Armenian genocide";
        //
        
        AnswerString = @"1915: Young turk leaders killed millions and sent hundreds of Amermenians to Russia and Middle East to cover up the blunders of reverses on the Russian Front";
        //
    }
    
    if (QuestionInt == 1018){
        ReturnString= @"Bosnia";
        //
        
        AnswerString = @"Mountainous country in the western Balkans";
        //
    }
    
    if (QuestionInt == 1019){
        ReturnString= @"Nuremberg war crimes trial";
        //
        
        AnswerString = @"Two sets of trials for the Nazis from WWII and the holocaust; included commanders, industrialists, and medical doctors";
        //
    }
    
    if (QuestionInt == 1020){
        ReturnString= @"Limited War";
        //
        
        AnswerString = @"A war whose objective is less than the unconditional defeat of the enemy ";
        //
    }
    
    if (QuestionInt == 1021){
        ReturnString= @"UN police action";
        //
        
        AnswerString = @"The United Nations starting a military action without declaration of war; against violators of international peace and order ";
        //
    }
    
    if (QuestionInt == 1022){
        ReturnString= @"""Powder keg of Europe""";
        //
        
        AnswerString = @"Area in the Balkans; region where the wars would begin such as the assassination of Franz Ferdinand";
        //
    }
    
    if (QuestionInt == 1023){
        ReturnString= @"Massive retaliation";
        //
        
        AnswerString = @"To retaliate in a greater force; the ending of WWII by the bombing of Nagasaki and Hiroshima";
        //
    }
    
    if (QuestionInt == 1024){
        ReturnString= @"Russian Revolution";
        //
        
        AnswerString = @"1917: overthrowing of the Tsarist regine; 1918 (3rd Russian Revolution): series of anarchist rebellions and uprisings against both the Bolsheviks and the White movement";
        //
    }
    
    if (QuestionInt == 1025){
        ReturnString= @"General Francisco Franco";
        //
        
        AnswerString = @"Spanish general whose armies took control of Spain in 1939 and who ruled as a dictator until his death  (following the victory of the Spanish Civil War)";
        //
    }
    
    if (QuestionInt == 1026){
        ReturnString= @"Star Wars";
        //
        
        AnswerString = @"Nickname for Ronald Reagan's Strategic Defense Initiative (SDI) - shooting down nuclear weapons from space - never actually worked, but scared USSR into economic bankruptcy";
        //
    }
    
    if (QuestionInt == 1027){
        ReturnString= @"Strategic Defense Initiative";
        //
        
        AnswerString = @"No Answer";
        //
    }
    
    if (QuestionInt == 1028){
        ReturnString= @"Third Reich";
        //
        
        AnswerString = @"Hitler's plan to have Germany reign for a Thousand Year Empire over Europe - lasted 6 years - nice try";
        //
    }
    
    if (QuestionInt == 1029){
        ReturnString= @"Triple Alliance, Central Powers";
        //
        
        AnswerString = @"World War I alliance - Ottoman Empire, German Empire, Austro-Hungarian Empire - the bad guys";
        //
    }
    
    if (QuestionInt == 1030){
        ReturnString= @"Triple Entente, the Allies";
        //
        
        AnswerString = @"World War II alliance - UK, France, Russia, later US and all their colonies - the good guys";
        //
    }
    
    if (QuestionInt == 1031){
        ReturnString= @"Total war";
        //
        
        AnswerString = @"Entire economy, political, social system geared for war - civilians become targets - government takes greater control of everyday life";
        //
    }
    
    if (QuestionInt == 1032){
        ReturnString= @"Muhammad Ali Jinnah";
        //
        
        AnswerString = @"Led the Indian Muslim League - pushed for partition of India - led to creation of Pakistan";
        //
    }
    
    if (QuestionInt == 1033){
        ReturnString= @"Muslim League";
        //
        
        AnswerString = @"Political party in British India - driving force for partition of India - creation of Pakistan";
        //
    }
    
    if (QuestionInt == 1034){
        ReturnString= @"India/Pakistan";
        //
        
        AnswerString = @"1946 - Britain couldn't hold India together - Jinnah threatening civil war - Pakistan created - later divided into Bangladesh - tensions ever since over border disputes - Kashmere - largest refugee immigration in world history";
        //
    }
    
    if (QuestionInt == 1035){
        ReturnString= @"Jomo Kenyatta";
        //
        
        AnswerString = @"Founding father of Kenya - notice the name";
        //
    }
    
    if (QuestionInt == 1036){
        ReturnString= @"Kwame Nkrumah";
        //
        
        AnswerString = @"Anti-colonial African leader - founder of Ghana";
        //
    }
    
    if (QuestionInt == 1037){
        ReturnString= @"Julius Nyerere";
        //
        
        AnswerString = @"Teacher turned founder of Tanzania";
        //
    }
    
    if (QuestionInt == 1038){
        ReturnString= @"Persian Gulf States";
        //
        
        AnswerString = @"Cooperation council of nations border Persian Gulf - Bahrain, Iran (Persia), Iraq, Kuwait, Oman, Qatar, Saudi Arabia, and the United Arab Emirates.";
        //
    }
    
    if (QuestionInt == 1039){
        ReturnString= @"Collapse of the Berlin Wall";
        //
        
        AnswerString = @"Symbolic end of the Cold War - divide between East and West Berlin - protesters threatened to take apart and military didn't stop them - 1989";
        //
    }
    
    if (QuestionInt == 1040){
        ReturnString= @"Desalinization";
        //
        
        AnswerString = @"Expensive effort to turn salt water into fresh water - usually located in Persian Gulf regions";
        //
    }
    
    if (QuestionInt == 1041){
        ReturnString= @"Multinational corporations";
        //
        
        AnswerString = @"Large Scale Companies that initially began as business in a certain region of the world but has grown to become so big and is now an “international” company. Examples: General Electric (GE), Nike, Nokia, and McDonalds.";
        //
    }
    
    if (QuestionInt == 1042){
        ReturnString= @"National Congress Party";
        //
        
        AnswerString = @"Indian Political Party established in 1885, that led the eventual push for Indian Independence from the British Crown in 1947. Currently the largest Indian Political Party.";
        //
    }
    
    if (QuestionInt == 1043){
        ReturnString= @"Nongovernmental organization";
        //
        
        AnswerString = @"Organizations that are not established or associated with any specific organizations. They may be recognized, however, they run on their own. Examples are Green Peace and Amnesty International.";
        //
    }
    
    if (QuestionInt == 1044){
        ReturnString= @"Pacific Rim";
        //
        
        AnswerString = @"The nations bordering the Pacific Oceans, usually Asian nations: Japan, North and South Korea, Taiwan and eastern China.";
        //
    }
    
    if (QuestionInt == 1045){
        ReturnString= @"Terrorism";
        //
        
        AnswerString = @"The use of violence and intimidation to try and gain political awareness or right.";
        //
    }
    
    if (QuestionInt == 1046){
        ReturnString= @"Fundamentalist jihad";
        //
        
        AnswerString = @"A holy war raged by Muslims against Non-believers, although in recent times, even attacks by one Muslim group against another have risen.";
        //
    }
    
    if (QuestionInt == 1047){
        ReturnString= @"Palestine/Israel";
        //
        
        AnswerString = @"The “Holy Land” of Islam, Christianity and Judaism where ongoing conflicts take place between the Jewish Community (who represent Israel) and the Arab Community (who represent Palestine). Israel was a recent creation for the Jewish people and named the “Jewish Homeland” by the British Empire.";
        //
    }
    
    if (QuestionInt == 1048){
        ReturnString= @"Northern Ireland";
        //
        
        AnswerString = @"A former member of the Republic of Ireland that broke away in 1920 after refusing to take part in the Irish Free State. Ruled and governed by Protestants and heavy discrimination exists against the Roman Catholic Minority. Capital: Belfast.";
        //
    }
    
    if (QuestionInt == 1049){
        ReturnString= @"Assassination of Franz Ferdinand";
        //
        
        AnswerString = @"Heir to the Austro-Hungarian throne who was assassinated in Bosnia-Herzegovina, which triggered the Austro-Hungarians to pledge war against Serbia, which then initiated World War I.";
        //
    }
    
    if (QuestionInt == 1050){
        ReturnString= @"Germany's ""blank check""";
        //
        
        AnswerString = @"After Sarajevo, Count Leopold von Berchtold, the Austro-Hungarian Foreign Minister, sent a letter to Emperor Francis Joseph to sign and send to Wilhelm II to try and convince him of Serbia's responsibility of Franz Ferdinand’s assassination. On July 6th, Wilhelm II and Theobald von Bethmann-Hollweg, told Berchtold that Austria-Hungary could rely that Germany would support whatever action was necessary to deal with Serbia -- in effect offering von Berchtold a 'blank check.'";
        //
    }
    
    if (QuestionInt == 1051){
        ReturnString= @"Schlieffen Plan";
        //
        
        AnswerString = @"The German plan to destroy France and gain victory over the Western Front during the first month of World War I. A counterattack by the French on the outskirts of Paris prevented the Germans. Alfred von Schlieffen wrote up the Plan.";
        //
    }
    
    if (QuestionInt == 1052){
        ReturnString= @"Eastern and Western Fronts";
        //
        
        AnswerString = @"Eastern Front was the former East Germany, parts of Central Europe and Russia. The Western Front was the “Low Countries” (who for the most part remained neutral), France, Great Britain and then the United States.";
        //
    }
    
    if (QuestionInt == 1053){
        ReturnString= @"Trench warfare";
        //
        
        AnswerString = @"A type of combat where opposing troops fight one another in trenches, where conditions are extremely poor, hygienically.";
        //
    }
    
    if (QuestionInt == 1054){
        ReturnString= @"Submarine warfare";
        //
        
        AnswerString = @"A type of combat where submarines are used to fight against opposing forces underwater. Was used heavily in the Baltic Sea against Russia forces.";
        //
    }
    
    if (QuestionInt == 1055){
        ReturnString= @"Economic mobilization of home front";
        //
        
        AnswerString = @"The continuing of each country’s own economy during the time of warfare and battles. New labor laws were set and women often replaced men as males had to serve time in military during the World Wars.";
        //
    }
    
    if (QuestionInt == 1056){
        ReturnString= @"Women in the workplace";
        //
        
        AnswerString = @"Women took men’s place in jobs during wartime giving them more rights. ";
        //
    }
    
    if (QuestionInt == 1057){
        ReturnString= @"Women and the vote";
        //
        
        AnswerString = @"Effect of WWI.";
        //
    }
    
    if (QuestionInt == 1058){
        ReturnString= @"Woodrow Wilson";
        //
        
        AnswerString = @"US President. Created 14 points. Wanted to make world “safe for democracy”.";
        //
    }
    
    if (QuestionInt == 1059){
        ReturnString= @"Fourteen Points";
        //
        
        AnswerString = @"Created by Woodrow Wilson during the Paris Peace Conference. (1. end to secret treaties, 2. freedom of the seas, 3. arms reduction, 4. decolonization, 5. self-determination, 6.League of Nations-for disputes). ";
        //
    }
    
    if (QuestionInt == 1060){
        ReturnString= @"War guilt clause";
        //
        
        AnswerString = @"During Treaty of Versailles. Said Germany must accept full blame (article 231).";
        //
    }
    
    if (QuestionInt == 1061){
        ReturnString= @"Totalitarianism";
        //
        
        AnswerString = @"New form of gov’t created during the interwar years in Italy. Uses modern tech, bureaucracy to control everyone, imposed censorship, controlled culture, put dissidents in prison, propaganda to create cult of personality. ";
        //
    }
    
    if (QuestionInt == 1062){
        ReturnString= @"February Revolution";
        //
        
        AnswerString = @"Caused by dissatisfaction with the way the country was being run. Transfer of power from the Tsar.";
        //
    }
    
    if (QuestionInt == 1063){
        ReturnString= @"Provisional Government";
        //
        
        AnswerString = @"Shared power with local soviets thus ineffective during communist rule in the soviet union.";
        //
    }
    
    if (QuestionInt == 1064){
        ReturnString= @"October Revolution";
        //
        
        AnswerString = @"Brought the Bolsheviks to power.";
        //
    }
    
    if (QuestionInt == 1065){
        ReturnString= @"Leon Trotsky";
        //
        
        AnswerString = @"Expelled by Stalin; disciple of Marx; friend of Bolshevik; organized the victorious Red Army;";
        //
    }
    
    if (QuestionInt == 1066){
        ReturnString= @"Joseph Stalin";
        //
        
        AnswerString = @"General Secretary of communist party; premier of the USSR; rule marked by: forced collectivization of agriculture; policy of industrialization; victorious and devastating role for the soviets during WWII.";
        //
    }
    
    if (QuestionInt == 1067){
        ReturnString= @"Great Purges";
        //
        
        AnswerString = @"Expulsion/execution of rivals when Stalin became paranoid. Negative of collectivization.";
        //
    }
    
    if (QuestionInt == 1068){
        ReturnString= @"Gulags";
        //
        
        AnswerString = @"Work camps where perceived dissidents sent. Negative of collectivization during Stalin’s rule. ";
        //
    }
    
    if (QuestionInt == 1069){
        ReturnString= @"Benito Mussolini";
        //
        
        AnswerString = @"Fascist leader in Italy. Anti-communist";
        //
    }
    
    if (QuestionInt == 1070){
        ReturnString= @"Italian Fascist Party";
        //
        
        AnswerString = @"Formed in 1991; held a majority of seats during elections during the 90s. as a result of the fascist movement, freedom of assembly and thinking were wiped out in Italy. ";
        //
    }
    
    if (QuestionInt == 1071){
        ReturnString= @"March on Rome";
        //
        
        AnswerString = @"The coup d'état by which Benito Mussolini came to power in Italy in late October 1922. ";
        //
    }
    
    if (QuestionInt == 1072){
        ReturnString= @"Weimar Republic";
        //
        
        AnswerString = @"The democratic government of Germany between the abdication of Kaiser Wilhelm II and the assumption of power by Adolf Hitler; it was unpopular because of its acceptance of the harsh provisions of the Treaty of Versailles";
        //
    }
    
    if (QuestionInt == 1073){
        ReturnString= @"Mein Kampf";
        //
        
        AnswerString = @"An autobiography written by Adolf Hitler. In it, Hitler outlines his plan for the revival of Germany from the losses of World War I and blames Germany's problems on capitalists and Jews. ";
        //
    }
    
    if (QuestionInt == 1074){
        ReturnString= @"Enabling Act";
        //
        
        AnswerString = @"Passed by Germany's parliament (the Reichstag) on March 23, 1933. It was the second major step after the Reichstag Fire Decree through which the Nazis obtained dictatorial powers using largely legal means. The Act enabled Chancellor Adolf Hitler and his cabinet to enact laws without the participation of the Reichstag.";
        //
    }
    
    if (QuestionInt == 1075){
        ReturnString= @"Nurember Laws";
        //
        
        AnswerString = @"Nazi laws that used a pseudoscientific basis for racial discrimination against Jews with the religious observance of a person's grandparents to determine their race.";
        //
    }
    
    if (QuestionInt == 1076){
        ReturnString= @"Young Turks";
        //
        
        AnswerString = @"Members of a Turkish reformist and nationalist political party active in the early 20th century.";
        //
    }
    
    if (QuestionInt == 1077){
        ReturnString= @"Mustafa Kemal Ataturk";
        //
        
        AnswerString = @"The military and political leader who brought about the end of the Ottoman Empire and the beginning of modern Turkey. He was promoted to general at the age of 35 and given command of the army near the Black Sea port of Samsun. He defied the Sultan's orders to quash opposition and instead built an army of his own to fight for independence from European control. The Sultan ordered his arrest, but 1919- 1923 he successfully fought off foreign armies as well as opposition forces from Turkey. On 23 October 1923 the national parliament declared the existence of the Republic of Turkey with Kemal as president. His fifteen years in office were turbulent -- he ruled as a dictator as he attempted political and social reforms -- ""father of the Turks.""";
        //
    }
    
    if (QuestionInt == 1078){
        ReturnString= @"Reza Shah Pahlavi";
        //
        
        AnswerString = @"Shah of Iran (1925–41). He began as an army officer and gained a reputation for great valor and leadership. He headed a coup in 1921 and became prime minister of the new regime in 1923. He negotiated the evacuation of the Russian troops and of the British forces stationed in Iran since World War I. Virtually a dictator, he deposed the last shah of the Qajar dynasty, and was proclaimed shah of Iran. Thus he founded the Pahlevi dynasty, and changed the name of Persia to Iran. Reza Shah introduced many reforms, reorganizing the army, government administration, and finances. He abolished all special rights granted to foreigners, thus gaining real independence for Iran. Under his rule the Trans-Iranian RR was built, the Univ. of Tehran was established, and industrialization was stepped-up.";
        //
    }
    
    if (QuestionInt == 1079){
        ReturnString= @"Balfour Declaration";
        //
        
        AnswerString = @"British minister Lord Balfour’s promise of support for the establishment of Jewish settlement in Palestine issued in 1917. ";
        //
    }
    
    if (QuestionInt == 1080){
        ReturnString= @"Ibn Saud";
        //
        
        AnswerString = @"Arab leader who was the founder and first king of Saudi Arabia (1932–1953).";
        //
    }
    
    if (QuestionInt == 1081){
        ReturnString= @"Sun Yat-sen";
        //
        
        AnswerString = @"Chinese politician who served as provisional president of the republic after the fall of the Manchu (1911–1912) and later led the opposition to Yuan Shigai.";
        //
    }
    
    if (QuestionInt == 1082){
        ReturnString= @"Yuan Shikai";
        //
        
        AnswerString = @"Chinese politician. Authorized by China's final imperial edict to create a republican government, he was named president but ruled as a dictator (1912–1916). ";
        //
    }
    
    if (QuestionInt == 1083){
        ReturnString= @"Chinese Communist Party";
        //
        
        AnswerString = @"Founded by Chinese Communist leader and theorist Mao Zedong… who led the Long March (1934–1935) and proclaimed the People's Republic of China in 1949. He then initiated the Great Leap Forward and the founding of communes. He continued as party chairman after 1959 and was a leading figure in the Cultural Revolution (1966–1969). ";
        //
    }
    
    if (QuestionInt == 1084){
        ReturnString= @"Chiang Kai-shek - Nanjing Republic";
        //
        
        AnswerString = @"A military officer who succeeded Sun Yat-sen as the leader of the Guomindang or Nationalist party in China in the mid 1920’s; became the most powerful leader in China in the early 1930’s , but his Nationalist forces were defeated and driven from China by the communist after World War II. ";
        //
    }
    
    if (QuestionInt == 1085){
        ReturnString= @"Emperor Taisho";
        //
        
        AnswerString = @"Emperor of Japan (1912–26). His given name was Yoshihito. The son of Mutsuhito, the Meiji emperor, he succeeded to the throne in 1912, but because of illness he played little part in governing the nation. His reign was characterized by democratization, friendly relations with the West, and economic growth. In 1921 Taishō was declared mentally incompetent and his son Hirohito was made regent.";
        //
    }
    
    if (QuestionInt == 1086){
        ReturnString= @"Long March";
        //
        
        AnswerString = @"Journey undertaken by Red Army in 1934-35 when Jiangxi base was encircled by the Nationalist army & Chiang Kai-Shek";
        //
    }
    
    if (QuestionInt == 1087){
        ReturnString= @"Kita Ikki";
        //
        
        AnswerString = @"Author/right-wing nationalist, “Asia for Asians” so kick out Europeans";
        //
    }
    
    if (QuestionInt == 1088){
        ReturnString= @"Japanese invasion of Manchuria";
        //
        
        AnswerString = @"Step towards war with military gov’t, renames it Manchuko, invading mainland China & commits atrocities";
        //
    }
    
    if (QuestionInt == 1089){
        ReturnString= @"Emperor Hirohito";
        //
        
        AnswerString = @"Figurehead of Japan, actually controlled by military when the war starts for Greater East Asia Co-Prosperity Sphere";
        //
    }
    if (QuestionInt == 1090){
        ReturnString= @"Hidiki Tojo";
        //
        
        AnswerString = @"40th prime minister of Japan, nationalist, general in Imperial Army, executed for war crimes";
        //
    }
    
    if (QuestionInt == 1091){
        ReturnString= @"Rape of Nanking";
        //
        
        AnswerString = @"One atrocity of the war, 200,000 ~ 300,000 women/children attacked";
        //
    }
    
    if (QuestionInt == 1092){
        ReturnString= @"Amritsar Massacre";
        //
        
        AnswerString = @"British fire on unarmed protesters, Gandhi goes to prison, British get more restrictive";
        //
    }
    
    if (QuestionInt == 1093){
        ReturnString= @"Jawaharlal Nehru";
        //
        
        AnswerString = @"Takes over Congress/movement, political leader of India, begins “Quit India” campaign so Brits leave";
        //
    }
    
    if (QuestionInt == 1094){
        ReturnString= @"Good Neighbor Policy";
        //
        
        AnswerString = @"Roosevelt reduces US role in Latin America, no troops";
        //
    }
    
    if (QuestionInt == 1095){
        ReturnString= @"US foreign policy - Latin America";
        //
        
        AnswerString = @"Latin America = US views L America as their sphere of influence, gained Puerto Rico/Virgin Islands, military present in Panama, sponsored dictators in Venezuela/Cuba";
        //
    }
    
    if (QuestionInt == 1096){
        ReturnString= @"Institutionalized Revolutionary Party";
        //
        
        AnswerString = @"Mexico, granted suffrage & right to strike, but actually oligarchy that chose president, upper class prospers, country modernizes, but middle class small & lower class huge";
        //
    }
    
    if (QuestionInt == 1097){
        ReturnString= @"Lazaro Cardenas";
        //
        
        AnswerString = @"President of Mexico 1934, redistributes acres with land reform, nationalized oil industry (took from US)";
        //
    }
    
    if (QuestionInt == 1098){
        ReturnString= @"Getulio Vargas";
        //
        
        AnswerString = @"Brazil, 1930 Vargas takes over, censored press, tortured political opponents, modernized Brazilian economy (diversifies, free from coffee)";
        //
    }
    
    if (QuestionInt == 1099){
        ReturnString= @"Hipolito Irigoyen";
        //
        
        AnswerString = @"Argentina, 1916 Radical party, reforms benefit peasants, labor unions become more active, overthrown in 1930";
        //
    }
    
    if (QuestionInt == 1100){
        ReturnString= @"Juan and Eva Peron";
        //
        
        AnswerString = @"Argentina, takes over after WWII, populist leader, wife popular, appeal to lower class, raised salaries of working class, gov’t controlled press, denied civil liberties";
        //
    }
    if (QuestionInt == 1097){
        ReturnString= @"Lazaro Cardenas";
        //
        
        AnswerString = @"President of Mexico 1934, redistributes acres with land reform, nationalized oil industry (took from US)";
        //
    }
    
    if (QuestionInt == 1098){
        ReturnString= @"Getulio Vargas";
        //
        
        AnswerString = @"Brazil, 1930 Vargas takes over, censored press, tortured political opponents, modernized Brazilian economy (diversifies, free from coffee)";
        //
    }
    
    if (QuestionInt == 1099){
        ReturnString= @"Hipolito Irigoyen";
        //
        
        AnswerString = @"Argentina, 1916 Radical party, reforms benefit peasants, labor unions become more active, overthrown in 1930";
        //
    }
    
    if (QuestionInt == 1100){
        ReturnString= @"Juan and Eva Peron";
        //
        
        AnswerString = @"Argentina, takes over after WWII, populist leader, wife popular, appeal to lower class, raised salaries of working class, gov’t controlled press, denied civil liberties";
        //
    }
    if (QuestionInt == 1101){
        ReturnString= @"Occupation of Rhineland";
        //
        
        AnswerString = @"Hitler takes back land given away by Versailles";
        //
    }
    if (QuestionInt == 1102){
        ReturnString= @"Pastafarianism";
        //
        
        AnswerString = @"Religion that believes a Pasta Monster to be god, relgion in seen as a parody religion and generally is not seen as a ""Real Religion""";
        //
    }
    if (QuestionInt == 1103){
        ReturnString= @"Rastafarianism";
        //
        
        AnswerString = @"Young religion founded by Marcus Garvey in 1930, it predicted there to be a black messiah in Africa. Popular in Jamica, the religion advocates the use of marijuana in religious practices";
        //
    }
    if (QuestionInt == 1104){
        ReturnString= @"The Black Hand";
        //
        
        AnswerString = @"Also known of the ""Unifaction of Death"" Formed 9th of May 1911, ";
        //
    }
    //Important People Section : Scintists, Authors, Artists, Politicans, etc.

}

-(void)ChapterTerms{
    if (ChapterQuestionInt == 1){
        ReturnString= @"Protestant Reformation";
        //
        
        AnswerString = @"A religious movement of the 16th century that began as an attempt to reform the Roman Catholic Church and resulted in the creation of Protestant churches";
        //
    }
    if (ChapterQuestionInt == 2){
        ReturnString= @"Catholic Counter-Reformation";
        //
        
        AnswerString = @"The Catholic Church's response to the Protestant Reformation in which it tried to reform itself.";
        //
    }
    
    if (ChapterQuestionInt == 3){
        ReturnString= @"Taki Onqoy";
        //
        
        AnswerString = @"""dancing sickness"" a religious revival movement in central Peru in the 1560's whose members preached the imminent destruction of Christianity and of the Europeans in favor of a renewed Andean golden age.";
        //
    }
    
    if (ChapterQuestionInt == 4){
        ReturnString= @"Jesuits in China";
        //
        
        AnswerString = @"Missionaries from Europe that tried to convert the Chinese to Roman Catholicism and took advantage of China's interest in technology to convert them";
        //
    }
    
    if (ChapterQuestionInt == 5){
        ReturnString= @"Wahhabi Islam";
        //
        
        AnswerString = @"Major Islamic movement led by the Muslim theologian Abd al Wahhab (1703-1792) that advocated an austere lifestyle and strict adherence to the sharia or Islamic law";
        //
    }
    
    if (ChapterQuestionInt == 6){
        ReturnString= @"Wang Yangmin";
        //
        
        AnswerString = @"Prominent Chinese philosopher (1472-1529) who argued that it was possible to achieve a virtuous life by introspection without the extensive education of traditional Confuciansim";
        //
    }
    
    if (ChapterQuestionInt == 7){
        ReturnString= @"Kaozheng";
        //
        
        AnswerString = @"A notion of ""researched based evidence"" that occurred in China as a foil to Neo-Confucian orthodoxy";
        //
    }
    
    if (ChapterQuestionInt == 8){
        ReturnString= @"Mirabai";
        //
        
        AnswerString = @"One of India's most beloved bhakti poets (1498-1547), She helped break down the barriers of caste and tradition.";
        //
    }
    
    if (ChapterQuestionInt == 9){
        ReturnString= @"Sikhism";
        //
        
        AnswerString = @"The doctrines of a monotheistic religion founded in northern India in the 16th century by Guru Nanak and combining elements of Hinduism and Islam";
        //
    }
    
    if (ChapterQuestionInt == 10){
        ReturnString= @"Copernicus";
        //
        
        AnswerString = @"Polish astronomer who produced a workable model of the solar system with the sun in the center (1473-1543)";
        //
    }
    
    if (ChapterQuestionInt == 11){
        ReturnString= @"Newton";
        //
        
        AnswerString = @"English mathematician and physicist";
        //
    }
    
    if (ChapterQuestionInt == 12){
        ReturnString= @"European Enlightenment";
        //
        
        AnswerString = @"18th century philosophical movement that proposed individual self-interest";
        //
    }
    
    if (ChapterQuestionInt == 13){
        ReturnString= @"Voltaire";
        //
        
        AnswerString = @"French writer who was the embodiment of 18th century Enlightenment (1694-1778)";
        //
    }
    
    if (ChapterQuestionInt == 14){
        ReturnString= @"Condorcet and the idea of progress";
        //
        
        AnswerString = @"The Marquis de Condorcet (1743-1794) was a French philosopher and political scientist who argued that human affairs were moving into an era of near infinite improvability, with slavery, racism, tyranny, and other human trials swept away by the triumph of reason";
        //
    }
    
    if (ChapterQuestionInt == 15){
        ReturnString= @"North American Revolution";
        //
        
        AnswerString = @"This was the successful rebellion where North American colonists (The East Coast of the US) rebelled against the British for a series of reasons. They taxed without representation and implemented outrageous acts such as the sugar or tea act. This led to the Boston Tea Party and the whole revolution (1775-1787) replaced North American monarchy with republican government. Being the first revolution of the era and general area, it became the influence for other Atlantic revolutions. (Fight for Liberty)";
        //
    }
    
    if (ChapterQuestionInt == 16){
        ReturnString= @"French Revolution";
        //
        
        AnswerString = @"This revolution (1789-1799) involved the uprising of a group of people, primarily the Third Estate (National Assembly) of the Estates General that ended the French monarchy. It was carried out in result of the American Revolution and sought for more human rights and equality. In order for the French monarchy to be fully taken out, Louis XVI and his wife, Marie Antoinette were beheaded. (Fight against Poverty)";
        //
    }
    
    if (ChapterQuestionInt == 17){
        ReturnString= @"Declaration of the Rights of Man and Citizen";
        //
        
        AnswerString = @"Shortly following the creation of the National Assembly, this Declaration was drawn up by the Assembly and declared that ""men are born and remain free and equal in rights."" This, in part of the Third Estate speaking out, sparked the French Revolution and radicalized many of the participants in the National Assembly";
        //
    }
    
    if (ChapterQuestionInt == 18){
        ReturnString= @"Napoleon Bonaparte";
        //
        
        AnswerString = @"This rather short French man overthrew the French Directory in 1799 thus crowning the French emperor in 1804. He ruled from 1799 to 1814 and is credited with taming the revolution and preserving civil equality, a secular law code, religious freedom, and promotion by merit. National resistance from Russia and Britain brought him and his empire down by 1815. Shoutout to PimpinMagnolia.";
        //
    }
    
    if (ChapterQuestionInt == 19){
        ReturnString= @"Haitian Revolution";
        //
        
        AnswerString = @"This revolution, an echo of the American and French Revolutions, lasted from 1791 to 1804. This was the first successful slave rebellion in history and allowed for the only independent black state that arose from a slave revolution. Before the revolution, this was a French colony named Saint Domingue. The revolution was started primarily by a rumor that the French king had already declared an end to slavery and the French revolution itself. (Fight against Slavery)";
        //
    }
    
    if (ChapterQuestionInt == 20){
        ReturnString= @"Spanish American Revolutions";
        //
        
        AnswerString = @"Spanish American Revolutions This revolution, an echo of the previous primary three Atlantic revolutions, took place in Central and South America by colonists. Here, the white population was much outnumbered by the number of Natives, Africans, and mixed peoples. Since the people of Spain and Portugal ruled, the colonists here had a much like situation with Britain in North America. Thus, they launched these revolutions against the leaders from 1810 to 1825. (Fight for Independence)";
        //
    }
    
    if (ChapterQuestionInt == 21){
        ReturnString= @"Abolitionist Movement";
        //
        
        AnswerString = @"This term refers to the movement that concentrated on the freeing of slaves (in the US). This is where secular, religious, economic, and political views that showed questioning came into action. This movement brought pressures on many governments to shut down slave trade and slavery itself. Regardless, people continued to be involved in slavery under the radar until it slowed down universally during the 19th century.";
        //
    }
    
    if (ChapterQuestionInt == 22){
        ReturnString= @"Nationalism";
        //
        
        AnswerString = @"The notion that created an attachment between the citizen and the country. The printing and publishing industry at the time helped contribute to this by standardizing a variety of dialects which allowed a growing reading public to identify themselves as a common linguistic group or a nation. Beyond that, it proved to be an important and strong idea that inspired political unifications, strives for independence, increased awareness, or even a diaspora. On a final note, this notion set forth rivalries that made regions compete to be the better nation.";
        //
    }
    
    if (ChapterQuestionInt == 23){
        ReturnString= @"Vindication of the Right of Woman";
        //
        
        AnswerString = @"This early expression of a feminist consciousness written by the writer Mary Wollstonecraft in 1792, was stimulated by the French Revolution. She wrote the book as a response to French diplomat Charles Talleyrand, who had recently advocated a very limited and domestic education for women.";
        //
    }
    
    if (ChapterQuestionInt == 24){
        ReturnString= @"Maternal Feminism";
        //
        
        AnswerString = @"This term states that women should have equality due to their distinctive role as mothers. It is said that women, being the people to watch over the futures of their children, should have the right to intervene with acts in both civil and political life. Thus, the advocates and supporters of this idea believed that women should be able to vote for what they believe would best benefit their children.";
        //
    }
    
    if (ChapterQuestionInt == 25){
        ReturnString= @"Elizabeth Cady Stanton";
        //
        
        AnswerString = @"This lady, a leading women in the feminist movement in the US, had attended the first women's rights conference in NY, in 1848. There, she paraphrased the Declaration of Independence slightly to include women and also wrote the Women's Bible (which eliminated offensive parts) creating more followers.";
        //
    }
    
    if (ChapterQuestionInt == 26){
        ReturnString= @"Steam Engine";
        //
        
        AnswerString = @"1750-1914 : Mechanical device in which the steam from heated water builds up pressure to drive a piston, rather than relying on human or animal muscle power; the introduction of the steam engine allowed a hitherto unimagined increased in productivity and made the Industrial Revolution possible; it provided an inanimate and almost limitless source of power beyond that of wind, water or muscle and could be used to drive any number of machines as well as locomotives and oceangoing ships";
        //
    }
    
    if (ChapterQuestionInt == 27){
        ReturnString= @"Indian Cotton Textiles";
        //
        
        AnswerString = @"1750-1914 : For much of the eighteenth century, well-made and inexpensive cotton textiles from India flooded Western markets; the competition stimulated the British textile industry to industrialize, which led to the eventual destruction of the Indian textile market both in Europe and in India. were certainly one factory driving the innovation in the British textile industry.";
        //
    }
    
    if (ChapterQuestionInt == 28){
        ReturnString= @"British Royal Society";
        //
        
        AnswerString = @"1750-1914 : Association of scientists established in England in 1660 that was dedicated to the promotion of ""useful knowledge"". They are an association of natural philosophers (scientists) to this end, it established Mechanics libraries published broadsheets and pamphlets on recent scientific advanced and held frequent public lectures and demonstrations. The integration of science and technology became widespread and permanent after 1850, but for a century before, it was largely a British phenomenon";
        //
    }
    
    if (ChapterQuestionInt == 29){
        ReturnString= @"Middle-Class Values";
        //
        
        AnswerString = @"1750-1914 : Belief system typical of the middle class that developed in Britain in the nineteenth century; it emphasize thrift, hard work, rigid moral behavior, cleanliness and ""respectability"". All of which characterized the middle class-culture. The central value of that culture was the part of ""respectability"" a term that combined notions of social status and virtuous behavior. Nowhere were these values more effectively displayed than in the Scotsman Samuel Smile's famous book Self-Help.";
        //
    }
    
    if (ChapterQuestionInt == 30){
        ReturnString= @"Lower-Middle Class";
        //
        
        AnswerString = @"1750-1914 : Social stratum that developed in Britain in the nineteenth century and that consisted of people employed in the service sector as clerks, salespeople, secretaries, police officers, and the like; by 1900, this group compromised about 20 percent of Britain's population. As Britain's industrial economy matured it gave rise to this class the people apart of it where the workers like clerks salespeople, hotel staff, secretaries, police officers ect. By the end of the century this class represented 20% of Britain's population, this also brought new employment options for women.";
        //
    }
    
    if (ChapterQuestionInt == 31){
        ReturnString= @"Karl Marx";
        //
        
        AnswerString = @"750-1914 : The most influential proponent of socialism, Marx (1818-1883) was a German expatriate in England who advocated working-class revolution as the key to creating an ideal communist future. He was German by birth but spent most of his life in England, where he witnessed the brutal conditions of Britain's Industrial Revolution and wrote voluminously about history and economics. His probing analysis led him to the conclusion that industrial capitalism was an inherently unstable system, doomed collapse in a revolutionary upheaval that would give birth to a classless socialist society, thus ending forever the ancient conflict between rich and poor";
        //
    }
    
    if (ChapterQuestionInt == 32){
        ReturnString= @"Labour Party";
        //
        
        AnswerString = @"1750-1914 : British working-class political party established in the 1890s and dedicated to reforms and a peaceful transition to socialism, in time providing a viable alternative to the revolutionary emphasis of Marxism. It advocated a reformist program and peaceful democratic transition to socialism, largely rejecting the class struggle and revolutionary emphasis of classical Marxism.";
        //
    }
    
    if (ChapterQuestionInt == 33){
        ReturnString= @"Proletariat";
        //
        
        AnswerString = @"1750-1914 : Term that Karl Marx used to describe the industrial working class; originally used in ancient Rome to describe the poorest part of the urban population. Marx has expected industrial capitalist societies to polarize into a small wealthy class and a huge increasingly impoverished..";
        //
    }
    
    if (ChapterQuestionInt == 34){
        ReturnString= @"Socialism in the United States";
        //
        
        AnswerString = @"1750-1914 : Fairly minor political movement in the United States, at its height in 1912 gaining 6 percent of the vote for its presidential candidate";
        //
    }
    
    if (ChapterQuestionInt == 35){
        ReturnString= @"Progressives";
        //
        
        AnswerString = @"1750-1914 : American political movement in the period around 1900 that advocated reform measures to correct the ills of industrialization";
        //
    }
    
    if (ChapterQuestionInt == 36){
        ReturnString= @"Russian Revolution of 1905";
        //
        
        AnswerString = @"1750-1914 : Spontaneous rebellion that erupted in Russia after the country's defeat at the hands of Japan in1905; the revolution was suppressed, but it forced the government to make substantial reforms";
        //
    }
    
    if (ChapterQuestionInt == 37){
        ReturnString= @"Caudillos";
        //
        
        AnswerString = @"1750-1914 : A military strongman who seized control of a government in nineteenth-century Latin America";
        //
    }
    
    if (ChapterQuestionInt == 38){
        ReturnString= @"Latin America Export Boom";
        //
        
        AnswerString = @"1750-1914 : Large-scale increase in Latin America exports (mostly raw materials and foodstuffs) to industrializing countries in the second half of the nineteenth century, made possible by major improvements in shipping; the boom mostly benefited the upper and middle classes";
        //
    }
    
    if (ChapterQuestionInt == 39){
        ReturnString= @"Mexican Revolution";
        //
        
        AnswerString = @"1750-1914 : Long and bloody war (1911-1920) in which Mexican reformers from the middle class joined with workers and peasants to overthrow the dictator Porfirio Diaz and create a new, much more democratic political order";
        //
    }
    
    if (ChapterQuestionInt == 40){
        ReturnString= @"Dependent Development";
        //
        
        AnswerString = @"1750-1914 : Term used to describe Latin America's economic growth in the nineteenth century, which was largely financed by foreign capital and dependent on European and North American prosperity and decisions";
        //
    }
    
    if (ChapterQuestionInt == 41){
        ReturnString= @"Social Darwinism";
        //
        
        AnswerString = @"The belief of survival of the fittest in the current social and economic struggle.";
        //
    }
    if (ChapterQuestionInt == 42){
        ReturnString= @"Taiping Uprising";
        //
        
        AnswerString = @"Peasant rebellions in China in between 1850 and 1864 that devastated Chinas economy and may have weakened it for interaction with Britain.";
        //
    }
    
    if (ChapterQuestionInt == 43){
        ReturnString= @"Opium Wars";
        //
        
        AnswerString = @"War between Japan and China over the drug opium as Britain wanted to trade Opium for Chinese silver but China wanted to rid the country of opium as it was weakening the economy and people of China. It was also smuggled in which made it hard for the Chinese officials to tax it.";
        //
    }
    
    if (ChapterQuestionInt == 44){
        ReturnString= @"Unequal treaties";
        //
        
        AnswerString = @"The treaties that ended the Opium wars between the western powers and China were usually unequal because they favored the western powers and didn't give Chinas economy a chance to recover from the Opium devastation";
        //
    }
    
    if (ChapterQuestionInt == 45){
        ReturnString= @"Self-strengthening movement";
        //
        
        AnswerString = @"A movement in China in the 1900's as an effort to come back as a global power after the opium wars.";
        //
    }
    
    if (ChapterQuestionInt == 46){
        ReturnString= @"Boxer Uprising";
        //
        
        AnswerString = @"A movement in China to keep foreigners out of the country as they were what created the initial problem during the opium wars.";
        //
    }
    
    if (ChapterQuestionInt == 47){
        ReturnString= @"China,1911";
        //
        
        AnswerString = @"After revolutions in China, China's imperial order officially collapsed. This collapse was mostly created by chinas problems for the past half century.(Opium Wars etc).";
        //
    }
    
    if (ChapterQuestionInt == 48){
        ReturnString= @"""The sick man of europe""";
        //
        
        AnswerString = @"Nickname given to the Ottoman Empire because of the frequent ethnic revolts and the rest of Europe picking away at it";
        //
    }
    
    if (ChapterQuestionInt == 49){
        ReturnString= @"Tanzimat";
        //
        
        AnswerString = @"A time in the Ottoman Empire that helped reform from a religious ruled empire to a more successful bureaucracy. This was led by Ottoman Rulers.";
        //
    }
    
    if (ChapterQuestionInt == 50){
        ReturnString= @"Young Ottomans";
        //
        
        AnswerString = @"A movement led by the Young Ottoman turks to create reforms and a sense of National Identity.";
        //
    }
    
    if (ChapterQuestionInt == 51){
        ReturnString= @"Sultan Abd al-Hamid II";
        //
        
        AnswerString = @"A Ottoman ruler who suppressed those who wanted to reform and create new ideals in Ottoman society. Re-introduced the old practice of distinguishing in between muslims and Non-Muslims.";
        //
    }
    
    if (ChapterQuestionInt == 52){
        ReturnString= @"Young Turks";
        //
        
        AnswerString = @"Young rebellious peoples who forced the government to reform in 1908";
        //
    }
    
    if (ChapterQuestionInt == 53){
        ReturnString= @"Informal empires";
        //
        
        AnswerString = @"A way of rule that wasn't ""formally"" established. An example would be Britain not dominating China but actually controlling all aspects of Chinese life as china was weak and couldn't come back from loses created in the opium wars until 1999.";
        //
    }
    
    if (ChapterQuestionInt == 54){
        ReturnString= @"Meiji restoration";
        //
        
        AnswerString = @"Meiji Japans's new ruler created a restoration that would destroy the shogunate reform the government built on the foundation of imperial rule and being cautious of other countries taking over Japan.";
        //
    }
    
    if (ChapterQuestionInt == 55){
        ReturnString= @"Russo-Japanese war";
        //
        
        AnswerString = @"Russia and Japan were fighting for control of Korea and Manchuria. No winner was decided so representatives from both countries were sent to the U.S. to create a peace treaty that would win Theodore Roosevelt a noble peace prize.";
        //
    }
    
    if (ChapterQuestionInt == 56){
        ReturnString= @"Scramble for Africa";
        //
        
        AnswerString = @"1880s~1890s; wave of European colonialism in the African continent; dominated by Britain in the east and France in the northwest; also occupied by other European countries like Germany and Belgium";
        //
    }
    
    if (ChapterQuestionInt == 57){
        ReturnString= @"Indian Rebellion";
        //
        
        AnswerString = @"1857-1858; sparked by cultural conflicts between the British and the highly contrasting Indian Hindus; Indian Mutiny, Sepoy Mutiny; angered the British causing a direct and oppressive rule to be cast over the Indian subcontinent";
        //
    }
    if (ChapterQuestionInt == 58){
        ReturnString= @"Congo Free State/ Leopold II";
        //
        
        AnswerString = @"The Congo became King Leopold II of Belgium's private property under his direct rule; extracted wealth in the form of products like rubber, copper; worst abuse of Europe's Second Wave colonization";
        //
    }
    
    if (ChapterQuestionInt == 59){
        ReturnString= @"Cultivation System";
        //
        
        AnswerString = @"19th Century; Dutch Government Policy; At least 20% of products from the lowly farmers were to be sold to government officials so that they could heavily mark up the prices for optimal profit";
        //
    }
    
    if (ChapterQuestionInt == 60){
        ReturnString= @"Cash Crop Agriculture";
        //
        
        AnswerString = @"Farming operations designed solely for selling and profit making purposes; as opposed to subsistence farming";
        //
    }
    
    if (ChapterQuestionInt == 61){
        ReturnString= @"Western-Educated Elite";
        //
        
        AnswerString = @"Gained the most benefit from western colonization; Asia and Africa; followed western customs to show approval of Europeanism; grew discontent when they were unable to gain equal status to the Europeans";
        //
    }
    
    if (ChapterQuestionInt == 62){
        ReturnString= @"Africanization of Christianity";
        //
        
        AnswerString = @"Similar to syncretic religions; incorporation of Christianity to local beliefs such as animism and shamanism";
        //
    }
    
    if (ChapterQuestionInt == 63){
        ReturnString= @"Swami Vivekananda";
        //
        
        AnswerString = @"1863-1902; Indian Hindu; spoke at the World Parliament of Religions at Chicago, Illinois; Ramakrishna Mission; spread Hindu teachings to America";
        //
    }
    
    if (ChapterQuestionInt == 64){
        ReturnString= @"European Racism";
        //
        
        AnswerString = @"A sense of European supremacy; subject to much controversy as to it's origins; sparked by earlier movements of social darwinism";
        //
    }
    
    if (ChapterQuestionInt == 65){
        ReturnString= @"Edward Blyden";
        //
        
        AnswerString = @"1832-1912; father of Pan-Africanism; African who sought to find equality with all races of the world; every race had a role in the grand plot of world civilization";
        //
    }
    
    if (ChapterQuestionInt == 66){
        ReturnString= @"Colonial Tribalism";
        //
        
        AnswerString = @"Europeans would invent imaginary tribes in European African colonies to assert their supremacy";
        //
    }
    
    if (ChapterQuestionInt == 67){
        ReturnString= @"World War I";
        //
        
        AnswerString = @"(1914-1918) A war involving powers from around the world but mostly focusing on a conflict in between the alliance of Great Britain, France, Italy,Russia, and the United States and the Alliance of Germany,Hungary, Austria, Turkey, and Bulgaria. This war ended with the treaty of Versailles in 1919.";
        //
    }
    
    if (ChapterQuestionInt == 68){
        ReturnString= @"Treaty of Versailles";
        //
        
        AnswerString = @"The peace treaty between Germany and the Allied nations in 1919 that essentially blamed the war on Germany and created heavy reparations and large territorial loses to Germany in a poor economy and an unstable country";
        //
    }
    
    if (ChapterQuestionInt == 69){
        ReturnString= @"Woodrow Wilson/Fourteen Points";
        //
        
        AnswerString = @"President Wilsons thoughts on how the war should have been ended and if Germany and the creation of the League of Nations.";
        //
    }
    
    if (ChapterQuestionInt == 70){
        ReturnString= @"Great Depression";
        //
        
        AnswerString = @"A Worldwide period of economic hardship that began in the 1920's and carried into the 1930's in many parts of the world following World War I.";
        //
    }
    
    if (ChapterQuestionInt == 71){
        ReturnString= @"New Deal";
        //
        
        AnswerString = @"President Roosevelt's plan to relieve the depression in the U.S. This was also a turning point as it increased the governments involvement with the society in the U.S";
        //
    }
    
    if (ChapterQuestionInt == 72){
        ReturnString= @"Fascism";
        //
        
        AnswerString = @"A political movement that is characterized by extreme nationalism, one party rule, and denial to individual rights. This form of government was usually headed by a dictator of some sort";
        //
    }
    
    if (ChapterQuestionInt == 73){
        ReturnString= @"Mussolini";
        //
        
        AnswerString = @"The leader of Fascist Italy for 21 years until he was killed by his people after leading them to defeat in WWII. Had ambitions to build Italy into an empire";
        //
    }
    
    if (ChapterQuestionInt == 74){
        ReturnString= @"Nazi Germany";
        //
        
        AnswerString = @"The Socialist party led by Hitler who later led a nation to exterminate millions in concentration camps. These are known as some of the worst crimes ever committed by a nation";
        //
    }
    
    if (ChapterQuestionInt == 75){
        ReturnString= @"Hitler";
        //
        
        AnswerString = @"The leader of Nazi Germany who brought the country together at first but committed crimes against human rights by killing off millions in concentration camps across Europe. Led Germany into a World War that was in between the Axis powers of Germany, Italy, and Japan and the Allied force.";
        //
    }
    
    if (ChapterQuestionInt == 76){
        ReturnString= @"Revolutionary Right";
        //
        
        AnswerString = @"A movement in Japan devoted to extreme Nationalism and expansion. Brought back the old ways of supreme rule by an Emperor. Lasted from 1930-1945";
        //
    }
    
    if (ChapterQuestionInt == 77){
        ReturnString= @"World War II in Asia";
        //
        
        AnswerString = @"An effort for Japan to expand its boundaries in Asia brought war in between Japan and countries trying to halt its expansion. The Japanese also brought America into the war officially after the bombing of pearl harbor.";
        //
    }
    if (ChapterQuestionInt == 78){
        ReturnString= @"World War II in Europe";
        //
        
        AnswerString = @"When Germany began to expand in Europe war broke out in between Germany and those holding their territory such as Britain,Russia,Poland,etc. The German push was not stopped for several years in Europe and was held on the lines of of France and Britain for a long period of the war.";
        //
    }
    
    if (ChapterQuestionInt == 79){
        ReturnString= @"Total War";
        //
        
        AnswerString = @"World War II effected not only those in uniform but those at home or citizens of the countries. For example German Bombs dropped on Britain caused many British citizens to hide in bomb shelter and by ready at any moment for an attack. And in the United States all efforts were focused on war in the years of World War II including changing factories into weapons or munitions factories for the war effort";
        //
    }
    
    if (ChapterQuestionInt == 80){
        ReturnString= @"Holocaust";
        //
        
        AnswerString = @"The Nazi program during World War II that killed 6 million Jews and 8 million total of ""undesirables"" in an effort to create a purer human race";
        //
    }
    
    if (ChapterQuestionInt == 81){
        ReturnString= @"Marshall Plan";
        //
        
        AnswerString = @"A U.S. plan to help Europe recover in the period after the war";
        //
    }
    
    if (ChapterQuestionInt == 83){
        ReturnString= @"NATO";
        //
        
        AnswerString = @"A defense alliance formed between the nations of Western Europe and the United States in 1949.";
        //
    }
    
    if (ChapterQuestionInt == 84){
        ReturnString= @"Russian Revolution (1917)";
        //
        
        AnswerString = @"This revolution was seen to remove both Nicholas II and the Romanov Dynasty from their held power. It is seen that World War I was the catalyst for this revolution and was, in theory, led by ordinary soldiers. These people sought an end to the terrible war and despised their upper-class officials so they deserted in mass. At the same time, many trade unions were formed and soviets emerged to speak out for ordinary people. Peasants as well, seized landlords' estates and took over the land for themselves. Due to a terrible Provisional Government, new radical groups came to power, specifically the Bolsheviks. Altogether, Lenin came to power and ended the war for Russia. This revolution also officially claimed Russia as communist";
        //
    }
    
    if (ChapterQuestionInt == 85){
        ReturnString= @"Bolsheviks/Lenin";
        //
        
        AnswerString = @"This group was the most significant or influential socialist group following the Russian Revolution. As the leader, this man called for the dissolution of the Provisional Government and decided to share state power with the new Soviets. He felt that Russia was ready for a socialist revolution that could spark more revolutions in MDCs of Europe that would cause more communist ideas. Of course, the group and their leader carried out acts of harshness and violence in attempt to maintain their new socialist/politlca ideas";
        //
    }
    
    if (ChapterQuestionInt == 86){
        ReturnString= @"Guomindang";
        //
        
        AnswerString = @"This was a Nationalist Party that was the Chinese Communist Party's greatest opponent. They governed China after 1928 and was led by Chiang Kai-shek. His party promoted a measure of modern development, yet these were seen to be limited to the cities leaving rural areas impoverished. The base of support for this group was narrow and derived from urban elites, rural landlords, and Western powers";
        //
    }
    
    if (ChapterQuestionInt == 87){
        ReturnString= @"Chinese Revolution";
        //
        
        AnswerString = @"This revolution resulted in the triumphing of communism in China in 1949. It lasted several decades and was pretty different from its Russian counterpart. It was primarily a result of the CCP being found in 1921 since Marx's ideas were not known in China at the time. This group slowly developed over time contributing to the revolution. However, the peasants were not seen to rise up at the same time against the landlords. Instead, years of guerrilla warfare and such as well as efforts to empower women and a creation of a communist military force was seen as a part of this revolution as well. Altogether, foreign imperialism and peasant exploitation were addressed as China's major problems and expressed Chinese nationalism and a radical social change. Thus, this revolution was carried out";
        //
    }
    
    if (ChapterQuestionInt == 88){
        ReturnString= @"Mao Zedong";
        //
        
        AnswerString = @"This was the leader of the Chinese Communist Party.He was a son of a prosperous Chinese peasant family and a professional revolutionary since the early 1920s. Nowadays, China is seen to have a time in their history named after him such as Shang or Zhou Dynasty. It was partially because of this man that the Chinese Communist Party had its success";
        //
    }
    
    if (ChapterQuestionInt == 89){
        ReturnString= @"Building Socialism";
        //
        
        AnswerString = @"This growing idea meant first of all the modernization and industrialization of their backward societies. They embraced many of the material values of Western capitalist societies and were similar to the new nations of the twentieth century, all of which were seeking development";
        //
    }
    
    if (ChapterQuestionInt == 90){
        ReturnString= @"Stalin";
        //
        
        AnswerString = @"(1879-1953) This man was the ruler of the Soviet Union and made alliances with Adolf Hitler. He was also a Soviet statesman general secretary of the Communist Party of the former Soviet Union (1922-1953). In 1928, he launched a succession of five-year plans for rapid industrialization and the enforced collectivization of agriculture. His large-scale purges of the intelligentsia in the 1930s were equally ruthless";
        //
    }
    
    if (ChapterQuestionInt == 91){
        ReturnString= @"Zhenotdel";
        //
        
        AnswerString = @"Known as the Women's Department, this 1919 special organization created by the Soviet Union had radical leaders that were all women that pushed a decidedly feminist agenda in the 1920s. There were several conferences put together for women that taught women how to do normal day stuff that men did (with a more feminine twist) so that they could fully complete their process of creating a feminist agenda";
        //
    }
    
    if (ChapterQuestionInt == 92){
        ReturnString= @"Collectivization";
        //
        
        AnswerString = @"A generally peaceful process during the 1950s in China, this term owed much to the close relationship between the CCP and the peasantry. in this, the government forms collective farms in which there is no private ownership and the government collects from the farm to try to keep everyone balanced in society. By doing so, everyone, no matter how much they produced, ended up having as much as someone who produced much less than them";
        //
    }
    
    if (ChapterQuestionInt == 93){
        ReturnString= @"Cultural Revolution";
        //
        
        AnswerString = @"In the mid-1960s, this campaign was launched by Mao Zedong. It was designed to combat the capitalist tendencies that he believed had penetrated even the highest ranks of the Communist Party itself. In addition, this involved new policies to bring health care and education to the countryside and to reinvigorate earlier efforts at rural industrialization. Although not very successful, these were seen as Mao Zedong's primary attempts to rid China of the inequalities associated with China's modern development and partially the strive for socialist ides.";
        //
    }
    
    if (ChapterQuestionInt == 94){
        ReturnString= @"Great Purges/Terror";
        //
        
        AnswerString = @"In terms of the Soviet Union, the class struggle that continued and intensified as the triumph of socialism drew closer was seen to culminate in this term. Of the 1930s, this was a massive attempt to cleanse the Soviet Union of enemies of the people. Tons of people were executed during this time and tons more were forced to labor in the gulag.";
        //
    }
    
    if (ChapterQuestionInt == 95){
        ReturnString= @"Cuban Missile Crisis";
        //
        
        AnswerString = @"This event/standoff between the US and the SU in 1962 gave concrete expression to the arms race in nuclear weapons. They were fighting over Soviet deployment of nuclear missiles in Cuba. This whole confrontation ideally ended in a compromise in which the USSR removed its missiles in exchange for the US agreeing not to invade Cuba";
        //
    }
    
    if (ChapterQuestionInt == 96){
        ReturnString= @"Nikita Khrushchev";
        //
        
        AnswerString = @"This leader of the SU (1953-1964) was Joseph Stalin's successor. He is noted for shocking his country and communists everywhere in which he presented a devastating account of Stalin's crimes in a long speech delivered to a party congress in 1956";
        //
    }
    
    if (ChapterQuestionInt == 97){
        ReturnString= @"Mikhail Gorbachev";
        //
        
        AnswerString = @"This leader of the SU (1985-1991) attempted to reform the USSR which instead, ironically, led to its collapse on Christmas Day of 1991.Altogether, the communist era and cold war had collapsed";
        //
    }
    
    if (ChapterQuestionInt == 98){
        ReturnString= @"Deng Xiaoping";
        //
        
        AnswerString = @"As leader of China from 1976 to 1997, he tried to reform the dismantled communist elements of the Chinese economy. Known also as the ""paramount leader"", he was committed to ending the periodic upheavals of the Maoist era and aimed for political stability and economic growth. Many Western aspects were thus banned during this time. Unlike many of the previous leaders, this leader's economic reforms also included rural areas. As a whole,an essentially capitalist economy was restored with/by this man";
        //
    }
    
    if (ChapterQuestionInt == 99){
        ReturnString= @"Perestroika/Glasnost";
        //
        
        AnswerString = @"Meaning restructuring, this economic program was launched in 1987 by Mikhail Gorbachev and paralleled aspects of the Chinese approach by freeing state enterprises from the heavy hand of government regulation, permitting small-scale private businesses, offering opportunities for private farming, and cautiously welcoming foreign investments in joint enterprises. Also by Mikhail Gorbachev was the policy of openess which allowed greater cultural and intellectual freedom and ended most censorship of the media. Thus, the Soviet system was seen more insightly by the common media and people";
        //
    }
    if (ChapterQuestionInt == 100){
        ReturnString= @"Decolonization";
        //
        
        AnswerString = @"1914-Present : Process in which many African and Asian states won their independence from Western colonial rule, in most cases by negotiated settlement with gradual political reforms and a program of investment rather than through military confrontation";
        //
    }
    if (ChapterQuestionInt == 101){
        ReturnString= @"Indian National Congress";
        //
        
        AnswerString = @"1914-Present : Organization established in 1885 by Western-educated elite Indians in an effort to win a voice in governance of India; over time, the INC became a major popular movement that won India's independence from Britain";
        //
    }
    
    if (ChapterQuestionInt == 102){
        ReturnString= @"Mahatma Gandhi";
        //
        
        AnswerString = @"1914-Present : Usually referred to by his sobriquet ""Mahatma"" (Great Soul), Gandhi (1869-1948) was a political leader and the undoubted spiritual leader of the Indian drive or independence from Great Britain";
        //
    }
    
    if (ChapterQuestionInt == 103){
        ReturnString= @"Satyagraha";
        //
        
        AnswerString = @"1914-Present : Literally, ""truth force""; Mahatma Gandhi's political philosophy, which advocated confrontational but nonviolent political action";
        //
    }
    
    if (ChapterQuestionInt == 104){
        ReturnString= @"Muslim League";
        //
        
        AnswerString = @"1914-Present : The All-India Muslim League, created in 1906, was a response to the Indian national Congress in India's struggle for independance from Britain; the League's leader, Muhammad Ali Jinnah, argued that regions of India with a Muslim majority should form a separate state called Pakistan";
        //
    }
    
    if (ChapterQuestionInt == 105){
        ReturnString= @"Muhammad Ali Jinnah";
        //
        
        AnswerString = @"1914-Present : LEader of India's All India Muslim League and first president of the breakaway state of Pakistan (1876-1948)";
        //
    }
    
    if (ChapterQuestionInt == 106){
        ReturnString= @"African National Congress";
        //
        
        AnswerString = @"1914-Present : South African political party established in 1912 by elite Africans who sought to win full acceptance in colonial society; it only gradually became a popular movement that came to control the government in 1994";
        //
    }
    
    if (ChapterQuestionInt == 107){
        ReturnString= @"Nelson Mandela";
        //
        
        AnswerString = @"1914-Present : South African nationalist (b. 1918) and leader of the African National Congress who was imprisoned for twenty - seven years on charges of treason, sabotage and conspiracy to over through the apartheid government of South Africa; he was elected president of South Africa in 1994, four years after he was finally released from prison";
        //
    }
    
    if (ChapterQuestionInt == 108){
        ReturnString= @"Black Consciousness";
        //
        
        AnswerString = @"1914-Present : South African movement that sought to foster pride, unity and political awareness among the country's African majority and often resorted to violent protest against white minority rule";
        //
    }
    
    if (ChapterQuestionInt == 109){
        ReturnString= @"Soweto";
        //
        
        AnswerString = @"1914-Present : Impoverished black neighborhood outside Johannesburg, South Africa, and the site of a violent uprising in 1976 in which hundreds were killed; that rebellion began a series of violent protests and strikes that helped end apartheid";
        //
    }
    
    if (ChapterQuestionInt == 110){
        ReturnString= @"Democracy in Africa";
        AnswerString = @"1914-Present : A subject of debate among scholars, the democracies established in the wake of decolonization in Africa proved to be fragile and often fell to military coups or were taken over by single-party authoritarian systems; Africa's initial rejection of democracy has sometimes been taken as a sign that Africans were not ready for democratic politics or that traditional African culture did not support it";
        //
    }
    
    if (ChapterQuestionInt == 111){
        ReturnString= @"Economic Development";
        //
        
        AnswerString = @"1914-Present : A process of growth or increasing production and the distribution of the proceeds of that growth to raise living standards; nearly universal desire for economic development in the second half of the twentieth century reflected a cultural belief that poverty was no longer inevitable";
        //
    }
    
    if (ChapterQuestionInt == 112){
        ReturnString= @"Kemal Ataturk";
        //
        
        AnswerString = @"1914-Present : Founder and first president of the Republic of Turkey (1881 - 1938); as military commander and leader of the Turkish national movement, he made Turkey into a secular state";
        //
    }
    
    if (ChapterQuestionInt == 113){
        ReturnString= @"Ayatollah Khomeini";
        //
        
        AnswerString = @"1914-Present : Important Shia ayattolah (advanced scholar of Islamic law and religion) who became the leader of Iran's Islamic revolution and ruled Iran from 1979 until his death in 1989";
        //
    }
    //Chapters 1 - 15
    if (ChapterQuestionInt == 114){
        ReturnString= @"Paleolithic rock art";
        //
        
        AnswerString = @"Cave paintings in red, yellow, brown, and black; depicted humans and animals, handprints, abstract designs; thought to be religious practices or rite of passage";
        //
    }
    if (ChapterQuestionInt == 115){
        ReturnString= @"Venus figurines";
        //
        
        AnswerString = @"Depict female form with exaggerated breasts, buttocks, hips, and stomachs; found all over Europe; made from stone, antlers, mammoth tusks, and baked clay";
        //
    }
    if (ChapterQuestionInt == 116){
        ReturnString= @"Dreamtime";
        //
        
        AnswerString = @"Recounted beginning of life; creation of land; expressed in stories, extended ceremonies, rock art; everything was a footprint of ancient happenings like inhabitants to places and events";
        //
    }
    
    if (ChapterQuestionInt == 117){
        ReturnString= @"Clovis culture";
        //
        
        AnswerString = @"Hunters of very large mammals; ranged over huge areas; scattered all over Americas; 10900 years ago completely disappeared with extinction of large mammals";
        //
    }
    
    if (ChapterQuestionInt == 118){
        ReturnString= @"Megafaunal extinction";
        //
        
        AnswerString = @"Dying out of a number of large animal species, including the mammoth and several species of horses and camels, that occurred around 11,000-10,000 years ago, at the end of the Ice Age. The extinction may have been caused by excessive hunting or by the changing climate of the era";
        //
    }
    
    if (ChapterQuestionInt == 119){
        ReturnString= @"Austronesian migration";
        //
        
        AnswerString = @"First waterborne migration; covered entire Pacific basin including Madagascar; transported domesticated plants and animals";
        //
    }
    
    if (ChapterQuestionInt == 120){
        ReturnString= @"The original affluent society";
        //
        
        AnswerString = @"Hunting and gathering societies; they wanted and needed little; had a lot of leisure time";
        //
    }
    
    if (ChapterQuestionInt == 121){
        ReturnString= @"Shamans";
        //
        
        AnswerString = @"People believed to be especially skilled at dealing with the spirit world";
        //
    }
    
    if (ChapterQuestionInt == 122){
        ReturnString= @"Trance dance";
        //
        
        AnswerString = @"In San culture, a nightlong ritual held to activate a human being's inner spiritual potency (n/um) to counteract the evil influences of gods and ancestors. The practice was apparently common to the Khoisan people, of whom the Ju/'hoansi are a surviving remnant.";
        //
    }
    
    if (ChapterQuestionInt == 123){
        ReturnString= @"Paleolithic settling down";
        //
        
        AnswerString = @"One of the great turning points in human history as people went from being nomadic to establishing communities and provided the conditions for which the agricultural revolution could take place";
        //
    }
    
    if (ChapterQuestionInt == 124){
        ReturnString= @"San culture";
        //
        
        AnswerString = @"Hunting and gathering society; migrated frequently; equality (insulting the meat); trance dances; no difference in skills";
        //
    }
    
    if (ChapterQuestionInt == 125){
        ReturnString= @"Insulting the meat";
        //
        
        AnswerString = @"A San cultural practice meant to deflate pride that involved negative comments about the meat brought in by a hunter and the expectation that a successful hunter would disparage his own kill.";
        //
    }
    
    if (ChapterQuestionInt == 126){
        ReturnString= @"Chumash culture";
        //
        
        AnswerString = @"Were later post-Ice age Paleolithic people. They lived in a round, permanent, substantial houses covered by grass or reeds. They were advanced in the creation of Tomol canoes,pottery, market economy, and class distinctions.";
        //
    }
    
    if (ChapterQuestionInt == 127){
        ReturnString= @"Brotherhood of the tomol";
        //
        
        AnswerString = @"A prestigious craft guild that monopolized the building and ownership of large oceangoing canoes, or tomols, among the Chumash people (located in what is now southern California).";
        //
    }
    
    if (ChapterQuestionInt == 128){
        ReturnString= @"End of Last Ice Age";
        //
        
        AnswerString = @"A process of global warming that began some 16,000 years ago. By about 11,000 years ago, the Ice Age was over, and climatic conditions similar to those of our own time generally prevailed. The Agricultural Revolution coincided with the last Ice Age.";
        //
    }
    
    if (ChapterQuestionInt == 129){
        ReturnString= @"Broad Spectrum Diet";
        //
        
        AnswerString = @"Archeologists' term for the diet of gathering and hunting societies, which included a wide array of plants and animals.";
        //
    }
    
    if (ChapterQuestionInt == 130){
        ReturnString= @"Fertile Crescent";
        //
        
        AnswerString = @"The area sometimes known as Southwest Asia, consisting of present- day Iraq, Syria, Israel/Palestine, and Southern Turkey.";
        //
    }
    
    if (ChapterQuestionInt == 131){
        ReturnString= @"Teosinte";
        //
        
        AnswerString = @"A grass from which modern maize/corn subsequently developed in a process of adaptation and ""genetic engineering"" over thousands of years.";
        //
    }
    
    if (ChapterQuestionInt == 132){
        ReturnString= @"Diffusion";
        //
        
        AnswerString = @"The gradual spread of agricultural techniques, and perhaps of the plants and the animals themselves, but without the extensive movement of agricultural people.";
        //
    }
    
    if (ChapterQuestionInt == 133){
        ReturnString= @"Bantu Migrations";
        //
        
        AnswerString = @"Beginning from what is now southern Nigeria or Cameroon around 3000 B.C.E., Bantu speaking people moved east and south over the next millennia.";
        //
    }
    
    if (ChapterQuestionInt == 134){
        ReturnString= @"Agricultural Revolution";
        //
        
        AnswerString = @"This is the transformation of human (and world) existence caused by the deliberate cultivation of particular plants and the deliberate taming and breeding of particular animals.";
        //
    }
    
    if (ChapterQuestionInt == 135){
        ReturnString= @"Secondary Products Revolution";
        //
        
        AnswerString = @"A further set of technological changes, beginning around 4000 B.C.E. These technological innovations involved new uses for domesticated animals, beyond their meat and hides. They learned to ride horses and camels and to hitch various animals to plows and carts.";
        //
    }
    
    if (ChapterQuestionInt == 136){
        ReturnString= @"Pastoral Societies";
        //
        
        AnswerString = @"A human society that relies on domesticated animals rather than plants as the main source of food.";
        //
    }
    
    if (ChapterQuestionInt == 137){
        ReturnString= @"Çatalhüyük";
        //
        
        AnswerString = @"A very early agricultural village in southern Turkey.";
        //
    }
    
    if (ChapterQuestionInt == 138){
        ReturnString= @"Stateless Societies";
        //
        
        AnswerString = @"Village-based agricultural societies, that function without a formal government.";
        //
    }
    
    if (ChapterQuestionInt == 139){
        ReturnString= @"Chiefdoms";
        //
        
        AnswerString = @"A societal group governed by a chief who typically relies on generosity, ritual status, or charisma rather than force to win obedience from the people.";
        //
    }
    
    if (ChapterQuestionInt == 140){
        ReturnString= @"Norte Chico/Caral";
        //
        
        AnswerString = @"Caral was the largest of 25 urban centers in the Norte Chico area.There is less evidence of economic specialization, economy was based of fishing of anchovies and sardines. These were apparently traded for cotton and food. People of Norte Chico did not develop pottery or writing and the cities also lacked defensive walls.";
        //
    }
    
    if (ChapterQuestionInt == 141){
        ReturnString= @"Indus Valley civilization";
        //
        
        AnswerString = @"Had elaborately planned out cities, twice the size of Texas and bigger than any other society. Irragated agriculture provided an ecomonic base and a written language provides evidence of a literate culture. There is little evidence of a political hierarchy unlike othersin the middle east.";
        //
    }
    
    if (ChapterQuestionInt == 142){
        ReturnString= @"Olmec civilization";
        //
        
        AnswerString = @"Took shape in S. Mexico. Based on agriculture. Known as the mother civilization of mezoamerica. many Olmec cultural patterns spread and became part of the Maya and Teotihuacàn civilizations.";
        //
    }
    
    if (ChapterQuestionInt == 143){
        ReturnString= @"Uruk";
        //
        
        AnswerString = @"Mesopotamia`s largest city. Pop. around 50,000.City`s center was a stepped pyramid (ziggurat), topped with a temple.";
        //
    }
    
    if (ChapterQuestionInt == 144){
        ReturnString= @"Mohenjo Daro/Harappa";
        //
        
        AnswerString = @"City that flourished on the banks of the Indus River with a pop. of about 40,000. Sister city of Mohenjo Daro was Harappa. Both had houses of 2-3 stories along with indoor plumbing. Beneath the gridlike streets ran a complex sewer system.";
        //
    }
    
    if (ChapterQuestionInt == 145){
        ReturnString= @"Code of Hammurabi";
        //
        
        AnswerString = @"282 laws enforced under Hammurabi's Rule in Babylon, it is one of the first examples of written law in the ancient civilizations.";
        //
    }
    
    if (ChapterQuestionInt == 146){
        ReturnString= @"Patriarchy";
        //
        
        AnswerString = @"Social organization in which a male is the head and title is traced through the male line.";
        //
    }
    
    if (ChapterQuestionInt == 147){
        ReturnString= @"Rise of state";
        //
        
        AnswerString = @"Organized around cities or larger territories, headed by kings who were advised by officials and priests. it replaced the kinship as the basic organization of society and gave far more authority than the chiefdoms";
        //
    }
    
    if (ChapterQuestionInt == 148){
        ReturnString= @"Epic of Gilgamesh";
        //
        
        AnswerString = @"Epic poem written ca. 2700 B.C.E.-2500 B.C.E. Describes theirlack of belife in an afterlife and their pessimistic view of the gods.";
        //
    }
    
    if (ChapterQuestionInt == 149){
        ReturnString= @"Egypt: ""the gift of the nile";
        //
        
        AnswerString = @"In the spring water ran off the mountains, causing the Nile to flood. When the flood waters withdrew, it left rich black soil that was extremely fertile. Egyptians called the soil ""the gift of the Nile"".";
        //
    }
    
    if (ChapterQuestionInt == 150){
        ReturnString= @"Nubia";
        //
        
        AnswerString = @"Egypt controlled Nubia for 100 years. The two civilizations would often trade. Nubia was subject to military rule from egypt.";
        //
    }
    
    if (ChapterQuestionInt == 151){
        ReturnString= @"Hyksos";
        //
        
        AnswerString = @"Invaded Egypt, beginning the second Intermediate period in which the Hyksos ruled as pharaohs in Lower Egypt.";
        //
    }
    
    if (ChapterQuestionInt == 152){
        ReturnString= @"Persian Empire";
        //
        
        AnswerString = @"An empire that stretched from Egypt, Mesopotamia, and Ionian Greece into the Indus River Valley area. This empire was known for being tolerant of the religions and traditions of the regions it conquered";
        //
    }
    
    if (ChapterQuestionInt == 153){
        ReturnString= @"Athenian democracy";
        //
        
        AnswerString = @"Athenian democracy was unique because it was a democracy in which all citizens could participate, unlike most other types of government at this time. It eliminated debt slavery and more men could hold public office.";
        //
    }
    if (ChapterQuestionInt == 154){
        ReturnString= @"Greco-Persian Wars";
        //
        
        AnswerString = @"It was caused by the Persians advancing to conquer more land. The Greeks, who were by far smaller than the Persians, held off the Persians. Greek victory brought about a changes in Greek society.";
        //
    }
    
    if (ChapterQuestionInt == 155){
        ReturnString= @"Alexander the Great";
        //
        
        AnswerString = @"In 10 years, Alexander destroyed the Persian Empire and led the Macedonians to take over all of its land and expand the empire even more. Alexander was the son of the Macedonian leader Philip II.";
        //
    }
    
    if (ChapterQuestionInt == 156){
        ReturnString= @"Hellenistic era";
        //
        
        AnswerString = @"Following the conquerings of Alexander the Great, Greek society had spread throughout the conquered lands. The Greeks built statues in the cities they took over. Their form of government also spread. A lot of art was now shaped by Greek culture.";
        //
    }
    
    if (ChapterQuestionInt == 157){
        ReturnString= @"Caesar Augustus";
        //
        
        AnswerString = @"Brought upon the ""empire-like"" government that made the Roman citizens feel as if they had abandoned their republican views of government. The government now revolved around one ruler that made all the rules. Caesar Augustus attempted to shadow this government by speaking republican values.";
        //
    }
    
    if (ChapterQuestionInt == 158){
        ReturnString= @"Pax Romana";
        //
        
        AnswerString = @"Peace and prosperity that the Romans provided to the people in the Mediteranean while they disguised their imperialistic rule.";
        //
    }
    
    if (ChapterQuestionInt == 159){
        ReturnString= @"Qin Shihuangdi";
        //
        
        AnswerString = @"Leader in bringing China back to a unified empire, rather than a bunch of warring city-states. He created an effective bureaucracy and started Legalism, which advocated rules and punishment to rule the state.";
        //
    }
    
    if (ChapterQuestionInt == 160){
        ReturnString= @"Han dynasty";
        //
        
        AnswerString = @"Dynasty that mained tained Shihuangdi's centralized government, but reduced the brutality of the punishments. It also replaced Legalism with morals like Confucianism.";
        //
    }
    
    if (ChapterQuestionInt == 161){
        ReturnString= @"Mauryan Empire";
        //
        
        AnswerString = @"Empire in India that was the equivalent of the Persian Empire in Eurasia. This empire is best known for its ruler Ashoka. The Mauryan Empire was run by a civilian bureaucracy.";
        //
    }
    
    if (ChapterQuestionInt == 162){
        ReturnString= @"Ashoka";
        //
        
        AnswerString = @"The most famous emperor in the Mauryan Empire. He converted to Buddhism to act as India's enlightened ruler, which acted much differently than Alexander the Great did.";
        //
    }
    
    if (ChapterQuestionInt == 163){
        ReturnString= @"Ahura Mazda";
        //
        
        AnswerString = @"Monotheistic god of Zoroastrianism, worshiped by Persians.";
        //
    }
    
    if (ChapterQuestionInt == 164){
        ReturnString= @"Aryans";
        //
        
        AnswerString = @"A nomadic group of warlike people that settled down in India. Created first caste system. Language was Sanskrit, used to write the Vedas, the bible of Hinduism";
        //
    }
    
    if (ChapterQuestionInt == 165){
        ReturnString= @"Cyrus the Great";
        //
        
        AnswerString = @"557-530 BCE, Famous ruler of the persian empire. allowed Jews to return to homeland.";
        //
    }
    
    if (ChapterQuestionInt == 166){
        ReturnString= @"Darius I";
        //
        
        AnswerString = @"522-486 BCE, Ruler of Persian empire";
        //
    }
    
    if (ChapterQuestionInt == 167){
        ReturnString= @"Gupta Empire";
        //
        
        AnswerString = @"320-550 BCE, an imperial experiment that did not last very long";
        //
    }
    
    if (ChapterQuestionInt == 168){
        ReturnString= @"Herodotus";
        //
        
        AnswerString = @"Ancient greek historian, one of the first historians";
        //
    }
    
    if (ChapterQuestionInt == 169){
        ReturnString= @"Hoplite";
        //
        
        AnswerString = @"Greek solider";
        //
    }
    
    if (ChapterQuestionInt == 170){
        ReturnString= @"Ionia";
        //
        
        AnswerString = @"Greek state that came under persian control. Revolted in 499 BCE, starting the greco persian war";
        //
    }
    
    if (ChapterQuestionInt == 171){
        ReturnString= @"Battle of Marathon";
        //
        
        AnswerString = @"Battle in Greco persian war. Greeks victorious";
        //
    }
    
    if (ChapterQuestionInt == 172){
        ReturnString= @"Olympic Games";
        //
        
        AnswerString = @"Games held every four years to create a sense of greek identity";
        //
    }
    
    if (ChapterQuestionInt == 173){
        ReturnString= @"Peloponnesain war";
        //
        
        AnswerString = @"War amongst the Greeks. Athens defeated, but the entirety of greeks worn out and weakened.";
        //
    }
    
    if (ChapterQuestionInt == 174){
        ReturnString= @"Legalism";
        //
        
        AnswerString = @"Started in China, Shi Huangdi to unify china after they had been separated into different provinces. Strict laws and rules with harsh punishments, Pessimistic";
        //
    }
    
    if (ChapterQuestionInt == 175){
        ReturnString= @"Confucianism";
        //
        
        AnswerString = @"No laws/punishment. The moral example of superiors. EDUCATION IS KEY TO BETTER ONES SELF Family was super important was very worldly";
        //
    }
    
    if (ChapterQuestionInt == 176){
        ReturnString= @"Ban Zhao";
        //
        
        AnswerString = @"A woman who laid out the woman role in confucism. Wanted a better education for girls to better serve their husbands.";
        //
    }
    
    if (ChapterQuestionInt == 177){
        ReturnString= @"Daoism";
        //
        
        AnswerString = @"Nature related balance and free lifestyle. Hippie lifestyle.";
        //
    }
    
    if (ChapterQuestionInt == 178){
        ReturnString= @"Vedas";
        //
        
        AnswerString = @"Poems, stories and hymns sacred to hinduism. Included rituals and sacrifices";
        //
    }
    
    if (ChapterQuestionInt == 179){
        ReturnString= @"Upanishads";
        //
        
        AnswerString = @"Introduced idea of Brahman or world soul and that everything is combined to it. Escape reincarnation by enlightenment";
        //
    }
    
    if (ChapterQuestionInt == 180){
        ReturnString= @"Siddhartha Guatama";
        //
        
        AnswerString = @"He created a new religion called buddhism.";
        //
    }
    
    if (ChapterQuestionInt == 181){
        ReturnString= @"Theravada/Mahavana";
        //
        
        AnswerString = @"Theravada viewed Buddha as a teacher and Mahavana viewed him as a god.";
        //
    }
    
    if (ChapterQuestionInt == 182){
        ReturnString= @"Bhagavad Gita";
        //
        
        AnswerString = @"A hindu text about a warrior who kills his men before war for the gods. Showed anyone could reach enlightenment";
        //
    }
    
    if (ChapterQuestionInt == 183){
        ReturnString= @"Zoroastrianism";
        //
        
        AnswerString = @"Monotheistic religion started in Persia. Right and Wrong";
        //
    }
    
    if (ChapterQuestionInt == 184){
        ReturnString= @"Judaism";
        //
        
        AnswerString = @"Monotheistic and had a compassionate god.";
        //
    }
    if (ChapterQuestionInt == 184){
        ReturnString= @"Judaism";
        //
        
        AnswerString = @"Monotheistic and had a compassionate god.";
        //
    }
    
    if (ChapterQuestionInt == 185){
        ReturnString= @"Greek Rafionalism";
        //
        
        AnswerString = @"How things came to be through a plethera of Gods for the GREEKS";
        //
    }
    
    if (ChapterQuestionInt == 186){
        ReturnString= @"Socrates, Plato, Aristotle";
        //
        
        AnswerString = @"Greek philosiphers: Socrates believed in asking questions. Plato wrote the republic. Aristotle taught Alexander the Great.";
        //
    }
    
    if (ChapterQuestionInt == 187){
        ReturnString= @"Jesus of Nazareth";
        //
        
        AnswerString = @"Established christianity, ""son of god""";
        //
    }
    
    if (ChapterQuestionInt == 188){
        ReturnString= @"Saint paul";
        //
        
        AnswerString = @"Spreads christianity to many places.";
        //
    }
    
    if (ChapterQuestionInt == 189){
        ReturnString= @"Wang Mang";
        //
        
        AnswerString = @"A high court official of the Han Dynasty. Wang Mang was a strong believer in Confucian good government. Wang Mang ordered the great private estates to be nationalized and divided up among the landless.";
        //
    }
    
    if (ChapterQuestionInt == 190){
        ReturnString= @"China's scholar-gentry class";
        //
        
        AnswerString = @"As a class they benefited from the wealth that their estates generated. They had homes in both urban and rural areas and had an luxurious life.";
        //
    }
    
    if (ChapterQuestionInt == 191){
        ReturnString= @"Yellow Turban Rebellion";
        //
        
        AnswerString = @"Wandering bands of peasants began to join together as floods along the Yellow River and resulting epidemis compounded the misery of landlessness and poverty. Known as the Yellow Turban Rebellion because it was a massive peasant uprising and the peasants wore yellow scarves around their heads.";
        //
    }
    
    if (ChapterQuestionInt == 192){
        ReturnString= @"Caste as Varna and Jati";
        //
        
        AnswerString = @"Varna-Four ranked class. Brahmins, priests whose rituals and sacrifices alone could ensure the proper functioning of the world. Next the Kshatriya class, warriors and rulers charged with protecting and governing society. Next the Vaisya class, commoners who cultivated the land. Lastly Sudras, native peoples incorporated into the margins of Aryan society. Each class was a jati, guilds that regulated their own affairs in a particular region.";
        //
    }
    
    if (ChapterQuestionInt == 193){
        ReturnString= @"""Ritual purity"" in Indian social practice";
        //
        
        AnswerString = @"Brahmins or other high-caste people who came into contact with members of lower castes, were in great danger of being polluted, or made ritually unclean.";
        //
    }
    
    if (ChapterQuestionInt == 194){
        ReturnString= @"Greek and Roman slavery";
        //
        
        AnswerString = @"A fair number of slaves might be emancipated, through the generosity or religious convictions of their owners, or to avoid caring for them in old age, or by allowing slaves to purchase their freedom with their own funds.";
        //
    }
    
    if (ChapterQuestionInt == 195){
        ReturnString= @"Spartacus";
        //
        
        AnswerString = @"Slave gladiator who led seventy other slaves from a school for gladiators in a desperate bid for freedom.";
        //
    }
    
    if (ChapterQuestionInt == 196){
        ReturnString= @"The ""three obediences""";
        //
        
        AnswerString = @"The ""three obediences"" were for women in ancient China. To obey her father before marriage, her husband when married, and her sons in widowhood.";
        //
    }
    
    if (ChapterQuestionInt == 197){
        ReturnString= @"Empress Wu";
        //
        
        AnswerString = @"(reigned 690-705 C.E.). A former hig-ranking concubine in the imperial court, who came to power amid much palace intrigue and was the only woman ever to rule China with the title of emperor.";
        //
    }
    
    if (ChapterQuestionInt == 198){
        ReturnString= @"Aspasia and Pericles";
        //
        
        AnswerString = @"Aspasia and Pericles lived together as husband and wife until Pericle's death in 429 B.C.E., even though they were not officially married.";
        //
    }
    
    if (ChapterQuestionInt == 199){
        ReturnString= @"Helots";
        //
        
        AnswerString = @"Sparta conquered their immediate neighbors and reduced them to a status of permanent servitude, not far removed from slavery. They were called helots.";
        //
    }
    
    if (ChapterQuestionInt == 200){
        ReturnString= @"Meroe";
        //
        
        AnswerString = @"The largest city in the Nubian civilization that later became its own kingdom. It was governed by a sacred monarch. The citizens of Meroe had to pay occasional tribute.";
        //
    }
    
    if (ChapterQuestionInt == 201){
        ReturnString= @"Axum";
        //
        
        AnswerString = @"The Axum were unique in Africa because of their plow-based agriculture. Axum was also unique in their religion; they were a Christian state.";
        //
    }
    
    if (ChapterQuestionInt == 202){
        ReturnString= @"Niger Valley Civilization";
        //
        
        AnswerString = @"The civilization that was created due to a drought in other areas in Africa. This civilization did not have any corresponding state structure.";
        //
    }
    
    if (ChapterQuestionInt == 203){
        ReturnString= @"Bantu Expansion";
        //
        
        AnswerString = @"A slow movement that moved several Bantu cultures and languages through the people. The people moved across the equator and into South Africa and blended their culture with the hunting and gathering societies that were in the land, such as the Batwa.";
        //
    }
    
    if (ChapterQuestionInt == 204){
        ReturnString= @"Maya Civilization";
        //
        
        AnswerString = @"A Mesoamerican civilization that had several scientific accomplishments. The founded the concept of zero and place notation. They also made a calendar. The Mayans had the most complex writing system in Mesoamerica.";
        //
    }
    
    if (ChapterQuestionInt == 205){
        ReturnString= @"Teotihuacan";
        //
        
        AnswerString = @"The largest and most complex city in Mesoamerica. It had a population between 100,000 and 200,000. The Street of the Dead was for the houses of the elite.";
        //
    }
    
    if (ChapterQuestionInt == 206){
        ReturnString= @"Chavin";
        //
        
        AnswerString = @"A religious civilization in the Andes. It was known for its religious pictures of jaguar-human pictures.";
        //
    }
    
    if (ChapterQuestionInt == 207){
        ReturnString= @"Moche";
        //
        
        AnswerString = @"The Moche was a civilization in the northern region of the Andes. They were run by warrior-priests that lived on top of pyramids. The Moche had several burial rituals.";
        //
    }
    
    if (ChapterQuestionInt == 208){
        ReturnString= @"Chaco Phenomenon";
        //
        
        AnswerString = @"Part of the Ancestral Pueblo society that encompassed 25,000 square miles. The population was 5,000 people.";
        //
    }
    
    if (ChapterQuestionInt == 209){
        ReturnString= @"Mound Builders/ Cahokia";
        //
        
        AnswerString = @"Building mounds was a phenomenon for several years. This society was a corn-based agriculture that came from Mexico.";
        //
    }
    
    if (ChapterQuestionInt == 210){
        ReturnString= @"Silk Roads";
        //
        
        AnswerString = @"System of caravan routes across Central Asia, along which traders carried silk and other trade goods; connected China, South Asia, Central Asia, West Asia and Europe";
        //
    }
    if (ChapterQuestionInt == 211){
        ReturnString= @"Black Death";
        //
        
        AnswerString = @"The worst plague in European history, lasting from about 1347 to 1352. In this time, over 1/3 of Europe's population died from a combination of three diseases: the bubonic plague, the septicemic plague, and the pneumonic plague. They were known collectively as this, and victims died a terrible death. It was brought in on fleas on rats on international trade ships. There were no logical explanations - some common ones were that planets were aligned in a poisonous way, Jews were poisoning the drinking water, or it was punishment for sin.";
        //
    }
    
    if (ChapterQuestionInt == 212){
        ReturnString= @"Indian Ocean trading network";
        //
        
        AnswerString = @"The world's largest sea-based system of comunication and exchange before 1500 C.E., Indian Ocean commerce stretched from southern China to eastern Africa and included not only the exchange of luxury and bulk goods but also the exchange of ideas and crops.";
        //
    }
    
    if (ChapterQuestionInt == 213){
        ReturnString= @"Srivijaya";
        //
        
        AnswerString = @"A state based on the Indonesian island of Sumatra, between the seventh and eleventh centuries C.E. It amassed wealth and power by a combination of selective adaptation of Indian technologies and concepts, and control of trade routes. (192)";
        //
    }
    
    if (ChapterQuestionInt == 214){
        ReturnString= @"Borobudur";
        //
        
        AnswerString = @"The largest Buddhist monument ever built, Borobudur is a mountainous ten-level monument with an elaborate carving program, probably built in the ninth century C.E. by the Sailendras rulers of central Java; it is an outstanding example of cultural exchange and syncretism.";
        //
    }
    
    if (ChapterQuestionInt == 215){
        ReturnString= @"Swahili civilization";
        //
        
        AnswerString = @"An East African civilization that emerged from blending of Bantu and Islamic and other Indian Ocean trade elements";
        //
    }
    
    if (ChapterQuestionInt == 216){
        ReturnString= @"Great Zimbabwe";
        //
        
        AnswerString = @"City, now in ruins (in the modern African country of Zimbabwe), whose many stone structures were built between about 1250 and 1450, when it was a trading center and the capital of a large state. (p. 385), this empire was located on the southeastern part of South Africa; it was established by the Shona people. This great city began as a community of cattle herders and was also very active in gold and ivory trade.";
        //
    }
    
    if (ChapterQuestionInt == 217){
        ReturnString= @"Sand Roads";
        //
        
        AnswerString = @"Introduction of the camel into African commercial life, allowed longer distances to be traveled. Major international trade routes fostered new relationships among distant peoples. , A term used to describe the routes of the trans-Saharan Africa. The Sand Roads linked North Africa and the Mediterranean world with interior West Africa. Along these trade routes, the peoples between the forests and the desert were in the best position to take advantage of the new opportunities to construct a series of city-states that drew upon the wealth of the trans-Saharan trade. slavery found a place in western Africa";
        //
    }
    
    if (ChapterQuestionInt == 218){
        ReturnString= @"Ghana, Mali, Songhay";
        //
        
        AnswerString = @"A series of important states that developed in the western and central Sudan, in response to the economic opportunities of the trans-Saharan Trade";
        //
    }
    
    if (ChapterQuestionInt == 219){
        ReturnString= @"American web";
        //
        
        AnswerString = @"A term used to describe the network of trade that linked parts of pre-Colombia Americas; although less intense and complete than the Afro- European trade networks this web nonetheless provided the exchange for luxury goods and ideas over large areas";
        //
    }
    
    if (ChapterQuestionInt == 220){
        ReturnString= @"Sui Dynasty";
        //
        
        AnswerString = @"Ruling dynasty of china (589-618ce) that effectively reunited the country after several centuries of political fragmentation";
        //
    }
    
    if (ChapterQuestionInt == 221){
        ReturnString= @"Tang Dynasty";
        //
        
        AnswerString = @"Ruling dynasty of China from 618 to 907; noted for its openness to foreign cultural influences. (tahng)";
        //
    }
    
    if (ChapterQuestionInt == 222){
        ReturnString= @"Song Dynasty economic revolution";
        //
        
        AnswerString = @"A major economic quickening that took place in China; marked by rapid population growth, urbanization, economic specialization, and the development of an immense network of internal waterways; a great increase in industrial production and innovation";
        //
    }
    
    if (ChapterQuestionInt == 223){
        ReturnString= @"Hangzhou";
        //
        
        AnswerString = @"Capital of later Song dynasty; population exceeded 1 million.";
        //
    }
    
    if (ChapterQuestionInt == 224){
        ReturnString= @"Foot Binding";
        //
        
        AnswerString = @"Chinese practice of tightly wrapping girls' feet to keep them small, begun in the Tang Dynasty; an emphasis on small size and delicacy was central to views of female beauty";
        //
    }
    
    if (ChapterQuestionInt == 225){
        ReturnString= @"Tribute System";
        //
        
        AnswerString = @"Chinese method of dealing with foreign lands and people's that assumed the subordination of all non-Chinese authorities and required the payment of tribute to the Chinese emperor";
        //
    }
    
    if (ChapterQuestionInt == 226){
        ReturnString= @"Xiongnu";
        //
        
        AnswerString = @"Major nomadic confederacy that was established ca. 200 BCE and eventually reached from Manchuria to Central Asia";
        //
    }
    
    if (ChapterQuestionInt == 227){
        ReturnString= @"Khitan/ Jurchen people";
        //
        
        AnswerString = @"A nomadic people who established a state that included parts of northern China (1115- 1234)";
        //
    }
    
    if (ChapterQuestionInt == 228){
        ReturnString= @"Silla Dynasty (Korea)";
        //
        
        AnswerString = @"The first ruling dynasty to bring a measure of politcal unity to the Korean peninsula (688-900 CE)";
        //
    }
    
    if (ChapterQuestionInt == 229){
        ReturnString= @"Hangul";
        //
        
        AnswerString = @"A phonetic alphabet developed in Korea in the fifteenth century CE";
        //
    }
    
    if (ChapterQuestionInt == 230){
        ReturnString= @"Chu nom";
        //
        
        AnswerString = @"A variation of Chinese writing developed in Vietnam that became the basis for an independent national literature";
        //
    }
    
    if (ChapterQuestionInt == 231){
        ReturnString= @"Trung Sisters";
        //
        
        AnswerString = @"2 vietnamese sisters who launched a major revolt against the chinese presence in vietnam in 39 ce. the rebellion was crushed and the sisters committed suicide, but they remained symbols of vietnamese resistance to china for centuries";
        //
    }
    
    if (ChapterQuestionInt == 232){
        ReturnString= @"Shotoku Taishi";
        //
        
        AnswerString = @"Japanese statesman (572-622) who launched the drive to make Japan into a centralized bureaucratic state modeled on China; he is best known for the Seventeen Article Constitution";
        //
    }
    
    if (ChapterQuestionInt == 233){
        ReturnString= @"Bushido";
        //
        
        AnswerString = @"The ""way of the warrior"" A Japanese notion regarding the virtues of the samurai, bravery, loyalty, development of martial arts, and death before dishonor.";
        //
    }
    
    if (ChapterQuestionInt == 234){
        ReturnString= @"Chinese Buddhism";
        //
        
        AnswerString = @"Buddhism was China's only large-scale cultural borrowing before the twentieth-century; Buddhism entered China from India in the first and second centuries C.E. through a series of cultural accomodations. At first supported by the state, Buddhism suffered persecution during the ninth century but continued to play a role in Chinese society.";
        //
    }
    
    if (ChapterQuestionInt == 235){
        ReturnString= @"Emperor Wendi";
        //
        
        AnswerString = @"Sui emperor (581-604) who particularly patronized buddhism";
        //
    }
    
    if (ChapterQuestionInt == 236){
        ReturnString= @"Byzantine Empire";
        //
        
        AnswerString = @"This is the name of the eastern part of the Roman Empire from the fourth century on. The name came from Byzantion, an early name for the capitol city of Constantinople. It continued to survive after the western portion of the Roman Empire collapsed, but they fell to the Ottomans in 1453.";
        //
    }
    
    if (ChapterQuestionInt == 237){
        ReturnString= @"Constantinople";
        //
        
        AnswerString = @"This city was a magnificent urban center in modern day Turkey. It was the capitol of the Eastern Roman Empire which became the Byzantine Empire. After the empire fell, it became Istanbul.";
        //
    }
    
    if (ChapterQuestionInt == 238){
        ReturnString= @"Justinian";
        //
        
        AnswerString = @"Byzantine emperor in the 6th century A.D. who reclaimed much of the territory previously owned by Rome. He also made a new legal system, and initiated a large building system, including Hagia Sofia.";
        //
    }
    
    if (ChapterQuestionInt == 239){
        ReturnString= @"Caesaropapism";
        //
        
        AnswerString = @"This is a system where the temporal leader extends his rule over ecclesiastical and theological matters. Instead of only political squabble, the leader could control virtually every aspect of his country.";
        //
    }
    
    if (ChapterQuestionInt == 240){
        ReturnString= @"Eastern Orthodox Christianity";
        //
        
        AnswerString = @"This doctrine of Christianity developed in the Eastern Roman Empire or the Byzantine Empire in other words. It also took root in medieval Europe and lives on today. It's main belief is the nonrecognition of the Pope as a supreme ruler of Christianity.";
        //
    }
    
    if (ChapterQuestionInt == 241){
        ReturnString= @"Icons";
        //
        
        AnswerString = @"These were religious symbols or objects used by EO Christians to aid in their religious studies and prayer.";
        //
    }
    
    if (ChapterQuestionInt == 242){
        ReturnString= @"Kievan Rus";
        //
        
        AnswerString = @"This was a sort of monarchy established in present day Russia during the 6th and 7th centuries. The rulers were very loose and questionable alliances with regional leaders at the head. Based on the word Rus, it was coined Russia by the Scandinavians. It was greatly influenced by the Byzantine Empire.";
        //
    }
    
    if (ChapterQuestionInt == 243){
        ReturnString= @"Prince Vladimir of Kiev";
        //
        
        AnswerString = @"This prince chose Eastern Orthodox Christianity as the state religion for the newly organized Russia. This added more cultural ties with the Byzantine Empire, with whom they also had many commercial ties already.";
        //
    }
    
    if (ChapterQuestionInt == 244){
        ReturnString= @"Charlemagne";
        //
        
        AnswerString = @"Charlemagne was the ruler of the Franks in the 8th and 9th centuries. He conquered much of the European world, and was crowned Holy Roman Emperor by Pope Leo III in the year 800. He also started a huge intellectual revival across his empire (Carolingian Empire).";
        //
    }
    
    if (ChapterQuestionInt == 245){
        ReturnString= @"Holy Roman Empire";
        //
        
        AnswerString = @"A federation of German states that was ruled by Charlemagne. It was virtually a continuation of the Roman Empire.";
        //
    }
    
    if (ChapterQuestionInt == 246){
        ReturnString= @"Roman Catholic Church";
        //
        
        AnswerString = @"This was the sect of Christianity headed by the Pope in Rome. It began to lose its substantial power during the Protestant Reformation.";
        //
    }
    
    if (ChapterQuestionInt == 247){
        ReturnString= @"Western Christendom";
        //
        
        AnswerString = @"This was formed in the split of Protestantism and the RCC. It contested the beliefs of church leadership, languages, the filoque, and religious images.";
        //
    }
    
    if (ChapterQuestionInt == 248){
        ReturnString= @"Crusades";
        //
        
        AnswerString = @"The Europeans expeditions to reclaim the Holy Land of Jerusalem. Aided by the Byzantines, they fought the Islaic peoples controlling the lands. The first Crusade was success, but the rest failed.";
        //
    }
    
    if (ChapterQuestionInt == 249){
        ReturnString= @"European cities";
        //
        
        AnswerString = @"Cities in Europe that were created during the Medieval Period. Today, they still maintain their old characteristics, some of whic include; ornate churches in the city center, narrow buildings and winding streets, extreme delevopment density and high walls protecting the city center.";
        //
    }
    
    if (ChapterQuestionInt == 250){
        ReturnString= @"System of competing states";
        //
        
        AnswerString = @"The organization of the Western Eurpoeans after the fall of the Western Roman Empire. It was marked by individual states who competed with one another militarily and economically.";
        //
    }
    
    if (ChapterQuestionInt == 251){
        ReturnString= @"Aristotle and classical Greek learning";
        //
        
        AnswerString = @"During the Medieval Period, much of Aristotle's and other Greek intelligentsia's works were revived and brought back into the teachings of the Europeans. This brought Greek rationalism into play, which shaped the thoughts of Europeans for years to come.";
        //
    }
    
    if (ChapterQuestionInt == 252){
        ReturnString= @"Quran";
        //
        
        AnswerString = @"The sacred writings of Islam revealed by God to the prophet Muhammad during his life at Mecca and Medina";
        //
    }
    
    if (ChapterQuestionInt == 253){
        ReturnString= @"Umma";
        //
        
        AnswerString = @"The Muslim community or people, considered to extend from Mauritania to Pakistan";
        //
    }
    
    if (ChapterQuestionInt == 254){
        ReturnString= @"Pillars of Islam";
        //
        
        AnswerString = @"Is the term given to the five duties incumbent on every Muslim. These duties are Shahadah (profession of faith), Salat (ritual prayer), Zakat (almsgiving), Sawm (fasting during Ramadan) and Hajj (pilgrimage to Mecca)";
        //
    }
    
    if (ChapterQuestionInt == 255){
        ReturnString= @"Hijra";
        //
        
        AnswerString = @"The Migration of Muhammad from Mecca to Medina in A.D. 622, marking the founding of Islam";
        //
    }
    
    if (ChapterQuestionInt == 256){
        ReturnString= @"Sharia";
        //
        
        AnswerString = @"The code of law derived from the Quran and from the teachings and example of Muhammad";
        //
    }
    if (ChapterQuestionInt == 257){
        ReturnString= @"Jizya";
        //
        
        AnswerString = @"Tax paid by Christians and Jews who lived in Muslim communities to allow them to continue to practice their own religion";
        //
    }
    
    if (ChapterQuestionInt == 258){
        ReturnString= @"Ulama";
        //
        
        AnswerString = @"The body of mullahs (Muslim scholars trained in Islam and Islamic law) who are the interpreters of Islam's sciences and doctrines and laws and the chief guarantors of continuity in the spiritual and intellectual history of the Islamic community";
        //
    }
    
    if (ChapterQuestionInt == 259){
        ReturnString= @"Umayyad Caliphate";
        //
        
        AnswerString = @"First hereditary dynasty of Muslim caliphs (661 to 750). From their capital at Damascus, the Umayyads ruled one of the largest empires in history that extended from Spain to India. Overthrown by the Abbasid Caliphate.";
        //
    }
    
    if (ChapterQuestionInt == 260){
        ReturnString= @"Abbasid Caliphate";
        //
        
        AnswerString = @"Descendants of the Prophet Muhammad's uncle, al-Abbas, the Abbasids overthrew the Umayyad Caliphate and ruled an Islamic empire from their capital in Baghdad from 750 to 1258.";
        //
    }
    
    if (ChapterQuestionInt == 261){
        ReturnString= @"Al-Ghazali";
        //
        
        AnswerString = @"Brilliant Islamic theologian; struggled to fuse Greek and Qur'anic traditions; not entirely accepted by ulama";
        //
    }
    
    if (ChapterQuestionInt == 262){
        ReturnString= @"Sikhism";
        //
        
        AnswerString = @"The doctrines of a monotheistic religion founded in northern India in the 16th century by Guru Nanak and combining elements of Hinduism and Islam";
        //
    }
    
    if (ChapterQuestionInt == 263){
        ReturnString= @"Anatolia";
        //
        
        AnswerString = @"A peninsula in southwestern Asia that forms the Asian part of Turkey";
        //
    }
    
    if (ChapterQuestionInt == 264){
        ReturnString= @"Ibn Battuta";
        //
        
        AnswerString = @"Moroccan Muslim scholar, the most widely traveled individual of his time. He wrote a detailed account of his visits to Islamic lands from China to Spain and the western Sudan.";
        //
    }
    
    if (ChapterQuestionInt == 265){
        ReturnString= @"Timbuktu";
        //
        
        AnswerString = @"A city in central Mali near the Niger river";
        //
    }
    
    if (ChapterQuestionInt == 266){
        ReturnString= @"Al-Abdalus";
        //
        
        AnswerString = @"One prince out of Umayyad that escaped to Spain -turned Southern Spain Muslim";
        //
    }
    
    if (ChapterQuestionInt == 267){
        ReturnString= @"Madrassas";
        //
        
        AnswerString = @"A school for the study of Muslim law and religion";
        //
    }
    
    if (ChapterQuestionInt == 268){
        ReturnString= @"House of Wisdom";
        //
        
        AnswerString = @"Combination library, academy, and translation center in Baghdad established in the 800s.";
        //
    }
    
    if (ChapterQuestionInt == 269){
        ReturnString= @"Ibn Sina";
        //
        
        AnswerString = @"The famous Islamic scientist and philosopher who organized the medical knowledge of the Greeks and Arabs into the Canon of Medicine";
        //
    }
    
    if (ChapterQuestionInt == 270){
        ReturnString= @"Pastoralism";
        //
        
        AnswerString = @"Form of economy involving the raising and selling of animals; practiced in places where growing crops is not an option";
        //
    }
    
    if (ChapterQuestionInt == 271){
        ReturnString= @"Xiongnu";
        //
        
        AnswerString = @"The fierce pastoralist group that often attacked northern Han China and aided in its downfall";
        //
    }
    
    if (ChapterQuestionInt == 272){
        ReturnString= @"Modun";
        //
        
        AnswerString = @"The charismatic ruler of the Xiongnu";
        //
    }
    
    if (ChapterQuestionInt == 273){
        ReturnString= @"Turks";
        //
        
        AnswerString = @"Central Asian pastoralists who converted to Islam and spread it as they conquered new lands";
        //
    }
    
    if (ChapterQuestionInt == 274){
        ReturnString= @"Masai";
        //
        
        AnswerString = @"Pastoralist group in Africa that are focused on their cattle; raised millet, wheat, and sorghum for a time";
        //
    }
    
    if (ChapterQuestionInt == 275){
        ReturnString= @"Temujin/Chinggis Khan";
        //
        
        AnswerString = @"Ruler of the Mongols who grew up out of nothing without a father to support him of his mother; he gained social standing by associating himself with a powerful tribal leader";
        //
    }
    
    if (ChapterQuestionInt == 276){
        ReturnString= @"The Mongol World War";
        //
        
        AnswerString = @"The war between the mongols and everyone who refused to surrender; most notable including China, Russia, and Persia";
        //
    }
    
    if (ChapterQuestionInt == 277){
        ReturnString= @"Yuan Dynasty China";
        //
        
        AnswerString = @"The Mongol dynasty in China that utilized many of the Chinese administrative practices, techniques for taxation, and postal system";
        //
    }
    
    if (ChapterQuestionInt == 278){
        ReturnString= @"Khubilai Khan";
        //
        
        AnswerString = @"The grandson the Ghengis Khan and the first ruler of mongol China";
        //
    }
    
    if (ChapterQuestionInt == 279){
        ReturnString= @"Hulegu";
        //
        
        AnswerString = @"Led the second assault on Persia and became its first il-khanate";
        //
    }
    
    if (ChapterQuestionInt == 280){
        ReturnString= @"Kipchak Khanate/Golden Horde";
        //
        
        AnswerString = @"The name of the conquered lands of current-day Russia";
        //
    }
    
    if (ChapterQuestionInt == 281){
        ReturnString= @"Black Death/plague";
        //
        
        AnswerString = @"Disease that spread on the Eurasian trade routes from Central Asia claiming one-third of the total population in Europe";
        //
    }
    
    if (ChapterQuestionInt == 282){
        ReturnString= @"Paleolithic Persistence";
        //
        
        AnswerString = @"The persistence of paleolithic ways of life that gradually dissapeared with the discovery of agriculture; most notably occured in the regions of Australia and North America";
        //
    }
    
    if (ChapterQuestionInt == 283){
        ReturnString= @"Benin";
        //
        
        AnswerString = @"One of the Yoruba-speaking peoples of Africa who were famous for their bronze sculptures";
        //
    }
    
    if (ChapterQuestionInt == 284){
        ReturnString= @"Igbo";
        //
        
        AnswerString = @"A Yoruba-speaking people who rejected kingship and state-building techniques";
        //
    }
    
    if (ChapterQuestionInt == 285){
        ReturnString= @"Iroquois";
        //
        
        AnswerString = @"The native people of North America; engaged in frequent conflicts with rival kinship groups after the introduction of agriculture";
        //
    }
    
    if (ChapterQuestionInt == 286){
        ReturnString= @"Timur";
        //
        
        AnswerString = @"Turkic warrior who tried to surpass Chinggis Khan; brought immense devestation to Persia, Russia, and India.";
        //
    }
    
    if (ChapterQuestionInt == 287){
        ReturnString= @"Fulbe";
        //
        
        AnswerString = @"Largest pastoral society in Africa who lived in small communities unlike their counterparts in Inner Asia";
        //
    }
    
    if (ChapterQuestionInt == 288){
        ReturnString= @"Ming Dynasty China";
        //
        
        AnswerString = @"Chinese dynasty that tried to hide that the Mongols were ever present or in rule; brought back the Confucian ways of learning and the civil service exam";
        //
    }
    
    if (ChapterQuestionInt == 289){
        ReturnString= @"Zheng He";
        //
        
        AnswerString = @"Arabian sailor commissioned by Ming emperor Yongle to undertake in maritime explorations";
        //
    }
    
    if (ChapterQuestionInt == 290){
        ReturnString= @"European Renaissance";
        //
        
        AnswerString = @"A renewal of classical Greek traditions that had previously been obscured or viewed through the lens of Arabic or Latin translations";
        //
    }
    
    if (ChapterQuestionInt == 291){
        ReturnString= @"Ottoman Empire";
        //
        
        AnswerString = @"Empire that marked the emergence of the Turks as the dominant Islamic power; empire encorporated many diverse peoples";
        //
    }
    
    if (ChapterQuestionInt == 292){
        ReturnString= @"Seizure of Constantinople(1453)";
        //
        
        AnswerString = @"Marked the final demise of Christian Byzantium";
        //
    }
    
    if (ChapterQuestionInt == 293){
        ReturnString= @"Safavid Empire";
        //
        
        AnswerString = @"Shia Islamic empire from Sufi origins; because of its locaiton in the world, between two Sunni Muslim empires, it wasn't able to successfully enter the trade economy and slowly died out.";
        //
    }
    
    if (ChapterQuestionInt == 294){
        ReturnString= @"Songhay Empire";
        //
        
        AnswerString = @"Muslim empire of West Africa; islam was limited to the urban elites; became a major center of Islamic learning and commerce";
        //
    }
    
    if (ChapterQuestionInt == 295){
        ReturnString= @"Timbuktu";
        //
        
        AnswerString = @"One of the great cities of Songhay; had a large trading market where high quality merchandise imported from Europe was sold";
        //
    }
    
    if (ChapterQuestionInt == 296){
        ReturnString= @"Mughal Empire";
        //
        
        AnswerString = @"An Empire of India in which the Islamic minority ruled over the mostly Hindu population";
        //
    }
    
    if (ChapterQuestionInt == 297){
        ReturnString= @"Malacca";
        //
        
        AnswerString = @"City located on the waterway between Sumatra and Malaya; it was transformed from a small fishing village to a major Muslim port";
        //
    }
    
    if (ChapterQuestionInt == 298){
        ReturnString= @"Aztec Empire";
        //
        
        AnswerString = @"Mesoamerican civilization the emphasized the importance of ritual sacrifice";
        //
    }
    
    if (ChapterQuestionInt == 299){
        ReturnString= @"Inca Empire";
        //
        
        AnswerString = @"Andean civilization that originated from the Quechua speaking peoples";
        //
    }
    
    if (ChapterQuestionInt == 300){
        ReturnString= @"The Great dying";
        //
        
        AnswerString = @"-spread of smallpox , measles -arrival of conquistadors 16th century -75% of central south america dies -90% of caribbean -Easy colonization, led to increase importation of slaves ";
        //
    }
    if (ChapterQuestionInt == 301){
        ReturnString= @"Columbian Exchange";
        //
        
        AnswerString = @"The exchange of plants, animals, diseases, and technologies between the Americas and the rest of the world following Columbus's voyages.";
        //
    }
    
    if (ChapterQuestionInt == 302){
        ReturnString= @"Peninsulares";
        //
        
        AnswerString = @"Spanish-born, came to Latin America; ruled, highest social class";
        //
    }
    
    if (ChapterQuestionInt == 303){
        ReturnString= @"Mestizo";
        //
        
        AnswerString = @"A person of mixed racial ancestry (especially mixed European and Native American ancestry)";
        //
    }
    
    if (ChapterQuestionInt == 304){
        ReturnString= @"Mulattoes";
        //
        
        AnswerString = @"People with both African and European ancestry";
        //
    }
    
    if (ChapterQuestionInt == 305){
        ReturnString= @"Plantation Complex";
        //
        
        AnswerString = @"Agricultural system based on African slavery that was used in Brazil, the Caribbean, and the southern colonies of North America.";
        //
    }
    
    if (ChapterQuestionInt == 306){
        ReturnString= @"Settler Colonies";
        //
        
        AnswerString = @"Colonies, such as those in South Africa, New Zealand, Algeria, Kenya, and Hawaii, where minority European populations lived among majority indigenous peoples.";
        //
    }
    
    if (ChapterQuestionInt == 307){
        ReturnString= @"Siberia";
        //
        
        AnswerString = @"The extreme northeastern sector of Asia, including the Kamchatka Peninsula and the present Russian coast of the Arctic Ocean, the Bering Strait, and the Sea of Okhotsk.";
        //
    }
    
    if (ChapterQuestionInt == 308){
        ReturnString= @"Yasak";
        //
        
        AnswerString = @"Tribute that Russian rulers demanded from the native peoples of Siberia, most often in the form of fur";
        //
    }
    
    if (ChapterQuestionInt == 309){
        ReturnString= @"Qing Dynasty Empire";
        //
        
        AnswerString = @"Provided china with a lot of the things that they still have today (borders), interested in expansion, court of colonial affairs, weren't interested into assimilating foreigners";
        //
    }
    
    if (ChapterQuestionInt == 310){
        ReturnString= @"Mughal Empire";
        //
        
        AnswerString = @"Muslim state (1526-1857) exercising dominion over most of India in the sixteenth and seventeenth centuries";
        //
    }
    
    if (ChapterQuestionInt == 311){
        ReturnString= @"Akbar";
        //
        
        AnswerString = @"Most illustrious sultan of the Mughal Empire in India (r. 1556-1605). He expanded the empire and pursued a policy of conciliation with Hindus.";
        //
    }
    
    if (ChapterQuestionInt == 312){
        ReturnString= @"Aurangzeb";
        //
        
        AnswerString = @"Mughal emperor in India and great-grandson of Akbar 'the Great', under whom the empire reached its greatest extent, only to collapse after his death";
        //
    }
    
    if (ChapterQuestionInt == 313){
        ReturnString= @"Ottoman Empire";
        //
        
        AnswerString = @"Centered in Constantinople, the Turkish imperial state that conquered large amounts of land in the Middle East, North Africa, and the Balkans, and fell after World War I.";
        //
    }
    
    if (ChapterQuestionInt == 314){
        ReturnString= @"The Great dying";
        //
        
        AnswerString = @"ee";
        //
    }
    
    if (ChapterQuestionInt == 315){
        ReturnString= @"Constantinople";
        //
        
        AnswerString = @"Previously known as Byzantium, Constantine changed the name of the city and moved the capitol of the Roman Empire here from Rome.";
        //
    }
    
    if (ChapterQuestionInt == 316){
        ReturnString= @"Devshirme";
        //
        
        AnswerString = @"'Selection' in Turkish. The system by which boys from Christian communities were taken by the Ottoman state to serve as Janissaries.";
        //
    }
    
    if (ChapterQuestionInt == 317){
        ReturnString= @"Indian ocean commercial network";
        //
        
        AnswerString = @"The massive, interconnected web of commerce in premodern times between the lands that bordered on the indian ocean (including e. africa, india, and se asia); the network was badly disrupted by Portuguese intruding beginning around 1500";
        //
    }
    
    if (ChapterQuestionInt == 318){
        ReturnString= @"Trading post empire";
        //
        
        AnswerString = @"Form of imperial dominance based on control of trade rather than control of subject people";
        //
    }
    
    if (ChapterQuestionInt == 319){
        ReturnString= @"Philippines (spanish)";
        //
        
        AnswerString = @"An archipelago of pacific islands colonized by spain in a relatively bloodless process that extended for the century or so after 1565, a process accompanied by a major effort that evangelization; the spanish named them the philippine islands in honor of king phillip II of spain";
        //
    }
    
    if (ChapterQuestionInt == 320){
        ReturnString= @"British/dutch east india companies";
        //
        
        AnswerString = @"Private trading companies chartered by the governments of england and the netherlands around 1600; they were given monopolies on indian ocean trade, including the right to make war and to rule conquered peoples";
        //
    }
    
    if (ChapterQuestionInt == 321){
        ReturnString= @"Tokugawa shogunate";
        //
        
        AnswerString = @"Military rulers of japan who successfully united japan politically by the early 17th c. and established a ""closed door"" policy toward european enroachments";
        //
    }
    
    if (ChapterQuestionInt == 322){
        ReturnString= @"Shogun";
        //
        
        AnswerString = @"In japan, a supreme military commander";
        //
    }
    
    if (ChapterQuestionInt == 323){
        ReturnString= @"Samurai";
        //
        
        AnswerString = @"The warrior elite of medieval japan";
        //
    }
    
    if (ChapterQuestionInt == 324){
        ReturnString= @"""Silver drain""";
        //
        
        AnswerString = @"Term often used to describe the siphoning of money from europe to pay for the luxury products of the east, a process exacerbated by the fact that europe had few trade goods that were desirable in e markets; eventually the bulk of the world's silver supply made its way to china";
        //
    }
    
    if (ChapterQuestionInt == 325){
        ReturnString= @"Potosi";
        //
        
        AnswerString = @"City that developed high in the andes (in present day bolivia) at the site of the world's largest silver mine and that became the largest city in the americas, with the population of some 16,000 in the 1750s";
        //
    }
    
    if (ChapterQuestionInt == 326){
        ReturnString= @"""Soft gold""";
        //
        
        AnswerString = @"Nickname used in the early modern period for animal furs, highly valued for their warmth and as symbols for elite status; in several regions, the fur trade generated massive wealth for those engaged in it";
        //
    }
    
    if (ChapterQuestionInt == 327){
        ReturnString= @"Middle passage";
        //
        
        AnswerString = @"Name commonly given to the journey across the atlantic undertaken by african slaves being shipped to the americas";
        //
    }
    if (ChapterQuestionInt == 328){
        ReturnString= @"Manila";
        
        //
        
        AnswerString = @"Capital of the spanish philippines and a major multicultural trade city that already had a population of more than 40,000 by 1600";
        //
    }
    
    if (ChapterQuestionInt == 329){
        ReturnString= @"African dispora";
        //
        
        AnswerString = @"Name given to the spread of african peoples across the atlantic via the slave trade";
        //
    }
} //End Term Data Base

@end

