PageExtension 50008 "Sales Order Ext" extends "Sales Order"
{


    layout
    {
        modify("Quote No.")
        {
            Visible = false;
        }
        modify("Campaign No.")
        {
            Visible = false;
        }
        modify("Opportunity No.")
        {
            Visible = false;
        }
        modify("Responsibility Center")
        {
            Visible = false;
        }
        modify("Assigned User ID")
        {
            Visible = false;
        }

        modify(Control1903720907)
        {
            Visible = false;
        }
        modify(Control1902018507)
        {
            Visible = false;
        }
        modify(Control1900316107)
        {
            Visible = false;
        }
        modify(Control1906127307)
        {
            Visible = false;
        }
        modify(Control1901314507)
        {
            Visible = false;
        }

        modify(Control1907012907)
        {
            Visible = false;
        }
        modify(Control1901796907)
        {
            Visible = false;
        }
        modify(Control1907234507)
        {
            Visible = false;
        }
        modify(Control1900383207)
        {
            Visible = false;
        }
        modify(Control1905767507)
        {
            Visible = false;
        }
        addafter("Sell-to Contact")
        {
            field(Cancelled; Rec.Cancelled)
            {
                ApplicationArea = Basic;
                Editable = false;
            }
            label(Control1000000005)
            {
                ApplicationArea = Basic;
                CaptionClass = Text19026427;
                Style = Favorable;
                StyleExpr = true;
            }
            field("SalesComments[1]"; SalesComments[1])
            {
                ApplicationArea = Basic;
                Editable = false;
                Style = Strong;
                StyleExpr = true;
            }
            field("SalesComments[2]"; SalesComments[2])
            {
                ApplicationArea = Basic;
                Editable = false;
                Style = Strong;
                StyleExpr = true;
            }
        }
        addafter("Ship-to Contact")
        {
            field("Pre-printed DO No."; Rec."Pre-printed DO No.")
            {
                ApplicationArea = Basic;
            }
        }
        moveafter("Sell-to Contact"; "Posting Date")
    }
    actions
    {
        modify(Statistics)
        {
            Visible = false;
        }
        modify("Co&mments")
        {
            Visible = false;
        }
        modify(Invoices)
        {
            Visible = false;
        }


        modify("In&vt. Put-away/Pick Lines")
        {
            Visible = false;
        }
        modify("Pla&nning")
        {
            Visible = false;
        }



        addafter("O&rder")
        {
            group("&Line")
            {
                Caption = '&Line';
                separator(Action71)
                {
                }
                action("Cancel SO")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel SO';

                    trigger OnAction()
                    begin
                        //GTFSDFSC1.00-Biswajit-03.05.11-Start

                        if Rec.Cancelled then
                            Error('Sales Order %1 is Already Cancelled', Rec."No.")
                        else begin
                            SalesLine.Reset;
                            SalesLine.SetRange("Document Type", Rec."Document Type");
                            SalesLine.SetRange("Document No.", Rec."No.");
                            if SalesLine.FindFirst then
                                repeat
                                    SalesLine.Cancelled := true;
                                    SalesLine."Qty. to Ship" := 0;
                                    SalesLine.Modify;
                                until SalesLine.Next = 0;
                            Rec.Cancelled := true;
                            Rec.Modify;
                        end;
                        CurrPage.Update;

                        //GTFSDFSC1.00-Biswajit-03.05.11-End
                    end;
                }
                action("Cancel SO Line")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel SO Line';

                    trigger OnAction()
                    begin
                        //GTFSDFSC1.00-Biswajit-03.05.11-Start
                        CurrPage.SalesLines.Page.CancelLine(Rec);

                        Check := false;
                        SalesLine.Reset;
                        SalesLine.SetRange("Document Type", Rec."Document Type");
                        SalesLine.SetRange("Document No.", Rec."No.");
                        if SalesLine.FindFirst then
                            repeat
                                if not SalesLine.Cancelled then
                                    Check := true;
                            until SalesLine.Next = 0;

                        if not Check then begin
                            Rec.Cancelled := true;
                            Rec.Modify;
                        end;
                        CurrPage.Update;
                        //GTFSDFSC1.00-Biswajit-03.05.11-End
                    end;
                }
                action("Reopen SO")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reopen SO';

                    trigger OnAction()
                    begin
                        //GTFSDFSC1.00-Biswajit-03.05.11-Start
                        if Rec.Cancelled then begin
                            Message('Sales Order %1 has been Reopened', Rec."No.");
                            Rec.Cancelled := false;
                            CurrPage.Editable := true;
                            //User:=UPPERCASE(USERID);
                            Rec.Modify;
                            SalesLine.Reset;
                            SalesLine.SetRange("Document Type", Rec."Document Type");
                            SalesLine.SetRange("Document No.", Rec."No.");
                            if SalesLine.FindFirst then
                                repeat
                                    if SalesLine.Cancelled then
                                        SalesLine.Cancelled := false;
                                    SalesLine.Modify;
                                until SalesLine.Next = 0;
                            SalesLine.Reset;

                        end
                        else
                            Error('Sales Order %1 is Already Open', Rec."No.");
                        //GTFSDFSC1.00-Biswajit-03.05.11-End
                    end;
                }
            }
        }
        addafter(Reopen)
        {
            action(Shipped)
            {
                ApplicationArea = Basic;
                Caption = 'Shipped';

                trigger OnAction()
                begin
                    // Rec.Status := Rec.Status::Shipped; //TODO
                    Rec.Modify;
                end;
            }
        }
    }

    var
        SalesLine: Record "Sales Line";
        Check: Boolean;
        SalesCommentLine: Record "Sales Comment Line";
        SalesComments: array[2] of Text[80];

    var
        Text19026427: label 'Comments:';


    trigger OnAfterGetRecord()
    begin
        CLEAR(SalesComments);
        SalesCommentLine.RESET;
        SalesCommentLine.SETRANGE("Document Type", Rec."Document Type");
        SalesCommentLine.SETRANGE("No.", Rec."No.");
        IF SalesCommentLine.FIND('-') THEN BEGIN
            SalesComments[1] := SalesCommentLine.Comment;
            IF SalesCommentLine.NEXT <> 0 THEN
                SalesComments[2] := SalesCommentLine.Comment;
        END;
    end;

}

