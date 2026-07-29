Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB3B4D8D93
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785338660; cv=none; b=bxXELpwHWz7B6uzhl5Co0yq/G67B9Ttc3uxGMwi3+/ZU/x7nXU+MqMHmsKuQNG+90MPBF1WLnIgxwQuU9lhwjTFxZ9M+8Ed8Bt6hLGDzFmv9bzKWh8LovH5teXq2aKPqTg3G3uqQmGakuJ8Fl9eSjwLe2lPMwLhL7gJW5kXunnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785338660; c=relaxed/simple;
	bh=879g+mK598YtAYgU49sD3vfPo4Kq5psSJSIoXy/pC78=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SGsmMPHZm7gTCE7YLd6U+eNSIVpprfaXCKP6/2m9pVwWxYlgI/9o34nVchYgOwAo/8m1DAAAMU+DETX71AYB8dwAAjRJ35YJ6frFKpAT6ZCD/5bTuqxCDtz8fqL7WOFALGOirC0+lbOo22gf6rnqbtJ1hocVZ6pOKp0+Rj3hTZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aFmuvxyN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H+LG8QqT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aFmuvxyN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H+LG8QqT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF2aqE2327094
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AnH9lvZhGFIb8RDKadhDo6
	YW6auAb4Np/IIdX+siX3Y=; b=aFmuvxyNHgP21zePHKB2RdX+48NuON5WYjKYxN
	sO6gyeVEhiDJYElrmof63t3MkydLnCONuUDOHXgj0HyLaZv4RyLB+xLCVM/93NDP
	nNOu9mTe+whKf4AFxEh0tyhfsP/KxiTZuTR/wvF7i9uCv5ZtIQKDHroVRx0ksFSr
	lX108GAsmoAXPSfJ1QrlGk4GPZe0PX8ffM26fegmOViqEwBDah9ZbhKfAX6NLIhG
	zbBPez0aGKfpVAaVkovtqN66WRUCdJxrKhXf63EyQ6QS013D77HqXaOsLWm9fSXN
	YsI0uQmntqES3dXnByGFO4f7ctr1ZvMIrIJ4ieSHVRdaPf+Q==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgrch28w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:24:17 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-668432d53c5so1125491d50.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785338657; x=1785943457; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AnH9lvZhGFIb8RDKadhDo6YW6auAb4Np/IIdX+siX3Y=;
        b=H+LG8QqTSt7HlLlqFB+wi7PsrQjb/j2DIBDOhZQTMchW4iIy9dOsNQRKQh4X2rbs8A
         Jk5wJ7cDAG5dwEu6RnAclsTGp8DEZBWqq4SRNkQVOpjNjHFiMD7DuVY2XfBT9TGnube/
         GaWiODZ2P+F+VQ3CsOizyDI7YGLxHoki8TVsG2XPt2TExojzZCktgqqCW0It9mLApnhA
         hGxQZGHrTic3L1UhbeokSbs/Td06W/a9QmILG/73QygG3obTGBR0ZAJz5ypdubsiY9a+
         iYNsHGL+iB3nQdocTwIo2H9VpJrxIms5GztwrQrDBj5m659RGJE+3S/+8n2VmOblzBv8
         iYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785338657; x=1785943457;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AnH9lvZhGFIb8RDKadhDo6YW6auAb4Np/IIdX+siX3Y=;
        b=hFt7YvrNlUwQ5XGhSKS5Fskl/QuTyVAk2pQlqOw+khnpUbAiMXyVcsJlOlrhR6fdn0
         poUIz5bxud81Nth49Hw5MSd/yZq2/hpP+1O8kDTVLmM5PJZpo0GQu6BAfxrdl2xizjAW
         FvxKwiFPqxzKv36cpl+ewL+VdW/E8qUp1S/K9h2hAPd/nWvZTlao+sV/c1/g4wvPRObN
         37ppBA+khVlJnRGW9na5m/iFSmlGl6oQM3+7/DAKm/H95FJ0jWQe9pWXCKoNO1FqSZ9F
         ZLoi7JOFCovUNIcZWwmJf0Dk61AFo+5vmklkXILBKTum12l26tskE71GvRJGO02Kon4Z
         fiVg==
X-Gm-Message-State: AOJu0YxQz3sAeapkJZy2qXkAveScFZ8JpE/NDCu6PxoUk6s6wUhvxc6e
	dNwME180e0zYw9IAYA01MbkX+CdQ9MhFu4dSKqKorfMUqgURK7ZF/2q4PFlw3UpUFDcjy0E9pzz
	8CzRxWFEFd4R5QhOQ1YCixC2x+7gnE8Z7NAJqiHBqOocQCNpvS84X8SdAGaXCIrukfTLy
X-Gm-Gg: AR+sD10j1L3s0RfpcIzTt/lpJCcvTzqAtTX4TSuAPsJRj+GtNcC8MPQvW6kKoddd1Eh
	5bc+zZ7aE64S5i6AOTMyHy+0o7f1A3XNTPTqnWoNMssbW9qOgbgkgwKrVYc2g9SXe/Ty9mwM47B
	lYRDqFA5Sjml5CWYzVGoHHil3u19+mPvO5l9Mn7o5QecNP9qNok4uSkbtN9ObywCaQgW+o8Q3py
	bhwRncRF5qQg8AoOcauaRFwajR/mn/CZxoTFEa7HwEu7eAPT3Xw2Dt0fN9mKUWjIPOllmFIQTGj
	hosXeQRdSx9V8blq/QCob1DiJEeONW5WQ2f7nxXZPMz5BC5hYT5VfRG8Ns7IdwkCSeucrO1jhDn
	DIEL3eZAzgoSOPAFVTSR6HEUASLLT8yxAyQKJhbLvaWXUvGaJOe9Jztvmcq4t+36X9E/I7g==
