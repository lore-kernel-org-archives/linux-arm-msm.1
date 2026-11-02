Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608292;
	b=FyfrP4moUatfmCmJt1mDzoDzhnN7GNXM57DIXEo6YyLH8duxlZ6C6tKQRsK37YBeG4lx
	 Wpb1TWW58wp8vEswypJy0xwUn3uA9U39A5lXa+DxHWl82PSgQzoMBPLnDaulXjVIXqzNd
	 J4xyAnzAgiVx9c/fLQUwWvTg+Qd1ZfnkKyxi7/d0u6hlfbDTESm7ry6x02pOtYdfbhyjv
	 iuGwl19RTZB/KVvwakWEp8VpRdoyKPNWNKJfZ0DSVl5ABwnlS0LP7IOOm+BmW9I7C10VY
	 rNjMPuoZJQvz+YoaY+58Z7UHq8xDhWddr569jZOgJfK/ifTzuH80qSs/iI3GpikzKhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608292;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uNk7UoVUCyaNPvkUt39ka4U3PEtGKbZzHSnhMCo9iP0=;
	b=b2stAVqPDcvj0L1xwjiBiAK34eD2SDDEQHR6HBud+JCmxAAhH+4bauwZbFpqBy+svZ09
	 yxYiLIylOBWN+650xPlD9zgK6b/KtYEgeMUFg71odww+HmNiv+YdsnaKsFZSCm2hzc1/9
	 lgJpOjlN03mLSTA3RXUnRElhfmTJKr1xcldXm9EN2O2xoCZ9ADeGaMI2BTZdTHGbhcNZE
	 dgnz8VabmlJifiBUM3cLhH8ulfCBTbyl40LSgihiol4SvZuOkY2OpiIjDy692M4Jhxp2c
	 B/KWPsu/0A6dbjYIAu9sCLpKrq0CqEfbmffKEsNZTCVg7a2TEqy/S4eldl8n1i2ljYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BuNTRnhH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JSFDDtVZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D855606A326
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 08:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D855606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BuNTRnhH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JSFDDtVZ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vHKD3324618
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 08:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uNk7UoVUCyaNPvkUt39ka4U3PEtGKbZzHSnhMCo9iP0=; b=BuNTRnhHCPpJt44k
	cp9W6DTyT+uE2Udvr6puPtOgVvkoupoQ35hDyGF4qK8l3CNm0gS9gBpJeCNd1C9K
	rYzSewasozAkQkcCVyJGaf5edwVr/QCqvSKmlqI10jg254oKzpYQIWS5KdwH1qrs
	R0WGCTwKGa/mO1VSQn4XKaApzDvazbiBrSKyTCzv3WaryibN8hLWSr4Zl05LVbWB
	pVlMZeQgirHbrRz4KdJXptq2he/B39pa+jUwPDeUBnLo/TkrYV1dBSZsaRVZ1Nve
	+FHKoo7XCeErpWjPYea6zoYvWeYEphKTC4Dcd7ThggIx43IdtWGaahJWadlZUHkh
	R1xhKQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6p2vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 08:31:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89e96c03cd0so2354088b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 00:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793608285; x=1794213085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uNk7UoVUCyaNPvkUt39ka4U3PEtGKbZzHSnhMCo9iP0=;
        b=JSFDDtVZpTUqVySV993gjeSDjP1z5rMJFqgVRBe+0wVfXxO8pG27G3rThfPPnypVbv
         oq+g721m5JyMTPmNmbFfv2hPbT/xcWvM5II+bFh6Mwa7+N6nnGL1SfSmhR6WJilHOCny
         o6DamF1Nu4V61J2KY80cVGhklZEIohSFVhEbJyYZzcBbWXx5VajC72bvvcSzqAn1+NtX
         ZRfvwitInKfIYkkEY3ObrjTa+7cIfphSxov9EXX8cdDHOvlS8G2+uF/Yvx0vMWh95cvX
         0+wwug6qsCWMTBaigwy7oLGA2nNEl0y92QoRch8DFWKc7D295rylvGAIJXmsEbEULuTF
         q3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793608285; x=1794213085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uNk7UoVUCyaNPvkUt39ka4U3PEtGKbZzHSnhMCo9iP0=;
        b=hqZtgYiSXXr7aYl/is1PnTp2ks3g7vGXBLYZTAQEg0SUqSGpH0yzwBxFLYz7hcUtDe
         CzuKrhlds1DubZAARl12kyR9dVitSJIJZJd0LtEObK+47dFqXnEyCtm5hvrjPIv1BVqM
         wWvVQA8mRW7r3ZYyNVmXvBoqpaC/l8ym9VvX5uHMDowbVTI5ieUTGLuAbegC+a2Py8BF
         KQrg/XgWWgVxrGV0mnmcS0D4K87HTNCP5jW9MXWgN+MNF7+yz9IEmy4/lruMRKVlKZsF
         Hl26BLCFQSeh89B3r7VtyRhK80f9gYb5MxSVQ0QrwwY0F9RMqr/gqRGShwLfb7RN2Unq
         2SJA==
