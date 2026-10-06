Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6024939936E
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 22:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326425; cv=none; b=V6ntkasTsUBtz7tLa7B1P3onv94N1X3hmtdOCA3VszCxhORsMyc002bLhY8/bx8lZFKN1Rl3Akn/TvnMIEy5pVG81a118nS5JStkoCVWiabaGVfQecKKKxUd/N+xOCUpgWjbXVGZdoyl/TDXH0XN/dtpBjkfyNkmaiVWWUvmXVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326425; c=relaxed/simple;
	bh=DPgKLvB2PNcWdmQvkIzprusFWSgbJAmy+ICrqd4Fj+0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qlk+JIsnJKPAxjj6LkjzqSYRNcdaItkKm9Ut3KAcLAsuOAkA1T55ceTnj8eQ0Oa8wQDs4WpkEEQURNA0ZSo1OQHjNDOHb33d+/8tBvaYs0PDU73aFxGSrpSHs8kMfOUtdbXWDwuQoZqrSV7wzTKBT6mprLtmPf8l74Q2LSkV2ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CRcSSKz6 reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CRcSSKz6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LekaU592005
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 22:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XU1FwuBtbti
	AGCfwU3DbkpmUGr7mhTNOJFzOVECWXN8=; b=CRcSSKz6Pqy58Lp3Vj/L9fQVdUq
	EP7/yunVuNbUiVLU15CY32lmeulKu4ri8uVgOwb+Mmt145c714bjvGrVASV2Xjy7
	s9MMILeVVl9tbLGXtmVG52D1lWx7gA6DcweLW7tx6unn7/OQ5BucGFfWDgT4vUs2
	MsBYXzy5Kl5bKFzesYVm5mEB+QTTXJdE0TaQ0C2hY7HOug5UVFKvObhrwRQ5QJNN
	tut3zyAQ+0CghyXtfvKI95Ejxm5sAI3BVY2tM+ABnyV4NeEgtcJsag/G6rQmKxVa
	IHvUYrHQPLe/qciIrPg57u6a3d8vLhooiBn4SBXqmRrB9c8qKzjVZe9mENA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4y91jtdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 22:40:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9179524bf03so65159866d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 15:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326420; x=1791931220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XU1FwuBtbtiAGCfwU3DbkpmUGr7mhTNOJFzOVECWXN8=;
        b=MWKjJxADSeEsfZ5MVNhz3TV4F9fPnMoneYSmY8Q6at85O/+5Z35i5LPPg5igr8BDPV
         prcWC4QdqTsIZwSB8sEEAwGr9NC1YhOrgzKjBOw6H7wECHW6RMVzMk4RzbqOXYixZ4qg
         4ClTLfGxTa+u4wjQWWJrf+dMxgtWJKFu2Xd00CrrsBDgHEkTtSrTiykuGwln0ql9/eGy
         NtW7e4qdVMrGkDKsXtr2uvIJwYbr99Xlc5bZ2vZ9U5KnbfjhjQI3BhK75wIVZj0LaOlO
         P3YDudzZ6DWrLi6K5qxKATNPFPqYaUXJf4J9DpR9EwWS2bg1tFZhUFeRCbFUlN5JzUmO
         YYjA==
X-Forwarded-Encrypted: i=1; AKwUvByXRCsxdZ+u2enz7+LsoTyDry+rDWP883d/D0Rn6Hvd9p6KIza2aj7Io8Zj1hHC7vGVp3lnxRWKwcr5jEBV@vger.kernel.org
X-Gm-Message-State: AFuF++mSXv5v950T0owmOBPnlSm4Srax5NgRCJdADyMXtp+MOT1+LatX
	B1U2zPtrs1V2Z/uzLpQ4EPcwfTrvECC4ZS34BcixY26TJBBK+wARGP41FF4DLEhyJYh7cPi7toY
	F0Vxv0AeAXncDQRkqpciMb7lQbr8E6HrJtlCh9WIrTP7YeZ+0i2ONHVtWR7uGa2jjGGt+
