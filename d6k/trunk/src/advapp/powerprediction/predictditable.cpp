#include "predictditable.h"

CPredictDiTable::CPredictDiTable(QWidget* parent, std::vector <CDiInput *> &vecDi, IMainModuleInterface* pCore)
	:QTableView(parent),m_pCore(pCore)
{
	Q_ASSERT(pCore);
	if (!pCore)
	{
		return;
	}

	m_pPredictSortModel = new CPredictSortProxyModel(this);
	m_pPredictSortModel->clear();

	m_pModel = new CPredictDiModel(this, vecDi, pCore);

	m_pPredictSortModel->setSourceModel(m_pModel);

	setModel(m_pPredictSortModel);

	setContextMenuPolicy(Qt::CustomContextMenu);

	setSortingEnabled(true);

	connect(this, SIGNAL(doubleClicked(const QModelIndex&)), this, SLOT(DoubleClicked(const QModelIndex&)));

	connect(this, SIGNAL(customContextMenuRequested(const QPoint&)), this, SLOT(ShowMouseRightButton(const QPoint&)));

}


CPredictDiTable::~CPredictDiTable()
{

}

void CPredictDiTable::DoubleClicked(const QModelIndex& index)
{
	int nColumn = index.column();

	auto indexTmp = m_pPredictSortModel->mapToSource(index);


}


void CPredictDiTable::ShowMouseRightButton(const QPoint& point)
{
	QModelIndex indexSelect = m_pPredictSortModel->mapToSource(this->indexAt(point));

	QMenu *pMenu = new QMenu(nullptr);

	QAction *pAddPoint = new QAction(tr("Add Point"), pMenu);

	pAddPoint->setIcon(QIcon(":/images/list-add.png"));

	pMenu->addAction(pAddPoint);

	QAction *pDeletePoint = new QAction(tr("Delete Point"), pMenu);

	pMenu->addAction(pDeletePoint);

	pDeletePoint->setIcon(QIcon(":/images/list-remove.png"));

	pMenu->addAction(pDeletePoint);

	QAction* selectItem = pMenu->exec(QCursor::pos());

	if (selectItem == pAddPoint)
	{
		AddAnalogPoint(indexSelect);
	}
	else if (selectItem == pDeletePoint)
	{
		DeleteAnalogPoint(indexSelect);
	}

	pMenu->deleteLater();

}


void CPredictDiTable::AddAnalogPoint(QModelIndex& index)
{
	int nRow = index.row();
	auto ai = m_pModel->GetDis();
	nRow = (int)ai.size();
	m_pModel->InsertRows(nRow, 5);
}

void CPredictDiTable::DeleteAnalogPoint(QModelIndex& index)
{
	int nRow = index.row();

	m_pModel->RemoveRows(nRow, 1);
}