X-Gm-Message-State: APuU4Z/ub2ai9uldEXBJg6jT4ucNCWRx/J2I/B2zhKpN7zLxmVmyUjWA
	UrKmoQEdbtU86dW5xevqR1DYJOceOxlJsMf8YNOBVI4iYF+Yma91RZGPDXVMnGQ35ffWychp3J1
	8eRXFuJQ8iHsCI9WypuNFihm0VRenkdwaAMsxZJN2/Sb8VTmdK4WqMbZVX0Sc0w2J5uGQ
X-Gm-Gg: AYBFou1cFQIyOrI66hdrM8DxCxE0+xxU6slBGxj+PrFn0YuPM0UrrU6eoNQmXWtzzBP
	/ZqmBl4qwUla60sl42JQfjnosfDSJN3HUdvlxTN6EAEAcH/2cZ71tvy0AUjQlPo31j3V9YpQ7Fx
	fULbnStiSavisCLDcBzyM3reRaepvBtne4VsQjV6goF2WSxRlav4vvppM0YN6GKtFMskx2UB5FS
	BiF+IZaSBly2FQkMVWYvb6reyaTxwoDmMNV5/ilYBx4QcOjYEj8zFZlQ+ZWOvpi+RwlI88fUr6C
	V4vtA4DGx0B0yFXjh4PM3cSulSJAv9ksa3hYeWLq3oaXDxKXaFkq0gr3FwKzHA7LDlTY4xp7ZkX
	2I6tZGC4oHIjPsXtbXs8Fczp8vXhRjCMtAzvq/SHPtwDu8XoWzlSlLzp/MMzS3U746/7OcpHEoR
	QIwjnIlQ==
X-Received: by 2002:a05:6a00:ab05:b0:893:12e5:c07c with SMTP id d2e1a72fcca58-8a9be965277mr7867707b3a.27.1793608284987;
        Mon, 02 Nov 2026 00:31:24 -0800 (PST)
X-Received: by 2002:a05:6a00:ab05:b0:893:12e5:c07c with SMTP id d2e1a72fcca58-8a9be965277mr7867678b3a.27.1793608284451;
        Mon, 02 Nov 2026 00:31:24 -0800 (PST)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad9d03be0sm1674680b3a.27.2026.11.02.00.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:31:23 -0800 (PST)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:01:02 +0530
Subject: [PATCH v7 1/3] misc: fastrpc: iterate CB nodes manually instead of
 of_platform_populate
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
Message-Id: <20261102-dup-sessions-v7-1-03f06c014e78@oss.qualcomm.com>
References: <20261102-dup-sessions-v7-0-03f06c014e78@oss.qualcomm.com>
In-Reply-To: <20261102-dup-sessions-v7-0-03f06c014e78@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793608273; l=7646;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=1ZCjKkuEklA9dqtgrXzcHhTQLVOklfUh4hr7qs27ZYI=;
 b=Avy1J3E49Dc36+bGc1BPg1IiqDzb4s/n4DFoCSABSKVHfa86jc0nGXFdVAD7YvROrQ+mFq6oK
 35f+phSWQktD8JK2sYAVz7jmgm2WMkPMu5K3UMvQ1qS2BFZvB+vcOVU
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-ORIG-GUID: bQZns1wgApT4ZsBCDmtkK62ntYbArtFs
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae84a5e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=uxAdCuZb9_mwF1n_fQcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: bQZns1wgApT4ZsBCDmtkK62ntYbArtFs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzMyBTYWx0ZWRfX81Z0qodmwq72
 e3XJRAFYNvG+/ACUSGuL+ML5G1MiPdckRXvY5Y1SYJ1uQcEwZOeSvT92lpQ2aRRRbiFhRQ7B2Jd
 SnuyykulnYXPVk0XQsAvWtfSOO4S8g8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzMyBTYWx0ZWRfX/Z39OGmJnXZ4
 Z7o7KTYpBJ8Tb/P3Ju+bVC822hjc9QBFd2Xx6V679AVv+o2XPJiCkSdCFhlRMqTyqleBOyjMFN/
 09+UQ5hxP8I3FPVpik7xn+nOyQotqjUcX1VsTQX1dHIGilbthIIejVVrPgsL5kuCPivMnUBPrdl
 UL6LTEfBPjD8SKSHCXzMDSDAo81Uh6JEUnHGXZaPrRARrb/zpN9rIc3C3lZS/h7YkPeSo7LTv3U
 xmYt7IhM/VHyCmCbwGl5iBiadfTGVUtqd0NcEq3x1zdtRRkfXg6SaPRvHk+KQacdRpL+Q6jXBfp
 R8ygLIfhmEo+l/USaI1j5MfyQ4RAMI2idkEJJo09v2N24XNyae0nFtVNjWvspwr9CnzQMdMaDdx
 sI+0gV/QSXfIDvcvG3vxwKLo9jKQXVpw7TmHf2X8NpW47ap1hgxe1v28DxMLmFM1RazSvV3s883
 jLoTyvePHNpjel7xEqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020033

