Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515307;
	b=AQi0egQnzLm67R/FBXSVYEfgRtjWkaYjn34lvTGwpqJp34NncNr2BG3dwaSBvrnYrBbd
	 FiweEBdnGPTlKiqlPWQEWDXcSYYDrz0cnuujWpirLjY2+MGekXc8j6gxNdFV2Bh28GJ+D
	 KbWvdhKf2aBz1uphrPdMB155+0HdYr+OtJ0n6emSI0O22G/VwJMnRVfyzg50p0naRQ29C
	 75WMPJnsLOEINMg4YmLb+d3cn/hM/u5kHKXqetwF29daM10la5OeGc6MPTOej5KiShAlS
	 J2YoBVr5DQIMhEaJlqNuHN9yFzHYF2hUPskwE9Yw41w7QH9csn3fq4MHHhIK4eSuveA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515307;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZGOMTsR/qYMhghFRquytVajxM5kcezdFz2fZ1AyM3Co=;
	b=m2W9EP0pXx+gKlz+dF2Axt8CiDv8a4/qpUWsLf36hz1ltdoRPlGOZWpjvACEeeYO33H+
	 FlsB7TlPBn1al8erM7WcpG/ffzXx3OoLkj5RLX67H2+c6K+DVTuYO64IdC27zpkXMMWZg
	 mGt3jKb63mKjMHUktAct0fL2WOWlrPCWk6dF5AzDrASiKo6eblhrhmuZA/9WqbLBuFpLU
	 acJnTj6gmDdQeTXPhbR1xHTZivJwh4eOY04Kx7EDI5agZI9PdZJJYuyv1l0pxWmP+SQu2
	 L7YIGVsT9lw3nepRvTwnVHF2YpIjllq2aLB/pfPslACc6OdKwgtrBedGFIkTCYfI/hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c0ONOqTH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DUBrYS8W;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4DA606A327
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 16:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC4DA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c0ONOqTH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DUBrYS8W
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KD9xri1781362
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 16:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZGOMTsR/qYMhghFRquytVa
	jxM5kcezdFz2fZ1AyM3Co=; b=c0ONOqTHj+Mz0bFVZIqDSmJafrz/ua1nDXbZtU
	8VNqZtGEM6UbsuPTZznXs11z/NU56H3VOv65LKgC/0HlSSCfO543Osvjuhu2LKiV
	xYi1HTwdq8pfRK2wXJskTVE5NLuxB1nuuy4kf/F6ekGqsIx04wxdel/TgqsL/6WS
	F3wbbzzsk7n7A5Duoi36hgl0HCCcYgREnIO90KXMySPYn0FlDTXkGATx1SPQ9EHR
	RfJO4rXWw2NX0LMQHRSGkCq/GfHkJlG7WbY4+MkYYxagbcxHD9bAQVN4KBbHQJdH
	Y7Rk6g55vz90kcPgpgUR2gt3kejqUvvnur7zxlUM2uDjhetg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2982h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 16:55:05 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3662e7a9299so3843824eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 09:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792515305; x=1793120105; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZGOMTsR/qYMhghFRquytVajxM5kcezdFz2fZ1AyM3Co=;
        b=DUBrYS8WYEIgMRh+YstusrR0SWBIuiYZp7VEcTVb88hjAP03AZfCacZxlFFgv8A0WV
         RBbtZuLL2ko0p66HRL34OlaHnc2MsCLhAbG8pBUo1QtJmIthK9JBIuG0EY+KVBaS8ysV
         KeJIstjBuC9QfdnLYLHl8nNZnqyJrr7my9k2PwTwJDc0qBgt4tAVyPBkNQPR18HUh/JK
         5ZGR5aYkoV1JnNCO8sOOzq0uHQPdUC/gWX3ap9MGY1FlUzKeL8xEXnM/J3au5dNrRS6Y
         zlyhV+iFPLHoOGbNMgBh5I+v5mNXHZl/UUK+1Zcfs6Z4X2BvfW55+zQK42YKdQ3ehnim
         E2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792515305; x=1793120105;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZGOMTsR/qYMhghFRquytVajxM5kcezdFz2fZ1AyM3Co=;
        b=iLS230sR6rCADVy4woHlni+SMdLuDuRem6S1kcaKdZpfmvqkuqQJPIphQX+XMuMxAu
         wT6eQd8jOrJdceKDx4gTWC5zAQwoqMtlXvhiA6zALI8QTNoOeqi1vsMLM/BmtKSzOTVv
         QkBHmxxwC41XQp0s0KMc8tDMOaFzcfbegV/B7e1H4Fgb4R7L1hVtjcvBuwjs7f6DlWXY
         vYggcUaRABCiMjSv2l2zQGNQ8/uCXavQ82lHphf2TFdv5vjW0s3l7mK8ugBK2wEJcjMx
         gejS5N45gijdr5ajMlkaxpCPqxkrnJkGOV3mAH5VldnqeCBiEm36DOG38PSv079XKsS4
         ZjZQ==
