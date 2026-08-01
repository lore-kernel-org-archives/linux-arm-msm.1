Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAA43CB2DA
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 20:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785615062; cv=none; b=Ds/dg8YIDKaSyywxvrVuZ9PeS7nMRcXlWc5Hwm7dUq94TO15LwiX20y0Ulp+JrltdfTIUS3QZ3XEhouvB3UHVjCGJniz/xiJcLB8sxRsypyjZakYpl1fxLRBX6AAle02cUqkRatQ6VABj0XcOUKxi4H6rNawP61H6Qfs5FxjEA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785615062; c=relaxed/simple;
	bh=36LpDClwiTtPG8m5erGqKrgPdPeIbwObzYjdSOKiybw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JyEpVbpD2KfilbuB6DmTja1CvSHUVT2JSv6MKhUdTg68v+yUOalQomjdhws30usdBrTP1Sc61U500+ufAgZTOsEcRb52EOHIac6A0xOpSveeSzSrRYxwwr+cadG7AWIS7C9LhqHKy4OTUatOpux68/hApU0IHFdgj6xSjjsG6us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g+qm5VHo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fo1K+9J4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g+qm5VHo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fo1K+9J4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671IxRr73180119
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Aug 2026 20:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wX4I5JxQWCnspspAzybMeYWAjg+gkSGEg/d2+h94uWA=; b=g+qm5VHooWAezGok
	0PNG38F9QxcihFaTFa+IMv3GZ/fLtTSnPFaSBtL+MAGdS/vAshgeOCvKgS8ReUKK
	ugDVlH0u+pPQhBOdxxBVisC+rtGr2IEAFcsF1pHOep4MXkHPdpqvoPduOMkYhE7P
	Op0nvZGkGHdDbuYJMuHK5RKYm1jU6vgbX9/rhZFdgHO6iaSXBks/0v6Lj755J/qJ
	K6oU63eJslxo2Hy3g6xx23mKvYixMBYWsAL8jinpy5TFGHVDiI+ROzN1L/VXGZY5
	7txF94SvqKGSUp+QKXxVOibmy86UMe+qOKH22orUTQQnFDw+Z0p5D+1JXrXYghHO
	GsyYCg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9yghduu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 20:10:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93494cce712so187366585a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 13:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785615059; x=1786219859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wX4I5JxQWCnspspAzybMeYWAjg+gkSGEg/d2+h94uWA=;
        b=Fo1K+9J4Bqet50nGoJ2p1EP5u5zsOrIS+VRhwHVp9vygukrXwRkWw0X9ZIetR099PM
         0NeHlg49Ry7AxKbBASgnDs402mgy52o631/+l/nk4e9D/OPrx4DGW2/S5caAadJKMiYt
         29NRqD1Us244RJqPd9yTrnpBXvIm7LzZV/Q1xvyNuhWzFXciB/utgjkOOofTcLP9rwOE
         nRIRkEDyNx/vG8yRlNyrEyTWcqlQ0hNlrijr81rJ8Rzn3rrmZDcLW7stlwrXMUK/lTrV
         Qt3uk/DT9M2UL3cakH6C8ld29qnHyEj8XRURceKUSOaKi9OAipJcfK56+RjQI0Sd0AdX
         o2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785615059; x=1786219859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wX4I5JxQWCnspspAzybMeYWAjg+gkSGEg/d2+h94uWA=;
        b=V7ejAwFn4Ffz4Dt/CVaVMWY3LIeNZQk14CETbsHQ1G0E+X3APGKDVBL7xBKCoFo3No
         cVjmUBIbpUUph5/bpY3wzqEU+O9gdInW9+CxGtlQQOBLASzSFarUdjqJF1FUgQWy6VHB
         OBBp3FX14E5mGT0b3ptTgmIH7AC60sQ8Wh06zn6DuTLJLxRgcbtfx6ibrppyVpqPAix5
         6TONMrguHIX78zgDrOOU/+fMPUiydcOkxIFjY2815adLmvpqhlSMfeQjn8CURKw2X1/R
         zJtQ42Hyi8VDcD+VC4czRdmbUuz2v6F4Z6iAy/kuVhm8qdynhmu+HnSmd1MjV1d76x+y
         G5wA==
X-Forwarded-Encrypted: i=1; AHgh+Ro677pTchHN5cDEOw5ZBuk/ON0nhjqKghPG7/BwaGzy24ONoRq9qKkPMmugYolq3801+IzwO4YdAa/WiTzS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5iI8DVT9MLrNTusT/H9PWAQ/t7TzzqKS0vuXiBbK0iMjdAR2y
	+GHderpk63lY2k5lsPnhoPlWbWR8vXvdKC0d9QVDF9MQFV9yS3x39/yAQw84BJx3lpi5sn91KIJ
	/JU/1tTin6AL83rmvbBIzNkwB4pzAMv3CvKFNgtZaAPdfQ2eim/aah/exYdcMvqFLaJFO
