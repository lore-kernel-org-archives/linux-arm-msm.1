Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDB445BD4E
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 15:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785253804; cv=none; b=ZABn6eF7JJTbvu8Tb8hMz1UAyGa7aiBb6osNAXf8iM/VaW0/euDWoLoP1/22OIHirXRWP4L2QhSp/8VW2iKBckaEDycFxy1VQPVVUGEljsAZN9sAdoxGWeN6Xd4f8pmSWp0BixWMBvO4XauDhaxPBhK90noBFrBe4rAeMy2DFT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785253804; c=relaxed/simple;
	bh=TbcQBoHIIopm6NEANpP1lL8MEQ3txMX4ouKbTVTXRNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KXwykVDj+Y8HZQ8Mk865ctqorFcIUqMHuZHdvzQuFGVwIcheKe/J9ffmnsGPAt3gMMBlp+E9o/VqREykTYKmuZXrsEStRFprk56TPeTO0F9nmXQlAVRgB1cHcHgldLsNBHwGzof2ew+GVDoyvlhiOFtv+p3HpuU910voO3bDgqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CvnmQ+GW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jVevznOX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CvnmQ+GW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jVevznOX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SEcjHr2996853
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 15:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gF3BCm/zpGv9IdwwbOQ3vpF4ndVuL+2PmvXLUR+eEK8=; b=CvnmQ+GWyyDve30M
	ruz7Z5nAaoz6qOg6stdW5NKfq4bzdVkGueyQn0tLu3uPuevnRQ+rH+huu77BkqUC
	AO9FeHAKqSnHYWM/WCkbI/Y5/NVLU1l2a4GpJ7tZqzOyEGzvDV2aTYvvGE76JpF8
	XIa2QGzVmfcHShyPagQf4Ad60W6/kgZL296ETMMmBUdOE17ObznXA5grzcFtKuw0
	AafrlSUUTfd3yoXuMNZcDOF8HPPBlm6TlKUFsZbJNnFuIBOqKXRxqaFwR4RWarYo
	RSS8PI9ybmt8Wbsw8ZmE+yXJmW8w3hAZmoaSwfZkSaDHCSLgnpcPVJGau97WSgN8
	880JGg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpqxjjcj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 15:50:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfa4e4684bso255305ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 08:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785253802; x=1785858602; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gF3BCm/zpGv9IdwwbOQ3vpF4ndVuL+2PmvXLUR+eEK8=;
        b=jVevznOXFNlxdmgvWAhVgL4xPrgajeVogSCJqlRZbiKcQjyKcDlEyNTOA3UejviXgJ
         x/AAZ2vWSwpzwg5YVUfnPjP7q67b9kI5lw1M5qzpqwVI5JuJRCthzldSOleW2ITZxtNn
         G6neroaeV3SfTMFRm3iWBN2wIJ1/TCbRILetNnOhhJQbUSxWi1/MEfqrPgY+VWEGB7p8
         fXMS8fEeTGvYoYane/UHcvUOrh5hgpoAQHRKu2DvpD/3vgidOHY/l576+RQ/C+VU7UHW
         kYr3MgL3GZcq4JoHVgziTj6l9G1gERkpZykyGEC9zPjuR+OQ+293TZ/Gf7rtxqRtFzco
         iDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253802; x=1785858602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gF3BCm/zpGv9IdwwbOQ3vpF4ndVuL+2PmvXLUR+eEK8=;
        b=UF7z0m6Ya7ndUSV3norFoWkDZlIlZAZzqVmdQRiQb80YrGBZobiUb803+8Z0/DRFK+
         4vHXQBAr6mTMivnwKGt/tRi+UvBz5xiyOqE5WfjaMntlyW1ls/6QpgzlXIES6u5/3Q8h
         6rHpl9+SGpsBLPwKLPtZ9+riQDG7VZwCKi+8xUdhLw64HzPn4V5n9k8PQLwG940plXUe
         7mQdwZynEurWGA3VTRekQbwyRSgkHEPVNWkIUIUyDllSubQQzIwHdfuLkkzpNHI/Ooc3
         511hmkyl180ugy0X9zEBLQi5vVxORBCj+1p5iw75e5KWA8oBWjLOvGU98/LtKyofcdXm
         WlhA==
