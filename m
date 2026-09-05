Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA55C35201D
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Sep 2026 03:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788577517; cv=none; b=iPjhrj6r+s1AgFs5T6ShbzCpW6kNKb4gONC/2be84UG55zrSwTbcy6On/yBf7pGvUxMikRJ7h61K1lihcA0Q9qiLcJsJs0yGQ+iy9dp+CdxbkOBVYGvyRB7iGxyg13Ta1eJOlraiOGeaP38Malh+RiOW8pccFUEyLARCYxv4kx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788577517; c=relaxed/simple;
	bh=uGLcF6U/GWagHVa6Sz2Co17L9eojU1aX2IBfU2exRlk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qB9y5WzChq9nnDFH82shUp9PLySLY+ZK3mtZIfDVTfQLgJ9ATY9PsouEupk+7DAxwX5I9Zd9uCKkqgf8ehJNX36zAWsjRRFN7JKZENPIzxDrAiL26gdpFvze6HuLNhd4vP6eenKo+EEkZl9n7wCBkIRnf+GgQQmGeOr55bnEl6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ViDrNnWy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TbI2a3WI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ViDrNnWy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TbI2a3WI"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6850vIP7963850
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Sep 2026 03:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=buhHNLxzpbcoVyoe89y/2W
	pJlQUmFm/zRGdNYFrGNQg=; b=ViDrNnWyhRr5LfXguj9P+QR2fzF3fyhVYiu3xt
	3fvdwpTb/BO5leiCZeo06FtdB3nqzzeFYJTs25XzzxjUphE0PHATvH0LSgMNekxZ
	fXEUtSDaA+wfXElwMS+ijL2OAznbDIVAw+7D/vGKLaIjw9a+MXbSS+GoxvGSOO0n
	OR6/NS21L3NB14DZNbzpflbrP44sAmIb1x9ejZ99S5k8krGN3uEmy38+pupYiJQx
	+e1v4g+xFS+WMLYjPfpT+ULBijqKB5/SFcNSmlga054DjphjVjXBg7/fWhzEkDmI
	rckKZTZ4XjYk0hnCZgn7GOhdwLJS0bdAUDWzx8m/RhOFQ2Pw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg8eq0eme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Sep 2026 03:05:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so1960747a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 20:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788577513; x=1789182313; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=buhHNLxzpbcoVyoe89y/2WpJlQUmFm/zRGdNYFrGNQg=;
        b=TbI2a3WIj7gtW+1/2hMz9lMYRpcYvdaPXlWRmrRXZp0b17vWS4eImYqNImDQAups3X
         TFHxMpHieLyZ4hT6yHZ1/XRwEfbAwevdxoEW3HhXZxzmhO7d7xWe4WE7tQXSunJyAotO
         dxmb+HgUvwf10pEDwVoHJovvc7+HAsGP0dCuLZzdTNSP2obyK8M3EFATqFPlLWL2mc7S
         E7v2KMTeRS1H+IQKyx2JE6OyYvK8jTb1j565e1TEo1q5/h9APzlQAGTQT8ZMu6bcrmLe
         0u97xHnmeVdNNcYFLV/esU8qNx4hEVsrvHU0elfAfDZXLIcdXnD7lkcWmLAQpK+FHVBN
         lyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788577513; x=1789182313;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=buhHNLxzpbcoVyoe89y/2WpJlQUmFm/zRGdNYFrGNQg=;
        b=L6FavsQe0jvTw2mBX6J5VvDqtvDl93R8IGk+yQxCPvCxkjT/j2ZopUg/HNDuUVXOFh
         bR6HbmA38+nun7o0cagotqiBBn0L8PWByeYQ1kJA19eN5jehcPozb426NnFfOfbm/lYe
         u0xbfKW+c2zfLPbXpel+wTZt/2o3cpAXnvHYz0TEwN087SBdO0YhxwWQ8zEBp26QUqub
         DyvZ1T7jlUnRTeZQEEjUnwyBXA8d3eJUvBHXgFnfTpgFhIJcw3iRBQU/pxGCcOWfJ353
         QOUqr7UI6DrwNgE5yuNA72bAA1JJx+NIDTBWXvlO5U3g4Yew4PF5z5L5VHPylVspSt+n
         ndcg==
X-Gm-Message-State: AFuF++nUHXYr+ZQuoQYkEtrDRRdK1GOwkHSy1lu9QL/iDKsEY3vXPGBN
	jVI6INYqj5YVPFRxw0oXM2Rl7sybw0UYQAJ2SK1ALE6KW4FWMeHdgfFgnbIZBD18gKHfOVor6zA
	lXlnKCX5GfqbnKNGJM3x5pOv0BEV4n/bOGJ0e5jcppMoXoyaOnaVCCT247C/o+Pu+DME5
X-Gm-Gg: AYBFou2ZIyC0XgMHIHFwwGZqQHHKBvzglvybQKKSnZriVb8pJcv1vo2qMESAAZuazal
	U8eRVRI9FZGEXy0qWyOZRkrLT4v7V+R7QHb6+Bb2WM90skfmRBEQcgdQAKhRcTXfAz7XXyXzwI8
	4buZlh4X1vKcfpSAwZfu5dRTUp6SgvaY+1jRVgYGbr2Y77nAgB1tlEj1KKfBCPD86RGnty3Gp25
	Gi+7gVHUvYQjH1iot/hjuxRn3R5IRoJmuomufO9qTi1tmi2jOP41OnQ6Ca1IAoU0jjd+0B4aybC
	4F0N7OY86tTpjEB4XinQ6rzmn3TlMmnHSJLQn8dQGKUQiVAwKf28z3ZO+TOv4lf4udeWrDJXl6s
	F4YxETU4DWj03VLESaoTKVZNcgIh6qr/G8yHvRrXsLQ==
