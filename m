Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1E845A298
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 15:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785253800; cv=none; b=gMbXK4ZjgmfQuUnHGKZV3+OJfLnY3MV+ylX4fuLJW0wM9BaY2DuRTvVNrZjhH/FodkDtEB6ixiZQzJA0NFz9aJEChLHWtXRQ0SYcyITsecpeN/F/aT5Wb2XznHehU4+PN8EkJqR4Z+S2Wx1SoxY7aDSpwb3O3D6XwNFPOLQMiOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785253800; c=relaxed/simple;
	bh=i98nLsq3plVYZ5GSaDZ+JNgzCDFEsljA5/ZokH79WHs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SDpMs0ZlIgVAoYLHIT5QNUTwA5MAvFB2yI2BC3d/HkEZzhP8p52ZeCT8ePQLTCiv3pseRVz6Srq6b2KEfbTGje9Vwe4NX+UyZp9gRayv8pP4r6tQik67i/FbnCXtsrxAtKKcVTPtkBnGVkJZatVZZafZWxdj5j2FfZxoMvnhl4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lOjGND0R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fxFkxSGe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lOjGND0R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fxFkxSGe"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SEcnvw3075706
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 15:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FHYDH5WodRMF1rX9N1FNnt
	WnNNO8ka9n8k7E4wk/+V0=; b=lOjGND0R8cOfCG8y3O6lKJbiv8z+MXw1QXuXAB
	Q3C7YwE8NFaGmHIqIj3/bpNG7tyw26ecbHdozndGfRJK/4YvCKzkjS+wEiDsn5K5
	wrAKOXcVbSuOnn0taASocEQFZiAYSLp8a128A6ZXs2nTc4nOma1mg3WPx0khs2oV
	fhTgB8cfnPt1u3NHBhtYfeovrDu1MBG5QxzD25XM4xlE1QHmCWQV7Gjar3VW5PO7
	kHJEVE0fhmRMct2Rht5KlfNOiJbBUwaj/6JW4xDL75cE8XqZz6tRywW0t6C4yOqX
	loV1Dwc21e6/aMFcyaUPnGm0fQd0HeD3IMVOBFk4fQ1d51fw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn19k31y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 15:49:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cacd6d37edso312205ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 08:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785253797; x=1785858597; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FHYDH5WodRMF1rX9N1FNntWnNNO8ka9n8k7E4wk/+V0=;
        b=fxFkxSGepASQImQa4YcfFbiBJKjZj0+rBX43s3XPztLZbgCU8KpNpCpC24uOd8WzUA
         iVw9JpYYR2eSr45gwno+176Wpsm3D2F1Rejm7XcFjUuVNaa5BgQENaMr/H9EXt+PnO7n
         +IKJii2z8uCtxgfhT7rs8DZsYkvORP61Fq1fe6Uwupk45EPA0FtpVzCt4H9i1ERdwStw
         Q7C0UvIYFSZOIOdMChhY9USuIDuBfj1B8a7Y7CbuNk8Yz4XSIKmPWo+JYSbWbY8gjg9Y
         PjNk2XTS2u1s4scIzeSzqRlMNIUHJ6DA9anBZmwSUZEN1kf6hvBGhlgstJlCk+PFVE+7
         si8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253797; x=1785858597;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FHYDH5WodRMF1rX9N1FNntWnNNO8ka9n8k7E4wk/+V0=;
        b=GpcZxHaFAKTbZeApnuHIWdVwBCYfBIfl3NRMEakFWncxsFOUVPGaDhcbv4vZtIQ+h7
         UCO1USy9jI+NITLrVNPIbpxu1DLytISidDho7dgkfFqNA+xM4iVF31kbNCAwazIW5WtB
         KwpG+jtYfp7sYuEPRoua1953qwb9GnDK03u/Kmu2LWEmVV3VeEdZzp3aN4CZompEHLOg
         Hu+2XVJsr7EBanDSYWbkEt5doPNjmL/vKlx084fAsxnOMAFCYuQF+xGJusZdkpfbVAkV
         c7dLmWTrV+zXZ5jopXIH6l2II0xq3RhExs//zBfk35XwBKyCrFK12RDU+MxYRro/1biz
         v3ww==