X-Gm-Message-State: AOJu0YwprHM9CaEvm7acxALmcj800NFV9sz1/Le3CO52RUevCod15J7k
	/7DinynnLrOEp4mfo+3cGAmOhfxNZ8DmnOGqsnUkyMZNGDyWPmhWJ1sbh3YEnxBeSOq5ZRCbA/2
	nW+lbQBmlLpZaqqyP/B2XiAMjzF2pqRY4TWrx3FxRFfLeubJ2OpFhzbdb9xQs5JCmsB2oboNuh6
	H3
X-Gm-Gg: AR+sD13aeRb2suxRwAWQSXOZLlVmhnjhs4zjxINndKTxkO3UGBtl8JGf7sQcKLJ21B5
	CuJSKVO/jxlF8W1GzcCr2MQTaHia+ic7R10DBBd9Ywj3Ky9mY6MbyvyU8jUnqXon+aw6LNYtlc8
	fN+F2J8juMdWkNHfNFGm4AbRAnkdvhMk/C9P+ZjFScgXf1KrC92f/raSRCLwPH5q6l054QG4+kH
	QI3+Mt1g0ShNlsnpq++fs3lrO14+rDtiLwbsh7293IeynbuAbtdCyWLJoqDwjobx+ogs7b4M5lZ
	I1U2tYOCRplFN7aYEVnw+AMJIg1glPnh0he47LH6hAT9M6hdCp+QEDuvs7jdoTHmM44/NOaiaK5
	rtoQ+tK8C+epqt3ZVJeI=
X-Received: by 2002:a17:903:2305:b0:2bd:c925:3a16 with SMTP id d9443c01a7336-2d015c9c0demr39131355ad.2.1785253801614;
        Tue, 28 Jul 2026 08:50:01 -0700 (PDT)
X-Received: by 2002:a17:903:2305:b0:2bd:c925:3a16 with SMTP id d9443c01a7336-2d015c9c0demr39130865ad.2.1785253801120;
        Tue, 28 Jul 2026 08:50:01 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7eea52sm55688695ad.61.2026.07.28.08.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:50:00 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 21:19:41 +0530
Subject: [PATCH v4 1/4] arm64: dts: qcom: Add header file for ADC5 Gen3
 channel macros
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-adc5_gen3_dt-v4-1-355f0edece77@oss.qualcomm.com>
References: <20260728-adc5_gen3_dt-v4-0-355f0edece77@oss.qualcomm.com>
In-Reply-To: <20260728-adc5_gen3_dt-v4-0-355f0edece77@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785253792; l=4998;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=TbcQBoHIIopm6NEANpP1lL8MEQ3txMX4ouKbTVTXRNY=;
 b=Ia456xwTQqUuwJRDmCuwjijHwP/g3YpsO4kg4DdUOyX1E9zpRF+sZfdlihSdY/0bsuLESeSvd
 Gr9J9xA6m/3A84jD7NcmpeXjAwb+fGtiPnqf1lB4+CT4YAq1xK+wgVw
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: 3_PwGyT8Ve18iUKUZ5AEmv-b3uQaRqxb
X-Authority-Analysis: v=2.4 cv=MORQXsZl c=1 sm=1 tr=0 ts=6a68cfaa cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=uKufQnq3ocnfyFJwv7kA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE0MCBTYWx0ZWRfX1aq+y2iMb8H+
 MKYiYs58QQNWqnd25U3jS7Ycy1oFegJgVBbacbfMKcEsRMCS+Kx2jlQlJFzMg/4wM8k3GqW4rnO
 J3g7AL+u8Ghuk4r/6Xo3zD9tcJU/9Dw=
