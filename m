Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC7C330B01
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784781864; cv=none; b=rPBCXBcm7mFPvZUJ4GPcCvZEjJ1RQYseoEndQSh3a0FqFhmfIW8YIm4qGF+2aOwM4nqpYuJDno+vRGCUzNn9qEPFU3QkFcbqH6KwGqM4aEPJJaV+SdqKB1mp1dwK2uBnkZeiEUuw29HUgTrcTBOY0aqif8/sFmkNY1/5kvx1hoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784781864; c=relaxed/simple;
	bh=nKuit4V7ADhVypZf/Tu6SgJ6+Y4O/BLiqsj3vnOr99E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pXCNp6WYcUsbH+G6UgGuUetFJKUMqi+LuWGOweLZbWNYgsnW2z5anz4z5KOO4eOb17tC95M5Jg1EdMQOuD3JA/AzFEyknP8TggZvazCBOVdGmjzjKht7qgOB+4ZTOwDLXh/Rz9hSs16XRfT3tW1EFVio5VIWvuUQOzFYMIm7f5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FnLKHSWM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hc8Qtm8C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FnLKHSWM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hc8Qtm8C"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0X1In2398556
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fIm37QC9vX5p8SeR+t8ls7
	pgjxqXFcRxcGQJdyZIRs8=; b=FnLKHSWM4Mn0tX3rmP0lb2evrdaHDNj1SQ15HJ
	2tMHG2u+8GIsqvbaUqhSrHMeAoOEbchqPoSJ+/RfH0EHXtGo5ojrYqi7OnLvrZ9q
	z8m0Rpo4e8qYkFMfwXaZKLqR2CwhWEFUYfkOO+Nh5NrD9TviUUP5VLj2wPOSPstY
	pghZrJF9+JNuX05/kio6AiL3lqEWX+a8Qs6C5Z6cOU6Iv+RrPqi9g83FcdK/fo6+
	RPwnv7TP5FPgSz2m3zDqjY1xtM2JsIFMN/UKKgU4Szrg1ONwcJfwZbLJxmClGWli
	q7kApwAG3rMvSmbeavWRJBvaA1sjiVfk0uFMBinyVGXQE2Mg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjxm13c2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:44:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5bdd8450dso239638a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 21:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784781847; x=1785386647; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fIm37QC9vX5p8SeR+t8ls7pgjxqXFcRxcGQJdyZIRs8=;
        b=hc8Qtm8CbG5NEP904caQh2JEFyimCOZZNvmG5o3MyV50esgAwO5/UqHbAchV6Dh4mH
         ODqvQ73YC35w5zDle4aafC1FHUZd3T30fiiVnj8AETlEEuWTNAg6vD70Kzc3OdL3nzL4
         +YyzSrYmfOSJ9l6VfwL5pQRDNVVlAv0hDw6XA71c1Kfa+4UEZ6M3UW8Ws4EKsNeRbZwi
         zMD7FSwZri8u/U/RgYg2uQ8p88SM5aaQ4eH6pjEBAMjzelriPr+xgi1//tYp1ST6A9Jc
         pWNtwN/zuNH1Jv3ZH92a6TIHNiBTxg3IkG4pWcAdawspFUgraguw1mDwi0ztTBio7Psy
         +T5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784781847; x=1785386647;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fIm37QC9vX5p8SeR+t8ls7pgjxqXFcRxcGQJdyZIRs8=;
        b=jPD2Y+IgD5M6pPbJvJbFSHq7lw2JrfLGbR2nZc7Wu78NyF3T6D2CvunVHGR2XMN/Vx
         QPlyAvaD2926IPCXM4YJlYju15hZ2cTg9xhM9MAP3kLzdoRm7ffuOPg2V7FUqdswpySL
         AdQDiJ7G8ji/9eYvKES3+R92b5h/qjyZ1smDKBYP12HgGO5/QO0Z8c7m6KU2c1sciDer
         pFa0VgubskU0ZVLKP7pNGwLZDOIHQ6CSFJhpVJ6PC+uGKfxg+/lA+bT4bOU1QV8bTLKl
         NhbPWtO8TxROpiFQm9EY5GENmVNWq2FCUMuMTxcEk5gz1sX0ajs129P1X2coTGqyzcEW
         4WRw==
X-Gm-Message-State: AOJu0YwxlRZ1LxNVyof1lSgGE8Cqex+v8IfsajIBv+mmvQdf7nTEm+3j
	gFtqp0GM2ZFU1xQQqJxH3O3ZPdv2b0srJe1XJhzYSVMhZLBBDHmy9w1wHrMIKcTvt9wx6rBoxuJ
	DkqqrZkGTD/iKtegv6zNsiF9yLSUKH+PE1IGYVFupYCbLzKqIKmauXTJ5PeRnjh7S+wI0
