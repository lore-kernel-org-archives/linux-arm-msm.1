Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D715C3E2AD5
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 10:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544630; cv=none; b=pn4t5nyQH5edC9GSjbuTn4v24TfviIqiBLjJ43290umAi1LesUjdzXJsIUhFBY1q3yuD6JlThvy5tylgV9rMdsg7oWDyzMNxaT0NpCxdi/u1e4LJx52ry4/OiMcAEO1QlgTIUQPiTRzgxGyhSKoy8JbSTFr4Lh/rAlEwpXXm220=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544630; c=relaxed/simple;
	bh=ndGbwRrcy4NquZS34c1u/G7anx0+KiVyIxtxL55NCJ8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SGNVKHuNCEC2vL9kAXXBwWMbeofPv+GbGkQYRyk8wfu4GsK/0uQWbTbTYXyQapPG5fW684O7b65sWwFG1FWhdYdfVfX0KHVzAWA9yNyI8GI4uJ3vaiolxVi55VznNP13OePxDmK88Q0by6LVzGRQ/CSOywQ0C746EGVObZU5iuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fn7F9Sxw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GR+g4a8O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fn7F9Sxw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GR+g4a8O"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9vdfc2023728
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 10:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kvPKWvJHNSLhHMncthnA23
	3T9yEk43en5WxFeOAvwMI=; b=fn7F9Sxw1Crzl3/T3/Jooj9uvQiR8FNhxCs+pU
	w2GUxZyR1sSzcryU05DDju25qobf2a9gWcRZz9qitsxUZdTNsmliky2FcvQPW1Dp
	Uq7xxqnCRSVwNPOUV+fhRsVeoirSl7Dshk2zMrEUtN9ukCVPs8wwqq1IcV4orFpt
	An36qb8iRoA89KmsJYlzTZYNYlQeCa13yuSwkZDDy7oBy4Zs8aHXevIMUqRLGxBl
	7Jp9IRlLronlVsS8R4nHda7IYOTwEEhodBGFQlx1zF4n76cml7FWrJr2kcJv0nJ5
	seXa0ZCHbBwlitxP5MPB/5YeA5OfP2yhlscep0BYcNBytMkQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgs00cw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 10:50:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c856470fe9fso5502542a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 03:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784544616; x=1785149416; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kvPKWvJHNSLhHMncthnA233T9yEk43en5WxFeOAvwMI=;
        b=GR+g4a8OYci9+GF5YJDUSEtVvUMQcbfQ2TTDGK96qLroYzdkSsIXmOCU7taPM1Bn6O
         TEWe3Y7mjkfaxNbHy5zNoX9OMinTRAxxayGK1hp6ySGue760bEgBq/2vg1ltgSMxhE3z
         Fc3SCZ4Na4utwO5QXkJSbnUJExZs7vgz5UdkrnmS83ifs2CRVuN3JyEorrnGr90kNRl8
         hH6wQGiWMnDOaW1N4WEkGdgpU2gl0Fv50QJhgWj7iMYGF8I/EBrxEcL8NC2qaluobpuL
         3mZscJ/RC2KGBJjognV6tJT46y0TNoYeRwNTZFmrQCO+dJLtRsFngwZ/vsw271TpCM5U
         L5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544616; x=1785149416;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kvPKWvJHNSLhHMncthnA233T9yEk43en5WxFeOAvwMI=;
        b=gnUv6Z8clokd1vlam/yGykwCriVwu6RDy82s8saeK4jzFr6RwFI7s7ZP0TSTFePx4U
         Px4suvKdmmIt9FWJRxxxpoCRClM9JdPVHyGhXtU8AZrQKoWsy5tS3yZylER3Z26ITij1
         JCRa0V53Bf6vFjU5qy70xIBc4RI6f3sRTWNPIJ5pikqRUPvQmE2QWhWyWA4weDAMBWJl
         GaPT6jtYZOPng+fxAXXddsV31Y9WmwwirOtIFYt2fR4+jUbY5DDB4Cr7UruIyjtHDdAe
         q6V/rbNEhaLXJgj2E25F2YEKfpOxvu2yt2TdlDSXURXXy+aCAgc7F0V2XHIpL4NDVfgL
         8Pog==
X-Gm-Message-State: AOJu0YzfL9Tcq4KLsjsjoMmCz/6InDMumpJdHAFRD8PZppp+L/SMJcbl
	WNHGBmNegRYnJYGEK6oxAPDRPeTCwsdEalXwsi+6KChbcVrD00uzZ9U+0PkOXPvGjHI9nrwz+0p
	ZLx92OAUN1ET5T4f/kKRhIQPHDwH5zzYlyaC3NDzIEwsgFZek76kBs95Z6UyAmnveZkvibpLajg
	zF
