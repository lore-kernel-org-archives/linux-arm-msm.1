Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15414078D9
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 10:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787568569; cv=none; b=KSWBY2VnFrSuI3hWObv0K77jbZNxzi9nOnzx2YdmajUi8dI/Oq8Fes/PewfkfiebfYXFxRDWEjWK6tifOe6veLqcdRZNNRKTzxBSPcT3oFYvszQzV3ZFBDcnrkg/5cxVv4N4YZkNkuMzv/O9uZyHlh/aVgR7IAuaDc8rX3F92wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787568569; c=relaxed/simple;
	bh=hmRfD5hv2hilDC52QM6CRPaznt6Vo0mIHRScEu9qbZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B3ZebflctcSHfMUhtnov7gv8stMhLXh8sHRuBlMrarsix0uEfFKZes6n07omi1Bnuggux8h5gwr1/otNta9ThmE7wFREUOiImNd7IEzG7Ir1dU+wwph2nMWEHdCZ0Iv2pMcfHw4hwLE8wPpNc97r4nWpwxpU7EHlL35awL2mUxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jO5SiWJS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDuSJ9m1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jO5SiWJS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDuSJ9m1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O992fE2448615
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 10:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CypDPS5i+7FSZgzBsU0HBDl5Ax6l8lVjcrNheaMq+rw=; b=jO5SiWJSeSxfrPxw
	5K31x3BpHJAEaSvodqZtxqIqjb5MFtqtuW7VX9cCnGNnmKh22oJtncaZ84nLbA7P
	U8vViu1GyyjvdmgWCoSvZuzIWLX6XrBixvBXJQTU2eRsYlzaj6s4w/+K5KwoYlFn
	crYS83URoRdUpzViHHgG83ite8U7HYDwAvrqDRG1emNf2mfD+YV9C3tMhe3uWuo7
	vPnbzjZAe2seXqa1OGKpAXLttcy9PyZ79HlfqJaBrYu9W2xVgkvX8C+bLuM46sVZ
	isdJlUA2q3nRigMfr0NLS/lJ1/vnTfsnJXsGiaWyTDvY3hEC7J5Qaq83SDso+F57
	SZWt7A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8j7r0ps7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 10:49:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbedbd182f5so2513318a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 03:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787568566; x=1788173366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CypDPS5i+7FSZgzBsU0HBDl5Ax6l8lVjcrNheaMq+rw=;
        b=dDuSJ9m1l3lfX4fRFA7pHGHZh/HXf+FTGRPYa4lxanqlffVvcOojILndh0DATizWsM
         IUOqRdoTOWqVAOZQPYaRzfHX6dBRYBlPh7RN2eKCl0+rqw2Nwt6tSzCYje2hTLGPgrtg
         0B+7FHMEVnOLXiLGDIHKMQEvzHzy1SlvO844UCfIwY8ED0UlSczV4hg8fkxkPw88Fnq2
         XmsJMchi4fMgVi+cwPx5AMwxsv0M29EY66XVEuynb2ls01Ld6k0fSejr8JxFfHbC8C5i
         6RfnSPDZ4qp/RdDitSXAMhfhLwiEUt6JqSHF3DzwIz86Xftupym1El58BBpisqBdoMUS
         DNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787568566; x=1788173366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CypDPS5i+7FSZgzBsU0HBDl5Ax6l8lVjcrNheaMq+rw=;
        b=f2jcZzo0xztFPrvyEi5A7TcpOncPeRNAdLj4EzljJQkFEvK/IGvLDJK/icEicuJJR1
         2UnvGvLdTqvOTbS8pH/Wd5MqWKZzfSW66Zg8nC6waa0pjKmsIFBO1LaI6QLMofjZN6bw
         9amVu1JD+8rmFwQZVMR2z7FIi7hguQeH6ETPO3HZ8IAM7uZCXsccfWhc5tu7XqYv3C5b
         +xRP/EQ7lZtq+6bLiZoQaDVkCWsxj4lT+n0Egm6eIkRAhXThLCMXNwpSz1mOOaASmhRI
         /MCmMKH7ajBBDghm7F74isQL9XuWLCX6/LKJXxLu0iV5TJ4O0DrttLSoDq5u/C5Xt88z
         cwmw==
X-Gm-Message-State: AFuF++nt4ygfQTQNO438m1TiNsB/Mw+bgUcutQ6i4cae3vBKrsBeML/Z
	Qdy+wdvzIgef6ROpj6dFOnrXrmB4NIAgN7Ibs3FQejsGbnfgpIUVUhE2cv0uAbJsehxcpsZFJCB
	GW18Fd7eoTSYGOenLlbzlgN5N5mrWBBkeKgggUfEj718pGS0nd1BINbaP4QKsS8uf2XIY
X-Gm-Gg: AR+sD11przQ6sMURD0N90ttive9h1x0sIv24NVpPEZvwUDIA9Hq6FsjM0LERwiVba3t
	7ipGJvaOr4j6hm3z+TxJSJKkdjGdkzrN2niXHyXRzTisemjsbMPe4zAaPdbQwDP5Nh/jZDpPjRZ
	NtDL84wW7DIiO4JrLjAcrCdVbJklrEBJlLm5Azf10B7gg0NNPHbyv/g8xOD0LK/2yTNsyWS+CXY
	WjxDgAFxLX8VJjMUiZjaMF7Iv4ruYGgvXK+xkQTlri0rq7Gldeo9B/107ChWaZigNmeGBGMcG9+
	DI17S8028naXNKqrIqkYnV9qh/bwyu1MhQjqj2F94ssEyp1kORbW+2pJGR4QeNp+xePlt9Lflxt
	bQa7406KkB7kk7/9kcNc+8WVQuI6veSQqIw==
