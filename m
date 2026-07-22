Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013011.outbound.protection.outlook.com [52.101.127.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28272390CAC;
	Wed, 22 Jul 2026 02:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784687746; cv=fail; b=RPRsWyfZTyrZHAnuk2cwi9vSQq2JNMsK3luXEaHNkoVs1A8oMqZH3cdQuB4Oug1qiPb3LOBIY1p8qiyLK0cbzLzyLIwJOq8M61EtErzaIcZhGq0wIGGDRn1sQFXS8q3E25p+u8k+bJpUL4whBjixxOrbZo/5eem2wK2MIxN9gJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784687746; c=relaxed/simple;
	bh=HMKoDgV1raz914pCV/ywYKqG79R9IvHrcYlUTSbet90=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gUaaIv2wUfy4FTJZEZkelEywg1fA7Y3u3MpBqCpywcL2kFFL0jiOcWy532d/WaIJz+jQIHhbxB8ZcmkyoNVBURYTMJccKyIEf6zfTE4yTIk5oTswESYQCILbX3L+tAb0s1CDauNwNlPTSyuIzJ1fGo8NiDFI0fqCjD9Y4OlLol0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=LjwqmchG; arc=fail smtp.client-ip=52.101.127.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="LjwqmchG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uud7YM98hdhbbzgLEDTJn10a1HFirHxOPzCy1bA5sh1/U67+YLDPYq9mc0866uQfZAmZvYaX2REBnC2/GSnKY3FI8O8WIA2MAN3YRK/0PVB2AVgKF038Eiy/sFNvLPnkIfkIoLajw1giD0ajbybpLUZQTb9YZBw7S9BQQjita7H3LZHIQESvibKTaHJTS/jtydasJfciZ+hucPiee+nNT0Are/pP7WUJsekFdsiYE733d50RKxnQ/f0FVIQ8WVTSXLhyaE23fexoyxIbJXL4gAoaQmFjcLhGoO8zoAknUXdARy4kTzah/pzBhKOKBCNZJsHQxmrhrpzBHDqgd5uRiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Qa1D7dHkY2TKbIbFzA2uS+qdTtD/gOVnZSF83idAMQ=;
 b=mVtLJwLQ9UkUWhJwsixymgIiwe5Il5QOmm2+BB6m/EVE7m5IloGBTg9ZQLbjFolP+P8fco3ZWOtXq0Vd1509Ls7565hcKsCgNyi7pGGQWIu1ZiQ4esuqez6KoYeRXFqNcLSshXLCjVW22atSQkjHiWueTAv8JHsnI2J9LKAlyp1a5Ce4RAzxd92JZS4oD100518tcZ6g93ZCI5dNkA08isqAU8yW25ETNKJ/8xYXrsOKg6isj6rfSfh4sYd+2TNcyDaxP9i7Mdx/4lrnu0Fk2krbRySYmYc9MSG2nD/exXG6+2ZSQ8gItXWCOFDfbJ8uX33bj9m4s4/JZhhjLhOziA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Qa1D7dHkY2TKbIbFzA2uS+qdTtD/gOVnZSF83idAMQ=;
 b=LjwqmchGFi7pMVJly54jKI/qg7x7VSMyP1dj7KJzkI3xxEJ2L58Gj/81mHqzXZ2o8njE3eX5nvlbalIDG9DjjR/qMiAYMqV6PxdZbTNZeHhJgvEF4xxAVrcoftzDCods9hxF+SlaS625il4zkhPeiR3NNkAYOpIZ1iHm17nzjoluAgtZO6o24fzu3XhRC3kc8nq6CvijvzukudjE801qDqvo5hQY5h23lUivP53B9Vj1uUkElVVMekBKq349UYUw0uzzIbhJwoHHJVAcBdcq4g/D7VAc+QTMGHDXnOmoVHcpEMDokJIkyf8fwkbCDMFKX4iajC1mdZqmujf0HLxitA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SE2PPFEBA6DFDFF.apcprd06.prod.outlook.com (2603:1096:108:1::7f1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 02:35:39 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 02:35:39 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2] soc: qcom: Remove redundant dev_err()
Date: Wed, 22 Jul 2026 10:35:20 +0800
Message-Id: <20260722023523.42269-4-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722023523.42269-1-panchuang@vivo.com>
References: <20260722023523.42269-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0023.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::19) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SE2PPFEBA6DFDFF:EE_
X-MS-Office365-Filtering-Correlation-Id: 6115c6d4-05d2-4e81-e14a-08dee799eb3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|23010399003|10067099003|11063799006|56012099006|6133799003|38350700014|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IawA+76dKTyWtYZ/Dz0uL0QI9VK7QrBfttBXaUp0mKeIYDvvppLX5rpYMR+s3Mkr/Q/n0OFVPiYwAwtMSCjrFZ1jC6MOSV/Q76M5uGG9zVdsuZU04srAbESQf4D03lnZvRGyRYuX8SOCXTyhi8yGJJ4dowABsp5b6kciHxTBvTwS3SD7OVhk3hSF06xYavLe147+xi1MkeO6VzUt719rR2REbhmi8H2S19dRoTgjMNPCf+GOaXpZNNSZBepWJOiZ5f7Gw9YoLJVKc6iToykgZApmVtWQtsI+y16+tRsc3C571e6f/37kymhsqZH+FBa87dZgpQmKnQT64I6GjZzTX5oo8ZVrs99aZHxjaxhBpSE6pAt5+6Hy7Q/a1pTae7Yp3/GcYP9zGZ0cZ0ryVu1XRGtrSopQmzIeYKPNSfLR51RUjXcj4PVLJco/GKP4YfJ1iNPiU4MyXT0Pj4KV3B4TURma3ImhroBPaLusq9qrXdepkK736pMwBy0UsIlEb1jARJfSgv/RPAcn2COj3OE9bOjTgZhq/PjoA8I31ONUvyG2fiC4C5nQfAzUCObn7VFlnfY4LOY+HZzOzJ2AVfI3euK9nchWqYZGWtg/B8hjyKmqP4vG1HmCOwLU/jExpdQ27tMjNWKTz1qlIKN89YN6TFxkIPHhXelges00yA3GQAqI+9A5fOdwByl2C0Qx6/iIoWxCOyb+2wpz/um+mLdkoQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(23010399003)(10067099003)(11063799006)(56012099006)(6133799003)(38350700014)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HaTDVmtI8lQC6xU36F8L9PvEMqCVpsXJ3ft9LWQfKeTG0PizVUXhukCik0s2?=
 =?us-ascii?Q?ztO9D0sN7kxFZGgpS4YDIPFrLbbdwF2zTohGPIcdnQ4MkbAZwPl+DImt43ZU?=
 =?us-ascii?Q?x6vXKvql25NCuygVjvUu43fapKzlNkZy7FjToi5XtfmDOBLi0ClPlJApdrw4?=
 =?us-ascii?Q?3xjlW9eS5ZKijk3RxOPlfqm8ZeLSxU9Pa6SO6vsPpn48VGGbCywhBLoauHld?=
 =?us-ascii?Q?SwTHoRdfXHMgJEbjtOzZVxyT+BfIwI8sKa9UYXIFVn6RstiZsz+J9IzzYsxB?=
 =?us-ascii?Q?c3sgvRE3kiN9WC0aOc7QQVQ63ra+I2DGS232AqkL+Fyc923098x5iBS54eXF?=
 =?us-ascii?Q?bKrggY5I4D276II1r+uDh8aV+nH3BvDM8ph+rGfxV3knEqWBHNNHfsQaj1SX?=
 =?us-ascii?Q?D15XICWwfyy7x2Iola+nXFuGR6AszAxITSJ4E3zJuPuTABBwiASHNjgj+a7E?=
 =?us-ascii?Q?31teCeu7Ejk6gMmtl7SomKc5lCjQaDtQx5vgVLfippJ7kcP++aFqN3tlPYpV?=
 =?us-ascii?Q?e5zakuxDhTbQFgDaklv/6HpAGH6GZIv4rn3+8HTPJATgTAs8BwOl4vUbO2CX?=
 =?us-ascii?Q?vyWVifGKDW5s4tV5chrwEnJ67nku4LWYNfpPXufFWThfU05wUbYJ80QW30Kb?=
 =?us-ascii?Q?rJdkjvhhkQpmURksxpaEeFR5vIEtclkqX1pGZWR5zCZ3ohLatJC0odES5Gzd?=
 =?us-ascii?Q?btQCOjXAZ+MUECIPUPfb/43P1aGQe28wucyGdWi0abFObHnYrfZWpyVu5MDi?=
 =?us-ascii?Q?Do03yLo7nheYeYANxswszSGqWaW0FgNLN2Xc7zruVEc+rYCbyFz6UbYS7x3h?=
 =?us-ascii?Q?Aro4kBuh5X+YRuJKmJORSMOPEaWt5L1BZdAIDmy5YE0ogr58aUa+bLHYoCZr?=
 =?us-ascii?Q?K1w2iWe/ivlgwnMgyvZ8rOFtlrlCUZPUj3MxakuOUiHoD5nsr+UnY6lgSQt3?=
 =?us-ascii?Q?DN6sexnj+Y1fgb+EXoUwiapzxheBOWlZkapmnUtz4JNfLb3J1tuLv8NM7Qcq?=
 =?us-ascii?Q?YKGvaUeSpXd6j7XAae6oqyoYpMTWZ0Yee6GJMHw4s6Bqr8tkJ//rHMyets4B?=
 =?us-ascii?Q?60P08mTmWzS+nDI+960i5rwJFcDKhPR4tcW6ODBu+ahGZlMquTLMv/kB2GR2?=
 =?us-ascii?Q?LrYvZteKYJuXVNYXSm+PBZUm3/gleEQ9cHs4t46svs6OfX24S4NmfOb/xfVd?=
 =?us-ascii?Q?CqEv5zwq0I0yoXzQJ6Cf/VUeIWWLqQd6GyIppOEH9BM49CTgAQqXt5XJT5Sp?=
 =?us-ascii?Q?aCdDYIQ8NL6JPYVw6+uJFvMDfK1huSdLXtr1//IBuaMP9R07YAsDPN2b4bpR?=
 =?us-ascii?Q?A1KDpE8zigVS+0AygKdzJiqaOs+Gob4lRpddOHo/hvgie74MD1dJV3DfDNw7?=
 =?us-ascii?Q?Y18Ygof7Z89SZEEVU1aJVCt1L4hpBMv36XSPcmwRo1CFrkvWSElIMeoHbW2k?=
 =?us-ascii?Q?O7rUtgyeG88BQ8ZkZIPgYxCKxeqkZz2unbS4Mqm/Be4ckZ1KoynMy+ErMFn4?=
 =?us-ascii?Q?H1L73D5zuPo/8tE3Wk/VXjjPvTPh5kwM/9JMOaVXPChCMrrmcCADdHB7vkCg?=
 =?us-ascii?Q?wmlfghmYgN8507HJSd0Aegqm+5PTRr11phkdVTiJoImD2LGNGycsqeizHNVs?=
 =?us-ascii?Q?/SR6eoCWCRv6ou3Lp/DdX838J4ty2appE4HdshfMKcObz0k4RS03Sow1JCjs?=
 =?us-ascii?Q?Mkv8mehM4XQ6m2OXkuUqfeoyqq49dCgnHmTTNnc3BpwrCaKVcn1cBCRcd8wH?=
 =?us-ascii?Q?PM0QEDM7zw=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6115c6d4-05d2-4e81-e14a-08dee799eb3d
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 02:35:39.7775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xo6BgshzhebSmlCPIPF/O8/SUHEU8vcVu07NhsUMsyJViWpAhR/wE9HjJlID3pdG2uG9R6bPdRpKCVUAkr4HlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPFEBA6DFDFF

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

