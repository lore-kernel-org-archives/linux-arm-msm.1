Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C9F1FD4
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750773; cv=none; b=GhHqVFvF6toRKcaSiivEh6aLzcEMcHkQ2tpbnd/7Czl4+W6pPXwUOjeHxaJjWJJt8lp7ruhdDNzw770FNLSiHTlWQLQKm51OYIBL/eExleiOC4eYkthAiUip6jBgZqXlZENtnVy2sJrk8lPNa9g+xFTTM9LjmMM7t8Lp2ZAGZuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750773; c=relaxed/simple;
	bh=TPMCLTDubnlYeSj2OYg28HGBF4sYYUCTAMZ6mmfr1Y4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mYKHtyqopDLKQZE5VSCSEiwEMln2pta/aBQ/I+Ub0ZBnciJs4qLPc8dp42NJAhr62NUtBKroGu75Jhoxw2f3X8y7p5VhOVJt1HgVcSkItrQEzFijglTaPExxFkqE+7IsHKU16Ap2H1XhZA8LLZ+9O6bz+b5aTUQEkOZkaNY+MKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UzSeb6wk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NS9dgbQW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UzSeb6wk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NS9dgbQW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCBsam3898958
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/1NtfMNjXT0T5Ju/tm8MIwOoIu61gHB1srsVawFDusc=; b=UzSeb6wkv3B55J0E
	WQTlbIerm2ahsEtxtU2MXsOxcC09NyyqHC1vIBeWZRhT/GWVvdt2e3u5efj1Zw+y
	Y8Ce9bLhwOEoLhnJ++SPkbcNgIOso+7wKZ3C2oizFNzZq85PvMNzwfjk7ADNvVUL
	8hDZ+RS//lNA7hNRwGqo1AOE0mzY7nkAnDlf9HanbEIjNhm0cE7JoSQEWepP0f9T
	5CcnIC07dCcNgpvRZSub+ZAG7FJlUr7An5UFR7sVhwjQEitWF0Sd/dQW0tpjYd5h
	E1+dBoLlx1ZARDJmjTEWDcUT5bvOeuNKX8iHEZXojIx8CkA5aKZXHOBEZCiOo9St
	lHXHlw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uthsawc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:26:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso1390635a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 06:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787750768; x=1788355568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/1NtfMNjXT0T5Ju/tm8MIwOoIu61gHB1srsVawFDusc=;
        b=NS9dgbQWQUlXBPUkWP4Da3TOV6bV3ijxQGeUVaK7He6NX0Wxj8n3Rx9cSXDz/iCCeg
         z4Oznqfc+iLHziUp2UgDHIudq1RyhbEyVOmjDuR4tZgtUNAZ1exFtKzCyEMAXoEmxSu9
         217Kvu8xpUhaQOpIRm/wnrS3yjPNlp4kjmnAqtkJlKDTwrxFCx58apvrKASUQVXsUh1f
         1x9+2Co5uLio/0hoKBxGE5awUwHI2eFbcfcjXEhACozZKeTKs/w+mhOtpgeDHjy9qhke
         L5HzR3EqZbPEQ2gePWvOe9Vjt3IXVBgrPQOQ/A+aJqgEiq6AzrXb2sJ7T5E6P/XQftsp
         NvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750768; x=1788355568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/1NtfMNjXT0T5Ju/tm8MIwOoIu61gHB1srsVawFDusc=;
        b=ZwiWiMuXquVBt9ODjPbk0RYGSaxdF9WRo/inP6wU0tpCi0E4SjIQyn7Mx83Flq82C9
         R879RjIB7TpePSGFgAvJHg+HDmevlS0P++vO3FGSTmZb8y6hfLBfdtNU0bxe7d9e2C98
         8c3X0imxfTgejrZLVwO962NUgFr+kiJz5iG79U+GicvdRZ5gvCY4bMtbj2B/dvub8j/x
         O1GSNQGTdqr40xfHAAc6l+LxMsZyabAQqkz24IhVhDEK6MuVPVb38gLnr38lYEsT8wl5
         8ykAdJiZG9Jmwcs130MGyDklqvHzT58sxuAJ6y41sRZVnKs0sqNysWLiBP7xRMi6qWiM
         CM1A==
X-Gm-Message-State: AFuF++n17XpD7kZYUScDUVqQn/q/6mHExNgwXclUwWObafYxu9X6zrOx
	al1q578VRLRsir4vKYQUCSwdU48GzQOXyUI0x0O49ppoL1Z0Q1jCqUJ8typdSWuXOFKJ/t7Hani
	1KD7BzdNdKhSzga3S9P+JK0GvdtupIW/w6FL6qrNkLrwJXHUvB7e6xSOw58dvlq6gdbAgMBpuyE
	jf
