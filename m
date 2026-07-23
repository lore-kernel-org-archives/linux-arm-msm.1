Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013033.outbound.protection.outlook.com [40.107.44.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26D5353A68;
	Thu, 23 Jul 2026 02:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784774587; cv=fail; b=TOxH2nsHredIA9Z0qIuW+VRGfn4NLX/G1gc5ycpgwkQwRvVbFKTw+lubXyvdbfS+apxhIKy1UnduUDE25VB5r4apvsxAbE0crFywg+afuTvd6nfps957vmu+pyEH0MN2jafuP8Pb8755h8h2SYxXyC+BuIt4Fiq3rzXoeh2tPeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784774587; c=relaxed/simple;
	bh=HMKoDgV1raz914pCV/ywYKqG79R9IvHrcYlUTSbet90=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=FrKqyAAf9wNL/V9Mw3Uwz7jbi6YZ29tEzWibW3fInEWUSWogHltb35ehYr691cdFmhebLefyNPzNvaGR0pFRb8rQrJGeQ3NvuweQ4KsR7rhWN8fgP6y0oJInNQ97bz30Noi2IzgSTyl1mbXnnyjlLO/mKCpwnUBX7+cCyjLO7oQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=avu8hd1S; arc=fail smtp.client-ip=40.107.44.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="avu8hd1S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XjeIW2ZW5iqalCZZVbJ6D+J0i6C3kbGknwpIMrCPQNcaUxMooaddVlaTfRYSuGO8V3iKj6CI/cV6x7dJOYKqk5Jn/UNRukrAyGHGvtVsj8qZ8h/yRDs8EhrbjIzXJCSHRWM4U3nHdFvXQSwqjYUdzXDhFT97LDbVoxAYdhM6BgUF24PGNquXqpCyDooAAu9Sy9Jo0fkgsUay9xESl82nYIl1ovB/fQAU5NKIXq9mNLtYa2Eq/bItZVRY8T3FYfO8pFlHZmos5qaM9NxxhTciqB1D5GihIXA6tYh4pypXGgAYeezjS9D4G7KWa+IDist3OK+7jnkTh62HkWuKqneQBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Qa1D7dHkY2TKbIbFzA2uS+qdTtD/gOVnZSF83idAMQ=;
 b=kW4i621HWs6dqg4Zvdz8JR7PlpwMfB5qHz3L6HHudPrtvgJiwuaIjB4TtLv5hrC1+p3PWQ/230oBRXZafJZ4o0G3iOBuFJZUsY113s0nNt/e5m6uC52enNTa8fVjVYS20OsxshNGejTzfQzpKCf8WuBg/9i5RmK2YBJ+EgoAc9ZpKcfmLqUFo8doF4XOaR63qfWrQckvbfjPwxI4fzBNeRrJJaE3FZMbP88iIBjJE4jh8RU5U3Pav72tBofYCGBoiXltQ+xRBPIL6KCbq5bvhJ7LGnc+jnVoPdgic9xercHZ86YQIr/zmvu500ukBd2xCfgbhWIArx5Qnf6IrcBz5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Qa1D7dHkY2TKbIbFzA2uS+qdTtD/gOVnZSF83idAMQ=;
 b=avu8hd1S4PCslhEkHKNr5V8JZm1Zv3Tc0vQOhWepo99M9OccAuDspFtbwiGupKpyoGWOpSY18N2gZlVCaTi8lU+oV6xV6yHHN1JPH+Cr2CGzSQc5vyJTMJtl7GvVv9lyUTT6seGbVG7Q5STkUKPxdgmQsB6IPy+RIs7/XMTw/ydyWddhEuPjqgh3UmsUDPZfApOZvC/BVOJG6xvG5iADvBpR/pr5ljzM/zRm/Uo8M2IqlwOFjBJxbWAdTCDMBC6JZfM5lx8A0kLGr9EUSBslB/8mKd6VJ1yYJJW/a2Y4B1zTlbj7Qck90MXT7bzldOy6hAiBsUo+u2+GcRg+caM0OA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SI2PR06MB5339.apcprd06.prod.outlook.com (2603:1096:4:1eb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 02:43:00 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 02:43:00 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH] soc: qcom: Remove redundant dev_err()
Date: Thu, 23 Jul 2026 10:42:47 +0800
Message-Id: <20260723024248.17480-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0043.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::11) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SI2PR06MB5339:EE_
X-MS-Office365-Filtering-Correlation-Id: acd6ed0b-333d-49e7-5c59-08dee8641bfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|23010399003|1800799024|18002099003|10067099003|56012099006|11063799006|38350700014|6133799003;
X-Microsoft-Antispam-Message-Info:
	3qRfzgi2pWUqgbq0QLK7mnYiio7cGoMgr3j2JQFd0KXa3yXMvGQDFcjGBtOwniIaTOQxHKwcLBSTw1p86WkZYU/NSteVRnsScdpEKSNc4yOv97yuMIJUwhM41+mra6stYGI3RX4t9j6CnPntLUsnsIvIFQX6JuUTirhsGZzDlfeK6XISsapLTioVw9swDwGxGAnxb6z65lOVquItu5KejP6hXbXE9gOViNgbtBLyZQHn1dhz2MToMEpnsP0QjiKgVcG9xwRhA3LUgRf2MGCyL2hhH51G+Ko0QBopb8iXcF3Xo2wDmjKsfVX6UmR6BctsnUUq3iyD8aLAHuuvCS3HypQtUKnnbjsriUGVLhceMh10dLYz2xWkWsLQ3JaapkNcAiNzDfoR76xze3bNthPuI5htutcZGjP57Qj663ir0JLApB6iOcdZZ+mjdlEu8IIN8iQoOOoPdoBp2oACAd3GTBmVCqnxckx8MzTVgxwuxoFoYmKhIxY+9jlRHV2AELO0IZ+QD1jb2H0UkopD9DH7hv/Ji1aaxaWoXDB0V163SpHGKZu9emKkePDxQS4oqzP/rWV8gMlpVUoJfnEBlG+n5oTX2l1u6bEzr4yVsTdWw7kEV0dIYtrZrNae6trozqrjmaYRXBG68fZ/dHTt2YfR1B1mH2TDJflkSv+/a1jv+YAIvebgNQTMqBxCzzXrSmViVnRKfC4fnkAD4glxPSv6Zw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(23010399003)(1800799024)(18002099003)(10067099003)(56012099006)(11063799006)(38350700014)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ijRtAZnZ0a+WZ/fvWzBQFr2ISplPOC+Eresu3YPpTOK4EdtLkoCWDcK6EeoL?=
 =?us-ascii?Q?ZJFknYLRf8fstAGem590Umma5+MCzXeUsNt1AY6WYhRrapezDfPds3ZRXLmH?=
 =?us-ascii?Q?43z2DTNIpd48iQF5Qqlgso+gIzXgeNf/i58cerQEvF5kISU+N5uXtCFNvsly?=
 =?us-ascii?Q?gGtgBjOm8SGgzLn61j3G335CWxisY5QJhZj3b8XraiGJacDlTOq/jD+yauAf?=
 =?us-ascii?Q?dSqLEYE58qBZW9smq7IU+TvNW5Tk7SF+6EXQvclIETjiBkXWQh3SJptyMF8W?=
 =?us-ascii?Q?2hrfmJ+Kins5zV5rx4GCueOHsz3D2mAxbCMkiHOIMJOIdWUNdxDzV7Kk5j4r?=
 =?us-ascii?Q?TDdjc2MQ7jV8xq6c/0Ibn4kC2Vk+F0e2PlxJhRXN2r4dI7nvJ3TZR1RUaqRH?=
 =?us-ascii?Q?Hg0XKlJYMyPPcDVeI3ICMVrEk/hKt1bZDCv77ZR2WtO8CWGSygv9wYUKKb0S?=
 =?us-ascii?Q?MxzU78YCSjG5OEeisyYg+UB9/6hOTXNKcBlJj87/RM4Yj7EZw1o/ib/7aARE?=
 =?us-ascii?Q?nd9UIgU+XLIeUtaAqlI33vM+cqQY09SOm6WwuwoherwOMtuQYdnLolJeC7mm?=
 =?us-ascii?Q?ihRs1dgg39ty5diPwGwVMOsYzP2HdURJpdJ6lUpzQm1/h+pvIUcT+K//Th4w?=
 =?us-ascii?Q?4mQ9B1EcbacbrHhC2oQsiZ3RL3h1UuwMZhMynTMQDB+M4LeVC4F9Hi4uYyNb?=
 =?us-ascii?Q?ny7/JlqxycflNxti1AwGsH1T471FhTIETasld32jQVraYkOdnXiITXf4PHCk?=
 =?us-ascii?Q?QZ9l3xR7HnDjxAo/EMi4XSxTAn8wiJBSz4ur/zVoXr/EPVm/PB1sClAaLUq8?=
 =?us-ascii?Q?Aem/elVyKuSoUAXOFQkWBZBlvaiQ7XEK+68R+opHX3K7xMT/QzVInV+8oB1k?=
 =?us-ascii?Q?uZT8W3SxYF977Hw8jzfGen2dmp5AhPt3PFxUv8I68MdzqjCAwEGTvUqdYOcK?=
 =?us-ascii?Q?ojB3Qs6I3MatmkrZ3pxSWr2nIb/fytVd5PSTE4Pk8JvmtyPjnqjpxY0Djzs+?=
 =?us-ascii?Q?C2sdHz4h69pYy8DmMJFO8+nTMdNfLSfHyjTMsXb9FgUYZ9NA0f0jkwivyuyf?=
 =?us-ascii?Q?yegXT1NB0bdrgpwRDDtscyEOhStrDe+gghwsKg6Aem7pIKf/CzfvFnKwKCGK?=
 =?us-ascii?Q?vHZDDmtjAV+t/S4nHeufAN2djfOOJfJeD48He9XhZo0u2goMfLRqfa1J4xP4?=
 =?us-ascii?Q?eMHHY0vHetLSZwymBlRxzrUBzaTG0r9Hkj6mPQ5MgIbg8Xe4FjQDDlx20S1S?=
 =?us-ascii?Q?vOJB2qsjoTzTfiWwpbYDnKgOaLFd0H3ADQYxObrkGTcF7ViH0EY/tlKQIHT3?=
 =?us-ascii?Q?IyrZTZZoXktCmbevyMvZGjraOIvHkwM6NfALmP3AqQ6GFQkUY+w8pDI260qn?=
 =?us-ascii?Q?nsop+BFTtVcAzWBXyH9Z98kcqsLiNuKbo8p4gCTnm2oduhM+sQ1YDy6nj2M2?=
 =?us-ascii?Q?kOW+3tWHhGfOdRu5F7Ymj5ipXIdk/aJ4Sm/5uXfyY1Gd0ph0d23j7Exgff1q?=
 =?us-ascii?Q?Y6uQiIUKfxj3AJvKiu6VJBTHZQsKl4oPsIFtwcyl4bTvDQaaCGBRuLlmh2dx?=
 =?us-ascii?Q?+7XN9Y6w5sfvFX0DmD9KRdDgE/li/BhnUzIetlT+h/tchpBm0NXk2hM8P+oi?=
 =?us-ascii?Q?jQa8Pnr0myhZgnVrA0jNUvYaZGSKn9rV7/ImGY5pLMu4NkyiK6YaeI0SSzkG?=
 =?us-ascii?Q?ZbH8Cr6V2tpNZ72F+o80oWNeRSW+j1RiZ59tri8z2HYC43UWanr079F4Jdox?=
 =?us-ascii?Q?09kcGOBQiQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acd6ed0b-333d-49e7-5c59-08dee8641bfa
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 02:42:59.8588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dSxYZv2B4ZWqbNL4UjlX9RN9Enc1oO+/PgqI8zbJoFQ+7qd7sRgsmazZbEte6bpRpCfck1LCKkGAknHz3/hkuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5339

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"),
devm_request_irq() and devm_request_threaded_irq() automatically log
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_aoss.c | 4 +---
 drivers/soc/qcom/smp2p.c     | 4 +---
 drivers/soc/qcom/smsm.c      | 4 +---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index 259c41f0c34e..a6b673cd7678 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -602,10 +602,8 @@ static int qmp_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	ret = devm_request_irq(&pdev->dev, irq, qmp_intr, 0,
 			       "aoss-qmp", qmp);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to request interrupt\n");
