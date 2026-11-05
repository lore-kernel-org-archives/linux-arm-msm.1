Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922702;
	b=EzmBDOJ5wE7CzylcixET0JjUYOmU66pWYlYrcdZ8yokdxawxaCnZVTgMLXfiWjW2fNeB
	 LCzLK+6fHtiAqgBNYBGmKpR/2shFqGd5oEkql/yjH3xO5pybxz6TTChUzPssupXM7bsW4
	 D3vJswOQp3cbzLls7i5j1dg+vmTzPQLGcAbUP5Rgnk6DWGVUg96Lz8Diw0rqPcATYzzas
	 UpPkqSV6gU73dsBu3UVoxddhS0ktcFAiBHjAC1XLpzVuL5+B7+GpMdsV7bdLBdE20SZI3
	 9GG8XPFJjqSUAiKy1e/8rnKyWYyP3P5+ERDwrXOBJ2fHCYpR+A5SQIr1hYYli+4qSGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922702;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N8Ql98e94Qr0HslTjwnS4H5aOtXcYb6/J/fG/eqd55s=;
	b=nD+4cDKtoobxAgNTxCJ+TBndF5X/8AhFH/kUONdBR1Q+82kV1cuIDjD/ZKmdIe1vHurW
	 LPrDDl6dExhhuO/pM9GgHlM3NLDxb2i5urMo55W4NefJc2A97oysv4/Q6AvQCSMvcCV52
	 G09P+ffivjWUELYnIfU4oFfg6U+CptMkvevk6v2by4d9vSthtMXbIpuf1et11cwu6WyPY
	 qXis0R7q4ZfHEkzolFflVe9yW7KwvjPJGPSodlCW3G/KOlRl54HIC7DSSfMopwsU3OskM
	 JTveT6qYlppRXDDT3CwKhiR9TiGVnCHs38nWX1273wWIeL9o9JQdxDfltUI0zRnIkQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+UjozBm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eyuUzIZG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3865606A331
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 23:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3865606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+UjozBm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eyuUzIZG
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5Nesp82274556
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 23:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=N8Ql98e94Qr0HslTjwnS4H5aOtXcYb6/J/f
	G/eqd55s=; b=F+UjozBmVBcvwneBwTSXima+BbRVI6h+ffQRqAhkLPx0ZQl09T/
	+ZLiI8aZAdRm5chsoekTmRXL0p4A71vUvXP9jbcEeiLICqNEBwlTv2KnjFl0AIuL
	f2Oxm3hA2LBTgu3IsodErcUB/5STKF0cvsEkcWkh0hGU6s8AsYb+nSdJmCyrOiJ6
	0LitlJ2NPdsEpx5TaeXZvI83XjRjya0Ixh1c0XkcNxgLMRyYdSIPcsY80AxQACtZ
	tJCbgXITWx7evwfhOrTDD8omGbTKEGw68YxiJMY+maGKNRTPovFasS5z00qNV5uZ
	GVWAN3iEFrBVsrRfe0bc2ymz9U10qA0ASFw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa01u6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 23:51:40 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso98896eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 15:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793922700; x=1794527500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N8Ql98e94Qr0HslTjwnS4H5aOtXcYb6/J/fG/eqd55s=;
        b=eyuUzIZGudnj0MA776vVvBEe8rjoPYHQlsLwqnlZXfx8WKhla2g/T3YGDg5IyXOI7Y
         tsXNXCZLUEBbk6N/SrnrI5Hm8UsSzDvSy65X+HNefesQmYiH8pDCeaP7drmJqInN7WHn
         mnQyACIGBdP7rG/jdGUMlo6Kekn67oCJ6Gb6I+HxRX9Ti2k4qrA+EWX+KIMa1t4EvfFd
         B2F8cpB8xCE9XU6DEJfl7dM+/1omhR2PySZ6+7mg7dql7dNGY4bIjn/dPbvnIMk1M4M6
         5Iodbmfri42Oh2V9KV2DbYADUILhMCFeSuUPy11v1gkFYJJJx1EuNO0DH+3iMrK+W0bC
         a2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922700; x=1794527500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8Ql98e94Qr0HslTjwnS4H5aOtXcYb6/J/fG/eqd55s=;
        b=Qs32qeCj9ghsLQx7vr9nvEkTTNY63J/G4LmHfykvDTAhvwD8OHqRHZ4Ps7sggsVq9+
         a4Vz+BreRJ4SAg+k+5Jh4Mx4SQT8dX1Ea2gbQxMbiRKl2KbI2ZSk632Vq3118r86XvaF
         Dx7qXl2i+RSRKxzOasXCjIUzHpWnzBqmtaIrXOSetCiuotbsoMTd8v34wJznV8E/efok
         7hwejITfsSkjV8OO4TYSbGK85nVloDMnRj9Wg6V4Yp8Uu8Oq5sbpGhWiSltISHQ6ZW0i
         a9ckvl3cFs0a+kJLGwrSh5zCgKS/X0zlClZpFgqRsM1rDtaXNaXaYupfWaeN7mstwp3V
         JCyg==
