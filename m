Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C7F30D40A
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 04:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784174891; cv=none; b=bCAySKMkHr4alL8neS17BwVMXs0amcNNL1/9Li1LvnPOjUXbTAQ+DuqQpUKRvHGjhmz2211yLZ9C+wX7FYcLOAQpj7zyYWmeAhD1U9AIngIENkefSCwOSa/PjP3/8r1ZM8sgW8VRNZNTcjTlhYRLCkbxnXC9ZX4CBRkx/lQsoVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784174891; c=relaxed/simple;
	bh=qF4D0ehqJD4Hk8KtIARlnaR0gTLZFdEcrxPwtkwtsgA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SdE8p1O0iLvgyvlh2hhBipqfsVD3icPrkXZJhx86S5yZq53RFJNe8TNZ5jPgH3n/jKlFqMFOYenishjtb1VoilRKDMvRO1+gvb9ss7jotid2PvV0ohiHTT2gA3raXWLnOhoFBALZwNIPI5WkQkGxyf9WwFG/uRH/yZ2JHUkrdZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AcBbn/RU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+JxGwHW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AcBbn/RU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a+JxGwHW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3wRAZ1412221
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 04:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=scPxfUsXjJHWYm0pTnIWTb
	7W4QeFQK6ovy2iE3Yp0EI=; b=AcBbn/RUirc6zmUCPsGyPVZdQCUeOvUCADwkT/
	GxJDdUqk42x5x+Wh0GscYCmJXi2AuMV+bhGN8zwbCPFRuNzvlbItIyH3tKI1bvj3
	tpPTBJvYCMrJgfDWIHRZOoOZ3bLNXsr9CEQqZ9cO2aGXCs0AXYalwrAltMoMK0Go
	RVburkAH1h+7nv+v21C9gGKWBU3jbHMgJlJb80hWlMQyqZsb1tPKHfLsJV/+hAlA
	joDVBRKvPOQ/lFB0YDnYHLoBSW2lutryPZz3J0jESmBtyMSX35lLAdxU7zNnJoee
	cSoHoiwHtoiMPjrAq99DBWq8em+TT+cKEwC6ykktG5ntCGHg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7kac0qh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 04:08:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso1549296a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 21:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784174888; x=1784779688; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=scPxfUsXjJHWYm0pTnIWTb7W4QeFQK6ovy2iE3Yp0EI=;
        b=a+JxGwHW3b4stPFwK4XnC3VbNuDZPZuxzwDLKrw+kP3KWY098do4qccoNrHjlS/aZA
         oHHAXB7KefEZ9JXqLQOe6aPMsR+07U7ZEjPu3od46cgXFzMuIl/WvqDKhAZmSUEjNURD
         nxtnD5cGCV6xX623TRdzKiAFwhuNDKy6YLgOpyuXFAkVgDkMB/MUDavRz4/sccCP5BC3
         ZK9ueehQVN4LtFZwoiktuoGwQqR70qnoS23NmHGpU9cH0ocSqvkt+5N6eAbl/N0QbIYW
         wxVAHqhX10HAZzsaQeyJkdt5NFYAUhoBm0xXAY9AOyAFufyZ9CfqFissa5Et8oCVdUMR
         yjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784174888; x=1784779688;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=scPxfUsXjJHWYm0pTnIWTb7W4QeFQK6ovy2iE3Yp0EI=;
        b=HXNOdjObwQh143PFGw/Fk9r3wDxzh7rh9KZ3Peoz7aSAp62SYOtojxHCkdqy+3hjhF
         Bf0jGbmAHld0NqXCl0RQokb1F2Q4dnTuzd57EIM09VDShbAAu099JjLr3kkib8NQpknY
         6nvg5SzycPGG6Ddc+ik8WcLejX5Jk+NvVcSEWp0I/f7daYbrugeevz+pfNc+rp8CnyxO
         GP6U7UWZhn+eLhuxBZ5trCu96oVAvo0G5YSBgRh2INJw6HvOT59jLDZ/ZjvM+z3eg+XJ
         OLSuxVGGEiV+ftsHAjZV9CU3zUlHKKxb9/zKYpNYpmNbdsnq5EWhxvX0SOPotsjXHPX0
         1XaA==
X-Gm-Message-State: AOJu0YyUid08MZcEwV1obRBU3rBP30gRbK+I9KZk2h4kt+D9uJkkPoeP
	94lpBYldBvRPe2l4HSOxdDmVuYs/SAQkhNOXGYWh71+HMTIycli0uXYsr6EoqReIOsYrVv5/dLR
	5gruAO2ANCykYGK/ZCHVp6ws5tovvvaKA3Ie5IU+c2yl1DI/9HTY0ViUFJtLAjSnRYY7+
X-Gm-Gg: AfdE7cmtqBmq6C+AurjV7fLFLig/r0cULLbVISECgDIPr0DXpsnF6b32gdrzMSw3eyi
	g/VPDkLazgnExQSYzvvzOJliZWENcq5Les7g8WT+DVqnSb7ZCNHMEGQemTroe0Iggd+Tm43BkqT
	bOy3gJFi3CQ/srGvHdpf1b0Gvm3padBUMiTxz7lCjuKBV/I7bHXK4qmbFwz3LJulZgf+iMhqVe6
	O2Cb/of369jFvCYa79SkuSTkBuUXcy5+V5R/gzeIEaA8/vfmIyKq7GYEydoY7GKTZHaGLkJuQpx
	I/dk+mu8GaacmmdM7B2jaK9iF89w3Z1uINjBFd/xegq3Y/fvJL+JsmADP4gxkn7jfEOrsqGYOX2
	uul2O2S5Vdl+QJbhYNvhQW1q8WthBhAo=
