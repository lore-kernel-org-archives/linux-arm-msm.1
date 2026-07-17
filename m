Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB023E51D2
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277419; cv=none; b=g55v93IIlvIWIVO1/m22o4ehu7xdMgm/k1S+K8eTNddUs3xaDMKC4xz9t9PFjS2nLsiKrU5zazuvbIzDFUd3Eax3MOLTQXU43dFVusuzcTkEvrphPm7+AfmUO6YommO8Dx34frgbiU9aRt20YgHC7UKspj3l53BTXvwEYbMUR9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277419; c=relaxed/simple;
	bh=4nbFs/xg8cCMPYrFtHWE96AOtkhXxC7yUgPXEapSLFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=alsVT/EjSwLrwjzzzfJIA0htccFC1g1VO1mObqn8U4eJ9980xwUWKoJ1QWCOLgEcRSH3/2/kqVA5hlrSsZsq5Pc7Kk67UIbD1eE9W9rVOcm9TeeDCo5DGdDdUUIeko//YbI5tW79I1ManojYcvCTJpz+f0Q2HMpFJroIbbCxCq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jar3QkZ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ESen5vjU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jar3QkZ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ESen5vjU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6d22O821098
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=; b=Jar3QkZ642Thg/ni
	2NYxT2TzIA++eGcOPp3LWns2k7/oz4CmfgDt/xTWYV5FPjuUD8/d4vxyJDvthc4M
	gbDo0BzPqMLeDnN6QirxE/2xa2obVBhu6RyRcyC/r1JZjCez2O2Z5MgwB3JaM5hw
	kMWQoZpNIa9M0JjBAj6LY3fyz2oMrylTQRmZloKSdenEldcn2yzOWNN7V3a3GpYD
	KpD7ONIkQOLEDdQjSEJuFnxhEskmcJYkprLfzf/SCLgivtF2aXprvQn884ubZplk
	ibT+P16I5hkm5Z3SgacXNswXr/WaLIldbKxZUdyjEfSd0sdZAyxYWiksn0Ij/DLK
	nG8wkw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fffag8dbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:36:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21c01cf3so91767571cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 01:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277416; x=1784882216; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=;
        b=ESen5vjUUswAEKEGpsnymlJs3fGlQSQRsZgg7dgjXCKpuVAzaehuncahY1+JMJY02Q
         DDX++Cyj+shtBFF9svvfEkPeEZLCeba+2b8cnZFXKT7uo9f45t5/WcwCH/UZNbZOyFyd
         y+uD2KZQ5K1GSu1KBGNiGej5yVTUqy0nrx4RxRadLBGawU/+Z9a6CXh2NUInIbdrp5NL
         u/wR+gusoP29KSmlAh+5DDJzaT9CdbLDYY0lMIiEAsZqdxlehQMkjdH/jEbB4Ii7d2Ft
         CZIX92fqOA8QzUy26CYHzufVa6kW5WPWgg0S6SFYhUPhurigbDtUs85hZtFB2b3a4JvN
         AjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277416; x=1784882216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=;
        b=ZaXQpWS/6HPKULbAa1BQT7Ex2H21NcUe+Sb/qO4tFjx/kIkLP3u1YmmnRGLLm4nL1/
         yjvCtu4n6JjsCgmmde1lzxYql4mwxQkVYlHWEuvZjYq9UX2LeDBWXU0KjZpzzSzptES5
         LifRigyO6oyRTjGvLdtjQCXRKUavSc6OiKq5+RLz0nYCCUQmpVcPzgmFsj9jcyF9hUeg
         U3aIeam8SojS7C9NpDoSIsIGi3OrCwJtQ2KrnnxOoq6UdpOseh8QVfe+cinHdNGr4xVG
         RmF5OdDhQ/esg3AYiXfHfTSxrcwWjX4z7KKilcREA1C+Q85bLuvjgxmbMqvxO9wA6w+O
         xWUA==
X-Forwarded-Encrypted: i=1; AHgh+RplYiCw7xH5skHCTeuUd88wJYAPPJLLE61AG3GX+nCDB0V1KogO0UEKiKZhx/CLS4I1J+xGazYdLxGq4nno@vger.kernel.org
X-Gm-Message-State: AOJu0YwS8RzJSJWsBb1zegn1cNUIBNGET/yFJPBFxJni6522hqf3gS4U
	cDPS8b+CYwGPFto6C3UINKe+JQlJpoBTngX3Qx8MrwZqYL8IGdbGOBK3a6icDuEp6pSkco2eWuy
	DKGaAt6aqkcQVBoDnuoegOA3wk8DD6ZqvVVUq7SDXFrsOTTRdJEOErMXUh4K7T+7jkIcI