X-Received: by 2002:a17:90b:3e8d:b0:38e:9ca8:e99 with SMTP id 98e67ed59e1d1-395c4fa444bmr15906928a91.5.1787568565654;
        Mon, 24 Aug 2026 03:49:25 -0700 (PDT)
X-Received: by 2002:a17:90b:3e8d:b0:38e:9ca8:e99 with SMTP id 98e67ed59e1d1-395c4fa444bmr15906880a91.5.1787568565184;
        Mon, 24 Aug 2026 03:49:25 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c91ce453sm4125829a91.4.2026.08.24.03.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 03:49:24 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 16:19:05 +0530
Subject: [PATCH v3 1/3] misc: fastrpc: iterate CB nodes manually instead of
 of_platform_populate
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-dup-sessions-v3-1-4b019def4e0b@oss.qualcomm.com>
References: <20260824-dup-sessions-v3-0-4b019def4e0b@oss.qualcomm.com>
In-Reply-To: <20260824-dup-sessions-v3-0-4b019def4e0b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787568554; l=5195;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=hmRfD5hv2hilDC52QM6CRPaznt6Vo0mIHRScEu9qbZ0=;
 b=WiLB15isE1CXfEtAmICuz+9YH7t6oI0RHaX/M/hHzzWWE+okxkiNABiQCDn8U8ROqDR4phd4k
 3nnCU8IPFTfBEDIFeXqV4KR0mCGcV4G22actsREthxJEAkBiyB2ueca
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5MCBTYWx0ZWRfX69DHQ0Rj0q4w
 H0nZSHMyvGa6Y9V7sxPlV+ZDdZwP5UyYr2V08LC2BgOHndJDgDA20dB/emlgkJlgE12Z3oxziBk
 vK1X/P7fzBNQUd5dXWdRP48qOYteEDgTqvmZtPLTEvknu52WU9ZxA+ps8ebtWHAiDrRWe4bigau
 17yAdYA/W09PY9EaP69RJQHRAsd5meYdgT2Q8azJSCT6IOa6CkDM4H3QARg+1eYToO0D2ZAGhda
 0J09rbAi8RmszfNaWPKg+FJ4XO4itE4irVvEySi0lpJCISCP/anO4nECZI/y68yfPXFxkTkPYHD
 2iTE4ur8dqhrXmolVjy/4tctmH0BGeqrTuOtKgrJ1Uhn2Iz+sbDtEiKPxZbdTE+yG/k4wv3YLai
 yLKGj3GVIgzKNJcjta4xpffhPfod4GCDogpf6Q4pMRSuyKsxntu8ej+wVSXrYN1eZxJckDOKVS+
 S5DCmOmf9U1YIZm8ZgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5MCBTYWx0ZWRfXwnfLc+js708R
 fxyD+Q1LjSIRb+rbI40I6KWRuDAmqPwvAHXZ2IMG0Y19pQ5Gk18QIxXZ3IRMPZbcWEUl+Sw4quY
 TIJbRKtvldRfgt+8ZQcAkvs9NIsUc0Y=
X-Proofpoint-GUID: KqV1kOuheej_i_dAM44itslpsomF8gGm
X-Authority-Analysis: v=2.4 cv=IL8yzAvG c=1 sm=1 tr=0 ts=6a8c21b6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=0tPlnvf1ouYV9MwHMgkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: KqV1kOuheej_i_dAM44itslpsomF8gGm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240090

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
 drivers/misc/fastrpc.c | 82 ++++++++++++++++++--------------------------------
 1 file changed, 29 insertions(+), 53 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 1080f9acf70a..fe127bb0c115 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2190,7 +2190,7 @@ static const struct file_operations fastrpc_fops = {
 	.compat_ioctl = fastrpc_device_ioctl,
 };
 
-static int fastrpc_cb_probe(struct platform_device *pdev)
+static int fastrpc_cb_init(struct platform_device *pdev)
 {
 	struct fastrpc_channel_ctx *cctx;
 	struct fastrpc_session_ctx *sess;
@@ -2208,7 +2208,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 
 	spin_lock_irqsave(&cctx->lock, flags);
 	if (cctx->sesscount >= FASTRPC_MAX_SESSIONS) {
-		dev_err(&pdev->dev, "too many sessions\n");
+		dev_err(dev, "too many sessions\n");
 		spin_unlock_irqrestore(&cctx->lock, flags);
 		return -ENOSPC;
 	}
@@ -2245,37 +2245,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
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
-	{ .compatible = "qcom,fastrpc-compute-cb", },
-	{}
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
 
 static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ctx *cctx,
 				   bool is_secured, const char *domain)
@@ -2441,12 +2410,29 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	data->domain_id = domain_id;
 	data->rpdev = rpdev;
 
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
@@ -2476,6 +2462,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	struct fastrpc_buf *buf, *b;
 	struct fastrpc_user *user;
 	unsigned long flags;
+	int i;
 
 	/* No invocations past this point */
 	spin_lock_irqsave(&cctx->lock, flags);
@@ -2496,6 +2483,11 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	if (cctx->remote_heap)
 		fastrpc_buf_free(cctx->remote_heap);
 
+	spin_lock_irqsave(&cctx->lock, flags);
+	for (i = 0; i < FASTRPC_MAX_SESSIONS; i++)
+		cctx->session[i].valid = false;
+	spin_unlock_irqrestore(&cctx->lock, flags);
+
 	of_platform_depopulate(&rpdev->dev);
 
 	fastrpc_channel_ctx_put(cctx);
@@ -2556,28 +2548,12 @@ static struct rpmsg_driver fastrpc_driver = {
 
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

