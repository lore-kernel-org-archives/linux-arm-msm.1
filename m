Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAF14519A3
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 15:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787066043; cv=none; b=Zl45rxN+YCRqUK+q2dKPTlfttKfhVu11AWJceCTnSVT42QtXH7r6y4GQ92hl0Obq1DTL3CnBmLuRQb9fePG6nhWyGnXR95+yH2BCHGWrR+Vt6LUv1xzKxP9MK8z9QuDzFIpy/9Qx3ZaPCmOOWeXwoPrCVgJ3ePMj1Hthyt/Zs8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787066043; c=relaxed/simple;
	bh=D2to+qdFUJIyRn0gO0bPSz/9KSto6nc1kDi6S4cQSCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E1jt/w9UYqXeOGUeATIu6/7Uub9GEA4g6ebVP8osqIVIzD8tnZk/NsqTxcR4fHMn7gLAf/CxhW9XvAhHIvYdrZVViw3fgZyljmguYT9nGgJhf5+SOPy3GP5eH59JLtxH32DmZGE8I6GnWeWX4T/ZXZA72ICf9/hngmE7tyvPH4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z3fiog3g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AzPOQn1v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z3fiog3g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AzPOQn1v"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IE0xtZ572502
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 15:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wCtpXxUQCEA8WhSXbgymO2TVAaU6id4xxMyC/S5YYf4=; b=Z3fiog3gpR5J63/e
	7CCWAel77dlY9WkrBJ+wpdtWVpbQEyxFPQBS7AlcOKqsQnzrb0VTKpVQRCOXx6Ja
	K0BiGsqhouF5lBpY1Vq84i5y9xfjf73D6YirN3nMwgXEsb47IBhj5J0PU1uOImQ/
	S+ic7msXJsBNo/4F4aGJvMc2LHNKMVx8phj5zTXIgCzv0js9KNuS2DGSJwUVkPsQ
	6BhrOqQJEvoMJfIjYJc4pcn4OTV2Op3KgJfX3uKzw7ziIWf5nnTJD092lhFw/V5j
	8/JXzjk82bl28WYDIep2rXpg5mUeB+J6YhxUABqC7KWwG8GxzDA88F7ZN9yPukVx
	huKIZg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4f5pu0my-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 15:14:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5fc4c7e9so632909685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787066040; x=1787670840; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wCtpXxUQCEA8WhSXbgymO2TVAaU6id4xxMyC/S5YYf4=;
        b=AzPOQn1vTFOXbRMP6TtpCryH+J5H9zfBbb9Tg8ZlEldSEPNbe+G8WcDi2Zlq4AjMNM
         zH3CU8/nH07keRFAFRxDp6TTss9H01EKIt5kvZrp71wv8W/YUMI4sN7r4UTbQ1jdBhSm
         KPAg4oXU0wCEhOarHPRv1CQ/OXcAjR8/kDuzdpXH5oxXoLo5jSVEGq6rHCCPUDu5Xbmo
         C0V1iJA8qfOIORiOb6Gf8RrMWqbb97QiNIIdK3lPFhNsvZAfc+gNZoffgvCRgCANq/Qx
         NufQy6cz6KzmTbkpDnBrXN9fzOK13giuJgvZ1wWQOjvO/SamzIo4ASemYhxmawS7L9PU
         y4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787066040; x=1787670840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wCtpXxUQCEA8WhSXbgymO2TVAaU6id4xxMyC/S5YYf4=;
        b=PH3lkWNgU8pGwVex87BSsIp88zD4xQYp8oNop+xYb4aGwAnsleUX70W2O8LpKRccaZ
         7whGWjxkUhEWtz+g52BEhUZypCkPOgeOxCNojfFR9qrK8k+T/Gb1dj+hinP2VqxpggaF
         JNeLkr8fb6hTB2no8sLUmqer2Br0HxpkJUVkiv3VyZWg0xrcwAycXIo7T++ZAAT5RtDy
         ddCIlIZXH7J9Lb+b/EjGez6+eBTwIs+Eevr+oMwSMOLxcfv7YzRv2hW1c/kUSk2cO+QX
         +OJwSiFw0KkWccjcwXHcRMF3k0FnA58A8Utyx9eOZV9jjTmRiy98U+bzVe77lIiJknhZ
         iOvg==
X-Forwarded-Encrypted: i=1; AHgh+RqwsI1pkE/7GSY8Ow7DGRPViypp1AWHXnaQVnNgwcyngaIaO0LQnnYzmHSYpE48z7tRHi4cHj5jlIMNG7J0@vger.kernel.org
X-Gm-Message-State: AOJu0YyNS6y4DgsqmCD1AbKurYRf+Uq+8ofwsHubsAaYa478K9R+072g
	ZQrqXg2d91nAnMjoXNtBLdkNorOhVCmtgjKyjw2Woq4tEybHTb23DOJcDU8dIrPhrXAFZFnVdUz
	c0bqGctQZM3k+Tv8v1OL5vWT+P8lHceo3LUEQKGHFEZ7+xbuYVT7LoAeyDElWiCT7ATpa
