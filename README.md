# japanese_language_bot
<h2>How to use bot: </h2>

<b>Command to run bot:</b> `docker-compose up -d`
<b>Command to shut down bot:</b> `docker-compose down`

<h1>This bot is deployed to AWS Elastic Beanstalk</h1>

Feel free to go to terraform-deploy.yml to either build or destroy the cloud infrastructure.

- There are 2 functionalities of this bot: add/remove roles + load resources for language classes
- (Note all commands are space sensitive but NOT case sensitive)
- Class Name: Beginners, Intermediate, Advanced, English

Add/Remove roles:
----------------------------------------------------------------------------------------------------------
- How to add a role: !add [Class Name] (i.e. !add Beginners, !add Intermediate etc.) 
- How to remove your role: !rmv [Class Name] (i.e. !rmv English, !rmv Advanced etc.) 

Load class resources for language classes:
----------------------------------------------------------------------------------------------------------
Instead of posting it on Discord just like on the Language Class FB group, you can type a command to load the ppt slides of any week as you desire. Links will be updated right after I posted on FB group.

How to load resources of any week: !Week [week number] [Class Name]
(For Example:
 - !Week 1 Beginners loads resources from the first lesson of beginners class 
 - !Week 5 Advanced loads resources from the 5th class of the advanced class)

For Autumn 2023:
- Week 1 = 1st Lesson (Week 3)
- Week 2 = 2nd Lesson (Week 4)
- Week 3 = 3rd Lesson (Week 5)
- Week 4 = 4th Lesson (Week 6)
- Week 5 = 5th Lesson (Week 7)
- Week 6 = 6th Lesson (Week 8)
- Week 7 = 7th Lesson (Week 9)
- Week 8 = 8th Lesson (Week 10)
- Week 9 = 9th/last lesson (Week 11)

For Beginners Specifically: 
How to load hiragana sheets: !hiragana sheet
How to load katakana sheets: !katakana sheet

For any more help type: !help-language-bot 

Guess Sponsor Game:
----------------------------------------------------------------------------------------------------------
This is an initiative to promote our 2023 sponsors on our Discord server. This is how it works:

1. Type '!guess sponsor' (w/o quotations) to load an image from one of our sponsors
2. Guess that sponsor within a 10s timeframe
3. If you guessed it correctly before the time limit, it will congratulate you + show you the benefits of that sponsorship
4. If you can't guess it by the time limit, it will tell you the correct answer + its benefits
5. If you guessed it incorrectly before the time limit, you have unlimited attempts within 10s before you get the correct answer