X-Forwarded-Encrypted: i=1; AKwUvBwxxhM7uh4tjPse8mfLjKw9cBrY7TEbXYwF3hwxAUJVEtwuakX34FUXyG/CS/VcVJHRnBe1LRT7n0pWiKTU@vger.kernel.org
X-Gm-Message-State: APuU4Z+e8qb75+uNNvKnBOm5RVmT+IBMHoUHY5Z//7Ep7z8jOh2A+N4d
	LxOQx6ai1G3LrcVQfaezsFRxvvmbLzBZh+qvE7GQ9BYiJT9UHoV9lDOK7q1McgNGsQtijfoJBGW
	SKUT1K6MfUoKQxn/7m97nrlIDkoUgOKnCvy2EmqUPOidtDWTn4/P3BZjoZeamc4FtSDEY
X-Gm-Gg: AYBFou21P/MZr5Y8yRbXv01w4yzzDw24oRPKU4o50xal81AtBZBl8XzM4nDE16vNBNR
	td0Sv3QgO0akVKvt4Q0AkZxDeExATIGsX8C2GAKuHqEOHzviub6WHL/SE8+6NXpq2UOt2Lyg7Pz
	7csx0eEk5mMmPxHwDOrN24GftOgtuBmxfC9h4pUZ7wPI/V7QNVkkSYJhaPGJKDdPFQyRBE3dWdm
	DWqsHuP+d6iwATPudYfB6ROIS3RZzYeiEAT8gEYv0mcyCczWfYOhvd1Q8Vt9EkX7KL3Gv3EeRJv
	yMQvdaP57YEMqE/7YLn4TNpZD3Xusxohr3kWqglz2nSlgGz0nLWOwHuboUFcY96KSNejgVmqsGI
	MkSveUtXadsUgiXmIZynOHqLDYSF7pk7syfV9dODcw0/8ggqo2UcoCYm0SaCAhGcotNUq8Bz1kb
	Ptz/JHMJbFtVGu8fKu9QOpCmOuwGw=
X-Received: by 2002:a05:7022:b90c:b0:15e:3a65:5b97 with SMTP id a92af1059eb24-1b25d31e64bmr690545c88.16.1793922699476;
        Thu, 05 Nov 2026 15:51:39 -0800 (PST)
X-Received: by 2002:a05:7022:b90c:b0:15e:3a65:5b97 with SMTP id a92af1059eb24-1b25d31e64bmr690523c88.16.1793922698781;
        Thu, 05 Nov 2026 15:51:38 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a63f6sm389041c88.9.2026.11.05.15.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:51:38 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 0/4] phy: qcom-mipi-csi2: Add D-PHY support for sa8775p, qcs8300 and sc7280
Date: Thu,  5 Nov 2026 15:51:33 -0800
Message-Id: <20261105235137.2635442-1-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA5NSBTYWx0ZWRfX2jC7phe3nmsn
 sk7H/fg/4903tyeWsgRWs5HP8b3zDX0dq0x3+way53mFp5BScB0WuuJBhvv0Zhrq4XJUB71ZgK+
 PdKQifia4+o0RzIj9tw6X9dFuv9eWbTxFJgYsAAR5Rk3DxTDhCzu87Owg8AO4yMeL4DxF9jYUiO
 Hn7uzElDHaSkrHmIh97X2nuAfph+TUhkFdLc91AxuXueikTDZ+w8BYund9OL6oPnof8+gflEUGX
 /o25+eVX2bUz6QwNBXmaMzAIZWuaYNOosMcOxQSJO58phzPWegdYqMhYL48N6prvPNblIvpqh9M
 TNWQoKnKAybS4O1rHFia+FAmO7SLZUhN4q+EY1R4naABfnaTquDXqTj3pK+G8OKH06tKUPchlvN
 GzR+j6bbhmeR4HBnfdP7svTRL9c3C5rnBmYva9iQHAUwwKf5tWDtlMidu/442NPjcxCsxPU+ZIc
 5Vz3fKaTDspewcMMGKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA5NSBTYWx0ZWRfX5piQVCBHE3P0
 xTg5pYtl7VuRanLSUYZdYZfyqBfNzAGGGPswotIA7IGqVsHrkk+ZD1lwvk/pEzn3xLaP0nZofBa
 Kgr/qiu7xWZfMxKmw+YLZEnfhan6uVs=
