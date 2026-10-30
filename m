Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353218;
	b=4lfDagiLu+fQdwU2KR28qtOiVoX1jZRC9TW8QoMuRQoh7+2kihfW8EKLm83XfGIUg47p
	 D9GOSmO2opPV0xXpkr3ZXKtD+sGpyFEeKL8ypyy9b8rrRkLXOQqGtsHaTiE/HmxC2GKyW
	 tlrODgdPn/ZYhDD4hhTBt94kbramiCm/uuyUkRo2BfezqMxwL+nCJIzMHf0WYUsRdwF+l
	 qrkdr3cbdEtxBulhTcQvIpfEZEdxa4Fydf+70EmB5mdH7lXzjjU49TonEH0vkFhPMAJY3
	 CFKrbYWtC7xAWzp4aSwB+sHIpmnT2hpEUPVSexALsLugG6+Znaoj8LSf++EvRCN7xKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353218;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CfivT7f6AzXhM+eASp8z6BDLEz8vb+/X/mhHCdqRcYc=;
	b=otoTat32mnlIXplR1AV2aRe4oH4nGaJQV8wHxKPPYP6gOcAv26PYZeeRKIGcMpAM7sQu
	 7Ic/yssxxJvG1FVLNPIRVpD1tLgspyMzA+of8IYgIBC4wHhFN0Bc9guGeDJVPhj41opP7
	 4bHJ92iNlJIOc5uNk9ySWxsq2rYLBa8QBk2v1jJy/IKZQgYkWWBTXWvcDCMxdrlXRnkYm
	 9gxdQmVHSQwTDvOrStTeIIM96IY3+xhSQXv0pX+xKjbUJlmcjcdr3amOAjGon9qRFgQ9e
	 aViRQDd6CNFoH75KIlOC72NicFni8np6CJP+LbDXwnu49pGUTPaFBjK/V5wLKI+1Qhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V9QdXPMo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QpoTlSLW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F381C60A2605
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F381C60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V9QdXPMo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QpoTlSLW
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F3ZF1761962
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CfivT7f6AzXhM+eASp8z6B
	DLEz8vb+/X/mhHCdqRcYc=; b=V9QdXPMonMVn/SqgE8m+cs9R/C92q2Z5sFW4+Z
	PO4V9mpFxa+SsfWMNijM4lGNQKgGT7fxVvrEsP/Mtvsre3X9MRgklJiz3BZNSiq/
	eNWKN/JlZ/FSn6yTWrpHZE5x/GHbQNfDLsg/b5Du79hXUe5Xh+ozuTMzG98L752m
	A10fXKAXPutguijTR+9XVtD1ArOcMZ0sltvmmSr7HXh/mLC2fvNFX6jCrULMKlVR
	4ahr/KebIP1ADrDpnZFPaoPxvEPBnXZ7EdbUUKkwgIea70kEzdO1XZfbMJ9iWBe7
	Rpl+Fj09LqGjPbZGK+hcz8q1IFcnyJOtPOR1xfBEwCoV/8KQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pa7xm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:40:16 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so2453963eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 02:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353215; x=1793958015; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CfivT7f6AzXhM+eASp8z6BDLEz8vb+/X/mhHCdqRcYc=;
        b=QpoTlSLWoe7raMlnl0XzzbsjcJsEO1qr5Y96oJow7FT+RKJcoiog6KScaE5ZduFohd
         5QBMeUZUFMUKBrJV0Xowi/GeiQVk0h1oSx2OKJeN3ffZ8O7wxRvv/aezFtkpHGgCfR1J
         yBiflC7GOkHAy34W7YkbkSyMu6DO6lBDqG8syRyz1nKvQ/0CzgXkTOawKFKXOzCrSAHw
         aR+ldBxkPmwUhoxU0J9WwfqM6mogAcHweFDxbHetp1oVxvHqWrE+EFgiVYD9trDN8VHZ
         hc89O7oWkeJrEyFg9y1KOwhG9yVhE4povnm2HfFGfkIdb6ho2ASlRcVGCr+461t4SZRw
         yMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353215; x=1793958015;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CfivT7f6AzXhM+eASp8z6BDLEz8vb+/X/mhHCdqRcYc=;
        b=QasBs6VABlxnsC+YWyrtzKIN+6r5wSsJinlmDADy+V/8Vt9fqf1bvF6N0Afvf9sG0p
         uTt3OyTqmC0hAJei1dw32I6m3ufmqOBHVZ9x2+Ws58r9VcSEmCqYYy8qXT++IALxsCZk
         2Ux8d4CzRHmbJaKnKHsJ8YOwMFKUXOkgRpDiLUTjkYnAA3likluO6N3agINj4/eHzez+
         I4/N3t+WZS+5SqqFMhnPzA+npaVF7oVS8m/m4mn142vIeaD86KE0ODg/8G7W48HlpqK5
         Hhk4OmqK6BziHzQ02Tdq5CyqzpRIGtPKrIwMow7TbKiIOw1VZCtZ3dnamH2aebSr6xob
         zdgw==