X-Gm-Gg: AYBFou1DkArIT4r97CYemKoNinS46Ch2GOFcvOcj5rRv06MXKV+CfjKsqMkeLDIKK8V
	qHCr6qzTYl18Ie13CjLLWH1jy9hgraQGuM3KoCTzpTFbm1XD0O4LbnwUAIsk1QjKM3lyeHL7Nrt
	ybbknkdAM7Cm1RN/Cj51p0/5DmXVu6ukbwqual+GFxuvL8NlL3WCXd4ZveJ94QMKAqQ4ArnNCax
	ZaCDA5SdBMSGlmjQOenuNJxrUGRiKb6/gsui/Ygw5i3NOWYS+5L1ZSBEsyb176P2wBvkQ8aEnJ+
	+Ps9NBOnrUrA6GumWqKnO8Wep7Z8oB23bYen2A8SZgViUlR+V6uhFGt75M4=
X-Received: by 2002:a05:620a:4550:b0:93a:2d15:f84 with SMTP id af79cd13be357-93e9b7cc40amr75369485a.33.1791326420148;
        Tue, 06 Oct 2026 15:40:20 -0700 (PDT)
X-Received: by 2002:a05:620a:4550:b0:93a:2d15:f84 with SMTP id af79cd13be357-93e9b7cc40amr75365185a.33.1791326419732;
        Tue, 06 Oct 2026 15:40:19 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:40:18 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 03/45] media: qcom: camss: report probe failures
Date: Wed,  7 Oct 2026 01:39:11 +0300
Message-Id: <20261006223953.3382273-4-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXz+YyhkyDnDfd
 JXzcNRxE1Z6HtMXLDblZ2G6jprVqFAIB50LKjOOxGu8nvE5A/GQAsjyK0nzqeuS8LlzCXW1Mnza
 FjDOVD2rKuribCzwPcbdP9MQ0bOVv/Y=
X-Authority-Analysis: v=2.4 cv=Ho/jiETS c=1 sm=1 tr=0 ts=6ac578d5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=_ke9eFR7E5bWC9if0q4A:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX7tzv6muLBazM
 5IKDNQKfhUQo+TZ++pUFzedzARYy5fqKMeLaFxDoV0QJ8Up0yihyLRS8n9t4D6AOkfQ/wc/bgE8
 qJ8Ph62lpPoMpQwzEme8XFFbzfTlcv/o77pjU4Bqd2J2A2xwfvN0PaLI7RkRSW6EOD9Lo7S6vcy
 1LcMU/OnFRAgKi9313QeR/kGXLZ/Vlx+cnkEuLFM1++6TJqWzSQmHjLVx/o+t/4hSE0EP199N/+
 bH/1H9Au3xN2B7SaRYh+vytgf775Q2Tu9e/vrjVO4Y+5ZGSW9mPy7wkBFAvFa2bCUBqc7S4PC4a
 9QbIm7ae4TtBUG0/HTrUYoSNPspB87ZnkI/RaYDbDiGFnXUud/SJ6jCHs5MDqthX2+b3S5xpsSH
 LuKJ5NVsxv2iitxPfemHzqAdbqfGCrTTHtIKfeTsWxxAdkkvfnLwm7TNL5219VgSX7r8A80WV4H
 6ur8Ns+9ZMT10gZSE1g==
X-Proofpoint-ORIG-GUID: PL5DBnwm6hjMLxqgSVKrn72l4DP8l9Fn
X-Proofpoint-GUID: PL5DBnwm6hjMLxqgSVKrn72l4DP8l9Fn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Report errors returned by interconnect, DMA and firmware setup.

This makes early probe failures visible in the kernel log.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 9bfb0290395b..1f662b1caf5a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5418,8 +5418,10 @@ static int camss_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ret = camss_icc_get(camss);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(dev, "Failed to configure ICC: %d\n", ret);
 		return ret;
+	}
 
 	ret = camss_configure_pd(camss);
 	if (ret < 0) {
@@ -5432,8 +5434,10 @@ static int camss_probe(struct platform_device *pdev)
 		goto err_genpd_cleanup;
 
 	ret = dma_set_mask_and_coherent(dev, 0xffffffff);
-	if (ret)
+	if (ret) {
+		dev_err(dev, "Failed to configure DMA coherent: %d\n", ret);
 		goto err_genpd_cleanup;
+	}
 
 	camss->media_dev.dev = camss->dev;
 	strscpy(camss->media_dev.model, "Qualcomm Camera Subsystem",
@@ -5453,8 +5457,10 @@ static int camss_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 
 	ret = camss_parse_ports(camss);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(dev, "Failed to parse ports: %d\n", ret);
 		goto err_v4l2_device_unregister;
+	}
 
 	ret = camss_register_entities(camss);
 	if (ret < 0)
-- 
2.34.1