X-Gm-Gg: AR+sD116NdIgUB/H62nxzmkPi94XRZ1ou4QxegHdg+LTBJaSqrlqhTE38c4xAxDf5h4
	UAQF7fwtEGHDb2o/M5svaY0sCB+jr1cI/YT43Q/ICaekshZyzqErmFNUhIc5vqN1InXFNsRDkQG
	odGqKMKnY+v+N2uyupMp5I/SkR8KLiod1g6xBt995gn6gwZFSm/dn14Q1cX4Zcpg8LY7C9EZXvk
	CesELSYmjtM5tSS9mEGYtrd0jBD7u5z7CcqXnVhG6wkGkxC+MsfGfPvzRTEFpHrHdCb5lMqC29R
	lTHnAACRJgQ6G6c5wfswxK+sFiIm8+YtbuHpCq1+UHxRtJvd/S6lbg8kNFR2Cic+fVT+awww05W
	lsXjmTw9floHvARa+u7RGQ9AvN7HjfOWnBb2Jv+7UMY2+WMzUPsSqUUmX5E7iphnMW4qz3eWTJ+
	81S948QqM5IrOuyvUY9cJtt+pWR7CfiQMFYDnR3k2CMv4LKcffLHm/
X-Received: by 2002:a05:620a:4711:b0:930:adac:1e99 with SMTP id af79cd13be357-934a0a86e04mr886695185a.38.1785615058686;
        Sat, 01 Aug 2026 13:10:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4711:b0:930:adac:1e99 with SMTP id af79cd13be357-934a0a86e04mr886692685a.38.1785615058147;
        Sat, 01 Aug 2026 13:10:58 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd4537755sm358499066b.54.2026.08.01.13.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 13:10:56 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 22:10:45 +0200
Subject: [PATCH v4 3/5] i2c: qcom-cci: Add 19.2 MHz timings for the v2 CCI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-cci-clk-fix-v4-3-e1d80da54e01@oss.qualcomm.com>
References: <20260801-cci-clk-fix-v4-0-e1d80da54e01@oss.qualcomm.com>
In-Reply-To: <20260801-cci-clk-fix-v4-0-e1d80da54e01@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        konradybcio@kernel.org, stephan.gerhold@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2MiBTYWx0ZWRfXwo+Iuz4DtFpK
 HUm+CIgsKinlIgF0oahlMwENwbJCuBl3hgetAKfO69YuShqByaqIfZS9vy2eMs/gi1o0nO5yBQ7
 xFxQznKgTjl8s1zCadhV29lQFy0usFc=
X-Proofpoint-GUID: RdXZbwMvbKySuwvuvwaCxwq83XWHWeau
X-Authority-Analysis: v=2.4 cv=Gu5yPE1C c=1 sm=1 tr=0 ts=6a6e52d3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=fiHgs4EJ_qdzu2AaPLEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: RdXZbwMvbKySuwvuvwaCxwq83XWHWeau
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2MiBTYWx0ZWRfXxp7dISz5mBFB
 ijSyZQ0CLDM8akXL7ymHPrsok/m7lsuPc2qh+G4eZxak4brglAedkRLMcgrUxC5UWxjYRixJs50
 gLKBEWBBgRlRLr6anhTu3J+Ry04uNVQcwojXXbynfbhztWKarb7/VVKWX1dXb/JCRRXNvQFObmu
 BcWTD/HGxiBLdNZUgpzfyCW9KSq3abYC+UqJnxcltgq6wa83WokGrsfSxo5svEp3ro9+fYl8Lyp
 tNMCtykAXniXooeggIFuFdzkBmaS0mp04paMdzm315d+Vz5OeyFWM5qpem2GGt11O96UkDG9FZV
 weTEvGTWHFUGZXiX1rhmdrYWE8WqWVI2/imye1Y0Ph1HLtxrLxCJFO4DygILQglVwZyMkt7YARw
 1/9nhUF6safBLv2o+WEgatSOu9Q3R0eTun26Ys9etOPdB2kruMg3MVE6YynapDzq+G7SL/QMWnT
 5dSSE5ZlRB7L/4W6wAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010162

The v2 CCI (msm8996/sdm630/msm8953/...) is normally clocked at 37.5 MHz,
but its CCI clock can also be configured and run at 19.2 MHz. Add the
Standard and Fast timing sets calibrated for 19.2 MHz so that a v2
controller left at that rate still has valid timings for those modes
(Fast+ requires 37.5 MHz).

The values mirror the v1/v1.5 19.2 MHz Standard/Fast timings, which
share the same CCI clock rate.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 1092ce0371429ef64c7cc44cc23a42ba4c135af5..b6fa37a306758ec33ede6fcc39ce4412b86d9a84 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -762,6 +762,30 @@ static const struct cci_data cci_v2_data = {
 		.max_write_len = 11,
 		.max_read_len = 12,
 	},
+	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_STANDARD] = {
+		.thigh = 78,
+		.tlow = 114,
+		.tsu_sto = 28,
+		.tsu_sta = 28,
+		.thd_dat = 10,
+		.thd_sta = 77,
+		.tbuf = 118,
+		.scl_stretch_en = 0,
+		.trdhld = 6,
+		.tsp = 1
+	},
+	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_FAST] = {
+		.thigh = 20,
+		.tlow = 28,
+		.tsu_sto = 21,
+		.tsu_sta = 21,
+		.thd_dat = 13,
+		.thd_sta = 18,
+		.tbuf = 32,
+		.scl_stretch_en = 0,
+		.trdhld = 6,
+		.tsp = 3
+	},
 	.params[CCI_CLK_RATE_37_5MHZ][I2C_MODE_STANDARD] = {
 		.thigh = 201,
 		.tlow = 174,

-- 
2.34.1

