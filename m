Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11022125.outbound.protection.outlook.com [40.93.195.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143CF348C4C
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 01:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791855493; cv=fail; b=aEGUKaTP9YVm4G8HGHkcFYIa21PLbvwLP0rTWITDF06uXi37eXVwurU/HzmkATYruMInvRHeQhsukAAXLGhUXXjshRZhZbkq1tE0xGgCtzBDXipZerVxC+3ciU3jvpyVFeTZ4nhm1qRzUJivHEfqaLMSGmUMj2HzSy9fsc7rSas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791855493; c=relaxed/simple;
	bh=1JC2Qy5RVnQ7ZW4At/N2OYlGikH7f+4mvzFzIS4a7ks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fPTi3CJNZhkkkMg+NW6AM8YXGg3U5l55QEN0nF1td6tNNEXgFoZXMlf3Nyzs1PEgBLK0VujO6DEbL25+2InT7uOaWzBxa9ns1Pj41zRy9KaVse4upLrve8s95aghNvrZvx/sbNlgQIVNJ9DUEmblrkbsJ9J1QELFMZORzYHLoAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelburch.net; spf=pass smtp.mailfrom=trailworks.io; dkim=pass (2048-bit key) header.d=michaelburch.net header.i=@michaelburch.net header.b=SQeode1S; arc=fail smtp.client-ip=40.93.195.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelburch.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailworks.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=michaelburch.net header.i=@michaelburch.net header.b="SQeode1S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQUZIR+OZjjuHJPG2CfVCR7X+PY8Kg1bSj4FCR3mlj9WwoeglRE/TgNXbLaHghN0IMzDH+YcKXDP8Vynq9KQiEoM68R6T+mxvOny3RL1LqMqRtGqUiYDFizRNsEcNLJY/qPYXvaQRCwe8Uj9rbBDxdBuJHxovzlNnmuU3xvHo8n7TPsUr9HZlgqCNwa5Zq8G0JrkOkadBSxe7fmLbzQF/ddDtHDB+k8S6cY2VcltRjK+fhgtmVJwil3puaShF85ZmWjxbYgqwC8Tj1/kB6s1accB7JWTm53YCyIzjZvWDUZ0sjQnyJq1xVDjVfMA1SsZV/Kyf82MV+7XvBvQJ3rIrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5GrYGiqcWZZctt+GsKixW/ig/I/KGzPAiDq3JiMD64c=;
 b=HArrZDOzrQRUSIFo3FWyNXfFDIOCPcQ1QoRStVfy9RkV/qAbccK3APNNDxUsmRi2Cd6WpsGe40Wrixvi4bPwUxVk6DkmYg63OnhKMV/LVbR+yf/b9GKenVv9XrUDyKBka7c+luAdORmgi56wC/CsAkEK5isdDNAR+JbzCvU9znhOWkGD17ODdhRsnncuf4sp7cfI+/IZqBCQModAhKPasuCgCx2PODxeDgrxK201DSCI7mk+U5axcshJ9pABiMotCZOlk0DmkTWsiyFiToUcfQQl910NtCufirUigXaio4zybAOhwfU7DMIrwE603aKi7TCN60gqzXu0bkdAj7xC6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=trailworks.io; dmarc=pass action=none
 header.from=michaelburch.net; dkim=pass header.d=michaelburch.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=michaelburch.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GrYGiqcWZZctt+GsKixW/ig/I/KGzPAiDq3JiMD64c=;
 b=SQeode1SFB43ThoaRTIGyP1jotdHtRDV4HbBGfsPfAiVlj78q3hJoAijPDKP3ySGzAke+SqvLmusNv4v8T7PrQKcVbCxVZSHT2qAGFXODDkOdVxxA1fOn/N5Jd4qglP7MjGbygIc23lBW7BlsRt1Nw8RvOyNJkFMRf/DXv0xL4oX8jtCMK643WbZbwvA4FTvXCpmsEr0amGYIxSzB35MKfFKxnVFxkDJXkEySjxVkdHSiwP6sMG5otzSrZzVx9AT4jin+ZsJS8iLE86T/BBQYZ0j4NVWe6afC7k5NP00SBggVvz/PURziEK/30PWJz8sxcljx91stohwJoTnK/0mLw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=michaelburch.net;
Received: from PH7PR01MB8123.prod.exchangelabs.com (2603:10b6:510:2a4::19) by
 PH8PR01MB999727.prod.exchangelabs.com (2603:10b6:510:432::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.23; Tue, 13 Oct 2026 01:38:08 +0000
Received: from PH7PR01MB8123.prod.exchangelabs.com
 ([fe80::da98:a31d:73b6:7930]) by PH7PR01MB8123.prod.exchangelabs.com
 ([fe80::da98:a31d:73b6:7930%5]) with mapi id 15.21.0496.015; Tue, 13 Oct 2026
 01:38:08 +0000
From: Michael Burch <me@michaelburch.net>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: x1e80100: no AOSD/CXSD in suspend with APPS votes at zero - which vote is left?
Date: Mon, 12 Oct 2026 20:37:50 -0500
Message-ID: <20261013013758.26524-1-me@michaelburch.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261012223958.17440-1-me@michaelburch.net>
References: <20261008215540.15933-1-me@michaelburch.net> <9e3588eb-77c8-4cca-8548-3ee4f58b1f67@oss.qualcomm.com> <20261012163000.20000-1-me@michaelburch.net> <20261012223958.17440-1-me@michaelburch.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0003.namprd11.prod.outlook.com
 (2603:10b6:806:d3::8) To PH7PR01MB8123.prod.exchangelabs.com
 (2603:10b6:510:2a4::19)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR01MB8123:EE_|PH8PR01MB999727:EE_
X-MS-Office365-Filtering-Correlation-Id: 49b3fe09-dd61-4dfe-f652-08df28caa236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|5023799004|56012099006|4143699003|10067099003|18002099003|18092099006|22082099003|8126099003;
X-Microsoft-Antispam-Message-Info:
	thuGGxiAIeYEikzecunLE4yP2+BcobYiQXAD8jgtSRGCJLONwVPNPOpYvjShsvz2p2PtIKW0wmqLKZzQtySfKmm1NfXov7EnH6p7EqyklRElDjoUO4nxSaL7J63YoHRUY5HFAOrwuVNW643HO74l92C1DNaM9+6IrnN9CXnckUXcnlEbuPLbos87A0CosiZGCPk3ZIg34m9ggSPii0cwtopu85h67bp6+hxrZN2NeqPoquT/fJbTSmG0VT0foUHA8KPrPuQKyJVjt5+gAHLeUuDaL3zqL/z4kAYyZi3WTA0WMwxCuMa5KtJOS4AobOHkyWW2gQ3+ONJ9B0/etxw1DfoPFiwUabvGB/lGL6I7vOj30h26W1uNsf2fChnMhvVVjWR0G3T53m0nDVYrbmLaS/SNu4RMCnq1xXYBHS5Q+k3RJI1hWftq0dwBx+3Iuh17oOiTjXMoWVG0quW5k0k7i5a4xwu/Ezz/HQ0ID38iDEwOpA1nRCvLEEX6KZv8Z2sIhG2GUUtd4z07s4Kt9WRVLLsnt5bWn5ima3YPeedsbAYeD7W8B1P7QmJkHY3vtdjffmRe5CNF0b6+OBIzcfy48ZCPVtM42itsk6vp8iwasvbxtWfUixodSsP0/EI1B6+pRaClIDOzDs9Pvy0VqksSaxD1PURBpwDv2eh2ccKkNU0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR01MB8123.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(5023799004)(56012099006)(4143699003)(10067099003)(18002099003)(18092099006)(22082099003)(8126099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?065fJHPAdum46aViJTFJynt6INVaTU1xGbm+brlrayYfNCowEGBQVIiTmW4L?=
 =?us-ascii?Q?mlo+s43Rny3Gxeb+frJ+BoeGfisimYkhcSdo84uLRtFcAKEyDby8rwdsQA3d?=
 =?us-ascii?Q?nD1juzIfLFmmAr5CGiVo3EExFdKkTKj1YbB+H2oMQmFGeFn192SH9fixvfVm?=
 =?us-ascii?Q?8pEfyj+rPBNkzVqumCf4L7Oh/04w3aHXmuRzxYs2tf7vDU5bpi6QpKNbYwct?=
 =?us-ascii?Q?p8LNsRik0HRzYGitp2rh4++PYQpLNyC8pg27p/jRbW07KgtZHgepdxi6Pjk5?=
 =?us-ascii?Q?G9IUj1DaxLjd5vf5J0gggeX9B+jH8ZIObR39+UDHVkBpJPhovh5kCImruFVA?=
 =?us-ascii?Q?Dd29u8KblwTsvKL2bqB7yjWwuPmwAv5NJqfHQaIy1k7U932v+uqwCjXklazF?=
 =?us-ascii?Q?N8hZ/hk/+kjMX5D2xA5eQvBc5AUQ9SmB6h8h//h4gijK8R7K9jBzdD51qI4x?=
 =?us-ascii?Q?Bd7OLnQQYbOEtLry8Dss9ho1DwqWalZi8LHARaEdsdvlqUiWiyjFS18bpIhy?=
 =?us-ascii?Q?ibNVHtm5GQO0xUvl5Bti9HfEQDYE+/M9weNina/3befTGsxRwocT07kBN7za?=
 =?us-ascii?Q?lsr8t20CUABizrvnhpinswstiRZYX3EvdVZO/phtmA0voDzsWwHVadjmEekz?=
 =?us-ascii?Q?oj7XxN5oohV4OBMN6IIBBlXCOs2O7QoaUtRNCCHi2RykPdywZgNDgUYbTvZ3?=
 =?us-ascii?Q?nbpBw1MuTDTj7uCkkWNtOBU9ULw+ShnXO4xxfxMkl2Hi+zK+JVx6Su42n+Oc?=
 =?us-ascii?Q?6l0gSfvswJ/txQub8imiKQyFmFsZv8F+gC08WwPYmsGGaFZN4wLtZyEy94or?=
 =?us-ascii?Q?NHsv1gR3byKG/MzkGj5ftzThK3pIus0xzjKPZsHYm2zpxe6DFoRhNqW7sdgo?=
 =?us-ascii?Q?t5+2ZlCqv9bsQbqhvcU+HKvYwHTx33l9OYwjcxNB6R+vqTsuFHIZMeM9hlKr?=
 =?us-ascii?Q?AWWT/k2TjC7rybmmeC0B8dW+Jz+wRhItambKEL2lYTgtK0VqeXrl/UR1sK4y?=
 =?us-ascii?Q?0/SRyqsuaKqG0W18jmg59NP0GvN+PaZiTtYqiEzNmeQemyxAk/SMbjpL5p4A?=
 =?us-ascii?Q?a0QxcPw4XeZ2sTWtOtumP6DUsTl5SqzMsFYZEF9xVdUx3TTBcAe5bpDI1QRK?=
 =?us-ascii?Q?IWQqxDFcU5uqcO93mqAJY6mbG64BFX8DWKMgv1Sw+XynBAlOrUvZIVak2Fol?=
 =?us-ascii?Q?TtOfuu0u95saN4mx+qn7lS0TxMnSTQE2Iw5KVkejhbRoKdiCDKmnDPh5Qjoa?=
 =?us-ascii?Q?PwpMUHk575B1DE1gP16GnJTFLvgZoToPEr9ce1H8Zn6YGvxzf3A4f5DHD35E?=
 =?us-ascii?Q?cvAsGQNgdHbYlE7SEiq95/OLwqZlfBV5XQ2f1CFuUFePXy8vKSUG/J6YmNuN?=
 =?us-ascii?Q?KhQtw0aeUGJQc+V5orPiub5ZwXXePHGOsGNYXS+Hb/ZblhHcWSB+ZvuViXff?=
 =?us-ascii?Q?107FKPQlZMTiO3sYq35cE9Frk12ogMi4qUBc8K/yWeFujBLW9VlIQsvdum/L?=
 =?us-ascii?Q?9iRwaVBG8/OAs+/iddhh/0x1dhsRi6hTdMBmm4jWYs6YRKbvFuTVOC5cZHzk?=
 =?us-ascii?Q?t4Ik17e4umMIxWHpOGOsV3ZMeOEPrpM2P2Z68Ue5qcAjzqdj2T15WmNm29+T?=
 =?us-ascii?Q?IMJXCNG3cBHv5egXaLfS3hn21i5oPuCV5UR2sxz15DphcetNJDFGZrhHjr0H?=
 =?us-ascii?Q?vHn1n3+jmYReaWQiTiN80VoUawYE+2oHpnIENcBw40H0QJp/TEHmA1abQ2Ec?=
 =?us-ascii?Q?U1krl7COJA=3D=3D?=
X-OriginatorOrg: michaelburch.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b3fe09-dd61-4dfe-f652-08df28caa236
X-MS-Exchange-CrossTenant-AuthSource: PH7PR01MB8123.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 01:38:08.1696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8256b244-08e6-4df2-b146-877069d9ce10
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AEfu7CJosG2S6wte++S1tcjMyO3deAW1V9tReCFHdb3pSveRz0LQgta7BItsyRKRIbMZka10R4F7/5Af2YYYMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR01MB999727

Found that regulator votes were left too.
rpmh-regulator sends active-only requests, so rpmh_flush() skips them
and the active value stays in force while APPS sleeps. I
removed those step by step, and AOSD/CXSD still stay at 0.

Each step is one ~65 s deep suspend on the same boot, with the final
flush before machine_suspend checked via rpmh dyndbg. aosd/cxsd and
every DDR LPM entry stayed 0 after each step:

  1. Baseline: BCM and ARC sleep votes 0 except xo.lvl 3. 20 VRMs
     enabled in HPM/PWM: USB SS/HS and PCIe PHY, eUSB2 repeater and
     QREF LDOs, the always-on l12b/l15b, and their parents.
  2. dwc3 power/wakeup disabled on all three controllers: dwc3 then
     powers the PHYs down and 16 of those LDOs drop, the PCIe ones
     included. Left on: l12b, l15b, smpc4, smpj5.
  3. + xo.lvl sleep vote 0 and the six boot-firmware LDOs off.
  4. + sleep-set mode RET/LPM on every rail that stays powered. This
     includes smpi1/smpi2, which Linux never enables but votes into
     PWM, because the DT sets regulator-initial-mode HPM everywhere.
  5. + l12b and l15b off.

After step 5, the APPS sleep set has all BCMs at 0, all ARCs at 0
(xo.lvl included), no regulator enabled except smpc4/smpj5, and every
mode at its lowest. When I last sampled lpm_mon cxpc in suspend with
the ADSP quieted, DRV21 was the only DRV set.

I also traced the Windows PEP's QMP client (its WPP log) over two
Modern Standby cycles that reached DRIPS. It sends four messages at
boot (qdss clock, adsp/cdsp load_state, gpu acd) and nothing around
standby, so I don't think a missing AOP message is the difference.

Questions:
  1. What does DRV21 (DDR_AUX?) wait for before releasing CX, and
     which DRVs can keep ddr.lvl up when APPS votes nothing?
  2. Could someone with access to the AOSS per-DRV vote tables check
     a Hamoa in this state? From EL1 those registers abort.


Michael
