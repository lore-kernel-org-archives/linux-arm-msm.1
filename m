Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF4E427F85
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380759; cv=none; b=gJ/e29jSwm5iNWgibg/vr0A/qQlPJPOgq86E2k8KlrAwAZOcCBE3Vi5YDK3Bmu0b6Rf5yIgQ8SLeYdG+hnD32KKnHbOs26aluEDWQ4aBbZkvG4TVh1w68QOFmSey3ft/ttl0FAOo15lYIhMFaq1x8OA+Q1sVccWjEImPbGhXXjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380759; c=relaxed/simple;
	bh=0aU40lED/wLZI1ZLNdrO3hZn8tX/F+q3zX5v3LCBems=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FSwQ20U4fH6Jdy5e320AROiNTDnakaDuYzW7/97QRgJRD+b/WE8ROxRk6E8TGz/RRG7D7cu81z3dv0V4EbfQ+R0D9JYHlmycxAczVp1Yj8ze9/jwaZo4JjEQF1aCedefG3Z/+wWGzX3QuKL8LeACFVS2DBiy5+LtUCbThRgmy7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BNd1BlUL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MlGRCh02; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BNd1BlUL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MlGRCh02"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nRq33663481
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=r57Gb+QjLrRwrCGeANLs/enNEAdU1pkKAdj
	qe0pTr5o=; b=BNd1BlULAXpixB6lI7nHKxG7aocwl1he2Vn46gOeFrF+/RRPPRc
	ybJe7ldzl419zrIEIN1jDnl8c4UXJ9ElZE4R7bvsNqV9ZJ1Qh+mzDpxMzmp2i4tl
	YEdFzPDruZwMdo9GaWgaoI5+Ovr3+7PyDCTZ48Ybkt2pMRVAVae7ZbZH9Jpo80JV
	BhUDhGSbQDfYwsOzu0/lu9FfrviEGeFmqsJNX/PZdPB+9oTnz8nXcgdkY63It8nz
	+AsHF81RCMy0bT50MRVvkzBr+9qTEaazt1FUPq5Plr40F1wqbT0KkTI23bigfUue
	8aLoN3WROzVDFdypPZEsS9HHhPuF3gU+pVg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg0j04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:12:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db22383e8fso44966945ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 03:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789380756; x=1789985556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r57Gb+QjLrRwrCGeANLs/enNEAdU1pkKAdjqe0pTr5o=;
        b=MlGRCh02BCodXNtNvj0FdTPuznfYhbsLwD2XGDQFhPbgZcbLf1WlY1x7MCZoEVgyzh
         gH7UWjjxz1MDF5fRs0SOIDUBZEq7wZDCqSnBXA6q+SP0n8BgYp6iq3gr4gQlxzljuXAU
         68B6Cyjvt2a3US6qoN3cfB5O1KT7uwGNySydH5RhFSY6/xLDPuJGZjYS46EIJriVBx/9
         ZRnEkidZgMhGYkUvyG7oOGixDjbMSh2zhw8Bc3dXNxwo+Qs1eBW2LlDfdc/OdoFIpqS/
         ++i/FH4DPKx+E8HzfSiu8pZUjDAATcAGNKC1DPLVXv+qD87Vx372eJakTkCRuusorgPe
         B6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789380756; x=1789985556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r57Gb+QjLrRwrCGeANLs/enNEAdU1pkKAdjqe0pTr5o=;
        b=oeUt2KEHO5X3gftsV1eQHCcOHGDx95mV65gnbj+6G+27jEZlhlJTymoRjFdzNJKVGV
         tefzq6GhgvhT1oEK1U+NXsBbU6gtTvhKVZkONb6MwkbtoFE9cibR/8+7xwUNiUL2EIHF
         ABsfay3bOPgw5dV6ayksE+fMJd8OI00gFZH9DPwlv5qIkEvyBwOyYQPnFRBZs+piBX4R
         LT63ZZpa7sUmb2/hADC68AqVe0/bffbWY1xGdfKSnVepXp0K3fnZGG1uf6pYpaJSy8i+
         SFhXzS0SNQ660sxgCU92d2SOkTULkJRWNU2mwGgxIpRLGB+HaRQiD1imS1YhwsYMQeuy
         k5uA==
