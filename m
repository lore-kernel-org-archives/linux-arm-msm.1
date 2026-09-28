Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FF92931E9
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 10:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591562; cv=none; b=XZesBtneuLR48kW1jvz6uVD5R4jkGIEGhPO2vq/hHHSJCs0DlanMWzN2A3uMOf+7hFmmn/brNww3D9UY8TGQK+GB1OnQsRMBGrHuBB5HcWzJlReRGs6lhkclLnm7y/BT5rS3vQfbduEugc0czg3unK3yWRXKznjXbE7KQkTjrfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591562; c=relaxed/simple;
	bh=armPerPDEuCiYMBFxS8ifFGR3dsE4GIeKySBG01cE2Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ap9sY+/TLaOJIs85vrlx3ZWpE3CMHVPC1PSyaXG9KnsljDS3hEBLSM2XqHNan0fqK3/z6P/aWvWGbPskfQhq85wkw66HQE2Mr5fmP3R95aYLdsHRU3/FQ8oiFTr6itwINcFmU8nF62xpdhNFxcTZq4oGSx/F2n2tH9X0Ig1BGLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n9RfLYUv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K1sBf4IL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n9RfLYUv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K1sBf4IL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9M4ii805454
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 10:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PVGGMV8fJ58jlO8Q9RDWAm
	kLzOI+S9ojRygO484xoKw=; b=n9RfLYUvDeM9kgaa5elRVCfZNAb+jQhAuOyXHT
	RiTtJNbf+wV8vgwRWx7TLocPODqtNI05GKsp/gPjHbBSrQ2i9d5OuAdqMakRcbFj
	iGrQjJKO2h4jA63ob9zQwQVFRQSdmKA1Bd9gCgYrEe3VYWRgRCanqpmxG+Uvs5A+
	Ftib/uyM2njihzwrq/CldpsolTBfxtIQRPEiOIjSI5b56rJZWVNR4VaVx16eVpBQ
	HC+qPGYDjCFQej9z0grB+fv1WlAYiS02oeuSIGzWAbnPtS/LRjzIMBgmkqndiHFk
	qCJ1RtPkBaBDNLWBCBPmLxNTxVYqriyFzy8UBfAb0McvIM5A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyk5mrvaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 10:32:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39512608fb1so4769625a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 03:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790591558; x=1791196358; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PVGGMV8fJ58jlO8Q9RDWAmkLzOI+S9ojRygO484xoKw=;
        b=K1sBf4ILoVcgzFAcXodTl+8RP6StU9/3iVqvMbVpGzZFvzyyCDONtjv8/Wx/jaCEUW
         5U6noMffMW25MtofrqmTHbiyaUGbgXRKJc6qh4F1vyV29oUGwmJb8QmpfgZNDdlhMDlv
         q3bWoY6udkVm0vluZG0dWtKbYXdF8zI7OOVbURzjgJhmuC9Jt8q29fQmx/tmJZIteDSN
         UT3HnY9SZR3LC38ABHN2Q/XkVh5Dn0dNXXUvNB24PR1R0XqmcVlNAddMis8/ksZGiDqn
         IyP6beiBoGw1Q7bfaOSnhPnOY2aOu4etmsxEJFXCl9kUB8sG2Gw/ZdQl2ut+89ORv9Td
         /yhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790591558; x=1791196358;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PVGGMV8fJ58jlO8Q9RDWAmkLzOI+S9ojRygO484xoKw=;
        b=U1CfcAnXVdTi69NE71ksar94O4VKBLODcBWw3euWzXwVf5rAOfqq62l7ZCZXFWgx+f
         iIZMKOCh5ddzZN0Sajn3H5zCVC44Y79XkGyRaI5clZVMOlW/hjiZvxYC/DhVQbkv18q6
         MMeqXRLzhI7y1S9D8VV1eqiQ0+T9Qz3DCVt+cOHpEinVNml0iNrdZRhj5TUC76sV+a4t
         +AN0B1cE4vwnQa9nf65hCu8trnJJTrenXIHBf4fRQo8RawhLQToblfjkF9sMGUO9Spgc
         CzXBPEqRZKui95QJzNrppJe8OQB4cusT8hRpfS8ss273tq0/zyaSHi6EpGQ8LDvIVWD0
         +XRw==
