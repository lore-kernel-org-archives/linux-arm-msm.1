Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286537;
	b=RL2Vl4hHNIBixmnhccCLfMSCXg9xCXRYVfiFbDuZQhTTo8wbDjehG/HPlOX8ZDs9fiBO
	 OB+qGtxXA+edVg3hn94pPIS+nl7pTmVleb1ogGkijIRj1sh649xjBoA9agZKmoUuVPstA
	 fZ1cr/ypBlN+XD/Rl07ws481t+N+RoKeJ8bbimHDaf6XimgFQQ8/gjU3tEs2E2TPgM76Q
	 QoFQEByvjqp5Aw0fdlTqncB8lOXbA0RFImqeWiiwMTqH4j8mgPWShqVNlAbgZi26QZxQT
	 MYNCBwmkygiTFPFFmWmGKXYOusdrjKZGN+/DXpepPBXC2U2dyxl5uaoUoqmbrIdGZvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286537;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5RbNlYp2ZfCh4PdNTYcfUJm9GR1BwtZ8U90BIq8EMQY=;
	b=ZTdqna+eGbdec2VxXj2tzUno3PSgPHJLaIleD0LU8HF8yc48hnZKleyCqZsej/vhj3/T
	 OZfhgvkfLe9qr1A9CabAyeYqKZ5LMufKEdWf0ZRFQHR8Yn3ashlGfRbz4jwmM/22MFz3h
	 toSiJCH4zWV5ccxRRGoHHojTWtV7cpsrlEcjuSDMoG66hSp6qO4cDbsSIq76NymHTY+Ls
	 Ty5UyhUG+gyBP85EwisSz2A9LzRcO9sxcYcfDUwR2cB3homvTVlFUe6Y+93/51sdoJZJN
	 cBuk9qUsUZc12aYAMLQOeMVGnarqxsk4FiOe9zSl+Is/RRGefrKK47TDH4LgCleVuLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eZf7kGCA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UwOyp1aj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93146606A325
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93146606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eZf7kGCA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UwOyp1aj
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4ABJ6679672
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5RbNlYp2ZfCh4PdNTYcfUJm9GR1BwtZ8U90BIq8EMQY=; b=eZf7kGCACuq47kgi
	J4NdqWjMvwbwvaDyH7fdPxszvAs1hbRLwahq9IdCCZmFhve8gjJ3ZkORmYuWYZP2
	Iq2m2KNLuzyx/sec7SQcB+HsymixfV0LARLcpZOKRvKBBnNCBKOTLcLsH8tqpuwH
	oE2L0TA/JfCE8zJ6dkqkqhHgfysm5f8qFY1eaZ23vrpgIgknBzNqUq9xHhsIkKI4
	Hr1/UePMogYyRkxHREyfKD4J+vSUzzsduRFPvQbk+Ww85fXJxzNbyIDTqzzwEvvS
	bo5DCFspkP2l8g7dUjVh0xpnCaCenp/EovEedSqBg8DQbxDKmc+xdrO58x/ysYq0
	zmiJPQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv48d38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:55:35 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91ea0c20af3so31977216d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 20:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286535; x=1794891335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5RbNlYp2ZfCh4PdNTYcfUJm9GR1BwtZ8U90BIq8EMQY=;
        b=UwOyp1ajLtxMOsq8loxSAiv66YRZmFdjAZTALWXEOlq9kFo9D99EkJIEL/wHgUdWx0
         8ozNDQ7kZk+eSsikVi/CGtR3ytquT4fY/F+k2li1GiPYkJ1Tl4WsAPhDFbj1ghTfTVg3
         NcaPaSPLQPfMw7HixaCdVo20MOkJoEEMesBwaXDHLeqjqqplwT8tzJLNNDmvWrmmKzMD
         MatKGTnFw7e/bJNaGdcSHP2d6bxThcwjsO7PCkUlRPXSyIHBkuEdX/PXRkhCuFM4jOlB
         shxyy1gITjtQPjiCYnPnJCB4caaVQnECDiWhZ2O5SMTrwnllv7RW4BrvuBXLugrUISJa
         y5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286535; x=1794891335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5RbNlYp2ZfCh4PdNTYcfUJm9GR1BwtZ8U90BIq8EMQY=;
        b=K7ytW4g0TBugsOsykrJupX9V0bDWqjnd44gtGm2S2MiDHfrWypmpYuOjj+7BM0z7Sb
         r2poDsCk6qSgwxoEHuuQh9jwVE/Ce2HUsPRkSwPMn0NTPXaeCkDooDgeYnsGKMgb5iX+
         pK+kUnL4EhO0o2I4706pyNCBLN7ln1+J1tT+pzqcw4QqyG3KQUTuKo4boOol7dVQPrQz
         JQCZ+FIeYI/H9Nqx9HBFYOtlPMJdjMIzRHr4ZOEn7PKB8VOB8z1E2+qkH0U0NhK5OFbP
         b4LG7dT8/X3W9yv5b1kksQhgyGCFQu4U6zlVR9j+Cu42qmO4efs88IxpNEXyEpeaCXGK
         2kEg==
