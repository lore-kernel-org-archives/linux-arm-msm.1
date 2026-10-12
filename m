Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11023102.outbound.protection.outlook.com [40.93.196.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1DF4B4056
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 16:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791823118; cv=fail; b=fZgD1EZZP+pwyGFNsH7B10KQ4JKZfgbjHTnNSYUYRTP0P3x1V/rlshvOnJQ3EmMOvyd1R1c641gxBMT1vszVUIJ1ImR0t+dBnvRqk552m9m97Kb2MaOEArT7SB6jQW4Gqt/hPSQYtqk2Z/tum6/Eo0F33/qQhGgJ2uKeBG9snJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791823118; c=relaxed/simple;
	bh=ghUTPuaSUPZg0V5czm9yW7uIEs0FjTyFuUBHsHbCZP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nv1CoE2F1iAbewREIdXg6rm9GzXeQL5nYTOElCHAqkfqC3AaBMA+1pBuAOA3unizWni4PjsFvU6isRHN3lMeHMhJ2F5Wt9fUiH+pEJG+B6HEZYblYqS/ufDODFgwxXN+Ktdwyzu/s0Z93OJDEBTb6ECCCCty/M6fzrXejRSn0Gc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelburch.net; spf=pass smtp.mailfrom=trailworks.io; dkim=pass (2048-bit key) header.d=michaelburch.net header.i=@michaelburch.net header.b=wIQzmuqh; arc=fail smtp.client-ip=40.93.196.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelburch.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailworks.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=michaelburch.net header.i=@michaelburch.net header.b="wIQzmuqh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vxWHE8QAJgZYNPGActY/l8tWZ2/n11mMbI60f8vR2VsDI5M+Mpg7Tqz0GB/78kKIAgV6iQsqSUvJn+Ka1axJdR7gNUUnBOCjMvejTsas5M3jFD9fZYr5HsMJGKX23iz1YMKTx19eAHae3I635sZHz8OSUYpYPbjclIaCXZ7NsGON178f/Sr1ojAmv1wJUSmO9WtRiXpP8Xcsc2d8CBgIpQ3qewqy3OBKdzDTA6UAioy089XHclbyysfH8kNLyMNyj1Rr1SYgt9QIjtQDbjbnfaOvGji2SmY766/OHlQ1hmLUU/h1C31VQAHuyF2Sc66rsi4c6V4AXpP/NUxt0Jc6Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CKNomaM84H/CIPCrhjbcaMXMQftVtZ5G2jhUse6YiAw=;
 b=ajNt7Lgq9Q4AoO0Zo1T4ohFkr5GAwNVM6FNFZKTiy1qkqcCow2UN6+ZTiZ2PxixMMjMrxwLefQyuUzUSuPVwTIQg3PHbYwe2fARndZIgTsK7t/t9usluRUR37nf0Ca2KViyHKV2QuYyg9tXK1ZyEDUhYsGktwKzM6+VAWC4RjggOKK1pEJplBojKhFiok+v+UE03w9bJf9I0IZ9npDvFe65InJT1PsLJVDFv5/BprnX4MlWIgebT/xKaLt+l3RCpUfwq2KmgU2X+eNSRhaGE6mpUubFz0qVHlLE5enyvpUyFtcKGXQZ6X0AtDIrmq9Hca+I5dYbabu+UpwJr6N9vzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=trailworks.io; dmarc=pass action=none
 header.from=michaelburch.net; dkim=pass header.d=michaelburch.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=michaelburch.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CKNomaM84H/CIPCrhjbcaMXMQftVtZ5G2jhUse6YiAw=;
 b=wIQzmuqh30YQWbnFQCZUp8e/CMBSZlppYnoroQt39bY13yAdhqgT7UHtYFaMpd81Iag/O+W6Ls1NC6wkdtsvimBmHIQPPpMwdL3QVhKxnsfQ2kWWElDVrS33f7ghMZcRedhWwY2vr/1Dqp91Wlw72V/3FaHk+I5zzngZqV/MYJPj90s5Ib29EvY8010RQ1wVmtaHItz6+u0cn/k4TfTRGTsTNBOdVpZrJkmy2L7podyvLVr106OMgT01ZqcwwVBfZItjo5+Gfmu0nqFDPcCDKO/iC/c0Eyuh7SFWJLChsYfA2ohvvflZpQ7lIgyOJq0LU1wMfhg3O0COEhx8v+CC+A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=michaelburch.net;
Received: from PH7PR01MB8123.prod.exchangelabs.com (2603:10b6:510:2a4::19) by
 DS7PR01MB9144.prod.exchangelabs.com (2603:10b6:8:251::18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.21; Mon, 12 Oct 2026 16:38:28 +0000
Received: from PH7PR01MB8123.prod.exchangelabs.com
 ([fe80::da98:a31d:73b6:7930]) by PH7PR01MB8123.prod.exchangelabs.com
 ([fe80::da98:a31d:73b6:7930%5]) with mapi id 15.21.0496.015; Mon, 12 Oct 2026
 16:38:28 +0000
From: Michael Burch <me@michaelburch.net>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] Re: x1e80100: no AOSD/CXSD in suspend with APPS votes at zero - which vote is left?
Date: Mon, 12 Oct 2026 11:37:26 -0500
Message-ID: <20261012163000.20000-1-me@michaelburch.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <9e3588eb-77c8-4cca-8548-3ee4f58b1f67@oss.qualcomm.com>
References: <20261008215540.15933-1-me@michaelburch.net> <9e3588eb-77c8-4cca-8548-3ee4f58b1f67@oss.qualcomm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0158.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::13) To PH7PR01MB8123.prod.exchangelabs.com
 (2603:10b6:510:2a4::19)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR01MB8123:EE_|DS7PR01MB9144:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a8ba868-5a71-419c-e004-08df287f3e5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|56012099006|4143699003|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	fVoEO9472/a2V1sVpy5H6FR4o0PiApVTste+PxioQ7ubYnP38QvgnfNn1CiTA2pLfWAAwgBtE3zpewBNJJQpht7UW+8CQFvrSAs2USLGu0+vrXzaar2e6F8bvOFg8od3euECPdcL48OcnIzutdAuDf6uDqcuyVSva2lx9DsEvs/2GpJUrBbhCeWWblJulAwpeRAGQD4lL4VaczsR+u+Q1zdeEFRZ5EQuuWZvn/63kp76n5qhTJZOXHkDUdgDunBPhzFN/E0GAqmsGTc3A2BkIImw0lhtKhVldKIoGJ/FAHKSu9nOxJEpMxJfFxc5zFxQPjcrpLxYjc1SVDusQFsxW1pNtut1rRzfqEbMmopcu7MZYnukuRte07w+W+gTyZnVDbLIIAUKgpSQjR+hTUp3RjP4YzAcd9KB42qnF/2rbqWZGLX4Y3hS1I3lbz0Wb7Kye0SkU2aNJE0ydjWvFcfv6YzZMZoiy2xjQWwrdpJ+3RffuNuEFff67n6FDYl7/ZBJWQHP0h/OWtUEXPCLCbCxIs95C+aZHxFb7xWTzTHT0g7lRcvW9ghBxi3hnlCPmZrPeTChe8rGpPhbcxuozncwej1Xzalzz6lkRym+GRWVydT6yWgCYQY5U14TKtW87fvjN0KDrg7hqpCE5xmom5I0Hs0yFf0pVy9sHYuz4z5qWlg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR01MB8123.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(56012099006)(4143699003)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fkkhjZE/47O8L3wfEYjogQhmiLK6C14XlvdWNySfAuq/9DSEe+yISJ8BeQxC?=
 =?us-ascii?Q?1g4p1SFxMZ5yZKQE7lqU+gO2IMYP0zhikL8xIR/3wxG0ksbho6aRkHlr10/d?=
 =?us-ascii?Q?5XxfazGpYtLZJ9tBe4c7HCmAShJD6RUxi/n+dfYXfBZ3pts5sIIZlITPwJlq?=
 =?us-ascii?Q?A0LZx3egekZeMM2vQxqKQDiq6gIACR8SIX12bG+3IAKJs4oJ1nAQqDje2gap?=
 =?us-ascii?Q?+fwS5eZ1a4aB8K5xEIWFi5jE3fNi8/4o69A2Sx6FLM6CvDfaZGY9H/x+kkxL?=
 =?us-ascii?Q?aeOHTtBMLlniXmkNA4mUp+9bLJkA6YYZG3meWTwh1/Y81RjbMuB3Cny3JaGj?=
 =?us-ascii?Q?iHYzc5865DswGuu1yBwzMAeQJowIoLVs1yl+Hwaj+5KLhyM/EXa5NrWovyPO?=
 =?us-ascii?Q?q10GEk3V64pM05wKQ3M7OySY7sBd66+fI12GMyxch6XU6+jXtwSVvsQpFUhZ?=
 =?us-ascii?Q?THRL+h4QXAACn0cDzVYzZxyDOeRv62UtihZhIv1O08tb2fu62HjJN6brgOcu?=
 =?us-ascii?Q?wXU4mF81AK3NcWrJ2bOrtUtO9JFkCD/8k90YdfFaXkBY7HKcLEEPwDeFohMf?=
 =?us-ascii?Q?1vMKKcQRBMelXnJvhAnlDHb/h+BipLvZzMxVM9siVdKpr8LUJyhotshqqt/A?=
 =?us-ascii?Q?13OiBWgymmumle+Yv/9zbuQfpt14L2DDThb/0E5GoV2579FqswB3+rPuYyBa?=
 =?us-ascii?Q?7uHY63AR9Ns9qr8NdcduNylswU63fYsX4yondZetuk7pHbr5s5CxO4PP7Tu5?=
 =?us-ascii?Q?nv4taSn4Q5CuN5uhyJCbgxCpku6Ko2Mc7sc9x2oZPCWYkxqBgQiNV3Kyl/3R?=
 =?us-ascii?Q?FKGOtvXfME7FgqzBxHecP3xhMp0NDJ5m64CbBosaFYrVkC5d31kx34ipxTro?=
 =?us-ascii?Q?wJfBgShT69anYVWYBbOxQNjR2tTpNdyq1JY3QS68sqyrxmUH/QYvTyLBbcIY?=
 =?us-ascii?Q?PsZt0Qo8ngDF+mgCcL74prR3MC2vVx0iso81IImweZ11foMsSGUv0K9tqSbS?=
 =?us-ascii?Q?+p/84w05ksdKhbeja1LLrO1nkkH6Xav+pwHWmtrFPimGY6/25SqraJksx4G4?=
 =?us-ascii?Q?2n4G9GFv7abZKsuS+kUGFHOlcq4VkfMPcSAFCnzkZ3kEKtmOFA2SFNxsNjKb?=
 =?us-ascii?Q?dbpYriKHRT7TQTit9aMG0RvzB5/cdzGnMQ6Dkhwsxx6U8XZO4GjbM3q7771D?=
 =?us-ascii?Q?9CdUKpbpKY4aNZ1AIUw5a500jqQvz+UmU1RTEhK46Qpl8cil3zrWd701H3wl?=
 =?us-ascii?Q?n/Ch1Xb/Ak2eMs2ly6vk1Oy/LFQi2jo8cywkaEzaJ58Tpvhq4SWhhcRPo+NR?=
 =?us-ascii?Q?QAEEX+6SklDY8PXaONiQuU9pAteL9ORKkts0aJdwNTNA0v9Mx8OqC99l4EGJ?=
 =?us-ascii?Q?TmWqUA5xn/Ed8P3ajv0Fg4b51Rgu9wCIru9FjfqT5+HPeUUCSMTJd7QYUGb8?=
 =?us-ascii?Q?MeI5SfjnCveSvxw0JiwB8HsQynPwYH/P6z8CxvXFQUHWlemMQAjLvu6RhHyh?=
 =?us-ascii?Q?RujO2K9p7yCyMcr4e92HAqKstkGWFE8TRridIMzMlJp/tGwEzTQRfyn0LdgY?=
 =?us-ascii?Q?abx36OVDmxg3h4EF1ZK5qaI1KtQhKP/1C5UqlttS9sjljMTNhC1Jy4GI8NfS?=
 =?us-ascii?Q?lZDzF29EYt8W3XAA8/CcYOkuIxMqsQTvq/Lij1OyMatwDUCMzZS+dlaP6CfC?=
 =?us-ascii?Q?oEUv5IeChQy/RDMcLtIYmJi9Jkmir+jJV/oRzndZpQiRmwtx+VP2nauImmT7?=
 =?us-ascii?Q?Jhexzf4+Uw=3D=3D?=
