#ifndef DATALISTMODEL_H
#define DATALISTMODEL_H

#include <QAbstractListModel>
#include <QStringList>

class Data
{
public:
    Data(const QString &type, const QString &size);

    QString type() const;
    QString size() const;

private:
    QString m_type;
    QString m_size;
};

class DataListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum AnimalRoles {
        TypeRole = Qt::UserRole + 1,
        SizeRole1
    };

    DataListModel(QObject *parent = 0);
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
    Q_INVOKABLE void insert(int index, const Data &data);
    Q_INVOKABLE void append(const Data &data);
    Q_INVOKABLE void remove(int index);
    Q_INVOKABLE void append(const QVariantMap map);

signals:
    void countChanged(int arg);

private:
    int count() const;

protected:
    QHash<int, QByteArray> roleNames() const;

private:
    QList<Data> m_list;
};

#endif // DATALISTMODEL_H
