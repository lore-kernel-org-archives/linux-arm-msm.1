Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60503ED3A6
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 10:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544916; cv=none; b=FWNvagphvvOqdcIRVmRfZXWGCBp4mpFGyzF99W+/bKwwDM1xOdnX/aCHu0AdDfH3blXwI8XZzGQ7JSXu5pTg17G/ZY4DkJg1pEwTGLPv2v+SERtoMbaq8fxbnLc3nXMe51LNZtHLV97RW3Q+ciqoswAabw7/N750hDH1LLjjlLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544916; c=relaxed/simple;
	bh=Y/gGVRAhMaYjGE8ONhUe629AGuSKZikWYd6GZQmv3W0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e5wr7wAnwa+7r3uNELKHTNboGAfQR4K/iBLqlrmNmtN0kVTkwTa5hFEZ+Bxvh3U4U1q+dKDsN5VcoPZ5GVY03/tmktSf69QSyYNraNk1KCANA5tgjjcmXujAypkpa9gVXbOjd3aTLdJT+57bcItBYCfzma2kYh5qUg+C/tXce6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ghLam3FT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CuLpP78e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ghLam3FT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CuLpP78e"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9va752238489
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 10:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Uti1LSuWOayaEmAtG4Zpi5
	Si5AhvOPagMBk+dTp43FM=; b=ghLam3FTDhCtlvvuVyfb8cpCgsrMLjdP7F1OSq
	ArO0TvB6O0yVNjk9UDagxH7b9bNXR2iRUM6h6d2+RDEMlXlE/TgrYkpHNevAj+Iw
	XZnt6ImN1XrSmvU/nB4w4tTgezV4tFjZCUeKLfTNs6h/mXbP2g6rk8PokV0Efv1F
	O0hQ6E9Aho2DT1S9y/aATPUoVi/LPubcUKYKKtNoOZLZabYa3vvl9ciL3ju2Y/CJ
	KsfRG+yArY1zRH9AWFH5Ef9IeBWNJb9XhIDJgQDdvTbhbtc04c0J345OM6jUuL5j
	nce0je+u4+HI6L+YfSmPAneJr7rWPh2zx7ZAKmCESPjv4jIw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgre8dv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 10:55:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso6279221a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 03:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784544912; x=1785149712; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Uti1LSuWOayaEmAtG4Zpi5Si5AhvOPagMBk+dTp43FM=;
        b=CuLpP78edS6BwYWqQW7Gde0Y1xjnap4Rg+bQ+U0kap1ytOPQrMl4SdtaeLGBvBHeGH
         apFo8Lu/MLiN2TazAnrCGS/tJiTrJXkU/r3Y7fch2O58F5pC5ypXRU/0NG/PU3fgKp28
         xK/v7mjMZe4uo5+hm7PdV+Intpw8vqmzAaeVng3+oQGEMNs+2xrz6DDq20/dUXV1kSo5
         hvO0IyXAVns2J0UT6zhfLra2Jr9mvHW+Hr2ll8y8qu7wqiW1krTS+mU/RkOUegCPxCsf
         EZVOLpiusD0oE2zkTC/A/x9lDKpBlgS0Py0fsFpS3ku2KU/4j3jQFKopqdDh58yHe7rW
         oFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544912; x=1785149712;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uti1LSuWOayaEmAtG4Zpi5Si5AhvOPagMBk+dTp43FM=;
        b=HWs4eFfDK09ZzMdmoZIYd/LAtwrsZEBu5Wq62qxvcYpPY9jUrRai6T/FBIDk+a+3iJ
         Tva4TVmaRlDNDk27uBCXWFH90FmUIg2w3msaFp+WP016i7E6rgxBLmBhe4gWL0X7nD2q
         iV9TdnzNdf43ZnFM64/pCIub2EMwLPWbefBBhzfrtCdySgp+EuxxrqfodsGMSd2HOkW8
         nuXitQ8PFF7jlHMRR7+9piCS38cnR6GYoxjzD+66jGSKg6cMNS0MOFHqP+jIUnureA/o
         ngIYYaYK3OTEXa1wBk8ScM5WIPaGb4MROU1rZJlg7U8EAHpukYSZXbmPVeg2etCG3WJ7
         md8w==
X-Gm-Message-State: AOJu0YxpeHMjN74wi1ZpcwgK7JtQRv2hkNEs7aT90YQQste0WKhzMtHb
	K0n/L3U0XTmLhuE/KcjTov12aYegblKOHCAdwcyVWB+mrHkItt6B8Y+op3JpkTwVnhVGT6lK0TT
	A0rnDA9ZrKOkweGeFm96dvE24q7cdC2IcA+g3wtB7+PexYRbYzU9fYg1yCnCdit2UqSAYbf1jrq
	U=
X-Gm-Gg: AR+sD10LaO1GoUFmSNvK7nHu9Jbm4V78iQlCf3dgXX5TjEgfjOxS2o5/MnYxYPx8rGV
	KyydTD1cLDUXPIbNDSasZo+RYJtP10gTX2+XbeVd1sIcCos/qE3O/NxJ8HIR1uuVc3MzB+aqp1F
	qukOHyNT9X1u+b+zWciC989MQTWvigvIRwTj4jTfwZfudItTgWSqatnt7S4Qt+Vv6ZgE6+2NPBM
	KPSew9A9/6kD9cpjjSw4qDS1dmlFzDENwX0IWm3dlnlvjHD34VKmxZfOhG4gF8ljHyBxvVhEr0w
	qwpDtP+tU0xcDgPF9fqtcBuScxUq9so9r3NDUzcGbMJiGU//7GuP1zk/rkVm/eQ1G40Vq1NDeAG
	tOVZ5naedC0ZPWgpy2+n3uuGGH+P2iA==
