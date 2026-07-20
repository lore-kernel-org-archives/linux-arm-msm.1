Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013000.outbound.protection.outlook.com [52.101.127.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5BB3D9DBF;
	Mon, 20 Jul 2026 09:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784541590; cv=fail; b=uNpB8691hAzAKOFPywAlDSD6z8w4VfneiwgjIZQsijugkUa0Ngm4hZB818NXT9nB0eGOEr85YdA6ICZgFuG9e6uu+aVUce+Bd5jCQT5VEoQNeO1/UTolonsly0RXHn3GmF+eyRUgJBAI6gGhf6G/uvqBRBgvQreqDXLQRNyyZps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784541590; c=relaxed/simple;
	bh=9CXfJ9LGcHcQ4d33bEfD7qET4ti7Tu6aw2NVngP1dc0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SQbrMulqi0zknbIMdAfwfZhP/Yw3JgGR/EUCaLoOhhURN3VHUbC7bebh1yiM6Fd9vBJ9dr512W5KZ+IZFQ1M59XG5k7LGcOJ80/QKTDNK7IEiTGiPiIW2JMr1pYuFeUPybrbJOs5SzOEV9y0nHFcwokwjj6c2G33Hl+0OkrB3q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=mCWm0n5W; arc=fail smtp.client-ip=52.101.127.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="mCWm0n5W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mMSY756DdAj3FQf0Abl4WsAPwvHisbwv5TuL7bBI7ILxUBkMIgVskysfC8e3jpIqDsdumvsABXeOuj62ouu78V7hJKyrhup3qGZ3guDdU9lg9JZz9hNwdGeXnODbme/UwVKqJpUDv6WoXxzsO8aDqAKZmjiiye9vqGqOUzDMOVzvu7t0ono0MtYTLKnwJD0QnYnpH1MGMrc+qZPrlm03UL4KNUw3xsLHRQxNZ3I1tiL/RxB9ihtcIcCvNg6mY4C5NetMqnamY/OnjIlZvvjk7cTHSJpRNqqiC5AYkXQN7Acei113z7Zgritgqyipu4qyOnvrTDixJRztBu3G4tBDXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IlkQp0+kKuYyGU1czFTGVqfw2RneaW00BSXGfr8I8yw=;
 b=eYuTK9jKzInsxmcfRrcOju8KE3EGQm7w7nqXebJ/p9kkgn7yr1oDtZIUOCzo+T8MvBA3rOt0E6oRsvdzsxsGAiEmypuYgP4KBY1kVZmbEYj6Mw0qWY2kkp7b72lQinallY+TrSEAcBTTzfoo1buYVApdxo89IsEjGirbMxnzaPSHdtDqv34A8tC+FTpUYZga7OGcvMlT0h7XXXFN+05/aS2TfrPHWqDfSBw06a/+tE+0Lrb8RK8e3KNLU6Dblzcrf9U1ks5HvMWVH8flNK9rwMpMkasjxgjKTxb2HONqJ+MqKJbwVN+WW7jCh8VkrDqntN1oC4k74wgjwdcRWSaxeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IlkQp0+kKuYyGU1czFTGVqfw2RneaW00BSXGfr8I8yw=;
 b=mCWm0n5WI3co4fkPcUIkHGgLmuYx/MWc70e4K70vrYLP0jeDMdcsZYjoGl/gC/q1LsBIodbb4Yc1IM9IIHahdK+iVyqdtSVbH8y7Z90B37FeLixsfy6RtnlgQkDoHRi6APfRd9T0Frm/eV6cF211P+xX875nhb0ZnTzLKT7D0wHucPJx2BQRBmIFUrcZXt4/+mQ2fw9opXpMuTLvXEGiqR3bCXAMn+s1RKto+4CtzxYERqI8T3ZCJpVpQ7zQAWJOXQ7jiBJIteV4tP7mGai8+t+4Ud+G77w4c2PifZYU+Jkq5iFLqm4dB227zzkeXBsGQ+NKtjlY9LSCr/rXq/vJoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5828.apcprd06.prod.outlook.com (2603:1096:301:e8::11)
 by KU4PR06MB8458.apcprd06.prod.outlook.com (2603:1096:d10:7a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 09:59:42 +0000
Received: from PUZPR06MB5828.apcprd06.prod.outlook.com
 ([fe80::1d47:987a:ed97:769a]) by PUZPR06MB5828.apcprd06.prod.outlook.com
 ([fe80::1d47:987a:ed97:769a%4]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 09:59:42 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 4/7] soc: qcom: Remove redundant dev_err()
Date: Mon, 20 Jul 2026 17:59:10 +0800
Message-Id: <20260720095920.542801-5-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720095920.542801-1-panchuang@vivo.com>
References: <20260720095920.542801-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0011.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::11) To PUZPR06MB5828.apcprd06.prod.outlook.com
 (2603:1096:301:e8::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5828:EE_|KU4PR06MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: e9104b4a-2bb3-4f3f-1457-08dee6459ebc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|52116014|376014|1800799024|56012099006|11063799006|10067099003|6133799003|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	s9J+Y8+dD/WRifCd5dzC6Mmc3WRCxlIv+uCiY1YZDbYgI7fF8bGB8NWaVTqvFE9JXNgWLUfn4XV3us1O5O0tdehIe12zuyb5oEHhJIExr6Z82xyiyQSofg/uEwP0k1EbGGT+tiOtn8nVWjmbXH7y7VSBVd7I+2LnC4d6hL7EJzULsV/eo6kqKK7nJsmQpvSrxcrHJG+xBxnqOYQ3s0x971VtPjKAipGimrS/n+qCqoz/xsfZY0ykgwoIGgOIR7M3ODUJSdIQDU/NJJHSPl1ux8TyqA505mUAYvlOLGFhYCtrqmsofpCIWHePVGYjKFsIFH9B5dKI/+bhRghl2Lpz6QHmAQUQgQYTBiCBiHI6dUCL48vjsKZPPm3rMKEG52aLgEIq8gr0NoQ19koeUCA/lxfQLl/RaN2yknLOAEw3Av0WW1kbgaN8q0pn2KMcoDC2Flsgi/PaEvEaou7zwzzJZvfh5UnTq9J511SEVLqvP3QYrDkCIWmkwFfkgb5k9/qEjZy/1UXw4zlr7kj7q6zQRqsDGei7N05NmVwCKpO7vgycFOL4wpVneDh9SV3AEKZXmzJ0mSVwiHHB7IuSp7odp6a8uAZdoroRkfhUlH0C1kQHD2/LRqBert2t2AKs5Rc2m5y6dg/HevJBguI3jubYDtMGO8wU2ZXfyfqMfUAmYPOiolubXEKAngEaV+8kPSCg0Amzq3bO8MX3bmnSpnS3Uw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5828.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(52116014)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(6133799003)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bi9cA9ePrbggPP3dJW4NKjQ7q3Qq0TCbpsgsLkTu/71+i3tc9ND3THkhfeJC?=
 =?us-ascii?Q?EZlihzqN9VLKdiuUY45+YxH8VDLHmxDcgJUayP3hZcj2jzIpqWpHHwYgJ8jD?=
 =?us-ascii?Q?aLl9zJ2L0pCi+QFJjh7w45R4I8ms2yqK0Y0nbqvltPZ0f5JKLrmY+RnMFsbf?=
 =?us-ascii?Q?EjqscQ4XB3uFOhSwSFG+lrn5SybLPcDnuK1mrGgfe2vw+udaz0Ogt6PDCqOh?=
 =?us-ascii?Q?h7FbFMDfYCEad6d+oXyOTY6V3JnJX8U46YiALdiZLeh1d+S6Qzata0ZILxhi?=
 =?us-ascii?Q?YrT2ZC2g5qVSwKaxbKJ9ch93fHVj2uBoEr+bfUQygkGjSyFY/54mA7BGAMG9?=
 =?us-ascii?Q?4xUQHjhmdDYd1auSes7CwevMQ65LMYHxYZ/pguSrsXqvXIdz8GRl3O0Xj3fH?=
 =?us-ascii?Q?wflgOv7K9G+FMxMB5P1//nx0OBeqmK+BuBw6UgtE7Y4qxPNnDUed3+7LSOoL?=
 =?us-ascii?Q?El5ABh6TMf7Bt9LGLE2iuiGrAN+Flns+IDH/uPSBILOQEMd/AOYZAWhphBHu?=
 =?us-ascii?Q?E2eoJIQTfnCmHSMNocsJhIzShGYcp9124WdwEjzma2vxjgmMAHTxTgN/dhKD?=
 =?us-ascii?Q?lROUci0rnyP2QwL9kgBU+nt3t/OLhkdPH8NokpaKAExjM/n0Bn0bC3bM5aA3?=
 =?us-ascii?Q?IdL7j+09tvWvV/tue3pwH+W3A/MjBu3u3HbrF3NBZshXO7k8MW1xzcXnRbEx?=
 =?us-ascii?Q?yoMfmhF9ayFkhRVY+egqltWTDSAcS4+DjjheSXtT7WnHVEkw/+ClTyPLKDPm?=
 =?us-ascii?Q?3vNG7DESGCIeyyQqBXwvp7vtTz5EWGghZqLXzKENPFPpv3zjQ5Vk2C7caa+P?=
 =?us-ascii?Q?pEcPF8o843EhOq3ic4uSoF3KDXNMv4Jcdgy2OBDTnK7Crx+LrnWqUsW6uS+x?=
 =?us-ascii?Q?VRyWwDVmS+9a3FKK4ZnDghH5kz8r05UQ+sao18CBljdoGcDKk1Gz9LnW2hlR?=
 =?us-ascii?Q?SJb7MsmJ1hzkuuGY/IJ1m2yE0LB+EsXSx+w4GESSnvEomhT/S72trhQaBDtV?=
 =?us-ascii?Q?xq9SLduQDBTzgucWGtiv2QmaQydjMCWkU//osbG5G6CmdP5HoceFPbfZEB50?=
 =?us-ascii?Q?APgoStRbzDiR1ylEuAhnllpuenVgE+2BYXLaLw9PgK/9ApntHxi5kEF3/5oo?=
 =?us-ascii?Q?xlcNa4EA18QbQcO1N2dH2kCDFNDPm0NSyOLr3K8HyYSB8rMKSkY5SOVmT+Lr?=
 =?us-ascii?Q?+sBznWDa7t2M7clAzWqVWAeYFmW7iIwno2EbvSZmq2TZYue6/NmIDLqydCF2?=
 =?us-ascii?Q?j3Zl4ewysoNHBCqdNVEUqgsJ/aC/Rw/cwPb8+TsJg0qXPhOUDPRAeq1kRiFD?=
 =?us-ascii?Q?r5kCgoJd0znoAYo5KgYme+ETAwgRZmm0k4biMb+f4hkzJ6j2ePNMinbtmk97?=
 =?us-ascii?Q?WljFm+uid81wBwh8dzWhTrSs5SQoL3UpxJoyPf+mb0UJF2FhCF/m064HmOIJ?=
 =?us-ascii?Q?vjtRI1GBiCfho0ddcW+dWqjZgCum5HEIRKf/+NZwXd7oH60Ta+X+q0+CUCxo?=
 =?us-ascii?Q?exBqsiGEdPEfDR3YkzkR0arkwmcYeyILnLUZe1dgQdvac2ox7QKRIE3i4Wr9?=
 =?us-ascii?Q?hcL5flNFOdwiq93DzMqWKVYM4O/5LRt10AL5LBI1b/FEWTAVPQ0f8aVvymCS?=
 =?us-ascii?Q?aq96N0g2pKE07SjA3ZJpwyTSnWx/tj7EHbfGjAcE0wUcl+eAxKDYy5PYKgnC?=
 =?us-ascii?Q?0v97tpP6hhA3QH4AJYkuoZOUQDXl2WeMwpFxeG3OD16VuQ8ze6SUnoYjMfFQ?=
 =?us-ascii?Q?vfWSvYShNQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9104b4a-2bb3-4f3f-1457-08dee6459ebc
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5828.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 09:59:42.5045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j4N3E3DPuWijQmHIiuUN8fQlvffPjgjg+HVgJwhjbUZ1rkwyOkLbmca/9PAP2geadIX1r7TFrJP1BzfZdjwREg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU4PR06MB8458

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"),
devm_request_irq() and devm_request_threaded_irq() automatically log
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
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