X-Gm-Message-State: AFq9FYJavAw+Z7Mbv8JKxQWcanl/vdtNwWSj5/oL8ZXuCVCHNF/D+DA5
	rjtvi7Iy7TDSpC+ViloaPmxcjjsP6d8sw/97pleMYuY3De8gVc2Ux11FqGTZOEHcb7ht5rXWPKl
	OUyMTEIec6yLPFAqs7O/MsQYJnDqmsDD3AHrQ6ApgourctEwwmfWVL+QxdoSk9bWNAAX9
X-Gm-Gg: AYBFou37Rp56fs7wlAWme/x3GItouPgRSo8Qy/31/mQoiGnvFyYMQcTwegrt1eKVK+v
	eXCJTZCe81DkrLnWHODAB09Bg+AFmuU3Maqfjv3Kh//9tOL+ycOsGIT1JdiNoZ6cgckbH1gTWkx
	w3t6MlrK5BndL5fZ8kiMw1dYP+du6AJ2SWo6d6jqH/esQPSmGpxf57zPoMLUkuThtfYreU4Q9Oh
	DbQp5igp+dfVT/WBd6qRb8YWzlQP/LeGx7Xo8nj9j2yOtppWApdzpkhSG7m5fT2HV4TqJlUwfNV
	GcwEpcueOiQT+FREfNhSa1OwBVYefBOYXIHSV/4wIY0tiQbtL8V/Gh1a6rqbMRZSZzCKW1V7zUa
	cuoLv8mAc3LqJ4NqlwzMq+o5WQDmZWZU+2vxY67EZWzQguCx2GjT7reTCwL+PFnpmzok2OmScgB
	RkApkW
X-Received: by 2002:a05:7022:258a:b0:18c:e014:6f1d with SMTP id a92af1059eb24-1ac55f2d3cemr3037953c88.1.1793353215203;
        Fri, 30 Oct 2026 02:40:15 -0700 (PDT)
X-Received: by 2002:a05:7022:258a:b0:18c:e014:6f1d with SMTP id a92af1059eb24-1ac55f2d3cemr3037909c88.1.1793353214643;
        Fri, 30 Oct 2026 02:40:14 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm6723418c88.11.2026.10.30.02.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:40:14 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Subject: [PATCH v2 0/6] arm64: dts: qcom: talos-lyra-evk: Add display
 overlays for EVK board
Date: Fri, 30 Oct 2026 15:10:04 +0530
Message-Id: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAPVl5GoC/32Py2rDMBBFf8VoXQVLtl6mlP5HyUKPSaPWjh2Nb
 BpC/r1ynF1DN4IrhnPuvRKEFAFJV11JgiViHE8l8JeK+KM9fQKNoWTCay5ZzQztL8nSEHHq7YX
 OE+YEdqDTiJnyVgrJpbam5qQApgSH+HOHf+y3jLP7Ap9X4npxjJjHdLnbF7bePUSc/SdaGK2p0
 MJb2xgflH8fEXfn2fZ+HIZdecj+tgkTnOcyKm8tyACI9j6qq14fKkWz7UfchLB804XTpSkGKfQ
 hCKvAG/PH8Lb2f4YrzbORjHm6qNJUF1BrlHam1UYe2HOQswh0/Ym5q1pwXGjpQlsHx1VQynvhF
 G+9NY2WEGqvWBBNGXn7BTlKlnbBAQAA
X-Change-ID: 20261019-lyra-display-upstream-post-24656268a902
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
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793353209; l=4288;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=l/KjP8oydKHmymn+QMM/p6UUas/pmtAZFnZX0nIpC0U=;
 b=YTU8fsSxpHE/c9kAWWkPTH9oSzsXwF4O5t1mp/6y1PgZVzm94C+fbfsPYgl3FGyXuIPET9MAE
 cvwjUbScDIYBe2NYIKbW1fld7t7ifBzj9HHSoFOrBHKZ8u7s7hQVRKI
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX2M/0XBnMJ7YP
 Qdsb82KECbg7wNR8Oy12z9IBrgRkveop5Nxoh+Ayvj3+QRtrjNb5vzmM4J1FUkjemwJ+Evz5MdM
 x2m10jbhhl8pWxcNJJT8aP3Lqt0Y8nVjTAvYffuOh8oz4pTI1x0GwCQamc+jm0t9O4qMC90KPG6
 JdmF+6Qj+5wECGa1vYy54BCDcyG9VLz6sIaHxLybQXXXICoHeC+y1upDYIEtzrKMf3fUka78OFI
 7jlnx6fneeaLxp5PYhy+7ldQpzRUbyfhBFSI7ve8qhqqjH0Zde3G4g4sYYXk1ilgt2NawCsNULy
 Z49ZySo9QJH9fQV32UGEucZA0PwEhqsSlmOun8534nPovQllWYCFX2hM7zbNtsUFl4TgNmNsNej
 2z27yYFr5jbRyVBD3Av0XLeG2+ofVysdQR/tZWeEYcvkDs0tZmB6mwaYSn/V6croDlPBN8ytMi/
 Ft67mfafWpQBCc9sgxQ==