X-Received: by 2002:a17:90b:4c41:b0:398:9bd5:490e with SMTP id 98e67ed59e1d1-39b2623ac0fmr13906001a91.21.1788577512929;
        Fri, 04 Sep 2026 20:05:12 -0700 (PDT)
X-Received: by 2002:a17:90b:4c41:b0:398:9bd5:490e with SMTP id 98e67ed59e1d1-39b2623ac0fmr13905942a91.21.1788577512434;
        Fri, 04 Sep 2026 20:05:12 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa36b37sm10066268eec.14.2026.09.04.20.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 20:05:11 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: hamoa-crd: Introduce
 thermistor-based CPU throttling
Date: Sat, 05 Sep 2026 03:05:02 +0000
Message-Id: <20260905-hamoa-sys-therm-v2-0-1cb8c958c981@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ6CMBBEf4X07JKlIhBP/ofhUMrW1lirXSASw
 r9b8OxlkpfMvFkEU3TE4pwtItLk2IVnAnnIhLbqeSNwfWIhUVbYHBGs8kEBzwyDpejBdKVp0PR
 VXaNIq1ck4z678dr+mMfuTnrYNFvDOh5CnPfLqdh6/+1TAQiyLrDRJZpOnS6BOX+P6qGD93kK0
 a7r+gW86novxwAAAA==
X-Change-ID: 20260830-hamoa-sys-therm-fb4f80fd6770
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788577511; l=2156;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=uGLcF6U/GWagHVa6Sz2Co17L9eojU1aX2IBfU2exRlk=;
 b=Rd/3yrTzNRRorl9q7XDeYOkxcnyiFcE6X5ZA1OrEBC8kt3kL1jpmHIIc3kXuavnVPXyR37rpU
 nJsl4T3LUeFDm1aZ9kmiIgudghmi+ZDVi1cf3+6j5wyVs70I+qxSUAp
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Authority-Analysis: v=2.4 cv=F61nsKhN c=1 sm=1 tr=0 ts=6a9b86e9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=io0WvpAr2GEc77V1jsAA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDAyOCBTYWx0ZWRfXyYhZ460sLByQ
 aq9g0VOf6NEVY+Poyn4ZEAQ5XYJ1/iBiu4CgeCKnlnvp7aiSXII0w859JCWlQfOvyyMCkFu2OLp
 FtMiZ25KXFWiDhlYEhNdyeSCYkpC/XM=
X-Proofpoint-ORIG-GUID: sLHFKi_kMf2PM8UBH3LCn_y97npvyGHq
X-Proofpoint-GUID: sLHFKi_kMf2PM8UBH3LCn_y97npvyGHq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDAyOCBTYWx0ZWRfX6DVL5jk2PwbV
 wIG7gDlrkqmR5FNaRKntPcHVbJ1DvjmHTB0pHFBKcm8tokz2CvNwJAk2dTxufZG+tcAZoiY8b+3
 crKtp+knUHjjDFBu/JVxMBjDFgpizeyiAqPCLm8KcnMTh7Ob/WUzN+bnroDZndiAqRyMcdqNYhN
 N0zG9FqYnXneywN343FAteMpyiCq7VTy77HBgSj6kw01sp9v76gj3xP/50LQ8b/jfivKRo7iqmn
 6OYwWwY98tvJmM8GVj8EK3FiGjiTDpNdTnVpqMd649B2r32mtTYH3e1dxygpDwGE9c+/QP5zBbD
 N4MwNwTL0WnE99XKqHPmur23UUFb9fIgMbRIPKRPuMpyiXgZLwNU0nwq2LICK7OvUyKXB9a5zh2
 pw+5wMw/4nae4+/2bnlhx4bCnQyAR4In4cfYPlMF7/wlH6hjmKuEJaI99rvVc9Bn4HpmbZjDB9c
 yYokNxTkkLhR8ZbbeJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609050028

The Hamoa CRD has multiple thermistors throughout the board to allow
measuring the temperature across different parts of the system. In line
with other platforms these are wired to the PMIC ADC and thermal monitor
blocks.

While "limits" hardware management provides rapid throttling of the
CPU cores, software needs to throttle the system e.g. during prolonged
CPU usage. Wire up the 7 thermistors found in the CRD as thermal zones
and throttle the CPU based on the "keyboard hotspot" thermistor.

The same mechanism is used on other Hamoa-based boards, but the
thermistor configuration and mapping is board-specific. As such, these
settings goes into the CRD dts. It's plausible that it could be shared
with the Purwa CRD, but this hasn't been confirmed.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Changes in v2:
- Dropped second keyboard alert as the cooling maps where the same
- Added mitigation of GPU based on back-cover sensor
- Changed keyboard trip label prefixes from skin_ to keyboard_
- Added "critical-action" to clarify the expected behavior
- Link to v1: https://patch.msgid.link/20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Bjorn Andersson (3):
      arm64: dts: qcom: hamoa-pmics: Mark pmk8550_vadc thermal sensor provider
      arm64: dts: qcom: hamoa-crd: Add thermal control
      arm64: defconfig: Enable PMIC5 Gen3 ADC thermal monitor

 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi |   1 +
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 119 ++++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig              |   2 +
 3 files changed, 122 insertions(+)
---
base-commit: 3d83758432b5e6ed9507500a57efb0f3af41ee7d
change-id: 20260830-hamoa-sys-therm-fb4f80fd6770

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

