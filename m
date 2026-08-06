Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0F9369D7D
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 16:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786033916; cv=none; b=My0xH5O7OcLB6rELnaAdqWKapi0DFOXJ0M5V1ycCPImaLe7zhGx6jcxniTS0Mp/RxZe8F5rEiibSVC5zVTKVinXkof7YIhOgyDMESkHOcHx9sg6KviS+EGG66UdjwL6TAFb3CkhljbBCMKwXCHPQ1sdOW+bWvNQgn8LNZv3ztQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786033916; c=relaxed/simple;
	bh=r0vG4czXXWS1Alu1n2sb/bIPPDzvST31Zmg/XwEF4eg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uMT8T8dDw5Km/1jcN6a9NaBtUQI7EfRvyWZ+wN4VANggWG1UpzJf1aIcFDA0YoFIV1hsCYYAgzR0cM0ATan7ts7dCwvtmcLWS2zRem+YvtBqCYg/eIwWz8Nn9gozYOjhLiQfPIM9C3X4QR7K6eO/HJbRwijTR176lUyZRw2VkpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d6mPZaE9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jNiyEupa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d6mPZaE9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jNiyEupa"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676EngYA2228295
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 16:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=K9NCjEPSZKAe6x+aQQALZW
	yrdxVaHfePmTOsAlBQqHk=; b=d6mPZaE9AAjUZ+D/pzxTmv2nCjNKUyN35HqyhB
	hu7Ou0/XuYO2+Icr50RBczmJoTH5GmfYwxXqk89soZLUFd/EMuA6lOPE4fJ88Rhu
	QnWQ5avUtXjQQB1OjOMda1DtD0Wwlu3+R+6/83AjW05IdDSE9z4ujxiG2yw87173
	eamClNDSPe09p7oT+gnaUB0GGem/UIRZcAEwe4kk7Y3iGY2yJ3cRL6NoVoR57SZD
	2dlyongMnKdIWAfQGd1S48WXAS5Tg375E288NvbhhqnbJfpHnirNiErKjIoJnHVQ
	QvUkufe6zYUhL9QkuFzE8WjxK9HYy2ccB2vnKjv2Lhy9t0nw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvn8ptse3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 16:31:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so3070850a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 09:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786033913; x=1786638713; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K9NCjEPSZKAe6x+aQQALZWyrdxVaHfePmTOsAlBQqHk=;
        b=jNiyEupaTsPKDA60mg7NCB1Qeapt4ve4cS8a+Wkqp9JaarEOmknRG7pQJnQZttIJfW
         KTx1IsuRnKk+foYK8fcsDYs4WgGdwA2ytbjOy8glz7X3xgNMTu9H1vs851WxajHIMkwb
         zmqZ8LVKGaxyMi029C335H9WGcMmWAguo9c2ohEVk/qsqcxXqH/2PM4aVY3JQj3TNmsD
         LO9EcC7btD6mJVdVEMOSAHkdcgG7b4SX52yh3Ju6GA7/QQ08XGYZWolNaBEGjMii7wWP
         wJ7uIh8iqVzHpLPRAmVxfARFI0D60Zg4kOUfBqZuwiYrpgptyC7v2m7pKV81AiE1CAQ1
         0FAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786033913; x=1786638713;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K9NCjEPSZKAe6x+aQQALZWyrdxVaHfePmTOsAlBQqHk=;
        b=rQV9T9WGhvv4oEh3Sv9JguquB/zhICZ41qCl/JItdZ8BoP9eM2Tz5K0xzQaiuZD69A
         db8qtY6R7fkzmh0dwm/gEjOGgvONwEM+aCk6lDrNvqVpHxK3B6NTQnsz5KhGRL+R3AbE
         ec/ePQJFwNVFkPwoXUFWUbgKNN0yPpfWueE4tu1OjXE8kIUv4K4hVRlow5HgrTRuuTAH
         v46YJ09qaPdacjcTNfDLnxZ3g23wRSq1Nicygb2tHr5azRX8PH7Oe6f3DToLCf0uoUZD
         MvY6FRWrH9KbA6GpAEE82O35r764BJ4a12iiMIKZ+XLAHj7PBrbJgkZ7sB/srBa60JTu
         HD3Q==
X-Gm-Message-State: AOJu0YyCUis57nO6rPxZlL6yELC/INfTqKRXwYVjl17NovrAawVwldnO
	DinI3f++DdZA1itIuJ/7xhFABNZSOqcjIJn2fEEBv7Y8xh3cUf+EnM6wKqSpt6jf6mNiw7/+seK
	sCBj5cbBOEZcKlzWOb8n/IHpDRRL3zXoatokNrE23NYFa62konMPVhi5djEY12I0wgxEh
X-Gm-Gg: AR+sD135Wa5p3YhtKf314MIa3QUyG6HmOF06MGp5jGkPGHxECNKeawMhPnJLBlB/P3s
	ogoXknbhKusPRU9f2COiyQHsYMKKzSUROlVn9NyPSwrHlCt42qWhlBEzdHgUJnMGO8gdNmnOM1V
	TSR8NXHxZkrDm2yyt/EYkmE3gj0VPlCgmpzqs6G1vOZJpccJmAI55XyY+xBZ9fPGtU06urOCEPC
	LD2DQifGT6zJ8Tq0xpGL5MPHUouHRxyanL9YzzkCR+9Y+Y9A/VnAm22ZesO6vyUJu01XDyunCrc
	JbUHo1VLCQPTUReavTiCYq9UB69BDrwlMjkdH5X9alx9ec83xTNPpiU99e9U66ftFNraPA+Yv6D
	oUlPTVmVlZ4M9bPcsAkac4ulpC1e8ymbH
