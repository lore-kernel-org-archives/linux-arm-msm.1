Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B5047A0DA
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 13:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787060310; cv=none; b=Mb/F35TATy3XW+X2tPQXZDjNJUuDS0TORNxTbG/AWuac0xgXVhT2xuWxg41JaEoytSCO7N/EgZ0rownRiXz6cayTf8Op+aoBrpiwj51pA3CChHS5tVK5F4BKxRP4V19DvdZLJ/Tpku1DO52jqQrGm4D2QWRkMDtv6KUvoTDOT1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787060310; c=relaxed/simple;
	bh=GkxaKnq/63E0Z7X8FpzUUbG68EV0WqLS6lypFir7120=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iGY+2K2tkVso3TgkF0ojRzBXdJ1bkh2X8lqF0Unf0TJTC0ObTgOeItt6efgkk2mQeO53cglZvDrgFlro1NabtVlByQGYBLzaN7AmIsEVpWg0IgL7P8g0Iyhb8eGIfeiWQGVRU4GZ5kt6hYR8fJW24vpeQAq4F3Os0OtP2PnzudM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B94k3TnO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VlCD5LT3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B94k3TnO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VlCD5LT3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IDQspx1008475
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 13:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=W8MX3BkKHzSUT4q98a2dtC
	s2yo7vAig8OUxQGH0S0+4=; b=B94k3TnOtZx8mkBWhnHXTPOa0xO5NuvSIfySg/
	JXhqdfZx1qPRmmZk8rldN5xd9aie6JOLi6/I4HZemE/xQRbdJgPIDtmn2BPgN7W6
	MjU3LYnYF3vbSqKeqYMlQ1Y8Rv/OWfQQpmtcyz61gVPtmlmqZ55liL0nLUu8QVTg
	Y9Du5Fl2f0zYSB9rFHEBtWA/rFQ+4pEgeDFSAwrAvlOfuntQFOX0YhDLhtEyzQoT
	6U1jwrakjXuqedt592mDGdNF0+T7Tb3S/u05gSKr/SSDPlPMFSQbkVUxT/4d60kO
	AncQP0s5VCcltx9STuWfxAkesIWdMOPE/FbvpUuUVcVRPq3A==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fbaadey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 13:38:24 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e9fdc2870fso2952145a34.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 06:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787060303; x=1787665103; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W8MX3BkKHzSUT4q98a2dtCs2yo7vAig8OUxQGH0S0+4=;
        b=VlCD5LT3SB5O3ad0J213jmJ+1ADl64slbBXc00daIQEyJyiXxTMtA94WDf6+knRoAk
         xjKebJXQX21MszH4oVALDOqn+bH/TCst7lZtkbAVGa2CWlo0V+pfhYPCY1PyUhGBBeRV
         qdsNHzP+MLhk2qhXIv6GYx6n0Z+QttuCzdPb/2xwCsdXxI6OPGCus+l6V/q9pEQwkgCj
         M/XSTJpJPL7WihFoYkQsx6HeZ0ZVJ3785p+35aFscqzPFO69IO5LwLuE183gcxxWtenV
         nHgIc3Y5VIcB43yXAJHK1cg1a+XmWLIJHD3A3bsSW+yReebmq3kFQLm3h+OT0Z3fJVlT
         FNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787060303; x=1787665103;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W8MX3BkKHzSUT4q98a2dtCs2yo7vAig8OUxQGH0S0+4=;
        b=cnRGSyBXx1ufJzGQjurMLyJJ9e1aibbkp51njTWI3GtsKcoamSJvcEDrpEjP3lxuEe
         0H5AX06TSBPCOw2vvydx6SzGAAeA3V0794scxGL1N8wLwfZqlnABzwMcGziI20xkzTh5
         8B1KzrPRX7O2+crprdzjoX6c2R+rAydKONaWA2jK5+70i22DfEv02oR+CsjcNm/urAw1
         dHGW6CLBnEjiG5I/yKxpweN12dPjyQVCZAMwDkxy2Kqy/GyxzlXnY8lgdrGBgsWFc8cK
         9d3Bj28qWCGGvfRVVwsGyC9sKowAmcy9Xq3uwtS+jwkzuqwetXb/X/LhpD4Em9tlVhhW
         467Q==
