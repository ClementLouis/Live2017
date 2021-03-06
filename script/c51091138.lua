--導爆線
--Blasting Wire
--Scripted by Eerie Code
function c51091138.initial_effect(c)
	--activate
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_DESTROY)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e1:SetCondition(c51091138.condition)
	e1:SetTarget(c51091138.target)
	e1:SetOperation(c51091138.activate)
	c:RegisterEffect(e1)
end
function c51091138.condition(e,tp,eg,ep,ev,re,r,rp)
	return e:GetHandler():IsLocation(LOCATION_SZONE)
end
function c51091138.target(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	local c=e:GetHandler()
	if chkc then return chkc:IsLocation(LOCATION_ONFIELD) and aux.checksamecolumn(chkc,c) end
	if chk==0 then return Duel.IsExistingTarget(aux.checksamecolumn,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,1,c,c) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DESTROY)
	local g=Duel.SelectTarget(tp,aux.checksamecolumn,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,1,1,c,c)
	e:SetLabel(seq)
	Duel.SetOperationInfo(0,CATEGORY_DESTROY,g,1,0,0)
end
function c51091138.activate(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetFirstTarget()
	if tc:IsRelateToEffect(e) then
		Duel.Destroy(tc,REASON_EFFECT)
	end
end
