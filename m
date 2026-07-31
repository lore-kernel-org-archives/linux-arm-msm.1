Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73B33E63B2
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 18:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785522177; cv=none; b=mUFXFDd3ikofNkpw1s4ZRTG15ZWsLNymdt5LcshG1/nKGQq++rmevHA6AHCPURHI9YBVHffVtIXR3HhkRITkIeeRer+9S3SB/beKh8VkMa/ymXQv0/XOWTsddrAuyRO981GNuzaf08N41UYCXabq1mS2BC5ffVataSWnLqm2a/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785522177; c=relaxed/simple;
	bh=bpZUDSDe1YBY8ECN8OTOUWJTi/KZ4B5ccQkOA6CUnRA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Opz3mJqHP9I/FzGxwgbvqeAGo38ISkRsxlKeq7zp4qgQ5aA7tDzg2fgyjdCBjjXb59KrZVtHnH+u6KQyrGlCUbJEe2WhPb9wx9beE96VVOha3R8UazHkURg7RTjBVPewIrXOWa8O2FcdiT6fY+Vr518WMBNX+jHxxcT6kcHB+G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MRAop/Sz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bueCLSJZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MRAop/Sz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bueCLSJZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFODxc353521
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 18:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yjpjbceNMhq5SUugGyKVzGCpZa97ECPfDLce9QWLPh8=; b=MRAop/SzLVcEf/v5
	hkChfRdh0HPVqcUZaSqhGH8PVy8YZRTqSCryyx8imqpc+X0UWjnYgFGOtNi/Rv5s
	DcmjL0wvtZMiGSQfo0zG54ClFQ3r0wve5H8/xx2fq3Z1Np5GCSwmaKZfbpPHMAHJ
	IJYD6CkQtXcLXvoHHOUgrb56qjAjctgssnatUrpoDlgjdOS4Phskju4rsgMqnFNl
	TpC0J/auMqvoal8OZlinzSgN3auJBWD0Ie4NSv5hCdZLT7gOScOQCGd83nTvotF3
	DoJQ4bhOekHPasQN+r3lYakrHKICJ0NAFkew8o0v4/SOYZHGQdqQXq8eT0O2PmlS
	SxMpow==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru481j70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 18:22:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb835525b10so1479239a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785522174; x=1786126974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yjpjbceNMhq5SUugGyKVzGCpZa97ECPfDLce9QWLPh8=;
        b=bueCLSJZBGOO+ii92D7CdC2r5kjjXFikUSdnOuImVV64KB3hpvTaZgtMUEVCDp0ZN0
         TINvnsOK6vcVmZZr8E9aLgbdz5BSINB0k1xQSS5ZHpEVgYYJJZfheEN+6rQPNoYQo74E
         9yzN9zF2rfjWmjuxpN8Jw/EC6FmmWuWlqVmkVoxxMOhzLpPgOIeTfJk0v3ce3uOSG1tq
         gXgMIHuGk3dvmrEACzUDe0BQQawEQ5DROYdLxzZ+3XwfeCtq/szqeGOUEXH2NS3LfKI6
         mbYJEqWr/v92CxDm1hlDi3EDlm3wKGPk8A/4XrlyiNX8x6lfQKzYGc4z0QRZVNWOho2r
         hQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785522174; x=1786126974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yjpjbceNMhq5SUugGyKVzGCpZa97ECPfDLce9QWLPh8=;
        b=EUe3nMNTlJUQ13Ky8QaNdV96iXTuYi4Peof5w4C8ixC5m8Ru1kEA0Ma/W352P9Vy2a
         GVxVU30aeDt4L1NJobJ35uvnFcF4PE6OAl2OhCVKFMNY6CCdNCPGuQg7fYete8tQueNs
         iXuvd1C+jEEdYooXuBy4LBwehwAQFIcd1/jyEJmvORA+ponaMTSTTnzQT4fVznKSok8H
         Z4VAxXIwInHwCygDfOwdYw26dNSMKFd1IneU35gE3EJ8n8jaLJTXtqrNNesSlFFHBMvo
         mWVwg7JZ5qFNHd2Ga+3civ2mfj+wnkefa2byxHgJK24LGU6VYAWxXWYcQFh+OV0svkPV
         Iykg==
X-Forwarded-Encrypted: i=1; AHgh+Ro9kCMJXA7dk1kyv909tMaJ6zjIQdHGd8c/x5/bpukr30maaiRVlsA36d4CZCrSeMX4PKTokMQ35o+zh6gi@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwh1eQkJjxyZF/Pv5DkYusU7d/w8KidTqx64TJ2oHPaviLfyz7
	U2lXlVUmQtd44soUcIuNfHwFUw1v8je//zhFsaZCny37GKsVaMtE0whaDezzmTwhb4KunLZkX7j
	JMqHUHbVHj8+ENaVZx2Hf7sw/VW3PDxZQorMm4g9gfjIvx7QL+jcE7jgdWAj5oJYfhlz4
