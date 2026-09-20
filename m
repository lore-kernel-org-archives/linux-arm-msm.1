Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6823443F0B7
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 13:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789912763; cv=none; b=mU9fyqqkIQmpTTZpa3E8KftZ+iEmdcHovEZ14rEPixkAq/aiWxqNXeqTw90L99woid94wP9SDPDlXbH9ZwYQH77bxO4+8xLCgNJrom7m/MjCYf0+gsBiDyUUnBDaBmT7DH61wJ3TaGBoLj9E/kS+T3zy+N3riFnSBzEiwrY6zlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789912763; c=relaxed/simple;
	bh=ymydSJJMHBeChp4mfLPqb/RHQeunYPQhirGCL58QSTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uJ0mDOvtycy3SrWU+HbjzJyersJzuo8wLCyrLVpIi3Zl0Ob+BVWYG3DpedH/TRrjyB+agcruL+J6heqqSNl0dFhXsbwQRAFEZ2HKdf6/t9nzJ4LNTYHPZoSOvPyDULufMC64pF3gSfElZcwYOEcT2f1FLjFeaIEkgIvLEyWL6xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0D4mucq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXCY4ugz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0D4mucq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXCY4ugz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBoLmW1640244
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 13:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o/tjVb+gcb3aLNsO6dqaSasNSlJxZwDGFHHxqBqYmgc=; b=b0D4mucqdjnxFSnR
	idhrnrNVtokvJQ1HMBF0UmjetA35YpJ/N4nJpcRh3RgRQmkohNlscnmpthzrbGAE
	YvFE+XJduvnjeQGOvjqgIfWkiL8WiQXLmd7lqw5INJYd2SqiUdDtNEaJNBG55HH/
	vq8aGpmIPNk7n6Zpf6ALkvSQMREMMpZFehOXNH9VuUdPNRZrI8Y1GpGc9qga4xsq
	c/y0D7dERFqioVWsZilM9HJYPLqDPEF/olLKQkXvegFV9dAyyUtIHik877oMswoe
	QTRdlCUAT2oskcdzUeCxQ+zW54EBAG+k6CgjcJHQny1I/1gjHoGgaMOLzcXHsT9N
	TAkFxA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjs83203-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 13:59:20 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9106fce784dso44799456d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 06:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789912760; x=1790517560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o/tjVb+gcb3aLNsO6dqaSasNSlJxZwDGFHHxqBqYmgc=;
        b=MXCY4ugzaKwlbmQ3kphh7hDV+mYzbkxRAPxriiBg8KMC7RMuKwBPghQ1TWDhQaU3Ai
         k4ni9i1sSkzC78TxgKTD5c90hKRZjduQGGH0+S/PnB2760SRQBCGFIEbNCoPte9JHee1
         XnYSe+/VCYRskENTX3wwogpan2hrGhOzcdE4H42VlaJejj583McMnFudNjH1NQEzcGcV
         AKV2Dr0L/QesUWIsy11l4nMf7K5v0cG4TvPToVIuEtkalhT8VyMbKrurhci6A2j+Gy0N
         JYlWnkEuA6COFIqvWggg9kyV/tVW12GHYBWvpk87CUfOW0BaWnuJxHgGWAdeLf9qzdrb
         rqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789912760; x=1790517560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o/tjVb+gcb3aLNsO6dqaSasNSlJxZwDGFHHxqBqYmgc=;
        b=iKRp17nCT3DpuP7ZS2zN0Y9Xo5mfgrVSCVHCS59kN39uj4A7mRkfgV8DKyfZb/sbLZ
         dqOMenAZ0lTr1giP/gl40EYBsEGblmz+4jBqmNoTvAL5tWhpZG8Gz/8E/sAW8j/EHuhk
         DRTU8rLt1+sypPHYdfFGpIihvEOS/7ouLTHHvco3OJuHB6giwRO47dVbhXQZGn3J6zFm
         VLos5kk0v5rW7mVsIiQH2GjtTIUYZAf9kOrgPK5RqdUuK6IEk7KrBFSX2/1KglZEvgXM
         xRbAi2DRKYwzoFobPXL7sqahPCAJkdC17GIDimGirUrS/HhAJuyeh2SvJH24qA9gPelR
         ifJA==
X-Gm-Message-State: AFuF++m8doTJRJKQEyVkpLFM24TOhgCVw7+ACPr//GcSuUCRreeVo4VF
	kFVBM/x0wi5u/uQ1mf3YgHfzw+yR02juscaMe5YYyjecOVKGPNpRE+FhrcNMhnznROPKG/9PeKO
	U6SH8zasxZQQnnOV8G8BHsm+mM8Ql7Htxu4eS1dL7f5Ov40phlSz/8IQ/8u1o36Po1Jhh
X-Gm-Gg: AYBFou3i7rrQn0dc0xlUqyDMtMI4lnlPJHwHyILWekGJzbj5IJnydJxLjSt/Z2LHZwQ
	+oxYpshRSlZMjN18ZKNj9SF01e4B2/fGM29SwiFvI7cZK5sxf48u+uL3PBnFJksxI+XsfO7zbcd
	3NrxcCi9K1QFCdOk8IyiB6fJ7hBGbllIGZ18SAQO9YsQbfHR+HGtcqYNzpL2LYVQJrttE9GhA7I
	sWZWfcuoAuZIjEn+EvWwejxC8ZR5PymePo73bUFF9rhc/essAydZN90hvCZ8H4T4ehvbJxXnCus
	BnT4Yv39cQDpUpuPW+LtuHS3xzRiFxvPFMlevqpR6F8nu1kJZnkbkuTLwFhM9ITx2bfP94AFpN/
	klgqrD/jSD+F77Lwb/5xpjtJ04/VPletC4PNf/eQv+B4yEi/+kzLEG1R20pbPCVII6QjQ28Q5Yr
	RVfhTlnBFZ4Zs3
