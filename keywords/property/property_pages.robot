*** Variables ***
&{dict_property}
...    btn_add_properties=xpath=//*[@class="content"]//*[contains(@class,"page-header")]//*[contains(text(),"${translation_common}[add_properties]")]
...    inp_search_property=css=.filter input#_q
...    btn_search_property=css=.filter input[type="submit"]
...    table_result_properties=css=table.properties
...    lbl_multiple_unit=css=.head.multiple-unit
...    inp_property_name=css=#ProfileAddressName
...    inp_property_address=css=#ProfileAddress1
...    ddl_property_owner=css=#s2id_PropertyOwnerId
...    sel_result_label=xpath=//*[@class="select2-result-label" and contains(text(),"{expected_result}")]
...    chk_manage_property=css=#PropertyFullAccess
...    inp_property_unit=css=#PropertyUnitCount
...    inp_btn_next_page=css=input.next-page
...    sel_unit_type=css=.unit-setting select[data-type="prefix-unit-type-id"]
...    inp_unit_manager=css=.unit-setting div#s2id_PrefixUnitUnitManagerManagerPersonId
...    inp_unit_agent=css=.unit-setting div#s2id_PrefixUnitUnitAgentEntityId
...    table_multiple_unit=css=.multi-unit-table #MultiUnitIdUnitOwnerId
...    sel_multi_unit=xpath=//*[@class="multi-unit-table"]//tr[{position}]//*[@id="MultiUnitIdUnitOwnerId"]
...    inp_btn_add_property=css=input[value="${translation_common}[add_properties]"]