X-Proofpoint-GUID: EfxSnv8XoLcLmLU8hwv5_J0Iz-1Fcef9
X-Authority-Analysis: v=2.4 cv=Lp4HWXdc c=1 sm=1 tr=0 ts=6ae46600 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=Q-fNiiVtAAAA:8
 a=JfrnYn6hAAAA:8 a=X9uYJ1hcyrHnrYopOo0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=FO4_E8m0qiDe52t0p3_H:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: EfxSnv8XoLcLmLU8hwv5_J0Iz-1Fcef9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfXwtr/EjJGCTD4
 gZ9oYD/8BEVXM2QjkUokxH/CGomygsT/oGZiMPSRFlrCE5AnCyNScgblkoAvH80vtMyHYRytkIX
 AMH7cbhCZzq3xV+RwKFOZlj4mTCcBx8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300038

Talos Lyra EVK SoC card are mounted on the Lyra carrier card. The
DSI0 interface from SoC card is routed to either the 22-pin DSI
connector on carrier card named as JDISP1 DSI0 or to the DSI0_B2B
connector, through a MUX which can be selected by a hardware DIP
switch. There are multiple daughter cards designed that can be
connected to this B2B connector.

The below B2B display interfaces are enabled by default in base DTB:
  - DSI-to-HDMI using the LT9611UXD daughter card

Below overlay DTs are added for additional display configurations:
  - talos-lyra-evk-dlc0697: DLC0697 DSI panel for Lyra with DLC
    daughter card
  - talos-lyra-evk-raspberrypi-dsi-7inch: Raspberry Pi 7-inch DSI
    panel with touch via the 22-pin DSI connector for Lyra
  - talos-lyra-evk-waveshare-dsi-8inch: Waveshare 8-inch DSI panel
    with touch via the 22-pin DSI connector for Lyra
  - talos-lyra-evk-lvds-auo,g133han01: AUO G133HAN01 LVDS panel for
    Lyra with LVDS daughter card

These overlays are applied on top of the corresponding base board
DTBs.

Link: https://lore.kernel.org/r/20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
Changes in v2:
- Fold in the hdmi_connector port remote-endpoint indentation fix.
- Drop the per-patch Depends-on trailer on the LT9611UXD HDMI bridge
  patch; the dt-bindings dependency is now declared as a series
  prerequisite (see base-commit/prerequisite info below).
- Drop default-on from the DLC0697 backlight node.
- Add the ilitek,ili9881c fallback compatible to the RPi 7-inch
  panel overlay to fix a dtbs_check "too short" binding failure.
- Reword the PWM_CLK defconfig commit message to name Qualcomm as
  the SoC vendor.
- Remove a stray blank line and non-ASCII characters from the AUO
  LVDS panel overlay.
- Link to v1: https://patch.msgid.link/20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org

---
Anand Tiwari (2):
      arm64: defconfig: Enable PWM_CLK for backlight PWM support
      arm64: dts: qcom: talos-lyra-evk: Add AUO G133HAN01 LVDS panel overlay

Mohit Dsor (1):
      arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD HDMI bridge support

Shashank Maurya (3):
      arm64: dts: qcom: talos-lyra-evk: Add DLC DLC0697 panel overlay
      arm64: dts: qcom: talos-lyra-evk: Add RPi 7-inch DSI panel overlay
      arm64: dts: qcom: talos-lyra-evk: Add Waveshare 8-inch DSI panel overlay

 arch/arm64/boot/dts/qcom/Makefile                  |  18 +++
 .../boot/dts/qcom/talos-lyra-evk-dlc0697.dtso      |  77 ++++++++++++
 .../qcom/talos-lyra-evk-lvds-auo,g133han01.dtso    | 133 +++++++++++++++++++++
 .../qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso |  88 ++++++++++++++
 .../qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso   |  75 ++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts        | 106 ++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 7 files changed, 498 insertions(+)
---
base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
change-id: 20261019-lyra-display-upstream-post-24656268a902
prerequisite-message-id: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
prerequisite-patch-id: 0dfae1e9d0c620866489eecacb4b7201b9333621
prerequisite-patch-id: 94923ba8f57911649364a7e0e5494c7cfd478367
prerequisite-patch-id: 660755293839baa7364b4baf3a2dd6b4018de48a
prerequisite-message-id: <20261021-lt9611c-v7-v18-0-4978b94896f1@oss.qualcomm.com>
prerequisite-patch-id: 49f1e01bb5594ce9c4301ce4b16715834ece7f41
prerequisite-patch-id: 21cfbbfd71515961501a768edad476740336c13c

Best regards,
--  
Anand Tiwari <anand.tiwari@oss.qualcomm.com>

