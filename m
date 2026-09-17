Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3203BFAFA
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 04:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619878; cv=none; b=XwmB5CPMnD8Ny2m+0aW6d5YFxh+z+PpF6TBWdFzkFscXB45o5euEwwrrjJnBsqFIP4mQwdRLWyeVU2ZXyKurvt0eIURyD4BE+7wOTwiGG5XFlR0zaedLCgTLWAR//4YI/UVmKEw9MLcjoSbBJTaU+O6UtvdAZlo4+yCNgeNVWBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619878; c=relaxed/simple;
	bh=q36LZe75x2kivCZp9AOPOM+4GLHfit33SUz6p04Vow8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nQYcdq5K1kx4Ml1dggocc3Qw1uZfXxrq4puMhcJWSQ1M0QOneSYIiq8K7LfgM7prcwYI0A8xbMRiHmC4vKUUh4u6Wy6Q1YWMuDdINsQiYUAngjHQnyXTnXYgSA8OZ87iJ24wcLWLqV5GrPdJbrOOJgSnwJ6jcIjSwndd+tbFb2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GJfU8mw/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ON9KbyOM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GJfU8mw/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ON9KbyOM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GN1fRK3107058
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 04:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YGUd3GLZ0RHvdNeiIDSYYv
	TGCTSHA5Vfyjiuz44SqOI=; b=GJfU8mw/auLGDMRyo+gJZcWv9GUwJIiQTBr/zY
	jxujLEbt6IBiULmikLfUiXlp22e8BJDli1tmpIM9e2V37ErmEqXLZJTIIPF5Wpcv
	19McHjJB8wFr+zPk32wc5OglqZwS2oVIfbEEKj/vMQUNY7f1VtILEjAn8Lj7+tLg
	yY1FPSczAMaFeUVHVpOXwszMIA2Ld+a3eQBmYyO3oX0P2nsHElfDWnzVBGtPTurF
	Fe15v7frmfgUE2CVt8V7c5bJgMlj0CorLwbGiPgSurLRyLe0s6fWYp0Ws3HuZd8m
	NAZYP2wxhdwqhe6wVywcPYAx+DNUfSrzJI/cHoBzyO8QiaLw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquw2uegc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 04:37:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-396901263b6so814560a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 21:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789619874; x=1790224674; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YGUd3GLZ0RHvdNeiIDSYYvTGCTSHA5Vfyjiuz44SqOI=;
        b=ON9KbyOMgY6r1581k6yKv09wzyRf6QYq5W+yVv/yxOMLnj3FD2U84dnEbZZQ8HfWR/
         p7wQ3pGsYVbEIQbAbBVcWkh+3rSn/NQ0qirSpvoKF1cL1nB5dU1JTF1mUPBCNxJzvHaO
         oxaJ5H8hQjJ+Nut/HBm4Bb0sa9znO/yJFd7+GyH54nUUlmGAnNkQrreNiEhP1QKcxvQy
         VPUb+lqkDIFNHJH8gCnRdLW3nIMSbkjLwWVDVJb60fIZAlD+wZ1+8k+ohUisT9HETpl0
         +S082HwrmZxMbBKuRTwfgawkej1vRGTG+xDZOxXQh/ObdXnA8BqipAT467fK1l7cljTw
         1fKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619874; x=1790224674;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YGUd3GLZ0RHvdNeiIDSYYvTGCTSHA5Vfyjiuz44SqOI=;
        b=ZZU46rxhbhjb7uAq3OrVYW5OETP7+GzGVLNeLHFm8MlVAOQ1xMWXWW70xgs+RduYXD
         ao2j/pEtiMyyL3nBzEE9pRVDjdCMNnEpyuO2xiWQJF8nqn1jrt2iEf6BrW/zH7OKy7DO
         WDp2+CPcViXgbI4ouX1CJlwjl3qO3QaUt+P/pkjqvDmwuQ5POB0zszQGtJHTGtgPcmoR
         be5r+X0jqULHxH5S5F0PuEk8VCripitqPyuRj4r6fqu2vnzHRUZBcqOzXJxiwojMjIb0
         LmSwwNkPrl2bztFo6PhcldpjXQAMOMq28Bi7o+AOIiUwwtOi+bndC+O0kN1cer4Q8zVV
         Jc3A==