X-Gm-Gg: AR+sD11G9T8PpHFoxBtxZ2LV85EvqHPUBKfjFMc/Cq6TpaRs3ziuB8DsKZW2Nt/9OaQ
	6AoAuvbgEBlCRLHcMBordycPm2Iqokgv4qOhdNC4DnaPLCyLHrcY7eAJG0n5GKQ8zOyfKLK8RJn
	BmnlogRKWaGd30EwFejE7yKrEACc7k+AdaZ5jRoKtocKtV17nlv3ieUCv2pM5ZT6sKFiRY8G0j8
	f7wvSWkkZpg6FOgHbcGN87qyO7bmNddf1Al1Rm89+mCZg9TzZqOcWBPVpAJCdetyoeTM6vVkna+
	ep6uyyVKGFpBoMN3DQKS1OLpe6yfWEQYI6GiSHFTkLoZrka3OAP8uGn7v4LjkVGvQaUqlTQER8y
	uKqIqSA73Jzj9z8ZcFjSJpHVNc4aI71w=
X-Received: by 2002:a05:6a00:a01:b0:848:2f74:1d5b with SMTP id d2e1a72fcca58-84e2bbd287fmr1748802b3a.65.1784781847322;
        Wed, 22 Jul 2026 21:44:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:a01:b0:848:2f74:1d5b with SMTP id d2e1a72fcca58-84e2bbd287fmr1748780b3a.65.1784781846738;
        Wed, 22 Jul 2026 21:44:06 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175aad1asm2327922b3a.44.2026.07.22.21.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:44:06 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v6 0/6] Add CAMSS and IMX577 sensor support for Shikra EVK
Date: Thu, 23 Jul 2026 10:13:54 +0530
Message-Id: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAucYWoC/43OTW7DIBAF4KtYrEvEAINJVrlH1QW/NWoT1+C4r
 SLfvdhZpAun6makN+J9w5WUkFMo5NBcSQ5TKqk/16CeGuI6c34NNPmaCWdcMeSKli69ZUOdOZV
 Cl0b4pC6qqJRxqJQltfmRQ0xfq/r8css5DJeKj7clsaYE6vrTKY2HxobQKuExCglked+lMvb5e
 /3UBGvhz/sTUEaVRM+ddi2a9jiMaTdczPtyYlfHyk78TimmtyleKWdgL5SNwGF/7EvZoMQvCnC
 bEpXSoIXUEKX27AEl/0HJSllnEZiGVqB9QOGdakFsU1gpb1HYAOidjBvUPM8/JOfS3hkCAAA=
X-Change-ID: 20260526-shikra-camss-review-cf6f66ac566b
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784781838; l=4764;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=nKuit4V7ADhVypZf/Tu6SgJ6+Y4O/BLiqsj3vnOr99E=;
 b=OB4LtKignbjqHtdfWglJdcGkTZjNsSr2FjwwBDwKd8jPrU+MBtLDuE4SPAgBkoDkVadcELSkz
 j81RBW1SjE2AXXCYf+nlTSGmfTx5CL5p6PH6Gppjpo1Q+GaB55J6w4E
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfXymXLaopq6/nw
 R8fykDqOym7jsaxzAZwH4W7J7VCGNkvyKwDs2Y0Bhg2rIu31cU+63Nk5MsgY1HBwEoidEqUBmeh
 8aS54HmwcDgdeOI71dlmQPskMgmpW7E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfX7rAbuGPy4KkZ
 2dpAcDGIvcMlK9xj9wu2Ye9N+SGR2lgOJMFaSlCCm3B5MKjTFAfHLa7n2Sad67ilXV1rSc/RtPg
 zESxmBrhMJu8Qy1kKAHqF7FFGF17DNU9Tpp4tai2j6D2mN1pVDZmM+y8MZXx8CKgndCY5PSo0QT
 9IZ7ubtLWeD6U0hjL9XzuVF0quX0I6BG+2CBH1oMXWCD1u/lF63N1bl1cjBAnN8VnEfdyv+vb9Q
 kgs0gcEZmxMc2EbmWU57KrdWCHMYsKVQkUKsM9Z7BPV7gxUfwKtmyJrTfNaA1qeZCmx0yNlJoF5
 vguEnZ+an2qrcsWrn5AaUoH+B9NPoIIx7wUX43kNsfErugBpkaGg7GBSCQRaLpOSHyOGIPN3tfg
 zA8giW/T1qcwtL/WbGXGVC4RMJHDg0hsOlL3EaFxIWUYcxE4DIXyAqmEZEG++5brzolRh7hRMSS
 ATeM83Tc76edp1u4eMg==