X-Gm-Message-State: AFq9FYIJCru8bPYvoU07wcBJLlKMMqExhr+rMoJznLu737l8XU8T8TCa
	Ri6qtYinKRnzBd2w3Gyt0/3sLlsOK3xg28lxvAznWM2sRpJX/sWnpG7xWrYy3EvceL8kiCCWDeJ
	KuUnr+5FxAetJNxNI3do1RgI2eJcFw9P7k9idXqOsl2NP6Sx0SSIfQlhVZK3IiTvk4DUpy2KIjl
	WO
X-Gm-Gg: AYBFou0vlUut2xTzux1Kn/U5wz1I2cN3q3WnfSscebADAj7Tmm7uGCbig+PfWvoco6X
	txwzywRgiWzmwaCg5iXCCTzC8eA8+5PpaPXx/Tgy6jCh6kmFNZW2+tRGmYLZqLa19QgTZj8nosh
	gc9GYOGyw3WW1HWUDUvbrUwEdF5bhn0PcyEWZEi41tS8bDS+igT4zGL0binNKnfRJyh8He3j/Xg
	6dGzFlXOtqRgK4JUCjoZ4F2C1lKyGmlLOS6ZoZDqehEWZMV0uX/8NRgWrHDN5FM6aRQxHz1XwX9
	koZloqHg5mZC4PqFRNAHh1jenAPmVXP5WZM0f0sfrA48X8o5g2qc4nyFqXOr+A98GNwwKSXXUUV
	V0od33uVac4zdIrpXgn0RCZslsk3OTJO6ip3jxYZgGlnUuJuCSPThrtwNmLI7OhGSPwB6PrUvlX
	Ei3k53cO5beq0jwPR3RogP/molyec7F/OS4g==
X-Received: by 2002:a05:693c:42ca:b0:360:cf7c:269a with SMTP id 5a478bee46e88-361a28490eemr15087837eec.24.1792515304769;
        Tue, 20 Oct 2026 09:55:04 -0700 (PDT)
X-Received: by 2002:a05:693c:42ca:b0:360:cf7c:269a with SMTP id 5a478bee46e88-361a28490eemr15087798eec.24.1792515304035;
        Tue, 20 Oct 2026 09:55:04 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608297f4f7sm43204868eec.23.2026.10.20.09.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:55:03 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/2] Miscellaneous updates to the Qualcomm LLCC driver
Date: Tue, 20 Oct 2026 22:24:49 +0530
Message-Id: <20261020-lower_case_hex-v1-0-bfac89824646@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIANmc12oC/yXMQQqDMBBG4avIrBtIArHWq0iRNP7qlKKSUSuId
 2+0y2/x3k6CyBAqs50iVhYehwRzyyj0fuiguEkmq21utNXqM34R6+AFdY9N5a5ojQ7e3R+OUjR
 FtLxdw+r5tyyvN8J8Xug4fstTCu9yAAAA
X-Change-ID: 20261020-lower_case_hex-658f10ca5795
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: LDSa3zWRIEtB6qgGOZDq47mlyES2LLDm
X-Proofpoint-ORIG-GUID: LDSa3zWRIEtB6qgGOZDq47mlyES2LLDm
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad79ce9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0oxzK7zeRQ6n_MDBbuEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA2NyBTYWx0ZWRfXwgxYV4+lZI1y
 HBGMu1KE8kSjIi90e1DIajAiv8S71eEdwevIgwhQg+37SoX4QVkCsoqbSiT0I90Chbkkq6DRd6v
 cF2FnrhKccisr6N19MPirfGFWcOG8fc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA2NyBTYWx0ZWRfX834FcpuA1FMm
 BZiktu5rK+/oqDYe0DhFGoOzO81O4qGkPMBoA4FQ0sbYrl5EbZEwm8DjGqtdkpqAMTYwDRS6CIK
 d1FeFPGelO7SPVXj4LVznFfEwPj16CrtNXuD4vQ4sEl31GVYj/1oLIJiHO+z8WtPncc/2KLrBX4
 9UOgFYDybiTZevOqyI/TiW/6ya1pdMsdFshp+rlqkWW+tt0Gm6GRRjzC0XFE3pxJ2R9tFehmXlZ
 08/VuILe7KoXtF5A9nsh5o62v100TKBMLuRIkZOn0HsMjeP04fHLQ6tHlex9a3lsNzzLeJHK0Qo
 kCC7fyTIzfhxIohE2n/91IFB9ESk6czCBZZtgKgBR2xmWqgHZmRhsvFmtByfy5Ms9mQqRj3D3fx
 paCfc6WKIOBtH6QMnrBGVnIev+9nM0t4xVnuLGE8Fx3tSpjn8RggKb+Pni7qSMQ9sKicUQsBA7z
 Tf6h0PcQWkPeJt4l98Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200067

- Use lowercase hex values in Glymur and IPQ5424 configurations.
- Fix whitespace and brace placement in the slice configuration arrays.

No functional changes. Compile-tested for ARM64 only.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (2):
      soc: qcom: llcc-qcom: Use lowercase hex consistently
      soc: qcom: llcc-qcom: Fix whitespace in slice config arrays

 drivers/soc/qcom/llcc-qcom.c | 69 ++++++++++++++++++++++----------------------
 1 file changed, 35 insertions(+), 34 deletions(-)
---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20261020-lower_case_hex-658f10ca5795

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