X-OriginatorOrg: michaelburch.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a8ba868-5a71-419c-e004-08df287f3e5c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR01MB8123.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 16:38:28.3927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8256b244-08e6-4df2-b146-877069d9ce10
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0N/3FgFJ3AcimELLBEnkiWO41L0IyNl3pSYlIapjUzhOiIFTVNG14HgMSSM1epnmA7iQGCEn/TRd0Ww0kzsCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR01MB9144

Read from /sys/kernel/debug/interconnect/interconnect_summary (T0,
pre-suspend) and /sys/kernel/debug/rpmh-rsc/apps/sleep (post-resume).

EBI BCM (DDR controller) -- nonzero votes present:

  Consumer              avg      peak
  GPU (3d00000)           0   8171875
  USB3 (x3 ports)   1000000    2500000
  Display (ae00000)  708341     800000
  PCIe (x2 ctrls)       0          1

These are all QCOM_ICC_TAG_ALWAYS paths -- the "pcie-mem"
(MASTER_PCIE_X / SLAVE_EBI1), display, and USB3 memory paths from
hamoa.dtsi. The ACTIVE_ONLY tagged paths are correctly excluded.

QNS_PCIE_MEM_NOC BCM: peak=1 on both PCIe controllers.

QNS_MEM_NOC_SF BCM (display): avg=708341, peak=800000.

CX rpmhpd: perf=256 (NOM).

So the "pcie-mem" paths are a candidate -- they're tagged
QCOM_ICC_TAG_ALWAYS and thus not excluded from the sleep bucket.
The PCIe peak values are tiny (1), though, so I'm not sure whether
that's significant.

Michael