X-Forwarded-Encrypted: i=1; AKwUvByg0zi4j+BZ5p+UkBhl0At5YaiR950kuxS2WxzpaevFVggOIkk4xQg9V2phUM8Lykk4Z/gAerTMsBLhGoMv@vger.kernel.org
X-Gm-Message-State: AFuF++mAIkvl8sOf95H0pBi54KChVGtZibdLG1/uXk54BT5b5SkgKWy+
	yKIVLZabKVLwjPkKIw8nvv29BZEQyrUtbiPIxmDTYsvZ6xrJe1f0vmOAGE8gARGuIN3irntOXx/
	aSMGt66ng33Whq1rWS1fu6UbHmtn/cWDAHcSLeOjYmFqKSkOoEvL0jAAZfnwcPBfK+MmI
X-Gm-Gg: AYBFou3bKXfTLfMcHYcqX5mHvrGgsFtQWYLIdsWQ306b4IGLIlaVNch7uFUYV1l90ty
	4pzKAvj37sUCFPRkgKx69Ti9QUz1IyJWFPuGSJvEcA5vF0VqB5DVwVSVo9hz/7kFHoASbh1Ishl
	fxhPiRsOlg18IzDw3toGFVeD76yF5SJA1kB8Ly5TL7iX+O4DHFsEww874gO1zqPiEecm5CnIg9D
	he4HfnB+h15gb/LJQ6pm2cyRS7DWQDCjx3pDeoBO0s2iUPF9Q07w9qvV38qWFFbXa8scgHB7gYx
	UowSzCYn84U2a9OXKFpSAisi5efggLgDZzZSqo8PHKbSl3J+8poBzvtq4ms53/pJEBCBnpKMgDs
	aE7ZAFEmkyf7BI/ocFHSw9/87/g1/EPdCiGytrmU6vUhdMA==
X-Received: by 2002:a17:902:ea0b:b0:2d7:1858:1d96 with SMTP id d9443c01a7336-2dd5f0997f7mr77894115ad.7.1789380755869;
        Mon, 14 Sep 2026 03:12:35 -0700 (PDT)
X-Received: by 2002:a17:902:ea0b:b0:2d7:1858:1d96 with SMTP id d9443c01a7336-2dd5f0997f7mr77893505ad.7.1789380755348;
        Mon, 14 Sep 2026 03:12:35 -0700 (PDT)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed64fcsm29020697eec.16.2026.09.14.03.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:12:34 -0700 (PDT)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        xin.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com, guodong.xu@oss.qualcomm.com
Subject: [PATCH v3 0/3] arm64: dts: qcom: PS8830 retimer clock fixes and typec0 enablement
Date: Mon, 14 Sep 2026 03:12:27 -0700
Message-ID: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7c894 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=L7aDVREW-34teNFlR4oA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 40DoSQvPZstPYoajZSP94yNmXM793Aoo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0NSBTYWx0ZWRfXzPOZ4O07hZeW
 lUiQqVGeS61UsU/6xLLOR7dGi2hoyct0tg+e1QMDS9aD3hRugMaSzSPxLLo4T8BPfmITJdZLAgA
 klwakF6TW1abb8qmWHFVLVbv9O3e7dg=
