Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783291;
	b=T+A+2NzIU6hXh/qwfp35edSbwQWDBoXWeiwFoF4zKG+AmTx6H0TTF8EvwtxiJ4EpOCUA
	 TYPd88X07kkvK8oa1wRm4xFTIXTJ7WX3XWZwGx08BrNjekbXJg0d9IHVUtJb6UO/vcoTa
	 tswAqJkFvP97TXYu1DaVMItigxp4dL4Jll3IUpRD9v+aBWx45EFoyuyU8CtSVBsg/ITJJ
	 xderIE/tQnIywv8rVbw27DVe4K4fnMXabmVJoSq5au0uK4EMrK3KhMirVM+dnCgA7kKGa
	 i9i0Gik+QbDpZNhYa7w3YFFFA8l5yvYVfuypVzFT0boHjzdZJeb2C/5FOYJKQ527i1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783291;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dIHAyqbJuJM8xf+TtEAHAZ7qkX+1IxTcwMBz+ggyJ94=;
	b=1czVDTQE5l9iztQRr4+4fTnZieGZE1yPbSAF4iXQF0fvd3lK3jKYlIVooE+bViiYKsie
	 6xhthI9PvxfWhAcpdk+eqy484l0OUSfZ/5Psl1YNUPYjxU2ucr29gOfm/F9HiFOkxMJJd
	 FBEBVMf50G/kXiac6Kn+Pl+mk/AnO1DhkIW58lJg3chvR/8UEdm/bv7sSCiX+JTrcvYyW
	 qJLWPrPI8XKHCZbIMxE+1PHKeHyrT+VVL3qEUrvZAxErNDh3XkLr87OLfgJ/SbjKSIw+8
	 AOTR79AnFFGMvYNqpI2aYPQFBrvxBbi3cUSgBlsI+3M6lMX9oHU6s8aj9u5uuHxyoaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Szh/pzCY";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fcz6pRVx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22354606A328
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 09:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22354606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Szh/pzCY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fcz6pRVx
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KnEr175533
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 09:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dIHAyqbJuJM8xf+TtEAHAZ
	7qkX+1IxTcwMBz+ggyJ94=; b=Szh/pzCYqzI6TkPPX1DEi95U9EljTdBKKGbPKD
	SZwVsRTYslQaY5FRA3++Q/5jBvlXwq4HVUyPgXNdOyawhAJKMQX2D/fr9sCJ5bt4
	42UxcLLwHovmFRnVwotdSEQBAlV7i/W7Cic0VtNb8CDeQckMtI2MrMnjmYrL+FQS
	ByD/LFljdEgC1Y/tI9IqEDvm0sV9FQroxFPWkj+AeyoSYHVEyP7JmQmKMzcfVW4j
	w+3BNhiLhKRzcD/cWI7NXkNd+NSl5OVts31ajapLoVjccuvX2xQ97t8MmKvq7zEd
	52DytzliDoojXSimvM4Hd0tMhxR6mqOIwgv0srUJHALWQlZA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbu762-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 09:08:08 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-85d630e451aso665284a34.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 01:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793783288; x=1794388088; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dIHAyqbJuJM8xf+TtEAHAZ7qkX+1IxTcwMBz+ggyJ94=;
        b=fcz6pRVxiJbAvaEvgiI6WqJWnG8lD/icvPlCfp1ku1kmtaKHupqfe+ALFqj3nTVg9E
         Js6k7muBljKmPc7Sau3qiIvXvFIy1C7n9DizjpMwaKcgomyEdW4qc/eKqLT2BRzFn0HH
         iecAG4I9x4KZ/hy8s8I+imu7SAuf+eSPaU2CX6x0NxjANlUg/pYp++5hw5VXC7YSycMS
         Z2Zu5RU+RmFMHTJ2zvndgPRQtRiWf3nTo9cxDmYJmKXFLFOeYFdIIn4UWQpKf3xYUI8B
         uVxAru+SBlDLT1FUty6TsLaz8CpOj3NMBGDiCELVpmXpVNytcFnSzbNuBDoK85a7ZxTR
         sSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783288; x=1794388088;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dIHAyqbJuJM8xf+TtEAHAZ7qkX+1IxTcwMBz+ggyJ94=;
        b=ow7Oa+lTCgUTb9O1Kt2+7TM15me1DeYVEcEzE32hvRlZ+84hbZdBUUT67wv2btkS7l
         RhH44xeR6R0367/12y8QHuaGvheEg8OfEfFj1xfVoUgcb0mGuwBAwuH71duChMFpI4AA
         7iOGUJG7ewbKXgnKFDaoq0iErGudVNhr5tIkuimjoXxemlsyxBojEkY8xchyFXxfDuEl
         X9eY9ZwxiJWKhzqPwOHEpTZfERUSBEc3NadOV9bV1z+t5x2i/H1DUs0MZntejPeI3A48
         Lqk1zTHwFj0kxrnnmRl9zR/FzNfaoyJD4/Mq7UikvsO5IBmZRO1NmO8FRiVCg8jsgkZ7
         vX+g==
