Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazolkn19011034.outbound.protection.outlook.com [52.103.43.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A430542805
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 17:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792086060; cv=fail; b=Py/E5weI8WNtgqTAJlorY53bS9Y3hA8imrOS6gYKvCi9lPFAlEehlUrghou4AmU0SkAfATcrw/c7bmLWlSnxM4tN33hKfQL+tf+uB+RPa6H0wA3d+C84oiacDiT7fquWB+LlrttNzfeDKtXfdTMXcYIgh1voMFgJ6SFSdSPI3kc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792086060; c=relaxed/simple;
	bh=9+CUgcPyEeIWyAI2OnUyamuXHw0aGWH/EGLFFqgSAQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lE2s1n3DLrdoMGWQ4lND7Hmr8HuSCsBNF11HP2FnDAcpVEkpbBpTprVvUoOnGdl+DdZ4H8EEwGVyypqv24WCwyY3uPdTBmUEaMZ9k52YkI2zfys14kTmT3FQgp1shiQSUsxrS370DcwtOfJDeyifXfgIBO9jBXuzYbphdMO1/ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=mR6v86g/; arc=fail smtp.client-ip=52.103.43.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="mR6v86g/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sNaqdfe7iHydy3Pl2PVkxs430GD7SoqFj1MVwA/wfYL+DZHwCBX2gNcG0dgVC68qIfTgB8oH416o/h02zBFEOJnAQ4ZJXAO7qTGCLY858AFxsVVUkOv7HQ8S672rNgylvkdJVdR3aCNcAQCENqe8TCxapDzL9vbBqI+lpnAJthcNzYQJXXiW80p+VfgzzN3fUyaKdgcHzyh07QyMVQncXVqw4iSjLwbTwh/RHo+n/mN6YL9d+4ng2dcS1r9ZVSo27sqVDB7GDwash76nPOhO0ncgQ/bzQKPVWVGQnfcjcZLeXu9JGtMOe9czC9eQ95CY7ypwuUgrPiW9hW2OqCFtBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+CUgcPyEeIWyAI2OnUyamuXHw0aGWH/EGLFFqgSAQ4=;
 b=gNGdfvn3glv48skXkWjlXih8qG66bKP6mJW3DJIXLgQn2IsnrlZ/78YChwH1rcbzDJxgfahUnU46Hs8pkwTyGfB1SlpsUFDstSpFBwUtzVJLo2LShuXbX/trm8i2UGPWmfPiPDlst+8efE3FUwg18iarzqR2fyznmNzPH2cmi7ZXcYnZPV1hI5/2ET36rILtDe910kkareyet5a/K5QksAdco+tpvrPu0PZmpv6MsCcEkbIAeWLYHzGu35XHDDIsY0cVI2xgEswmEaKSUvpMDLS/Kf152QECyDfQM6r8F671277J5vlbkwZDNS1jEcquFRlOirc1RY2R+ulCC4PM9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+CUgcPyEeIWyAI2OnUyamuXHw0aGWH/EGLFFqgSAQ4=;
 b=mR6v86g/6zy1POVB6N/lpsuU7+GQctiRGf21l/rKYOnvcCnCrUyG9ArKjChMzzKP0SfEfqb2/DtucpXJ1fINp/kejJDV2sNevNQKz1KQmlM/hwrZd2N8dGOZVTXGN+MFLCJg3utDuV8TzZ6oiHl8957lorMq3LnQVwdR2cf0EUQjCOOECAgLZ6N+b4yytjCZAcSWCkJ7+HlxETvoxr7BCQ5SsAcOp9zDm6e2WIjMLoUfxzaYHdZcKYSiY7cKt0LdShJ54Tg2JPheR2U9VeEImRTbHHLnNIov/sQBNsyn7QhAKuHEkeK3UmcA099dEETLNrTBKfWrr2EKqaLTNvVqgw==
Received: from OSRPR01MB11856.jpnprd01.prod.outlook.com (2603:1096:604:234::8)
 by OS9PR01MB550196.jpnprd01.prod.outlook.com (2603:1096:604:50f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 17:40:47 +0000
Received: from OSRPR01MB11856.jpnprd01.prod.outlook.com
 ([fe80::bf03:1417:1f6:4bdd]) by OSRPR01MB11856.jpnprd01.prod.outlook.com
 ([fe80::bf03:1417:1f6:4bdd%3]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 17:40:47 +0000
From: Venkat Yadlapati <venkat.yadlapati@hotmail.com>
To: rob.clark@oss.qualcomm.com
Cc: akhilpo@oss.qualcomm.com,
	andersson@kernel.org,
	freedreno@lists.freedesktop.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	lumag@kernel.org,
	sumit.garg@kernel.org,
	venkat.yadlapati@hotmail.com
Subject: Re: Adreno 829 (SM8845) zap shader: PAS init rejected by TZ under Gunyah
Date: Thu, 15 Oct 2026 23:10:27 +0530
Message-ID:
 <OS7PR01MB11853CE810810E80B3AE708AA9F9C2@OS7PR01MB11853.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CACSVV02xGrytmrUQmtskUu8-OXm4Cq-qbqYjkrxYOZLLsVb68A@mail.gmail.com>
References: <CACSVV02xGrytmrUQmtskUu8-OXm4Cq-qbqYjkrxYOZLLsVb68A@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0P287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::10) To OS7PR01MB11853.jpnprd01.prod.outlook.com
 (2603:1096:604:248::6)
X-Microsoft-Original-Message-ID:
 <20261015174027.1970832-1-venkat.yadlapati@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11856:EE_|OS9PR01MB550196:EE_
X-MS-Office365-Filtering-Correlation-Id: 264a7f11-20e7-4f42-c390-08df2ae370e7
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|260925184616899003|19110799012|25010399006|24021099003|8022599003|15080799012|23021999003|5072599009|3071699003|2607281247196008|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WJHgogzaqaY7r6V/4WTY1pPFvZUgbEEZPhdT7LuaJFgWQ1kyxuy/KYfB7jaY?=
 =?us-ascii?Q?hLMS55xkeULcbLiCkUOlvk95l6iYMk4jN16Kgc9BcgSgKZ/jVjD8SnnpD0ad?=
 =?us-ascii?Q?REoSX1DNkY2bpd6t65xZRrWQg6DG4wlWIaU2pCOnD/G2ZXbTTROhQfeTXQCt?=
 =?us-ascii?Q?vlc5ZnofZU6mqRFJCWQZ5fZKSaTxhwz8z2pQMnLqhjEE195bASPnFD4jXPsw?=
 =?us-ascii?Q?FyyxMzeMc2w3yvre4iA0YPZHmw2O7blCSYBqviCfuGFB9WLg/6fbPvRBF9XX?=
 =?us-ascii?Q?ZB6wxOgfHPXF8f1W9FOjn1XYZkodaHmoIUBgAuhQe9JwSolVeP/G/vMMT2fj?=
 =?us-ascii?Q?JhsGwpKC90z5W/7n89zu6NPUcSifIpiJclPVIYx7v9oKh8KTbXG6i14HZ+bI?=
 =?us-ascii?Q?+BoO6RkLRZmjr2EKMRg9uiAqVckB4VDQ/vdWVUMBPGqh52OXA5iprYjEwEb4?=
 =?us-ascii?Q?s/b4g0/Wu9Bnc+6SU8Z7zE2jpqP3CzXeB40SWCm8GuvWWR4wdKy8okUx95ZF?=
 =?us-ascii?Q?SvUSlenMQgSqTNE4gwUidtmyQCh9ZNtbraET+xXLS1ZHTZnK8Fo9MkAdmP5P?=
 =?us-ascii?Q?v8oVYyW3Zf7kxevDJTndRIUcxQ9r/biwDlP16g+hO7STyXpkO7Lfas4ilOuu?=
 =?us-ascii?Q?zk0qg9Ioqg35igdHK+rFJECbXzuq1Ec6vE1QML0ouyqYIIrgdl8k0NfDc8jf?=
 =?us-ascii?Q?1Yq0yX9oqdtTc9trBmvn9CjooYsuegKRuEvNmLWHKwu/w2v6ZUIUgfmhiQWA?=
 =?us-ascii?Q?Aysy7GltfrY2YcH+2Fpx3SOY05ow1ieneVswRcYr2XxFujPbctxKYcud0bm1?=
 =?us-ascii?Q?HVZbuOZ6IOt6i1nngzF6Gq/anCPwJnpfW7KHEaGL3TpafXtHeAq2OKDR0GuW?=
 =?us-ascii?Q?a1f26Blf1mV/2EVxOpZi5QGC8DxOuOnu3rEYxZDEmTkQqyZHC2dD3OJ5Q/8I?=
 =?us-ascii?Q?csAl8GHNM/BSuk+a/8Fqng=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?db08WxRTMshig81QEt78Mmexy8hYSZl09FRpUwH6cIrUsDueTpwE8Eaxil0J?=
 =?us-ascii?Q?pLwx9BI0Ctuu7jpY4SRSz+88RnggVY+Fek6BeuDvOzRX6dKRRs3ote035Jvj?=
 =?us-ascii?Q?Pr43/Nma+3NaC2/gxnn/nbK2FooF1WsD7VS1YEFYtgcjvzSGIK//cmZRjqlC?=
 =?us-ascii?Q?Ac0jQOICBhnBzL0vZRlaWyY/FwO/akEdNm5AqGdQMaS7NaKPmKUQ4ye2EK8Y?=
 =?us-ascii?Q?HVBw4NBFBSnpjxCdHVg6gtChv9o8i8RmQZox5nCjTP1czDHLAnT/dghVSnhn?=
 =?us-ascii?Q?+NlRBfxjGbQtsNI5Doe9Ps50ixxKLD95zTB6e0XMj8H65XDschmDavsy2a7b?=
 =?us-ascii?Q?CYptwN9g3bsPjWmUIAZ55L+omDYkGHh+qssF6uRThlBmRKFjek0+oofLIomh?=
 =?us-ascii?Q?HUj7fWFyBrSWmPpaMRFbUFqmLp+TCltFrgOTRRtnwo6HpXoAA+T6SDyYbnTY?=
 =?us-ascii?Q?4TTwUpAn3aMXXNDKCxYlTwXAiyPcm4/Vx88iZehaJW00vilsy6Ub0TgIRN0m?=
 =?us-ascii?Q?ACFMZahwW949LbemXLygUIKKEcNMeLvXsBU8T+3bfKkB570d25+kgJ5+iQZE?=
 =?us-ascii?Q?wIVG8WEiUt7n3ZpTH71sFChxmdZb4qzqZdBtIeRD3B+RrFgk5XwtcVeyeV9d?=
 =?us-ascii?Q?CbnbAqPm1WCELey/qLPbxRLZttDd2pV0lSNOTJ9jTjBirjkWPrcgO6MrMIbP?=
 =?us-ascii?Q?Tj6SqDODsxRMKekcG/2I9AGx0yQJPQog1PA+OTiuPNu/zJrLCjd2RQ5qVWI3?=
 =?us-ascii?Q?PSXXlrd13LctUrHSzXVBYaeW98rHqNP4yOel4nqYdBnLq5UNk0tUG5SXaZzA?=
 =?us-ascii?Q?1s9rApXz5m6hS5vZuM0Z9GqG+83ZZIFsb7Pz2csu0j2tHaAlc6Lj1cSie+XG?=
 =?us-ascii?Q?yDEEg4CTidVoB7a/Z9vxtG4BhKqT4n09JYmR0aCAyhjb37WHBUkHQJTTnE55?=
 =?us-ascii?Q?L8CI7AK+UkeQ/sG+F2zP9OzkMiJBiMzCHblHeOAOwDsjhl+1EUZ9eI+EWLrX?=
 =?us-ascii?Q?JYisxidS0sqPxb28x1+1OsEy6Qf64PDf5YzHSlv7e/3pjK9vbpE4elU1ygjh?=
 =?us-ascii?Q?EYftDP/CSATOrrrnfoX0bQP5vYoGu4163L5ycfPA9xOLRLH+fSyzgS4NSwxx?=
 =?us-ascii?Q?jznZqagQosQ2vA01pwzvcKV1PieiSd5R19EuBhxMhXfHdGpV/M23TqgC6bYQ?=
 =?us-ascii?Q?hqtxmZ0V++Lo+zXSkSxaIwECuyG1qh2l/mJ9XCz3MzMKmohXI34H5qgmebP9?=
 =?us-ascii?Q?xKiT3OD5KvSk0e8Ps0Xsxno6YOMCZYRS4KV7ET4ytIzXE6KKD6XL1qBM/NID?=
 =?us-ascii?Q?F1BWKi45zUACNHw5oN05V81LqIBcgHCOMPMIrDgZ/hylVK08d5O+DH4wYN1X?=
 =?us-ascii?Q?dNIr7AcckM3/hzuarh3cAtL/4hdrmtxsX57mSaghUe/j7/bG5Q=3D=3D?=
X-OriginatorOrg: sct-15-20-9412-3-msonline-outlook-b83fc.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 264a7f11-20e7-4f42-c390-08df2ae370e7
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB11853.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 17:40:47.5913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB550196

Rob Clark wrote:
> + Sumit who would know more about the PAS stuff
>
> BR,
> -R

Thanks Rob.

Hi Sumit,

Some new data. 0xffcfffbb is QTEE PIL error 0x300045 (the hypervisor
log shows "pil_init_image_to_tz [300045]").

With a boot-time trace of all SMCs on the stock Android 6.12 kernel on
the same phone, Android hits the same error: PAS init for video (9) at
1.9 s returns 0xffcfffbb. IPA (15) at 2.5 s, video at 4.9 s and the GPU
zap (13) at 5.2 s then succeed, all after qseecomd has started and
registered its listeners. The ADSP loads fine without any of that, on
Android and on mainline.

On mainline, qcomtee works (QTEE 5.2.0) and I ran qtee_supplicant from
minkipc (time, TA autoload, FS, GPFS and RPMB listeners), but PAS init
for 13 still fails. qseecomd additionally registers GPT, output
protection, secure processor and interrupt listeners.

Which listener or QTEE state does PIL init depend on for these
subsystems, and is there a way to provide it from mainline?

Thanks,
Venkat