X-Forwarded-Encrypted: i=1; AHgh+RqWyFERl2VSCNiRG88YGIivmhXOg9Jvb50LEvmK88VDCrTTbAoD5/YkZOs4vLrekCjatOP8dZpywe5wpl+a@vger.kernel.org
X-Gm-Message-State: AOJu0YwzriUNoMP7j44bq/xiCrly4jmLTx9e+6Jk+hZQBcvUbIC90E4A
	yBFVAkuMiP+jKPgaLBaPL3lh/7+C72/uYnwZM76QnK7rkSK9VrSxRRhNpRsGqGvxAVkxYU5aS/X
	MywW2nhkrIlMOa7FC1QCpHHJCpF/1xvbDX2Jf+r310URl2fKgDnGaqguAyvwET4v64YtfNdWQ/G
	ge
X-Gm-Gg: AR+sD11IikEv18W7fGGOqomtmWXhfonqqyawku1lWmACCvnRg2oS0FfaTtA0+6la/YF
	FyKKVBHocLjnPh6xD2sFFjljBh0UeW+6UawHIooEpn+qpO9df3PbiUerQcgYeZwXffnNK70AKFo
	aNJ4yBKINFxpdm+h32b6OvLKhzAy+EmtYTDNWFuHJp2fk7ves+ahlASOjpdu6deE26J9B0krw4o
	T4CRKhJhuOxF7Y3vsCAo9qbRIuMNKVjbAOGasdzuMvb2cEoCRD+rN4yi0oGz+ikn2ismOVshhdW
	cNgVNoIApIU5LY/BgZxhAPBQi3tEpsu5LRy5LIcBWN1148ZcD6lkAT0gzDfw2F6SYyv7hrVQIYz
	wFdXRLP8EDKALOqcBo7Sr2PCxvTIFLnCJCg==
X-Received: by 2002:a05:6820:160f:b0:6b0:fc2c:bb27 with SMTP id 006d021491bc7-6b0fc2cc496mr15903912eaf.14.1787060303240;
        Tue, 18 Aug 2026 06:38:23 -0700 (PDT)
X-Received: by 2002:a05:6820:160f:b0:6b0:fc2c:bb27 with SMTP id 006d021491bc7-6b0fc2cc496mr15903875eaf.14.1787060302666;
        Tue, 18 Aug 2026 06:38:22 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45f22aea368sm3232956fac.5.2026.08.18.06.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 06:38:22 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v3 0/2] spi: qcom-geni: Use GPIO to notify master of SPI
 target activity
Date: Tue, 18 Aug 2026 19:08:09 +0530
Message-Id: <20260818-use_gpio_to_notify_master_of_spi_target_activity-v3-0-e1c9e0dabbda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEFghGoC/53OQW7DIBAF0KtErEtkcIxDV71HVCGCB2ei2jgMR
 rUi37042XTRTbMZ6Utf8/6dEUQEYu+7O4uQkTCMJdRvO+YuduyBY1cyk5VUVSs1nwlMP2EwKZg
 xJPSLGSwliCZ4QxOaZGMPyViXMGNaeOOVtBrE4dg2rLydInj8fpCnz2em+XwFlzZna1yQUojLY
 1MWW+/JHyv1fz4LXnFXq9rqc9N5pT8C0f422y8XhmFfDttWZPnLEe0LjiyOPnQCvK9F2/g/nHV
 dfwBs2QOVcQEAAA==