X-Gm-Gg: AfdE7ckKf3/h9DLh9NvZEe4mde4yO+K2PnSYyAyEiD2/3cnhPONV3bfvYue1iKwcKfv
	vqNY4xG/QKkLgIJntrucsVxll6KsO3PcyAQuLUfXFmtdkXfB1f4vo46yQF57G0Ept8Qnt6i3RAy
	NBulLxl3U+dUuhImw+c2xIkQG6lS0l2De0xF0iwV6e1PBheyAG3RR1OcfnGMLNjZj+oB9FePUwq
	oMyO4F0dPjlngFWlka8PgzSEqcsM5qUmmB+hefKFg5CSxKs4UcpbNOnRs0BW/3llcwRY4a2YVPo
	wmFxPNZD7oxb9SliKxpA4GPaR9zcPSSkna4FGfsKx+OBzw59Rtfwwax0O+4+LveRrdTQo0lefC4
	w/bZZsAf5MK6yYo8=
X-Received: by 2002:a05:6a21:4a97:b0:3bf:7e2a:e874 with SMTP id adf61e73a8af0-3c3ad6682f3mr14674056637.1.1784544615870;
        Mon, 20 Jul 2026 03:50:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:4a97:b0:3bf:7e2a:e874 with SMTP id adf61e73a8af0-3c3ad6682f3mr14674030637.1.1784544615282;
        Mon, 20 Jul 2026 03:50:15 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb5159b11a5sm4343368a12.0.2026.07.20.03.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:50:14 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v7 00/10] arm64: dts: qcom: Extend Shikra device tree with
 peripheral and subsystem support
Date: Mon, 20 Jul 2026 16:19:16 +0530
Message-Id: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACz9XWoC/3XQy2rDMBAF0F8JWldBGj0sddX/KF3oMa5F67iRH
 NMS/O+V04WNqTcD98KcgbmTgjlhIc+nO8k4pZKGSw3N04mEzl3ekaZYMwEGmilQtHTpIzsaR9p
 zygxEDMIANi2pK18Z2/T94F7f/nLG662q41p2qYxD/nmcnPjSHuhTPUBbxZ01wkTv3MtQyvl6c
 59h6PtzHWTxJtgYgu0MqIb2XhnOhIpcHBhiNTTjO0NUg7UoWhMtBmkODLk1zM6Q1QDOpWBMWen
 0gaFWo2GwM9TyD8u5CxYaYOHA0BuDy52hq+ERQasopLX+H2Oe519YrBVLGAIAAA==
X-Change-ID: 20260525-shikra-dt-m1-082dec382e7f
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784544606; l=4780;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ndGbwRrcy4NquZS34c1u/G7anx0+KiVyIxtxL55NCJ8=;
 b=SF3zeHdHt3PU46lTsfMnePbCe/suTpCbKczUiyB+pDNEs6oKpmhxR6YCGu4Nnczh/2kekAmI4
 w15wzKVCs1sBmesxu+fdLsUg0CZQBYpDjmALJ/GaJpOwuhW/VZQ1Hog
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyMCBTYWx0ZWRfXyCIup2+xU+01
 cJuI2xiBbFRNgXCGPmDLXgvfxCZRdeIrwl2pfLhUUC1wcw8SpBmBcp+qA3u0GePgM/JwmkH6lK9
 uFtH4GF/kV5ToRVffsTl1Jfe1fE8iWM=
X-Proofpoint-ORIG-GUID: qIJpNOtBrj3lgWnCH4H3b9QzF9fr8W3b
X-Authority-Analysis: v=2.4 cv=DMS/JSNb c=1 sm=1 tr=0 ts=6a5dfd68 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=esFleGvXc86k4vwuY34A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: qIJpNOtBrj3lgWnCH4H3b9QzF9fr8W3b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyMCBTYWx0ZWRfX8lGZRuN+AAw3
 rXGnRm3VrViTBXo4EIQZPlDlHpBRwDXK0jBWPhwP/01aKBymeeNILgGwA8Yh5vB25l+D1bU/2Cf
 7k//NARx8RRWnLsH49k9rhmX+kwRfZSlSIllDRiSxO279kQLDqYjPa9R2t9Akf92CW1coaakqKD
 w2FkP4aFTQ19/sFO5cf14n1XK2IS4ViaZudigR/SwxfL/LpyZcLUfrdPBDtcn5Ne32/THTXKTag
 691JKDOagnyUGpkIJkfUGMf1v3iy3HYSj0jJn7yaXqd77GrEWlY0B+9h5c11Z59SEtOZwePwfRj
 4r3h2rBqmrGdYssrsswPbsLWvIK8yAXfwlbyjYhg8lgQPWCQj36c/tvToNQAoTdu5fG4qfCGVXQ
 3OFhy4FhV7LNjFHgAiiobGAG3D9hbZqxa4BOMz5QVmZPQEKdAHV2yqUQxaok4Hct+xa/woxGS/h
 7qFXc/ZnFFetI2zGMOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200120