of_platform_populate() only guarantees that child devices are registered,
not that their probes have completed before it returns. This creates a
window where fastrpc_cb_init() may not have run for all context bank
nodes, leaving the channel context partially initialised.

Introduce fastrpc_cb_devices_create() to iterate over child DT nodes
directly and call fastrpc_cb_init() synchronously for each
qcom,fastrpc-compute-cb node. This ensures all context banks are fully
initialised before fastrpc_rpmsg_probe() returns.

Since no driver binds to the CB devices any more, the driver core no
longer runs dma_configure() for them. Call of_dma_configure() for each
CB so that dma-coherent, dma-ranges and the IOMMU group are set up
before the session is used. If a CB cannot be configured (or has
"iommus" but no IOMMU group), log it, destroy that CB device and carry
on with the remaining ones, rather than leaving a half-configured
device behind for a later IOMMU registration to trip over, or failing
the whole channel probe. -EPROBE_DEFER still fails the probe so that it
is retried once the SMMU is available.

Introduce fastrpc_cb_devices_destroy() as the symmetric counterpart.
Before destroying the CB platform devices, invalidate all sessions under
the channel lock so that any fastrpc_user still holding a reference to
the channel context cannot acquire a new session backed by a destroyed
device.

Since fastrpc_cb_driver is no longer needed as an independent platform
driver, remove it along with its match table and remove callback. Use
module_rpmsg_driver() now that only a single driver registration remains.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 120 +++++++++++++++++++++++++++----------------------
 1 file changed, 66 insertions(+), 54 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index af18ff1992ee..7441e9b8940d 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/sort.h>
 #include <linux/of_platform.h>
@@ -2333,7 +2334,7 @@ static const struct file_operations fastrpc_fops = {
 	.compat_ioctl = fastrpc_device_ioctl,
 };
 