X-Change-ID: 20260729-use_gpio_to_notify_master_of_spi_target_activity-5f62a9e14875
To: konrad.dybcio@oss.qualcomm.com, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787060297; l=2028;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=GkxaKnq/63E0Z7X8FpzUUbG68EV0WqLS6lypFir7120=;
 b=CD6P1SGuExyO2hOc1fOipRkKgGLSrCS7wKtKqUd+r6MaJ+DOaER+Z/hIJwROxvjmWsbgXKXH8
 qSUV3IkAfV9AL/IlkFIkbHV6juNx5L46B1Cscb0WHbQMtANPdgX/sku
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDEwMCBTYWx0ZWRfXw4qmybpBu8xK
 4Jx7zPmoFTUvgC5/+c6npo/weKLMBgNTboNgDkKRH37blcrFPnEPmtzpW1RefxYhn8Qv1/B4Pi0
 +HEyI8yDyywRNgE7rph6EBLGSkODeGw=
X-Authority-Analysis: v=2.4 cv=VsITxe2n c=1 sm=1 tr=0 ts=6a846050 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=DF-2czj9NRJiL_b3NI8A:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: hFif0_dstsCxW7qqWILh0wvCQcdID4xM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDEwMCBTYWx0ZWRfX9cROSyUVzkjv
 keRRNLp1anO5t66F8AMTe6XmksiAjse2Iba/f8CHy9VwAqOxyeCTxNrHOhEdulJUwAkPCiCSYfr
 Q2JasT3LUSWppJMw2yzSzm7XN9G3FVd/48Il8CEhy+iPv2gAuPFGFMLz9YOCA8EX5CfmFEVBsph
 RT4CW5VoUsy/0OWC8bNyI5E4L/gx6PR9CLGnzyQlFFgyGrrQbHueEDFwQ2mWSRiDNrbGs9daHyh
 INbvTu8m1ruXVEAPwVackY4wqQdZ7td7MJY45+UHqNY8fgVIJ6y+JFScLRSseqCTfp8K1q9+0hM
 kojU+JQburjh971GwCvhoNW2gk5uEDnFQMBvMoru0zDdeHxWOBtRBi3n1DBo4NFCHUx8oaBsRYb
 PWykPzCaZbbAuu9nWKDte1ptjibm3iXB/1TSApBKmTY6MW8U4imMQ9ByAGodhUPGws7WJvMIqLz
 oLqgmvL8HaEoyT3HIGA==
X-Proofpoint-GUID: hFif0_dstsCxW7qqWILh0wvCQcdID4xM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180100

When operating in SPI target mode, the GENI controller relies on an
external GPIO to notify the SPI master about the target's active state.

Add support for an optional device GPIO that is asserted when a target
transfer begins and deasserted when the transfer completes, is aborted,
or hits a timeout. This allows the target to explicitly signal its
availability to the master and ensures the GPIO is released in all error
and completion paths, preventing the master from observing a stale or
incorrect target ready indication.

The ready GPIO is intentionally made optional and is requested only
when target mode is enabled. This preserves existing behaviour for
systems that do not require the signal and avoids regressions on
deployed platforms where the GPIO is already controlled from userspace.
Targets without a ready GPIO continue to operate unchanged by using
devm_gpiod_get_index_optional().

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Changes in v3:
- Rebased on linux-next tip.
- Link to v2: https://patch.msgid.link/20260817-use_gpio_to_notify_master_of_spi_target_activity-v2-0-94d1eff3175f@oss.qualcomm.com

Changes in v2:
- Used ready-gpio instead of target-gpio.
- Updated commit text.
- Link to v1: https://patch.msgid.link/20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-0-c363a9b5df69@oss.qualcomm.com

---
Praveen Talari (2):
      spi: dt-bindings: Document ready-gpios property
      spi: qcom-geni: Use GPIO to notify master of SPI target activity

 .../bindings/spi/qcom,sa8255p-geni-spi.yaml        |  9 ++++++++
 .../bindings/spi/qcom,spi-geni-qcom.yaml           |  9 ++++++++
 drivers/spi/spi-geni-qcom.c                        | 25 ++++++++++++++++++++--
 3 files changed, 41 insertions(+), 2 deletions(-)
---
base-commit: e6664f2b33db9b6811eb4cec109f06cb2b4f458d
change-id: 20260729-use_gpio_to_notify_master_of_spi_target_activity-5f62a9e14875

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>

