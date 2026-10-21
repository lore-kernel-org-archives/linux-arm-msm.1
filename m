Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.66.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792559311;
	b=UqyeXPaDQtcSJZ1PvR7vOapAE2Q5Isemyvd63WndBDpV3lvejwQe02hLgU0bDBISKE9D
	 f8rmss1pV1kL7O/OOqbQ93qsCrWyfZ/NINAOlpM1ftXFA2+LfLHx56eyLhzCveBedV2hf
	 17KsXgSwXQ1sT8iowlxXsvwlbWnSaIqr6mzD63M+6bS8iO+sQ9Xz00HFT8zArdS9weF55
	 Nmg9HvDwq6tinxW/714bmToPkS2aUNvBYFP1EvALGGXkx8gpp9o6iEZKSXFQMoklYOiP2
	 p+T/6RLKKo6SPL5WOED/OCiLLkYT7Gr0pBJ24Tq495/jb41zhkHz/zltRhyEpNUnQiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792559311;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=EEG0F5trYOJiwaMt9GICUjoHMyqUp8+rnYGkifHjDUs=;
	b=syaU6FD4G4Pirg+uJrbvc5WchqHOzafMsuYo0R5da6P+fc4tNxu8ND7SUwa5494+2SS1
	 2AFcI2Quq02bNVQft04qpm562g01TAsb7kZStGtFshd3pO10dmT6Khm/72DwTbwQgiulh
	 Uy7wt9fzXSM1eyfRZKE/hfo+R8VzOjOO53Tr1TsQtvSsg9MfqAjnXh501cJXRiYQdG7u2
	 s5rtIvG/p4osKOMJjNWVRpjF+fYnXo6ch63q4/z3jHdz0mg54XQBlHDUvw0Ayk6XrqEvc
	 /JCGogl5ucBUvRwM4GgIaVOWw/jjDK/sX9gW9y+s5IZ4xgesmD2C1QEcPtsS2XK+ljQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hotmail.com;
	spf=pass smtp.mailfrom=hotmail.com;
	dkim=pass header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=NWURVYwC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.66.21
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazolkn19010021.outbound.protection.outlook.com [52.103.66.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CD6606A319
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78CD6606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=NWURVYwC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UhaXXA2rvvTICbaFzsVmS9vp0cguKM/SR0UMhcEyWEfGpFAVhK7lmjRlDPLVY828+x3v7J9CscPpLAAsILX0pH+q7bfP8PtszdJtpjQg3FAHYFftFY9xjD/FnmnvaH63DnGCkiJwWkvahR50WEHXSSJMro/LsQwqurpI3ROjexXq69kKKBu6drLe005CjqHEyk+4jgd4G534izkvuH+SOks8GEcfe/VT+H1ctu0vygfnWmqMUKs9ZgsQLPbxWTh1jO3JHWKHHroh0QPaRqw7qjZHpnNL73GYtZB1NJxk+DZ18nKh+JOB+mAT2aBSw0DICNNsTyBXMiOj3TDLppj/SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEG0F5trYOJiwaMt9GICUjoHMyqUp8+rnYGkifHjDUs=;
 b=R7rjRCEG2JkAm4tsnh20oQzppygxCZlqd56bzDcD3inJHCvXFnVfpqLXeZ68OZr86moTBySFWqoZQ5cwDRlZB3PHR1JPxURai6pTyJIWAnzXZ29NRngvmCbEh48YlBvcrCHiWgztcdGTSrmDLB4Gk9YZOPanFOVDJvS9oA6RHPXOah/NXDyhU73aA3pgP/FXaI7/m0ojpIXDVYcO8aNca5JtPWcgGtNHLCOMTks9Xxt2h6wAsK+aZpgADWhedthuNRn67jWcLw/LgkXxwYS2gOLJFkFZBiNkzq8ddIwIO90VP4v+UNIcq4LT5Hq0yG6EnolgRUZK3ULI6/3d1d+sYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEG0F5trYOJiwaMt9GICUjoHMyqUp8+rnYGkifHjDUs=;
 b=NWURVYwCvZbXIinSlTIGqiDNHcXz9w8QnRE692Q/boEtCOgqIywmL2lCUOEkY9iwgu2trj6rqzJUJGirGCorElvGIAmyiNlJvpyxuqoXX+J2J+tBVtSWGklMP7Bv1zZ3f1F2J7PPIKEZbaoafvBVYqLHVsuWIPFqtuJGg8SBjVLG2Hh5dYXYjnqEsk5EoOGce8sNkrkR1qqG84u17C6RlHpaS/67+ytJOE8W4dYKvlXnqLQsxtjal9K5wKWk7OP2CxcRhw4XtYbOE1f6xqEQwDlLMGwICrlvLXoa5AoNGcrLm0859mocgnV5nk4nPmRDDjoplYOlaTmrqv7ngdb8Bg==
Received: from TYCPR01MB11847.jpnprd01.prod.outlook.com
 (2603:1096:400:37f::11) by OS3PR01MB9737.jpnprd01.prod.outlook.com
 (2603:1096:604:1eb::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 05:08:27 +0000
Received: from TYCPR01MB11847.jpnprd01.prod.outlook.com
 ([fe80::f2a5:bc4e:c886:2688]) by TYCPR01MB11847.jpnprd01.prod.outlook.com
 ([fe80::f2a5:bc4e:c886:2688%5]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 05:08:27 +0000
From: Venkat Yadlapati <venkat.yadlapati@hotmail.com>
To: sumit.garg@kernel.org,
	rob.clark@oss.qualcomm.com
Cc: akhilpo@oss.qualcomm.com,
	andersson@kernel.org,
	freedreno@lists.freedesktop.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	lumag@kernel.org,
	venkat.yadlapati@hotmail.com
Subject: Re: Adreno 829 (SM8845) zap shader: PAS init rejected by TZ under Gunyah
Date: Wed, 21 Oct 2026 10:38:17 +0530
Message-ID:
 <TYCPR01MB11847A5E995747FEC1D8050B89F662@TYCPR01MB11847.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <OS7PR01MB11853CE810810E80B3AE708AA9F9C2@OS7PR01MB11853.jpnprd01.prod.outlook.com>
References: <OS7PR01MB11853CE810810E80B3AE708AA9F9C2@OS7PR01MB11853.jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::18) To TYCPR01MB11847.jpnprd01.prod.outlook.com
 (2603:1096:400:37f::11)
X-Microsoft-Original-Message-ID:
 <20261021050817.60985-1-venkat.yadlapati@hotmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11847:EE_|OS3PR01MB9737:EE_
X-MS-Office365-Filtering-Correlation-Id: 3766eb00-4d3c-4faf-0f8b-08df2f3156f5
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|25010399006|260925184616899003|51005399006|5072599009|23021999003|8060799015|15080799012|19110799012|40105399003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tH9b5QqHZ0FrWqcLyAnglKQqpUNJmwyfEL2sDeumRev12Y/NwqfECMM0ZX7q?=
 =?us-ascii?Q?1dYZCfWQgIOaYMbW3mjKrMzdGuQqL7dubStMb7HtPr8bSz7FUSYpkSWZ6tao?=
 =?us-ascii?Q?ZBhJW5W7QrzwTkei8eWuE2TTYN4pQFg6PoXTl3KdROGV1vXsx7YdtOC188Ry?=
 =?us-ascii?Q?txqgkuf449lwdTvihaGY0il+WotnuYxalAjvE6B7Lml36CbD6VO9CRq3a9B8?=
 =?us-ascii?Q?NI58+1N+nwoPsSdVU5sKTEysWy9jw9psh1OLbQo9t8nDonJgyuwvVI+qbU4C?=
 =?us-ascii?Q?cQoWwMhlyX/UgCZhqH+DSnDc7X8fnC3O8jPc1zU8fe/LxbdkxgVKboEPHE2F?=
 =?us-ascii?Q?zkmMAZ53Yxmp2FwZy38X1GBD2h4O3VEYtdqthY1K85YEiDrahQIA5oXsobrt?=
 =?us-ascii?Q?l/rRyO/tUgYiYbNDa7CFZ225yHwtE2iQaaxIPrebJLLBM546R8tipNHyOvHq?=
 =?us-ascii?Q?2VSOfOKQb665yLxa2G7Fi7b2MRJTF4RWrCCPX9k9KFtxFW/viWegjLrNeya4?=
 =?us-ascii?Q?kdsmUutKy4yabsF6lcRKkFCT/SKZem+qB9ySUoIS6PnJozh1+Qb/2I78t5cR?=
 =?us-ascii?Q?9w0cpvYwog7jp13kQjJn1OzGJSl1PyyT1qZvfVwPmCEhEbH4sQaX+fyeR+Sc?=
 =?us-ascii?Q?6xwacU9ZKaG3JGdJv0OnCI6kxMl1Lkglt0p944AT+AG2mgcldOeiiJKSmiIB?=
 =?us-ascii?Q?QvdC8ZV7RAGL8ksSJhngwnMZegy56jGOfSLUOpS6DCov1nmx7sRW9E1WXnHm?=
 =?us-ascii?Q?bMnza5Hm7oBH8PXuKYnocvC46kD4q+78VTnSxxLxOdEezWQZIs4j5gHk9rGT?=
 =?us-ascii?Q?e0rQyCjlUrdQRZTxdv08c6O3ZB2qCyqV6rABNyEXjWORMb/ByKrauGE4GILr?=
 =?us-ascii?Q?DuZCwc2DXK7u1xfwMQzcy/rIUIV4Tc9h9rcBIdJuk+UxuBfqF42xxcw4JBy1?=
 =?us-ascii?Q?KDxIQpdiaMrxXXObINCgtg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fXCk3iJEeNNPJTXBY0vHAuQF4yur5IeOUtYW+eRfq0fiLPn2+SwCJJlCOQ0o?=
 =?us-ascii?Q?MVDoqe2/nu09xnVK61XG1c76g/VRDHt1ooVARrhi4Zqnm15ta7hC89o4MVfo?=
 =?us-ascii?Q?fBe2QvHzPgTJG5XhezWdxyw3t1UOom0d5msMzssKrjJmjYYeiGrtnfE4uCbm?=
 =?us-ascii?Q?adE9LhrNLIqUTyhu4yb8Ro2HptGteyHBlcn40nyjVxdhveEEzOYlEg+L2iBV?=
 =?us-ascii?Q?YkzF2mb7OQnQr6sikWnUTFowonA3zQtAjLbAdcThOz8FVD8oe3TkhJT+jgKf?=
 =?us-ascii?Q?m2IN4blxVQ7l26z828ucySb2AopHyMOsmWi8NIi5vT1qBz+BudOZfBaSXJja?=
 =?us-ascii?Q?3vpUJ7GV5inV2+jL+MwAb+RN7bNIfdd+FgNh5/NMidH22Z3ttwEnsIaNyZOl?=
 =?us-ascii?Q?dyGhORkMcPJ1bVakv5nPdttPQSuSsUnVp0WZmvZn36EjBXCBpyKruFS532av?=
 =?us-ascii?Q?Dt+w/K2/qP4MEpUDjeavv4ONbe93K074rhF1NBr2jHUEVhTL079qeyNzi1hv?=
 =?us-ascii?Q?i2vfQJUoGHRYNTL3o9tts2Fedfsm87bV5Rp5RxMze6CwM3Gbsxq/+moh6Gyl?=
 =?us-ascii?Q?uhoYvy7Qz7ksc3HjjoNoxce+V2kUcpnbvLE4hbnjhZGb7GEY1SL0UdOUquIN?=
 =?us-ascii?Q?1bR4N0A6o7oq/7IOkzOr4EfKQX5btPLoOws1BWGFJeUUCuF4P5uz/6ua+IBg?=
 =?us-ascii?Q?l7iOpxfEVAu2Es+KZH0NXCpyhybJYtLCgCLTHZOfD5qkP3zPCYzfO39kcgGk?=
 =?us-ascii?Q?KzQDvYi3w9Z5BZS2yPl0XuTFDoOCIRgUaEFVQzED+hiIBFiuc4NbtJwEo1Hm?=
 =?us-ascii?Q?Z1N9pJFh4+nPEfsr5E7S5kGx/klfVbesRTR5rZak1G3UwMiv0SKKQu/ZPEbn?=
 =?us-ascii?Q?Lai5BrGnRQdK1L4APkhDwhjbur6GFXPTTjIhkP1mGWVkpdlzNBwYWBP12WTE?=
 =?us-ascii?Q?O0+iRTuF61HgAs5lSeP0u+cji+NE+VhxyhoQBtJz7qqNG+rU5anZrnsMOVcM?=
 =?us-ascii?Q?IcM5W8O4p3Z7XgoCXhIQazuWCjIan01bmAXR4g12bNiLC5iGRdSQT2G0OJzV?=
 =?us-ascii?Q?GgpvEOhXrE0xikMp9DKHgGjxvWEctpTzuen/DVtXWbDWGq5ni0nCL4ZSIp0V?=
 =?us-ascii?Q?QU+xLtf1UZeLODIO11jC691IPiIRRJjlnG40pPXiO1gJ005ZYbm933O1MhFg?=
 =?us-ascii?Q?fv9zqQC0w2hy1s0mJmeq2reupZc7rvGjcpcX9FYk+05s2K3uBNbBfqhnLZVN?=
 =?us-ascii?Q?Fx5Xwx5eRJpImZ894DkealqVvxylCM/3weSo19dk79b/LAwW567goPc81ZS7?=
 =?us-ascii?Q?EMP2xd8UsY3zqrqND3uBpyMx/6tdEwv2CA/mpJxmfJ54LOfOxNkwDkawA7+X?=
 =?us-ascii?Q?U1y6H83ClE0GNwEcv+uFGykHD+FA?=
X-OriginatorOrg: sct-15-20-9412-3-msonline-outlook-b83fc.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 3766eb00-4d3c-4faf-0f8b-08df2f3156f5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11847.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 05:08:27.3945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9737

Venkat Yadlapati wrote:
> Which listener or QTEE state does PIL init depend on for these
> subsystems, and is there a way to provide it from mainline?

Hi Sumit, Rob,

Please disregard my question, it was my mistake: the zap shader I
loaded was signed with the wrong key.

The stock vendor partition carries two copies of the GPU firmware.
/vendor/firmware/gen80900_zap.mbn is signed with the Qualcomm
"SECTOOLS SECP384R1 CURVE TEST ROOT". Android loads the copy from the
modem partition (/vendor/firmware_mnt/image/gen80900_zap.mbn), which is
signed by the OEM. I had packaged the first one, and the production TZ
rejects it with 0x300045.

The early Android failure I described was the same thing: the video
driver probed before the modem partition was mounted and picked up
the test-signed /vendor/firmware/vpu40_1v.mbn. The later successes
after qseecomd started were a coincidence, PAS loads keep working on
Android with qseecomd and keymint stopped.

With the OEM-signed zap, PAS init for 13 succeeds on mainline without
any QTEE listener.

Sorry for the noise, and thanks for looking.

Venkat
