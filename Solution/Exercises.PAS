Program CollectItGodDammIt;
   Type
      UniList=^List;
      List=Record
            A:String;
            Suivant:UniList;
           End;
      BiList=^List2;
      List2=Record
             A:String;
             Suivant,Precedant:BiList;
           End;
   {--------------- Exo 01_2 ---------------------}
   Procedure   UniTrieCroiData( Var L1:UniList );
      Var
        C:String;
        I,J:UniList;
      Begin
        If (L1=Nil) then Writeln('La Liste Est Vide')
        else If (L1<>Nil) then
          If(L1^.Suivant<>Nil) then
          Begin
            I:=L1;
            While (I^.Suivant<>Nil) do
            Begin
              J:=I^.Suivant;
              While (J<>Nil) do
              Begin
                If (J^.A<I^.A) then
                Begin
                  C:=J^.A;
                  J^.A:=I^.A;
                  I^.A:=C;
                End;
                J:=J^.Suivant;
              End;
              I:=I^.Suivant;
            End;
          End;
      End;
   {------------------------------------------}
   Function TailleUni (Ls:UniList):Integer ;
       Var
         I:Integer;
         L:UniList;
       Begin
         I:=1;
         L:=LS;
         If ( L = Nil ) then TailleUni:=0
         Else if ( L <> Nil ) then
                              Begin
                                While ( L^.Suivant <> Nil ) Do
                                Begin
                                  I:=I+1;
                                  L:=L^.Suivant;
                                End;
                                TailleUni:=I;
                              End;
       End;
   {------------------------------------------}
   Function TailleBi (Ls:BiList):Integer ;
       Var
         I:Integer;
         L:BiList;
       Begin
         I:=1;
         L:=LS;
         If ( L = Nil ) then TailleBi:=0
         Else if ( L <> Nil ) then
                              Begin
                                While ( L^.Suivant <> Nil ) Do
                                Begin
                                  I:=I+1;
                                  L:=L^.Suivant;
                                End;
                                TailleBi:=I;
                              End;
       End;
   {--------------- Exo 01_1 ---------------------}
   Procedure   UniTrieDecPTR( Var L1:UniList );
      Var
        N,I,J:Integer;
        P0,P2,PS,P1:UniList;
      Begin
        Ps:=L1;
        N:=TailleUni(Ps);
        While (Ps^.Suivant<>Nil) do Ps:=Ps^.Suivant;
        For i:=1 to N-1 do
        Begin
          P1:=L1;
          Ps:=P1;
          For j:=1 to N-I do
          Begin
            If (Ps^.A>Ps^.Suivant^.A) then
            Begin
              P0:=P1;
              While (Ps^.Suivant<>Ps) and (P0^.Suivant<>Nil) do P0:=P0^.Suivant;
              P2:=Ps^.Suivant^.Suivant;
              Ps^.Suivant^.Suivant:=PS;
              If (PS=P1) then P1:=Ps^.Suivant
              Else P0^.Suivant:=Ps^.Suivant;
              Ps^.Suivant:=P2;
            End
            Else Ps:=Ps^.Suivant;
          End;
        End;
      End;
   {------------------------------------------}
    Procedure AfficherUni (Ls:UniList);
       Begin
         If ( Ls = Nil ) then Writeln('Nil')
         Else if ( Ls <> Nil ) then
         Begin
           While ( Ls<>Nil ) do
           Begin
             Write(Ls^.A,' | ');
             Ls:=Ls^.Suivant;
           End;
         End;
         Writeln;
       End;
    {------------------------------------------}
    Procedure AfficherBi (Ls:BiList);
       Begin
         If ( Ls = Nil ) then Writeln('Nil')
         Else if ( Ls <> Nil ) then
         Begin
           While ( Ls<>Nil ) do
           Begin
             Write(Ls^.A,' | ');
             Ls:=Ls^.Suivant;
           End;
         End;
         Writeln;
       End;
  { --------------- Exo 02 -----------------------}
   Procedure InverseUni(Var Ls:UniList);
      Var
        I,N,A:Integer;
        Save:String;
        L,T:UniList;
      Begin
        T:=Ls;
        A:=1;
        L:=Ls;
        N:=TailleUni(Ls);
        If (Ls=Nil) then Writeln('La Liste Est Vide')
        Else if (Ls<>Nil) Then
        Begin
          While (Ls<>Nil) do
          Begin
            Save:=Ls^.A;
            For i:=A to N-1 do T:=T^.Suivant;
            N:=N-1;
            A:=A+1;
            Ls^.A:=T^.A;
            T^.A:=Save;
            Ls:=Ls^.Suivant;
            T:=Ls;
          End;
        End;
        Ls:=L;
      End;
   {--------------- Exo 04 -----------------------}
   Procedure CheckTrieUni(Var Ls:UniList);
      Var
        L:UniList;
        A:Char;
        N,I,X,Y:Integer;
      Begin
        L:=Ls;
        A:='1';
        X:=1;
        Y:=1;
        N:=TailleUni(L);
        If (L=Nil) Then A:='1'
        Else if (L<>Nil) then
        Begin
          For i:=1 to N do
          Begin
            If (L^.A>L^.Suivant^.A) then X:=X+1
            Else If (L^.A<L^.Suivant^.A) then Y:=Y+1;
            L:=L^.Suivant;
          End;
          If (X=N) then A:='D'
          Else if (Y=N) then A:='C'
          Else A:='0';
        End;
        Case A of
        '1':Writeln('La Uni Liste Est Vide');
        '0':Writeln('La Uni Liste Nest Pas Triee');
        'D':Writeln('La Uni Liste Est Triee En Ordre Decroissant');
        'C':Writeln('La Uni Liste Est Triee En Order Croissant');
        End;
      End;
      {------------------------------------------}
   Procedure AddBeforeUni(Var Ls:UniList;S:String;Y:Integer);
       Var
         R,I:Integer;
         L,T,W:UniList;
       Begin
         L:=Ls;
         R:=0;
         If ( Ls = Nil ) and ( Y = 1 ) then
                                            Begin
                                              New(Ls);
                                              Ls^.A:=S;
                                              Ls^.Suivant:=Nil;
                                            End
         Else If ( Ls <> Nil ) then
         Begin
           If ( Y=1 ) then
           Begin
             Ls:=L;
             New(W);
             New(W^.Suivant);
             W^.A:=S;
             W^.Suivant:=Ls;
             Ls:=W;
           End
           Else
           Begin
           for i:=1 to Y-2 Do
           Ls:=Ls^.suivant;
           If ( Ls^.Suivant = Nil ) then
           Begin
             New(Ls^.Suivant);
             Ls:=Ls^.Suivant;
             Ls^.A:=S;
             Ls^.Suivant:=Nil;
             Ls:=L;
           End
           Else If ( Ls^.Suivant <> Nil ) then
           Begin
             T:=L;
             For i:=1 to Y-1 do T:=T^.Suivant;
             New(W);
             W^.A:=S;
             New(W^.Suivant);
             W^.Suivant:=T;
             Ls^.Suivant:=Nil;
             Ls^.Suivant:=W;
             Ls:=L;
             W:=Nil;
             W^.Suivant:=Nil;
             T:=Nil;
             T^.Suivant:=Nil;
           End;
          End;
         End;
       End;
   {-------------------------------------------------}
   Procedure AjouterApresUni (Var Ls1:UniList;P:String;Y:Integer);
       Var
         R,I:Integer;
         L,T,W:UniList;
       Begin
         L:=Ls1;
         R:=0;
         If ( Ls1 = Nil ) and ( Y = 1 ) then
                                            Begin
                                              New(Ls1);
                                              Ls1^.A:=P;
                                              Ls1^.Suivant:=Nil;
                                            End
         Else If ( Ls1 <> Nil ) then
         Begin
           for i:=1 to Y-1 Do
           Ls1:=Ls1^.suivant;
           If ( Ls1^.Suivant = Nil ) then
           Begin
             New(Ls1^.Suivant);
             Ls1:=Ls1^.Suivant;
             Ls1^.A:=P;
             Ls1^.Suivant:=Nil;
             Ls1:=L;
           End
           Else If ( Ls1^.Suivant <> Nil ) then
           Begin
             T:=L;
             For i:=1 to Y do T:=T^.Suivant;
             New(W);
             W^.A:=P;
             New(W^.Suivant);
             W^.Suivant:=T;
             Ls1^.Suivant:=Nil;
             Ls1^.Suivant:=W;
             Ls1:=L;
             W:=Nil;
             W^.Suivant:=Nil;
             T:=Nil;
             T^.Suivant:=Nil;
           End;
         End;
       End;
  {--------------- Exo 05 ----------------------- }
   Procedure InsUniTrie(Var Ls1:UniList;T:String);
      Var
        L:UniList;
        I,S:Integer;
      Begin
        I:=1;
        S:=0;
        L:=Ls1;
        While (L^.Suivant<>Nil) do
        Begin
          If (T>L^.A) then
                         Begin
                           AjouterApresUni(Ls1,T,I);
                           S:=1;
                         End;
          L:=L^.Suivant;
          i:=i+1;
        End;
        If (S=0) then AddBeforeUni(Ls1,T,1);
      End;
   {--------------- Exo 03 -----------------------}
   Procedure  AddbiDeut(Var Ls2:BiList);
      Var
        E:String;
        P:BiList;
      Begin
        Writeln('Tapez ici Le String Que Vous Voulez le Inserer');
        Readln(E);
        If (Ls2=Nil) then
                        Begin
                          New(Ls2);
                          New(Ls2^.Suivant);
                          New(Ls2^.Precedant);
                          Ls2^.A:=E;
                          Ls2^.Suivant:=Nil;
                          Ls2^.Precedant:=Nil;
                        End
        Else if (Ls2<>Nil) then
                              Begin
                                New(P);
                                New(P^.Suivant);
                                New(P^.Precedant);
                                P^.A:=E;
                                P^.Suivant:=Ls2;
                                P^.Precedant:=Nil;
                                Ls2^.Precedant:=P;
                                Ls2:=P;
                              End;
      End;
  {--------------- Exo 06 -----------------------}
   Procedure CopyUniInBi(Var Ls1:UniList;Var Ls2:BiList);
      Var
        L1:UniList;
        L2:BiList;
        I,X:Integer;
      Begin
        L1:=Ls1;
        L2:=Ls2;
        If (TailleUni(L1)>TailleBi(L2)) then X:=TailleBi(L2)
        else X:=TailleUni(L1);
        If (L1=Nil) and (L2=Nil) then Writeln('Les Deux liste sont vide')
        Else if (L1=Nil) and (L2<>Nil) then
                                           Begin
                                             Writeln('La Liste Uni est Vide');
                                           End
        Else if (L1<>Nil) and (L2=Nil) then
                                           Begin
                                             Writeln('La Liste Bi est Vide');
                                             New(L2);
                                             Ls2:=L2;
                                             For i:=1 to tailleUni(L1)-1 do
                                             Begin
                                               L2^.A:=L1^.A;
                                               New(L2^.Suivant);
                                               New(L2^.Precedant);
                                               L2^.Precedant:=L2;
                                               L2:=L2^.Suivant;
                                               L1:=L1^.Suivant;
                                             End;
                                             L2^.A:=L1^.A;
                                             L2^.Suivant:=Nil;
                                           End
        Else if (L1<>Nil) and (L2<>Nil) then
                                           Begin
                                             Writeln('Les Deux Liste Existe');
                                             For i:=1 to X-1 do
                                             Begin
                                               L2^.A:=L1^.A;
                                               L2:=L2^.Suivant;
                                               L1:=L1^.Suivant;
                                             End;
                                             L2^.A:=L1^.A;
                                           End;

      End;
      {--------------- Exo 07 -----------------------}
      Procedure AjouterApresBi (Var Ls2:BiList;X:String;Y:Integer);
       Var
         R,I:Integer;
         L,T,W:BiList;
       Begin
         L:=Ls2;
         R:=0;
         If ( Ls2 = Nil ) and ( Y = 1 ) then
                                            Begin
                                              New(Ls2);
                                              Ls2^.A:=X;
                                              New(Ls2^.Suivant);
                                              New(Ls2^.Precedant);
                                              Ls2^.Suivant:=Nil;
                                              Ls2^.Precedant:=Nil;
                                            End
         Else If (Ls2<>Nil) and (Y=1) then
                                          Begin
                                            New(W);
                                            New(W^.Suivant);
                                            New(W^.Precedant);
                                            W^.A:=X;
                                            W^.Suivant:=Ls2;
                                            Ls2^.Precedant:=W;
                                            W^.Precedant:=Nil;
                                            Ls2:=W;
                                          End
         Else If ( Ls2 <> Nil ) then
         Begin
           for i:=1 to Y-2 Do
           Ls2:=Ls2^.Suivant;
           If ( Ls2^.Suivant = Nil ) then
           Begin
             New(Ls2^.Suivant);
             New(Ls2^.Precedant);
             Ls2^.Precedant:=Ls2;
             Ls2:=Ls2^.Suivant;
             Ls2^.A:=X;
             Ls2^.Suivant:=Nil;
             Ls2:=L;
           End
           Else If ( Ls2^.Suivant <> Nil ) then
           Begin
             T:=L;
             For i:=1 to Y-1 do T:=T^.Suivant;
             New(W);
             W^.A:=X;
             New(W^.Suivant);
             New(W^.Precedant);
             W^.Suivant:=T;
             Ls2^.Suivant:=Nil;
             Ls2^.Suivant:=W;
             W^.Precedant:=Ls2;
             Ls2:=L;
             W:=Nil;
             W^.Suivant:=Nil;
             T:=Nil;
             T^.Suivant:=Nil;
           End;
         End;
       End;
  {--------------- Exo 09 -----------------------}
   Procedure SupprimerPremierBi(Var Ls2:BiList);
       Var
         L:BiList;
       Begin
         If ( Ls2 = Nil ) then Writeln('La Liste Est Vide')
         Else If ( Ls2 <> Nil ) and (Ls2^.Suivant = Nil ) then
                                                      Begin
                                                      Ls2^.Precedant:=Nil;
                                                      Ls2:=Nil;
                                                      End
         Else if ( Ls2 <> Nil ) and (Ls2^.Suivant <> Nil ) then
                                                       Begin
                                                       L:=Ls2;
                                                       Ls2:=Ls2^.Suivant;
                                                       Ls2^.Precedant:=Nil;
                                                       Dispose(L);
                                                       End;
       End;
  {--------------- Exo 10 -----------------------}
   Procedure SupprimerDernierBi (Var Ls2:BiList);
       Var
         L,T:BiList;
       Begin
         T:=Ls2;
         If ( Ls2 = Nil )  then Writeln('La List Est Vide')
         Else if ( Ls2 <> Nil ) and ( Ls2^.Suivant = Nil ) then
                                                           Begin
                                                             Ls2:=Nil;
                                                           End
         Else if ( Ls2 <> Nil ) and ( Ls2^.Suivant <> Nil )  then
                                                            Begin
                                                              While ( Ls2^.Suivant<> Nil ) do
                                                              Begin
                                                                If ( Ls2^.Suivant^.Suivant = Nil ) then
                                                                Begin
                                                                   L:=Ls2;
                                                                   Ls2:=Ls2^.Suivant;
                                                                   Ls2^.Suivant:=Nil;
                                                                   Ls2^.Precedant:=Nil;
                                                                   Ls2:=Nil;
                                                                   L^.Suivant := Nil ;
                                                                end
                                                                else Ls2:=Ls2^.suivant;
                                                              End;
                                                            End;
         Ls2:=T;
       End;
  {--------------- Exo 11 -----------------------}
  Procedure SupprimerSuivantBi (Var Ls2:BiList;X:Integer);
       Var
         S,A,T:BiList;
         I:Integer;
       Begin
       T:=Ls2;
       If ( Ls2 = Nil )  then Writeln('La Bi Est Liste Vide')
       Else if (Ls2<>Nil) and (Ls2^.Suivant=Nil) then SupprimerPremierBi(Ls2)
       Else if (Ls2<>Nil) and (Ls2^.Suivant=Nil) and (X=TailleBi(Ls2)) then SupprimerDernierBi(Ls2)
       Else If (Ls2<> Nil ) and (Ls2^.Suivant <> Nil ) then
                                      Begin
                                        For i:=1 to X-2 do
                                        Ls2:=Ls2^.Suivant;
                                        A:=Ls2^.Suivant;
                                        S:=A^.Suivant;
                                        Ls2^.Suivant:=Nil;
                                        A^.Suivant:=Nil;
                                        A:=Nil;
                                        Ls2^.Suivant:=S;
                                        S^.Precedant:=Ls2;
                                        S:=Nil;
                                        Ls2:=T;
                                      End;
       End;
   {--------------- Exo 12et13 -----------------------}
   Procedure InsertDebutOrEnd(Var Ls:BiList;Var Ls2:BiList);
      Var
        I:Integer;
        S1,S2:BiList;
      Begin
        S1:=Ls;
        S2:=Ls2;
        If (Ls=Nil) and (Ls2=Nil) then Writeln('Les Deux liste sont vides donc rien a inserer')
        Else if (Ls=Nil) and (Ls2<>Nil) then Writeln('Rien a Inserer')
        Else if (Ls<>Nil) and (Ls2=Nil) then Ls2:=Ls
        Else if (Ls<>Nil) and (Ls2<>Nil) then Begin
                                                For i:=1 to TailleBi(Ls)-1 do
                                                S1:=S1^.Suivant;
                                                New(S1^.Suivant);
                                                S1^.Suivant:=Ls2;
                                                Ls2^.Precedant:=S1;
                                                Ls2:=Ls;
                                                S1:=Nil;
                                              End;
      End;
   {--------------- Exo 14 -----------------------}
   Procedure InsertRangN(Var Ls,Ls2:BiList;X:Integer);
      Var
        L1,L2,S,P:BiList;
        I:Integer;
      Begin
        L1:=Ls;
        L2:=Ls2;
        If (L1=Nil) and (L2=Nil) then Writeln('Les Deux liste sont vides donc rien a inserer')
        Else if (L1=Nil) and (L2<>Nil) then Writeln('Rien a Inserer')
        Else if (L1<>Nil) and (L2=Nil) then Ls2:=Ls
        Else if (L1<>Nil) and (L2<>Nil) and (X=1) then InsertDebutOrEnd(Ls,Ls2)
        Else if (L1<>Nil) and (L2<>Nil) and (X=TailleBi(Ls2)) then InsertDebutOrEnd(Ls2,Ls)
        Else if (L1<>Nil) and (L2<>Nil) and (X<>TailleBi(Ls2)) and (X<>1) then Begin
                                                                                For i:=1 to X-1 Do
                                                                                L2:=L2^.Suivant;
                                                                                S:=L2^.Suivant;
                                                                                P:=L1;
                                                                                For i:=1 to TailleBi(Ls)-1 do
                                                                                L1:=L1^.Suivant;
                                                                                New (P^.Precedant);
                                                                                L2^.Suivant:=P;
                                                                                P^.Precedant:=L2;
                                                                                New(L1^.Suivant);
                                                                                L1^.Suivant:=S;
                                                                                S^.Precedant:=L1;
                                                                              End;
      End;
   {--------------- Exo 15_01 -----------------------}
   Procedure CheckTrieBi(Var Ls:BiList ; Var C:Char);
      Var
        L:BiList;
        A:Char;
        N,I,X,Y:Integer;
      Begin
        L:=Ls;
        A:='1';
        X:=1;
        Y:=1;
        N:=TailleBi(L);
        If (L=Nil) Then A:='1'
        Else if (L<>Nil) then
        Begin
          For i:=1 to N do
          Begin
            If (L^.A>L^.Suivant^.A) then X:=X+1
            Else If (L^.A<L^.Suivant^.A) then Y:=Y+1;
            L:=L^.Suivant;
          End;
          If (X=N) then A:='D'
          Else if (Y=N) then A:='C'
          Else A:='0';
        End;
        C:=A;
      End;
   {--------------- Exo 03 -----------------------}
   Procedure  AddbiDeut02(Var Ls2:BiList;X:String);
      Var
        E:String;
        P:BiList;
      Begin
        E:=X;
        If (Ls2=Nil) then
                        Begin
                          New(Ls2);
                          New(Ls2^.Suivant);
                          New(Ls2^.Precedant);
                          Ls2^.A:=E;
                          Ls2^.Suivant:=Nil;
                          Ls2^.Precedant:=Nil;
                        End
        Else if (Ls2<>Nil) then
                              Begin
                                New(P);
                                New(P^.Suivant);
                                New(P^.Precedant);
                                P^.A:=E;
                                P^.Suivant:=Ls2;
                                P^.Precedant:=Nil;
                                Ls2^.Precedant:=P;
                                Ls2:=P;
                              End;
      End;
   {--------------- Exo 01_2 ---------------------}
   Procedure   BiTrieDecData( Var L1:BiList );
      Var
        C:String;
        I,J:BiList;
      Begin
        If (L1=Nil) then Writeln('La Liste Est Vide')
        else If (L1<>Nil) then
          If(L1^.Suivant<>Nil) then
          Begin
            I:=L1;
            While (I^.Suivant<>Nil) do
            Begin
              J:=I^.Suivant;
              While (J<>Nil) do
              Begin
                If (J^.A>I^.A) then
                Begin
                  C:=J^.A;
                  J^.A:=I^.A;
                  I^.A:=C;
                End;
                J:=J^.Suivant;
              End;
              I:=I^.Suivant;
            End;
          End;
      End;
   {--------------- Exo 01_2 ---------------------}
   Procedure   BiTrieCroiData( Var L1:BiList );
      Var
        C:String;
        I,J:BiList;
      Begin
        If (L1=Nil) then Writeln('La Liste Est Vide')
        else If (L1<>Nil) then
          If(L1^.Suivant<>Nil) then
          Begin
            I:=L1;
            While (I^.Suivant<>Nil) do
            Begin
              J:=I^.Suivant;
              While (J<>Nil) do
              Begin
                If (J^.A<I^.A) then
                Begin
                  C:=J^.A;
                  J^.A:=I^.A;
                  I^.A:=C;
                End;
                J:=J^.Suivant;
              End;
              I:=I^.Suivant;
            End;
          End;
      End;
   {--------------- Exo 15 -----------------------}
   Procedure  InsertListStillTrie(Var L1,L2:BiList);
      Var
        S1,S2:BiList;
        S:String;
        A:Char;
        I:Integer;
      Begin
        S1:=L1;
        S2:=L2;
        CheckTrieBi(L2,A);
        Case A of
        '1':Writeln('La Bi Liste Est Vide');
        '0':Writeln('La Bi Liste L2 Nest Pas Triee');
        'D':Begin
              For i:=1 to TailleBi(L1) Do
              Begin
                S:=S1^.A;
                AddBiDeut02(L2,S);
                BiTrieDecData(L2);
                S1:=S1^.Suivant;
              End;
            End;
        'C':Begin
              For i:=1 to TailleBi(L1) Do
              Begin
                S:=S1^.A;
                AddBiDeut02(L2,S);
                BiTrieCroiData(L2);
                S1:=S1^.Suivant;
              End;
            End;
        End;
      End;
   {--------- Debut Du Programme -----------------}
   Var
     L1,LS1:UniList;
     L2,LS2,F,F2,L,Ls:BiList;
     N,I,Z,X:Integer;
     T:String;
   Begin
     Randomize;
     {---------Remplir La UniList --------------}
    { New(L1);
     Ls1:=L1;
     Writeln('Tapez ici la taille de votre liste');
     Readln(N);
     If N = 0 then Ls1:=Nil
     Else If N = 1 then Begin
                     L1^.A:=chr(Random(26)+64)+chr(Random(26)+64)+chr(Random(26)+64);
                     L1^.Suivant:=Nil;
                   End
     Else if N <> 1 then
     Begin
       For i:=1 to N-1 do
       Begin
         L1^.A:=chr(Random(26)+64)+chr(Random(26)+64)+chr(Random(26)+64);
         New(L1^.Suivant);
         L1:=L1^.Suivant;
       End;
     L1^.A:=chr(Random(26)+64)+chr(Random(26)+64)+chr(Random(26)+64);
     L1^.Suivant:=Nil;
     L1:=Ls1;
     End;
     T:='';
     {---------Choisir La Fonction Pour UniList ----------}
    { For i:=1 to 42 do
     Begin
       Writeln('Tapez Ici La fonction que vous voulez utulizer sur cette liste');
       Readln(Z);
       Case Z of
       0:UniTrieCroiData(Ls1);
       1:UniTrieDecPTR(Ls1);
       2:InverseUni(Ls1);
       3:CheckTrieUni(Ls1);
       4:Begin
           Writeln('Tapez ici Le String que vous voulez le inserer');
           Readln(T);
           InsUniTrie(Ls1,T);
         End;
       5:Writeln(TailleUni(Ls1));
       6:AfficherUni(Ls1);
       End;
     End;
     {---------Remplir La BiList --------------}
     New(L2);
     Ls2:=L2;
     Writeln('Tapez ici la taille de votre liste Bi');
     Readln(N);
     If N = 0 then Ls2:=Nil
     Else If N = 1 then Begin
                     L2^.A:=chr(Random(26)+64)+chr(Random(26)+64)+chr(Random(26)+64);
                     L2^.Suivant:=Nil;
                     L2^.Precedant:=Nil;
                   End
     Else if N <> 1 then
     Begin
       For i:=1 to N-1 do
       Begin
         L2^.A:=chr(Random(26)+64)+chr(Random(26)+64)+chr(Random(26)+64);
         New(L2^.Suivant);
         New(L2^.Precedant);
         L2^.Precedant:=L2;
         L2:=L2^.Suivant;
       End;
     L2^.A:=chr(Random(26)+64)+chr(Random(26)+64)+chr(Random(26)+64);
     L2^.Suivant:=Nil;
     F2:=L2;
     L2:=Ls2;
     End;
     {---------Remplir La BiList2 --------------}
     New(L);
     Ls:=L;
     Writeln('Tapez ici la taille de votre liste Bi 2');
     Readln(N);
     If N = 0 then Ls:=Nil
     Else If N = 1 then Begin
                     L^.A:=chr(Random(26)+64)+chr(Random(26)+64)+chr(Random(26)+64);
                     L^.Suivant:=Nil;
                     L^.Precedant:=Nil;
                   End
     Else if N <> 1 then
     Begin
       For i:=1 to N-1 do
       Begin
         L^.A:=chr(Random(26)+64)+chr(Random(26)+64)+chr(Random(26)+64);
         New(L^.Suivant);
         New(L^.Precedant);
         L^.Precedant:=L;
         L:=L^.Suivant;
       End;
     L^.A:=chr(Random(26)+64)+chr(Random(26)+64)+chr(Random(26)+64);
     L^.Suivant:=Nil;
     F:=L;
     L:=Ls;
     End;
     AfficherBi(Ls);
     {---------Choisir La Fonction Pour UniList ----------}
     For i:=1 to 42 do
     Begin
       Writeln('Tapez Ici La fonction que vous voulez utulizer sur cette liste');
       Readln(Z);
       Case Z of
       0:AddBiDeut(Ls2);
       1:CopyUniInBi(Ls1,Ls2);
       2:Begin
             Writeln('Tapez ici Le String que vous voulez le inserer');
             Readln(T);
             Writeln('Tapez ici le nemuro de votre Rang pour Ajouter le X dans');
             Readln(X);
             While (X>TailleBi(Ls2)) and (X<0) and (X<>1) do
             Begin
               Writeln('Tapez un nemuro qui existe dans la liste');
               Readln(X);
             End;
             AjouterApresBi(Ls2,T,X);
          End;
       3:Begin
             Writeln('Tapez ici Le String que vous voulez le inserer');
             Readln(T);
             AjouterApresBi(Ls2,T,TailleBi(Ls2)+1);
          End;
       4:SupprimerPremierBi(Ls2);
       5:SupprimerDernierBi(Ls2);
       6:Begin
            Writeln('Tapez ici le nemuro de votre element X Pour Le Supprimer');
            Readln(X);
            While (X>TailleBi(Ls2)) or (X<0) do
            Begin
               Writeln('Tapez un nemuro qui existe dans la liste');
               Readln(X);
            End;
            SupprimerSuivantBi(Ls2,X);
          End;
       7:InsertDebutOrEnd(Ls,Ls2);
       8:InsertDebutOrEnd(Ls2,Ls);
       9:Begin
           Writeln('Tapez ici le nemuro de votre element X Pour Le Rang');
           Readln(X);
           While (X>TailleBi(Ls2)) or (X<0) do
           Begin
             Writeln('Tapez un nemuro qui existe dans la liste');
             Readln(X);
           End;
           InsertRangN(Ls,Ls2,X);
         End;
       10:InsertListStillTrie(Ls,Ls2);
       11:BiTrieCroiData(Ls2);
       12:BiTrieDecData(Ls2);
       13:Writeln(TailleBi(Ls2));
       14:AfficherBi(Ls2);
       End;
     End;
   Readln;
   End.
