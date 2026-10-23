Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792768243;
	b=OjuNyLdq/NZAhOpJgPbQJQY13lFSspBzqtM85vUxix6i8/VLrB8kOxYLVeDORdBM1dRz
	 XLQcvB5r/3ory+W5eBf4SGgDpmOBz+ade0eXgS9Ne4ARw+YMWhxvsr/lwmypajVZlwNjc
	 mB6Z4a0cEhWaWVgeSmP2Q3hkFW2vJU8HzkVRSGiCIRbeoPAAuEMUGQUnhsuzBP3FVBJCb
	 tdJaOP1zaDVKWge+nVEupjfSV7c3ikN21xSnuw+rJ07nW2wcmlrQWAlQ/ojV80sm24ecJ
	 KbfHm6bEq2uKt/W6ZXJ/+7mb1IySy/C0Wf5l1OmjBBzjLW0zirSaHE4lGm/SHSyLl4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768243;
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
	bh=Lzs+gYb8KqLvuWyV3bAERJRfSgbURMwToMgIccWevNI=;
	b=Fix3iSo8vRjTpZwPrqxs8MYccxEEehxfYRErQtR0Gy2ldIbbWUpspX579wfmq5I1wpjm
	 kiw/yR0QA7PjjTCDOBEfnI13CKAFgwd8mvu14ChCXRUe9cc3TSSu8tOqBGKzfOFgkf+3u
	 6t7iJd0SKAffx+SRdwcLA87s/YWCpoMB0SITClE+7jjbJx0hBWrab4hPKWx175Jp6GeUW
	 oXEJ/mEF74SJH3FZOV20yCxyZNsRqqz21mAlplFwFg2Aymv/aNMlw5AL7kkSIFrI3Dnyz
	 Rtmx+8Qna+UD6r/SRuLRrgdFEqLrhlokwrUYCXQbeIJEkZB+Y3KIK7rsqIp5nX4fcCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hotmail.com;
	spf=pass smtp.mailfrom=hotmail.com;
	dkim=pass header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=JCQJD9i9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.38
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazolkn19011038.outbound.protection.outlook.com [52.103.43.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B216B606A31F
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B216B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=JCQJD9i9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/8hXu9dIVArndWtod8ih02lm7M3tpY5Xb2RAIYh5+LpyvZhpV3m7FZOAPGNcymFuO1UvR5RkfnKFaDP187PEl2HlMgEw1QwJfAKiKocYv5KKR0X0Y1s44bPgNPbsSqmwEWZ9NOUyXIRmztm1omehx3da7CuA0DkPdDi/bSOCO+TYQOkENKW3XzMElBUPjR3aEPOW6NF6UCYlggEUz7AzGv6VGEBb2Fpw9B4mpkEAAIS2nNk/uMY70jIAsiCoWr+rciDizvZ2LZHSV36cTHg0X9JbS0S0+UcrDw0ErSqBOjLDXsX6CSfmiTVZQq2tEzgYpLZmJB4Dh64f0fEXVZxqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lzs+gYb8KqLvuWyV3bAERJRfSgbURMwToMgIccWevNI=;
 b=vLlWuMdEjO4sT6+guufBn7AQb2Jzh2wRYGQ59tGPHTcFGpFTesaVXlG1xOe/LYlWjbVGXTbSuQnCWlYiP4o97GBmCdwPXI3TJCZfL2nRQy8lxlfvG89BlkysWIWGr9mKyUVFjp16ImyiHNi3VCtWl6vfWKezQYMsLphTzpgiR2XvGmaloPEP2qRZXy+LIouHjugbNp+9QcypPKiVSfZCh6PanlhXc/xVsX7KB4MfRPHch4YhABGp2XUy4V6kb/IEl7EqaxKnSLLJUJ7ocFnbeOGddL8xNMATnrTs7xB1nFiU1IuCX3GvY7HfC4dGAR3cUCdWYl8oJ3wQgDWrhbPEFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lzs+gYb8KqLvuWyV3bAERJRfSgbURMwToMgIccWevNI=;
 b=JCQJD9i90k8JyLoIhcV4iET0E2/UCToKyylEm9TyX2qvTxIHIWFTElodAqpLulcdyxWrH50DrMbGx27SLrCTVkLf1a1grqcjzhIWBUn5piqnqb4W1lgPBl2rWwiguIjc7SWWvzX4U/tLF2C6TPGg9QqpXWlf+yLrKto8HAeQcwfvLyKDOSSCbN5MVzjm0CjSsYiZNbmmUt2vvLw/dJSWRlFh4s0dx30HWrEe5+NMj9Y9wvMw7yfRl/pvLHpcnBWz1prQevmVOM+cEIwpUsFSDezWZ3yph9z0IJpLXrjlt4cZTJHHsABK9ytg0U1+SGvnVlIPG8t2AUx9fqsAvLAXXw==
Received: from TYCPR01MB11847.jpnprd01.prod.outlook.com
 (2603:1096:400:37f::11) by OS3PR01MB6967.jpnprd01.prod.outlook.com
 (2603:1096:604:120::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 15:10:38 +0000
Received: from TYCPR01MB11847.jpnprd01.prod.outlook.com
 ([fe80::f2a5:bc4e:c886:2688]) by TYCPR01MB11847.jpnprd01.prod.outlook.com
 ([fe80::f2a5:bc4e:c886:2688%5]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 15:10:38 +0000
From: Venkat Yadlapati <venkat.yadlapati@hotmail.com>
To: james.wilson@posteo.net
Cc: akhilpo@oss.qualcomm.com,
	andersson@kernel.org,
	freedreno@lists.freedesktop.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	lumag@kernel.org,
	rob.clark@oss.qualcomm.com,
	sumit.garg@kernel.org,
	venkat.yadlapati@hotmail.com
Subject: Re: Adreno 829 (SM8845) zap shader: PAS init rejected by TZ under Gunyah
Date: Fri, 23 Oct 2026 20:40:20 +0530
Message-ID:
 <TYCPR01MB1184706197E878D59F9E82E629F642@TYCPR01MB11847.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <DMBYHSAP8KY7.K9L1DON3KDR4@posteo.net>
References: <DMBYHSAP8KY7.K9L1DON3KDR4@posteo.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0061.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::18) To TYCPR01MB11847.jpnprd01.prod.outlook.com
 (2603:1096:400:37f::11)
X-Microsoft-Original-Message-ID:
 <20261023151020.1051281-1-venkat.yadlapati@hotmail.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11847:EE_|OS3PR01MB6967:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d2b4a0a-ac7e-48e1-dc4d-08df3117cb1d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|8060799015|260925184616899003|24021099003|25010399006|8022599003|15080799012|5072599009|23021999003|3071699003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?08qVxuk86Mp/3arZJwTKGswjSsn0DUV/dC3dIxzgacldf4WQw/AraZ632t1o?=
 =?us-ascii?Q?Ub2e5NzdtmMS5SZ2uvgXC6dYeCYO4B1XcqXfxih+Qn8u883q/DPn/oJxoD9T?=
 =?us-ascii?Q?INsiXPiOabIBXLCcoRY146gVuZEJkPWuOMhAghr3ymNaHWQehZG21fQk1Pyn?=
 =?us-ascii?Q?+YBGxrAgI7Bpp5M6FzOuNkgVNUFFnVZkftuULN3GN710wu5oraV93lII4K9E?=
 =?us-ascii?Q?rkNYNuiofK7gOSW6aZm0pRM9DWfqddnwjV48jhLdIVGFKbIONkNcQoVLfqZq?=
 =?us-ascii?Q?xpvSVc9kQY5hZAsX+0Kq863mguDdD86UPepb7yUTkJvUakEVdDiuS+lH0NWl?=
 =?us-ascii?Q?Y9MKjJOXLZ8GgMDeJ7G0J+DiqvZfzyfknrGz6Nxle54A3Rpw6BS7+20s5j/B?=
 =?us-ascii?Q?VNaTiZVORt1wAwIG6MV4nuiNxtclrxjZ9jD7VMs6bu9e3kVQO6nbsBDLn7pq?=
 =?us-ascii?Q?IOhFC+cJKJibIVg/L7Zh06qaIiw2vMsQmKpv5vxwy00E4WNlWNgocjz1Vc3n?=
 =?us-ascii?Q?t5aXl0S4s7SK9aSOMowqlld1jalOQOgkomuFTizOuswtnHwL6KMLSNEUwHoN?=
 =?us-ascii?Q?QRqLhD3iOkCPkcYQVyZw4Dyr5WCr7TIY3Ayu/DrlSHX5yinPRIx+hOzg/Doi?=
 =?us-ascii?Q?lOmSasYjv8GA/jJ0ZM2o+w7ZBcao0cy21BQEoTZ3bfQK7+MvHL4mVP7vjUr/?=
 =?us-ascii?Q?ngY/y3/NUYcOA3TqP08B16ewVMOjU+1p8hrT+CG4l4bp8qiJmSZ08MMe+nWA?=
 =?us-ascii?Q?evKhhuRxbENwgtLr5wX90tCaDYjzuZXtABynyDTCHVmyuX25erUHX0NpHHFT?=
 =?us-ascii?Q?C67PolYGzliz+2nmjcYTh3OTD7hAR0aMeFcYO5wra7ZQ6M51mKuhnaRiyu0t?=
 =?us-ascii?Q?CI11GvfNWjAVmiszEXkj8nZHRat75AemU4CSapCvros9Ery/1JPgnmjd4v2G?=
 =?us-ascii?Q?kIkfVbm433opJV1h84X8iQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WMR6dVBkA1bmYNUyFl//vrKTJ6+UKPZ7onOKcRdyWRIS9ZUmGA59wL/6QaQl?=
 =?us-ascii?Q?5JDz4SH8Rlk/d59RhJ8cF+QSRbcHC9osfUAYwd3p/XLspB6dOpwYcVD20igf?=
 =?us-ascii?Q?xGts8h1Xx8NWpMBO0Q9gGiUgbmoHoP/ArwoorFSOOkMHEVaP5tQ4zO95+hwA?=
 =?us-ascii?Q?rRZCcBDRQeJF43ho2qkIH1F/hRsoihv7XSpmWyPUJmoVQzuzbcPaqp/I3dOV?=
 =?us-ascii?Q?gnco31RTUUwQ4++zG7Ors9tljs+cudSB1SN+uKSeyMsIc9zX8x0Fl9FEYndY?=
 =?us-ascii?Q?sejoWYa/lEZ3GKlJiDSUrRCJfqT8M2PqSOOxfws5L7VGzu2LR1VmIJsE7irb?=
 =?us-ascii?Q?JTZT4C3WRkO4fzLCDQ4Y3DsiBn2S1cOTFKO5Ito7WAfSH26GzZMISGGNXCsx?=
 =?us-ascii?Q?bA8nhaUyxAo4SfRMAJGh+noDZESw86VIuVv+CNSOI0Us2i4cw3Los+J8Sn3t?=
 =?us-ascii?Q?2v/r3LkmrCDpb4Mt5NrsGalRNQRixvqIc5cmwUQvWDay7krEwiO9mUbDc8iL?=
 =?us-ascii?Q?vmJfrgeofi8AKbxf/SCTXB5FKdJLd4RyYSrr25Q3benyI1HbKaJV4yJbV1dh?=
 =?us-ascii?Q?5w7w167IfmtyBUCO94c2t+dLNyCirhyYZ/pMadnjbqNB4/n3de5NX4K3fQfd?=
 =?us-ascii?Q?xoIfzcy/aUyjzlCi9IQTEE5V5DnWstIKQ9aj8gCz++6c17X2XCZw07lMHeB4?=
 =?us-ascii?Q?KXL+NBCxIqt7HPij7pB00IKFFokkzSCerxwitII5X5yvviEtyKxG6ZxZfPJD?=
 =?us-ascii?Q?pRlSwn1heTuAgdHBr1VvnnYKatREgKBBbSQxbTb5NiOBtTn41HSCAbuDVkaN?=
 =?us-ascii?Q?HRhgiygk/tKaGxQQDFU+Q59JjiAjkTKHpNqchQpzN7ETN/5C2lAkUGftbpnL?=
 =?us-ascii?Q?nWvdpod+mm3lNchGCHBQKzaaWyrUQznfKUcLrJm5zL2M0uB209WfHNnA+5Ho?=
 =?us-ascii?Q?M+swr2Rfco9jKop6E7g84bPKoamKhzTjWf46BqkImhDRbQ6EK/kgyYZTGIC1?=
 =?us-ascii?Q?UxrfFSukMlJw82c1/8YtVJGXlLPZO/xLFDyujEVlDfT7QAFuTEIZg8Tn5/2U?=
 =?us-ascii?Q?VM9knTBgGKwUam2D8fBIC30V5Ok7agt/yeoZv7XpqSCPYYpWWJORPc/CGg2l?=
 =?us-ascii?Q?d3ucTRzaiJHSoXyUQwincJuhissZHZV5Pp4/wzRrq0drbACIcHaAI0hM9NYd?=
 =?us-ascii?Q?9Q7amy6HH4U2J/Zx0/WxUravHIGleAFJIBBYs74TvWHNn1csfXYZ/1BaxsyD?=
 =?us-ascii?Q?ooV8GUo1+2otO4VO4LEPylXtX6h+/iElXfZnsFDMaio8UuyUEElSe6/hc0sL?=
 =?us-ascii?Q?7zNlCCT7dElTZlIC6Bue9JcDLU6lFb71XoJwffRrxwkq2V5muH+jBDmnRLui?=
 =?us-ascii?Q?/J6slsPDWZ8I/tXjnEAwggHKSS/4LT95X0BTl8ClRzexZg837w=3D=3D?=
X-OriginatorOrg: sct-15-20-9412-3-msonline-outlook-b83fc.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d2b4a0a-ac7e-48e1-dc4d-08df3117cb1d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11847.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 15:10:38.4949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6967

Hi James,

Thanks for the heads up. To avoid duplicating work, here is what I have
on a Motorola Signature (SM8845 "alor"), none of it posted yet:

 - TLMM driver and binding (205 GPIOs, own GPIO->PDC wakeup map), alor PDC
 - SoC dtsi on top of kaanapali.dtsi, plus the board DT
 - gpucc variant, A829 catalog, panel, touch, DSI1
 - UFS, USB, SMMU, charging, audio and modem work on hardware

I used the downstream codename "alor" for compatibles and file names.
What do you use?

Do you want to post the SoC base (clock, pinctrl, interconnect, dtsi)
and I rebase on it? I would first diff my TLMM/PDC against yours. Or I
post TLMM/PDC since it is tested on hardware, your call.

Separately: I carry a hack disabling icc-rpmh QoS programming, because
with it the display dies at boot. Do you have a tree with your
interconnect driver that I can test?

Venkat
