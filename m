Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428385;
	b=lFjjwOEerjN3jNTkAAMsD897FLcjXOtFslryiiFDwT/rRni+XAFxLrIFxprMqeIHINyD
	 4NkwpRAVUQFLvkR/tVqb74bT40Z0crZc2vNDRaDzrIA8ZtPRAI2pV1wq9GFXVyAjAeYam
	 ovxf28hge0yL2espj0e8lGguj2i1jTD6NHsnC+LhhXSPvzCRPWrMX7KasXU0n5SnLNphn
	 C8vxYaUT2uF1ZGR+5O32tUS29afXYV5Q03SR3h5VHuWkOXHArj6IWrXroLgBryjPqciwq
	 zoXZua7+JiMHRtgqB6I9BQERQCVo7EZK3LayLHzgmBZT9OWKJPcKMML4BxDIdk55h6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428385;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dpE2Z7eaR0y+FTQIRzAnRUvkDAYm9gECZfte2MsEvBk=;
	b=mESSqKNsaN8Hxiq0gwQJBQ2tAA2hBVGldu5oxh+29xtEXdb7aiGyoggvcqis1UYKNQnM
	 htxCCqFW4odbqU6lOGOd3K4igcSeCeKLRqCIwK15pm4luiDqp+Z9o9zZkSIHjJUT6F+CL
	 daXmPW5Tf2rjBpMr/WIxv1qONARPWIzkwaAhBqRaldMyxLC1k71Li1DyjVItMLiRBfqQl
	 JbPEiQHD55GgzrEbZmAQ4QazThZPOu4M1PEbvya6vmkwHLmJuky3ZWWgU6vlN416YLiSl
	 t34akUPGSxC6TXv9QNe4UFYJS8SnjSsu0+8vEQK7FRQuCgoyRqoHzG16HdlL/wUl6bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i53dx13E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JWBu1Zmk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B2860A2611
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 16:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35B2860A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i53dx13E;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JWBu1Zmk
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JFOsT14180387
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 16:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dpE2Z7eaR0y+FTQIRzAnRU
	vkDAYm9gECZfte2MsEvBk=; b=i53dx13E9XWS4DbtPxBhI0/P4i6ao3NAtxCiPU
	87LCVG4kMZokgU/cs3t/m9O+cmr7lGxNgi9P7VDR1squJh2Ry68Wy4sGKHyUSp1D
	In5butjQfjLj5AMPfj4VUOz3VKqvqZcqzw/dFdC2ef7IResVGrwlneIebpnq0/nY
	NZ1QjP1WEbYuvbo1TdNCfDjkaaVMEDFrJ8taJyjhZtkLI0ODld0vzZoxVSd6Koza
	ZgVJ/Lh5iGI+P6rqrE0+GIxpOrPOOS6YhZj+iKIgSb+OvyPmMd945eGmBlsy//ux
	O4XgasLrbUhcczqO/iGFZo8+kPkAot6VuQplr10OA1zMpitA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3fa885-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 16:46:24 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so9081258c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792428384; x=1793033184; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dpE2Z7eaR0y+FTQIRzAnRUvkDAYm9gECZfte2MsEvBk=;
        b=JWBu1ZmkcAEHQ/HVFrWSNXJ7cbwRA5m4WdjX9SLYFQMoDFlU0V2UoeHFPbutDqsFI9
         XmqaNa4HhJXEOPSmyVtAwVoOWrLkeZDo3ekeLzzDNHVjH07/1if3bN+ZXhBribIIzOpL
         sihSxSUOSa1AGIQ0Agd54kpvSIdScB4fEuyT3CQ28PI06GixKSiVYlhTRnZEi+TENQRF
         33fxxI8gQqGQXw1kPyAvoJXmRZDGBoIISrmROHpXQYdIYtwEnp7besAQY4lWsMPKoZaw
         WOeoOEOYtxGTjzHtqo4GNAL5aMnwo/hYsAvv+0rSE2GBMr+Jj9uoyeUYqLqpYzCF7rWa
         uczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792428384; x=1793033184;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dpE2Z7eaR0y+FTQIRzAnRUvkDAYm9gECZfte2MsEvBk=;
        b=O4IYL06YjXyF/B5K7mv3LHkU3Fx6eX1e/NdUOCigkIcq9jSgCrU+c1E/tyjUXCQAyN
         jU5Lq7QsdcxLBg1KDDyWhEmMflIruynoGMq5vFu9soVzg8ScYNB+JutbbbnERZBQnWB6
         8OSJC+rfGkYIZd+20HDYR7qbtlZnjv8kWGMUzaKz79sNg9qZG6QFYuY3PAtWnGaqtNf8
         CLdr2JzWGgd6kf+KoCzgig6F8sduGLiHWQS3OFf10NETalXErZPkwxSrWg0wnca9bvRz
         HsqWwgR69yAFYnWcW1yv+WNW6fADmZjyqKovtgC1WbkZMmLeAWAcP/EE5xz4N1YZ3CHM
         DXUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDr6dCHcevIHg2XruZ81SS0DP1P7zh3PMOzxTiE7dJ+fPtzmCw7D9K+rqIeu+3qrjKtAysBIWLY1a2SQmz@vger.kernel.org
X-Gm-Message-State: AFq9FYJzNHdiw2Q9Z1rDAIp5xxKWp0DlvCRgvKbGDXt0uySrjnMDnamE
	15XGVHY4WRXAeQwucmV/inHJtpiRna5SuJWvzIAB2vgbJrfVArIXuaGTrhZg/J1C0ITfMg3ZJfQ
	8dovM6tGCQ3FlKw4yZ3uVWPvpFA8qedaihj3HwZYNiC/RIaNKFa4Lkc7WxN7EqVStKVIq