X-Gm-Message-State: AOJu0YyJ8MJmBMDpifG+wWA4L7r7YCIZEpl9sU0offCS68i/59td/jLQ
	WJ0fe55WfSvE644JODSco/rVLjILjjZr14gtjIKiX1vNam25nJmQ2EitA51tLKsQWdWStnuVeEH
	ViLgkINF4+dLqjZImWL7Zu9ebHbHv99/d/5smzHJRihqP1trf/NqOKLyLOGwulMstw9VC1wd4Y1
	83
X-Gm-Gg: AR+sD109BVOwgEJ5T3zN7AANf2txZO5cNEt3d6Qrhnfms+Xfl8mS03vVFZtS4htqH7D
	SMRunFM1wv7cmm2bu183ObCsdLwkoJ367HKGmjcakbzzi7AD3uZManDeTzxYDPEmCpKxSoicPSq
	/HgP0iW0Sz908zKWGukNamFuQ943CEeMpQnL8tbUgsiJSFXk888iixnUGfDog+1NU889FDa/SCc
	jtD00yVj1xu7Srh2sRMxfd7XMHKd9Ax2jv5+BNDEAkg08bbJT7r+3ZCG5+NNfuWnkGAmbeR3aIS
	2LP5cFJwQen6edTP3WXk84YtDloce4zuBZLVGW6/8gvSxQJF2y4NMHHB+ytLO1/TRGQQl3gnfxM
	CELRRHkldxwckmLa3Xnk=
X-Received: by 2002:a17:902:cf0e:b0:2ca:e5c:7fba with SMTP id d9443c01a7336-2d015daffb7mr34270375ad.39.1785253796833;
        Tue, 28 Jul 2026 08:49:56 -0700 (PDT)
X-Received: by 2002:a17:902:cf0e:b0:2ca:e5c:7fba with SMTP id d9443c01a7336-2d015daffb7mr34270045ad.39.1785253796414;
        Tue, 28 Jul 2026 08:49:56 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7eea52sm55688695ad.61.2026.07.28.08.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:49:56 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v4 0/4] Add ADC support for lemans, monaco and hamoa.
Date: Tue, 28 Jul 2026 21:19:40 +0530
Message-Id: <20260728-adc5_gen3_dt-v4-0-355f0edece77@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJTPaGoC/3XMTQqDMBCG4atI1lXi5EfbVe9RimgcNVBNa6y0i
 Hfv6EaQuhl4P5hnYh57i55dgon1OFpvXUchTwEzTd7VGNqSmgEHzaXgYV4aldXYiawcwoomGSu
 FCIrRy7PHyn5W7nanbqwfXP9d9TFe1gNojENaCigKyatSnvnVeR+93vnDuLaN6LDFG2EzdCx3B
 pAhAI1KtFGpVgeG2IwEkp0hyCgM5wBCy7QSf4x5nn8vU1KSNwEAAA==