X-Forwarded-Encrypted: i=1; AKwUvByxI34+8tCHvFNXFj47WEO90wU9o2vij5ReGPC8AC8wP2iNElQeoGqlG8P8W82gpUyiScfMnKh8PbCL3HnA@vger.kernel.org
X-Gm-Message-State: AFq9FYK2DiYfWy1FUECxw3133NZuTG2j0CWMOgzsIve/KcbnS07nOTx9
	QVEpQtFPc66/DJJdA8FtrnC7UbXa6o/sf6mIlQr/2cOrpGBMN+KRrFNrvDzjmF4tOrHhVSLY9wY
	k4mMzsDU8xvZ+a20H8/lQxQUXDLEcsFbUBYTpVgJepNK7Sdc1LRaZ86iLQwW5pCvCfQgNAkSlOp
	+d
X-Gm-Gg: AYBFou0wM9Z8Gy8w3R7BF+ISbz6bcLMA7ATXfDh1ItwzZguYdbCm0spMgn/K9jAshjL
	Vt7LVHX2SpGhvR83suzNggZ0A+yCSoQzUW8vvB7F5iTm+y6EZoiP6lXduSMAvyeCC/VL6vEZEpH
	gIAGQ+NwF+w53RLGwNA0HHpsXf8g5Bd89JTcd5fPXsFQWUG8qyi1CS3XdibjX3Tx24bG48Nv3XR
	lILB9uThjtRf5ThH+NnOqYPtXwh1iDvZm5mcR3p6FDlnRHiR/toWu9lL18cYqsdDHndk+EFhSd/
	6Poj7obGgQOFtZeCzfwrWXAO5ZBwXXCqc3+SgDsHurq3xonctu240d8MIcEpePBWMIsw59wQ//b
	JkrhszR2tTwNe+6dwaT8nT1/yKAE=
X-Received: by 2002:a17:90b:3d92:b0:3a0:f2bb:53b8 with SMTP id 98e67ed59e1d1-3a0f2bb5716mr3854127a91.62.1790591557864;
        Mon, 28 Sep 2026 03:32:37 -0700 (PDT)
X-Received: by 2002:a17:90b:3d92:b0:3a0:f2bb:53b8 with SMTP id 98e67ed59e1d1-3a0f2bb5716mr3854110a91.62.1790591557320;
        Mon, 28 Sep 2026 03:32:37 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efaeb3sm19885131a91.2.2026.09.28.03.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:32:37 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: [PATCH 0/5] ASoC: codecs: lpass-macro: manage clocks in runtime PM
Date: Mon, 28 Sep 2026 16:02:18 +0530
Message-Id: <20260928-xo-sd-runtimepm-v1-final-v1-0-e3ebade3aeb7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADJCumoC/yXMQQ6CMBBG4auQWTtJqaLRqxgXbfmrY6SQDhASw
 t2tuPwW762kyAKlW7VSxiwqfSqoDxWFl0tPsLTFZI09m6tteOlZW85TGqXD0PFcc5TkPny8wId
 4Mg7BU8mHjCjLvr4//tbJvxHG34+27QtY7clyfAAAAA==
X-Change-ID: 20260925-xo-sd-runtimepm-v1-final-37ebcf40aecb
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-ORIG-GUID: iVVz1_dmcRJ80vch6zWdlLEsJI-6NXzj
X-Proofpoint-GUID: iVVz1_dmcRJ80vch6zWdlLEsJI-6NXzj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfXw/JGwI8rY89/
 BFpFgBbi5Ra116ksa/fFZG8jiIJM43QNoVDnYWPRblZG82ceSd0N9DZsuWGlM1CKaj91qsSayrz
 MippjrEdcV/4rOtvNPWfp5yBW2eET9bJ3IEuZNvoAkFLAAAksgqLVRgesQgInlygwwI+Sd120/+
 yGhjjt6wjX3D+8KH28Um6gYuhw22okBHdx3s0DQUYmq9MtKi3mQB95TL5XAlLQKJXEAmpMV9aky
 H67zn276lhFULdXPc/t9TknMWjALn2cO7u/CJF1GaXNfJTni9Dxw+trubMhwAlwR4NutIACAbnG
 kSLQpzNrE6QgYzbQ0LB2uW78KYWXXw8u89/dE3MEk2/XBIihf/znF7kAoMluqLuLCMJfpv60d1m
 Xhwn0vbW18I5uW1X9uyNMw6QmPZEn1YgE/ufdGCpo03AJtrjMXLJm1BFw6NxO5wsKtcE/GGiqa8
 pw1/e492uJgS6IS79KQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfX+2P8uOvy+sB7
 hscz6NtL0yus/cy7EqWWZIG6EImimD9+t2pnm57WAZAnlJ3BmUx8C4AuFqCLmjY/QZdHlSEdHWh
 8w99uF2ArHvS+hISeauxMTKkabdhG4s=
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6aba4247 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RY2o0Md-0pArxuxOjsoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280041