X-Forwarded-Encrypted: i=1; AKwUvByTYUJra/W0qoXGKp38rSvqE/dmgyJNwFAAP9fzjkxi7XhnpcyaZ+O3f3/bh8xYsj6MS8sc3j9Ae4rXdCaq@vger.kernel.org
X-Gm-Message-State: AFuF++m0lmLn1wiY71Bf7xUj9OQfD6lF+rKBksN1VyQ3AS9+1VhEhx05
	sMOUesRmAQlUm25SD74Ne305/9NI3jKF4HTFYBx/JPLyQiP18ctEzH0rtSfmTezQSsNzyaVrXpx
	meRnuqp7YbjD8Z1E1Xb0prXAyVihEx3cflkSDifuyFvB6Yag2JCa0motKwvoHfa03WGLE
X-Gm-Gg: AYBFou2Nz70al/maPlsb19vh70MmVlZTDCfODuwJEz4e0KQqT4LHUyoo5aPUdKyEiyd
	gcqN/QaOEXrgr3+POoi79pYXAY7B2piqnrPieD7xTksNGw50E/nuu8NHRtZooipX7XugcQpQtBb
	lQS2bY+AHXT5QbaTWjxumuF6/oo+p9Ss3vGMDdrAv1184LNMoLf1+iwZRnvX/fGtv7lfM+E4e6T
	2dZsbbN65OEvfBjmimEYxDLPVnizTaKN9wSgvfPk1C5Md2ekdYxeRrlF6ka/aqzSPf7CfddwvGz
	sCE0WVokAYGsiZGqMTdmTy7BjbTfMv+FRy8IHphFCH+6vXvYbCx2rb5rSBmDlxliHHB7AkBxUuO
	4Cpzixz4bO0pZjqEka8Jatgk7mG8RwEXh5eTT
X-Received: by 2002:a17:90b:390f:b0:39e:1c4e:5473 with SMTP id 98e67ed59e1d1-39e1e47ab6dmr14505888a91.16.1789619873749;
        Wed, 16 Sep 2026 21:37:53 -0700 (PDT)
X-Received: by 2002:a17:90b:390f:b0:39e:1c4e:5473 with SMTP id 98e67ed59e1d1-39e1e47ab6dmr14505741a91.16.1789619873117;
        Wed, 16 Sep 2026 21:37:53 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a9fd38sm12357376eec.13.2026.09.16.21.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 21:37:52 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v3 0/8] arm64: dts: qcom: shikra: Enable audio on EVK
 boards
Date: Thu, 17 Sep 2026 10:07:29 +0530
Message-Id: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAItuq2oC/5WSS07DMBCGr1JlzUR2Xra74h6oisb2hBhI3NpJA
 FW9O0naLBAglY2lkWa+/yGfk0jBUUz2u3MSaHLR+X4e8oddYlrsnwmcneckY1nFFBcQW/casMb
 ROl/bIQLTspQ5U6rIMJnPjoEa97Einw7XOY76hcywcJaN1sXBh89Vc+LL3oZnWc6rIku5UIUqJ
 HDofItdhzYN2Lg0tuheH32M6WnEN+O7Lp2f5HC56gQ6jXOC4SqeaIwEy5Ib9juqKC+VUEIIu5j
 oKEZc4+13N3UOY9S3gDAJmCQwkCUnKrRhROan8l+gG2RtyfhAxsBUznE0a0yOWVZyg/fS2NZ59
 GNv312gOo7How8DTNnssFHSKKwIOfH/MqFD07qeFtIKU7qpNNpSKivvhQlAa+vN5GYtX6zNtQl
 l8oLjvXGZAF3ACV3zrcSlPgaVlWiVxtKo5rdvcPkCiyWY0NACAAA=