X-Gm-Gg: AR+sD13S7ZydfizPOLu30jOF1/XtAPwtqnRxshiMilacKquqq/MGiSX2JUhjdeSKJA1
	qluVGT0iCtkIfcNzmDSTj8Q/RkM55LRliWGxA2lsk9GUCOl1cd/a3iKxRaS6CaiSP6jfye76VPF
	njc/FrCdpgrKWOEif4CdEODXEPnqnvbVXItqm2HuT4Ca397PfGpUeTT3OsGK30cj6f+J8ZNdvn+
	qzisTT+ksoghNH3wov95Ho9UHIn21r/NBo6BYHbJYSw/b4gcMD7yMQN4Fx9O0jIycRbV+3uph5O
	Wc3gypJvcFAuycwqPauNE1v72aQqcfCRk3uaoiVQ4cew6bzimnVVsA9ZtA6VMOzSFhkBZVger4a
	vgtIYw9BRSsI+/S2ormVnB4yvl4e8uWtQfwo=
X-Received: by 2002:a05:6a20:cf8b:b0:3c4:2b8b:e17d with SMTP id adf61e73a8af0-3c92a8b795dmr796755637.58.1785522173698;
        Fri, 31 Jul 2026 11:22:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:cf8b:b0:3c4:2b8b:e17d with SMTP id adf61e73a8af0-3c92a8b795dmr796735637.58.1785522173252;
        Fri, 31 Jul 2026 11:22:53 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04456dsm7203089eec.14.2026.07.31.11.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:22:52 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 23:52:19 +0530
Subject: [PATCH v2 04/12] media: iris: Add helper to create a context bank
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-vpu_iommu_iova_handling-v2-4-da52b5228dbd@oss.qualcomm.com>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
In-Reply-To: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
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
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        stable@vger.kernel.org, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785522138; l=3855;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=bpZUDSDe1YBY8ECN8OTOUWJTi/KZ4B5ccQkOA6CUnRA=;
 b=I5Lfpjtuqvt9qfOSlAXNtjo2zhc4Rg7VJ8/SxcaEkF8e1vS1pz/2idzbikFx+IyD7KXD2f3vs
 j0YmAO/1z5eCAxn402aAwwLkvKPrssanD1bahkLPn/PuVcuIbGpNL8d
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=IJsyzAvG c=1 sm=1 tr=0 ts=6a6ce7fe cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=vkKLUbRMwET9CpguikUA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE0MSBTYWx0ZWRfX2secly8SR1i+
 2CTaoBnEDC4b4vtzd9HjlNoLAhkOcXUushbscYEhzdidF/pngHAkaHop5zheqW1lGzuY0vrvizJ
 0vaaoBSMQyICdlSl5UIPUHrV90hyTXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE0MSBTYWx0ZWRfX+X4Itwhg9+tJ
 S76KIRNYhmfppM2uLGUpKFvQSosKFWXoVv9F6jOlwZjTQ1ewPT+pwPj9dwAISuRggKUrqnGOKoF
 h/KF20ejniy54PV7bwgNFpZK104ueeVJtej5ZL+BPMfdUMXYrolrAs8vcHoRh9y4a4DKN45YMnf
 O0UVRvimIjz5AS8ci15AfEIxCHjDIlDnbqdtsXcMBfmY3CIw+PCRZAC8L6N0jh4cVdyXo91aMum
 IXgw7IwxqYlLFm6EZXCEXNvm1Y/QTYFiid7IoIMmhZ9kdSYZmrzdls2inyowrE5Ucyzgde2DYL9
 mLkbG2GRSo4CFpoi93y/vYAWOKHXz8lPhvWjq3aiiWfvsyfm1jEVq/HEbTVD63bwS67PkeQDcQ2
 N4FAUnpPDQOTzfJgZMe63tFJZ65D7/xUPVspFtp3FK2IWVEXqjDJkMlj1J3mGaL0TdvjpYsfAcT
 ffV/ROMUFlmTPp1IZaA==
X-Proofpoint-GUID: vK3DHG8NVApo43q29Sa4L3Sjq1GC-e0g
X-Proofpoint-ORIG-GUID: vK3DHG8NVApo43q29Sa4L3Sjq1GC-e0g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310141

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
is restricted to use 0-600MB of IOVA space, while the pixel stream can
address the full range. A stream can only be confined to its range if it
has an IOMMU domain of its own, and the IOMMU core attaches a domain per
struct device, so each stream needs its own device.
Add iris_create_cb_dev(), which looks up a named child of the iris node
and registers it as a platform device parented to the iris core. The
child's fwnode is handed to platform_device_register_full() so the OF
core applies that subnode's "iommus" property and the new device gets
its own IOMMU domain. The DMA mask comes from platform data, and the
segment size and boundary are capped at 32 bits to match the addressing
the VPU performs.
Return NULL when the named child is absent, so callers can treat a
device tree without context bank subnodes as a supported configuration
rather than an error.
Backports are intended since the first DTS of 8550 binding schema.

Fixes: 41661853ae8e ("arm64: dts: qcom: sm8550: add iris DT node")
Cc: stable@vger.kernel.org
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_resources.c | 28 +++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_resources.h |  1 +
 2 files changed, 29 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 872bd09656b151eb9ed5eda2f9774d3095d3aeeb..9e02a92baae75803c2c12a2ca994006987c69596 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -5,6 +5,7 @@
 
 #include <linux/clk.h>
 #include <linux/devfreq.h>
+#include <linux/dma-mapping.h>
 #include <linux/interconnect.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
@@ -137,3 +138,30 @@ int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type
 
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
index 6bfbd2dc6db095ec05e53c894e048285f82446c6..ca53c01f60aef2040002f526b8f1b6a9094d1518 100644
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