X-Gm-Gg: AR+sD10O2ciOJX0XLBqiCg24d8m/GOqqYUENPeoV69qsftSPWVIprIs4tFifmVzyYSj
	OxZtpcBz4gOWHymOI2xPRjRl225+F0T7EIsZ95JFkf0iLkMG3xbUj1wvWRLSV6XrnILoV17CUSA
	6LU6iBi/CS7lixhubgGzU7dYxjQ7JtwZipBDBzsFD/Rp74mDsWGAlE6fx319C/vxJOQq7MuZV5a
	bb5Mg92QsgOFg3K9lcN5I7kKyvtKL+i5WLxle5pd3nTH4QCJ31NMvNfZT4AIysTT6L6rCWG1YJq
	AmXohXUFbnscfLOvlEkMjI7v8WbLWMfd5jQzvMVqkOOJI3DOF0piJkKwXHDu4zGkMAvA6ynxdrf
	8fupXgFTIdkpH4WSIsHLlPYX5tF/cp+JqbA==
X-Received: by 2002:a05:620a:72b4:b0:936:cae6:5869 with SMTP id af79cd13be357-936d23607b3mr2667722685a.46.1787066039422;
        Tue, 18 Aug 2026 08:13:59 -0700 (PDT)
X-Received: by 2002:a05:620a:72b4:b0:936:cae6:5869 with SMTP id af79cd13be357-936d23607b3mr2667716085a.46.1787066038938;
        Tue, 18 Aug 2026 08:13:58 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a3158asm13111105f8f.7.2026.08.18.08.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 08:13:58 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 20:43:23 +0530
Subject: [PATCH v2 2/2] media: venus: Fix iova allocation from restrict
 region
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-reserve_iova_in_driver-v2-2-5005a1154408@oss.qualcomm.com>
References: <20260818-reserve_iova_in_driver-v2-0-5005a1154408@oss.qualcomm.com>
In-Reply-To: <20260818-reserve_iova_in_driver-v2-0-5005a1154408@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787066016; l=6186;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=D2to+qdFUJIyRn0gO0bPSz/9KSto6nc1kDi6S4cQSCE=;
 b=cyF1gI48/ejxw8jwVxPUy8tI2Ux5AK3JwWjAy26p2TYMCW0mMm9/FvQMBKK8/xEypMGQL5emd
 12WCyoQ1hpzCOtGk6jBKOWbDfOiq49P2gCIEThD+m9GwEPN7No7nqNc
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=S+/pBosP c=1 sm=1 tr=0 ts=6a8476b8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qCMCQjtVS-vTbDhzrxIA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: OpHoVf4XtwrH369OtThK3aHRFHNkHVYy
X-Proofpoint-ORIG-GUID: OpHoVf4XtwrH369OtThK3aHRFHNkHVYy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDExMiBTYWx0ZWRfX8iUA4jVhP7ei
 O34U7ulGlru2uvvbT5moiBoeWRTwXbZg50Nep1LpHyUOkHShPgNvAwCeZ3OcJ0wCPeJAOKBK2Fd
 FLl5UicrMgeJgwBIEFZmCo21Wd1zpU9OAcE73d5Uh6Ycb/+21nRRTaDj5Y/aUKESSeyMy+x5l6X
 dYTYLVXEd4TymVP8mUY/87UKnNMbJziapkpWn9RLs3kQTSv0PddA5fji3kuiGq2+gUSCPVImif9
 qhQwVb/TRkE0eJMRbpMLUcdDwnAgMZh50mwxS13JwhKdcPQXLXZAgOit4lBYOdajIWiwLTYnxt/
 BGR0uYZfTIRuthbmJYnwCXFA756VCbPR8Df9STSatloCbX05j6mAdwmf0QukGfOVu55/F4iaOqm
 ITg3RshE9ySx9uWccTHuqUjfW1X+IgxtxQpwNcQ9YmYZ9bvmkA9xeZRI22usU6UeSPP30Hbzc/T
 yvLaiggduAzQBb6p4Mg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDExMiBTYWx0ZWRfX665DiVXvPy/g
 EEXMqNErfL8CQHANC5Tv9b3y2iHgXXlm17ncTuCrZGOK/xsKuyESUCUQk15oLzJ0Yx/bIj+hMXJ
 ZVTJr12sdvBaJ3o7XGFj669tLOdf7XY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180112

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+

A single "iommus" property on the video-codec node puts every stream
in one IOMMU domain sharing one IOVA space, so nothing stops a
non-pixel buffer from landing below 600MB. Once an allocation lands
below that boundary the hardware faults, which shows up as unhandled
SMMU page faults and spontaneous reboots.
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Fix this by reserving the 0-600MB range, below the boundary the
non-pixel stream cannot address, using dma_iova_try_alloc() so the
IOMMU-DMA core never hands that range out to a real DMA mapping. This
reserves only IOVA space, it does not allocate any physical memory.