+	if (ret < 0)
 		goto err_free_mbox;
-	}
 
 	ret = qmp_open(qmp);
 	if (ret < 0)
diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index af0ceeaf6e07..6f07fef40ce8 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -720,10 +720,8 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 					NULL, qcom_smp2p_intr,
 					IRQF_ONESHOT,
 					NULL, (void *)smp2p);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to request interrupt\n");
+	if (ret)
 		goto unwind_interfaces;
-	}
 
 	/*
 	 * Treat smp2p interrupt as wakeup source, but keep it disabled
diff --git a/drivers/soc/qcom/smsm.c b/drivers/soc/qcom/smsm.c
index 021e9d1f61dc..396025074e1e 100644
--- a/drivers/soc/qcom/smsm.c
+++ b/drivers/soc/qcom/smsm.c
@@ -451,10 +451,8 @@ static int smsm_inbound_entry(struct qcom_smsm *smsm,
 					NULL, smsm_intr,
 					IRQF_ONESHOT,
 					"smsm", (void *)entry);
-	if (ret) {
-		dev_err(smsm->dev, "failed to request interrupt\n");
+	if (ret)
 		return ret;
-	}
 
 	entry->domain = irq_domain_create_linear(of_fwnode_handle(node), 32, &smsm_irq_ops, entry);
 	if (!entry->domain) {
-- 
2.34.1