X-Received: by 2002:a17:90b:58c5:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-38e17e44165mr9686993a91.21.1784174888433;
        Wed, 15 Jul 2026 21:08:08 -0700 (PDT)
X-Received: by 2002:a17:90b:58c5:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-38e17e44165mr9686964a91.21.1784174887989;
        Wed, 15 Jul 2026 21:08:07 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6a4779sm7623907eec.17.2026.07.15.21.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 21:08:07 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v2 0/2] clk: qcom: Add video clock controller support for
 Qualcomm Maili SoC
Date: Thu, 16 Jul 2026 09:37:58 +0530
Message-Id: <20260716-maili_videocc-v2-0-7ed5ab140770@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB5ZWGoC/3WPzWrDMBCEX8XoXIWVIsuWT32PEoJ+1s1S22osR
 zQEv3tkh9JTLwuzMN/MPFjCmTCxrnqwGTMlilMR8q1i/mKnT+QUimYSpIYGGj5aGuicKWD0ngc
 HQSMa5V3Diud7xp5+dt7H6aVnvN4Kdnk9/6glZGNq8cukiRayw9kP0X9x36B0qj5CaKHLcoM7m
 5D7OI60dJVrWzBGGxShsbURCL0yISitbB1AuaPvQVon2FbjQmmJ831fmcXe459BWXDg2EMrWw+
 u1/geUzpcb3bYgg/lsNO6rk/36SyEOAEAAA==
X-Change-ID: 20260707-maili_videocc-db0d6ee94cb7
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=TMF1jVla c=1 sm=1 tr=0 ts=6a585929 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zXpIYuPf6sbHbxCr7fwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: ofAFuRpcs2FjuiXyCk1zGml8TiLwyP-v
X-Proofpoint-ORIG-GUID: ofAFuRpcs2FjuiXyCk1zGml8TiLwyP-v
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDAzOCBTYWx0ZWRfX8oaSjCyDHg6x
 miwBgjoIBltbZm0pZNCtDL17+irn5T4Gjqa+Zxnw14vdeAa9gkeGZSavyalTq40r7yDPd8sNrab
 ERizsGkwTz66Z0RkCzJo5EZabPgv1u0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDAzOCBTYWx0ZWRfX+DjxsKglg+bG
 1nJyQTSbAfZKofoi9QgwiqjpetZJI4Mc+Q2n8mbEdozl5Ek6KCO7SBfcwOaFnpvime4mp+cyDXh
 VWPu7Ouyo60rEPLTSD9oWUInBD4anWFQw+qc2GHqQ//oRpJP1ljV6yyZBDfr2m7Z15lZ+2lXyPD
 b52q3U0KyIBvzSJlnuBwrmmi6LmJdUqEak4VsdwtzBekUgxXMqxL5qBl2uLyDkMnbht3REE++NR
 ie06+RqSIYodS/JTE2Wawwb6aadqBVh3A0T8M8sPkV0lPbvUMfQllABstvMmQ+er+m/vx/omaQN
 HNSgL3OqjRMcW8JwtYDGQMO+grGBWAMlS4MR504lWuuQYxxSDLi9uc56T3xZ0bklJDD4qDdTmKL
 Xx5wIubnpHxQ2RPuI11m779wA7MOW9e4E5bOS4FttEk8iXUrNYFY1FQVbXFidC64PO0A7cPY/HY
 4mSqhsTmHU1L/fOjcEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160038

This series adds support for the video clock controller (videocc)
required by the upcoming Qualcomm Maili SoC.

This series is dependent on Maili GCC clock series:
https://lore.kernel.org/all/20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com/

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v2:
- Rebased on latest linux-next
- Dropped the explicit compatible check for required-opps in bindings,
  as it is already handled by default in the latest linux-next. [Krzysztof]
- Added R-By tag received on v1
- Link to v1: https://lore.kernel.org/r/20260707-maili_videocc-v1-0-ef0828c0bf6e@oss.qualcomm.com

---
Jagadeesh Kona (2):
      dt-bindings: clock: qcom: Add Qualcomm Maili video clock controller
      clk: qcom: Add support for videocc driver on Qualcomm Maili SoC

 .../bindings/clock/qcom,sm8450-videocc.yaml        |   2 +
 drivers/clk/qcom/Kconfig                           |  10 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/videocc-maili.c                   | 660 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,maili-videocc.h     |  49 ++
 5 files changed, 722 insertions(+)
---
base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
change-id: 20260707-maili_videocc-db0d6ee94cb7
prerequisite-change-id: 20260617-maili_initial_clock-c7e2b4530d80:v2
prerequisite-patch-id: cb2499a822715bf6d411ea000e525e5feab52e7f
prerequisite-patch-id: 4280283ee9f782a5ba46e4419ab0b7186add0211
prerequisite-patch-id: 3e9a75794efb1633818ffe387d1f4e5048c361a4
prerequisite-patch-id: 9a218f161a75924b8cc3fbae44007d0da7739d60
prerequisite-patch-id: 7e5ac7db1fba3258b45b689b11d0ca93d65aa38a

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

