Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A70D296BC8
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 05:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045057; cv=none; b=TDgEkj8lkhSImMsr49PcCmT3SgmsuDN0C5CY9qKKbYZgXpvulcUbMS5pZgkls8gqzwPB2RMAcsylQaS4A1VXb0FVa8zIAi1mztW0pMeE/td+QkXXrWL3F346uPNIPI/fDVjWobTJm6eM/2Vi4Ibi3m4x0uS+XRBwyfpXR6Xcq+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045057; c=relaxed/simple;
	bh=Z7a+KeKlfsd6hODeCUGUk5GwLjPusVx49RSzZ6ytvIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZxUzplGmYcXRfMBGBzPVYGrF2jTxEQ6h4XZJbTdLWaGllNy1FpcglOGR03aII0n0aY3vSkYM1yez2lt/++MnSesVdjFmDrc/JgbRAhdT+LeZX8Yv1PxZzivYyaPXHC72smhRpxhkd1183eGMFVy7T4Vcw9onO4a+QmQXLHTe2ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcajeMbL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gP64qqJ8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcajeMbL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gP64qqJ8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66Q5SCYB4103691
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 05:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rccCrQapLXpGKmzhslQnhMFu7V0TczQtmSRgtHbcpXA=; b=mcajeMbLXptZM7Y6
	Eik9TsmaAXR4NxoKtPL70Yd/+mz49v9Nm4XdLqOpY4QnWlgKDBZtjfym/D9n6rn7
	nDA14Tnj+p56QojG2qM3c7TB3/mH4MocrhSrIiBD/Bz1JHww0syvicOy3cW6Asyy
	tV90RhxBbffKK7KrVqVL3eEwUZXzinaYalo8MyRnHPN8j4DUyS+vspwne+3EhAtz
	v/bOCKJZpDIYk9FgnpDjvExXFMlgCguAvr+9kmPbvsCORFFMXsxSnRsQWtbXOGhm
	TvfmjGZqqSZCqGD6MQckGs2o0WMFRxiLThSIiXgNy2t9jr4UnUOf/880DMTAB7xQ
	VK9yvQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmn7va9sp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 05:50:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso1691026a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 22:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785045053; x=1785649853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rccCrQapLXpGKmzhslQnhMFu7V0TczQtmSRgtHbcpXA=;
        b=gP64qqJ8jFIWSgHViiFudgxZiOjJu9ht4sog7RqOc5z6w/i/DtROsbs6GjdEK4LEbJ
         /+B51/BURtCUtzkEAdC43IlHB1XkPIkm26FAgI2JAL16UkL4TMYvDYCRqs/6v5ZjZ0ir
         Vpr7ceELNgDkYD1/VZC0HvWLU+Chh+55CtcZQucu4KLsmZAjChO2J8X+HKz/+x94E4FF
         6oK8jYh2BGeo4+5lIcfFM2D6Moo0GTMJ5aybVZ+VMeUUD6sMOKg6MTqCNqjawEFwQcj0
         ThniTJpUxkh3YjBzm4t4m+EgOFGFGReFVPFSMZaWjST2ha5/rg5KEioCn0JsBFj5CcoD
         86Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785045053; x=1785649853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rccCrQapLXpGKmzhslQnhMFu7V0TczQtmSRgtHbcpXA=;
        b=bckWyBIccTDW5wMSe8zVEGR/Hi+KnPtJgRZPY5Lt097XvUbWfcGRQms/zUhbZLtQwz
         HQX8b7FKA0vv5HypZ50POxYZdvTZS9POC1JHyyy3VMzORn2BQi8BO79lA3+nm6i5+Rht
         sjCI8g/aic5ne5TqisaHdHM9j74RKk1lVcsAvMdT7Ahd8sNFIT0tEPceY/Tq/3AI4esW
         gxqs6HJ4MGpPaaXTLRJ6VaxTIv6b3VdguJEoj5vVQV8hHrDKrJ5WsuWmnJq/YBnzRIFy
         VIk3mcwLxONS6ayxrBlejb5Su43WCoCp75tlLXtP2NP6yPvfh1y6VkWF7eM0IxykmnBE
         uV6A==
X-Forwarded-Encrypted: i=1; AHgh+Rp/h4QX3S7rJ3JWacUXpD/T9w7B0wVLo7OAWXocUt8w6LSRzQ94f9Erf+3Jr+zkbgLr7I+/1hLJ/i5oQBJI@vger.kernel.org
X-Gm-Message-State: AOJu0Yysdki2ZUbKZ63TMtuRaz0qHuQF1tbdVGe/bNYMR9Et5nx/PRFY
	3F5vFC1VRjQ16jTh7f0QtTqSMfvRCwjYzT5Hqrhp7dYVGx2+WNPnd+I4BPyzGxJl+hzVOa84LQG
	1q9+EsdwlrbI5D/TO70YaJFpkNiiySZVZGSjhH996R94kxzUuk38Rnbkhp5NP6UyR6+IC
