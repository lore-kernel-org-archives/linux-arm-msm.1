Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595858;
	b=3tHWOclGGuQipLpl3x9QDl+r6juj5376lLvuk1u5J7oNcBC5SXOn4sVe1BAQgwcm5gvs
	 CvBlmtxbyYHWBu/ERdUtLsWH8tOrSVUQ5xK0/2fpcnD3Lexg4mQ74wPwBYkqo9ET8Bnc+
	 swKIubqdmJRPzsBVqDcAFGITkqI+mbDA3OeIhWIClrEcez0rB2FzSEO3hyl663Jfor0TC
	 U+pacjLyG7FLvNAvF9FJb+nAcDnG5VlYduWseN+eWNGWPoTYbEVpgBEMI4lJ+qlAD9zw9
	 XUXIGbfNZHmdbF8XbGBqZu9mHq9DQNtdV2XHAl+mJWt90Dg+PJEoX/0r6wYSV3WKygg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595858;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sMmjYtG/rjFjeMhRDVGkf/87tw6pvM/e0yvKC2pDRLg=;
	b=fN7pOmLYgVNHfiONvRm8HAS2U6Yob9QkzczPlCf49oBvszMkB6oDI/JljkOPJAV+2gj5
	 3FWtrgMrls8dffxA4qX6WnL2qyrkEZ4gm8YKOwBEb0hDme2kM4mIaEO3wT4uKmHE/OuPs
	 rHMaC8XwBt2ORvMQ3GyxmQq/IZIf+JguE29iBweUp0t1wxbYH8GpGL0aOnhXshlUx+cu9
	 rPz7uRmWkYZmlzeJu7ELBDRk38W8VHpmw0axPBlwMFIQoww7IX4srQGPW7fiBniCcUC36
	 FYeVqihmYEyjzSM1jFj/q9EoZInszSi7cT2vMlDSlBq+0++Ua26+1ylJwwCGSqNYuqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="I/5/5o/3";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g5QX+mKl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCBB606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DCBB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I/5/5o/3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g5QX+mKl
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFLWa880383
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sMmjYtG/rjFjeMhRDVGkf/
	87tw6pvM/e0yvKC2pDRLg=; b=I/5/5o/3w+GXYaqYMYOy5XXTKXJ4O+aPrJtD8D
	q8n3+swFpVlK7tsTSeUhbOlkxaO+YtTwARHNPLp6lCzJrGsqr1hnHMcKFfADGpdF
	tMTWiMZN/RjtEpfem5WRIp9wrN9ySsBLyeLywNwxG+uGtpuT6+KanMaEKLC6Fnn/
	0maZclydMceUFEvpyqrSijs0vOHjgcLRCYM2H2s34C500Szl/NQZRhpRAmi4qCSU
	a2jP7tHiO2MRIP9CC1uFz1nVur0wSi9t3+S0BuP+gfgXJjQ/A769vseMOE69K9n6
	XAeCoKYtk94sU4b1auyyPbg3yJA4glIy1tCpp8Vpr7FX2zUA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj49dv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:17:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1591620eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792595857; x=1793200657; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sMmjYtG/rjFjeMhRDVGkf/87tw6pvM/e0yvKC2pDRLg=;
        b=g5QX+mKlM+0wEabUuAcHwWWlzPEYS92Rf8v6BnzRC8Wubgpomfl5SokXH5DNPzAps2
         GbNeNCT5bOCejtqFAt6fC6+lj9Pin3UaZfrQtYUbj7C5gz4xLEqpJIaBeiJTQWyAxj5T
         H5ACvYHntav1EaPKOq3ihun0U0Tyo8nOxjRVB6R2pLSCIsDjraW+0NAMYGvvdDRBR3mb
         epOjjHf7AJku+yLWjSQ+WNSHYCx1H9+lZW9sCkzBrZD/yFji61MlT/+dIWsO4hHTPsDi
         RSqEpaZSBeluNGOKx5MkR2KklSpE6eeTYh8peKQAI/M9O2pUTIE36FYqOXhv8IPmSKCx
         5azQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595857; x=1793200657;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sMmjYtG/rjFjeMhRDVGkf/87tw6pvM/e0yvKC2pDRLg=;
        b=bSsnyv9ImHc1IPDI2H8HhkTQ24BvuUkHS7J+TnoJ12CZPVuxi0Y1ak6K0KH1THmoGd
         dZn5z1Dn94YBeREkwiXUWHwTiLNTAHYPsjqxLXrQH1+igctUuvjPWp2+WKvjXJ2ZaVcf
         qdfxoH1/VwekyoVg4+1/r11FhN4Y7UEdyYZfSUvoPl0RsHmNxv5puDtPTpP3Gt2wbpuY
         G7XZhwWUfLcnzTkLD0ryaf6xWAdRAlMycupeZ5xlZb7A7FjiRBldjDZAQoBPh4/NAS7i
         kXXysGn7KS4IjGghAvWAgh8sENlC2B/cv+qPdX7w/yBbTLk4nr6XDHIkxjNCPHRVtgKQ
         vZVA==
X-Gm-Message-State: AFq9FYJYWeEvsXbvuNOWNC1FwPpTMlJ6NC73gN0g8POlG5svmKgDnEYY
	McXkLvQfR3JD0aIvYd5yrBgysur4npeyd+cM4kaoeail6ofkHZUjd7ecTJaRw8jMkNR2yMRgfQG
	dIChpcojyDLbXSn/lOMLA1OZPq8MoOkR3mtCi50bAdzaed3RRosKohQ2UgFfvj/IIotMH
