codeunit 50003 "Gen. Jnl.-Post Line Ext"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitGLEntry', '', true, true)]
    local procedure "Gen. Jnl.-Post Line_OnAfterInitGLEntry"
   (
       var GLEntry: Record "G/L Entry";
       GenJournalLine: Record "Gen. Journal Line";
       Amount: Decimal;
       AddCurrAmount: Decimal;
       UseAddCurrAmount: Boolean;
       var CurrencyFactor: Decimal;
       var GLRegister: Record "G/L Register"
   )
    begin
        GLEntry.Narration := GenJournalLine.Narration;
    end;

    var
        myInt: Integer;
}