Since sub-nodes for non-pixel, pixel, and secure streams do not exist
yet and only a single device is available, the restriction is applied
to both non-pixel and pixel stream IDs.

Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
Cc: stable@vger.kernel.org
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 66 ++++++++++++++++++++++++++++++--
 drivers/media/platform/qcom/venus/core.h |  5 +++
 2 files changed, 68 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 243e342b0ae7..2a0ab553c451 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -377,6 +377,57 @@ static int venus_add_dynamic_nodes(struct venus_core *core)
 static void venus_remove_dynamic_nodes(struct venus_core *core) {}
 #endif
 
+static void venus_unreserve_iova_region(struct device *dev, struct dma_iova_state *state)
+{
+	unsigned int i;
+
+	for (i = 0; dma_iova_size(&state[i]); i++)
+		dma_iova_free(dev, &state[i]);
+}
+
+static int venus_reserve_iova_region(struct device *dev, struct dma_iova_state **iova_state,
+				     unsigned long start, unsigned long size)
+{
+	unsigned long dma_limit = dev->bus_dma_limit;
+	unsigned long end, rem, chunk;
+	struct dma_iova_state *state;
+	unsigned int count = 0;
+	int ret = -ENOMEM;
+
+	state = devm_kcalloc(dev, BITS_PER_TYPE(dma_addr_t) + 1, sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return ret;
+
+	end = start + size;
+	rem = end - max(start, PAGE_SIZE);
+	dev->bus_dma_limit = end - 1;
+
+	while (rem) {
+		chunk = min(end & -end, (u64)1 << (fls64(rem) - 1));
+
+		if (!dma_iova_try_alloc(dev, &state[count], 0, chunk))
+			goto err_free_iova;
+
+		if (state[count].addr != end - chunk || state[count].__size != chunk)
+			goto err_free_iova;
+
+		rem -= chunk;
+		end -= chunk;
+		count++;
+	}
+
+	*iova_state = state;
+	dev->bus_dma_limit = dma_limit;
+
+	return 0;
+
+err_free_iova:
+	venus_unreserve_iova_region(dev, state);
+	dev->bus_dma_limit = dma_limit;
+
+	return ret;
+}
+
 static int venus_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -421,10 +472,15 @@ static int venus_probe(struct platform_device *pdev)
 			return ret;
 	}
 
-	ret = dma_set_mask_and_coherent(dev, core->res->dma_mask);
+	ret = venus_reserve_iova_region(dev, &core->iova_state, VENUS_NP_RESERVE_IOVA_START,
+					VENUS_NP_RESERVE_IOVA_SIZE);
 	if (ret)
 		goto err_core_put;
 
+	ret = dma_set_mask_and_coherent(dev, core->res->dma_mask);
+	if (ret)
+		goto err_unresv_iova_region;
+
 	dma_set_max_seg_size(dev, UINT_MAX);
 
 	INIT_LIST_HEAD(&core->instances);
@@ -434,13 +490,13 @@ static int venus_probe(struct platform_device *pdev)
 
 	ret = hfi_create(core, &venus_core_ops);
 	if (ret)
-		goto err_core_put;
+		goto err_unresv_iova_region;
 
 	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_thread,
 					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
 					"venus", core);
 	if (ret)
-		goto err_core_put;
+		goto err_unresv_iova_region;
 
 	venus_assign_register_offsets(core);
 
@@ -525,6 +581,8 @@ static int venus_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&core->v4l2_dev);
 err_hfi_destroy:
 	hfi_destroy(core);
+err_unresv_iova_region:
+	venus_unreserve_iova_region(dev, core->iova_state);
 err_core_put:
 	if (core->pm_ops->core_put)
 		core->pm_ops->core_put(core);
@@ -562,6 +620,8 @@ static void venus_remove(struct platform_device *pdev)
 
 	hfi_destroy(core);
 
+	venus_unreserve_iova_region(dev, core->iova_state);
+
 	mutex_destroy(&core->pm_lock);
 	mutex_destroy(&core->lock);
 	venus_dbgfs_deinit(core);
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 46705a666776..30b8cababe86 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -8,6 +8,7 @@
 #define __VENUS_CORE_H_
 
 #include <linux/bitops.h>
+#include <linux/dma-mapping.h>
 #include <linux/list.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/v4l2-ctrls.h>
@@ -30,6 +31,9 @@
 
 #define VENUS_MAX_FPS			240
 
+#define VENUS_NP_RESERVE_IOVA_START	0x0
+#define VENUS_NP_RESERVE_IOVA_SIZE	0x25800000
+
 extern int venus_fw_debug;
 
 struct freq_tbl {
@@ -250,6 +254,7 @@ struct venus_core {
 	unsigned long dump_core;
 	struct of_changeset *ocs;
 	bool hwmode_dev;
+	struct dma_iova_state *iova_state;
 };
 
 struct vdec_controls {

-- 
2.34.1