X-Proofpoint-ORIG-GUID: BULB-08WtajpGzR2vftwjTnHEY5RyRLT
X-Authority-Analysis: v=2.4 cv=GpzXaU1C c=1 sm=1 tr=0 ts=6aed168c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iQrEevU3y8pT7K306hwA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: BULB-08WtajpGzR2vftwjTnHEY5RyRLT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611050095

This series extends the generic Qualcomm MIPI CSI2 PHY driver
(drivers/phy/qualcomm/phy-qcom-mipi-csi2-*) with three additional
CSIPHY variants: SA8775P, QCS8300 and SC7280. The driver currently
only supports x1e80100; these SoCs let CAMSS consume the CSIPHY through
the common PHY framework instead of the CSIPHY logic embedded in the
legacy in-tree CAMSS driver.

QCS8300 shares the same CSIPHY D-PHY hardware as SA8775P, so it does
not need its own of_device_id entry: the qcom,csi2-phy.yaml binding
declares "qcom,sa8775p-csi2-phy" as QCS8300's fallback compatible, and
QCS8300 CSIPHY nodes bind through patch 3's existing
"qcom,sa8775p-csi2-phy" match entry.

Tested on sa8775p, qcs8300 and sc7280.

Changes in v3:
- Patch 1 (binding): renamed vdda-phy-supply/vdda-pll-supply to
  vdda-hs-supply/vdda-lp-supply, and restored the DPHY split-mode
  port@0 definition (two endpoints, lane-count constraint) that was
  dropped from the combined schema, cloning it from
  qcom,x1e80100-csi2-phy.yaml instead.
- Dropped "phy: qcom-mipi-csi2: Make timer and OPP clock names
  configurable": no SoC this driver supports actually needs different
  clock names, so the patch had no real effect.
- Patch 2 ("Make OPP table optional") no longer depends on the
  dropped patch's configurable opp_clk_name field; it now adds a
  plain no_opp bool instead, with "timer"/"core" kept as hardcoded
  literals.
- Patches 3 and 4 (sa8775p, sc7280) dropped their now-unnecessary
  timer_clk_name/opp_clk_name overrides, and renamed their
  vdda-phy/vdda-pll supplies to vdda-hs/vdda-lp to match patch 1.

Link to v2: https://lore.kernel.org/all/20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com/

Changes in v2:
- Dropped "phy: qcom-mipi-csi2: fix -EEXIST probe failure on single
  power-domain SoCs" from this series; posted standalone instead,
  renamed to "Add support for single power-domain SoCs" since it adds
  a case rather than fixing a bug.
- Squashed the standalone qcom,sa8775p-csi2-phy.yaml/qcom,qcs8300 enum
  addition/qcom,sc7280-csi2-phy.yaml schemas into one shared
  qcom,csi2-phy.yaml, modelled as a oneOf compatible list instead of
  one file per SoC.
- Dropped the standalone "qcom,qcs8300-csi2-phy" of_device_id entry;
  QCS8300 now binds through the sa8775p match entry via the binding's
  fallback compatible instead, since the two SoCs are fully hardware
  compatible.
- Squashed the separate "Add qcs8300 CSI2 PHY support" patch into
  "Add sa8775p D-PHY support" to match.

Link to v1: https://lore.kernel.org/all/20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com/

Anusha Arun Nandi (4):
  dt-bindings: phy: qcom: Add common qcom,csi2-phy
  phy: qcom-mipi-csi2: Make OPP table optional
  phy: qcom-mipi-csi2: Add sa8775p D-PHY support
  phy: qcom-mipi-csi2: Add sc7280 D-PHY provider

 .../bindings/phy/qcom,csi2-phy.yaml           | 201 +++++++++++++++
 .../qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c    | 228 +++++++++++++++++-
 .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    |  74 +++---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |   5 +
 4 files changed, 474 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,csi2-phy.yaml
 
Best regards,
-- 
Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
-- 
-- 
2.34.1

