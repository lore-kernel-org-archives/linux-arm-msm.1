Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611285;
	b=hvfBMsmFGx7gBcm/V1R5lTiIcZas5krbm2HzAYOr1mt+Y2AcNmN8gfLKaDd+GFpmsiOB
	 ilcrJCL5Z7n54j67caK03aWuhoWR6ogh3IZHiUP5TAejG9OvjLTO937sUljTuSbRN1H/N
	 p4ZnbRzvTlVnmVqiR3nMF5Lfx8gIhMdo1nvvNRvaaQVMGUOVecY/GC82Bm6VItDa2MWia
	 2VY1amjHHpv1D4da/elvHkM8dUOJ/wQqCt9un75MPo3OqHDKgNbokesmt6ZBlLyr0EJzi
	 Yk8wwfzjauyZHV0UB8W5gOGymYBpsFlSDFQqTFUrtNTHYezN9XHbdnU0eDdwPexgBYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611285;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BJDioDDua+dUwIQK+UWlYGAtjamz3gG+eeXOxwGF//8=;
	b=XafAD6GPVdR5I8Bh3Q39Z8f+pqOXJMwCDKG1d1DokgGVAwvJropBzVCv3SznDo/mGjIK
	 gdm0cmSLnSAT9UfJx2nu1BG+2kghpiuyRBka9pgy5iNKRPIYjZgt3NFCBiZvugtDqC6H7
	 B0oNFlZ+GIMgZaFFdDD+SGNfj+5XgkZHiDu02Ie3aeucQbbC7k8//U2HILod7n//Fn1Lc
	 H0Rac6sl1YxlQkGnLGGPTHw+rKaUSgyiBQe1eorAxPb744UMc7GIISLW3i4xWzenrZO2t
	 /oRM0SQAWLTjVWTKsN1PAZoalKKdtR50aBhkazh9E7KHdwQVnCFR1zL3zkrUqmIstXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MqZOZgwD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Su0FrEX+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F34A606A691
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F34A606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MqZOZgwD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Su0FrEX+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9moh63611866
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BJDioDDua+dUwIQK+UWlYG
	Atjamz3gG+eeXOxwGF//8=; b=MqZOZgwDVziczld/GfYZpMp44aNhRNosX47+2N
	il2GNfBe3yFidPC2ichCj1scg60Acm8dFkA31gItY12J+jBCjoTp8WW4XKL/UA9H
	bsxLwYIYFTuxq8q4yOi5bRJPzDdUae637pPbG+x7E7KwaWevV/5MVVmkOAEbVlXf
	wzLY5NNlbTA6URf8147zU26teWkR8cisVcZSHYl45n0hcrk/sD6/quO6TPrso6hT
	5mAUb+8oQhrUmTzYAtw0Z/REXaiWg6VV0fiu2SMMX0IXJn8ivw9EagVJGJuR7azF
	+06wd0Eo0NQO5K9g90cEaBL5s/vyNZlpjmLVHJDURNZBsq5A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsbpxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:54:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f0a0afb55dso4221705ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 04:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795611279; x=1796216079; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BJDioDDua+dUwIQK+UWlYGAtjamz3gG+eeXOxwGF//8=;
        b=Su0FrEX+qUdl9PMdA5EUuA5XSO3mAxzvwf6hDTDHNwvMDUbXjv/M4NLQxE9lng4uyI
         Iwn79H8YXskjDtyA9/CJ9kA2mAwZTtTJmRBK6VvEo9K1HLG1fWuScHL7mdG1SkwOIElg
         K5wkeqxFwfiFkomXwAW54j4MLRYoi3442tM5HXnV4vtbLrfXTeNMbqTaCP27nSB4H2g9
         D0YIBnMf5cbwjCFoYlwR93wwwvDKChXOatABAtzoF9ZY6SnRPeqRcy3zfWPJoYQ9jqX+
         Pm6gZp75pxLPsinJPtsvGIcXT9JpNmq1oRBd4vzg01/hvRX5yKr+rXD7DgYQNHivDrV4
         eNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611279; x=1796216079;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BJDioDDua+dUwIQK+UWlYGAtjamz3gG+eeXOxwGF//8=;
        b=l4oF82rUdT5BEbgXZzz54reLuJDyzc2CyMgxehDUqDBfpjJntosfBU88+1bIspYYiS
         e28IRGVe+JyAZsImB35hVCieAWPWB3wr9bA8NgmUpzCDLd3+WqPownxEf18YddAX1p0X
         SOhLj26jaKmbdy49zlbGD2SOdn+ki+sPsjgndrKBQ90MTI+/GAMCWxilDkft1G37KXKS
         DjGPZInAJZ/vHz/+5AhOA0qMOyDwEGKRMzoSGjgWYYVSfR3/4tt1Hl/8zZMJIns1czi0
         d7Y0aj9U7/8KqRVenDOmIWIQJ6BVZjCdhwSzRFjwPvah2BzfIaMnIxlAvAcMv1fV5apH
         uOWQ==
