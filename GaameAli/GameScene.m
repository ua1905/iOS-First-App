//
//  GameScene.m
//  GaameAli
//
//  Created by etudiant on 31/05/2016.
//  Copyright (c) 2016 etudiant. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"arial"];
    
    myLabel.text = @"Flappy webalib !";
    myLabel.fontSize = 35;
    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                   CGRectGetMidY(self.frame));
    
    [self addChild:myLabel];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

        [_perso.physicsBody applyImpulse:CGVectorMake(0, 9)];
}

-(void)update:(CFTimeInterval)currentTime {
}

-(id) initWithSize:(CGSize)taille {
    /* On utilise la méthode d'initialisation par défaut */
    if (self = [super initWithSize: taille]) {
        /* Puis on configure notre scène */
        // définir la couleur du fond de la scène
        _fond = [SKColor colorWithRed:121.0/255.0 green:248.0/255.0 blue:248.0/255.0 alpha:1.0];
        [self setBackgroundColor:_fond];

        // initialiser du sprite du perso avec la texture précédente
        _perso = [SKSpriteNode spriteNodeWithColor:[UIColor blueColor] size:CGSizeMake(50, 50)];
        /*
        SKTexture* monPerso =[SKTexture textureWithImageNamed:@"oiseau.png"];
        SKSpriteNode *oiseau = [SKSpriteNode spriteNodeWithTexture:monPerso];
        [self addChild: oiseau];
        */
        // positionner le perso dans la scène en (x,y)
            _perso.position = CGPointMake (self.frame.size.width/8,self.frame.size.height/2);
        
        // ajouter le perso à la scène
        [self addChild: _perso];
        
        self.physicsWorld.gravity = CGVectorMake(0.0, -3.2);

        
        SKTexture* maTexture3 =[SKTexture textureWithImageNamed:@"ciel.png"];
        SKAction* bougerPaysage = [SKAction moveByX:-maTexture3.size.width*4 y:0 duration:0.01*maTexture3.size.width*4];
        // définir le mouvement de retour à la position initiale du sprite
        SKAction* resetPaysage = [SKAction moveByX:maTexture3.size.width*800 y:0 duration:0];
        // définir une action composée des 2 actions précédentes
        SKAction* animPaysage = [SKAction repeatActionForever:[SKAction sequence:@[bougerPaysage, resetPaysage]]];
        
        int z=0;
        while(z<80000){
            SKSpriteNode *ciel = [SKSpriteNode spriteNodeWithTexture:maTexture3];
            ciel.position = CGPointMake(z,35);
            [ciel runAction:animPaysage];
            [self addChild: ciel];
            z = z+350;
        }
        
        


        
        
        
        
        SKTexture* maTexture4 =[SKTexture textureWithImageNamed:@"soleil.png"];
        
        SKAction* bougerPaysage3 = [SKAction moveByX:-maTexture4.size.width*4 y:0 duration:0.03*maTexture3.size.width*4];
        // définir le mouvement de retour à la position initiale du sprite
        SKAction* resetPaysage3 = [SKAction moveByX:maTexture4.size.width*200 y:0 duration:0];
        // définir une action composée des 2 actions précédentes
        SKAction* animPaysage3 = [SKAction repeatActionForever:[SKAction sequence:@[bougerPaysage3, resetPaysage3]]];
        
        SKSpriteNode *soleil = [SKSpriteNode spriteNodeWithTexture:maTexture4];
        soleil.position = CGPointMake(580,305);
        [soleil runAction:animPaysage3];
        [self addChild: soleil];
        
        
    
        /*
        int l=50;
        while(l<1200){
            SKTexture* maTexture2 =[SKTexture textureWithImageNamed:@"obstacle1.png"];
            SKSpriteNode *obs1 = [SKSpriteNode spriteNodeWithTexture:maTexture2];
            [self addChild: obs1];
            obs1.position = CGPointMake(l,60);
            l= l+250;
        }
        */
        
        int i=0;
        SKTexture* maTexture =[SKTexture textureWithImageNamed:@"sol.png"];
        SKAction* bougerPaysage2 = [SKAction moveByX:-maTexture.size.width*2 y:0 duration:0.1*maTexture3.size.width*2];
        // définir le mouvement de retour à la position initiale du sprite
        SKAction* resetPaysage2 = [SKAction moveByX:maTexture.size.width*2 y:0 duration:0];
        // définir une action composée des 2 actions précédentes
        SKAction* animPaysage2 = [SKAction repeatActionForever:[SKAction sequence:@[bougerPaysage2, resetPaysage2]]];
        while(i<800){
            SKSpriteNode *bloc = [SKSpriteNode spriteNodeWithTexture:maTexture];
            bloc.position = CGPointMake(i,20);
            [bloc runAction:animPaysage2];
            [self addChild: bloc];
            i++;
        }
        
        
        // créer le corps physique associé au perso (corps circulaire)
        _perso.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius: _perso.size.height/2];
        // il est soumis à la physique
    
        _perso.physicsBody.dynamic = YES; // par défaut : YES // il est soumis à la gravité
        _perso.physicsBody.affectedByGravity = YES; // par défaut : YES
        
        // il n'est pas affecté par les rotations (forces angulaires)
        _perso.physicsBody.allowsRotation = NO; // par défaut : YES
        
        
        SKNode* solFix = [SKNode node];
//        solFix = [SKSpriteNode spriteNodeWithColor:[UIColor redColor] size:CGSizeMake(200, 5)];
        solFix.position = CGPointMake (self.frame.size.width/8,self.frame.size.height/12);

        // créer le corps physique associé au perso (corps circulaire)
        solFix.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: CGSizeMake(self.frame.size.width, maTexture.size.width)];
        // il est soumis à la physique
        solFix.physicsBody.dynamic = NO; // par défaut : YES
        // il est soumis à la gravité
        solFix.physicsBody.affectedByGravity = YES; // par défaut : YES
        // il n'est pas affecté par les rotations (forces angulaires)
        solFix.physicsBody.allowsRotation = NO; // par défaut : YES
        

        // ajouter le perso à la scène
        [self addChild: solFix];
        
        
        
        SKTexture* persoTexture1 =[SKTexture textureWithImageNamed:@"perso1.png"];

        SKTexture* persoTexture2 =[SKTexture textureWithImageNamed:@"perso2.png"];

        
        
        
        SKAction* anim = [SKAction repeatActionForever:[SKAction animateWithTextures:@[persoTexture1, persoTexture2] timePerFrame:0.2]];
        
  
                [_perso runAction:anim];
        
        
        
        
        
        
        
    }
    return self;
    }
@end