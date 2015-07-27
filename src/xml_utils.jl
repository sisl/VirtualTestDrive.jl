function ==(sent::ETree, received::ETree)
    
    if sent.name == received.name &&
       sent.attr == received.attr
        if isempty(sent.elements)
            return true 
        end
        for elem_sent in sent.elements
            if isa(elem_sent, ETree)
                # there must be one of these in received
                elem_rec_index = 0

                for (i,node) in enumerate(received.elements)
                    if isa(node, ETree) && node.name == elem_sent.name
                        elem_rec_index = i
                        break
                    end
                end

                if elem_rec_index != 0 &&
                   elem_sent == received.elements[elem_rec_index]

                   return true
               end
            end
        end
    end

    false
end

message_payload_to_etree(message::SCPMessage) = message_payload_to_etree(string_from_buffer(message.payload))
function message_payload_to_etree(payload::String)
    str = "<MSG>" * payload * "</MSG>"
    root = xp_parse(str)
    index_of_first_etree = findfirst(e->isa(e, ETree), root.elements)
    @assert(index_of_first_etree != 0)
    root.elements[index_of_first_etree]::ETree
end

function message_contains_packet_with_element(message::ETree, name::String, elementname::String)
    if message.name == name
        payload = message.elements[findfirst(elem->isa(elem, ETree), message.elements)]
        if payload.name == elementname
            return true
        end
    end
    false
end
function message_contains_packet_with_element(message::SCPMessage, name::String, elementname::String)
    str = "<MSG>" * string_from_buffer(message.payload) * "</MSG>"
    for node in xp_parse(str).elements
        if isa(node, ETree)
            if message_contains_packet_with_element(node, name, elementname)
                return true
            end
        end
    end
    false
end