X-Proofpoint-ORIG-GUID: 3_PwGyT8Ve18iUKUZ5AEmv-b3uQaRqxb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE0MCBTYWx0ZWRfXwG0rgyT6XgvQ
 ly8D8XtvtH51Oj9q+2GcwdT+5Gy/iXJRrCIbSVqn30Kdgb2W3JorEJrtFpBwc6mSI8oMC9yaNBw
 Aak5TQlUj5mGDrjNgvFvDws6VGLsI5l4vrU13/Jud0nyXW8v3bvkiCSpCfiSPERwmKzTn3lU5Xq
 3Vjs2/EOuueLfUP4SJNfYOrRlai8dCU1gJKzADlOg2+oXhGu7DIv2VGmoLE7/1I0XR3exsZnboY
 o2MJMaL101ZykP5HZvVN1gZWrEC83RtDZnFEKAUiCSyUp2FfMeXJDDgwrF+GIEP0IK469FATDm/
 64RPaFYVMrn6utKI/axXH+QdVnXm60sJbT5r16jVpRoH3KMUn0/MYKwWp1ppcD3nu2Pj4H5BTA5
 zW/gsVJ5Uhcf+zeiNf5+KlfnQAstBlN/TBYnX8ogz/7NzrtlJ73MNs29ph2xs7fHIVH6cdvONQ5
 Scu6rHXBmJA/NpyUssg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280140