X-Received: by 2002:a05:690e:418a:b0:668:92ca:f50 with SMTP id 956f58d0204a3-6690547b235mr2840990d50.12.1785338657104;
        Wed, 29 Jul 2026 08:24:17 -0700 (PDT)
X-Received: by 2002:a05:690e:418a:b0:668:92ca:f50 with SMTP id 956f58d0204a3-6690547b235mr2840972d50.12.1785338656545;
        Wed, 29 Jul 2026 08:24:16 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-669125fbbecsm2050937d50.12.2026.07.29.08.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:24:16 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v6 0/2] Add DT Support for USB on Shikra
Date: Wed, 29 Jul 2026 20:54:03 +0530
Message-Id: <20260729-shikra-usb-v6-dt-v6-0-72ffb4796a08@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABMbamoC/yXMQQ5AMBBA0avIrE0iXVS4ili008GQIB1EIu6uW
 L7F/xcoR2GFOrsg8iEqy5xg8wxocHPPKCEZTGFsUZoKdZApOtzV42ExbOgseyIyzncMKVsjd3J
 +y6b9rbsfmbb3A/f9AH/60890AAAA
X-Change-ID: 20260729-shikra-usb-v6-dt-a6ebccc2abfe
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785338652; l=2684;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=879g+mK598YtAYgU49sD3vfPo4Kq5psSJSIoXy/pC78=;
 b=53B0LrhwecIgK0h6199QY2U1WhXEdKcpHswwDpyus5ofjVpfO+ttzlzw/JL2Q5wdN/Yb1zHsK
 C+pLr3j+BRhDmiqSr1EDFbZlojlY7wn7LYRlpPrOPSI+OqzHDoKEKko
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-GUID: WYNqD-hPuMu-mHArbrYKcw0edMnFPo7X
X-Authority-Analysis: v=2.4 cv=Id+3n2qa c=1 sm=1 tr=0 ts=6a6a1b21 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=_AVwzdTWJwZJkuAtZNAA:9
 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: WYNqD-hPuMu-mHArbrYKcw0edMnFPo7X
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNCBTYWx0ZWRfX4qv0J+kzX2VA
 R2NYHpi7x06PZJRKjQhXZV8ymHv40+6+/VqLXAHZ21Xbtjv3Q+Z7y4ya/uQKirjRIZBVSWHKk3U
 RZ4YyCabpNiKgLmKhVCQpeszC6AeIyY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNCBTYWx0ZWRfX07GGL8PxbACx
 NiLO5OJdrKqo76ea9GPU8qO4ukoGX3ZrdZfYnzkaKO0cSe6wXV5CU4snaXJgKgnVDDo1z9eztlI
 OFu3KiCZLKOoYA+sT1TwuqmDEcuehG193b8gk7ws2+2MegKFcyR4nHWfeT3UjC4iVcXwKMU+Pu/
 zS+zGHkHi0dNR2+64AiaITu+JqnJAfNfUrvAUgjrf00XMjVL7/yl8CSaRiNxsQqJoefh3TtBDnr
 UtQUpd5ifJFP7BfrIkDaNudldaLU+AjEjc/djN2vjib6VklwfDcQZyRq6WTRBGhfO+cs2EeP2LP
 +Kdznl7pgqeMkDrol8oD3RKiU+2rJuKYxkhlVC9AaZf5R2KoxtxSCaHwS0CfrzvZ5pE+XjhWyW+
 oALllUnlLpHU31ohbnr3ngKdus0yJ4zpx2+g56wBHcx3/wmBq34Mh59dY+A0p1EhyxAg9poi5/X
 yhf6T9Buyd+Hw+t6yhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290124

Shikra has two USB controllers. Adding both USB controllers support
in device mode in this series.

Changes in v6:
- Moved dr_mode property to shikra-evk.dtsi
- Merged platform specific changes into one patch

Link to v5:
https://lore.kernel.org/all/20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com/

Changes in v5:
- Added interconnects and sorted nodes alphanumerically - Dmitry
- Updated commit text mentioning that device mode is being enabled
  since role switching changes are not yet present.

Link to v4:
https://patch.msgid.link/20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com

Changes in v4:
- Enable both controllers in CQS/CQM platform
- Fixed iface clock in usb_2 node
- Skipped adding RB tags obtained from Konrad since on CQM/CQS, second
  controller also is enabled in v4. Also specified dr_mode as peripheral
  for first controller.

Link to v3:
https://lore.kernel.org/all/20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com/

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
- QMP Phy: https://lore.kernel.org/all/20260712-usb-shikra-phy-v6-v6-2-1b3e51bf1541@oss.qualcomm.com/ - (RB'd)

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Krishna Kurapati (2):
      arm64: dts: qcom: Add support for usb nodes on Shikra
      arm64: dts: qcom: Enable USB controllers on Shikra platforms

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  23 +++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  23 +++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi    |  12 ++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts |  23 +++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 233 ++++++++++++++++++++++++++++
 5 files changed, 314 insertions(+)
---
base-commit: 7f102800164990609e2b272396d45b197a55bd04
change-id: 20260729-shikra-usb-v6-dt-a6ebccc2abfe

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

