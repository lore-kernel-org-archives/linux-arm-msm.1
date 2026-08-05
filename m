Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9BB41F5E7
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 10:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785926543; cv=none; b=A/EkRWuXLi/zBh1lzV1uTrPZ6poqc9hy7UCVPazEgk3hRc6Y9qIrfNUZUT0KlFeG87H2EW7RvmhuzN44WyVhd7qxrMiKrxOl3a/mVDpk0bhuNSHobhpJtb3u2d/1d3Ynvk17rI4Oh+pnMYNIYj51/peJqVF/vxctYcE6NcF1Sac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785926543; c=relaxed/simple;
	bh=dFfg+yi5CHzTc26iZLvWQGYdkQ4fnddTpoVHGJmMkSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B4sL85Xx+Fg3uyAurk05PfBYNJqcGr66T1OPpGik7pKai8YSn5TQXvEYv8ZjcorZNE8JrZGWlktL2WtrfjrUtPw3KqEO88k5Ade946uDElKeksRrFoRJaQDQM2SxpqJQ5zb7quCfexg6gKkba6G6B43PwWtyKTAo+POJmBiQzUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ib6X36tm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dECgWUah; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ib6X36tm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dECgWUah"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dEIC2074096
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Aug 2026 10:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SosYBOSUJqYzgFFI2VlCZ6y4w4ywG1iaTvH3S/tqiq0=; b=ib6X36tm/dqfqfWM
	M8XlGxp0O8wEmevg/p8Upu3te/Pgu6Q6IDM9zs7miCM1E8Rfdb3MsH9dpQl7QHyW
	X+fe47Q/fyBHMHHCBSxi6jXJG7MSwNTLpuM+x41vmhaf1W9WUqpWtbId4WKH5Ysq
	i3gs2cEd0bR1g4WGsYQmE6wMiPHbIpJFJRllTnxetvYQjEn77WUfU25kS9vrhfNi
	fxjl4cy0nBcGKh71M/1x0Hj1Lz464hctumJwtkEIE4JEMGwtXajdUdj7SFhElYSO
	C4xOWLZUNL4rYnr3ReeFuaKACYG+TvS1bQT3vgIfHGgvV6fDS0hD16Z2E3y2+iz6
	hokNBw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuk9u4c6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 10:42:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc88e22f92so19939325ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 03:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785926541; x=1786531341; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SosYBOSUJqYzgFFI2VlCZ6y4w4ywG1iaTvH3S/tqiq0=;
        b=dECgWUaht+oax15GmjFaOvLW6a4H23XTSuOeNWCHujXcWNEw2szbvOKOAAO4lO6SPP
         6Us3sLf1rq8gk2gFLWXD4N40K6uqhPc4YaYzKV7rvFfuRqd3UZm6vs9/dvpJxnlbjAeJ
         u+NaRNLgwMd325BN9NnnAaaxPIRviyRPuyY8yyG+ePT/LHy5aucFTecIEouU/c9HLt8O
         fBgxz4AjGFyebyzsecuaNxtz3xMq6U315MMOj03kblLvaHDAz9qw0k1eMYHAFDPqFhc7
         o7QZQsWWCsiE1CbaxjM0fK11cZW865ZSoAN7sWjqEorQ19hN6/1p9x5oa48/91hw+bFc
         /3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785926541; x=1786531341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SosYBOSUJqYzgFFI2VlCZ6y4w4ywG1iaTvH3S/tqiq0=;
        b=pU3G22knQmY98AnuXf8VZda7S3L6aiwfHzRhuVoelZOBionpHK5IzKgZ5astcTdYPG
         c998oJOTn+kDCgPA0PJ1ZVuaXUZ9JBtAjzP8SZDuCk4biFmr+W0XtNgh5mB8cHR9Hh4M
         MdVWeEXATI4N1/T0I3UBG0TtzpUNOrDcZ4+p7+FRKMavgrgq0sHZ0SYQU+9u30fAkvCH
         1FMz4D+z2UDjz0h7N/2GqkthHC/Ojt31J6p5LGiqcTL9Uz/KCa/Mw4DRhCVEvd4ymAiL
         WxY4cAciGGQQLeQ2EhIrBt6x0+aEZtGqsvsH1AyiEjoc8JjMws+qF11EgN8FSwcGEHYj
         YiXA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/Pz+x34K8HGaI9hjHrfPRbE3KkyZ33yh3b16PaMMak/xOXsScF4LesLrbgkHlZuOkNqqmYTq7W2o56fjr@vger.kernel.org
X-Gm-Message-State: AOJu0YxYMmVVIxnn8vgm6gwU1sUCrIM5Nx4Y56XKx/2cnJMA3wtxPoR8
	SqFBljsYnOt0Gp7zsYDmVC4rmDQ1GZgPzSutrJ6QOInbYkFWfKCYpqTPOPT6JT8lz2WOPG0+SuY
	Aq1qQ5GFqh9GNL8I7zf5NWFDvX/t+ceC3geelSf8HmOnukpl5Hh2bI8MQxD4PGjzf5k/n
