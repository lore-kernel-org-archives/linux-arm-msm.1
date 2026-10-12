Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11022131.outbound.protection.outlook.com [40.93.195.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB66470433
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 22:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791844816; cv=fail; b=n665c7e044tc0x34mbXExuzSangiY4gTvygodzI+iGdxONgjEEBYruAzUKwl+HF5D7teoZgzjfsAp9pGnJgTPuBsP7NT2FSsvYiPDDOy73lndxb47EzDRSvTPLBhUHZvukaebw0e6TE8kqzFQlqRwdWQrQ2j3vKb3SvjS8zSV8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791844816; c=relaxed/simple;
	bh=OGbtiO3S/XZCpjHfXPpwOKNWGucssvNBnoVsYfVLtH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e/GXxkGrzXzEXALkTpwYngfaljmj9PTiIBSl/XVMWT8jcd8WaViK0zM0IFg1FfMPRBsYf4ApwlR9WiEqnLNACHWP2bPB02/zHNjzZtG2ecseEpzY7Tl32Rb7MeW8uWbhtV9+Aq/jWG8ocOhp/oa77/TC3zZb151E43CHrhAIPjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelburch.net; spf=pass smtp.mailfrom=trailworks.io; dkim=pass (2048-bit key) header.d=michaelburch.net header.i=@michaelburch.net header.b=ffZdZyqy; arc=fail smtp.client-ip=40.93.195.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelburch.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailworks.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=michaelburch.net header.i=@michaelburch.net header.b="ffZdZyqy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ORwaXCE648WtMeqTfyTdhvKX+flBRLnae4VW2KvYDbVZp+F95I0pP+9cE9F7GV9PkADhc64y57I7POOEXIr7V2qcPhALO8TNsD4Gv8BRMq1fMxrQGEiOJyPu0dqjJcbNuxf/bndVkkpk1dqC+kqP4g4P73eZV04jXknDYHAJwCg6op4lY2BJg/4Tixtd7LgLlU22/o51w0s+OPYliW8x5aAa2e322j8JBonEnbQvRjNV4XzEwGIxmsoN2IOCuXDez21vrvPo/wb5uDCmM3gWCEabsxlIt+iGWLYOU0hV3QUkrc6cCKrVWUSVRQJtPOF5az69ccGgf0HHWhqyhsmutw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGbtiO3S/XZCpjHfXPpwOKNWGucssvNBnoVsYfVLtH0=;
 b=RYNU7fUShAZmWXy2ze5OsGgz1quBU4B27q9bO6Bwk/zG544qqyEDo+KNxZ/kuBeXqDHg6zajy0siZ5bVD1HmXKQE4xJSmEkc85PMKj04DaMs+yMlMYkBdL1cFj/tINO3+cwxsG45A757FZK25zMqZcOKlY/yaSaA9vgBAHQjtCPVKopr16erknwlh9ilZl92NQQ+qLVWsApJf9+tCSNR9HP3QAn15JXye79np0hmcqksi29++VfvFVftHuF0/hQykjIxm+3pfEe2q9FOn3GeHQKW47tKhXLg/Nw48nl2DdRwGqzGc+8RcZ8VFTSJheZ/CoUPm+Dtq+rmDqoWk2ikyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=trailworks.io; dmarc=pass action=none
 header.from=michaelburch.net; dkim=pass header.d=michaelburch.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=michaelburch.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGbtiO3S/XZCpjHfXPpwOKNWGucssvNBnoVsYfVLtH0=;
 b=ffZdZyqywF++4MZjpyVN7GxgFCfr7Y9W6nQEHVEa+3hhuMI/YV2JhfCMy0fY0pLl0aaH1UUVDscc2howXHf9w13bExCAvx/9Lv/Pim/Dhgx1HKJb4TEA7riGG2CwtJOWwRCV4JbRXpSlTmd4KfftX7KG4jlJ46gnmaHVZKs3L+fFujEfPtowa0d24aznJUqrtL5G5yQ4nKFfwfv0eePiPBudVhKunITZRys4SyHyZ1HUyVuuyLwvXl0b6qXBEG0R6crUSb/UIGhfkL7996GBJaqlYtqR6MkP3uaQjtcazFesfENPrlsKGzvPCpoFj2pDo74uUJEBQ5Tw8tvGuCSaOA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=michaelburch.net;
Received: from PH7PR01MB8123.prod.exchangelabs.com (2603:10b6:510:2a4::19) by
 SA1PR01MB7293.prod.exchangelabs.com (2603:10b6:806:1f4::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.23; Mon, 12 Oct 2026 22:40:11 +0000
Received: from PH7PR01MB8123.prod.exchangelabs.com
 ([fe80::da98:a31d:73b6:7930]) by PH7PR01MB8123.prod.exchangelabs.com
 ([fe80::da98:a31d:73b6:7930%5]) with mapi id 15.21.0496.015; Mon, 12 Oct 2026
 22:40:10 +0000
From: Michael Burch <me@michaelburch.net>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: x1e80100: no AOSD/CXSD in suspend with APPS votes at zero - which vote is left?
Date: Mon, 12 Oct 2026 17:39:36 -0500
Message-ID: <20261012223958.17440-1-me@michaelburch.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261012163000.20000-1-me@michaelburch.net>
References: <20261008215540.15933-1-me@michaelburch.net> <9e3588eb-77c8-4cca-8548-3ee4f58b1f67@oss.qualcomm.com> <20261012163000.20000-1-me@michaelburch.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0050.namprd11.prod.outlook.com
 (2603:10b6:806:d0::25) To PH7PR01MB8123.prod.exchangelabs.com
 (2603:10b6:510:2a4::19)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR01MB8123:EE_|SA1PR01MB7293:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d9ae9f5-11e2-4283-ed15-08df28b1c60a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|10067099003|4143699003|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	icgFeZ1zfDCmzbvuZ9gUPZgiEuZWOxGwEdKFXEJd9POhYBp6bA2mc66GXDSNBeXzqYE9hqEVpsNgMK/tGfLueN74knlSctBigdpUQuDZrfFJXcV9bzfbz+w+rdicn8187ZAHHgh/DeofsvfcEt9yEfqf47M1bQymDLc/BH3YKpYwHwUcCyCWKQaTnT0MQuWi2qrkwh8ygJxgl/xOZIalEuP4MQJ+7yFXXxti7EGUHyXwOHfjipjSsBDIuFa3S3gx6JZUAykdxj2jEDqMGLCPYG2w3ye/LVpQF+8JgG+1P8cvZH3y8WtGC1KaLrsXSW1vXboUiRbxChXsBJpMK8PRItCanRPx/cFdkC8t3DJHbS11wplVXDO8vji6xowXmQHQzNc39D4/VgaWGD+IFVwIWGYe7HKJTE903VsaFTvBVob80CVufXsm5qg4l+XGwW7fVtBZkzux0gdl+HTr8wyGD92zKujRBFf/z6YiRac5O8V8dHq7mYO9N9m0w0006Uu+5rjYA1uoc3zfY2lgFTQgZIrDqDPaUNhAqWWxNDEL5wtoNZpOlUqLYjW5jrJ63gH1lCmlWKhXiU9q3JSBjYHbY5Axa1dQaP7uH5hf/1Enko5fdGkLngXP8+y45+I/ObWaGKcn/5zzvoAqW37Dt90CN/+Iwn8hiwj6Q0a/Qrsmb70=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR01MB8123.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(4143699003)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3oxkwGBAkeFW099F8fy0ZZkw4Rk5sCkl/ppnfADyay+qzc1K7iC2nlPB8UMW?=
 =?us-ascii?Q?m32Qw+R4/pMJXSNRJ1ABhPQvK7Efu0N1QwCBPy9qsaL8q4W15YjN89Kt2D6N?=
 =?us-ascii?Q?ICDb95ETkyjLWWyVJIor1vQW2BU8M9e1E0syqzxSapVCyj11DwKTfv1RtPz/?=
 =?us-ascii?Q?lRxjLB5HHGQIjUdMyw7DI7ilCnRARfpgHW8Z5RYeRco1pv2yJNkYke5y5l8p?=
 =?us-ascii?Q?6CFDE5ENd3WudzqddABOn2lkJtPspqdehcB/J+cyI6qwLl/CZK69sq9uzvJC?=
 =?us-ascii?Q?+KMzOTC4TjCTtuJUC3UySSUIW4JVLoLVxOjC8u5tKEJlOinOTwXwHTRE2lV8?=
 =?us-ascii?Q?nJY+T1A6OL6q1pErwWrs1+X/jH6izoNEXojG2pUW3LORtDQoLFykvaUBo2JW?=
 =?us-ascii?Q?l1M25sQh5adb9qcRFOkoht7Wzah6dD2EHt0HNd8hkNDNlPXbNnlaC2j4SEtU?=
 =?us-ascii?Q?zGMIvPz7kWz7jQp4t2ZQ6Q9fpE3+HKL0ByHEu5c7XCITKxXPVIRVgr/POFEk?=
 =?us-ascii?Q?jv8zv9gLNI3W5qWpZEGjxUJ+cpFqMHexAR2+2e9XMaOHbw7K120uLdwbbwtx?=
 =?us-ascii?Q?VawYlrgpBTpoZO8ppcZu3Kjtp8MD2yaxabmG4uOH7Da3pBWwKMfk7KsoIh6N?=
 =?us-ascii?Q?3c12tf3NZv3JNtQiYPywjYW4Nx7cWRs63bjz53gm1TJb28b+rMhDJdJCswDc?=
 =?us-ascii?Q?XtZy0jHqZ25Z3pVB1CKjW7mdsON99vw3XtpRDWycRa3B2tupZJygXFTT5SVf?=
 =?us-ascii?Q?qFdP5tJBxyx8CWyCS+y4JuxbQf53OZKunzOMokpHsCTdj3Luvs6PITeILrZH?=
 =?us-ascii?Q?lcsblofDLhuCkZbqneg82pMWdqFdpjDBoMgzVmJ0/7ECg7otjPn9npSFsvSg?=
 =?us-ascii?Q?NUpY1Dt7vP6e7YvgnCRVg6Uxi1BYpLjve2dHoEXP6M9up3EGHWbA7dKisG7d?=
 =?us-ascii?Q?ReOHe6o+uM5Ib3m/9XdXXQ9raDd14G/lvzQyp6yfiZKwivL0LtLuy4Q7flFv?=
 =?us-ascii?Q?3MPA4+aS0I9yUIYWHXXnsytzXVyj2Y5y0bHIuoFQXsVOlC+zoVOXVqTR5mHr?=
 =?us-ascii?Q?JHC0b22bV0Pn4AlagXCB5+WzP5xyVIrzQ9UGk2huTMEzx1dcVMucSnvTZ1NV?=
 =?us-ascii?Q?BKXZSz2piATsJPG9IbRMEtsaYG8glYtDt1XXcCpR8QkUGWENOVxziLGnpWJ+?=
 =?us-ascii?Q?SLztOn2Pfl9qvSiEqXsskLqeMcADAIjM68MmU+ZoKayyaRvlDP8Fe0mn4TaL?=
 =?us-ascii?Q?UeFAPZKc891vnEbegm3VvKgNcoak2IXM1ADsPrp9G5pNyQRPeDmo/f5Sbo9B?=
 =?us-ascii?Q?xZK3ZwQRq0YyVMuaO25/jPCf2TUSj8a72jCrWPMzPP3W9CeIPfGyv89/1swq?=
 =?us-ascii?Q?Aoilsv0FfcVdHrHTqREl7kuxixGA0AF3W1849mDIusTOywT0Jb+W4fTEwcy3?=
 =?us-ascii?Q?hrlmtN49havSq+bDLk5ZIHLWTA6ArkCArksPpmvCwgrfG73hhJh6yC2eLk/f?=
 =?us-ascii?Q?LZ39CVaJAtVZeVDbVNrK69uvj2e24R/+lpzNX7nDHmcTjLOVVngxlqpX7Gje?=
 =?us-ascii?Q?gfuVlDhBPWBKyy4Ip5kbwgxXZuYw47nAh4DT3iQemNmFtBRocyl9eIW9LNN8?=
 =?us-ascii?Q?4Jxd5FHueGQf9QsQhu9i7ebyfKEvcPHL+MEQGx95/KFcXxXQWE5sBMN82Mv2?=
 =?us-ascii?Q?YQ1LBCAWp1HY00Emn7j1vbythDZt8EazjcHz35CUEnKq6fvn1qhqJAzdY0tF?=
 =?us-ascii?Q?VseorJhVvw=3D=3D?=
X-OriginatorOrg: michaelburch.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d9ae9f5-11e2-4283-ed15-08df28b1c60a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR01MB8123.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 22:40:10.8728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8256b244-08e6-4df2-b146-877069d9ce10
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bHRjttP1ntbDxhazBrWdANEbMnMKh8K8EaV0e6DT8EH7bez8Mik0AHMy6NVC4q7XSBQmqT3zRPicTK15OnRMcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB7293

Disregard my previous reply. The interconnect_summary figures
were read while awake.

Interconnect: no. In the last flush before machine_suspend, every APPS
BCM vote is 0 in the sleep set, so the ALWAYS-tagged paths I listed
hold nothing in suspend.

RPMHCC: yes, xo.lvl and the retimer refclks (clka3/clka4). With all
three at 0, AOSD/CXSD still stay at 0 (one 725 s deep suspend).

Michael