X-Gm-Message-State: APuU4Z94Nd978Ihuccs68IEypQCu9v/vajbabYzDu+XzTbP3k75LVPAL
	UsUV30gCrTpq8d/OS1LTNydczeQuH/GaHpVmyoBg/lHieNUk75VZWjmfhHBI6USnctBaOzbbyuq
	5D6Pw72REGw7z/pKydY4KyqfLvu1EOknzo9fs5NkNQgNOuprIwQsQRx54V0D/HXrCjyUh
X-Gm-Gg: AYBFou04eosEPQ1QRNxrtYCyfO6RefcpEvilUK4ns97fAHd+XDAMMG/QKBcp1iQwFUj
	7xHjlJAKnxYpdCOf1jpuE1P7P0285cdTtS0VpwUIYvXhXITnGzNXlxI7x5IjlBc0JXc1XgEBdx+
	w1wOwStjibIxIClqVdKdcmjFb8xWiljJRaOx2DZE7wISKVluJxNHI/Bqp5LIWloo1yGsjokm5mA
	CUtLcTJn5B/hfuhmcTsMxQNOqFrk+Ll/WoHWwHM5s0b27Zj748yNwNN8wJMNVF5xB7wugZIGuRK
	WdLHTxRfS2tL9oAoDED+2SmUhoDrTt5/3zrWLGYY8X2P9cWW0kaAA7+DDssFvA3gP5FlGAzaUPH
	nJvR8WZ+7ab+EDZktxrLJUvdl0WkEs7x6UsDLS6uxYxDb5vsyYFu3hXEy9mPpmkKHt10t4ecMFo
	r/O0ULzPy6l7TaR+EyYts=
X-Received: by 2002:a05:6830:6512:b0:857:52f3:a5fa with SMTP id 46e09a7af769-85d361162aamr12702424a34.2.1793783288142;
        Wed, 04 Nov 2026 01:08:08 -0800 (PST)
X-Received: by 2002:a05:6830:6512:b0:857:52f3:a5fa with SMTP id 46e09a7af769-85d361162aamr12702403a34.2.1793783287669;
        Wed, 04 Nov 2026 01:08:07 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3d768c8sm1519846a34.8.2026.11.04.01.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:08:07 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v4 0/3] phy: qcom: qmp-pcie: Add vdda-refgen supply support
 for Glymur
Date: Wed, 04 Nov 2026 01:07:59 -0800
Message-Id: <20261104-phyrefgen_1104-v4-0-ba508fc6ab40@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAO/16moC/yXMyw5AMBCF4VeRWWui1bi9iogog7EoaREi3t1g+
 eXk/Bd4dIQeiuAChzt5mi1DhwG0Y2MHFNSxQUUqkTKKxTKeDvsBbc3UQhrdKMxNmssM+LTwSMc
 XLKvffjMTtutbgft+AFq/88ByAAAA
