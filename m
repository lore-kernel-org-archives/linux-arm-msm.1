Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695114;
	b=x8mBo/0uPACBpogh9viOKw0nzYIrkOYtHW54WlaIYmbsxGAuP7kjQAg6TYE1Sm/gUINy
	 7qH67Ecc/neZLFoqmrWXigbqD7CyPQK53SebV5UYDnTkn9F3/ZDrni8OU4OwdJjE4vuJL
	 kIShnLMKCSC2Xov0JsiKADKdxhGyq7Xn2+4qnXuhMZvjYivuPJnAWn/uurHmGHmkM04b4
	 5J0V0BNF+BP+SZEiNsUDJvQWeqRhJ3q3VDEDBHmY9cUapZWD1geI5275tItDhVfjQ/Wvf
	 Ag8gT1weP1qGwSXJ79H1TlJwnRQMpWnD5RlTyduJV+/hgIP05Xao4GT9ewoLrof4tlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695114;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6YcqAiMhjLIcHfIkqluvjER3LnqVCQYeKkQbLJ8BJqM=;
	b=RuvfGFzNHYGHGkZw8osMvlmBD7lGCBJL1YMchnHw0dVr3v+atLOnw9hca9GDqSi7gt2/
	 9l7l8xYgCFNqX0GQTYQ3JvI91OsZeJnuhnq9snugyd2SoWWnQ1Nk91a6nxq8ERf7v8RGb
	 Fzcq4zN8RBRQs/2IlBLL6kLxhMoC0JTkdFlko8RtUDmrP7CEW75zgZgUPOUsWykFg1McB
	 kxHM1yH5+WPtPLLf22xmd4Ftfx8M1+zeGTZpuysUHNpvQ2QUxHiwLcrxY6VR8Xw0pBNE7
	 SHyJLtyqvcaT+KNRQAn5e4caR4V3y1vzPeM+iOFbTEVF25RnxCOU+7svDzw5cyRZG+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R4NCSVD6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XlnjWHCd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C525606A326
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 12:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C525606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R4NCSVD6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XlnjWHCd
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVUFZ2911777
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 12:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6YcqAiMhjLIcHfIkqluvjE
	R3LnqVCQYeKkQbLJ8BJqM=; b=R4NCSVD6joHRx5pwlHZETz6Subt0+tJ1TzyaQs
	vynses9Pl0D4ZN3clt9/1O+H2a5eEcahne2X4D+rj21ezBeK4tFCdTclcKRDHie7
	FK3wIyXnUFjP33TS1A3mnypdc2JNPlzFrqJ86sH8EjGZPXE25P1FvrmJloRhbAdn
	+uAWzJHK4bxmkvsgGJ2I8hS6VuuriR5AAOsuDPTVK4ZSbDvP4kWfbWitH72ivrZl
	TdM0vgAZsVv65s0Oj0f0TQQF19xd1D//hBTYfRWGwh8AYyidbe4qzRDPN+0RCgQg
	fpQUPzdmm9b9QxK0ESU8M5f6fbXxPC8YmmPKEYlrzbodW7JA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak026vx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 12:11:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f20addba1so1038800285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 04:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795695112; x=1796299912; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6YcqAiMhjLIcHfIkqluvjER3LnqVCQYeKkQbLJ8BJqM=;
        b=XlnjWHCdZ91Z6lpCkxS/UGi9x22G2f6OdYlvzjg1B22Qo81jgKpNoBWSqi+RIqu6R8
         RgDfaEBl9yIFjnQt73CBLc8JrAiaLAU7pKQPn9PrLEAbnHNUvFcOxW7eaGsgDWcw+hMq
         z+BF1c9px/ncK5rNuhg/j3VfEgUPOs5+zvm95Hncz1MbqAgY92DBJXKAVslgonBzqitX
         Krmauk/IyO1HLzmpIJ69yuyb8LwiGl2hhB52TH2NHjfXaSGfcxOv+AahgbRQwBx67Oxy
         AEvbBclX7M2IJoqAbeozsvzdxCGR2uUEUx4JyRcRo49Jiv5USPiLCPxJ72dAaCKn61Rn
         Tl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695112; x=1796299912;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6YcqAiMhjLIcHfIkqluvjER3LnqVCQYeKkQbLJ8BJqM=;
        b=awmYDaMPq5bYMqfsoIJs1T112uvXT8mF7dhOnBpD0yfZZ86gC9YPfDchnRdaidriO8
         N8/CO+uQ+LIzYwjkHMGEVH8PKIlfoHUtDHJxCYTNfYd/Wj3BkCuVw8W51Mz/jTgYaehW
         50DzGvGPu5htbvw5/QjQc3PX159QqW6xUeEJiVI2K+xq8baBMMrHM4b8alZGfm6OlWsT
         4eM5f9mswBT7f/g0XlMtoIf7hVdnyujjPZTMAeeYY87Oaqnuy10pssvCAYMW4khE6mGp
         yQxaL+QnpI68REfIIIA7/enh1fzLL130KgX0Sd2GXCspe+Jfmzu/UapraDIw2sqr2zGj
         Cxzw==
