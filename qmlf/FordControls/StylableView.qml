import QtQuick 2.7

item {
    id: stylableViewBaseRoot

    /**
     * @property rootScreenId - Screen that should be activated when this screen is closed.
     */
    property string rootScreenId: ""

    // Public properties
    /**
     * @property styleComponent - The view's style component
     */
    property alias styleComponent: stylableItem.styleComponent

    // Internal properties
    /**
     * @property __style - An internal helper property for direct access to the style instance
     */
    property alias __style: stylableItem.__style

    //It's a reference to platform handler, any view who is interested in platform should initialize it
    property var hmiPlatformHandler
    //It's a reference ot map view, used for do map related platform command, any view who is interested in map related vca should initialize it
    property var mapViewForPlatform

    /**
     * Now home screen had changed mechanism:
     *     View maybe visible but it's covered by home screen or other special view.
     *     So we assume the view is in background state when it's invisible or covered
    **/
    property bool isInBackgroundState: !visible


   // Encapsulated stylable item
    StylableItemBase {
        id: stylableItem
    }

    function dp(aSize) {
        return stylableItem.dp(aSize);
    }


    // Default deactivation handler
    onDeactivated: {
        visible = false;
    }

    // Default activation handler
    onActivated: {
        visible = true;
    }

    /**
     * execute map related platform command
     * must have at least 1 arguments, arguments format is:
     *          arguments[0] (platformCommandType or int): platform command type
     *          arguments[...]                      : arguments from platform dispather
     */
    function doMapRelatedPlatformCommand() {
        if (!hmiPlatformHandler ||
            !mapViewForPlatform) {
            return ;
        }

        var isSucceed = false;

        if (!hmiPlatformHandler.isValidPlatformArguments(arguments)) {
            hmiPlatformHandler.notifyExecuteResult(isSucceed);
            return ;
        }

        var platformCmdType = arguments[0];

        if (platformCmdType === hmiPlatformHandler.hmiSupportedPlatformCommandType.ZoomIn) {
            isSucceed = privateMethods.doZoomIn();
        }
        else if (platformCmdType === hmiPlatformHandler.hmiSupportedPlatformCommandType.ZoomOut) {
            isSucceed = privateMethods.doZoomOut();
        }
        else if (platformCmdType === hmiPlatformHandler.hmiSupportedPlatformCommandType.ChangeMapOrientation) {
            isSucceed = privateMethods.doChangeOrientation(arguments[1]);
        }

        hmiPlatformHandler.notifyExecuteResult(isSucceed);
    }

    QtObject {
        id: privateMethods

        function doZoomIn() {
            var isSucceed = false;

            if (mapViewForPlatform.zoom > 0) {
                mapViewForPlatform.zoom = mapViewForPlatform.zoom - 1;
                isSucceed = true;
            }

            return isSucceed;
        }

        function doZoomOut() {
            var isSucceed = false;

            if (mapViewForPlatform.zoom < 18) {
                mapViewForPlatform.zoom = mapViewForPlatform.zoom + 1;
                isSucceed = true;
            }

            return isSucceed;
        }

        function doChangeOrientation(orientation) {
            var isSucceed = false;

            if (orientation !== mapViewForPlatform.renderingMode) {
                mapViewForPlatform.renderingMode = orientation;
                SettingsModel.renderingMode = orientation;
                isSucceed = true;
            }

            return isSucceed;
        }
    }
}
