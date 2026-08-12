Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013024.outbound.protection.outlook.com [40.107.162.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8914418EC;
	Wed, 12 Aug 2026 13:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786540978; cv=fail; b=ofz23WAq1F/sLFN/kqDN0F7IHI7H0E2+BAAQjDB9MNJHVlXUs89qIG0OtNURnRgizOUN3woOqwm5gfLOmyb7fiK0LrywGvXmurR+6F/P3t/pK0avRGv5UOyQB02H5RDbF3/9sVLT1j/QnmpoSgEnHpcn6bNBy78x64TzBp0w9jY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786540978; c=relaxed/simple;
	bh=BeyowzMFgu1J46j7TSB6lzvawWY7EPIpykbEsvfWQuc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=PnI5/ic0ZBMezIBp/o16kH+Qc+oS6wPiBochtnJpFwtQjaKCNSj/GEBSITbVbiiPTtmgacS0sJT71OSlSQX7rsQcSKAOwkLqfpqK88a20O7l+jSC6IybwgbYFMggp9+/KSNojMRBB2ViFT3f2D2ucodskcndAB814uPRmBVflOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iWdxxGNv; arc=fail smtp.client-ip=40.107.162.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iWdxxGNv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fu9ffMT1MJ/s5sje7ySONYKMCLyGv/gvjIkwWeU20gV4YIE3q0WPKqYPSBT1bhyNeQ2AT5xrEQ6gPraIasgg+pD1QzeB/N09N7AV0WOnRxix7BJvRQXXpqELRENcZywMpeoF8gY9pw1T8D1QZb0bdM5ZEeVKbszUqlCq92/uP+9e9+Bac9WYWkX5Lv95ddpjNG8wbSerHwJ6+IWpFwTxdeK5jFES0zjEHyQXoD5uRb07wPEyFwOfAL0EmbZqu5e5DmEj1yED1vZzjLOVVbdFRaUFvF4HKfL68VwNCqq7DvypihzdxB1kjHGbpHU5PL1WvNLzg7qUlDQj6qP+eaoi/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zl58uR2VHBrNhnPEbR/M/AD1v9Pq8CA3i1xPUFgoZy0=;
 b=VI48a1UUbCxb2sb8gO+SpjrI6yilkV228so5cg3vQu5nRuNteue5WEuxBeCAmoeY082aGUD+jztbFrQDJhzO2YHZZdxjMUOXRgq5gdwAEL7TRVlLxtCVGCHvr+nPMFvD7IYq4TJ1M9qjf/Ru1vEzLBRwc4e6Wrs9F9qZ+6bsjoMISwKiHMhFr7YJ0Z3V0UaKxWBlwIONZ+9Tk+RJh4StZMOGkNFEK4R0twQ+SZVu/UcWSI6a9NaxH4FcgvhTx9tU/7ew/tfCP9aD+/aV5hzFJsyZTUI1Eu0FFKP4iiLYwiSNOfwLCUKlDfbGQHIttLzrz8xbxKj7suBXIl4/4STMcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zl58uR2VHBrNhnPEbR/M/AD1v9Pq8CA3i1xPUFgoZy0=;
 b=iWdxxGNvFzbwGxBXKMJxDmDzQfmIVHnCSJLWq2qnion/JaPMdTVQys9JZyIRmIc1/c3ldYKZKLsN+/uZU4vEeq52uGUIgKCMG9dvFOBpdUx3zKFydJAJk4N9Tgfh5lT0rBQimgublP84oqEoBVQsRbDBx4znXmc9GOi+hEtWl16k8H0BzafNfCW7/qzbGcpqIGhY0cKtGciiMiMBz85zAToRWvwggairdILvLlbWT0rwGxpxxzOc2sgBh6SQRha16s1NdC2O7KKaBKebUJ/V/aNBF4QgjSYRLoBrMhYkVlnXC5iIMK1m56cjcI+4kk2rRUnFg0GRRJqOEROl/wwr/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by AS8PR04MB8723.eurprd04.prod.outlook.com (2603:10a6:20b:42a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 13:22:53 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 13:22:53 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robin.clark@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH] soc: qcom: ubwc: Fix missing include
Date: Wed, 12 Aug 2026 16:26:21 +0300
Message-ID: <20260812132621.679515-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::8) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|AS8PR04MB8723:EE_
X-MS-Office365-Filtering-Correlation-Id: 475dcfc6-1229-4d2d-d589-08def874d0b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|19092799006|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	Eq6lu6EIgIlLVjNw/zWaJ0YerOzQWSYGfDGiaUeBwi1THclvM1ATj9byHoLLRPSvMhWqECRnQTXgGqwZz+JnRNL1taAXT2ow4pOyqT3xecZgS+RMBHgocKvhTgJLdsJKlClqyvfNkggj9Xtg5zol+GfgJAQQ0OdwRw803rt7GK23WLFJBCj9ZgBHxtOKTxm5NB2MKwZF4WHvlkNdXyU67QQRK1aD0KM6yYEYQW4sryKmbfTzLXJxsszcV7hT58a5CESrfU7MV98yayOVo7mGXFQgRyOYQxEQIiMjTWdIC4yLIP/QGQ61aB7oiLiWy04zT2uVpJ/d2+g3jc6VAiHoyRKIUlkOdEOIu8N+dOQs4l9z3nJeI7F9DK3GCXT6tXVZZSwYwEeAaWnSXtzOy0+Ay39GfQ1WjQkS6VD4jA2zBrfdDwI/aT+G6oFJShZY0WiZpCDL+VB1KdU65Kww7tQABbjwyQkuBFCOepltWFZl+vQLFN3mtRabEN39hGhA+paiNwTkG7p8OAkYsMMhlX49KXJy22jXbUPymqKk+NjrJZ9o19kqiHN5sMKXKjhnwEwjYJ0s7vGjXZ/VW85E2G3//rR/bHulEzpeHU80S9jSUNsm1/Q2LRIXqTx2CsSai2mI1cavBfGuSFBWAbwu281rvOfabWMueeblgG9f+Ai++yE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(19092799006)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alNTRlRBSmx5V3c0VUM2NmdJc3o3SzZvWHJ0ZnNHdGZaZy83MEpvRWJUNHJy?=
 =?utf-8?B?ZVJVYnVVQ2RwM0NFQWNod3ZVaWFHbCtMbHN1Z0NiUUc4TDNRQkZFNVFSclRm?=
 =?utf-8?B?OWRjTklaY1U5aUI0dGpqaVdYbVFtMkZVRE1NNHJvTHRSa3JPSk94NEcvdUhr?=
 =?utf-8?B?Zk5HT3hqWHd5dWtKL1NFN2p4Z1QrR3kwRkJOdUtHRFRWd3pONXp6U01kVko5?=
 =?utf-8?B?dDdqN1RPSHpkbUlnZlpYaEFTdXlWeFBlMW5IdU5qaEFOUVc5NVJ0Ym9CcG9z?=
 =?utf-8?B?elhpelhKNUZKTEZ6NUJrZStQWDJ2b28wS3VWcENFNzBDeXhZWTV5ZU8wTnB5?=
 =?utf-8?B?eFU4ZkpqcEZhekNrU2tDTDRENnVXcE8xWXh6aTNxUXpmQ212OFQ3dDFzZlh1?=
 =?utf-8?B?bHFrUXBhd3c5R2tLOTR2NGJoOUNyMEp0WExTbHplVXhvbmtOQTVrUURSdWla?=
 =?utf-8?B?TE9JS1BmREJsb3lsVHd4LzFNOFdzZWZKWXlkTUloNmNiQzFjc2hXMExsbEsr?=
 =?utf-8?B?emVrZ05zSnNwZU5lSCtLcEJGeW9uR1gwOGVzNGdLQTdPbWw5SCtCaDIveTNH?=
 =?utf-8?B?KzFGMVFGN2hzNGZQT2ZyOU9UdFNjcWRLR0JuVEhsN1k2LzdoUEdTSGt3MHU1?=
 =?utf-8?B?M05JWVE5MlFmZFlDMkJsNVdKTmwyKysvQXNEK2ZqUjBnRUVSMk11dUVKb2dx?=
 =?utf-8?B?Z3h6SlJ5aDhiSnZOVWlVcFdqWU13ZGNIbzJTTmJkb3k1TCthQjZKVkt2MVNI?=
 =?utf-8?B?U0VwWVdMS3RBaDQ1cFFmT0pzUmpEek0wNlZNY0pXamxjSk1KV0F0ZHVVR2I2?=
 =?utf-8?B?NTJ4SWMrb011R1ljUXZRZk5lbjhHQlFTWndldlZ3ck56T05MYTNQNGkvUEln?=
 =?utf-8?B?RUt2Vmpoa2pjWFhKK1Rkam8vYWxtQlZrM2x2L1lpZVh1RVBnWXV5VjlyaUw5?=
 =?utf-8?B?RFoySUdMODQ4MDdsMEVvWGFSekdCUTR1ZDZTdHJ1M0hVei9jNnJUNElZL1dx?=
 =?utf-8?B?M1NYZnc5S040RlNtMVRtV3UzWmphTEJIZWY0bVM2OTJheGE5VGw0V3dYYXlh?=
 =?utf-8?B?UFVTYnlXaHd1cVp0b2NXd3BtaFQyV3ZOZEdNb1V2eUQxaWVhM2hCcXNybUlT?=
 =?utf-8?B?QnNENlpCZTJ5WDEzWGROYnJFdXNTTlowa3hKSlNZenQ4MUFNcTFUM3lhR1Vn?=
 =?utf-8?B?V2ZaY1ZBd2EraEpaR3E2Nll4TVU0VmNJUG9kbFFoeW5QanVkQkdwTUV6aXpG?=
 =?utf-8?B?MUFFSTdPZ0ZIRjNvYng4K2VWSlRqcHpYbUM0djBkNVk2TnRQTHgwYk92MS9m?=
 =?utf-8?B?OERIc25UM1N2RFBNa01jU2pMZncrWnQxM2h5REhFWWtrTlNCU3M0bkw1OXhE?=
 =?utf-8?B?MlByamRqbU1PQi9GY09CcnoyelZ4Wis0QlBOc2Q2SlhaV1RYREJwREdtcmFm?=
 =?utf-8?B?ZS91aW8vMnN4OGlsNUJjdVJVQzBOVk1PK2JWbTJSalRBcG1URVJMSHFBWnlh?=
 =?utf-8?B?V3dDQVF0LzZWYkczUWQ5d0JYcDY3d3BLcGNRcm81dVJReHNkSCtuY1BOWmd4?=
 =?utf-8?B?eXk4bHFlRGN5MXQ3dzQyQkxvV0ZzeE5BWWZET0Ewc0dFbExZRDNRaWZlRmN5?=
 =?utf-8?B?NWdONldFNUVUTG9hMFprd2FLVFBLdnkzbCs1Tng3UlExMktDZmthK1RpOVVl?=
 =?utf-8?B?M2YzOXErSVVSR3F0RXQyRkJXTS9YeVFlMjF2MHJweUJSVG5ZQVF3bFJ1b3pB?=
 =?utf-8?B?dDZHMFkwQ2wwdkFVdHYxOUxBeVlrc0tCSW1LNkVhN28zR1FQWE9lcnQ5ZzIr?=
 =?utf-8?B?UjRZTnpxVGEzUWZ5WXZPb3VQV05kNGMvRi9tUStmbmd5YVc2K0tUQTV5cUxC?=
 =?utf-8?B?WlNmYlBZcWR3RGVNSmh3VlR3dytvRHpOVGlCN2NaMFpVamlRSGN3YllYTkdQ?=
 =?utf-8?B?ckZBNVVobjJHcTNjK2o2WWMybk9XZjJhMEZIbzA4WHVpQkRTZmpWekl1Y05P?=
 =?utf-8?B?RXVSUzJJaGR4YUdtUFMyRzNmOGFGTzlJVFdEb2pNTHJCTCt1S2pMUnZ2cy9z?=
 =?utf-8?B?YjY3REQ2RXNodU12Nm04a3BDL25GOEdPamg4S2F1dThaczk4KzRjOGlUTit5?=
 =?utf-8?B?WThOZmEyWUlVVXBqWXI0TGpLRWpMR3Y1OXdkOFRCc2dVWUVnWmsyWG9rTHhO?=
 =?utf-8?B?OUw0bk5UNldWUTkzWDB5OFBvTTRCVzk1dXZLRk5ZNEl3U1UrZzFzVDd4S1Z0?=
 =?utf-8?B?em5VSDF5TS93elRNdkVhWStOK09wYU55WndFVXlUUlBjT29EZ3hMRHZQbEI0?=
 =?utf-8?B?dnhLWC9heldEZzQ0NEd1L1JEay9WRGJCVG9kZVRWdEdBb0lFcjlJQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 475dcfc6-1229-4d2d-d589-08def874d0b9
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 13:22:53.5841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lf1BSTQpgJ8rl4+X5sfKgMhkSJrV0D73DGopaOT61XrImpo5jhUGldOjuP344oV34NdTou0qYuoFLfm/Q987nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8723

When CONFIG_QCOM_UBWC_CONFIG=n, compiler needs to know the definition
of ERR_PTR otherwise there will be a compilation error:

In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:7:
./include/linux/soc/qcom/ubwc.h: In function ‘qcom_ubwc_config_get_data’:
./include/linux/soc/qcom/ubwc.h:45:16: error: implicit declaration of
function ‘ERR_PTR’ [-Wimplicit-function-declaration]

Fix this by including <linux/err.h>

Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 include/linux/soc/qcom/ubwc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index a7372d9c25fbc..f3a70360b177b 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -8,6 +8,7 @@
 #define __QCOM_UBWC_H__
 
 #include <linux/bits.h>
+#include <linux/err.h>
 #include <linux/printk.h>
 #include <linux/types.h>
 
-- 
2.45.2

