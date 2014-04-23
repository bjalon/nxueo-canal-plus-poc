package org.nuxeo.canal.plus.bean;

import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Observer;
import org.nuxeo.ecm.automation.AutomationService;
import org.nuxeo.ecm.automation.InvalidChainException;
import org.nuxeo.ecm.automation.OperationContext;
import org.nuxeo.ecm.automation.OperationException;
import org.nuxeo.ecm.core.api.CoreSession;
import org.nuxeo.ecm.platform.ui.web.api.NavigationContext;
import org.nuxeo.runtime.api.Framework;

@Name("documentAuditActionsBean")
public class DocumentAuditActionsBean {
	
	public static final String EVENT_NAME = "documentSelectionChanged";
	
    
    @In
    protected CoreSession documentManager;

    @In
    protected NavigationContext navigationContext;

	@Observer(EVENT_NAME)
	public void documentNavigationListener() throws InvalidChainException, OperationException, Exception {
		AutomationService service = Framework.getLocalService(AutomationService.class);
        OperationContext ctx = new OperationContext(documentManager);
        ctx.setInput(navigationContext.getCurrentDocument());
        service.run(ctx, "eh_ui_audit", null);
	}

}
