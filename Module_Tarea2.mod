MODULE Module1
        CONST robtarget Target_Bgeneral:=[[-250,480,370],[0,0,1,0],[1,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1_1_2:=[[256.448,296.808,370],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1_1:=[[256.448,296.808,170],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1_2_2:=[[340,10,370],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1_2:=[[340,10,170],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1_3_2:=[[256.448,-300,370],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1_3:=[[256.448,-300,170],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_2_1:=[[450,296.808,170],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_2_1_2:=[[450,296.808,370],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_2_2_2:=[[450,10,370],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_2_2:=[[450,10,170],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_2_3_2:=[[450,-300,370],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_2_3:=[[450,-300,170],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_home:=[[592.894191624,0,629.5],[0.5,0,0.866025404,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_B1_1:=[[-450,280,150],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_B1_2:=[[-450,280,370],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_B2_1:=[[-450,380,150],[0,0,1,0],[1,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_B2_2:=[[-450,380,370],[0,0,1,0],[1,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_B3_1:=[[-350,380,150],[0,0,1,0],[1,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_B3_2:=[[-350,380,370],[0,0,1,0],[1,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    
!***********************************************************
    !
    ! Module:  Module1
    !
    ! Description:
    !   <Insert description here>
    !
    ! Author: juand
    !
    ! Version: 1.0
    !
    !***********************************************************
    
    
    !***********************************************************
    !
    ! Procedure main
    !
    !   This is the entry point of your program
    !
    !***********************************************************
    PROC main()
        IF start=0 THEN
            RETURN;
        ENDIF
        IF obj1=1 AND obj2=0 AND obj3=0 THEN
            Path_Pick_B1;
            Path_to_Pos;
            Path_Place_B1;
            MoveJ Target_home,v100,fine,Ventosa\WObj:=wobj0;
        ELSEIF obj1=0 AND obj2=1 AND obj3=0 THEN
            Path_Pick_B2;
            Path_to_Pos;
            Path_Place_B2;
            MoveJ Target_home,v100,fine,Ventosa\WObj:=wobj0;
        ELSEIF obj1=0 AND obj2=0 AND obj3=1 THEN
            Path_Pick_B3;
            Path_to_Pos;
            Path_Place_B3;
            MoveJ Target_home,v100,fine,Ventosa\WObj:=wobj0;
        ENDIF
    ENDPROC
    PROC Path_to_Pos()
        IF pos1=1 AND pos2=0 AND pos3=0 AND pos4=0 AND pos5=0 AND pos6=0 THEN
            Path_1_1;
        ELSEIF pos1=0 AND pos2=1 AND pos3=0 AND pos4=0 AND pos5=0 AND pos6=0 THEN
            Path_1_2;
        ELSEIF pos1=0 AND pos2=0 AND pos3=1 AND pos4=0 AND pos5=0 AND pos6=0 THEN
            Path_1_3;
        ELSEIF pos1=0 AND pos2=0 AND pos3=0 AND pos4=1 AND pos5=0 AND pos6=0 THEN
            Path_2_1;
        ELSEIF pos1=0 AND pos2=0 AND pos3=0 AND pos4=0 AND pos5=1 AND pos6=0 THEN
            Path_2_2;
        ELSEIF pos1=0 AND pos2=0 AND pos3=0 AND pos4=0 AND pos5=0 AND pos6=1 THEN
            Path_2_3;
        ENDIF
    ENDPROC
    PROC Path_1_1()
        MoveL Target_Bgeneral,v100,fine,Ventosa\WObj:=wobj0;
        MoveJ Target_1_1_2,v100,fine,Ventosa\WObj:=wobj0;
        MoveL Target_1_1,v100,fine,Ventosa\WObj:=wobj0;
    ENDPROC
    PROC Path_1_2()
        MoveL Target_Bgeneral,v100,fine,Ventosa\WObj:=wobj0;
        MoveJ Target_1_2_2,v100,fine,Ventosa\WObj:=wobj0;
        MoveL Target_1_2,v100,fine,Ventosa\WObj:=wobj0;
    ENDPROC
    PROC Path_1_3()
        MoveL Target_Bgeneral,v100,fine,Ventosa\WObj:=wobj0;
        MoveJ Target_1_3_2,v100,fine,Ventosa\WObj:=wobj0;
        MoveL Target_1_3,v100,fine,Ventosa\WObj:=wobj0;
    ENDPROC
    PROC Path_2_1()
        MoveL Target_Bgeneral,v100,fine,Ventosa\WObj:=wobj0;
        MoveJ Target_2_1,v100,fine,Ventosa\WObj:=wobj0;
        MoveL Target_2_1_2,v100,fine,Ventosa\WObj:=wobj0;
    ENDPROC
    PROC Path_2_2()
        MoveL Target_Bgeneral,v100,fine,Ventosa\WObj:=wobj0;
        MoveJ Target_2_2_2,v100,fine,Ventosa\WObj:=wobj0;
        MoveL Target_2_2,v100,fine,Ventosa\WObj:=wobj0;
    ENDPROC
    PROC Path_2_3()
        MoveL Target_Bgeneral,v100,fine,Ventosa\WObj:=wobj0;
        MoveJ Target_2_3_2,v100,fine,Ventosa\WObj:=wobj0;
        MoveL Target_2_3,v100,fine,Ventosa\WObj:=wobj0;
    ENDPROC
    PROC Path_Pick_B1()
        MoveJ Target_home,v100,fine,Ventosa\WObj:=wobj0;
        MoveJ Target_B1_1,v100,fine,Ventosa\WObj:=wobj0;
        PulseDO att_object_1;
        WaitTime 1;
        MoveL Target_B1_2,v100,fine,Ventosa\WObj:=wobj0;
        MoveL Target_Bgeneral,v100,fine,Ventosa\WObj:=wobj0;
    ENDPROC
    PROC Path_Place_B1()
        WaitTime 1;
        PulseDO det_object_1;
    ENDPROC
    PROC Path_Place_B3()
        WaitTime 1;
        PulseDO det_obj_3;
    ENDPROC
    PROC Path_Place_B2()
        WaitTime 1;
        PulseDO det_obj_2;
    ENDPROC
    PROC Path_Pick_B2()
        MoveJ Target_home,v100,fine,Ventosa\WObj:=wobj0;
        MoveJ Target_B2_1,v100,fine,Ventosa\WObj:=wobj0;
        PulseDO att_obj_2;
        WaitTime 1;
        MoveL Target_B2_2,v100,fine,Ventosa\WObj:=wobj0;
        MoveL Target_Bgeneral,v100,fine,Ventosa\WObj:=wobj0;
    ENDPROC
    PROC Path_Pick_B3()
        MoveJ Target_home,v100,fine,Ventosa\WObj:=wobj0;
        MoveJ Target_B3_1,v100,fine,Ventosa\WObj:=wobj0;
        PulseDO att_obj_3;
        WaitTime 1;
        MoveL Target_B3_2,v100,fine,Ventosa\WObj:=wobj0;
        MoveL Target_Bgeneral,v100,fine,Ventosa\WObj:=wobj0;
    ENDPROC
ENDMODULE