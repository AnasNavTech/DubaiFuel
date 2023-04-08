PageExtension 50014 "Purchase Order Subform Ext" extends "Purchase Order Subform"
{
    Caption = 'Purchase Order Subform';
    layout
    {


        modify("Direct Unit Cost")
        {
            Visible = false;
        }
        modify("Unit Cost (LCY)")
        {
            Visible = false;
        }
        modify("Unit Price (LCY)")
        {
            Visible = false;
        }
        modify("Line Amount")
        {
            Visible = false;
        }
        modify("Line Discount %")
        {
            Visible = false;
        }
        modify("Line Discount Amount")
        {
            Visible = false;
        }
        modify("Inv. Discount Amount")
        {
            Visible = false;
        }
        modify("Qty. to Invoice")
        {
            Visible = false;
        }
        modify("Quantity Invoiced")
        {
            Visible = false;
        }
        addafter("Work Center No.")
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
        addafter(ItemChargeAssignment)
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
                        ItemAvailFormsMgt.ShowItemAvailFromPurchLine(Rec, ItemAvailFormsMgt.ByPeriod)


                    end;
                }
                action(Action1908000704)
                {
                    ApplicationArea = Basic;
                    Caption = 'Variant';

                    trigger OnAction()
                    begin
                        ItemAvailFormsMgt.ShowItemAvailFromPurchLine(Rec, ItemAvailFormsMgt.ByVariant())

                    end;
                }
                action(Action1908000804)
                {
                    ApplicationArea = Basic;
                    Caption = 'Location';

                    trigger OnAction()
                    begin
                        ItemAvailFormsMgt.ShowItemAvailFromPurchLine(Rec, ItemAvailFormsMgt.ByLocation())

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
                    Rec.OpenItemTrackingLines();

                end;
            }
            action(Action1908001104)
            {
                ApplicationArea = Basic;
                Caption = 'Dimensions';
                Image = Dimensions;
                ShortCutKey = 'Shift+Ctrl+D';

                trigger OnAction()
                begin
                    rec.ShowDimensions()

                end;
            }
            action(Action1908001204)
            {
                ApplicationArea = Basic;
                Caption = 'Co&mments';
                Image = ViewComments;

                trigger OnAction()
                begin
                    Rec.ShowLineComments();

                end;
            }
            action(Action1908001304)
            {
                ApplicationArea = Basic;
                Caption = 'Item Charge &Assignment';

                trigger OnAction()
                begin
                    rec.ShowItemChargeAssgnt();

                end;
            }
        }
        addafter(OrderTracking)
        {
            action(Action1908001404)
            {
                ApplicationArea = Basic;
                Caption = 'E&xplode BOM';
                Image = ExplodeBOM;

                trigger OnAction()
                var
                    Text001: Label 'You cannot use the Explode BOM function because a prepayment of the purchase order has been invoiced.';
                begin
                    IF Rec."Prepmt. Amt. Inv." <> 0 THEN
                        ERROR(Text001);
                    CODEUNIT.RUN(CODEUNIT::"Purch.-Explode BOM", Rec);



                end;
            }
            action(Action1908001504)
            {
                ApplicationArea = Basic;
                Caption = 'Insert &Ext. Texts';

                trigger OnAction()
                begin

                    InsertExtendedText(true);

                end;
            }
            action(Action1908001604)
            {
                ApplicationArea = Basic;
                Caption = '&Reserve';
                Ellipsis = true;

                trigger OnAction()
                begin

                    rec.ShowReservation();


                end;
            }
            action(Action1908001704)
            {
                ApplicationArea = Basic;
                Caption = 'Order &Tracking';

                trigger OnAction()
                begin

                    ShowTracking;

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
                    Caption = 'Sales &Order';
                    Image = Document;

                    trigger OnAction()
                    begin

                        OpenSpecOrderSalesOrderForm();

                    end;
                }
            }
            group(ActionGroup1908000304)
            {
                Caption = 'Speci&al Order';
                action(Action1908000404)
                {
                    ApplicationArea = Basic;
                    Caption = 'Sales &Order';
                    Image = Document;

                    trigger OnAction()
                    begin

                        OpenSpecOrderSalesOrderForm;

                    end;
                }
            }
        }
    }



    trigger OnDeleteRecord(): Boolean
    var

    begin

        IF Rec.Cancelled THEN
            ERROR('You Can not Delete a Cancelled Line');

    end;

    procedure CancelLine(PurchHeader2: Record "Purchase Header")
    var
        PurchLine: Record "Purchase Line";
    begin
        PurchLine.Reset;
        PurchLine.SetRange("Document Type", Rec."Document Type");
        PurchLine.SetRange("Document No.", Rec."Document No.");
        PurchLine.SetRange("Line No.", Rec."Line No.");
        if PurchLine.FindFirst then begin
            if PurchLine.Quantity <> PurchLine."Quantity Invoiced" then begin
                PurchLine.Cancelled := true;
                PurchLine."Qty. to Receive" := 0;
                PurchLine.Modify;
            end
            else
                Error('There is nothing to cancel');
        end;
        CurrPage.Update;
    end;

    var
        ItemAvailFormsMgt: Codeunit "Item Availability Forms Mgt";

}