X-Received: by 2002:a05:622a:1f09:b0:531:d52:a271 with SMTP id d75a77b69052e-532b723f187mr64896921cf.27.1789912759673;
        Sun, 20 Sep 2026 06:59:19 -0700 (PDT)
X-Received: by 2002:a05:622a:1f09:b0:531:d52:a271 with SMTP id d75a77b69052e-532b723f187mr64896541cf.27.1789912759271;
        Sun, 20 Sep 2026 06:59:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a607678223sm13620541fa.39.2026.09.20.06.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 06:59:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 16:59:13 +0300
Subject: [PATCH v3 1/3] phy: qcom-qusb2: enable autoresume on Talos
 platforms
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-fix-qusb2-v3-1-c273e75c9fb7@oss.qualcomm.com>
References: <20260920-fix-qusb2-v3-0-c273e75c9fb7@oss.qualcomm.com>
In-Reply-To: <20260920-fix-qusb2-v3-0-c273e75c9fb7@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Baruch Siach <baruch@tkos.co.il>, Dmitry Baryshkov <lumag@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1371;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ymydSJJMHBeChp4mfLPqb/RHQeunYPQhirGCL58QSTM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr+ayJOlEfhIDqd0CYd9784R82vVCvlr/+IRDJ
 AGQUxEvcYeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/msgAKCRCLPIo+Aiko
 1UViCACuTgB68G6RacTsQiuMj75YQJLMnbve1yLr/aqvhKxtsHmeaUtDvWHtndQuYBq3x1ByTzq
 fWnVDfsFqy7C+MfGn3ZHTplMemU1KJrhWZvdz/+ZPB7oqw5eVtZ9v+dgoDq/kX+0zMJn5LjdzHu
 jl2ml53ej+rTLVU/ZSLiMUs5tkPk3P5CTut61r5YpUEuQ8slaxLKE6D+CFZc9tbzWNwzWnmV4Oz
 F+KlDC19KrXtBOVbWTu5xaMhx4EVj8Bv8P8Tutu22zBBgBXzm/W9aDA6XWcaAHqaxMekJU+3w6v
 wxjKpKIIwSfPp48kvH08Tgmw0nA2w+I2KZ9iN+pdLsbH1TUP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 5KhdcolVIf-u8YpQgpL5Uh29OmBikaRt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIwNCBTYWx0ZWRfXzIgNVh3AZpNx
 bFONj0K5/g6bNPZLKHq0vBoRJA1FmI85oH0NZSQaHoxFJu8cHKtBiGbzrm/9hpEdiU6wWJYKgYc
 CYNfKgi0iFv6QE+tBrZ733pywe0PrB8=
X-Authority-Analysis: v=2.4 cv=YqWa1IYX c=1 sm=1 tr=0 ts=6aafe6b8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=RMCuox9UmI-WzXCaegwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIwNCBTYWx0ZWRfX5A9Lwr/nFTOw
 g72a0YK7RnW9XMvecR9A+qhgGDGVDoVtjElbgrI6XSv/DT6HGvKCzem8EbmPsZE4tgBVmBMDtx0
 j2Vex9/BzNcRRvQJTuS1xI2oTh6GUqyyp2SVyaSre5r4iLH6oYHL6KtAqiTC2gBxnnlZYV9IYvN
 X63GzYPcpSejBemFGzhxkJZ5iV7C3UV3dazfjwvDPRrAQgJiFIQznd4h/gaxM3+5LoqPCspmC3T
 vNTL5FRdp47mC/GQBcYfaULVsVho7wF/66912B3nShutHgj7aFjoMWD1PyCrgEsVfRi1a2/i2Dd
 TwFe8nGRGp7KLW7VP61o4jJhcpii0RmMlTQunrGdkYZ1FD1mL9AKcUMtP8RH9V+9s0aCOIEbifg
 Ks9+78IQz21cNZ7cnyeeF0qzg+TjovVKbBnFauUQfES7SxU+f0JyWI1D/kq+9CQPT2BTOnyj2mb
 tt5VqPRxG5PnwI1Mmbg==
X-Proofpoint-GUID: 5KhdcolVIf-u8YpQgpL5Uh29OmBikaRt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200204

According to Krishna, having autoresume disabled on Talos is a c&p
error and it should be enabled.

Suggested-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Fixes: 8adbf20e0502 ("phy: qcom-qusb2: Add support for QCS615")
Cc: stable@vger.kernel.org
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 2e5fdb620cb2..fc516b7cf5fa 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -347,12 +347,11 @@ static const struct qusb2_phy_cfg ipq6018_phy_cfg = {
 static const struct qusb2_phy_cfg qcs615_phy_cfg = {
 	.tbl            = qcs615_init_tbl,
 	.tbl_num        = ARRAY_SIZE(qcs615_init_tbl),
-	.regs           = ipq6018_regs_layout,
+	.regs           = msm8996_regs_layout,
 
 	.disable_ctrl   = (CLAMP_N_EN | FREEZIO_N | POWER_DOWN),
 	.mask_core_ready = PLL_LOCKED,
-	/* autoresume not used */
-	.autoresume_en   = BIT(0),
+	.autoresume_en   = BIT(3),
 };
 
 static const struct qusb2_phy_cfg qusb2_v2_phy_cfg = {

-- 
2.47.3

