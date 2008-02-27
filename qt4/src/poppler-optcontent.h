/* poppler-optcontent.h: qt interface to poppler
 *
 * Copyright (C) 2007, Brad Hards <bradh@kde.org>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA 02110-1301, USA.
 */

#ifndef POPPLER_OPTCONTENT_H
#define POPPLER_OPTCONTENT_H

#include <QtCore/QAbstractListModel>
#include <QtCore/QStringList>

class OptionalContentGroup;
class OCGs;
class Array;

namespace Poppler
{
  class OptContentItem;
  class OptContentModel;
  class OptContentModelPrivate;

  class OptContentModel : public QAbstractItemModel
  {
    Q_OBJECT

    public:
    OptContentModel( OCGs *optContent, QObject *parent = 0);
    virtual ~OptContentModel();

    void setRootNode(OptContentItem *node);

    QModelIndex index(int row, int column, const QModelIndex &parent) const;
    QModelIndex parent(const QModelIndex &child) const;

    int rowCount(const QModelIndex &parent = QModelIndex()) const;
    int columnCount(const QModelIndex &parent) const;

    QVariant data(const QModelIndex &index, int role) const;
    virtual bool setData ( const QModelIndex & index, const QVariant & value, int role = Qt::EditRole );

    Qt::ItemFlags flags ( const QModelIndex & index ) const;

    private:
    OptContentModelPrivate *d;
  };
}

#endif