Add macro definitions for virtual channels (combination of ADC channel
number and PMIC SID number), to be used in devicetree by clients of ADC5
GEN3 device and in the "reg" property of ADC channels.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h | 88 +++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h b/arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h
new file mode 100644
index 000000000000..aa8e54d7e786
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h
@@ -0,0 +1,88 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DTS_ARM64_QCOM_ADC5_GEN3_H__
+#define __DTS_ARM64_QCOM_ADC5_GEN3_H__
+
+/* ADC channels for PMIC5 Gen3 */
+
+#define VIRT_CHAN(sid, chan)			((sid) << 8 | (chan))
+
+#define ADC5_GEN3_REF_GND(sid)			VIRT_CHAN(sid, 0x00)
+#define ADC5_GEN3_1P25VREF(sid)			VIRT_CHAN(sid, 0x01)
+#define ADC5_GEN3_VREF_VADC(sid)		VIRT_CHAN(sid, 0x02)
+#define ADC5_GEN3_DIE_TEMP(sid)			VIRT_CHAN(sid, 0x03)
+
+#define ADC5_GEN3_AMUX1_THM(sid)		VIRT_CHAN(sid, 0x04)
+#define ADC5_GEN3_AMUX2_THM(sid)		VIRT_CHAN(sid, 0x05)
+#define ADC5_GEN3_AMUX3_THM(sid)		VIRT_CHAN(sid, 0x06)
+#define ADC5_GEN3_AMUX4_THM(sid)		VIRT_CHAN(sid, 0x07)
+#define ADC5_GEN3_AMUX5_THM(sid)		VIRT_CHAN(sid, 0x08)
+#define ADC5_GEN3_AMUX6_THM(sid)		VIRT_CHAN(sid, 0x09)
+#define ADC5_GEN3_AMUX1_GPIO(sid)		VIRT_CHAN(sid, 0x0a)
+#define ADC5_GEN3_AMUX2_GPIO(sid)		VIRT_CHAN(sid, 0x0b)
+#define ADC5_GEN3_AMUX3_GPIO(sid)		VIRT_CHAN(sid, 0x0c)
+#define ADC5_GEN3_AMUX4_GPIO(sid)		VIRT_CHAN(sid, 0x0d)
+
+#define ADC5_GEN3_CHG_TEMP(sid)			VIRT_CHAN(sid, 0x10)
+#define ADC5_GEN3_USB_SNS_V_16(sid)		VIRT_CHAN(sid, 0x11)
+#define ADC5_GEN3_VIN_DIV16_MUX(sid)		VIRT_CHAN(sid, 0x12)
+#define ADC5_GEN3_VREF_BAT_THERM(sid)		VIRT_CHAN(sid, 0x15)
+#define ADC5_GEN3_IIN_FB(sid)			VIRT_CHAN(sid, 0x17)
+#define ADC5_GEN3_TEMP_ALARM_LITE(sid)		VIRT_CHAN(sid, 0x18)
+#define ADC5_GEN3_IIN_SMB(sid)			VIRT_CHAN(sid, 0x19)
+#define ADC5_GEN3_ICHG_SMB(sid)			VIRT_CHAN(sid, 0x1b)
+#define ADC5_GEN3_ICHG_FB(sid)			VIRT_CHAN(sid, 0xa1)
+
+/* 30k pull-up */
+#define ADC5_GEN3_AMUX1_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x24)
+#define ADC5_GEN3_AMUX2_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x25)
+#define ADC5_GEN3_AMUX3_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x26)
+#define ADC5_GEN3_AMUX4_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x27)
+#define ADC5_GEN3_AMUX5_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x28)
+#define ADC5_GEN3_AMUX6_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x29)
+#define ADC5_GEN3_AMUX1_GPIO_30K_PU(sid)	VIRT_CHAN(sid, 0x2a)
+#define ADC5_GEN3_AMUX2_GPIO_30K_PU(sid)	VIRT_CHAN(sid, 0x2b)
+#define ADC5_GEN3_AMUX3_GPIO_30K_PU(sid)	VIRT_CHAN(sid, 0x2c)
+#define ADC5_GEN3_AMUX4_GPIO_30K_PU(sid)	VIRT_CHAN(sid, 0x2d)
+
+/* 100k pull-up */
+#define ADC5_GEN3_AMUX1_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x44)
+#define ADC5_GEN3_AMUX2_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x45)
+#define ADC5_GEN3_AMUX3_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x46)
+#define ADC5_GEN3_AMUX4_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x47)
+#define ADC5_GEN3_AMUX5_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x48)
+#define ADC5_GEN3_AMUX6_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x49)
+#define ADC5_GEN3_AMUX1_GPIO_100K_PU(sid)	VIRT_CHAN(sid, 0x4a)
+#define ADC5_GEN3_AMUX2_GPIO_100K_PU(sid)	VIRT_CHAN(sid, 0x4b)
+#define ADC5_GEN3_AMUX3_GPIO_100K_PU(sid)	VIRT_CHAN(sid, 0x4c)
+#define ADC5_GEN3_AMUX4_GPIO_100K_PU(sid)	VIRT_CHAN(sid, 0x4d)
+
+/* 400k pull-up */
+#define ADC5_GEN3_AMUX1_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x64)
+#define ADC5_GEN3_AMUX2_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x65)
+#define ADC5_GEN3_AMUX3_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x66)
+#define ADC5_GEN3_AMUX4_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x67)
+#define ADC5_GEN3_AMUX5_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x68)
+#define ADC5_GEN3_AMUX6_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x69)
+#define ADC5_GEN3_AMUX1_GPIO_400K_PU(sid)	VIRT_CHAN(sid, 0x6a)
+#define ADC5_GEN3_AMUX2_GPIO_400K_PU(sid)	VIRT_CHAN(sid, 0x6b)
+#define ADC5_GEN3_AMUX3_GPIO_400K_PU(sid)	VIRT_CHAN(sid, 0x6c)
+#define ADC5_GEN3_AMUX4_GPIO_400K_PU(sid)	VIRT_CHAN(sid, 0x6d)
+
+/* 1/3 Divider */
+#define ADC5_GEN3_AMUX1_GPIO_DIV3(sid)		VIRT_CHAN(sid, 0x8a)
+#define ADC5_GEN3_AMUX2_GPIO_DIV3(sid)		VIRT_CHAN(sid, 0x8b)
+#define ADC5_GEN3_AMUX3_GPIO_DIV3(sid)		VIRT_CHAN(sid, 0x8c)
+#define ADC5_GEN3_AMUX4_GPIO_DIV3(sid)		VIRT_CHAN(sid, 0x8d)
+
+#define ADC5_GEN3_VPH_PWR(sid)			VIRT_CHAN(sid, 0x8e)
+#define ADC5_GEN3_VBAT_SNS_QBG(sid)		VIRT_CHAN(sid, 0x8f)
+
+#define ADC5_GEN3_VBAT_SNS_CHGR(sid)		VIRT_CHAN(sid, 0x94)
+#define ADC5_GEN3_VBAT_2S_MID_QBG(sid)		VIRT_CHAN(sid, 0x96)
+#define ADC5_GEN3_VBAT_2S_MID_CHGR(sid)		VIRT_CHAN(sid, 0x9d)
+
+#endif /* __DTS_ARM64_QCOM_ADC5_GEN3_H__ */

-- 
2.43.0