X-Gm-Message-State: APuU4Z8oMCGy8tQBa6GemR/stdY8WMz4jNCat6Faurd7o12himvw5BuJ
	I3lW3mDGZLYxbbWVLE81NkbCeIAllmdIGaoD9GE7gMYRhGYr+F/P0+AJZWRu/1AWGeJv3UI6JiT
	IuvhpBtMW7m8T//Syd6V0DFA5b277Jo0Fhr/jcTT8FjRllHQglYAvTuEfZ/ld4bcOE2RP
X-Gm-Gg: AZFdTZe0Ber5w1DsqdsmPznnLWlL16TlCpQ0o+J7mEgygwAwqbJB2SftbESal/0D0tC
	L/l2wPLkl6sLkUswXTCSBdHvHKkVLmy+abOicw/1JgP7CgOdT3vVhIzBo1fNNpU1IaPTQBOVXsR
	JLeoumOsH/nf4mxGbPG6hVKwaly72ajqgZ1vdHl3pVs7ZIc8ARObeRPQrGBzCcRYX2GOfxHQ5cN
	7sGoj0XadUeAKJSWKHtsI5TsX/VSCK27Dl9FS/Z36MJlv9TM8SQF0cl96pjX5KiRfxeqynin+pl
	arBy+VX4Buif5rzt2nDPPE144y1XnULwa7CRdlQvJJQZnAeGhi7VbcYJUSd3FClRXK7V6D1Gu4x
	mecW2c31Wn5HEgKPq/64A4ZU4LiwwuPz4uDn22cFSGqXtvI+fNqf75ciq/2RkeOrpxZ710lekyF
	TbdjGwgiWFDNjY7OYXoyFQCF6i0oj0NADbbD/wjr+AKBSPA+fKl9N5Q1v7T/QkMGmd9A+VeO+4Z
	jiMYiyPGdH3ykeiJy55QZRpfzvr
X-Received: by 2002:a17:902:da48:b0:2ed:29a5:782d with SMTP id d9443c01a7336-2f03f1903b3mr290972555ad.2.1795611278910;
        Wed, 25 Nov 2026 04:54:38 -0800 (PST)
X-Received: by 2002:a17:902:da48:b0:2ed:29a5:782d with SMTP id d9443c01a7336-2f03f1903b3mr290972175ad.2.1795611278463;
        Wed, 25 Nov 2026 04:54:38 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b58fce71sm31940575ad.45.2026.11.25.04.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:54:38 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Subject: [PATCH 0/5] arm64: dts: qcom: monaco-draco-evk: Add display
 interfaces and overlays
Date: Wed, 25 Nov 2026 18:24:24 +0530
Message-Id: <20261125-monaco_display_intf-v1-0-8a27d60b0d94@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAIDaBmsC/3WO0W7DIAxFfyXieVQBElOiadp/TFVlwGxISWghj
 TZV/feRto/by5WPJR/fKyuUIxU2NFeWaY0lprmCeGmY+8L5k3j0lZlsJQghOz6lGV06+lhOI/4
 c47wE3jtyxu89BUWsXp4yhfh9t34cHpzpfKny5bFkFgtxl6YpLkMDvjVKIRnfAegOgRAU7jUZM
 mg7ApCgW2c29USl4L3V0Lw+S6lnKe7zlqvkLVdEykql+yDgPZWyO19w3B7uarz9bxoXUwfHV81
 XYapIBEvSattLIf4QHW63X4p/oWZEAQAA
X-Change-ID: 20261124-monaco_display_intf-5cec9d8def3e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795611273; l=2959;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=UntkIqu5gtOG78Y3H+5C9JxD3OMVpiptaackWjar/4c=;
 b=0nAeV7G8mBlu622PkRUYOCkewMlIp3G4sknwMpUynLAeukdjnR2qA5sethiRIAgUNDoO65VXo
 WYhoL4RQxd/CxRoyuGdzkQKGrtjnvlw4abGNtj0vict7xJykKLWik2H
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: Emwg1p1XPL0Q0FEVsvBjso7Sad-QkoAY
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b06da8f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=p_bOUqcuj8HARrLJNMsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfXwDIvUXWV2ONb
 WxF9LMCAM1Iym36UWhSJaHJGrLjIU4UaPS0uJYF7kI9avzqCqL0a1BiGvY7qzZlw46RLGeba7iQ
 wePsHK8M/imzpmqUUkZ8C+DK8kiuW2Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfXz/BRwIQAuLoN
 q28ENsD+oqY4MwgkmCiMFyh2aLDda4ZIYD6SzhnJnzyJzD782SvygQ3zvUuQWklXKjN0KzbmvBZ
 WFINyYHr6Xo93FJa0KMLCY1FIi9FkhDrZ3lU0FgDsuKrrjfS0Vp2AWYDivvUWz1eeh9yuOEw+4V
 lUde/KSVzxtvKjoASO43f7N8OCP9/dIRpyZGr6+0VTLEDvoRcED7yZEhrX/ws3BxuKc+caVTJLI
 oe7fb7icx364wpaBGBjEfOC0p808XBP/HPNWm0YMCwNa1QzRbWZq5LBOee48c9rzCmEOe8jGxt0
 RHFl+hxyi8HbowLRs0Vh5D3d5uPv55GsqVek5vn7majGhfxCNcGcBw95Pbc+/7E//y7UTCz0Y0r
 6crm+T/9Qeej46Jbj4ZHfOirkSfd04KTpnPwcLpam/8pN5eaRsBxIcdP4PUi0TCANZg6Ix+++pG
 9aHmJA5o7hDmKb8vI8Q==
