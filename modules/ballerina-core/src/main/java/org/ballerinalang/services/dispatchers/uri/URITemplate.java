/*
*  Copyright (c) 2016, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
*
*  WSO2 Inc. licenses this file to you under the Apache License,
*  Version 2.0 (the "License"); you may not use this file except
*  in compliance with the License.
*  You may obtain a copy of the License at
*
*    http://www.apache.org/licenses/LICENSE-2.0
*
*  Unless required by applicable law or agreed to in writing,
*  software distributed under the License is distributed on an
*  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
*  KIND, either express or implied.  See the License for the
*  specific language governing permissions and limitations
*  under the License.
*/

package org.ballerinalang.services.dispatchers.uri;

import org.ballerinalang.model.Resource;
import org.ballerinalang.services.dispatchers.uri.parser.Literal;
import org.ballerinalang.services.dispatchers.uri.parser.Node;
import org.ballerinalang.services.dispatchers.uri.parser.TestResource;
import org.ballerinalang.services.dispatchers.uri.parser.URITemplateParser;

import java.util.Map;

/**
 * Basic URI Template implementation.
 *
 **/

public class URITemplate {

    private static URITemplate uriTemplate;
    private Node syntaxTree;

    private URITemplate(Node syntaxTree) {
        this.syntaxTree = syntaxTree;
//        if (!"/".equals(template) && template.endsWith("/")) {
//            template = template.substring(0, template.length() - 1);
//        }
//        URITemplateParser parser = new URITemplateParser();
//        syntaxTree = parser.parse(template);
    }

    public String expand(Map<String, String> variables) {
        return null;
    }

    public TestResource matches(String uri, Map<String, String> variables) {
        return syntaxTree.matchAll(uri, variables, 0);
    }

    public void parse(String template, TestResource resource) throws URITemplateException {
        if (!"/".equals(template) && template.endsWith("/")) {
            template = template.substring(0, template.length() - 1);
        }

        if (template.startsWith("/")) {
            template = template.substring(1);
        }

        URITemplateParser parser = new URITemplateParser(syntaxTree);
        parser.parse(template, resource);
    }

    public static URITemplate getInstance() {
        if (uriTemplate == null) {
            try {
                uriTemplate = new URITemplate(new Literal("/"));
            } catch (URITemplateException e) {
            }
            return uriTemplate;
        } else {
            return uriTemplate;
        }
    }
}