X-Gm-Gg: AR+sD11vX6fuatec5FYWpfN4MhJy5tKHcqZMniIFcbUw94811PiiViCgOJGC6td1ruZ
	vR08SWSYPa7SQT0lkMk/wIysXwklH3NPhDmCleRxOcWM5BbG+H5RzRLHw7FRm2lixt/x8wbiKDb
	RA7aNk5nwVrWmJ6BPb2Qs90p50W+ACHazjFzQP46/sTL+K622dohgtpXoc9EM8yj5SEr7BxMPhq
	GCwWtJ+4FtC3/jJ5qf1wPEhReLT7hVL6+LaYieqSGJcC42UDbtX5rUV1+826fQd2Ww+mCyilG7F
	6IqWxmf7cKJo8DMr5yq/aoIE5RiyGpJVET4W6TTVn91XxHjIuTS9iMGcYW3AVrQeg69UEg2iKWi
	E1n2jMnkQMI03kre9LQftFR0rskZLdIIhyQ==
X-Received: by 2002:a05:6a21:1b85:b0:3c0:b943:f984 with SMTP id adf61e73a8af0-3c67d9b3996mr4129000637.3.1785045053553;
        Sat, 25 Jul 2026 22:50:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:1b85:b0:3c0:b943:f984 with SMTP id adf61e73a8af0-3c67d9b3996mr4128987637.3.1785045053125;
        Sat, 25 Jul 2026 22:50:53 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm67106334c88.15.2026.07.25.22.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 22:50:52 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 11:19:33 +0530
Subject: [PATCH v10 03/14] media: iris: Add helper to create a context bank
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-glymur-v10-3-de451559e88b@oss.qualcomm.com>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
In-Reply-To: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785045023; l=2769;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=YR+PjYPX5zksaKJC/NvxWsdFNoGva+12VxA4G3rAknc=;
 b=1WKoEGXdpkaOLMFx2u8nhiqOuD2Ea0z9ysfgEhptyWVHCZPgU9u03S4S0ZfRDKDxT4d41X68h
 W4mMKZnyk1sAvkMEZSt0Kf+ZZidcB3Zl0v90e++Ng+36MVTxbRS6iC1
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=GKk41ONK c=1 sm=1 tr=0 ts=6a65a03e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=11-_c5lL_m6SPrwGrosA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-GUID: xV4KKBCLZi6Pc60rlgenmiWqSQOztoVi
X-Proofpoint-ORIG-GUID: xV4KKBCLZi6Pc60rlgenmiWqSQOztoVi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDA1NCBTYWx0ZWRfX++YwDe1eyhyN
 mCWuidPTq+1cacMjtl8G5GerFUDluOgMu35rX5g605RaRjjms6qjTWLnjpxrT2kFQCpcO4jlK5a
 cGsQtoVuiT1s3ZNY3oN4JO781tsHMNs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDA1NCBTYWx0ZWRfX/iXhFh3Rpk/Z
 nvQzgfANUNn5dH47LeeHGw/JwNWCbtXh+dT7/T4xA9ZNbi9s0v7LhKo+PBJYsMz0HfV9Ldx4gY4
 XrE72YxC/Uj4aIWN4YItPujgz+O0iuTsExycmKL7m59GQrcxw33UOcRGohM46C4YkqV+viRY1ny
 PkAEPIl/ZlGCd5v36WQRRMfBfZF9dEqZXCJ8zSJZMZ6Lc6OflX4fXISwhnarWo40DLQCU9CcD2m
 kAqqCGySrVzV/PEKhqzqEZOpmkF12t+imlGLBlij2+6IlNZ1P18I7Kqrm0xIJ29fxpt5lP+XEy9
 BaQClCkgCsaDfy1Pnpc9+SFc/NJtbMxLauctgnEjbbgdABOqmNrjzNipjzGnIbJ98cUXkQNuS22
 pQO5N64XGpnwsxnjdoghsBitD0Wjp9Jd6BX963GmXXaN1KEwCsrXMN9j3Npvo21ikh8eZNqxTm0
 prxSoh3+T2+FOvclZBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260054

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

The subnode in the device tree is registered as a separate device so
that it gets its own IOMMU context. Pixel/non-pixel buffers are mapped
into these iommu domain, to ensure they are within the addressable range.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org>
---
 drivers/media/platform/qcom/iris/iris_resources.c | 28 +++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_resources.h |  1 +
 2 files changed, 29 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a..a685915a19e9 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -5,6 +5,7 @@
 
 #include <linux/clk.h>
 #include <linux/devfreq.h>
+#include <linux/dma-mapping.h>
 #include <linux/interconnect.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
@@ -141,3 +142,30 @@ int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type
 
 	return 0;
 }
+
+struct device *iris_create_cb_dev(struct iris_core *core, const char *name)
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
diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
index 6bfbd2dc6db0..ca53c01f60ae 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.h
+++ b/drivers/media/platform/qcom/iris/iris_resources.h
@@ -15,5 +15,6 @@ int iris_unset_icc_bw(struct iris_core *core);
 int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
 int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
 int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
+struct device *iris_create_cb_dev(struct iris_core *core, const char *name);
 
 #endif

-- 
2.34.1