X-Proofpoint-ORIG-GUID: Emwg1p1XPL0Q0FEVsvBjso7Sad-QkoAY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250051

The Qualcomm QCS8300 (Monaco) SoC card is mounted on the Draco EVK
carrier card. The DSI0 interface of the SoC is routed to an I2C muxed
display connector, to which multiple display daughter cards and panels
can be connected. All of them share DSI0.

The below display interface is enabled by default in the base DTB:
  - DSI-to-HDMI using the Lontium LT9611UXD bridge

The following overlay DTs are added for additional display
configurations:
  - monaco-draco-evk-dlc0697-dsi: DLC0697 DSI panel based on the
    ILI7807S controller
  - monaco-draco-evk-raspberrypi-dsi-7inch: Raspberry Pi 7" DSI panel
    with Goodix GT911 touch
  - monaco-draco-evk-waveshare-dsi-8inch: Waveshare 8" DSI panel with
    Goodix GT9271 touch
  - monaco-draco-evk-lvds-auo,g133han01: AUO G133HAN01 dual-channel
    LVDS panel behind a TI SN65DSI84 DSI-to-LVDS bridge

These overlays are applied on top of the Monaco Draco EVK base DTB and
disable the HDMI bridge and connector, as DSI0 can drive only one of
them at a time.

Dependencies:

- Monaco Draco EVK board support, which adds the base DTB:
  https://lore.kernel.org/all/20261123-monaco-draco-v2-0-3ee3b2375f16@oss.qualcomm.com/
- Lontium LT9611C(EX/UXD) bridge binding and driver:
  https://lore.kernel.org/all/20261123-lt9611c-v7-v19-0-1fbe2b7b5211@oss.qualcomm.com/

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
Vishnu Saini (5):
      arm64: dts: qcom: monaco-draco-evk: Enable DSI to HDMI output
      arm64: dts: qcom: monaco-draco-evk: Add DLC0697 DSI panel overlay
      arm64: dts: qcom: monaco-draco-evk: Add Raspberry Pi 7" DSI panel overlay
      arm64: dts: qcom: monaco-draco-evk: Add Waveshare 8" DSI panel overlay
      arm64: dts: qcom: monaco-draco-evk: Add LVDS AUO G133HAN01 panel overlay

 arch/arm64/boot/dts/qcom/Makefile                  |  13 ++
 .../dts/qcom/monaco-draco-evk-dlc0697-dsi.dtso     |  79 +++++++++++
 .../qcom/monaco-draco-evk-lvds-auo,g133han01.dtso  | 147 +++++++++++++++++++++
 .../monaco-draco-evk-raspberrypi-dsi-7inch.dtso    |  97 ++++++++++++++
 .../qcom/monaco-draco-evk-waveshare-dsi-8inch.dtso |  94 +++++++++++++
 arch/arm64/boot/dts/qcom/monaco-draco-evk.dts      | 114 ++++++++++++++++
 6 files changed, 544 insertions(+)
---
base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
change-id: 20261124-monaco_display_intf-5cec9d8def3e
prerequisite-message-id: <20261123-monaco-draco-v2-0-3ee3b2375f16@oss.qualcomm.com>
prerequisite-patch-id: 6e31934c1ab65ae2ab7a9e7f0a3ce1cf2e4df9bf
prerequisite-patch-id: f3d2572189774e17ef016652733bb7a33375c0d8
prerequisite-patch-id: a1ffa461060aec6d03247fab5d6c1422aa851e11
prerequisite-message-id: <20261123-lt9611c-v7-v19-0-1fbe2b7b5211@oss.qualcomm.com>
prerequisite-patch-id: 49f1e01bb5594ce9c4301ce4b16715834ece7f41
prerequisite-patch-id: ac9c419ccfd8b3816e05867d6b09ad49ccf12a24

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

