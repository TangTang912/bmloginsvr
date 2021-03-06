﻿#pragma execution_character_set("utf-8")

#include "newskudlg.h"
#include "ui_newskudlg.h"
#include "gfunctions.h"
#include <QMessageBox>
#include <qdebug.h>
#include "SqlManager.h"
#include "CategoryManager.h"

NewSKUDlg::NewSKUDlg(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::NewSKUDlg)
{
    ui->setupUi(this);

    m_bExecuteNextStep = false;
    m_nCategorySeq = 0;

    createWidgets();
}

NewSKUDlg::~NewSKUDlg()
{
    delete ui;
}


void NewSKUDlg::createWidgets()
{
    setWindowTitle(QStringLiteral("第一步：生成SKU码"));

    connect(ui->pushButton, SIGNAL(clicked()), this, SLOT(onNextStep()));
    connect(ui->comboBox, SIGNAL(currentIndexChanged(int)), this, SLOT(onSelectChanged(int)));
    connect(ui->comboBox_2, SIGNAL(currentIndexChanged(int)), this, SLOT(onSelectChanged(int)));
    connect(ui->comboBox_3, SIGNAL(currentIndexChanged(int)), this, SLOT(onSelectChanged(int)));

    //onSelectChanged(0);
    loadComboContent(NULL);
    //calcSKUCode();
}

void NewSKUDlg::loadComboContent(QComboBox *_pWidget)
{
    //  初始化
    QStringList xParents;
    QStringList xCategorys;

    if(_pWidget == NULL)
    {
        ui->comboBox->clear();

        if(CategoryManager::getInstance()->getCategoryByParent(xParents, xCategorys))
        {
            //  1
            for(int i = 0; i < xCategorys.size(); ++i)
            {
                QString& _refStrItem = xCategorys[i];

                if(i % 2 == 0)
                {
                    ui->comboBox->addItem(_refStrItem, xCategorys[i + 1]);
                }
            }

            loadComboContent(ui->comboBox);
        }
        else
        {
            qDebug() << "failed to getCategoryByParent";
        }
    }
    else if(_pWidget == ui->comboBox)
    {
        ui->comboBox_2->clear();
        ui->comboBox_3->clear();

        //  根据1读取2
        QString xText1 = ui->comboBox->currentText();
        if(xText1.isEmpty())
        {
            return;
        }

        xParents << xText1;
        if(CategoryManager::getInstance()->getCategoryByParent(xParents, xCategorys))
        {
            //  1
            for(int i = 0; i < xCategorys.size(); ++i)
            {
                QString& _refStrItem = xCategorys[i];

                if(i % 2 == 0)
                {
                    ui->comboBox_2->addItem(_refStrItem, xCategorys[i + 1]);
                }
            }

            loadComboContent(ui->comboBox_2);
        }
    }
    else if(_pWidget == ui->comboBox_2)
    {
        ui->comboBox_3->clear();

        //  根据2读取3
        QString xText1 = ui->comboBox->currentText();
        if(xText1.isEmpty())
        {
            return;
        }
        QString xText2 = ui->comboBox_2->currentText();
        if(xText2.isEmpty())
        {
            return;
        }

        xParents << xText1 << xText2;

        if(CategoryManager::getInstance()->getCategoryByParent(xParents, xCategorys))
        {
            //  1
            for(int i = 0; i < xCategorys.size(); ++i)
            {
                QString& _refStrItem = xCategorys[i];

                if(i % 2 == 0)
                {

                    ui->comboBox_3->addItem(_refStrItem, xCategorys[i + 1]);
                }
            }
        }
    }
    else if(_pWidget == ui->comboBox_3)
    {

    }
}


//  slots
void NewSKUDlg::onNextStep()
{
    qDebug() << __FUNCTION__;

    if(m_xSKUNumber.isEmpty())
    {
        QMessageBox::warning(this, QStringLiteral("警告"), QStringLiteral("请选择正确的类别"));
    }
    else
    {
        m_bExecuteNextStep = true;
        accept();
    }
}

void NewSKUDlg::onSelectChanged(int _index)
{
    QObject* pObj = sender();

    if(pObj->isWidgetType())
    {
        QComboBox* pWidget = static_cast<QComboBox*>(pObj);
        loadComboContent(pWidget);
        calcSKUCode();
    }
}

void NewSKUDlg::calcSKUCode()
{
    m_xSKUNumber.clear();

    if(ui->comboBox->count() == 0 ||
            ui->comboBox_2->count() == 0 ||
            ui->comboBox_3->count() == 0)
    {
        ui->lineEdit->clear();
        return;
    }

    QString xFstCategory = ui->comboBox->itemData(ui->comboBox->currentIndex()).toString();
    QString xSecCategory = ui->comboBox_2->itemData(ui->comboBox_2->currentIndex()).toString();
    QString xTrdCategory = ui->comboBox_3->itemData(ui->comboBox_3->currentIndex()).toString();

    if(xFstCategory.isEmpty() ||
            xSecCategory.isEmpty() ||
            xTrdCategory.isEmpty())
    {
        ui->lineEdit->clear();
        return;
    }

    int nSKUSeq = SqlManager::getInstance()->getMaxItemSeq(
                xFstCategory,
                xSecCategory,
                xTrdCategory);
    if(nSKUSeq < 0)
    {
        //  error
        QMessageBox::warning(this, QStringLiteral("警告"), QStringLiteral("获取货物序号失败"));
        ui->lineEdit->clear();
        return;
    }

    ++nSKUSeq;
    char szNumber[10] = {0};
    sprintf(szNumber, "%03d", nSKUSeq);
    m_xSKUNumber = xFstCategory + xSecCategory + xTrdCategory + szNumber;
    m_nCategorySeq = nSKUSeq;

    m_xCategory.clear();
    m_xCategory << xFstCategory
                   << xSecCategory
                      << xTrdCategory;

    ui->lineEdit->setText(m_xSKUNumber);

    qDebug() << __FUNCTION__ << xFstCategory << xSecCategory << xTrdCategory << nSKUSeq;
}

void NewSKUDlg::clearSKUCode()
{
    m_xSKUNumber.clear();
    ui->lineEdit->clear();
}