X-Gm-Gg: AR+sD13bwCDUAirrtvEmv8WK/UHFh1WyVDgCKHbj2RAbnPg1HMbhGl3PBoDNa1OGPgU
	wjHGJxtWDHtzJu1lVX5x04um0EnW/E34g955m3onmGN77XFAd7FDzoOHCaDVtWA6FwMKFkuzDob
	ERCnIq3/7+Thd9/oxVLp2u+2yGFg7tVvVz7brcb5h3Q8XoKHvS6TvF1Hx0ot0zRSwbIbsvvwJlA
	yKhC2CTEBxwzZ9JcrtDvhImlYSxFRuAEzkW2rs84nx4oEBLcYNMfxQgndMTd9kZ/6qYy15Y2Bso
	rox0SJjvIuYp4ek9eUNodmvQhN2xX2hb97zyqe4GNxE4bvr8NEuYxVnqLxWlDeLc7XT8eO8HwNz
	u/mFBvvXa1Y9AUoC0h97fM6hqhaOlC/gTNg==
X-Received: by 2002:a17:902:c40d:b0:2c9:9a19:df with SMTP id d9443c01a7336-2d0ca945b59mr57634445ad.18.1785926540742;
        Wed, 05 Aug 2026 03:42:20 -0700 (PDT)
X-Received: by 2002:a17:902:c40d:b0:2c9:9a19:df with SMTP id d9443c01a7336-2d0ca945b59mr57633895ad.18.1785926540258;
        Wed, 05 Aug 2026 03:42:20 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa49295asm16131265ad.45.2026.08.05.03.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 03:42:19 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 16:12:09 +0530
Subject: [PATCH 1/2] spi: qcom-geni: Add shutdown callback to quiesce
 hardware on reboot
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-add-shutdown-and-panic-notifier-for-spi-v1-1-b5db170d491e@oss.qualcomm.com>
References: <20260805-add-shutdown-and-panic-notifier-for-spi-v1-0-b5db170d491e@oss.qualcomm.com>
In-Reply-To: <20260805-add-shutdown-and-panic-notifier-for-spi-v1-0-b5db170d491e@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Mark Brown <broonie@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        chandana.chiluveru@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785926533; l=1573;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=dFfg+yi5CHzTc26iZLvWQGYdkQ4fnddTpoVHGJmMkSU=;
 b=P0JkUmCgFiPv0m0PIjW3qVnD9/mUzpCmI70Zwgyrlt1/H/OeUujq4Gvcw9BScJ5qt/L+UBQ5i
 /1IwJSnT6aHBvNkXlnTkjObGEoq7pKLOJ0O2aocj08EUFHFFDcdV8ap
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=NInlPU6g c=1 sm=1 tr=0 ts=6a73138d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Bb2fkNEn-BfLECvCvWMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: Q_J_2r1Dbo0VYxL4PzuTfrDaQtSw1IVt
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA4NSBTYWx0ZWRfX1Iy5hPDxWlws
 b5WkGwhcp/Ljl6NkmmwOabLsa1QlfADNi62U6qdYnlxr9P9BJVIgThJU1ArKO4WKTtDm+vlT7b7
 FaFKnQfxkZyEG+AvyiR3+3SCgETpBqI=
X-Proofpoint-ORIG-GUID: Q_J_2r1Dbo0VYxL4PzuTfrDaQtSw1IVt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA4NSBTYWx0ZWRfX5IFBUHnoo40f
 V3hQx82MNEnA49irKSzS/F+hzqhWs9Rny6A3L3R+JjLKsfUmJEOwJGTLt6kuU7HJHnx2OC7WYLP
 OgOI9s0Li0vdLw/0Ip9yTmYs8tb5tziU1vk3N4oA+unKUp/dc5c1khFIzposK0UttMuGjTy87s4
 aFRdho7hbhLfUNCXta4+4vxVeHniaG1d5R7nH3CFqly0A82dcUS9z/bid6mB1td3dgCBZW3FyuV
 Zk4lK5n2CpxwB4XzKE2M8RqYCQROzSeC3g6Q6A5UjTkG2zhutlf+FP+o05EauHQXCwOTR5cxAiq
 ZIwXaG0L7ydW/q4SEZPz0U5B46alKlz686H9vOufmiEvpGUyoZXUyjnpyuWPeGBoxGmLgKIiB+f
 XQWPLQJx+iD33eAEjUU/Qu+Xb9Z6+1/8gF8ovlzWgqr82GRZU+zfmWUtKuC1g9Jp53pHz8hUGbf
 X0eVkzyvNDUqfxsOG8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050085

During system reboot, an active SPI transfer can leave the GENI Serial
Engine in an indeterminate state. On VM-based platforms, if a DMA
transfer is in progress when the VM is shut down, the SMMU can raise
context faults as the DMA engine continues to access IOVAs that have
already been invalidated during VM teardown.

Add a shutdown callback to suspend the SPI controller and abort any
in-progress transfer, ensuring the DMA engine is idle and all IOVA
mappings are retired before the system resets.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 6566975eb24f..39d67f19244c 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -1066,6 +1066,13 @@ static int spi_geni_target_abort(struct spi_controller *spi)
 	return 0;
 }
 
+static void spi_geni_shutdown(struct platform_device *pdev)
+{
+	struct spi_controller *spi = platform_get_drvdata(pdev);
+
+	spi_controller_suspend(spi);
+}
+
 static int spi_geni_probe(struct platform_device *pdev)
 {
 	int ret, irq;
@@ -1242,7 +1249,8 @@ static const struct of_device_id spi_geni_dt_match[] = {
 MODULE_DEVICE_TABLE(of, spi_geni_dt_match);
 
 static struct platform_driver spi_geni_driver = {
-	.probe  = spi_geni_probe,
+	.probe    = spi_geni_probe,
+	.shutdown = spi_geni_shutdown,
 	.driver = {
 		.name = "geni_spi",
 		.pm = &spi_geni_pm_ops,

-- 
2.34.1