X-Gm-Gg: AYBFou2fPnFsHRZy9SLKDq+GCs8yHMSTLkiaZcl3GmaPzM77r7t0DFXOiW8cIDvjEEm
	wNGH6cbdXumfbrHI5AwCio7/z0c7onL01s/laKptPrZYrq1WpViiUH2eaxodmctiPNf+KlbVmpO
	vU0VKbrSh7pfAPth5tvGCP5KzlgxWn05peXUE1UdbhM18a3q2xLo4ZQVSMwxnfjf0Z5WcyrhfNa
	lbtpTG5YcbjC8getATgrhSnsXAgXBv9gbQhAhP97w0cCQmun699ks8GvSpthmn+msh8SM9EsM6D
	bxGYQ+ZCuxp3NUnXv8W8PiPA+lJMFyx0XwVIVZRkb7kTQwjWPYiq3aTSqkDQfKV/nrkthjb1N75
	RZfQ57vMYlZ6UN2LBbH1txLdF/au+8ScYyUE3VF2JNbf7A6PXiGxydCdd7Y01lQEdeD2C8tiN6V
	4lmFCOIb+z+02rZvIfN6j2NxQoiTo8Q+cj1GQ=
X-Received: by 2002:a05:7022:e808:b0:14a:51c8:e9fd with SMTP id a92af1059eb24-185139aa548mr13258566c88.26.1792428383483;
        Mon, 19 Oct 2026 09:46:23 -0700 (PDT)
X-Received: by 2002:a05:7022:e808:b0:14a:51c8:e9fd with SMTP id a92af1059eb24-185139aa548mr13258525c88.26.1792428382772;
        Mon, 19 Oct 2026 09:46:22 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b16f57sm30379415c88.2.2026.10.19.09.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:46:22 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add support for reporting boot status on Qualcomm
 IPQ9574 and IPQ5332
Date: Mon, 19 Oct 2026 22:16:15 +0530
Message-Id: <20261019-imem_restart_reason-v3-0-e6b1ff5de841@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAFdJ1moC/22NQQ6CMBBFr2K6tmTapiV15T2MMaUOUiNUO0A0h
 LtbcOOCzUx+8v97EyNMAYkddhNLOAYKsctB7XfMN667IQ/XnJkEacBKy0OL7SUh9S71+TuKHRf
 a68rq2jrtWF4+E9bhvVJP51+mobqj7xfU0mgC9TF9Vu0olt5qEABi0zAKDry0tRbGggEBx0hUv
 Ab38LFti3zYIhrlP0puo2RGGVGC8kYZiWoDNc/zF8DAyCQaAQAA
X-Change-ID: 20260929-imem_restart_reason-15c5b95f9a5a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: b9-xrLSHGhVYsnFV3T7zmQai6Py_hZFg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfXy2GNdzcMiu3a
 iUfMzbTQTL8ZWeQqxze86znBH1BkZM2IPf4fhkkekdbDD5BmfAAiEFomlDA/+nagVjgjE0fW7yO
 ma3eYMp376djxml16fh7XNQyPf+fXVXvArQ0YD6yoQnX6B+vdF1cOb9x+lfwk5eT2joSRqxHFG7
 vZnKzQUM1ziRXiHyOpAzGEUDFcifJxc6LmURw7DmeKqAj1Jjnml1MSSp9ismdSZWdtk1dD4kYkz
 1Y9BaFiCa7ZstjMp/AMVYT6odiemB+FCvFOxq96v++jK0veGRHegaGN2Homvjf3IMn3SNEkL7Sd
 +M7vUZ28Sk6NqLVnvg7uAb74hCuHGoJVL/IRpIBTq5ia8G5Kn2PU2eypAlZpxeZRyTvwwl52EtU
 M59RR+dXI91xThAEPAKScUTvzc4egD6JWY1l53ab0ukneXjf8F0+IlI5XzM3wKdjgjtHb2r1U96
 o2wjzuGVGLGXa11LTlg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfX8SrDYkXP10UX
 eraJPFED7N8GzklLasHmYGMDiCIUPfL57daNVY0jlIiAWBWRobR4pJ7Mk0g1VeP9XO/Hdu9ZK+s
 Fj2mbP7BBUJI/H763SrxrTJBPDH/q80=
X-Proofpoint-GUID: b9-xrLSHGhVYsnFV3T7zmQai6Py_hZFg
X-Authority-Analysis: v=2.4 cv=OaANnRTY c=1 sm=1 tr=0 ts=6ad64960 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=WCa_HgLwREyZps7IH1sA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190066

Similar to IPQ5424, add the IMEM node and the restart-reason child node
on IPQ9574 and IPQ5332 to enable reporting of watchdog boot status.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v3:
- Picked the A-b tag
- Squashed 2/5, 3/5 and 4/5, 5/5 into one to match with the schema
  definition
- Link to v2: https://patch.msgid.link/20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com

Changes in v2:
- Placed the compatibles in alphabetical order
- Fixed the unit-address in the restartreason-sram node in 4/5 and 5/5
- Link to v1: https://patch.msgid.link/20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Kathiravan Thirumoorthy (3):
      dt-bindings: sram: Document IMEM found in Qualcomm's IPQ9574 and IPQ5332
      arm64: dts: qcom: ipq9574: add support to get watchdog bootstatus from IMEM
      arm64: dts: qcom: ipq5332: add support to get watchdog bootstatus from IMEM

 Documentation/devicetree/bindings/sram/sram.yaml |  2 ++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi            | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 16 ++++++++++++++++
 3 files changed, 34 insertions(+)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20260929-imem_restart_reason-15c5b95f9a5a

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