X-Gm-Gg: AYBFou3+Q0AUHKrXhtXdz++HJpPlVNam+duZZLc5xu0sMUSiYoH4oXVwNt9UTuTZ40L
	LdyxWsJyCUAk/e9CVdMPutCw3TmiRgnT89D2EoN46p8LAtaGfd6YWsPsO711U1RLUWFC44ShLKA
	bM2NQICGdey9iJ96vKQN1iHrCrp0HhafeS6FjK2ejnm/Lh5N1xNJXLUFG7+F6nk70VuBB4t0wJ3
	+MgkpIxlBolcn4NuD1KXIZlJyGPakcCjERnF52qC0Nsup40MWDCkQewrb9pCuUX99uM9LUuPG4y
	Bx80YWviDurahyHaOFGQn+iPp01gUsPJUsAsDI7LV5ZN1ILyagZaE+OPslL95VrPUaRFj3fTS5V
	bd8uwQNQbZHqiVn5q4jXxPhb8TcMsiCbZ
X-Received: by 2002:a05:7300:de42:b0:351:dbc:b663 with SMTP id 5a478bee46e88-3674e54a412mr3556449eec.31.1792595856396;
        Wed, 21 Oct 2026 08:17:36 -0700 (PDT)
X-Received: by 2002:a05:7300:de42:b0:351:dbc:b663 with SMTP id 5a478bee46e88-3674e54a412mr3556416eec.31.1792595855604;
        Wed, 21 Oct 2026 08:17:35 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm9142117eec.12.2026.10.21.08.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:17:35 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Subject: [PATCH 0/6] arm64: dts: qcom: talos-lyra-evk: Add display overlays
 for EVK board
Date: Wed, 21 Oct 2026 20:47:24 +0530
Message-Id: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAITX2GoC/yXMwQ6CMAwA0F8hPdtkW2QRf8V4qFC1BmFpB4EQ/
 t2px3d5GxirsMG52kB5FpNxKPCHCtonDQ9G6YohuBC98w32qxJ2YqmnFadkWZnemEbLGI6xjiG
 eqHEBSpCU77L88sv1b5tuL27zd4R9/wCrlwP7fgAAAA==
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
        venkata.valluru@oss.qualcomm.com,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792595849; l=2465;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=/x6VoMzCsBiTnvMH8LNkojMMeM9fxxZt7W8E4IaOH9U=;
 b=AuvkK5Dy6j2wfe5kYXF/E2SbeA9MltC3kcc7mwKTrxraE7JHfYgZnPiNHnMgUDVZg3iCUQwIC
 gF1B65Jtm6ADjLInfuOs5fVdHgQ6+KRPsO/A7bpuuO2vSGgyMuKR9bY
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-ORIG-GUID: W7GBzeBZdIVgIwIl4s6MZAmFQzJLkeIS
X-Proofpoint-GUID: W7GBzeBZdIVgIwIl4s6MZAmFQzJLkeIS
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad8d791 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tMPW8O63IxkL4n0aSRoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfXwzsNDzNS0vAI
 sUvPEbpbwNbYCPoGhXsZnUaD1Yfa0yRlGJimdMgTuJVbW+oE2/episv0DG/760RbNM93+J5PV99
 0mU40iBRCZcM4lI2+684xFY4fu+SbJaB62CE/5LH6+GIi7pEvLAokaAfarnBAhJioGw0ODMPWMf
 JKPlegusDH2L8z9TZHVyUO0h2Jl3DWTWV8f8c60Oe5WgdYibHQx+ZC/N3fa1/RpbQwn72ZswgVJ
 1T7vghNNgEVyZi9BidoLT9CHwAvyu0eCYpYjCWNKI7Lha9gjs3n1dltkwjd3BiH21cWyvzNpr4x
 UWrzLgA6aDslH/fiJAzUBUWMoNCWKNIdfhnAByzzWfyZGwGv+7PvSIijnbArRFfuz5VVNiuEqb2
 DAn4l4pzX3M4dxRE+Pp4/wPb50wYeZwEJvTK8FPar/w8e1kRr/HqFeFFwu3wxY+yT0MP3LAERJP
 cCrE2/jWJuu/uoT+xrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX+WjOien3zcoR
 XoXZLVuvhzNFfM5iLaGHnumx7ICQVYUv6/5SCmlLy+eQQ219K0a9IA7ohV59kpIKPoIjGe9AdDW
 PWntsWGjYFdF8KC7VhvQSvjo1gJQ68E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210060

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
 .../boot/dts/qcom/talos-lyra-evk-dlc0697.dtso      |  78 ++++++++++++
 .../qcom/talos-lyra-evk-lvds-auo,g133han01.dtso    | 134 +++++++++++++++++++++
 .../qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso |  88 ++++++++++++++
 .../qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso   |  75 ++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts        | 106 ++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 7 files changed, 500 insertions(+)
---
base-commit: 1128acbf0e37fb5fe5b67d7e2494fa45905afda0
change-id: 20261019-lyra-display-upstream-post-24656268a902

Best regards,
--  
Anand Tiwari <anand.tiwari@oss.qualcomm.com>