The LPASS macro codec drivers currently rely on the PM clock framework
to manage their clocks. The PM clock framework is useful for the common
case where drivers only need clocks enabled while the device is active,
but its lifecycle is not a good fit for these codec clocks.

The PM clock framework separates the prepare and enable lifetimes:

 - of_pm_clk_add_clks() adds the DT clocks to the device PM clock list.
 - pm_clk_acquire() is called while adding each clock.
 - for normal clocks, pm_clk_acquire() calls clk_prepare() immediately
   and marks the clock as PCE_STATUS_PREPARED.
 - runtime resume calls pm_clk_resume(), which calls clk_enable() for
   clocks already in PCE_STATUS_PREPARED.
 - runtime suspend calls pm_clk_suspend(), which calls clk_disable() and
   returns the clock to PCE_STATUS_PREPARED.
 - clk_unprepare() is not called on normal runtime suspend; it happens
   when the PM clock entry is removed/destroyed. For a codec device this
   usually means driver remove or reboot, not the end of an audio use
   case.

PM-clk does have a different runtime suspend path for clocks that report
clk_is_enabled_when_prepared(), where suspend uses
clk_disable_unprepare(). The issue described here is for normal clocks
with separate enable/disable operations, which remain prepared across
runtime suspend.

That prepare/enable split is problematic for platforms where the audio
macro clocks are sourced from an XO-backed clock tree. Preparing a child
clock walks the parent tree. If the parent path reaches an RPM/RPMh
managed XO clock, the provider may vote for the XO resource during
prepare. Therefore a non-zero prepare count can be sufficient to keep
the XO resource voted at the provider level, even when the corresponding
enable count is zero.

In other words, after the codec runtime suspends, PM-clk has disabled the
LPASS macro clocks, but it has intentionally kept them prepared. On
XO-backed clock trees that remaining prepared state can still hold the
parent XO vote and prevent XO shutdown. This is expected behaviour from
the PM clock framework, but it does not match the power requirement for
these audio macro clocks.

For the LPASS macro drivers the required clock lifetime is simpler: the
macro register block needs these clocks only while the device is runtime
active. Move RX, TX, VA and WSA macro clock handling into the existing
runtime PM callbacks using clk_prepare_enable() on runtime resume and
clk_disable_unprepare() on runtime suspend. This makes both prepare and
enable counts follow the device runtime PM active state and releases
parent XO votes when the macro runtime suspends.

Each macro driver is converted independently so the series remains
bisectable. The final patch drops the now-unused PM_CLK dependency from
the LPASS macro Kconfig symbols.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
Ajay Kumar Nandam (5):
      ASoC: codecs: lpass-rx-macro: manage clocks in runtime PM
      ASoC: codecs: lpass-tx-macro: manage clocks in runtime PM
      ASoC: codecs: lpass-va-macro: manage clocks in runtime PM
      ASoC: codecs: lpass-wsa-macro: manage clocks in runtime PM
      ASoC: codecs: lpass-macro: drop PM_CLK dependency

 sound/soc/codecs/Kconfig           |  4 --
 sound/soc/codecs/lpass-rx-macro.c  | 74 ++++++++++++++++++++++++-----------
 sound/soc/codecs/lpass-tx-macro.c  | 75 ++++++++++++++++++++++++-----------
 sound/soc/codecs/lpass-va-macro.c  | 74 ++++++++++++++++++++++-------------
 sound/soc/codecs/lpass-wsa-macro.c | 80 +++++++++++++++++++++++++-------------
 5 files changed, 203 insertions(+), 104 deletions(-)
---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260925-xo-sd-runtimepm-v1-final-37ebcf40aecb

Best regards,
--  
Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

