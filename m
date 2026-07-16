Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3EE31E83A
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784219366; cv=none; b=nBHrX3tX3mPPtxkC3YcfAu+kvqwW9i92Bgytt8k8Huzr33ewihJYZ95wxMX+PXj9nxfWEOpfIa/aPiMNrKROjaT6iZc/1qIgRs9q1+g2GCuRcY89YXLzxyuwHfLkm1DLK770/E7q0UTzaYQGn9k4tyEX63WxREWUxfLC0NMpRR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784219366; c=relaxed/simple;
	bh=tSy+31NSf4ZPs/L7gY8LgjvC8hOcW3PXCsaALkCykCo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Fw4Cny9SOSgYkCcXzLh6ruAteH2/4opG70cq/vtWAGKYzY4mtm0VSVSHD3sCTFMKHljIxlKLMi15qt9UyN1Tjnw8++SGMNStyRh0w1fyWf3KzEJhfXMuxq52wlUNd36YyMcARsMQKQV8xXJ8tTQC0QmsvddAGotrKZCnAXTmLC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eVqGDz3I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CAriEv1Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eVqGDz3I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CAriEv1Z"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGT3RI3396111
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XYh6d77eEjRpERjmohISLm
	pXcEE9l0SU4Ey4ZbTQqLg=; b=eVqGDz3IOGSGdh20WxhhKPzoifFYjd0zRbRNFp
	/mdTm6ioFxPyJCH1NYtN04NQPmkCnJAv/AEmEgQF4ffWFE2zPtW/tml553QWCkFN
	OOtRjeSY0IzHeWEUb51x7vN87/RLruJDU6dkr+KIF0CAZy92BK0R+R25bSlwSb79
	a6Na3/bc3vjUEOctRsd92ZtrAJk7ybNX7pPjFhaexyC8GmD09peaQ3GXn5/CpeKW
	wUSKILOx/yR+7YAwwnVFTamWryLDV3ZkZ5vQmMt6BnjOby5KTS2lwgvW6chUV5U3
	9/mzGGNPjIoun++dOXF0gR99CmcjJ4phGxk14mzbf6uv8uUQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feym191mh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:29:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so12807415ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784219363; x=1784824163; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XYh6d77eEjRpERjmohISLmpXcEE9l0SU4Ey4ZbTQqLg=;
        b=CAriEv1ZJYKYy5qhaPVqscDMq5wohZZqz+2hvUYkjzKIBQr0WlrQF9X8softP1NoQ6
         UNh17qZfMIxb2F4Lcmw06JnclR6keNPO/OA/WrxMftgDUWMuvHEpVJhXsxnKogTAWW9b
         v5RUIaEzhzCEcY7Bc3ZibJ2lc8EY3e56mfosTv0INpv2HXcNV089P2Ft+u9HvfwMc47x
         3PjAkrH9TRfiTwV+wai0JJUVc0q0/dVWPHbUMUSY7ZwlswFRbRHCk4be/SbjLs3tzBiL
         CzpLwrtQEQvzEwLJWYljy0szODFg/M55WQT8ddqyogxmhiMf5RF3KGQZ8al8i7QKMFOl
         dMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784219363; x=1784824163;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XYh6d77eEjRpERjmohISLmpXcEE9l0SU4Ey4ZbTQqLg=;
        b=aGWqX/8ceFJh6nQHXtQouMdPRfGAMhIlxXdJ47u16tw/XDqzmAZI8OOYc0BTm1wUXz
         1DMmlucIT4EGy7idSa/CJi2JHhpJPiE8jP0MuWFNmAM0Fi34OWkhUVB8/iNxyrZSRlcW
         jmUVJ7zcw7PR5C5JIRTswreZUx4GkMvglPGTKHv4Zonj6WJjTqoB+BJEVyEJEA54Z3cp
         1LcPS/SRiXz/VRt+ObHXtYRT2NKA41ccxDDIKYONKCgYc8TP51+7UB8bxdYb73DDWf7y
         4DJbzcC1MFvPwSUob5SIWrovuvWeXaEUiIw+wyjStFgBZfXdt874ATnunShVLZnaoUlo
         yf0A==
X-Gm-Message-State: AOJu0YyDIlyJBQfkHU+Dj1ib6vJptpvlVBjvhGGrCvb5JRTZKH8Uocqs
	iFjMq/jIq0HmmkcVFMNFQLQbRpZJBPC5bQjLbkWjgNUgXWN1wCLjBLZ5XS1N1p6F3m0LOeZJUAr
	o6Vr8lrDgO9GMKBj3RH+rgtSFtYY9R/BoTGtlPliWgiAubDcbxr3i6/DdrNqa/+LLKj7n
X-Gm-Gg: AfdE7ckZN4/zDfOyDVefUuugJNC7tCw/Vx1os2BHYjZKKRrO+gx2zim+NGcuoXNn1cA
	4Ii9fmsq0WPoDhyYENwwJyf2ZLsJokiRtjrF2BMnEe6ThyuIq4ciFR42c6XEDP5vYZHhovYseb/
	/f51cxKDgbLXUzcs8G7s8We/zlsx1epSIMifmaFJG2muiIoHPFtxjxp2U5lkUy+/mL09vBaAVp4
	S6gYuJFQx7a09ze6RKBhgqESuQpmlrOZlkimhpikdyIEOxTFVyNGcQCxurFXc5xByVwRlwyxFc4
	fuK73i/FT0DlVWbliLCKIM1+H/UqXDNXtHQELTj1pUAu8uiqNcQ8eyozi9aDDxE+m5rwKfsnT0f
	+K0NAZ7ydOR03iV8nSuapD1Y1mq4LFy02zy4Yfz57gmxiHySbdG+MpXpzzakTvb+7m9SbDg==