X-Authority-Analysis: v=2.4 cv=Rsv16imK c=1 sm=1 tr=0 ts=6a619c18 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SCY8RljC4g58VSpTV0sA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: XIhb-C3dS-diHo3fUAXjjcbxFElcG2sj
X-Proofpoint-ORIG-GUID: XIhb-C3dS-diHo3fUAXjjcbxFElcG2sj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230045

Shikra EVK is based on the Qualcomm Shikra SoC.
It lacks a camera sensor in its default configuration.
This series adds CAMSS driver support, CCI definitions and enables
the 22-pin IMX577 sensor via CSIPHY1 through device tree overlays.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl --reset
- media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,qcm2290-camss.yaml dt_binding_check W=1
- make CHECK_DTBS=y W=1 qcom/qrb2210-rb1-vision-mezzanine.dtb
- make CHECK_DTBS=1 W=1 qcom/shikra-cqm-cqs-evk-imx577-camera.dtb
- make CHECK_DTBS=1 W=1 qcom/shikra-iqs-evk-imx577-camera.dtb
- make CHECK_DTBS=y W=1 dtbs

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Changes in v6:
- Rebase on top of linux-next (20260721)
- Sort CAMSS by unit-address numerically - sashiko
- Collected Reviewed-by tag (Loic)
- Link to v5: https://lore.kernel.org/r/20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com

Changes in v5:
- Rebase on top of linux-next (20260710)
- Drop dependency on shikra-dt series; now in linux-next
- Drop dependency on shikra-gcc-rpmcc-clks series; now in linux-next
- TLMM pin entries roughly sorted by the pin index (Konrad)
- Link to v4: https://lore.kernel.org/r/20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com

Changes in v4:
- Fix data-lanes numbering to start from 1 in all endpoints (Vladimir)
  Missed in last rev.
- Link to v3: https://lore.kernel.org/r/20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com

Changes in v3:
- Drop dt-bindings: i2c: qcom-cci: Document Shikra compatible; already
  picked by Andi Shyti into her i2c tree (now in linux-next as e3a8f8329397)
- Preserve blank line after compatible const in qcom,qcm2290-camss.yaml (Krzysztof)
- Add blank line between iommus and power-domains in CAMSS node (Vladimir)
- Move cam1_reset_default pinctrl state from board .dts files into the
  mezzanine .dtso overlay files (Vladimir)
- Collect Reviewed-by tags
- Link to v2: https://lore.kernel.org/r/20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com

Changes in v2:
- Drop qcm2390_resources struct and CAMSS_2390 enum; use qcom,qcm2290-camss
  as fallback compatible string since Shikra CAMSS is register-compatible
  with QCM2290 (Loic, Bryan)
- Use oneOf in iommus to describe all valid SID combinations: VFE-only
  (Shikra) and VFE+CDM+OPE read+OPE write (QCM2290/Agatti); add
  per-entry descriptions naming each SID (Krzysztof, Bryan)
- Rename shikra-cqm-evk-imx577-camera overlay to
  shikra-cqm-cqs-evk-imx577-camera, shared by both CQM and CQS EVK
  boards which use the same PM4125 PMIC and camera supply rails (Bryan)
- Add reset-gpios pinctrl state for IMX577 sensor (gpio33, cam1-reset-default-state)
- Add comment in overlay DTS explaining absent regulators are powered
  by the daughter board (Bryan)
- Collect Reviewed-by tags
- Add reset-gpios pinctrl state for IMX577 sensor.
- Link to v1: https://lore.kernel.org/r/20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com

---
Nihal Kumar Gupta (6):
      dt-bindings: media: qcom: Add Shikra CAMSS compatible
      arm64: dts: qcom: shikra: Add CAMSS node
      arm64: dts: qcom: shikra: Add CCI definitions
      arm64: dts: qcom: shikra: Add pin configuration for mclks
      arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera: Add DT overlay
      arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add DT overlay

 .../bindings/media/qcom,qcm2290-camss.yaml         |  15 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   8 +
 .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso |  79 ++++++++
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     |  79 ++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 198 +++++++++++++++++++++
 5 files changed, 377 insertions(+), 2 deletions(-)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260526-shikra-camss-review-cf6f66ac566b

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

