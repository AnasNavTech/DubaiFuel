PageExtension 50010 "Sales Order Subform Ext" extends "Sales Order Subform"
{
    Caption = 'Sales Order Subform';
    layout
    {


        modify("Line Amount")
        {
            Visible = "Line AmountVisible";
        }
        addafter("No.")
        {
            field(Cancelled; Rec.Cancelled)
            {
                ApplicationArea = Basic;
                Editable = false;
            }
            field("Vehicle Code"; Rec."Vehicle Code")
            {
                ApplicationArea = Basic;
            }
            field("Driver No."; Rec."Driver No.")
            {
                ApplicationArea = Basic;
            }

            field("Driver Name"; Rec."Driver Name")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        modify("Dr&op Shipment")
        {
            Visible = false;
        }
        addafter("&Line")
        {
            group(ActionGroup1908000504)
            {
                Caption = 'Item Availability by';
                action(Action1908000604)
                {
                    ApplicationArea = Basic;
                    Caption = 'Period';

                    trigger OnAction()
                    begin
                        ItemAvailFormsMgt.ShowItemAvailFromSalesLine(Rec, ItemAvailFormsMgt.ByPeriod)

                    end;
                }
                action(Action1908000704)
                {
                    ApplicationArea = Basic;
                    Caption = 'Variant';

                    trigger OnAction()
                    begin
                        ItemAvailFormsMgt.ShowItemAvailFromSalesLine(Rec, ItemAvailFormsMgt.ByPeriod)

                    end;
                }
                action(Action1908000804)
                {
                    ApplicationArea = Basic;
                    Caption = 'Location';

                    trigger OnAction()
                    begin

                        ItemAvailFormsMgt.ShowItemAvailFromSalesLine(Rec, ItemAvailFormsMgt.ByPeriod)

                    end;
                }
            }
            action(Action1908000904)
            {
                ApplicationArea = Basic;
                Caption = 'Reservation Entries';
                Image = ReservationLedger;

                trigger OnAction()
                begin

                    rec.ShowReservationEntries(true);

                end;
            }
            action(Action1908001004)
            {
                ApplicationArea = Basic;
                Caption = 'Item &Tracking Lines';
                Image = ItemTrackingLines;
                ShortCutKey = 'Shift+Ctrl+I';

                trigger OnAction()
                begin

                    rec.OpenItemTrackingLines();

                end;
            }
            action(Action1908001104)
            {
                ApplicationArea = Basic;
                Caption = 'Select Item Substitution';
                Image = SelectItemSubstitution;

                trigger OnAction()
                begin
                    rec.ShowItemSub();

                end;
            }
            action(Action1908001204)
            {
                ApplicationArea = Basic;
                Caption = 'Dimensions';
                Image = Dimensions;
                ShortCutKey = 'Shift+Ctrl+D';

                trigger OnAction()
                begin
                    Rec.ShowDimensions()

                end;
            }
            action(Action1908001304)
            {
                ApplicationArea = Basic;
                Caption = 'Co&mments';
                Image = ViewComments;

                trigger OnAction()
                begin
                    rec.ShowLineComments();

                end;
            }
            action(Action1908001404)
            {
                ApplicationArea = Basic;
                Caption = 'Item Charge &Assignment';

                trigger OnAction()
                begin
                    ItemChargeAssgnt;

                end;
            }
            action(Action1908001504)
            {
                ApplicationArea = Basic;
                Caption = 'Order &Promising';

                trigger OnAction()
                begin
                    OrderPromisingLine();

                end;
            }
        }
        addafter("Select Nonstoc&k Items")
        {
            action(Action1908001604)
            {
                ApplicationArea = Basic;
                Caption = 'Get Price';
                Ellipsis = true;

                trigger OnAction()
                begin
                    ShowPrices();

                end;
            }
            action(Action1908001704)
            {
                ApplicationArea = Basic;
                Caption = 'Get Li&ne Discount';
                Ellipsis = true;

                trigger OnAction()
                begin
                    ShowLineDisc();

                end;
            }
            action(Action1908001804)
            {
                ApplicationArea = Basic;
                Caption = 'E&xplode BOM';
                Image = ExplodeBOM;

                trigger OnAction()
                begin
                    ExplodeBOM;

                end;
            }
            action(Action1908001904)
            {
                ApplicationArea = Basic;
                Caption = 'Insert &Ext. Texts';

                trigger OnAction()
                begin
                    InsertExtendedText(true);

                end;
            }
            action(Action1908002004)
            {
                ApplicationArea = Basic;
                Caption = '&Reserve';
                Ellipsis = true;

                trigger OnAction()
                begin
                    Rec.ShowReservation();

                end;
            }
            action(Action1908002104)
            {
                ApplicationArea = Basic;
                Caption = 'Order &Tracking';

                trigger OnAction()
                begin
                    ShowTracking;

                end;
            }
            action(Action1908002204)
            {
                ApplicationArea = Basic;
                Caption = 'Nonstoc&k Items';

                trigger OnAction()
                begin
                    ShowNonstockItems;

                end;
            }
        }
        addafter("Speci&al Order")
        {
            group(ActionGroup1908000104)
            {
                Caption = 'Dr&op Shipment';
                action(Action1908000204)
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase &Order';
                    Image = Document;

                    trigger OnAction()
                    begin
                        OpenPurchOrderForm;

                    end;
                }
            }
            group(ActionGroup1908000304)
            {
                Caption = 'Speci&al Order';
                action(Action1908000404)
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase &Order';
                    Image = Document;

                    trigger OnAction()
                    begin
                        OpenSpecialPurchOrderForm;

                    end;
                }
            }
        }
    }

    var
        UserSetup: Record "User Setup";

    var
        [InDataSet]
        "Unit PriceVisible": Boolean;
        [InDataSet]
        "Line AmountVisible": Boolean;



    trigger OnAfterGetRecord()
    begin
        //GTFS-Biswajit-31st March 2013-St
        IF UserSetup.GET(USERID) THEN BEGIN
            IF UserSetup."Sales Price Visible" THEN BEGIN
                "Unit PriceVisible" := TRUE;
                "Line AmountVisible" := TRUE;
            END
            ELSE BEGIN
                "Unit PriceVisible" := FALSE;
                "Line AmountVisible" := FALSE;
            END
        END;
        //GTFS-Biswajit-31st March 2013-En

    end;



    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        "Line AmountVisible" := TRUE;
        "Unit PriceVisible" := TRUE;
    end;




    trigger OnOpenPage()
    begin

        //GTFS-Biswajit-31st March 2013-St
        IF UserSetup.GET(USERID) THEN BEGIN
            IF UserSetup."Sales Price Visible" THEN BEGIN
                "Unit PriceVisible" := TRUE;
                "Line AmountVisible" := TRUE;
            END
            ELSE BEGIN
                "Unit PriceVisible" := FALSE;
                "Line AmountVisible" := FALSE;
            END
        END;
        //GTFS-Biswajit-31st March 2013-En

    end;

    procedure CancelLine(SalesHeader2: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
    begin
        SalesLine.Reset;
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."Document No.");
        SalesLine.SetRange("Line No.", Rec."Line No.");
        if SalesLine.FindFirst then begin
            if SalesLine.Quantity <> SalesLine."Quantity Invoiced" then begin
                SalesLine.Cancelled := true;
                SalesLine."Qty. to Ship" := 0;
                SalesLine.Modify;
            end
            else
                Error('There is nothing to cancel');
        end;
        CurrPage.Update;
    end;

    var
        ItemAvailFormsMgt: Codeunit "Item Availability Forms Mgt";
}