X-Received: by 2002:a17:90b:2dc1:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-3903c535d79mr18657360a91.5.1786033912778;
        Thu, 06 Aug 2026 09:31:52 -0700 (PDT)
X-Received: by 2002:a17:90b:2dc1:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-3903c535d79mr18657273a91.5.1786033912201;
        Thu, 06 Aug 2026 09:31:52 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085f2b2fdsm1853168a91.12.2026.08.06.09.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 09:31:51 -0700 (PDT)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: Add eDP display overlays for hamoa
 and purwa IoT EVKs
Date: Thu, 06 Aug 2026 22:01:19 +0530
Message-Id: <20260806-edp_overlay_for-next-v1-0-c3aebbc81f38@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANe2dGoC/yXMWwqDMBBG4a3IPDeQiJe2Wykian7tlJLIREUR9
 95UH7+Hc3YKEEagZ7KTYOHA3kWYW0Ldu3EDFNtoSnVa6LvOFOxY+wXybba696Ic1kkVjyw3ui0
 tckMxHQU9r+f2VV0Oc/tBN/1fdBw/K0oAQngAAAA=
X-Change-ID: 20260804-edp_overlay_for-next-694510b7de51
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com, vishnu.saini@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786033907; l=1279;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=r0vG4czXXWS1Alu1n2sb/bIPPDzvST31Zmg/XwEF4eg=;
 b=GWcME2XePFGG/YoqboDxDjo82KE+cPdaSbunkz+1iZA+3zFwqb9GmQlQ04vjeaawlsU6GoWPq
 W2VwuZrh2ChBdUH82UWsYi5eLoA5m02caPzqeSCn2S+r1CI5QSkfCnC
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDEyOSBTYWx0ZWRfX3rKuT5JgMknL
 Eqc0z35jL0ZnLxTzbo/qiKSFY3HY/EnEFb0dzJ5RJZOR4oevvTNuKCYn3NkaIOYcVYBYt5utdjF
 sI4Elg6vOlDAUubdMXMS/Mp79ENs2Fk=
X-Authority-Analysis: v=2.4 cv=RPeD2Yi+ c=1 sm=1 tr=0 ts=6a74b6f9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=2-AlfWxrE5KuxYGhlBsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: wdJZ2g2wY6WKT2JWPTrUhSsddzNjFmY8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDEyOSBTYWx0ZWRfXz1l2ThjGuFvc
 rJvA5DZfITdRbGWwxd4JhPqt0B3D9uKlyWkxI4z+Fz6Etc/X+z5cTtSqKY1pPCOZuLtUDx9bkrO
 N9AZuNZ7UEEfI0b4Xq/nmMmwhbQldDCeeO+DxSev59cjbxyT2qCEO2ELYD7Drj2G3RIs8ywJ+Dq
 vqU+VOlqLlGbLMs8sivInMwpEBAoOGjzvRsHd++RkcZj6Ho/+w27ge6h0GDdz8PPhij5oC9+f1d
 oEeRYgAlKV8uLbzJlzryBPqasZFD8aCxhvCNXYf2Pp7Cg15hnO8pcYjq2fI12QUv4j5uUP4Q2DQ
 o3+YVQ405aR665uwtOrLM361jC373xbAFXSZyXjYT9Vh/LFFghze0CfPeH2i26xi2B83geDl445
 mhwRLoValA0bygY1LPLZRLhzoa2Wzd8SHz8QdSi2uaoIcGFBa8V809eGbD2jpjo5x7djB0lT5iH
 6Jv9/5E2jrfUtgu881A==
X-Proofpoint-ORIG-GUID: wdJZ2g2wY6WKT2JWPTrUhSsddzNjFmY8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_01,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060129

Both Hamoa and Purwa IoT EVKs are available in headed and headless
variants. The headed variants use an eDP display panel connected via
the DP3 controller, while the headless variants do not include a
display.

Move the eDP-specific nodes out of the base DTS files into separate
DTBO overlays for each board. This allows the base DTBs to be used
as-is for headless variants, while the composite DTBs enable eDP
support on headed variants.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
Anand Tiwari (2):
      arm64: dts: qcom: hamoa-iot-evk: Add eDP display overlay
      arm64: dts: qcom: purwa-iot-evk: Add eDP display overlay

 arch/arm64/boot/dts/qcom/Makefile               |   6 ++
 arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso | 126 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts      | 107 --------------------
 arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso | 126 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts      | 107 --------------------
 5 files changed, 258 insertions(+), 214 deletions(-)
---
base-commit: 56d828d0b65fb3451a23b5aee961531add7cf0fc
change-id: 20260804-edp_overlay_for-next-694510b7de51

Best regards,
--  
Anand Tiwari <anand.tiwari@oss.qualcomm.com>