X-Gm-Message-State: APuU4Z+HUEgIyfJFa+5TFOgNBTP2YGpZp50Yh8OG8O+iitrshXtjEItb
	mK4Hs/TCQv0BZ/IqFhhAhxtJBQCnwgmZORQiSgxBBNXy0hFrRSNJPsUp1K59sghJae86gWMRNiN
	8b6TRTH5d+rADWj9wM0ms20iYAEwyVUByXmt58zwHvRtuIOmp4eaDxsCdHPgEH0Sf+ZAYo5N+2t
	ia
X-Gm-Gg: AZFdTZfnLmQ+2emua3lEH4hXazC52n5oj6G88Mhx5+FIpwZr0x94mkX8xoLIfguQITd
	8XEiv5fpIcUjaRtgHh9DNR7xaCIZOLkYxsUP6CkbK1hy7WYGQZGPNYrcAJMlJb/bXdkAq/0TBbl
	mc4eNazdF44Cjs6XQZgym1A3S9Skqy4ZLv5zCaKdE37VCwavcywaxGMf+SowaTGauGuiq/FyfVu
	yLiOLJBxjCZB0tO04Y2lACBImY7/D0jKHs9ESW10CR2YOtw04i4G0NqoDJBeEhf9vb5DRQfftvX
	hxKv0Z2RHT1wcQkUODlgMt3SyE+d1x4Zv0k5hRMML/rwTSVrMF/lgwdjte9XTUuiyh+p65ht1ou
	npSDeR86aLc30gEa/XoqCByZkUG532/xy3qWEryPS3L6FVNjJdMguiSUEgEW/kZpgoju3stIB2W
	EPLCa4JMc2yttd
X-Received: by 2002:a05:620a:4606:b0:93f:22af:cce7 with SMTP id af79cd13be357-949ba7cbc42mr3765732385a.12.1795695111758;
        Thu, 26 Nov 2026 04:11:51 -0800 (PST)
X-Received: by 2002:a05:620a:4606:b0:93f:22af:cce7 with SMTP id af79cd13be357-949ba7cbc42mr3765725185a.12.1795695111286;
        Thu, 26 Nov 2026 04:11:51 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8f70fsm748736566b.40.2026.11.26.04.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:11:50 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: agatti: EL2 overlay and QUP
 firmware for the Arduino UNO Q
Date: Thu, 26 Nov 2026 13:11:38 +0100
Message-Id: <20261126-agatti-el2-v2-0-1ed468b4c52b@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22MwQ6DIBAFf8XsuRihSGtP/Y/GA8FFN1GxQEkbw
 7+Xeu7lJfOSmR0CesIAt2oHj4kCubWAOFVgJr2OyGgoDKIRinOhmB51jMRwFsxeTHPubGukVVC
 EzaOl9xF79IUnCtH5z9FO/Pf+zSTOGiZRtHZQ0vLuench1M+Xno1blroM9DnnL34ibnyrAAAA
