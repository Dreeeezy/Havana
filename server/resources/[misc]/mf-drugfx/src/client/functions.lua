-----------------------------------------------------------------------------------------------------------------------------------------
-- function PointOnSphere
-----------------------------------------------------------------------------------------------------------------------------------------
function PointOnSphere(alt, azu, radius, orgX, orgY, orgZ)
    local toradians = 0.017453292384744
    alt, azu, radius, orgX, orgY, orgZ = (tonumber(alt or 0) or 0) * toradians, (tonumber(azu or 0) or 0) * toradians,
        tonumber(radius or 0) or 0, tonumber(orgX or 0) or 0, tonumber(orgY or 0) or 0, tonumber(orgZ or 0) or 0
    if vector3 then
        return vector3(orgX + radius * math.sin(azu) * math.cos(alt), orgY + radius * math.cos(azu) * math.cos(alt),
            orgZ + radius * math.sin(alt))
    end
end