X-Change-ID: 20260917-shikra_audio_dts-0b858309942a
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789619867; l=6039;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=q36LZe75x2kivCZp9AOPOM+4GLHfit33SUz6p04Vow8=;
 b=09S63zxECT8fGo4Feyf6KT/qG44iUNzRjz2PG97x/hp7NpDCpGWndbevx9kG4aWloLKqD2Glq
 zHDd8y6ndrfB6zY6pVkYiDQOCZAcLgAreYj1h4IJx3FXWJjuPwrVo5A
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfX3Dg5+gV99DIS
 EVPyRaBA4y+1VwAxaOuKJ7P4Pkocl64ZUJ+c4Pkn6lTc1cE8V3BUykVNNkuDawEhqbo16pT+x9P
 wSSgxjN2bijOEwoYsBWh6BxANBjOqD0=
X-Proofpoint-GUID: OXSF0GTpiKHCToYnkCKjCKzwI-ZKa3-P
X-Authority-Analysis: v=2.4 cv=N4m8hG9B c=1 sm=1 tr=0 ts=6aab6ea3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=bE3JMByYCCvey9M91WkA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: OXSF0GTpiKHCToYnkCKjCKzwI-ZKa3-P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfX1CNwLDuG5miX
 p1pgngINvj5RW74KK9HksQQCYIrg1VeAHjZHeI7YtuDUG4lkwQQi074S5TxL3uUnjDnKirvd+3c
 IGNko9VXU23pQLwipRL2qhzj3wvqwFoD+bY1NT0RsSEdXWgooucgQ4bspcy6DwQArS/5eZvD0ZK
 4mox77qJjK905BeMUfYlSn/iivOM6UiWvJSLyaaTE7muC7O2bznmPm6goF/nfjv0nLQPlmApoE0
 xog+QZs/+1WmF/ai2Jdd4mJKxTe17iV3Hq5YLVPcWe1DPrbmfm+sYF7mHJuQH6yFw4kSpUImjWM
 8i94uKSMofq8IpozVa8hSlbAAy5TXK+35uFx8SmUM0rmuh2QIk6vLC68XM5KWbdpSFR38u1/2J5
 YXEg7/mvWxPwH26xk8YAz/LS8Y+XNLj741y/NV+81KCMhaoP1lPAtdWOtnnl6LEGbHg7KvgzX9i
 DDa31Nvn0B0X5EU8Egg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170056

This series enables the Shikra audio path on EVK targets by adding the QAIF
CPU endpoint, GPR/APM/PRM services, SoundWire and LPASS macro nodes, and
board-level sound card wiring for CQM, CQS and IQS variants.

Shikra EVK variants use different audio components and processing
architectures:
- CQM/CQS use an I2S-based path with WSA885x amplifiers and
  PM4125 + Rouleur codec components.
- CQS uses modem-DSP based audio processing.
- IQS uses a third-party MAX98091 codec with modem-DSP support.

The series depends on the following upstream patch sets:
- SoundWire compatible support for Shikra (v2) [binding patch got Acked-by]
  https://lore.kernel.org/all/20260910-shikra_soundwire_support-v2-0-f98c9a6ea1e1@oss.qualcomm.com/
- Machine driver compatible support for Shikra (v2) [binding patch got reviewed-by]
  https://lore.kernel.org/all/20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com/
- RX/VA Macro codec compatible support (v3) [adds Shikra-compatible RX/VA macro support]
  https://lore.kernel.org/all/20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com/
- QAIF CPU binding and driver support (v5)
  https://lore.kernel.org/all/20260907-b4-qaif-shikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com/
- USB support (v8) [got reviewed-by]
  https://lore.kernel.org/all/20260911-usb-shikra-v7-v8-0-851ee4bc0eec@oss.qualcomm.com/
- AudioCoreCC/CSR node support (v5) [AudioCoreCC patch got reviewed]
  https://lore.kernel.org/all/20260911-shikra-audiocorecc-v5-1-b0fc3a2251ca@oss.qualcomm.com/

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
Changes in v3:
- Rebased on top of AudioCoreCC/CSR dependency series (v5)
- Dropped v2 patch 2 and moved it to the driver series.
- Updated the defconfig patch description for better clarity.
- Link to v2: https://patch.msgid.link/20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com

Changes in v2:
- Added GPR node for audio IPC
- Added QAIF CPU node
- Link to v1: https://patch.msgid.link/20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com

