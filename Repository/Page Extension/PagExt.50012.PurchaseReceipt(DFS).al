PageExtension 50012 "Purchase Order Ext" extends "Purchase Order"
{


    Caption = 'Purchase Receipt';



    layout
    {
        modify(Control1903326807)
        {
            Visible = false;
        }

        modify(Control1901138007)
        {
            Visible = false;
        }
        modify(Control1904651607)
        {
            Visible = false;
        }
        modify(Control1903435607)
        {
            Visible = false;
        }
        modify(Control1906949207)
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
        addafter(Status)
        {
            field(Cancelled; Rec.Cancelled)
            {
                ApplicationArea = Basic;
                Editable = false;
            }
        }
    }
    actions
    {
        modify("Test Report")
        {
            Visible = false;
        }
        modify("Post and &Print")
        {
            Visible = false;
        }
        modify("Post &Batch")
        {
            Visible = false;
        }
        modify("Prepa&yment")
        {
            Visible = false;
        }
        modify("Prepayment Test &Report")
        {
            Visible = false;
        }
        modify(PostPrepaymentInvoice)
        {
            Visible = false;
        }
        modify("Post and Print Prepmt. Invoic&e")
        {
            Visible = false;
        }
        modify(PostPrepaymentCreditMemo)
        {
            Visible = false;
        }
        modify("Post and Print Prepmt. Cr. Mem&o")
        {
            Visible = false;
        }
        modify("&Print")
        {
            Enabled = false;
        }





        addafter("O&rder")
        {
            group("&Line")
            {
                Caption = '&Line';
                separator(Action192)
                {
                }
                action(PrintPO)
                {
                    ApplicationArea = all;
                    Caption = 'Print PO';
                    Image = Print;
                    trigger OnAction()
                    begin

                        IF Rec.Status = Rec.Status::Released THEN BEGIN
                            PurchHeader.RESET;
                            PurchHeader.SETRANGE("Document Type", Rec."Document Type");
                            PurchHeader.SETRANGE("No.", Rec."No.");
                            REPORT.RUN(50059, TRUE, TRUE, PurchHeader);
                        END
                        ELSE
                            ERROR('Status must be Released');
                    end;


                }


                action("Cancel PO")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel PO';

                    trigger OnAction()
                    begin
                        if Rec.Cancelled then
                            Error('Purchase Order %1 is Already Cancelled', Rec."No.")
                        else begin
                            PurchLine.Reset;
                            PurchLine.SetRange(PurchLine."Document Type", Rec."Document Type");
                            PurchLine.SetRange(PurchLine."Document No.", Rec."No.");
                            if PurchLine.FindFirst then
                                repeat
                                    PurchLine.Cancelled := true;
                                    PurchLine."Qty. to Receive" := 0;
                                    PurchLine.Modify;
                                until PurchLine.Next = 0;
                            Rec.Cancelled := true;
                            Rec.Modify;
                        end;
                        CurrPage.Update;
                    end;
                }
                action("Cancel Line")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Line';

                    trigger OnAction()
                    begin
                        CurrPage.PurchLines.Page.CancelLine(Rec);

                        Check := false;
                        PurchLine.Reset;
                        PurchLine.SetRange("Document Type", Rec."Document Type");
                        PurchLine.SetRange("Document No.", Rec."No.");
                        if PurchLine.FindFirst then
                            repeat
                                if not PurchLine.Cancelled then
                                    Check := true;
                            until PurchLine.Next = 0;

                        if not Check then begin
                            Rec.Cancelled := true;
                            Rec.Modify;
                        end;
                        CurrPage.Update;
                    end;
                }
                action("Reopen PO")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reopen PO';

                    trigger OnAction()
                    begin
                        if Rec.Cancelled then begin
                            Message('Purchase Order %1 has been Reopened', Rec."No.");
                            Rec.Cancelled := false;
                            CurrPage.Editable := true;
                            Rec.User := UpperCase(UserId);
                            Rec.Modify;
                            PurchLine.Reset;
                            PurchLine.SetRange("Document Type", Rec."Document Type");
                            PurchLine.SetRange("Document No.", Rec."No.");
                            if PurchLine.FindFirst then
                                repeat
                                    if PurchLine.Cancelled then
                                        PurchLine.Cancelled := false;
                                    PurchLine.Modify;
                                until PurchLine.Next = 0;
                            PurchLine.Reset;

                        end
                        else
                            Error('Purchase Order %1 is Already Open', Rec."No.");
                    end;
                }
            }
        }
    }

    var
        PurchLine: Record "Purchase Line";
        Check: Boolean;
        PurchHeader: Record "Purchase Header";
}

