Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3254A58123A
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 14:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965892; cv=none; b=CXAkYgXSGLv707f8f5tiWvwBlj/LrW+kSMsWrtFabBH7bzVaVIS0QMQxEl2tt282GU20uyObsPMqG7zGw8Xdm4zAMlZKaMlzz4lOX5CeW2334016erSclZhIDYe9NTmh4uQ6hrP+xzjH/3vmqZ0qiu8yoEbaq9km2RUjlyrtTY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965892; c=relaxed/simple;
	bh=2XMdrsIUb92+YcGk/72FitFJ4xeAJql1ugC0uKB/yVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GgGCEFRJFMY00qfxeSZ+FkCFHPsY6VE55BaNz4irzl1was31GEVvjOF0i5PHjMQOO8WXN3HddU7IvoUSD0nEUkz1ZEE4g/y9ALgLBpm7kNVeEOUP6dHUzSF5azFsgcpmCptDi6WEDvnrgjI6D1bQLZ7iGpYUQHkYM6egKT0LpoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TZlbeVFK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LGbSig/t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TZlbeVFK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LGbSig/t"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CAUQI1233139
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 14:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M6iRa0ga0M+/AMP/mz6QHW7CHXaKEVGssFfyq7rC5RU=; b=TZlbeVFKU147Giq6
	ruFgCKqTD/lUSbHGFfhV3B+R9BznvoclYemXbORvHP3CE610gtDocXLtMlg0cwWY
	Sby9FkB8BjKbi/Qu+cmcmS+u03QGH+qnIBgYxlHSDolZWxaWTRFXLm0C6CoYbT6O
	b88WEl2nVwijp5x2gAjEuNcarV/8Iuhi9oNjXItr660rsyRnxk0eqWzaMpAbzRP9
	HUalkoMHxEJzwf8ONzAQyV3urGRzUrLrOVQP8Z5OcVpakFJJjDRaUhyZGUZSEAXt
	TAgJ+rfmjQuUcdfgsoOZe/bBapcV/IWdMUFlSTFSrycqQO1YP/7gGgrK6RiP79Do
	Fr1rJA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk77vgr53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 14:58:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39b90cc0d5cso3386145a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 07:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965890; x=1789570690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M6iRa0ga0M+/AMP/mz6QHW7CHXaKEVGssFfyq7rC5RU=;
        b=LGbSig/tLxlq4sH5QlPH20WeUs2wqgwDlOfQbJP32/SOxPCsWmVdiQG/LzRclJrGOt
         +DNlpN1/fVVD54w3ALdy5ro5Q1CKK33SFlC9AgU/B1z6i5TIKxTWOxIx4d9AE8rhsZyZ
         KZytJdOXg1xX4+BwLf16peBnbTxF/sR7c4o1pAWB+Z2wEfDGHOLxfo15O9J3+Is+2dvp
         WwnjTeW6lNsjabhGuAct4yZp9BaDOXXfX2KfWSb+VDeOA9TmL4kKO8L5/7sLkWrBXe/+
         HxQQWAqyhkoW7dZ2lLslVI4iBOLxcRPTQJTMvyAZIqpVHtoCsk91w/3KJHiVe272vN/R
         mP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965890; x=1789570690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M6iRa0ga0M+/AMP/mz6QHW7CHXaKEVGssFfyq7rC5RU=;
        b=UyzxHeQB8SUIrTx8Vuf1H4cLJo1XkQPxeq2E8oaesWskP2BJPnKE3w9OE4VZLpCG1E
         qz1J82WYKcJqhx6rkFrdgcWmo+Qu7afyTvOnbdTV3DqYH/L3h0SwNqj5z7IQ+4u+zrNN
         JLb7WzsZhkg7+uesDVUYJbWMSk6bAgXQLE5p/gxCXjfLFii93TS884aZcUMUy5kChNhW
         d6FboVWpsg/rlDtoEjFR+jXa7IiwS+X6RtnL4itqRw/8JB5igkrF2PuQWBecHXbCeDbG
         vmR2os8UQNe3hs0H8dOLTWZ4rGl7oqdo5gYtlLUu5V3XV79OrL88xcVIkT+gHKcSi7Jh
         o22w==
X-Forwarded-Encrypted: i=1; AKwUvBxqpP0y6AOHsVKPscWYzTgWPctCbgxLOeV+kVZu8xU5A2lH0W8JTw8PRIaXS6vUSIyfk9HNd9KlBQy77+sz@vger.kernel.org
X-Gm-Message-State: AFuF++nPLdK64XSu7j78YVhAdywN7iRh9V/MdQdbWBY1EiAkwe6fp2R5
	vVCV/rlsb5f/4qveU+ZrJEmxW1jurVO3XTprgdQwRZMBrkqW1PVWRBoxqEBHC7h2uNA687OniMJ
	gbejji76HwQYqNSfLf7dym4LaH3aBLJOvy8M0Ozqb6ZlsyUiNHM9mir8ZjUzdIbt1KQYF
