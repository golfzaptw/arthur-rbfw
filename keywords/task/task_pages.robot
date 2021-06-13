*** Variables ***
&{dict_task}
...    btn_add_task=xpath=//*[@class="content-wrapper"]//*[contains(@class,"page-header")]//*[contains(text(),"${translation_common}[add_tasks]")]
...    lbl_search_relate=css=#s2id_TaskRelatedLookupId
...    inp_ddl_search=css=#select2-drop input[type="text"]
...    sel_result_label=xpath=//*[@class="select2-result-label" and contains(text(),"{expected_result}")]
...    txt_description=css=#TaskDescription
...    inp_save_task=css=input[value="Save Task"]
...    lbl_relate_property=css=.data-item-relationship
...    inp_search_task=css=.filter input#_q
...    btn_search_task=css=.filter input[type="submit"]
...    table_result_tasks=css=table.tasks
