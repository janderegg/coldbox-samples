<?xml version="1.0" encoding="ISO-8859-1"?>
<Config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xsi:noNamespaceSchemaLocation="http://www.coldboxframework.com/schema/config_3.0.0.xsd">
	<Settings>
		<Setting name="AppName"						value="feedReader"/>
		<Setting name="DebugMode" 					value="false" />
		<Setting name="DebugPassword" 				value=""/>
		<Setting name="ReinitPassword" 				value=""/>
		<Setting name="EventName" 					value="event"/>
		<Setting name="DefaultEvent" 				value="youtube.index"/>
		<Setting name="RequestStartHandler" 		value="main.onRequestStart"/>
		<Setting name="RequestEndHandler" 			value=""/>
		<Setting name="ApplicationStartHandler" 	value="main.onAppInit"/>
		<Setting name="SessionStartHandler" 		value=""/>
		<Setting name="SessionEndHandler" 			value=""/>
		<Setting name="UDFLibraryFile" 				value="includes/helpers/ApplicationHelper.cfm" />
		<Setting name="ExceptionHandler"			value="" />
		<Setting name="onInvalidEvent" 				value="" />
		<Setting name="CustomErrorTemplate"			value="" />
		<Setting name="HandlersIndexAutoReload"   	value="false" />
		<Setting name="ConfigAutoReload"          	value="false" />
		<Setting name="PluginsExternalLocation"   		value="" />
		<Setting name="ViewsExternalLocation" 		value=""/>
		<Setting name="HandlersExternalLocation"   	value="" />
		<Setting name="HandlerCaching" 				value="true"/>
		<Setting name="EventCaching" 				value="true"/>
		<Setting name="RequestContextDecorator" 	value=""/>
		<Setting name="ProxyReturnCollection" 		value="false"/>
		<Setting name="FlashURLPersistScope" 		value="session"/>
	</Settings>

	<YourSettings>
		<Setting name="ColdBoxSideBar" value="false" />
		<Setting name="APURL" value="http://hosted.ap.org/lineups/WORLDHEADS-rss_2.0.xml" />
		<Setting name="BBCIntURL" value="http://newsrss.bbc.co.uk/rss/newsonline_uk_edition/world/rss.xml" />
	    <Setting name="FlickrURL" value="http://api.flickr.com/services/feeds/photos_public.gne" />
	    <Setting name="FlickrTags" value="all" />
	    <Setting name="ReutersURL" value="http://feeds.reuters.com/reuters/topNews" />
	    <Setting name="YouTubeURL" value="http://gdata.youtube.com/feeds/api/videos" />
	    <Setting name="YouTubeDefaultStartIndex" value="1" />
	    <Setting name="YouTubeDefaultMaxResults" value="5" />
 	</YourSettings>
 	
 	<!-- 
		ColdBox Logging via LogBox
		Levels: -1=OFF,0=FATAL,1=ERROR,2=WARN,3=INFO,4=DEBUG,5=TRACE
	-->
	<LogBox>
		<!-- Log to console -->
		<Appender name="console" class="coldbox.system.logging.appenders.ConsoleAppender" />
		<!-- Log to ColdBox Files -->
		<Appender name="coldboxfile" class="coldbox.system.logging.appenders.AsyncRollingFileAppender">
			<Property name="filePath">logs</Property>
			<Property name="fileName">${AppName}</Property>
			<Property name="autoExpand">true</Property>
			<Property name="fileMaxSize">2000</Property>
			<Property name="fileMaxArchives">2</Property>		
		</Appender>
		<!-- Root Logger Definition -->
		<Root levelMin="FATAL" levelMax="DEBUG" appenders="*" />
		<!-- Category Definitions Below -->
	</LogBox>
	
	<DebuggerSettings>
		<PersistentRequestProfiler>true</PersistentRequestProfiler>
		<maxPersistentRequestProfilers>10</maxPersistentRequestProfilers>
		<maxRCPanelQueryRows>50</maxRCPanelQueryRows>
		
		<TracerPanel 	show="true" expanded="true" />
		<InfoPanel 		show="true" expanded="true" />
		<CachePanel 	show="true" expanded="false" />
		<RCPanel		show="true" expanded="false" />
	</DebuggerSettings>

	<MailServerSettings>
		<MailServer></MailServer>
		<MailPort>25</MailPort>
		<MailUsername></MailUsername>
		<MailPassword></MailPassword>
	</MailServerSettings>

	<BugTracerReports>

	</BugTracerReports>

	<WebServices />

	<Layouts>
		<DefaultLayout>Layout.Main.cfm</DefaultLayout>
    <Layout file="Layout.YouTube.cfm" name="youtube">
    	<Folder>youtube</Folder>
    </Layout>
    <Layout file="Layout.Flickr.cfm" name="flickr">
        <Folder>flickr</Folder>
    </Layout>
	</Layouts>

	<i18N />

	<Datasources>
		<!-- <Datasource alias="MyDSNAlias" name="real_dsn_name"   dbtype="mysql"  username="" password="" /> -->
	</Datasources>
	
	<!--ColdBox Object Caching Settings Overrides the Framework-wide settings -->
	<Cache>
		<ObjectDefaultTimeout>45</ObjectDefaultTimeout>
		<ObjectDefaultLastAccessTimeout>15</ObjectDefaultLastAccessTimeout>
		<UseLastAccessTimeouts>true</UseLastAccessTimeouts>
		<ReapFrequency>1</ReapFrequency>
		<MaxObjects>50</MaxObjects>
		<FreeMemoryPercentageThreshold>0</FreeMemoryPercentageThreshold>
		<EvictionPolicy>LRU</EvictionPolicy>
	</Cache>

	<Interceptors>
		<Interceptor class="coldbox.system.interceptors.environmentControl">
			<Property name='configFile'>config/environments.xml.cfm</Property>
		</Interceptor>
		<Interceptor class="coldbox.system.interceptors.autowire">
			<Property name='enableSetterInjection'>true</Property>
		</Interceptor>
		<Interceptor class="coldbox.system.interceptors.ses">
			<Property name="configFile">config/routes.cfm</Property>
		</Interceptor>
	</Interceptors>
	
</Config>