Extend Shikra DT with peripheral and subsystem support across all SoM
variants (CQ2390M, CQ2390S, IQ2390S) and their EVK boards.

The series adds:

- QUPv3 serial engine configuration
- cpufreq-hw node for hardware-assisted CPU frequency scaling
- DDR bandwidth monitor (BWMONv5) nodes with OPP tables for dynamic
  DDR frequency scaling
- EPSS L3 interconnect provider node for L3 cache frequency scaling
- CPU OPP tables to drive DDR and L3 scaling per frequency domain
- SMP2P nodes for CDSP, modem and LMCU inter-processor signalling
- Remoteproc PAS nodes for CDSP, LPAICP and MPSS subsystems
- TSENS instance with 14 thermal sensors and thermal zone definitions
- Bluetooth (WCN3988) node with board-specific regulator supplies on
  all three EVK variants
- WiFi node in the SoC DTSI with board-specific power supply and
  calibration variant selection on all three EVK variants
- Gpio-reserved-ranges to tlmm to mark GPIOs used by the SoC
  internally and not available for general use

This series depends on:
- https://lore.kernel.org/all/20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com/
- https://lore.kernel.org/all/20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com/
- https://lore.kernel.org/linux-clk/20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com/

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v7:
- Dropped cpu-bwmon DT binding accepted upstream    
- Collected Reviewed-by tags from Konrad
- Minor nit picks from Konrad
- Link to v6: https://lore.kernel.org/r/20260714-s

Changes in v6:
- Collected Reviewed-by tags from Konrad
- Reworked WiFi/BT enablement into SoM dtsi files, including WCN3988
  PMU/regulator supplies, Bluetooth and WiFi enablement
- Updated gpio-reserved-ranges to document reserved GPIO functions and
  drop GPIO115/GPIO116 from the EVK reserved list
- Link to v5: https://lore.kernel.org/r/20260702-s

Changes in v5:
- Split the WiFi hardware description into a separate shikra.dtsi patch (Konrad)
- Moved common WCN3988 PMU, Bluetooth and WiFi properties into
  shikra-evk.dtsi, leaving board files with board-specific supplies and
  status updates (Konrad)
- Added missing CPU OPP entries for 768 MHz and 2208 MHz
- Added gpio-reserved-ranges for TLMM on CQM, CQS and IQS EVK boards
- Collected tags fron Dmitry and Konrad
- Link to v4: https://lore.kernel.org/r/20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com

Changes in v4:
- Updated commit message for first commit of the series (Krzysztof)
- Collected tags from Dmitry and Krzysztof
- Updated wifi fimmware name (Dmitry)
- Link to v3: https://lore.kernel.org/r/20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com

Changes in v3:
- Add missing interrupt affinity cell (0) to GPI DMA interrupts
- Link to v2: https://lore.kernel.org/r/20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com

Changes in v2:
- Collected Reviewed-By tags from Dmitry and Konrad
- Squashed cpufreq_hw, EPSS and OPP tables into single commit (Dmitry)
- Removed labels from CPU OPP table entries (Dmitry)
- Squashed CQM, CQS and IQS remoteproc-enable patches into one commit (Dmitry)
- Added WCN3988 PMU support (Dmitry)
- Squashed Bluetooth and Wifi changes into one commit (Dmitry)
- Link to v1: https://lore.kernel.org/r/20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com

---
Bibek Kumar Patro (2):
      arm64: dts: qcom: shikra: Add CDSP, LPAICP, MPSS remoteproc PAS nodes
      arm64: dts: qcom: shikra: Enable CDSP, LPAICP and MPSS on EVK boards

Gaurav Kohli (1):
      arm64: dts: qcom: shikra: Enable TSENS and thermal zones

Komal Bajaj (4):
      arm64: dts: qcom: shikra: Add cpufreq-hw, EPSS L3 interconnect and OPP tables
      arm64: dts: qcom: shikra: add WiFi node support
      arm64: dts: qcom: shikra: Enable WiFi/BT on SoMs
      arm64: dts: qcom: shikra: Add gpio-reserved-ranges to tlmm

Sayantan Chakraborty (1):
      arm64: dts: qcom: shikra: Add DDR BWMON support

Vishnu Santhosh (1):
      arm64: dts: qcom: shikra: Add SMP2P nodes

Xueyao An (1):
      arm64: dts: qcom: Add QUPv3 configuration for Shikra

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  |   19 +
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi |   80 ++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts  |   19 +
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts  |   19 +
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi |   88 ++
 arch/arm64/boot/dts/qcom/shikra.dtsi         | 1682 +++++++++++++++++++++++++-
 6 files changed, 1893 insertions(+), 14 deletions(-)
---
base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
change-id: 20260525-shikra-dt-m1-082dec382e7f

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

