--Gladius the Cursed Cyclops
local s,id=GetID()
function s.initial_effect(c)
	---Cannot declare an attack unless you send 1 card from your Hand to the GY
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ATTACK_COST)
	e1:SetCost(function(e,c,tp) return Duel.IsExistingMatchingCard(Card.IsAbleToGraveAsCost,tp,LOCATION_HAND,0,1,nil) end)
	e1:SetOperation(s.atkcostop)
	c:RegisterEffect(e1)
end

function s.atkcostop(e,tp,eg,ep,ev,re,r,rp)
	if Duel.IsAttackCostPaid()~=2 and e:GetHandler():IsLocation(LOCATION_MZONE) then
		local g=Duel.GetMatchingGroup(Card.IsAbleToGraveAsCost,tp,LOCATION_HAND,0,nil)
		local sg=aux.SelectUnselectGroup(g,e,tp,0,1,nil,1,tp,HINTMSG_TOGRAVE,function() return Duel.IsAttackCostPaid()==0 end,nil)
		if #sg==1 then
			Duel.SendtoGrave(sg,REASON_COST)
			Duel.AttackCostPaid()
		else
			Duel.AttackCostPaid(2)
		end
	end
end