-static int fastrpc_cb_probe(struct platform_device *pdev)
+static int fastrpc_cb_init(struct platform_device *pdev)
 {
 	struct fastrpc_channel_ctx *cctx;
 	struct fastrpc_session_ctx *sess;
@@ -2355,7 +2356,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	spin_lock_irqsave(&cctx->lock, flags);
 	if (cctx->sesscount >= FASTRPC_MAX_SESSIONS) {
 		spin_unlock_irqrestore(&cctx->lock, flags);
-		dev_err(&pdev->dev, "too many sessions\n");
+		dev_err(dev, "too many sessions\n");
 		return -ENOSPC;
 	}
 	dma_bits = cctx->soc_data->dma_addr_bits_default;
@@ -2363,7 +2364,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	sess->used = false;
 	sess->valid = true;
 	sess->dev = dev;
-	dev_set_drvdata(dev, sess);
 	sess->sid = sid;
 
 	if (cctx->domain_id == CDSP_DOMAIN_ID)
@@ -2389,37 +2389,75 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void fastrpc_cb_remove(struct platform_device *pdev)
+static void fastrpc_cb_devices_destroy(struct rpmsg_device *rpdev)
 {
-	struct fastrpc_channel_ctx *cctx = dev_get_drvdata(pdev->dev.parent);
-	struct fastrpc_session_ctx *sess = dev_get_drvdata(&pdev->dev);
+	struct fastrpc_channel_ctx *cctx = dev_get_drvdata(&rpdev->dev);
+	struct device *rdev = &rpdev->dev;
 	unsigned long flags;
 	int i;
 
 	spin_lock_irqsave(&cctx->lock, flags);
-	for (i = 0; i < FASTRPC_MAX_SESSIONS; i++) {
-		if (cctx->session[i].sid == sess->sid) {
-			cctx->session[i].valid = false;
-			cctx->sesscount--;
-		}
-	}
+	for (i = 0; i < cctx->sesscount; i++)
+		cctx->session[i].valid = false;
 	spin_unlock_irqrestore(&cctx->lock, flags);
+
+	device_for_each_child_reverse(rdev, NULL, of_platform_device_destroy);
 }
 
-static const struct of_device_id fastrpc_match_table[] = {
-	{ .compatible = "qcom,fastrpc-compute-cb" },
-	{ }
-};
+static int fastrpc_cb_devices_create(struct rpmsg_device *rpdev)
+{
+	struct device *rdev = &rpdev->dev;
+	struct platform_device *pdev;
+	struct device_node *np;
+	int err;
 
-static struct platform_driver fastrpc_cb_driver = {
-	.probe = fastrpc_cb_probe,
-	.remove = fastrpc_cb_remove,
-	.driver = {
-		.name = "qcom,fastrpc-cb",
-		.of_match_table = fastrpc_match_table,
-		.suppress_bind_attrs = true,
-	},
-};
+	for_each_available_child_of_node(rdev->of_node, np) {
+		if (!of_device_is_compatible(np, "qcom,fastrpc-compute-cb"))
+			continue;
+
+		pdev = of_platform_device_create(np, NULL, rdev);
+		if (!pdev) {
+			of_node_put(np);
+			fastrpc_cb_devices_destroy(rpdev);
+			return -ENODEV;
+		}
+
+		/*
+		 * No driver binds to the CB devices, so the driver core never
+		 * runs dma_configure for them. Do it here so that dma-coherent,
+		 * dma-ranges and the IOMMU link are set up before the session
+		 * is used. A CB whose IOMMU setup failed is destroyed now,
+		 * instead of being left for the next IOMMU registration to
+		 * retry (and fail on), but does not fail the whole channel:
+		 * failing the probe makes the DSP reopen the channel in a loop.
+		 */
+		err = of_dma_configure(&pdev->dev, np, true);
+		if (!err && of_property_present(np, "iommus") &&
+		    !device_iommu_mapped(&pdev->dev))
+			err = -ENODEV;
+		if (err) {
+			if (err == -EPROBE_DEFER) {
+				of_node_put(np);
+				fastrpc_cb_devices_destroy(rpdev);
+				return err;
+			}
+
+			dev_err(rdev, "skipping %pOF: failed to configure DMA/IOMMU: %d\n",
+				np, err);
+			of_platform_device_destroy(&pdev->dev, NULL);
+			continue;
+		}
+
+		err = fastrpc_cb_init(pdev);
+		if (err) {
+			of_node_put(np);
+			fastrpc_cb_devices_destroy(rpdev);
+			return err;
+		}
+	}
+
+	return 0;
+}
 
 static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ctx *cctx,
 				   bool is_secured, const char *domain)
@@ -2639,7 +2677,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	data->rpdev = rpdev;
 	dev_set_drvdata(&rpdev->dev, data);
 
-	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
+	err = fastrpc_cb_devices_create(rpdev);
 	if (err)
 		goto err_deregister_fdev;
 
@@ -2711,7 +2749,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 				&cctx->remote_heap_addr, cctx->remote_heap_size, err);
 	}
 
-	of_platform_depopulate(&rpdev->dev);
+	fastrpc_cb_devices_destroy(rpdev);
 
 	fastrpc_channel_ctx_put(cctx);
 }
@@ -2798,33 +2836,7 @@ static struct rpmsg_driver fastrpc_driver = {
 	},
 };
 
-static int fastrpc_init(void)
-{
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
-}
-module_init(fastrpc_init);
-
-static void fastrpc_exit(void)
-{
-	platform_driver_unregister(&fastrpc_cb_driver);
-	unregister_rpmsg_driver(&fastrpc_driver);
-}
-module_exit(fastrpc_exit);
+module_rpmsg_driver(fastrpc_driver);
 
 MODULE_DESCRIPTION("Qualcomm FastRPC");
 MODULE_LICENSE("GPL v2");

-- 
2.34.1

