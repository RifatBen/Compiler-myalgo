#include<stdio.h>
#include<stdlib.h>
#include<string.h>

typedef struct TabSymb{ 
char NomEntite[20];  
char TypeEntite[20]; 
} ts[100];

int CpTabSym=0;


int recherche(char entite[]) { 
int i=0; 
while(i<CpTabSym) { 
if (strcmp(entite,ts[i].NomEntite)==0)
return i; i++; 
}
return -1; 
}

void inserer(char entite[], char type[]) {
if ( recherche(entite)==-1) { 
strcpy(ts[CpTabSym].NomEntite,entite);
strcpy(ts[CpTabSym].TypeEntite,type); 
CpTabSym++; 
} 
}

void afficher () { 
printf("\n/***************Table des symboles ******************/\n"); 
printf("________________________\n"); 
printf("\t| NomEntite |  TypeEntite \n"); 
printf("________________________\n"); 
int i=0; 
while(i<CpTabSym) { printf("\t|%10s |%12s  |\n",ts[i].NomEntite,ts[i].TypeEntite,ts[i].TypeEntite); i++; } 
}

void test(){
printf("ya zebi");
}
