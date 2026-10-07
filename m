Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E01466AF1
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 09:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363657; cv=none; b=NrHLh1WdGiqzywSSwrsdAmsgKn/txUNZ9pWkamlwHFVY6q0DXkuSm6Qke4XD7jlTE9Q0HC5r+me0RnbP1LScbLQxPV0iX1RxsJWNUjphLVIxHSznXH8r0ErHD2wsaLu1/gySdCKzTp9MLh56PB74prs2EfVT7uTC7Sgfc6O5V+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363657; c=relaxed/simple;
	bh=DPgKLvB2PNcWdmQvkIzprusFWSgbJAmy+ICrqd4Fj+0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rWPE4R0DKPi9U04KL2PeIYDPmAl/4S+7k6flA1krKl34yG9HIkL+ZqRhLJNCieQPFrTohq6PeFpY58kjLC8RK9jjdS0Jk9IIQngsyhcfhaQ8/KT7R6vFlZwK7glOnWsrufckCxPw3M6rOI1awJfSWaRTc1+MZlED+zk4kfQTXvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=itMUy/L3 reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="itMUy/L3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jWT33298217
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 09:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XU1FwuBtbti
	AGCfwU3DbkpmUGr7mhTNOJFzOVECWXN8=; b=itMUy/L3SRtQBTA5YPer24nNTW9
	qUUPFiOqYNNGvFJMTxL7j3Re57tgl0hmsQMs5iYpDL/MOh2CK/ebiCq5BYOh8PdS
	AfgZ18Nud/mi57+PTN7JtltE3tlOIATi/wLjpZKXUz3mLog4PnutU0y4msrDZ1of
	D7vxe5R5WyJQrZzxzON+ch0Yqrair9If0jpeb+a07vx+GcIPm+zMB7Q8cKBpvMIq
	6sDPCToiGDPCj+sEktkp/0AYxe+tdUopzGOY9Ec56qrX+uaqJtJ8T7mEqZY41Veg
	QgZTAEegKLsaIETP7YYPnX0k1/o+3xnPzRxxUuwkdAui2g70a6Wg1XLflJw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5hdcrbnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 09:00:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-914321eb48eso54910916d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 02:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363653; x=1791968453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XU1FwuBtbtiAGCfwU3DbkpmUGr7mhTNOJFzOVECWXN8=;
        b=VN8sUIveySYr9qYV/2W4EWWxdNbaGIWLvxXBjcfAuKZrWNnyhNvVxKrpCcw5dkdz8A
         eWXBGTq3dhNHQekIJGNjED+UB4HNIP/T8pY6AjCbSrss1vRlG0mKNAzVdt+wFv3FAQO4
         zxSDo7WqSavXKNVxbyvjLluzg0vnygo3hDnSeGXk16vQcrSJJr/aUul2qXftOrcmb23j
         cUDgC8Oxdd3cV/Z4472MOpZyYDETkNNcWClDNvTe7McBQ/dZB3ZR9WtoOg+KmpOW5Cm6
         flRWEiZcgkAqClecbrFxAyF4j6APXtq2HLv0eRC3QiGfohN6fch/HfheGDeQqHaVZsoP
         fTCQ==
X-Forwarded-Encrypted: i=1; AKwUvByrHq63L6qUVqrybi/6EgyU1hvP+4PRIcLiM+Os97yrt+9tlJ4M3FSZowgSezfMCHMTAyu0A2KnxIuQFMVX@vger.kernel.org
X-Gm-Message-State: AFuF++nrBWylJc7pZZtWroxU146uTBA78ggkulVtiYlFY3kCRjfA0PMQ
	/5lsOCKvrGJA73xwPim7gUtaBCaY7TTXmgOoPOOiOf1KiKKyrNT/ZbJfmlmu/0/zovn13TJc4bQ
	ORZD6G6hAMcLVxXJtHd85T/XVe+jM7VsbEcJghdmQGQrB2Tv8dRO276Z5LXxnC+kHaHJC
X-Gm-Gg: AYBFou1CKDDoxX2Dqr6IffFo2C3oHgMdHIxnKOxhd6gmoitHd3YVhFR4jCFysBewa2T
	787vjbYmeG1rnxmUshDConuqBGLGhD9zxM+YjvKU+E3gfuEr/waDcRnhlT3pBp9rteI9o7Nnj1O
	ABpCfIN17QYHDdpUu7PfsTfRao+1O6/Kwncibr0hvToeqgwR8jpzB5NoE9yrkMTRplvYYPIszt5
	pYy8WDo40uPNxbIPObYCocFAnzUfBEZZqg4fAAkPsnxsyx7fsC+XcUiKngUxEEj5Bs3+JJ5pENX
	4zb6/TKq2mvQn8f18JPKI0hnlDxoww68sUgOcakk5o0iII6foutcCPglQF8=
X-Received: by 2002:a05:620a:4013:b0:93e:9809:dbf9 with SMTP id af79cd13be357-93e9b8e0532mr261078685a.76.1791363653156;
        Wed, 07 Oct 2026 02:00:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4013:b0:93e:9809:dbf9 with SMTP id af79cd13be357-93e9b8e0532mr261071285a.76.1791363652377;
        Wed, 07 Oct 2026 02:00:52 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:00:51 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 01/45] media: qcom: camss: report probe failures
Date: Wed,  7 Oct 2026 11:59:57 +0300
Message-Id: <20261007090041.3732717-2-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2HYLkGvkpv1eAyyFQkJntA_X2QtdFlGS
X-Authority-Analysis: v=2.4 cv=aKFlOr9m c=1 sm=1 tr=0 ts=6ac60a46 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=_ke9eFR7E5bWC9if0q4A:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX852rrzDpiVQB
 xcWqJnbuMb7YftrF5dYbHUC6QeJW8q2B0geIHgUKfHskKs6SLZWnBs6mM3exzSlWRA8HJYgAFYe
 Vm5gJnp02KxTUtK1avWLZfeOMU5XqLc=
X-Proofpoint-ORIG-GUID: 2HYLkGvkpv1eAyyFQkJntA_X2QtdFlGS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX4dwrurZyy707
 NarMtWjKRgrAg8DXBkcJ4K9U4iNOL0wBEd5Le/q6mbG8K6PWjcK49G021chtdeI+w0Dtxq0vzQB
 iNllPmn6o4pfBOL0T/YPQQG9gPTMdGNFryjDyEtCPOcLbfObuwCCrCPXBwcw6qFsnxrAVKPmJgO
 H76JP0nNRFSMbSwhSZLIbMdo9p7ayPDS/XCAZvSsgJr5z52ovRL50PfVhvTPCIjgNCThcQdXfdE
 tnEiV69IO9m4ldOqq8aMzDXs7vEI+U0iTJ3gj7R103BXBFCJRzIa6Da/iZgImbvJF7aGbAH27ll
 ZLUVltmhSMeYGrKeL2Z8cbk7hqI5q9lFnFdVG9BOAYDzLvIsyXlVI7TWHzIIKOSFv2AAiR+gVwV
 Phcii7+uNgvka1TsN4wu7Oc7Q8elTOy3lAb7ATjZsDHaOqIGmVnbPxSy0Zq/UO/NPJAWJE+AvRL
 wyQj44/n2jmSVvaskew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

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