X-Received: by 2002:a17:903:98d:b0:2c9:d56d:afa3 with SMTP id d9443c01a7336-2cf1f4bafecmr37373425ad.15.1784219362484;
        Thu, 16 Jul 2026 09:29:22 -0700 (PDT)
X-Received: by 2002:a17:903:98d:b0:2c9:d56d:afa3 with SMTP id d9443c01a7336-2cf1f4bafecmr37373055ad.15.1784219361871;
        Thu, 16 Jul 2026 09:29:21 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd42b2c0bsm11828262c88.8.2026.07.16.09.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:29:21 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Add DT Support for USB on Shikra
Date: Thu, 16 Jul 2026 21:59:06 +0530
Message-Id: <20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANIGWWoC/yXMQQ5AMBBA0avIrE2imrS4ilhQgyFBOohE3F2xf
 Iv/LxDyTAJFdIGng4WXOUDHEbihnntCboMhTVKTWGVQBp58jbs02G54aFSGVGZ1rp3NIGSrp47
 Pb1lWv2VvRnLb+4H7fgCLrzPgdAAAAA==
X-Change-ID: 20260716-shikra-usb-dt-v3-16e187393c78
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784219358; l=2103;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=tSy+31NSf4ZPs/L7gY8LgjvC8hOcW3PXCsaALkCykCo=;
 b=wtWB1omC57q6r3DrEz/OAX4ApXzO/fnAJzdlfCCRt3ZQTxSprSW+0co05IXJ6OTJgLDdUcwfw
 fKa5ODEXT2cA5/TEEX5YW9u0Qe06K9EiIa3rHf6p6YzAC+YXiW5y3oh
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=KPRqylFo c=1 sm=1 tr=0 ts=6a5906e3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6AMJRFMpDxLzbceWcnUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2OSBTYWx0ZWRfX5DCvm7GhA7eM
 I5XeDUoyn/nS2URvUr2R7Yhe9LbvLwQCNklwKcfJ82d1aKAEYH+w0VD6z+Nb1QltneA4H0sPKqm
 +oGyMbg4aQZuiM/Ye0TLKFLNNm9H2UUV857M5O8bhxIVuG7WG02Vy7qj5XQtmD2RUDNqahKdU7p
 vbK5j/KDSQ1J/bubdO+B2MUAurtefHF0gUW+tKS8E+c+DgPky3MBBF8zBldiUVlCkyN6xUKRpqY
 m8n/M6JgVuaYgU2OMZGhzpSb/TpREdswdRMhGHyZfr+D1m0I4Zw2sEXvhFBPmzE9eCjTJpMuYZY
 DUXrBE0lGKuteG6T0xKTE95pDkhHr/v9gHdISSuzYIiwBqYymaOujOO7fHeNjMPyeAiO9HFfVLg
 732oDOryY9+bNPyInYV1WOWngxjj9t9dtXGrBVus4wm3dYyzFl/HlKdzRMyALcCMNRiSG+0viN+
 HVl/DXnFo15SS/FLnjg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2OSBTYWx0ZWRfX3ty9NZVzLVd7
 mUrsvFYO2lXR+OX37+shX0I7fhRDdofbUqdAQe4WhITguUaL2trUKvL7yb5pvnTIWaYB9TwF1kV
 8rXtduP8brNEzF9m7P8fzmveWWpHqns=
X-Proofpoint-GUID: OTplU0PEqjvfxTaSPlrbyr3tBEhgW3hn
X-Proofpoint-ORIG-GUID: OTplU0PEqjvfxTaSPlrbyr3tBEhgW3hn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160169

Shikra has two USB controllers. Adding both USB controllers support
in this series.

Only the primary port has been enabled in peripheral mode for both CQS and
CQM platforms as I got access to a remote setup and was able to verify
only primary controller. On IQS platform, both the controllers were tested.

Changes in v3:
- USB changes were sent as part of consolidated submission in v2, but
they were later dropped since bindings had to be updated.
- Remove double vote on USB3_PRIM_CLKREF and also removed xo clock.
- Uses &mpm as interrupt reference (sashiko bot)

Link to v2:
https://lore.kernel.org/all/20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com/

Changes in v2:
- Moved to using mpm interrupt handler for ss phy irq (sashiko bot)

Link to v1:
https://lore.kernel.org/all/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com/

Binding dependencies:
- USB controller: https://lore.kernel.org/all/20260711-usb-shikra-v4-v4-1-9d59b9d9aff7@oss.qualcomm.com/ - (RB'd)
- QUSB2 Phy: https://lore.kernel.org/all/20260712-usb-shikra-phy-v6-v6-1-1b3e51bf1541@oss.qualcomm.com/ - (RB'd) 
- QMP Phy: https://lore.kernel.org/all/20260712-usb-shikra-phy-v6-v6-2-1b3e51bf1541@oss.qualcomm.com/ - Under review

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Krishna Kurapati (4):
      arm64: dts: qcom: Add support for usb nodes on Shikra
      arm64: dts: qcom: Enable Primary USB controller on Shikra CQS platform
      arm64: dts: qcom: Enable Primary USB controller on Shikra CQM platform
      arm64: dts: qcom: Enable USB controllers on Shikra IQS platform

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  19 +++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  19 +++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts |  35 +++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 221 ++++++++++++++++++++++++++++
 4 files changed, 294 insertions(+)
---
base-commit: a99b3734e51c5a737205dd42c35334be1c5746dc
change-id: 20260716-shikra-usb-dt-v3-16e187393c78

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

