import QtQuick 2.0
import Sailfish.Silica 1.0
import "../js/Logic.js" as Logic

Page {
    id: page

    SlideshowView {
        id: view
        width: page.width
        height: page.height
        itemWidth: width

        model: VisualItemModel {
            NowPlaying {}
            ComingSoon {}
        }
    }




}