X-Gm-Gg: AR+sD13l4vQWOvkizvh1NKGU+2is6k8ndzUis94uJCQTcqBnRoSmtLiojEJddRCDgXY
	ct2Tdjmg/dvdBEdmXWw4SzluvQN/n2dRZVOKSV7WMM9PyMS2sfcv979wcID80rxS3C4QkNxnT7C
	T4xJueoHznqSDpRR9cVmM4boNdttcgpOu/ozBAgJqGT1xjCV+QCcha/tc+anJBmqP5xnbdm4IWL
	Hkldj9x63XQzfWqu+OoKlhFrXiGOlmOpV2jXXSXWMBl/xt5ajkRtcYS8T8igXh9AKW2GUk/bGiN
	t1Vsm25m3OcpnK/6buvb0//rzvXi+iYZqNZXMnP6HnpanxeCSnzwp/VQS5Y2YDXS8FRydQErmRg
	/t25nRThk7zwgAKlrybQAOMsph+h83SNzyw==
X-Received: by 2002:a17:90b:4e88:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-3966d4488cbmr15782754a91.11.1787750768217;
        Wed, 26 Aug 2026 06:26:08 -0700 (PDT)
X-Received: by 2002:a17:90b:4e88:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-3966d4488cbmr15782610a91.11.1787750767715;
        Wed, 26 Aug 2026 06:26:07 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668767d65sm4581108a91.8.2026.08.26.06.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:26:07 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 18:55:49 +0530
Subject: [PATCH v4 1/3] misc: fastrpc: iterate CB nodes manually instead of
 of_platform_populate
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-dup-sessions-v4-1-35555d2bfed4@oss.qualcomm.com>
References: <20260826-dup-sessions-v4-0-35555d2bfed4@oss.qualcomm.com>
In-Reply-To: <20260826-dup-sessions-v4-0-35555d2bfed4@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787750757; l=5256;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=TPMCLTDubnlYeSj2OYg28HGBF4sYYUCTAMZ6mmfr1Y4=;
 b=rtf85DxaxIVXlZxJuVEjZMk7uqHRFjgWoi5Nd9/cmK0eGzZEnd6X/m13pe49ZFB6VAVYjN5gH
 yW2lGXF1ZscDy8DRUywyUzty+CMOmcllSM/7EsFo6G2Y3fYW1C3mQJo
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a8ee971 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=0tPlnvf1ouYV9MwHMgkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: u0ZGe6UyguT9Azy6uq82RsIAsrZ0lz5e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMSBTYWx0ZWRfXw1LZrQl91tp/
 p66nIAb4YtTkejCZfCNosmoma85O+fIQSo/uVzRK4n+E8sHE+jLD4Wi4wlX6VtYKLXF/pDy0zNN
 nZrpW3gnz2D17Qw65RZikoLXVec1dGGoEaec9O9rQme0S//tYvcIPO/QO/FdEhL4NknQFVZjVUM
 XFP/R5XR4fv3fuckE1+AtQ+6ZOLEhqeBl+zE6VXsuFCWMvWAh5b0TusinO2xMazXS7waWvY32Hq
 4f0+C664EEuq7EqpH+ihaip/xKkLZSH9HKwWDJcHd6kiPLXDRgIlCt9Fx9LNpD226lFiITc9Qrt
 5ACxduoPS/qGh/sN4sF4N62hirmgvHGxn0/WHssr8G85aqcYmn0HjUBvLZldBeCnYBkZpl6L+9r
 VKciN0uBCZDAjFqPaxOcLfpQw3KjmUlAgTlDG55O+J7HhvVHvjstkQvA/Hlli+lzliwA1OZ5kpy
 g/kmbKx6ZrupIFsDPeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMSBTYWx0ZWRfX41CQ7dpGiYG4
 LEnaKVcGb91sI/KKr9f70dtu31Ko/r4ksgNZHxN0Wm7rAIjjkUjQ8oKJtU1J1g8QNd/reUOiCzh
 XDrfOagDQWDHLGDMFoBqfwR20XmjpMU=
X-Proofpoint-GUID: u0ZGe6UyguT9Azy6uq82RsIAsrZ0lz5e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260111

of_platform_populate() only guarantees that child devices are registered,
not that their probes have completed before it returns. This creates a
window where fastrpc_cb_init() may not have run for all context bank
nodes, leaving the channel context partially initialised.

Iterate over the child device tree nodes directly, initialising each
qcom,fastrpc-compute-cb device synchronously. This ensures all context
banks are fully initialised before fastrpc_rpmsg_probe() returns. Since
fastrpc_cb_driver is no longer needed as an independent platform driver,
remove it along with its match table and remove callback. Set
OF_POPULATED_BUS on the rpmsg node so that of_platform_depopulate()
correctly removes the manually created CB devices on teardown.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 83 ++++++++++++++++++--------------------------------
 1 file changed, 29 insertions(+), 54 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d4fac2caca86..a153107d0085 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2363,7 +2363,7 @@ static const struct file_operations fastrpc_fops = {
 	.compat_ioctl = fastrpc_device_ioctl,
 };
 