X-Gm-Gg: AfdE7cnvhgXJ8lKc4USYb/LzR9j2Wm6Ia1X1U4Z7x/rfyssdqv6Tcne3hKaCe5rJ9jq
	GIgYudSzUf0rLhtHPspvzD6905T+75y6/sP1Jlq2UZbUTFI3cM1BaOd7gfv7wTNjUZ46qiijay/
	XhXX7P0reXhwysPYEJijfq/y29epqXM0eYDlKfaojdRK/BMdnGkwXDv/D2ANrhRP79FQ8c+AK81
	jMIr0bx3YhKVm3PUSJZkhoAZK74juRrBS3JHoBF+dnUSnK1ZNLt1C11acmhsQYKiOSKIYwWrdMg
	r5vZEUKiriE6fbzQQOlBqhk0fsXotDCYk0inXia9TpSJaOzxFP2mdbQVuJPFfhWmnIdvFeIHbEa
	ucEEX1bVBmXfbokEzLUj1zTkXdCMqLA==
X-Received: by 2002:ac8:7dca:0:b0:51c:167a:a48f with SMTP id d75a77b69052e-5213fc5832emr13493911cf.64.1784277416312;
        Fri, 17 Jul 2026 01:36:56 -0700 (PDT)
X-Received: by 2002:ac8:7dca:0:b0:51c:167a:a48f with SMTP id d75a77b69052e-5213fc5832emr13493671cf.64.1784277415952;
        Fri, 17 Jul 2026 01:36:55 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b893dsm31268205e9.8.2026.07.17.01.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:36:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:36:28 +0200
Subject: [PATCH v22 02/14] dmaengine: qcom: bam_dma: free interrupt before
 the clock in error path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qcom-qce-cmd-descr-v22-2-ff0d18b27246@oss.qualcomm.com>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
In-Reply-To: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2818;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4nbFs/xg8cCMPYrFtHWE96AOtkhXxC7yUgPXEapSLFc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWemWN2S795vbkqcG4ij9ubJGy6SuJf50F4bC0
 66Pb4j22VCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalnplgAKCRAFnS7L/zaE
 wwlZD/9W2iUVIF4KIbsenZB6fCtyq8ib4S/4/NNNBCMD2PAWlLahOYax8bse8uRXEz1ZknDBOiL
 iYjW3QFER/8p0U4ICp8muOjyORmpmsEDXiFd/yMhhIfCFR+jTBP/u3AAH7+yoqvcLKY9L/kDlyo
 wRs9iTwffQQxCN+HGOJCvJLo470e2fWfX98dW9P3GJLw76PO8KbkpYzfxcvx3ElEoluN9Z+vKLA
 ts8htozQxwhlFGVbCENUmySIcjgtMgFMMJtOO/pHd5OKQ35aAwbUMrUeTdp7TNRagDB3tbVXXWH
 A7Oo9PQ8YHO66ZAX/ARmyggobbu9YrjQTpyBAUjRG71jumBMZc+3Xp4yh+5LnXEN64gfo6wjyW8
 JJnVYc5lNNdjNKktdcWzqPyy5SscTarSXGcHlUJ+TJ96rfFWDCFRyt+we3KAOrqsI845PtBdS12
 5qnA3Jz3sADowcuWtuo5e15JNFOya2U9Isyyd3grMFJ9MGNVvTlKPrrh0pcOczeCXczEre2OEhj
 q25/4hhDlMoCbtdvM40W+na07KmOLF4TAPA8h2mTcGRuro/sEr3XbiRaJDgWDBhIQ26zVD6xZAg
 yJQYF22aJJ1qK8m04YAUjkWKcaPpO1w0PIqPyt8DpsPJL6KRtCKA7gxpO3/WABq3khr3YH6Uqal
 6jZpVQVr3Wnsb8w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfXzDjz8VWNRpDm
 4BCNfcY5ugXUnR3c/4/Db7ZvDCwoFQwkbN7xC0oSodZIEOP7AnfinjhNNdea141CVz1GZVqd9l6
 e8k9WIfPrEFIgWwoKMEP4cSJgMF4Y29stlETJNt5wnq8xQ/C/hf/s5EH8XM+I3WE2VcAdEs55Jr
 VkjQCm59L3hZqpxqgl1yzeuOtU2T2DWzu9Qb3m/8aPUBqhrLbhaYV9A90cREilF/nUwHyX61BP4
 popYvDSdlc6LHFC24LYglgwFnwzhzEhQqmnHI9Eglv5/TEK7LjSirunsECaMnuRIdeUBO/EaYdk
 g9bx67atSrlSJ7fhqzezQ3bqeEAERNn2n26n562U9aaZfZhN4sPHkkVJ5oZR+Lq2ZSkRHx+hs0x
 278Ulk1F7aUs2dQsX636sK6slvmcrdoP5gKT7CiPuI74bYz7KUyilPUzkAGtewG03H8/8SMXvwu
 zsupD2ETNy3hM/mr8+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX92MmaaW5GYd7
 dAqkeLDis7mSfA5Ks5ESNEuPTri07qaIzdlkLWtysSNlBvP/LsvgMHx+kJuHZkQvLfA8UMtO/ML
 hghD5mlmnAyLVfAwvAHYFtFW5NV2FM4=
