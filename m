Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565883;
	b=3Wd3mWtCgR3R1l6+svG25oxBZRJgq9cpSOGZh+yW/5AQhX+S1DwUBCRCnJLLGSpd9b2s
	 +ASJTDSwKi1F/MfLFHJJMDT4DaisSeY1rlpKMl5GKiMMYLowzlpI+wS/16P55lH3oyKgt
	 B0Y8oR+jBZpxStlsPQmj910a9ZCRJfjjgpgXupVqOhgyo9Qg/ZbVhalsnJuetLczml0s+
	 0Ui1FynDixd8qWNVj6jgSprNj3Rdog6PcHsQbfXkAaj9lzlYZctgEifIyVahqNzg8mAia
	 XKE8Y9YQzBlA9PM8EkqXFlFp0YoiCDmaVbBMavG3xzTrnAet5FA/3a61qwrjCiWqCsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565883;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KpRu8BpOa+mCCXYxNaCrJjVGuENtvlTwOw/KUHxbDY0=;
	b=wbBO8YDsPJ1e27QNW70Jdz9vt2KLUt8gpd5v3GVgZdTcJN/tjXFe1V4ZnSTigvmuhu7o
	 gsJX1ioONJl2AVOOzA3qRPEfmPK7uw/IiWTI9LZMPUWmQkEl5ueFNi2PngyyAMtCZJhi2
	 YT+212KNTICJzfGSKrcWjdqjXds9eJVee5ndJjeTugahRL53HQe58bqd6VAkDO9Ax7l3e
	 PvQrzK43GIzE0LnXZFo4vWunNVguoxzKimp8nDNHIIA+dPy2uvisJGijcasC8A35x1tif
	 eIkAbMndQGEfJjR4bJn0yHBIsQSd6fcz3IJ/OPU4cvfXKJbFxca575rq4xMj8JHy59w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WnZoMRWJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L4o3pjgT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86231606A887
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 10:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86231606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WnZoMRWJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L4o3pjgT
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V0Pg4101627
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 10:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KpRu8BpOa+m
	CCXYxNaCrJjVGuENtvlTwOw/KUHxbDY0=; b=WnZoMRWJSgdz38tzuU6WjXsNSWu
	9QCVw8Z5vsMGsFSWaAhSXdtUFAYO7vqDqHiegZk7MEFir2KlCFF+tULr85YhBHp+
	5YsU7z6fd4HccuiXJ7/4bdHC99e7sT+XIxryZqikmDpoaNcVDyBGELl3Yh/acTNf
	V79Zc6goJ5BzUvHJzlMXHPNGZ9uYW4Hv5oCOYkKdPmwhPtgpMT5FWc2xn5poGa0B
	BoDBsQzhbx/n8RbwYLmtcMS/IUU7BSzVlRdXQIDua0yroalHupytoMyjxaG1qVXp
	JKgiky/XI4F9l9S5KA7FeSAikyBwEM2JN9TMPwVruMftUYA/jegYW8l6A+A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdjqtr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 10:31:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eb5375cd68so7525635ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 02:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794565882; x=1795170682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KpRu8BpOa+mCCXYxNaCrJjVGuENtvlTwOw/KUHxbDY0=;
        b=L4o3pjgTOEWx2w8bs3thwOnjg5DGn4aiGp1wlQPwysQZw7ql+Lzaxlw19LBiQ2mY72
         waEbMZ9fP9fKVPjCaSm07Pu8E6OrCLEjBGYGR5L3jZo15YenorxtkvS5zwhdbtQsIh0/
         HA2ql2TgVh3cNlsvrS5vVt9clS7eAEXesAprgMxiYSS27WNR4Y0pSYucc43XNaYkeZWA
         yi6kl6C1IeRrTy/70GiEXtkekIyJvHiT6dYK8eFXjUOBGxGidlJ7xhTbJxH2vZdkLzOc
         H3Wmgm2QmbhZxNfzG1UcwtWOLCGTgt7xr1MRL+OHE22rWcR4+l31Kw1Bgo1EmO1FOxAK
         xENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565882; x=1795170682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KpRu8BpOa+mCCXYxNaCrJjVGuENtvlTwOw/KUHxbDY0=;
        b=qmgD/rch53EI38ZhC5/4YAxYVsiB63dprbxVaqSPOruBs4eNgF6O506rLshYKxF9QE
         OvXvObA6h3oqX4/c7br0iv/pfopduvsPSRtYUbE+jvZ+gAR+EQhRCN6sJlr5HaKXBpJL
         ZhXq75L6byS+3KLdQbg/Ka1unoafFBteqefSZZNrFYi7svarbI/kr/xxKyPcl70PezR8
         LeMzpA779o2gVAO6Pwzmlvco8ddi0q5BDykot87cuF54OA018X9bp8cZXKF/qDBayDNX
         5LBoVHYOwktRYHT6do3dl2Mbw0FRqwh0SdYpbZWoxQU1itzj8jDL5yCPAYKJSrx1hyl8
         Z/tw==