X-Gm-Gg: AYBFou3cfnvd2sIA4OtDJpSIljdMLG52yd1msL3ewBmf9ZKY3FEV4CB5OZac51DrXrf
	YwLAtcqSemMf+YONy2oZtC49aYQ9N3FKMvn+KQXjWaPJy0WiTnnPjw9cV0pYz8XB969i6at5lYv
	/qomwn6t/tHT3jrE8prL5BV3MSDsiVUeTT0fjYw5irw1ZuSGPqF0FiGz54c66RQ428y9VAYKrQw
	I63/xEIoT+XMLdZMDdghBmvQofUo/zS76EgvoK1Qs4KBvN9PWlMoHkG4N43I9IcJ3km4uQyjmVR
	ZgKd58ksORLZwUx/V4aDLb9BlGJaVdMbdRPHgeUioWI+KLe/ZuUOlR2LNT6spktGroL094EKMV7
	YJUc5yUv8TzmVzLpG5/tRIJ2VPMRyUTzsCCM=
X-Received: by 2002:a17:90b:4984:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-39b26104798mr48890790a91.6.1788965889543;
        Wed, 09 Sep 2026 07:58:09 -0700 (PDT)
X-Received: by 2002:a17:90b:4984:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-39b26104798mr48890710a91.6.1788965888914;
        Wed, 09 Sep 2026 07:58:08 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm51270766eec.21.2026.09.09.07.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:58:08 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 20:27:12 +0530
Subject: [PATCH v3 05/13] media: iris: Add non-pixel and pixel context bank
 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-vpu_iommu_iova_handling-v3-5-2fe43ae45495@oss.qualcomm.com>
References: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
In-Reply-To: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788965840; l=6051;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=2XMdrsIUb92+YcGk/72FitFJ4xeAJql1ugC0uKB/yVY=;
 b=PHmoiKXPJxt91Cg6YlJTHp9NCdRleO9pPr7DdHc6zhNOm5coV98cXKfouPIM/UGrr5dUCYE++
 W6NnuOj29MoCciL7xysW4T2N83keBmtBUKQW4wyuWpWBJqjiHdmRA1w
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=GKk41ONK c=1 sm=1 tr=0 ts=6aa17402 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=e5mUnYsNAAAA:8 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8 a=UWePQM47DRlDhC0KtsoA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: JQN4XtGbzDKJPsS4sziOWRNYqM7gxRk1
X-Proofpoint-GUID: JQN4XtGbzDKJPsS4sziOWRNYqM7gxRk1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX6e/Fg22HvIfu
 K3cQv+LCIRSVokQNkuP92+dKS+dKXvqcN9L9Disv5j+cZjq2ddjmoSm0zGLVYC0FpdOg/7N/i4K
 nB0Ea33O/gKYZI4e/UfQXbe4g+0GAxE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX30QLQpdFxr52
 nbwbshOxOEYZGHwRAIqgichE7vIEjb0N7nZ6QXQ6mjuBbshb+KoQae8AaAlH/y6n3f1mxw68wX5
 rbntGQiNag16njKnq2N6ZQ697+zx24k7p41lWKRXk9dGUTSA21sEOp1XH/luX3ZU8KDbyxcJ3dq
 F76325FpOfcl7qJJE5w8QvnTrorDcetmhruJO4LqbTe4Eh8fH21QXhmUxNIBbHO92b4irKX7ypl
 pzKPBU82geErJIgOH5+vJ2o8sNWpu2ExN2Toq2KNqh4qMtO10DTdRzryZps1iY+n3LTCjtzuyyB
 t6rRPUuKLxor2z92UHFC7MkicNQHyZgRIvVoHmaXz7J1/SWOhSIq3UNqWsn3vg+0jt/BPXQ6na6
 gqglTZpmDpvfeqskuW9MU5SV6esnPyuZuIXuE+LCiXuRz55oejCovBT3nxds3bfYf6Jwb/iNteT
 8zg287M/R3R8EmTBXGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090167

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
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing restricts a
non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Now the device tree describes "non-pixel" and "pixel" as separate
context bank subnodes, each carrying its own "iommus" stream IDs.

