package com.topcoder.apps.review.accuracytests;

/**
 * @author TCDEVELOPER
 * @version 1.0
 */

import servletunit.struts.MockStrutsTestCase;

import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.BusinessDelegate;
import com.topcoder.apps.review.*;
import com.topcoder.apps.review.projecttracker.*;

/**
 * <p>Test the AggregationAction classes.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class TestEditProject extends MockStrutsTestCase {
    /**
     * Business delegate instance.
     */
    private BusinessDelegate businessDelegate = null;

    /**
     * Initialize the business delegate for the tests.
     */
    public TestEditProject(String testName) {
        super(testName);
        businessDelegate = new BusinessDelegate();
        businessDelegate.setUseMockup(true);
    }

    /**
     * Initialize for the tests.
     */
    public void setUp() throws Exception {
        super.setUp();
        setConfigFile("conf/struts-config.xml");
    }

    /**
     * Tear down for the tests.
     */
    public void tearDown() throws Exception {
        super.tearDown();
    }

    /**
     * Test the success view.
     */
    public void testEditTerminate() {
        User user = businessDelegate.getUserByHandle("pzhao");
        UserProjectInfo[] infos = businessDelegate.getUserProjectInfos();
        // settting utility
        SecurityEnabledUser seUser = new SecurityEnabledUser(user.getId(),
                user.getHandle(), user.getFirstName(), user.getLastName(), user.getEmail(),
                null, null);
        UtilityBean utility = new UtilityBean(seUser);
        getSession().setAttribute(Constants.UTILITY_KEY, utility);

        getSession().setAttribute(Constants.USER_KEY, user);
        getSession().setAttribute(Constants.PROJECT_LIST_KEY, infos);
        addRequestParameter("id", "1");
        addRequestParameter("action", "terminate");
        setRequestPathInfo("/editProject");
        actionPerform();

        verifyForward("terminate");
        ProjectForm form = (ProjectForm) getSession().getAttribute("projectForm");
        assertNotNull(form);
        assertEquals(form.getId(), 1);  // because in request in was 1

        verifyNoActionErrors();
    }

    /**
     * Test the success view.
     */
    public void testEditEdit() {
        User user = businessDelegate.getUserByHandle("pzhao");
        UserProjectInfo[] infos = businessDelegate.getUserProjectInfos();
        // settting utility
        SecurityEnabledUser seUser = new SecurityEnabledUser(user.getId(),
                user.getHandle(), user.getFirstName(), user.getLastName(), user.getEmail(),
                null, null);
        UtilityBean utility = new UtilityBean(seUser);
        getSession().setAttribute(Constants.UTILITY_KEY, utility);

        getSession().setAttribute(Constants.USER_KEY, user);
        getSession().setAttribute(Constants.PROJECT_LIST_KEY, infos);
        addRequestParameter("id", "1");
        addRequestParameter("action", "edit");
        setRequestPathInfo("/editProject");
        actionPerform();

        verifyForward("success");
        ProjectForm form = (ProjectForm) getSession().getAttribute("projectForm");
        assertNotNull(form);
        assertEquals(form.getId(), 1);  // because in request in was 1

        verifyNoActionErrors();
    }

}
