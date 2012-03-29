/****************************************************************************
**
** Copyright (C) 2010 Nokia Corporation and/or its subsidiary(-ies).
** All rights reserved.
** Contact: Nokia Corporation (qt-info@nokia.com)
**
** This file is part of the QtDeclarative module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** No Commercial Usage
** This file contains pre-release code and may not be distributed.
** You may use this file in accordance with the terms and conditions
** contained in the Technology Preview License Agreement accompanying
** this package.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU Lesser General Public License version 2.1 requirements
** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Nokia gives you certain additional
** rights.  These rights are described in the Nokia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** If you have questions regarding the use of this file, please contact
** Nokia at qt-info@nokia.com.
**
**
**
**
**
**
**
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 1.0

Item {
    id: scrolls
    visible:  true
    property variant scrollArea
    property variant orientation: Qt.Vertical

    opacity: 0

    function position()
             {
                 var ny = 0;
                 if (scrolls.orientation == Qt.Vertical)
                     ny = scrollArea.visibleArea.yPosition * scrolls.height;
                 else
                     ny = scrollArea.visibleArea.xPosition * scrolls.width;
                 if (ny > 2) return ny; else return 2;
             }

             function size()
             {
                 var nh, ny;

                 if (scrolls.orientation == Qt.Vertical)
                     nh = scrollArea.visibleArea.heightRatio * scrolls.height;
                 else
                     nh = scrollArea.visibleArea.widthRatio * scrolls.width;

                 if (scrolls.orientation == Qt.Vertical)
                     ny = scrollArea.visibleArea.yPosition * scrolls.height;
                 else
                     ny = scrollArea.visibleArea.xPosition * scrolls.width;

                 if (ny > 3) {
                     var t;
                     if (scrolls.orientation == Qt.Vertical)
                         t = Math.ceil(scrolls.height - 3 - ny);
                     else
                         t = Math.ceil(scrolls.width - 3 - ny);
                     if (nh > t) return t; else return nh;
                 } else return nh + ny;
             }

             Rectangle { anchors.fill: parent; color: "Black"; opacity: 0.5 }

             BorderImage {
                 source: "img/scroll.png"
                 border { left: 1; right: 1; top: 1; bottom: 1 }
                 x: scrolls.orientation == Qt.Vertical ? 2 : position()
                 width: scrolls.orientation == Qt.Vertical ? scrolls.width - 4 : size()
                 y: scrolls.orientation == Qt.Vertical ? position() : 2
                 height: scrolls.orientation == Qt.Vertical ? size() : scrolls.height - 4
             }

             states: State {
                 name: "visible"
                 when: scrolls.orientation == Qt.Vertical ? scrollArea.movingVertically : scrollArea.movingHorizontally
                 PropertyChanges { target: scrolls; opacity: 1.0 }
             }

             transitions: Transition {
                 from: "visible"; to: ""
                 NumberAnimation { properties: "opacity"; duration: 600 }
             }


}