To: Srinivas Kandagatla <srini@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Mohammad Rafi Shaik (8):
      ASoC: dt-bindings: qcom,apr: Add modem_apps GLINK channel for shikra
      arm64: dts: qcom: shikra: Add QAIF CPU node for audio
      arm64: dts: qcom: shikra: Add gpr node
      arm64: dts: qcom: shikra: Add soundwire and macro nodes
      arm64: dts: qcom: shikra-cqm-evk: Enable sound card support
      arm64: dts: qcom: shikra-cqs-evk: Enable sound card support
      arm64: dts: qcom: shikra-iqs-evk: Enable sound card support
      arm64: defconfig: Enable Qualcomm PM4125 and WSA885X drivers

 .../devicetree/bindings/soc/qcom/qcom,apr.yaml     |   4 +-
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        | 199 ++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi       |   5 +
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        | 219 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        | 144 ++++++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 256 ++++++++++++++++++++-
 arch/arm64/configs/defconfig                       |   2 +
 7 files changed, 827 insertions(+), 2 deletions(-)
---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260917-shikra_audio_dts-0b858309942a
prerequisite-message-id: 20260911-usb-shikra-v7-v8-0-851ee4bc0eec@oss.qualcomm.com
prerequisite-patch-id: e2effa4c5f8618850fe8605bb27fe3988853b0bd
prerequisite-patch-id: 0c36aa1d8fb2d428f9c09ff97103b903be32e6c0
prerequisite-patch-id: 00c2a051a784b4a208877f4edd91ff90a0818dfb
prerequisite-message-id: 20260911-shikra-audiocorecc-v5-1-b0fc3a2251ca@oss.qualcomm.com
prerequisite-patch-id: 452a71e3b751420f1ec3ed42cc75ce509b9a0976
prerequisite-message-id: 20260910-shikra_soundwire_support-v2-0-f98c9a6ea1e1@oss.qualcomm.com
prerequisite-patch-id: 1ddc51582586120795d86a2ff9f0aef20c0e891e
prerequisite-patch-id: 49e332280734b84a1819e52ea7905fc72fb946ba
prerequisite-message-id: 20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com
prerequisite-patch-id: 99245529321cadedd30d9e38845b53dba3725de8
prerequisite-patch-id: ec6621f8f392aa46f365eae91a3a0f66b1628d0b
prerequisite-patch-id: 3da6653022d716bb81b440cd472bd464082eae24
prerequisite-patch-id: eb9cd5e7ba7fc4ea86f758e127775c70dfda59c0
prerequisite-patch-id: 648c31f694cc711154d2cf2137259f39a398be74
prerequisite-message-id: 20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com
prerequisite-patch-id: e6735f29343dd80d0e7ad48b6874eab4a5d7efc6
prerequisite-patch-id: ac7bc5ad958bb392a57871dde1f79c2fc520d482
prerequisite-patch-id: 332b888996b9d6c58e8c90eada37dc14137755ea
prerequisite-patch-id: 5c892af3c82a2f9aa4162415d047bbe96d5919d1
prerequisite-patch-id: 6dd0ac28a23ec04024b50798d5a1ed84f2192b07
prerequisite-message-id: 20260907-b4-qaif-shikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com
prerequisite-patch-id: fed9c089602a2ca2c9b1d421c08c20327bef3010
prerequisite-patch-id: 6088996635d7f8aadefceecfd7dac583913a9483
prerequisite-patch-id: 1740ab40c09b0211cf91a7f64c63d5970dc0a006
prerequisite-patch-id: 58bfb68400119eb51b9a5d95d404894652096f85
prerequisite-patch-id: eb22641112bad2a24e9991fa8077ac0383e3c4ca
prerequisite-patch-id: 961e4e8c5b4a3a551e427495096203c8bf2bd030
prerequisite-patch-id: fe8b5f03b7fab8a1732041d1c0d1d4c09d6839c9
prerequisite-patch-id: 2ad40030bb03f282327fce0113a1ef45236c91da
prerequisite-patch-id: aaedf5dde2d73641fc5d8197903a97c263cb506e
prerequisite-patch-id: bc3f8e1b37f26a366c74743d5d6de50ee5f9f0fa

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