X-Forwarded-Encrypted: i=1; AL+hErF2rK4Eh0Y0auHI1bKXi8TMHG7lXbnrWwp9zjuhlHdmObZgi9QnmyuiFyyZTTFGQj5CD75DTx3AzhL4WX4r@vger.kernel.org
X-Gm-Message-State: APuU4Z+N00W+28MOppVlwZfB3TCIXfedYk+j/sZqIH29dhwWc8g5/jnO
	3FH/GyGolhNb1VQwVxlS2q8cmTCyw3kNhkn3qMZI8iWLDa2OOMKrZQOpGLMU55cZsXozgnBcMnb
	so9ySVmVdp+U7oHZiGxZIwcdb3h8iX/l0Dk9EHm3170+ATzP2plaoKlzWfWHeV/gyCJQL
X-Gm-Gg: AYBFou2jjpqkHMkx7o2V0f8DMWmJ3uGQTAKujfJAQxo/LiKaRRo3dErJmL2aIMyBO7+
	WwuBB9YuAfccbyAQbEY0UPKriO205sC6ylwIiKSqhbdWO2ltevzU1s0kkwB7b+boN8Pa7jpqOkP
	qr90piYOBsOcC7u3n78atRhb5sQTTfduf5jXPkqqViccdEIw/hOmaCox0+GWQVxP9vHDNnESWkE
	iNkSJanTWA8I/SfvAMkCpgyCVcLa5XRvoM9DAX32zAqTkARLU/3uESl+fkfnbKWkJXwWjNODT+C
	ORTXDAIJoBBtvV11brOIc1QdhoxyE/5NCghdHMbcyCtqHkyrt3h63AuDCvC2nfXBSz4TtrAT9G2
	qQbOknlpDy/+Grxt8IsuMpcEj3zGhsTjj/3f5rmAfoQU8EcLmJZBbFlTtRSjbspPmrg2YrjfOyg
	qo2g==
X-Received: by 2002:a17:903:30d2:b0:2ed:146c:cbb7 with SMTP id d9443c01a7336-2ee0da7fdb6mr12931065ad.16.1794565882134;
        Fri, 13 Nov 2026 02:31:22 -0800 (PST)
X-Received: by 2002:a17:903:30d2:b0:2ed:146c:cbb7 with SMTP id d9443c01a7336-2ee0da7fdb6mr12930915ad.16.1794565881678;
        Fri, 13 Nov 2026 02:31:21 -0800 (PST)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8d4612sm8072585ad.57.2026.11.13.02.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:31:21 -0800 (PST)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v2 1/2] phy: qcom: qmp-usb: Add PM suspend/resume callbacks
Date: Fri, 13 Nov 2026 16:01:10 +0530
Message-Id: <20261113103111.156476-2-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113103111.156476-1-prashanth.k@oss.qualcomm.com>
References: <20261113103111.156476-1-prashanth.k@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX8XqqDy6UQktX
 U8kvZho+72udrw/AIpJtE1UnWJRkiEKB+D1Wf6ktpFoROpWdMWWse4/S3/0zngSeWzsden2XaH+
 btwwnX4HOeSYpWl9gL/5jkI5FjllMjo=
X-Proofpoint-ORIG-GUID: twPL-BatVJPGIkkCLp3rqqfVTSc1bq6M
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af6e6fa cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=tKit87rPrO_SzoOCm70A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfXwbzLvWamcqxU
 /x1SWbB9PkM8LUmByxx+ywp72ivWm7dnqezGhRY4Wywd2RcA9mtEh8aRf3/aeNmBNcpcrLpUGBZ
 Gle8Ess9WoA5tJyNRybKqKiP7WvhDsMMhqsL4maKsPlgTsYpSwCWmc2INBB4/AErCFnnNvJSjwD
 /Qb8SSt56mS132tYqIaEtisjEH7hcOfj2MzNqENV8YtCXKZQYTSEdTFVmEKGvs+/hHqmHIB2rO9
 V9HjsjMuTIBrP0P1wWYQ2iA78anKlbviHXgzMzFi3phyH/Dshq0f5lXcO8GdhOiAoshlvPFBce/
 bJaoCMIHGD5qYunmn/CJ93ONr/Ul+nH2v7Jqws9engWsdmUbmwS91IdNc/Jw3yaWlFKsDF9bbhp
 nHYYJs85lNMi2OKHYQ7ZJKhmg8t0zHe/z9o1hqhWMUy1vetfIWMNXOZn0/Oa/xYWFOvbRH/c7qP
 FmUHU2UMgmuy6J6puZA==
X-Proofpoint-GUID: twPL-BatVJPGIkkCLp3rqqfVTSc1bq6M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130041

Currently when we perform system suspend, the phy clocks aren't
turned off, this leads to power leakage. Prevent this by adding
PM suspend/resume callbacks for the qmp-usb phy which toggles
clocks on/off correspondingly.

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 6a9faa0ce3bb..dc8be977e0a8 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -2129,6 +2129,7 @@ static int __maybe_unused qmp_usb_runtime_resume(struct device *dev)
 static const struct dev_pm_ops qmp_usb_pm_ops = {
 	SET_RUNTIME_PM_OPS(qmp_usb_runtime_suspend,
 			   qmp_usb_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static int qmp_usb_reset_init(struct qmp_usb *qmp,
@@ -2510,7 +2511,7 @@ static struct platform_driver qmp_usb_driver = {
 	.probe		= qmp_usb_probe,
 	.driver = {
 		.name	= "qcom-qmp-usb-phy",
-		.pm	= &qmp_usb_pm_ops,
+		.pm	= pm_ptr(&qmp_usb_pm_ops),
 		.of_match_table = qmp_usb_of_match_table,
 	},
 };
-- 
2.34.1