Add helper functions to create and clean up devices from these DT
subnodes, and call them from iris_probe() and iris_remove(). This
applies to the common probe path as it is required for all platforms.

Set the context banks before v4l2_device_register() so the DMA plumbing
is in place before any video device is visible to userspace, and tear
them down on the probe error path and in iris_remove().

Tested-by: Daniel J Blueman <daniel@quora.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h  |  4 ++
 drivers/media/platform/qcom/iris/iris_probe.c | 71 ++++++++++++++++++++++++++-
 2 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 24da60448cf24820af7947b85eb7208555ab7786..3c96f46cf567b2802148b2a7cedb8488b6b9468b 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -36,6 +36,8 @@ struct qcom_ubwc_cfg_data;
  * struct iris_core - holds core parameters valid for all instances
  *
  * @dev: reference to device structure
+ * @np_dev: reference to non-pixel device structure
+ * @p_dev: reference to pixel device structure
  * @reg_base: IO memory base address
  * @irq: iris irq
  * @v4l2_dev: a holder for v4l2 device structure
@@ -81,6 +83,8 @@ struct qcom_ubwc_cfg_data;
 
 struct iris_core {
 	struct device				*dev;
+	struct device				*np_dev;
+	struct device				*p_dev;
 	void __iomem				*reg_base;
 	int					irq;
 	struct v4l2_device			v4l2_dev;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index e4acf4a74f944bcae83089ef5489f204d4b0078e..debd1f0e57038d7abf463e82fd80f887b67750e8 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -150,6 +150,67 @@ static int iris_init_resources(struct iris_core *core)
 	return iris_init_resets(core);
 }
 
+static struct device *iris_create_cb_dev(struct iris_core *core, const char *name)
+{
+	struct platform_device_info plat_dev_info = {};
+	struct device_node *child_of_node;
+	struct platform_device *pdev;
+
+	child_of_node = of_get_child_by_name(core->dev->of_node, name);
+	if (!child_of_node)
+		return NULL;
+
+	plat_dev_info.dma_mask = core->iris_platform_data->dma_mask;
+	plat_dev_info.fwnode = &child_of_node->fwnode;
+	plat_dev_info.name = child_of_node->name;
+	plat_dev_info.id = PLATFORM_DEVID_AUTO;
+	plat_dev_info.parent = core->dev;
+
+	pdev = platform_device_register_full(&plat_dev_info);
+	of_node_put(child_of_node);
+	if (IS_ERR(pdev))
+		return ERR_CAST(pdev);
+
+	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));
+
+	return &pdev->dev;
+}
+
+static int iris_init_cb_devs(struct iris_core *core)
+{
+	struct device *dev;
+
+	dev = iris_create_cb_dev(core, "non-pixel");
+	if (IS_ERR(dev))
+		return PTR_ERR(dev);
+
+	core->np_dev = dev;
+
+	dev = iris_create_cb_dev(core, "pixel");
+	if (IS_ERR(dev))
+		goto unreg_np_dev;
+
+	core->p_dev = dev;
+
+	return 0;
+
+unreg_np_dev:
+	if (core->np_dev)
+		platform_device_unregister(to_platform_device(core->np_dev));
+	core->np_dev = NULL;
+
+	return PTR_ERR(dev);
+}
+
+static void iris_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->p_dev)
+		platform_device_unregister(to_platform_device(core->p_dev));
+	if (core->np_dev)
+		platform_device_unregister(to_platform_device(core->np_dev));
+}
+
 static int iris_register_video_device(struct iris_core *core, enum domain_type type)
 {
 	struct video_device *vdev;
@@ -207,6 +268,8 @@ static void iris_remove(struct platform_device *pdev)
 
 	v4l2_device_unregister(&core->v4l2_dev);
 
+	iris_deinit_cb_devs(core);
+
 	mutex_destroy(&core->lock);
 }
 
@@ -269,10 +332,14 @@ static int iris_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = v4l2_device_register(dev, &core->v4l2_dev);
+	ret = iris_init_cb_devs(core);
 	if (ret)
 		return ret;
 
+	ret = v4l2_device_register(dev, &core->v4l2_dev);
+	if (ret)
+		goto err_cb_deinit;
+
 	ret = iris_register_video_device(core, DECODER);
 	if (ret)
 		goto err_v4l2_unreg;
@@ -306,6 +373,8 @@ static int iris_probe(struct platform_device *pdev)
 	video_unregister_device(core->vdev_dec);
 err_v4l2_unreg:
 	v4l2_device_unregister(&core->v4l2_dev);
+err_cb_deinit:
+	iris_deinit_cb_devs(core);
 
 	return ret;
 }

-- 
2.34.1