X-Gm-Message-State: APuU4Z/sEgz6xw0+DFpbbp1FTTNqKPA3ox/n4aajyN85eS1oEs2Rphrr
	5f9U6HTEM5Kc4RRMfCc4IUHK4YS+cNDAz5R/HqW0GNC/PA2lkbiSckEPS59gcFYbR+0gh5XFSA7
	/7JrvGSRq67w3HPIZOhLnehJNwPoyFp7Ccwmt/J62ySlT9kCko6Pp+PJC93FYCaZn+H1j
X-Gm-Gg: AYBFou2baYxvnejPbTFOpLrygffXFRCJ3T2Z+UnAHpd99zlHQstT2UDtdENX53WqSot
	WXPEt+9w3EwJDbE7532MF4ej2sh4p7/YtdfCIl9mNNJykqltkXfvWnJ8zlvho7R77YMvY/FEk8o
	7ifGX6qI1RDkW9oxLsrMu52lMsPW6z+l1sx2TJkZ56pfmIxptoqIZNonmHg4aHdbPchRW2FbXPd
	es3dI8nJyMXDa0zz6fHcME2nOTfkItKz6StGwTITDlaUxVrgW5aPxes+3cXTAIUdWUv8ZkzMElA
	+S4oyDilh2rNKtEjPerYFTKkpCpva4o+hgnWUrxva5mbMYqJp8+Jk+oY24dNImuTYlhbpB32c9H
	vgyOjezyEr7YklWCgXFAl9BTYOGRiIV7BlxIZfmR3G1XEMFqND6nItRlj1uL4/pHeLfLMX5zeOs
	yMrfHujUE05/dmf2dOyZlECdBT9zH1fYN1+zeg
X-Received: by 2002:a05:620a:17ac:b0:93e:f930:5ed1 with SMTP id af79cd13be357-9479f3c0060mr251784585a.82.1794286534877;
        Mon, 09 Nov 2026 20:55:34 -0800 (PST)
X-Received: by 2002:a05:620a:17ac:b0:93e:f930:5ed1 with SMTP id af79cd13be357-9479f3c0060mr251782785a.82.1794286534298;
        Mon, 09 Nov 2026 20:55:34 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:55:33 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:33 +0800
Subject: [PATCH v8 12/29] drm/msm/dp: introduce dp_mst_drm module
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
Message-Id: <20261110-msm-dp-mst-v8-12-d040fb33db5f@oss.qualcomm.com>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
In-Reply-To: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=8782;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=XXHhh/D27K05twrafiTIO3+Qqt/7/RKsGc8JoccfP1w=;
 b=nvncelDlFwbA0GepCEBy1W/mWB95jWvWriZqH9T6q8ghmDDY4y+mROXovU8NvvoahuB/ps5mU
 jS7IQJiizxEDghMPHjtkFXacWnHfL68f00LZifoQgEyBZUtxtr/9ND2
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX0pK962qoQcBa
 iS6kuF4aLhaiav5/7jb0oFiZLrLV1skQzzR2YmRPWskswHOllXLb+agF92i23P9ywi9VmmPcZer
 tdPlfUF4v48kI9LArpWZO4PPzhz3/fI=