-static int fastrpc_cb_probe(struct platform_device *pdev)
+static int fastrpc_cb_init(struct platform_device *pdev)
 {
 	struct fastrpc_channel_ctx *cctx;
 	struct fastrpc_session_ctx *sess;
@@ -2385,7 +2385,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	spin_lock_irqsave(&cctx->lock, flags);
 	if (cctx->sesscount >= FASTRPC_MAX_SESSIONS) {
 		spin_unlock_irqrestore(&cctx->lock, flags);
-		dev_err(&pdev->dev, "too many sessions\n");
+		dev_err(dev, "too many sessions\n");
 		return -ENOSPC;
 	}
 	dma_bits = cctx->soc_data->dma_addr_bits_default;
@@ -2419,38 +2419,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void fastrpc_cb_remove(struct platform_device *pdev)
-{
-	struct fastrpc_channel_ctx *cctx = dev_get_drvdata(pdev->dev.parent);
-	struct fastrpc_session_ctx *sess = dev_get_drvdata(&pdev->dev);
-	unsigned long flags;
-	int i;
-
-	spin_lock_irqsave(&cctx->lock, flags);
-	for (i = 0; i < FASTRPC_MAX_SESSIONS; i++) {
-		if (cctx->session[i].sid == sess->sid) {
-			cctx->session[i].valid = false;
-			cctx->sesscount--;
-		}
-	}
-	spin_unlock_irqrestore(&cctx->lock, flags);
-}
-
-static const struct of_device_id fastrpc_match_table[] = {
-	{ .compatible = "qcom,fastrpc-compute-cb" },
-	{ }
-};
-
-static struct platform_driver fastrpc_cb_driver = {
-	.probe = fastrpc_cb_probe,
-	.remove = fastrpc_cb_remove,
-	.driver = {
-		.name = "qcom,fastrpc-cb",
-		.of_match_table = fastrpc_match_table,
-		.suppress_bind_attrs = true,
-	},
-};
-
 static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ctx *cctx,
 				   bool is_secured, const char *domain)
 {
@@ -2642,12 +2610,29 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	data->rpdev = rpdev;
 	dev_set_drvdata(&rpdev->dev, data);
 
-	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
-	if (err)
-		goto err_deregister_fdev;
+	of_node_set_flag(rdev->of_node, OF_POPULATED_BUS);
+
+	for_each_available_child_of_node_scoped(rdev->of_node, np) {
+		struct platform_device *pdev;
+
+		if (!of_device_is_compatible(np, "qcom,fastrpc-compute-cb"))
+			continue;
+
+		pdev = of_platform_device_create(np, NULL, rdev);
+		if (!pdev) {
+			err = -EINVAL;
+			goto err_depopulate;
+		}
+
+		err = fastrpc_cb_init(pdev);
+		if (err)
+			goto err_depopulate;
+	}
 
 	return 0;
 
+err_depopulate:
+	of_platform_depopulate(rdev);
 err_deregister_fdev:
 	if (data->fdevice)
 		misc_deregister(&data->fdevice->miscdev);
@@ -2677,6 +2662,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	struct fastrpc_buf *buf, *b;
 	struct fastrpc_user *user;
 	unsigned long flags;
+	int i;
 
 	/* No invocations past this point */
 	spin_lock_irqsave(&cctx->lock, flags);
@@ -2697,6 +2683,11 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	if (cctx->remote_heap)
 		fastrpc_buf_free(cctx->remote_heap);
 
+	spin_lock_irqsave(&cctx->lock, flags);
+	for (i = 0; i < FASTRPC_MAX_SESSIONS; i++)
+		cctx->session[i].valid = false;
+	spin_unlock_irqrestore(&cctx->lock, flags);
+
 	of_platform_depopulate(&rpdev->dev);
 
 	fastrpc_channel_ctx_put(cctx);
@@ -2786,28 +2777,12 @@ static struct rpmsg_driver fastrpc_driver = {
 
 static int fastrpc_init(void)
 {
-	int ret;
-
-	ret = platform_driver_register(&fastrpc_cb_driver);
-	if (ret < 0) {
-		pr_err("fastrpc: failed to register cb driver\n");
-		return ret;
-	}
-
-	ret = register_rpmsg_driver(&fastrpc_driver);
-	if (ret < 0) {
-		pr_err("fastrpc: failed to register rpmsg driver\n");
-		platform_driver_unregister(&fastrpc_cb_driver);
-		return ret;
-	}
-
-	return 0;
+	return register_rpmsg_driver(&fastrpc_driver);
 }
 module_init(fastrpc_init);
 
 static void fastrpc_exit(void)
 {
-	platform_driver_unregister(&fastrpc_cb_driver);
 	unregister_rpmsg_driver(&fastrpc_driver);
 }
 module_exit(fastrpc_exit);

-- 
2.34.1