X-Authority-Analysis: v=2.4 cv=KZfidwYD c=1 sm=1 tr=0 ts=6a59e9a9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=n8zAjjMAgf0wD31B80cA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: s6sZobTyGpNhRf-eR6nfppvPcO53jT8i
X-Proofpoint-ORIG-GUID: s6sZobTyGpNhRf-eR6nfppvPcO53jT8i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170084

The BAM interrupt is requested with a devres helper and so on error it's
freed after probe() returns. We disable the clock before freeing or
masking it so it may still fire and we may end up reading BAM registers
with clock disabled.

Stop using devres for interrupts as we free it in remove() manually
anyway. Add an appropriate label and free the interrupt before disabling
the clock in error path and in remove().

Fixes: e7c0fe2a5c84 ("dmaengine: add Qualcomm BAM dma driver")
Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc%40oss.qualcomm.com?part=2
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 1bb26af0405f3a16f97e0d4b86c945c252d97f57..fc155e0d1870cbb7e099a2c4280f9f8fbdf6cf15 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1332,8 +1332,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	for (i = 0; i < bdev->num_channels; i++)
 		bam_channel_init(bdev, &bdev->channels[i], i);
 
-	ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
-			IRQF_TRIGGER_HIGH, "bam_dma", bdev);
+	ret = request_irq(bdev->irq, bam_dma_irq, IRQF_TRIGGER_HIGH, "bam_dma", bdev);
 	if (ret)
 		goto err_bam_channel_exit;
 
@@ -1366,7 +1365,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	ret = dma_async_device_register(&bdev->common);
 	if (ret) {
 		dev_err(bdev->dev, "failed to register dma async device\n");
-		goto err_bam_channel_exit;
+		goto err_free_irq;
 	}
 
 	ret = of_dma_controller_register(pdev->dev.of_node, bam_dma_xlate,
@@ -1385,6 +1384,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 
 err_unregister_dma:
 	dma_async_device_unregister(&bdev->common);
+err_free_irq:
+	free_irq(bdev->irq, bdev);
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
 		tasklet_kill(&bdev->channels[i].vc.task);
@@ -1401,6 +1402,8 @@ static void bam_dma_remove(struct platform_device *pdev)
 	struct bam_device *bdev = platform_get_drvdata(pdev);
 	u32 i;
 
+	free_irq(bdev->irq, bdev);
+
 	pm_runtime_force_suspend(&pdev->dev);
 
 	of_dma_controller_free(pdev->dev.of_node);
@@ -1409,8 +1412,6 @@ static void bam_dma_remove(struct platform_device *pdev)
 	/* mask all interrupts for this execution environment */
 	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
 
-	devm_free_irq(bdev->dev, bdev->irq, bdev);
-
 	for (i = 0; i < bdev->num_channels; i++) {
 		bam_dma_terminate_all(&bdev->channels[i].vc.chan);
 		tasklet_kill(&bdev->channels[i].vc.task);

-- 
2.47.3