X-Proofpoint-ORIG-GUID: kqmgFkPy1q3OiGiyX7GA7UeDjpbyz1ba
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX8TkcnRRRXXuP
 s+e/qkX2tVLQnsSamc0QLSpE43NpouX9UDqRJLe4ADmMAHIyTylfXxVSExUskLFsP5D47KLMby9
 mtXw3jwzZnWtL2M9KgniT8S9Vu9FcCTAzuayuN2ymPIBUUaGrTHTkjm2RFe90ZSQu34loLXklI6
 6IPT7Xclnkot5FAPLOxni/NnEeJrcyO8i7+pJSvhtMMMgPJ68kCxLfr3aIDzlIOh3VXRiybepWX
 0pRvDMj0w6IS5Vftq2U38nYqy5klY0s54UMs+kzpD98XTQsYsyfKp8agzX1aDNzD/oyPiG+cS1x
 mkNQod6V7jYrEt8AfM6wNw5ZctwsuPgwEneNZODXrmqcb1pnUhDjnwie0LHTNjGTnlzgBy8lsK1
 jXbQtbZXRp/7bhRnQTVJRK2QmrvRskcFCqpGT1eZJr9arl2vRUmUIRaXtIleumeEHTFhMokl7mp
 trZuQRpveOSXF6oCK8w==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af2a3c7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=kqK9UwV0UgyvWCtWq9kA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: kqmgFkPy1q3OiGiyX7GA7UeDjpbyz1ba
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100019

Add the dp_mst_drm module and the core MST manager data structures.

Introduce the MST manager object, per-stream encoder state and the
initialization path for creating a DRM MST topology manager associated
with a DP controller.

Also add the registration hooks used to initialize the MST manager
during DP device setup.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile            |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 22 ++++++++++-
 drivers/gpu/drm/msm/dp/dp_display.c     | 27 +++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h     |  5 +++
 drivers/gpu/drm/msm/dp/dp_mst_drm.c     | 67 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h     | 13 +++++++
 drivers/gpu/drm/msm/msm_drv.h           | 17 +++++++++
 7 files changed, 152 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 1e246616f83f3..48640d9bf7cb5 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -147,7 +147,8 @@ msm-display-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_link.o \
 	dp/dp_panel.o \
 	dp/dp_audio.o \
-	dp/dp_utils.o
+	dp/dp_utils.o \
+	dp/dp_mst_drm.o
 
 msm-display-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index da3556eb6ecc2..3c3203ca32c76 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -655,7 +655,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 	struct msm_display_info info;
 	bool yuv_supported;
 	int rc;
-	int i;
+	int i, stream_cnt;
 
 	for (i = 0; i < ARRAY_SIZE(priv->kms->dp); i++) {
 		if (!priv->kms->dp[i])
@@ -678,6 +678,16 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
 			return rc;
 		}
+
+		stream_cnt = msm_dp_get_mst_max_stream(priv->kms->dp[i]);
+
+		if (stream_cnt > 1) {
+			rc = msm_dp_mst_register(priv->kms->dp[i]);
+			if (rc) {
+				DPU_ERROR("dp_mst_init failed for DP, rc = %d\n", rc);
+				return rc;
+			}
+		}
 	}
 
 	return 0;
@@ -905,6 +915,8 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 static void dpu_kms_destroy(struct msm_kms *kms)
 {
 	struct dpu_kms *dpu_kms;
+	struct msm_drm_private *priv;
+	int i;
 
 	if (!kms) {
 		DPU_ERROR("invalid kms\n");
@@ -913,6 +925,14 @@ static void dpu_kms_destroy(struct msm_kms *kms)
 
 	dpu_kms = to_dpu_kms(kms);
 
+	if (dpu_kms->dev) {
+		priv = dpu_kms->dev->dev_private;
+
+		for (i = 0; i < ARRAY_SIZE(priv->kms->dp); i++)
+			if (priv->kms->dp[i])
+				msm_dp_mst_unregister(priv->kms->dp[i]);
+	}
+
 	_dpu_kms_hw_destroy(dpu_kms);
 
 	msm_kms_destroy(&dpu_kms->base);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fa027659a079f..9449ef692189c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -28,6 +28,7 @@
 #include "dp_drm.h"
 #include "dp_audio.h"
 #include "dp_debug.h"
+#include "dp_mst_drm.h"
 
 static bool psr_enabled = false;
 module_param(psr_enabled, bool, 0);
@@ -1286,6 +1287,32 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
 	return 0;
 }
 
+int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	return msm_dp_ctrl_get_stream_cnt(dp->ctrl);
+}
+
+int msm_dp_mst_register(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	return msm_dp_mst_mgr_init(msm_dp_display, msm_dp_ctrl_get_stream_cnt(dp->ctrl), dp->aux);
+}
+
+void msm_dp_mst_unregister(struct msm_dp *msm_dp_display)
+{
+	if (!msm_dp_display->msm_dp_mst)
+		return;
+
+	msm_dp_mst_mgr_destroy(msm_dp_display);
+}
+
 static int msm_dp_display_probe(struct platform_device *pdev)
 {
 	int rc = 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 96be45c3dc923..7b6d76f33ac61 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -24,6 +24,8 @@ struct msm_dp {
 	unsigned int connector_type;
 	bool is_edp;
 
+	void *msm_dp_mst;
+
 	struct msm_dp_audio *msm_dp_audio;
 	bool psr_supported;
 };
@@ -59,6 +61,9 @@ int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
 int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display);
 void msm_dp_display_unprepare(struct msm_dp *dp);
 