X-Received: by 2002:a17:90b:2703:b0:37f:9cdf:f0ab with SMTP id 98e67ed59e1d1-38e4b53898fmr13926103a91.26.1784544912249;
        Mon, 20 Jul 2026 03:55:12 -0700 (PDT)
X-Received: by 2002:a17:90b:2703:b0:37f:9cdf:f0ab with SMTP id 98e67ed59e1d1-38e4b53898fmr13926055a91.26.1784544911790;
        Mon, 20 Jul 2026 03:55:11 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4b20df7esm5661431a91.13.2026.07.20.03.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:55:10 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: [PATCH v2 0/3] regulator: qcom_smd-regulator: fix PM2250 supply
 parent mappings
Date: Mon, 20 Jul 2026 16:25:03 +0530
Message-Id: <20260720-pm2250-fix-supply-parent-v2-0-60ca47031b50@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIf+XWoC/3WNQQqDMBBFryJZdyQZNdKueo/iIupYA2rSjEpFv
 HtToctuBt7n/ze7YAqWWNySXQRaLVs3RcBLIpreTE8C20YWKFHLUuXgR8RCQmffwIv3wwbeBJp
 mqK+qplZ1umi0iHMfKJZO9aOK3FueXdjOT6v6pj9p+V+6KpBgNKrM5Giyurg75vS1mKFx45jGI
 6rjOD7fVf60xwAAAA==
X-Change-ID: 20260714-pm2250-fix-supply-parent-b91bed1f65c6
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784544905; l=1557;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=Y/gGVRAhMaYjGE8ONhUe629AGuSKZikWYd6GZQmv3W0=;
 b=B2f+SCjQ7FUl8dtAHg46kepruUtCFYovPj+g/LpQqHNILK8aSxk0Ajx78R/jSkwW642D+NNt1
 Q6L51IKKIlaC92qoMDvWsNhMlczUbty9+D3rwdFYPyM8YB6SeZL0heL
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyMSBTYWx0ZWRfX8f2ItgAPO5RI
 bQT8Xv2OiTz7yOF1BLcy4eWRAszP0C4apdwkMhUdCnE7P/W/UWM4a8uBWMzvpHDH26syVWHb18P
 4v6TKYMIsICYe7lt08Ji/80DTrDtPNo=
X-Proofpoint-GUID: cePn5PRzKGdavk0ARpsd9KL77tIhRHe8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyMSBTYWx0ZWRfX/ODxLqxpTuoi
 7zekJe69g972pFZRA/gunXrLNvbRaAyc/K7d1gTI1OSP+Ol/4dT90xAFJuBvLcgzC2IVLRwHR4b
 PTqUXygdM/2FR/rhAuFScQdnHhEZTzFu69Nty3O/aGlpqPPi16C5MpI53TB2wcnKGdn250XD8s9
 /bF7fOs1Q+JRDMTchPuCYsje075uyXEXcjclOwZipavwAxLqnhc/XbOYbTKBaaZwZ/n6t+hjCwN
 H+0HAkkE3LPuUyMnWr4zek7gW/I1K/JxFUA5Zi2kAJMVzxjeBjSkn1McnD9dQ54Fy/syh2hIH7Q
 3MqLYsgPM6xTJaQAPQoJBjf4kygQVBUBP/R0Mik1+LWqV7ARwmSdQpohf8wP3kyhIa4Vrf9jT8y
 HS9iIktq5xI3G/4UAMmVzZNF1hI/Hxj6a89YOP597orY+Z9IItkoe9dlH47qZewaHpv6xeAjL+4
 DpGshoorVSG+Njg87rA==
X-Proofpoint-ORIG-GUID: cePn5PRzKGdavk0ARpsd9KL77tIhRHe8
X-Authority-Analysis: v=2.4 cv=foLsol4f c=1 sm=1 tr=0 ts=6a5dfe91 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=NDNaKZCUvlyLJqUQzJIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200121

The rpm_pm2250_regulators table hardcodes supply parent name strings
in the regulator descriptor, causing the Linux regulator framework to
vote on parent supplies from APPS unnecessarily. On RPM-based platforms,
parent-child supply relationships are managed entirely by RPM firmware.

Fix this by setting supply names to NULL in the driver descriptor, and
correct the supply parent mappings in the qrb2210 and Shikra DTS files
to match the actual PM4125 pin connections.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Changes in v2:
- Fix the pm4125_s1 regulator min and max voltages.
- Add missing parent supply for pm4125_s1 and pm4125_s2.
- Link to v1: https://patch.msgid.link/20260717-pm2250-fix-supply-parent-v1-0-a6213a42a3b5@oss.qualcomm.com

---
Rakesh Kota (3):
      regulator: qcom_smd-regulator: fix PM2250 supply parent mappings
      arm64: dts: qcom: qrb2210: fix PM4125 regulator supply parent mappings
      arm64: dts: qcom: shikra: add vph_pwr and fix supply parent mappings

 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 13 ++++--
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 13 ++++--
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi       | 33 ++++++++++++++
 drivers/regulator/qcom_smd-regulator.c             | 52 +++++++++++-----------
 4 files changed, 79 insertions(+), 32 deletions(-)
---
base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
change-id: 20260714-pm2250-fix-supply-parent-b91bed1f65c6

Best regards,
--  
Rakesh Kota <rakesh.kota@oss.qualcomm.com>