X-Change-ID: 20260430-adc5_gen3_dt-f0434155ee25
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785253792; l=2903;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=i98nLsq3plVYZ5GSaDZ+JNgzCDFEsljA5/ZokH79WHs=;
 b=3c3gnue++vDYNuaTWiV9ZcDeNSpXCk5AIQIXo5cSb/qfSg8uOblkbazDUl8g78egoD+VzUBCP
 hNizVd2LnuAD5myfNJ5ioUzDVrLu26x6fM8U7gXsROvwM5HnpDCrRaI
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=TJV1jVla c=1 sm=1 tr=0 ts=6a68cfa5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=ispjFfhwX7dSH34Uv1IA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE0MCBTYWx0ZWRfX1Qn30SXsTpnU
 k4PteAzFTGQm+L8Xdq2hW4Rr+muwHsMFAB37JWm1552zACcxvci59NHCBhKqQAeJC9saRX3W0P6
 VMTfB+q5GgULIcUrlWluf+dn47ynwtFWZbbPNts/KTlCD/ItbypV0JBNH7oHko7ZqRVWBR22nux
 otmITTHdEt1eLqYzYyz5O9MyyUyXlkQ+TK0N/Dd4I3tjpQpucfOgy97eQCTsfvunoIxlXTNT6Fz
 eX+V1XzeiAIGzmenvERH5PwP0M8/sNeIwMRug4zJd2CDHM0MuVo8rd+2OFboeEbKaDCXzWbF+Xn
 N0M6SvjHqWXHn/RDmbzPDy5WcvKzeU0Zrg3w07T55u3dYQFT/sQ+agb1h1/pJaNMB97JOaYXM2D
 8a0OxeMiJbcwHlvods2y5JQB/6GgHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE0MCBTYWx0ZWRfXzlOT3bVV89qK
 7Yp/fB/35rAfgrXimcih+wewKf4hR8gCPf+AajthpH/WPB6tmfFLadBm7IflXlaEC8KDST4ptGS
 Ngm7KFTtLwFemNTHCo9v9qszJlu7E8Y=
X-Proofpoint-GUID: XeRdiBLCgySfbGFeNTBS0P00zwwesFN4
X-Proofpoint-ORIG-GUID: XeRdiBLCgySfbGFeNTBS0P00zwwesFN4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 phishscore=0
 suspectscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2607280140

This patch series adds Gen3 ADC channel macro definitions, with basic ADC
support for lemans, monaco and hamoa.

Patch 1 adds ADC virtual channel macro definitions, which are used in
the "reg" property of individual ADC channels and also by ADC clients
to reference channels. These are a combination of PMIC SID and HW ADC
channel number, which are parsed in the driver to identify the intended
PMIC and channel under it.

Patch 2 adds ADC nodes with channels under the PMIC instances on lemans.

Patch 3 adds ADC nodes with channels under the PMIC instances on monaco.

Patch 4 adds ADC nodes with channels under the PMIC instances on hamoa.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes in v4:
- Excluded PMC8380_6 die_temp channel on all Purwa boards with PMC8380_6
  absent.
- Link to v3: https://patch.msgid.link/20260727-adc5_gen3_dt-v3-0-bc00223648f3@oss.qualcomm.com

Changes in v3:
- Collected Konrad's Reviewed-by tags on patches 1-3 and Loic's Tested-by tag
  on patch 3.
- Replaced "interrupts" with "interrupts-extended" and moved it above *-cells
  properties in all patches, as Konrad suggested.
- Excluded PMC8380_6 die_temp channel on Purwa as Konrad suggested.
- Removed all ADC thermal-zones in patch 4 as Bjorn suggested, and also
  "qcom,adc-tm" and "#thermal-sensor-cells" properties to avoid thermal-related
  errors.
- Reordered ADC channels in patch 4 based on node names.
- Link to v2: https://patch.msgid.link/20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com

Changes in v2:
- Added ADC support for hamoa.
- Link to v1: https://patch.msgid.link/20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com

---
Ayyagari Ushasreevalli (3):
      arm64: dts: qcom: lemans-pmics: Add ADC support for PMM8654au
      arm64: dts: qcom: monaco-pmics: Add ADC support for PMM8620AU
      arm64: dts: qcom: hamoa-pmics: Add ADC support

Jishnu Prakash (1):
      arm64: dts: qcom: Add header file for ADC5 Gen3 channel macros

 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi          | 158 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-pmics.dtsi         |  93 ++++++++++++
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi         |  43 ++++++
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi        |   1 +
 arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h          |  88 ++++++++++++
 .../boot/dts/qcom/x1p42100-asus-vivobook-s15.dts   |   1 +
 .../boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi   |   1 +
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts          |   1 +
 .../boot/dts/qcom/x1p42100-hp-omnibook-x14.dts     |   1 +
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts |   1 +
 10 files changed, 388 insertions(+)
---
base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
change-id: 20260430-adc5_gen3_dt-f0434155ee25

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