X-Change-ID: 20261103-phyrefgen_1104-1b4a2e9b7918
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793783286; l=2118;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=k51MqTDW41CB3iyARbpzUvcgecZ+3Ncq5B/uspwZ0zg=;
 b=/Uf3U/8snPQDj1QVx/LHnLiITObnl/oE/Kcv9acMok7n79ZjF6k7AQ6qY2vodmPIUFkyp73JS
 3EVNn1M93wxD89fGAl1W86kDs8dxMACqJRG2THI13Z3M+L5OhNRgs9r
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: EIu7cVW4OGhETljqlHAeLQqzBL9ilmlp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfXxwPM4yE+VuvE
 88oCISLZmRecZwVx9bJczt9t3HIW9p64fD659a7OE/Yrq7TNBrya+/HjXzmnzMnmz4m4Fc4g58J
 QU+eA70KslBsEXjpxAk/kVJ96IYGy1B5Bs4yjHxG8Cjq41lAxyd9Y014LKME3kMKG5xCdPWEpMh
 RCEy81WtYRRYM1ZIF07AlkG6fDWb5XYPiP8FoALiFyv61K3qqLtNh4xhanC7NBIyle58n3ti6cf
 ybRVA8VxeAVDDu+ZZE2x3EUmSx4cHASPxXIMlvDYGclBPdPwQ8vu+wJsToLHx7KIhi5E6lXcTWk
 5Ezl5IFUaOkfKOleKSSqIzLeMV70E2PqEhqc0gIMVRdUKLJiGpwllIOKIUr2OOp7mgL5Qtc1qMd
 9CLYDl/qsoENu7OjSB0YeBEpSuzu5JULtTy29Z9jFpYwVWLA8j69fs+ye3tek7KAXRDLVZOxHIT
 h3a3NQ8+2uJqcKyfuOw==
X-Proofpoint-ORIG-GUID: EIu7cVW4OGhETljqlHAeLQqzBL9ilmlp
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aeaf5f8 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zVOB84EVDXTtx2zVcRUA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfX31wu8xBbhDbO
 xLf90AIdZZn13ZI5nEGjY+oeCsurqSvnrpWBB9ShqVhKMvfauEzm0upAu0obQcxb2TjBlHX0ufz
 aJ7aqxdG7KVeI2eRWG7G6dcLC1ZP6zw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040036

The PCIe QMP PHYs on Glymur require both refgen for stable reference
voltage and qref for stable reference clock. The refgen requires two power
supplies: vdda-refgen0p9 and vdda-refgen1p2.

This series creates a Glymur-specific supply list including the refgen
supplies and updates both Gen5x4 and Gen4x2 configurations to use it.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Changes in v4:
- Add reviewed-by tags.
- Link to v3: https://lore.kernel.org/all/20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com/

Changes in v3:
- Add vdda-refgen-* porperty in all glymur and mahua board.dts.
- Reword commit msg.
- Link to v2: https://lore.kernel.org/all/20260623-phy_refgen-v2-0-4d15983bf91d@oss.qualcomm.com/

Changes in v2:
- Add dts patch in this series.
- Reword commit msg of dtbinding patch.
- Link to v1: https://lore.kernel.org/all/20260208-refgen-v1-0-87ca84fd78b3@oss.qualcomm.com/

---
Qiang Yu (3):
      dt-bindings: phy: sc8280xp-qmp-pcie: Add vdda-refgen supply for Glymur
      phy: qcom: qmp-pcie: Add vdda-refgen supplies for Glymur
      arm64: dts: qcom: Add refgen supplies for PCIe PHY on Glymur and Mahua boards

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 16 ++++++++++++++++
 .../boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts   |  2 ++
 .../boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts   |  4 ++++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi                 |  6 ++++++
 arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts   |  4 ++++
 arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts   |  6 ++++++
 arch/arm64/boot/dts/qcom/glymur-qcb.dts                  |  6 ++++++
 arch/arm64/boot/dts/qcom/mahua-crd.dts                   |  2 ++
 .../dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts     |  6 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c                 | 12 ++++++++----
 10 files changed, 60 insertions(+), 4 deletions(-)
---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20261103-phyrefgen_1104-1b4a2e9b7918

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

