Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11022104.outbound.protection.outlook.com [40.107.209.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390023F787E
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 21:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791496563; cv=fail; b=ooeXLCv2kF+y0hjpSRWfiREW7o/IpO4WYPr+4n3wVpzn2oHpU/FSoQcqiMtAemDv31/1uK53ALPgCDyjsHDr3H6ipM1FcDi5C/sVwPQtoA9E73Wawnh4UsJzOqRt3VNo7HrXFK8I5GRmmMiJDvNYR/jh/kJXudxWRxnyVT4MEN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791496563; c=relaxed/simple;
	bh=ZrBIXLXuXgIh1QwqaEwa7SwwYNbHUW1rePiU3L1kH10=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=TvXZlCT//kuCA1v3ALn6a/jQx3EPhgO8w/VtJVO3mpd0J/D92jCkH6Yna7IPbx5FMxGfA+VYXRsJC3ttja9CTt3oNJErmzv6uyvK1rKrb7NcOvLeWVeBGRaoRs4PqQ1O8CBEP9ICo3KE7pkvt2sn8cAz9/Anzydlu2NrbpDjNWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelburch.net; spf=pass smtp.mailfrom=trailworks.io; dkim=pass (2048-bit key) header.d=michaelburch.net header.i=@michaelburch.net header.b=WotlU1/y; arc=fail smtp.client-ip=40.107.209.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelburch.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailworks.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=michaelburch.net header.i=@michaelburch.net header.b="WotlU1/y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n40eHtPsxWYvkiNylzqF82I3OISKHf0Xvwd/Zh/sE27212MQ5fM0eQJWYDqVyEIImRWQVIZQENJ7JryUH+sBBeDTErYCj9GutCoZKIzCDXbMZiI4c60ozJ1RS9UiLqvjeFfeMOqU7+j4FTxvlRKVvBQfMv1HD95fRy/jyVK10SMaZ3KuHllgUwTZfRkpgimDgufNBsJ6bPc0lnhAHsxrDF60v9MiWBEEzhpDKvSTfZh5dYPu94xKm+3BwLbrYLl3oyT4mCvI90ZExyIco1vgTe+K5dxeD76nxmisvYilGB1l1ddZb5q2qqZx2RdDQckjhzalnjJEQCCWO1h1mXtlRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWPpKpxEXAcxlHyUaUjQ8GQW+5E9uxQVkBc+2CxhQ60=;
 b=hpKwMnLVlYFNEy979/nBUzxMlQfiPkDUGIHEaXhQCXVtQTLx2jCep1VX7eKwbkx/UZIqnLYST3dZMsERXNPsFy79B7lntAdqdWmcYD/9ou8ejNpiuu2Lc6ZtbGpHjIr+wPz7utLiipnPOnOtCXS8UyANVyU92MJ/bK1/BBwnmV/N1fePFMoZ6cz3g4RD0NAHGuufEQjqjqNl5kbMISrtSNcvTMY+6u8IN08ZHvBIi2bcFEFTjSU/ieTX/Y6pZrTRlfouo2eRLUN1ESxREuLXfR+Ga3u2/3LLgMSrtgatpoGmD2DjPVvM6Qe7UCBg9Tb0AQnnyvRZXIGN2D0c+kZw6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=trailworks.io; dmarc=pass action=none
 header.from=michaelburch.net; dkim=pass header.d=michaelburch.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=michaelburch.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWPpKpxEXAcxlHyUaUjQ8GQW+5E9uxQVkBc+2CxhQ60=;
 b=WotlU1/yGnAAZkXXsqRGU1iaY63VJg3FiVxKqRAV27XY5xVR48VD0IswFh59xVJyox9qd8ywwSJRwNpqIJR0687AZuFROaNGTesjK/WVfh/Gz2DpXYcyU22+bDAx5Q1dqyG6/wQiXKOG1t+c0BIYg7EtqHKVy5H2M7qHI5RkkHCnfdJJZ89JKbiD0F1szQmZ62L1YWkW7JeOqG9U3WnpQDHxnk4BnOPJP7oWDaxyiUcQNtu8r8XN81UIOoLyZyd9vYFMZtvQtD9YPANRDyI9W8s+m+2GRlSlvibAqSzQn21BcbtXlbkvx7c7tunl1x/khKnr9dcfHYvyYd1iVzOCgg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=michaelburch.net;
Received: from PH7PR01MB8123.prod.exchangelabs.com (2603:10b6:510:2a4::19) by
 SJ2PR01MB8346.prod.exchangelabs.com (2603:10b6:a03:547::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.17; Thu, 8 Oct 2026 21:55:59 +0000
Received: from PH7PR01MB8123.prod.exchangelabs.com
 ([fe80::da98:a31d:73b6:7930]) by PH7PR01MB8123.prod.exchangelabs.com
 ([fe80::da98:a31d:73b6:7930%5]) with mapi id 15.21.0472.016; Thu, 8 Oct 2026
 21:55:59 +0000
From: Michael Burch <me@michaelburch.net>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: x1e80100: no AOSD/CXSD in suspend with APPS votes at zero - which vote is left?
Date: Thu,  8 Oct 2026 16:55:40 -0500
Message-ID: <20261008215540.15933-1-me@michaelburch.net>
X-Mailer: git-send-email 2.56.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0206.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::31) To PH7PR01MB8123.prod.exchangelabs.com
 (2603:10b6:510:2a4::19)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR01MB8123:EE_|SJ2PR01MB8346:EE_
X-MS-Office365-Filtering-Correlation-Id: 326ee56f-db2c-443e-8cd1-08df2586efac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	sKzONbKGpcrEE7WC5mIoGoQqmP55Q1BUJkROglud+tlUFsmdSAjxvcyIsY1nraEYS49fHR8xTKp2lTo79NurMHbtERhf8uR3rkE7jAB22Iw4AnsWTGeJPLPbkJ0Wisc8avIfuw5aGSaYsdMOZMJtj2ZonnFgdJZnodyCcW6Qx6z9fP9DNIfHR7BAuGRt7FtkqB5NCsLRxmyqV3yqP+IcjYUecDYtNWrk5DsYxpECIBF8RneHS6ZDPy+sl8tKPpHrMCDDasYXOT8+8PV2VQV2Tym9qzBcNIyfS21RZvNRYUYVd7lNI9LW/E1+6uLagi0uQcakSg53FdLhcA/PXH5TvawJve0kdc0KCGWC9eV5L9rEU9G9gjMfeoAlS4CyK7eJc2gg523A676F7Xo2NhyKjK6i01+W5wOITz1GZeHF1id0WLqWz2zNfSnldEIDT4AUOoc+Csob2FTXf/CaBh7Yzh9txGOMmO/H6767O9K4VP37SO47BR715C9BtqZ01ihN75WESTAjs8iukmr2oyKi5JFLwvJu4dpRaQ4hHbwYrBiIs+jrZrY24ZU8SkbANmed/AYyc3jpDcXcoSVUdoDOPzJzmnZKMTA+/OsASKwQQ1o9SyHR35Nb1P/xtAkWQWH7GsdwjGVlTZ5Dbo6eb4q7xQOK9NQstFWPhK6QY8giqo4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR01MB8123.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ir8g6uQp1Fd5WYadJFdV/m+DLYapWJVxff6MtL3ATWFH/IYoGyTXhPD3UyHX?=
 =?us-ascii?Q?5eCVi0Y3hZxgJNRnFSOwk5TLTWK7ykj65XSERo/N035DOlQ6ZccfBhv1JHDu?=
 =?us-ascii?Q?sXWZVEsAcIJrMjX3gsjENWtVc+4fADLxwBz1rNkbIhLuiojbwI4Bv5zsKNZQ?=
 =?us-ascii?Q?YvEgaDs9RGIyz3e6LdAAycd+G0+zgDuoTxV2n/R+l08TtPowtJOWe6IYwQvX?=
 =?us-ascii?Q?ovEVLjOrj1WpvMShuQWYHY1+KQxSHTNklJ6tJLNPQuiv4AkPeQ9ypI2Oh5QU?=
 =?us-ascii?Q?EMXIfY3SxWOlMivTErjrlWB27Ra/e6CGEyIQBh1fFIMtfoqeUW9c93blTKXW?=
 =?us-ascii?Q?BMEWPi9Z3fDmBgLHnL/d9z7YWw8ecisg62JN85+GY8/1PlMoIQIQAcfNe5Pw?=
 =?us-ascii?Q?xdTx6eDgjtEL9Iagoao3IoEOqt3irka84Asa2Ng0L8d3nDfEXab89+Qjx9UT?=
 =?us-ascii?Q?lbzK4EdStKbEACAbsSUq5/joonfZ69Lbwfa0jbeef6ClnAtsf5R4srFppnaC?=
 =?us-ascii?Q?RMHJKh792mVCJtTQLtVWe3twJ3foDYcZi2soFtuzYG9BcO0+2g4RCVVl5mAS?=
 =?us-ascii?Q?vg6nmQeEG6S5gmUM98pWg/09tYQtPxpFRlxli6j6JU7qJdmI0zZqP62i5MvO?=
 =?us-ascii?Q?mKNp9yD0uxDwN8cAEuoIs0yHuvTg8bZSKUmwSSylUDMvu21jSw5uvlVDL8Vr?=
 =?us-ascii?Q?MotWK3g6RfwGhzOczOpjfY/nmBuztuC8rX2m6MQetjpNcyrLiey4o/qTCekx?=
 =?us-ascii?Q?30FuCg8/6Hokg3bRz+zv/jkJOnw3PEQ/s2dxCNS7RqFE60AMP/amcaEb8loZ?=
 =?us-ascii?Q?wEA+gEIzX5GUgZNQl1l5TpvD6K0g6mGYoi2WdhK4+py/0tW4uobVtt+3nL8M?=
 =?us-ascii?Q?8iMLKHk62bDraOuimfvWy0Hh+5hyEarCMBWqtFaubcK01ztkUT0cbqqnrNEb?=
 =?us-ascii?Q?9KP+76TlXD5DGdFKVkaacy0XbyKA7J4En3vkQGnVNiSrK6AE4I38VOyfMnBO?=
 =?us-ascii?Q?uRsKVpVXuQt2jBy8s2Vlml+YhV7fEPQ3EtdCA6MxZBkpfYoUeGlOSJvaQaY8?=
 =?us-ascii?Q?a0TGok9s8Vri5Sp6MsPoAYTDAonX0ApA3aIrIdFxiPVT3lyhEh5HBOqa5KD5?=
 =?us-ascii?Q?XBH+SCDdBPdZ+D7RL3LUMFmuOEoifsTHwCxq1e7gD+XsZw0SZL7yEAAsLVEU?=
 =?us-ascii?Q?z0EyADWSv7IdRWzCkTaVQajcY9XeTInW/Tq4mCkdkehtVYiqR0Wxr3FEsRS/?=
 =?us-ascii?Q?QCqY3agDpY7Yv5J2KOl5CXF6CDZfNm4sWhy0bcTekGItRUBKiIjFf0+YDjcR?=
 =?us-ascii?Q?lL+rSsk8Wl4RL8bwzIGLugkcKubrN7CjaeKnLWlSGCa4S0mEKADK+dptk6jT?=
 =?us-ascii?Q?V348PIT/Ndsvviuj5pNiKKNo+YOMOg7vfXM06mWiiLLcgrZARYO5A9mm65n0?=
 =?us-ascii?Q?TVfZz4E5f4EJlU+VdyhGgu5PbSNgZj0GqHvH4Wzr21Jzh/Xt+hTWgpJE79EE?=
 =?us-ascii?Q?3aSoJjUJDzQhpgE2Dv8HdNEKbnbvVy9QyqWrOgd4JmS15LeUYFrS9Y+PCLzS?=
 =?us-ascii?Q?/SAsxqy2KB+d4sC5graEguOd6/G6URlm6X0h2qDjpqDyq5DvLh6i3vSjHA47?=
 =?us-ascii?Q?CvCTECIKVMR4KvdZElh4DmsmXKbJHBS4I/sySSr/s5AgOmVh0dbNwNWX7cTm?=
 =?us-ascii?Q?cX8ObSayDcn3kyqL9e00cHqFMWZ5EQCA+/o2OqFOc78MFSINpRUl0jkdK5U9?=
 =?us-ascii?Q?QTvg/0w3+Q=3D=3D?=
X-OriginatorOrg: michaelburch.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 326ee56f-db2c-443e-8cd1-08df2586efac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR01MB8123.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 21:55:58.9554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8256b244-08e6-4df2-b146-877069d9ce10
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YO54uCc8VYuC4xXSno4JjWRSKN5/UI1zU/p+bnGk7vsMTXDnuoTeh6av/yIlkPi+VgIiBqztkmPFJIEGgvcBaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR01MB8346

Hi Maulik, Abel, Pankaj,

On a Dell XPS 13 9345 (X1E80100) I cannot get AOSD/CXSD in system
suspend. APSS collapses, but DDR never enters self-refresh and
qcom_stats aosd/cxsd stay at 0. Standby is 0.43 W; Windows on the same
machine and firmware flash reaches 159 mW with 99% hardware residency.

As far as I can tell APPS holds no vote in sleep, so I think the
remaining vote is outside what Linux can see. I would appreciate help
identifying it. Below is what I have eliminated, either by readback or
by a deep suspend that still gave aosd/cxsd = 0.

Setup
  BIOS 2.14.0 (TZ.XF.5.28.1-00029), Linux at EL1 under Gunyah
  v7.3-rc6 + Hans de Goede's qcom-laptops 7.3 + local fixes
  domain-sleep-0 (0x0200c354) and PDC pass-through as in rc6
  ADSP.HT.5.9-00810-HAMOA-1, CDSP.HT.2.9.c1-00046-HAMOA-1
  mem_sleep = deep (PSCI SYSTEM_SUSPEND)

During suspend
  apss         +1 entry, residency ~ suspend time
  aosd, cxsd   0
  ddr_stats    0 in every LPM entry; mostly 200 MHz, some 547 MHz
  lpm_mon cxpc (sampled mid-suspend, DRV 3-21): DRV5 and DRV21;
               DRV21 only once the ADSP is quieted (below)
  lpm_mon rbsc: all subsystem RSCs asleep

Eliminated
  - APPS RSC (DRV2): tracing the last flush before SYSTEM_SUSPEND,
    every BCM sleep vote is written as 0 and every BCM's last active
    vote is 0. ARC/VRM sleep votes also reach 0 once a test module
    forces xo.lvl and six LDOs left on by boot firmware (l8b, l1c,
    l2c, l1i, l2i, ldof1), which Linux does not vote, to off.
  - sync_state: crypto@1dfa000 disabled, Akhil's GMU sync-state RFT
    applied; GCC, GPUCC and all interconnect providers are synced.
  - PCIe: NVMe goes to D3 (broken_l1ss_resume); both controllers reach
    pci->suspended and icc_disable() their paths in suspend_noirq. The
    Wi-Fi RC (WCN7850, ath12k) logs "Timeout waiting for L2 entry!
    LTSSM: 0x11" on every suspend, but is still stopped and
    deinitialised. I have no clean result with ath12k unloaded (that
    hung on 7.3-rc2).
  - CDSP: never booted (disabled in DT).
  - ADSP: sending the MODERN_STANDBY_STATE message that Windows sends on
    APPS_ADSP_PWR_LMTS_GLINK_PORT cuts ADSP wakeups from ~95/s to
    ~0.24/s and removes DRV5 from cxpc. With a power-only sensors
    registry it has 0 DSPPM clients. Island is never entered.
  - CoreSight: all coresight modules blacklisted, qdss prepare count 0.
  - USB-C retimer refclks released with no partner; XO buffers
    clka6/clka7 read 0 for HLOS.
  - ADSP, LDO/XO and retimer items above, together.
  - Entry path: s2idle instead of deep, with APSS collapsing (below).

Questions
  1. What is DRV21 on Hamoa? I believe it is DDR_AUX, i.e. a result of
     DDR being held rather than the holder. Is that right?
  2. Which voter is left: TZ, Gunyah, a DSP, something else? Is there
     a way from HLOS to see per-DRV BCM/ARC votes? The AOSS ARC
     registers and the drv-1 RSC window abort from EL1.
  3. Has anyone seen aosd/cxsd > 0 on X1E80100 with mainline, on the
     CRD or a laptop? With which DSP firmware?
  4. Windows ships ADSP -00826 and CDSP -00078. Is the linux-firmware
     pair (-00810/-00046) expected to reach CX collapse?

Separately: stock s2idle never collapses APSS here. tick_freeze()
disables CNTV, and APSS collapses only if CNTV is armed. With a test
cpu_pm notifier arming it, APSS collapses and firmware writes the APPS
RSC wake time; aosd/cxsd still stay 0. Is this known?

Traces and logs available on request.

Thanks,
Michael Burch