+int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display);
+int msm_dp_mst_register(struct msm_dp *msm_dp_display);
+void msm_dp_mst_unregister(struct msm_dp *msm_dp_display);
 struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display,
 					      enum msm_dp_stream_id stream_id);
 #endif /* _DP_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
new file mode 100644
index 0000000000000..5d22aa34c521c
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <drm/drm_edid.h>
+#include <drm/drm_fixed.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/display/drm_dp_mst_helper.h>
+
+#include "dp_mst_drm.h"
+#include "dp_panel.h"
+
+struct msm_dp_mst_encoder {
+	struct drm_encoder *enc;
+	int stream_id;
+	struct msm_dp_panel *dp_panel;
+};
+
+struct msm_dp_mst {
+	struct drm_dp_mst_topology_mgr mst_mgr;
+	struct msm_dp_mst_encoder mst_encoders[DP_STREAM_MAX];
+	struct msm_dp *msm_dp;
+	struct drm_dp_aux *dp_aux;
+	u32 max_streams;
+};
+
+int msm_dp_mst_mgr_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux)
+{
+	struct drm_device *dev = dp_display->drm_dev;
+	struct msm_dp_mst *mst;
+	int ret;
+
+	mst = kzalloc_obj(*mst);
+	if (!mst)
+		return -ENOMEM;
+
+	mst->msm_dp = dp_display;
+	mst->max_streams = max_streams;
+	mst->dp_aux = drm_aux;
+
+	ret = drm_dp_mst_topology_mgr_init(&mst->mst_mgr, dev,
+					   drm_aux,
+					   16,
+					   max_streams,
+					   dp_display->connector->base.id);
+	if (ret) {
+		drm_err(dev, "[MST] topology manager init failed\n");
+		kfree(mst);
+		return ret;
+	}
+
+	dp_display->msm_dp_mst = mst;
+	return 0;
+}
+
+void msm_dp_mst_mgr_destroy(struct msm_dp *dp_display)
+{
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+
+	if (!mst)
+		return;
+
+	drm_dp_mst_topology_mgr_destroy(&mst->mst_mgr);
+	dp_display->msm_dp_mst = NULL;
+	kfree(mst);
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
new file mode 100644
index 0000000000000..7f35e7524cfdd
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DP_MST_DRM_H_
+#define _DP_MST_DRM_H_
+
+#include "dp_display.h"
+
+int msm_dp_mst_mgr_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
+void msm_dp_mst_mgr_destroy(struct msm_dp *dp_display);
+
+#endif /* _DP_MST_DRM_H_ */
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 2840e8a5052d7..31ab50f620bcd 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -357,6 +357,9 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_displa
 bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
 			       const struct drm_display_mode *mode);
 bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
+int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
+int msm_dp_mst_register(struct msm_dp *dp_display);
+void msm_dp_mst_unregister(struct msm_dp *dp_display);
 
 #else
 static inline int __init msm_dp_register(void)
@@ -389,6 +392,20 @@ static inline bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
 	return false;
 }
 
+static inline int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
+{
+	return -EINVAL;
+}
+
+static inline int msm_dp_mst_register(struct msm_dp *dp_display)
+{
+	return -EINVAL;
+}
+
+static inline void msm_dp_mst_unregister(struct msm_dp *dp_display)
+{
+}
+
 #endif
 
 #ifdef CONFIG_DRM_MSM_MDP4

-- 
2.43.0