X-Change-ID: 20261126-agatti-el2-f7c039f5c4f6
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b082208 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_Zj8K6houdA7szA-FsQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: yzSLAHRiyvVN4DjApnOgTy5x13WOwhpF
X-Proofpoint-GUID: yzSLAHRiyvVN4DjApnOgTy5x13WOwhpF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX/0j06X5MqzD0
 4TlaSa56xw1M4tGQIbZuPDsZhcmC0sLLD0ATpo75NTnQc8eeepohgy+p3K1CrvY/RGTpdlm2kZG
 Mxc/xIbiZwNgAmTTmk9pi17k8xa+PZHIwa1WZRWgYMB+JnlU9dpfUs2aMEpYHT5U9WHbNJXTaOS
 vg6TwEVjmsFwoUQ23//6eBwj2LCifjYSU336uwkoGG/NX1i49nmePvNpU2xtMbZXZAs21fR4y/V
 Ib4Zq1wa23nMYBOV7NI5hLzvlOzxVMnj6xGjiLvwQ61QEyONZp8Y0O8LQSlzFQNY/9om0yTp9Hy
 LjeQxg7HOFBwLPzTm2LJc7bpR50+IYNomVL2LuSVICLN4iqtMydQQOa/m+PzFXXaxJJhjovVObz
 Iswx6ebOgFxSjjaG+JC9ijEh8p7zA3Mex5g2kzxOOeGfmnpBI46lPmjQVTSEr+Bwj+F5OFMfB4j
 Mgp+zZI3b6Qw+/Sxo8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX5//xH9GVhY2w
 CfRbmwmphv5PTzfBs4EqSA6WD1/2glVxWX31f1lHEKROzxspO2RVetO4Fp7YFFxdF0XQBr/rBWA
 nBBMbHrW58pL6drt8R3djFf1EfDhKZo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260047

The Arduino UNO Q (QRB2210) can boot an open firmware chain: TF-A and
OP-TEE in place of QTEE, no hypervisor, so Linux runs at EL2. These
two patches are the DT side that this chain needs and that does not
belong in the base board file.

- Patch 1 names the GENI QUP firmware, so geni-se loads it when the
  boot firmware has not. Where the engines are already programmed, as
  with QTEE, the drivers do not read the property.
- Patch 2 adds agatti-el2.dtso, following the existing -el2 overlays:
  zap shader off, SMMU streams for the ADSP remoteproc and for the
  WLAN firmware (as kodiak-el2.dtso has it).

Loading the QUP firmware on this SoC also needs the geni-se fix in [1].

Tested on the Arduino UNO Q with TF-A + OP-TEE, Linux at EL2: I2C, SPI
and the Bluetooth UART probe, the GPU renders without a zap shader, the
ADSP starts over PAS with no SMMU faults, and WiFi associates.

Patch 1 was also booted on the stock QTEE + Gunyah chain, with and
without the property: the same serial engines probe and the same I2C
devices answer in both cases.

dtbs_check (qrb2210-arduino-imola, qrb2210-arduino-imola-el2,
qrb2210-rb1) is clean.

[1] https://lore.kernel.org/r/20261114-geni-minicore-v1-1-a825dd549664@oss.qualcomm.com

---
Changes in v2:
- Squashed the WLAN firmware stream patch into the overlay patch
  (Konrad).
- Collected Reviewed-by on patch 1 from Konrad.
- Link to v1: https://lore.kernel.org/r/20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com

---
Igor Opaniuk (2):
      arm64: dts: qcom: qrb2210-arduino-imola: name the QUP firmware
      arm64: dts: qcom: agatti: add an EL2 overlay

 arch/arm64/boot/dts/qcom/Makefile                  |  4 ++++
 arch/arm64/boot/dts/qcom/agatti-el2.dtso           | 25 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  2 ++
 3 files changed, 31 insertions(+)
---
base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
change-id: 20261126-agatti-el2-f7c039f5c4f6

Best regards,
-- 
Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