X-Proofpoint-GUID: 40DoSQvPZstPYoajZSP94yNmXM793Aoo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0NSBTYWx0ZWRfX862AxtQN8F03
 O4h7jmdQcAD0MYw4qcJ9olBRARcGJEy4ArauSby3ZKyalEntPOrPG8w7N/9EwKsAXEV7+rA5x7M
 9bHwtZmDFooyv+T+o7GrmWZEKd5Y+oePQxkrOYC4ZvnXV0SXJ59ldlQgu/5oKHuvOrbN2Yz38Bb
 DlkgZ7kshm7FQORYjz2LFAGMCPpnEjYH6Ek5XXTsYfehkESt4tKDJe8vbl+4CsbXdj+EYvvxyQ+
 /kWdUocvaeMv9q3PscQWY2MfU2/EpoJmZ0tC0yrXyxGqpOGGGsl/GkMMmAT2uDFJYAzP0eF/DKQ
 2/oqWLdgwBGjvHfDci2BQ52hmXx4QR06jIRzWg29YtELWILPu8NORG7Yq41h6eKxRXzrbltzdNF
 Z6T96BCQ+6VaUV4g9b4yfrUNEBYvdnY4uw3f+HBXWMQ0Yvo/9HO3kRbss4LLfTapOc24gHtYY6A
 PAbdmtiK7ZaQDRKYDtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140145

The Hamoa IoT EVK hardware design uses a Parade PS8830 retimer on
I2C3 for USB Type-C port 0. Describe the retimer and route typec0
through it to enable USB 3.0 SuperSpeed and DisplayPort Alt Mode.

Compared with v2, two new patches (1/3 and 2/3) are added. During the
v2 review [1], Konrad pointed out a suspicious clock reference. Further
checking confirmed that every PS8830 retimer on both Purwa and Hamoa
has its own on-board 25 MHz crystal wired to its XI/XO pins, so the
existing clock properties in the DTS are wrong and should be fixed.

[1] https://lore.kernel.org/all/049be278-8958-4d04-8501-7fb60d2169cc@oss.qualcomm.com/

Patch 1/3: Purwa, switch the three PS8830 nodes to on-board crystals (Fixes).
Patch 2/3: Hamoa, same for the two existing PS8830 nodes (Fixes).
Patch 3/3: Hamoa, add the typec0 PS8830 on I2C3 and drop the unused FSUSB42.

Tested on the Hamoa IoT EVK:
  - USB 3.0 SuperSpeed at 5 Gbps on typec0
  - DisplayPort Alt Mode on typec0

This series is based on the qcom tree's for-next branch
(git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git for-next).

BR,
Xin Liu


Changes in v3:
 - Add purwa-iot-evk clock fix patch (1/3): replace RPMH RF clocks with
   per-retimer fixed-clock nodes inside a new clocks {} container node
 - Add hamoa-iot-evk clock fix patch (2/3): same fix for the two existing
   PS8830 retimers on hamoa
 - Replace RPMH RF clock in hamoa typec0 patch (3/3) with fixed-clock node
   inside the existing clocks {} container node
 - Split previous single hamoa patch into a clock fix (2/3) and the typec0
   feature patch (3/3)
- Link to v2: https://lore.kernel.org/all/20260803132753.994619-1-xin.liu@oss.qualcomm.com/

Changes in v2:
 - Updated the commit message to clarify that FSUSB42 is present on
   PCB but with all signal lines unconnected (NC), rather than
   "won't be populated"

Note: Changes in v2 and the Link above apply to patch 3/3 only.

- Link to v1: https://lore.kernel.org/all/20260721074145.1534100-1-xin.liu@oss.qualcomm.com/

Xin Liu (3):
  arm64: dts: qcom: purwa-iot-evk: use on-board crystal for PS8830
    retimers
  arm64: dts: qcom: hamoa-iot-evk: use on-board crystal for PS8830
    retimers
  arm64: dts: qcom: hamoa-iot-evk: switch typec0 to PS8830 retimer

 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 130 +++++++++++++--------
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts |  27 ++++-
 2 files changed, 103 insertions(+), 54 deletions(-)

--
2.43.0

base-commit: a9d7ced84989ec05be09b4b8428759ef60450a0f
