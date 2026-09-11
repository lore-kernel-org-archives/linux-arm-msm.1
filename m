Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8899A49218C
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141193; cv=none; b=WyVnvc4+cF+zbj2KaevbE75JvyqXkILrmDqOdIlYRwJ0rFscBt/toaR2NS+BEhl89Nq9IFunJw0kMc8SN5Ul/TtBS98o93KnsZRzOEWhL+lMEwPbxSiIU3IfC+mzN6NYZ3iLxWh25a8oTBYp4GbKpy6L7tnTKunzyy0zbsscDw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141193; c=relaxed/simple;
	bh=UsJdTMb6bZsLoTsBJveCZxQ70+zk9Let5j5dNFvop30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EzT6/GDa/kXNQ5Fm+fs6UNigfldmukPhhbT5I6aFsa/KdYHFQVLcegNfT4w1Fz9cNGo8syOlnyVULfudoZoIeJnbhyf1xqfsAwlIOq70kUd4lAc24f5PiG4yxl1M5Uvdu7VfPHxT/nJScdiUlGoIMbEzyePVBtLozGRKfBBsDqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZNMAPedB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QUNGzCNj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZNMAPedB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QUNGzCNj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm8JA443092
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6CTqihogoF3yIPuPhTFZAPSTFdh7eb9dOeBLIBMoSAA=; b=ZNMAPedBNqVlA8Lr
	Ou5gpYxhDiC0HqQy/EQsPO5o7gYUn1tvFkbWOfd/bZW+3xBPvvgZ4RXiQcww/fwy
	53JFIOwzJVj5gQGBq0LDLohxDgBCtAxDjAgUcbP/QQiIhBiVRM2uuQ+cRsYAR8sk
	WApxk0L/HnTDo4V3tNrJrwSxk/MTZ7j2/G51kYCW//ada1Pp+JnI01kNNc1TpJmF
	eh4uEF/+ZndBgGrWJ8tj3n9Vb752K+2bKmSOIgCoejO69X28Wd0eDZCys5fPs0dT
	KxzDSPljjvkfFOD5t+/gck4yh9qSuzL3MEkxWbXeX+m6DtIPAS8osu5NDkNjVo1/
	COLgnA==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg2p1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:39:47 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-455cf15f8b5so1717393fac.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 08:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141187; x=1789745987; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6CTqihogoF3yIPuPhTFZAPSTFdh7eb9dOeBLIBMoSAA=;
        b=QUNGzCNjOTQtBGLpH9euIWIjcz/KUzn1ZNWiUfrADgdJbHBihXyZ+3khwltkoRCm9q
         V7nZllHV4cimolFLa0sxFG+yc6HemP0PBa3lfRqFLBKLP/b+FMJxxWfXeOr+oLcrWUKd
         A8/DTtqc9N66EVKoF2oRt+kCWAk7E1gMk1UpvPqrmcSKov8sljJYlfwgAsm/kwW52wLY
         Q9DxTzV4pOJVeOFSbPATZAkzAl5IWqLRGIWaNiPGXpzYeTOZSb3NjQUL0o+GO1w8rOs2
         6/DNPeJLNxdjA3viNa8mCQ/tpZcQrgG852lUA/HQifAVWrOIqy/lW5l7Wp0IinyiqSaa
         CQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141187; x=1789745987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6CTqihogoF3yIPuPhTFZAPSTFdh7eb9dOeBLIBMoSAA=;
        b=DlVrICbrVjAiXCieYIwXH/geshgIKSmaRNxA/LlU/vBHThcvBUzoUw/hAf3EqQ9hk3
         /2pduEm05iewl5WkbUvBagED2tCZQXk2/ImtJYA+dY+rMx8+7bm2b+PeYkCM238uOhhT
         wUa0WRWecVpMtnvTAppozCALaIxIK0gc8GV4PH+dIlIgxfOYf5AnZnueUJDVks/hegKc
         ajMzwhRw16TxaHZwTUpxnY+gyXvxhwYHYXf2SOERy3ua9i7c0rvz+I7tR78zmGWcD9Ch
         uYwYG04WgUQIxT4W85q0tfYsSM0+b5XHktNP7T5kZmTFe4MzGZzPu45dTg6660Od5CI/
         ZtqA==
X-Gm-Message-State: AFuF++n83yvUOfv1TQT9rT/P784QFphaL/ooX37EljlzPM7NnrVcly83
	xf/3dz4ixwu6vU+GWYFCm6S/4Ui8wKinZIqY0vI7QV5TjlXh019iP4EX8hDd2z7ZO11v+rLswFU
	AZ3mwGsLawyFUJTiV5EtzecdHctX6qYnvXdqKjr6EPqWo3XXp02E9tFccecNmvNZT6bkf
X-Gm-Gg: AYBFou0MHPbKzW29MBq8Yic6bf4EfzB23BmUmrtSSjCWJTkwP+gDjYsJ8NTcfftRO3/
	4i+/YZQURM7nfaMVMRrZV2bawsSdGQedvb51YU6TOyTWr/tZYlfQU2pfu7eeB8934kn1T+GuMSY
	s+3Qw8dwCycuzZp2XLF5IPbI6jn3FpHQ1oa+hutBuM5llOS0ZErxt8hnu3bsJfjjVssLN3wSlHN
	DFOhihRRolg9+27bVTZJznCjYpvhQGq55dHBRXMYJRbl853znabEJ35V/N97KBxj5Q17vjGuWPE
	5GfDzbgZQJUq2u2pBCg8wBXoUjGtQe/mLNepNXuFHxne8moi/XS1J/3cPWleZfLYhQD/VJNYSoE
	ehwizDM4V7mGMQw6KobVuQ3pIoyg=
X-Received: by 2002:a05:6870:21d4:b0:44d:2da0:fa1f with SMTP id 586e51a60fabf-47dd35f90e3mr3131546fac.10.1789141184390;
        Fri, 11 Sep 2026 08:39:44 -0700 (PDT)
X-Received: by 2002:a05:6870:21d4:b0:44d:2da0:fa1f with SMTP id 586e51a60fabf-47dd35f90e3mr3131501fac.10.1789141184024;
        Fri, 11 Sep 2026 08:39:44 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df90ff148sm1882160fac.14.2026.09.11.08.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:39:43 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 21:06:48 +0530
Subject: [PATCH 17/17] phy: qcom: edp: Register qcom,nord-dp-phy OF
 compatible string
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-nord-drv-dt-v1-17-e25c073cf1b6@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
In-Reply-To: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141012; l=1090;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=u2YdZt6zLxkF9NeeDFO6cI3YUG8ouytJ0A/YUYMzpN4=;
 b=1rlx3/KAdoDBmbu9KB7g/WFds2V+Ax4LJFhoRI9zajHaHZ6SisVfgNvqXrfK2Fw5H02r/Jwvq
 3GllpLpxEV+AQB0eIz4Oai2ZEMjP/Cdnf2RNtpRBg3QwvV1uRsFOCCA
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: AwHHSyFwTqg2WhG_SrnxG67Cu7HmWHbG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX90Ebcyvb5+8L
 8ffKHQ8tIkGC85djcobunVElXt3tq+DNRT0SwfP8MxLwJcSeDHkqNyLkQY59vK7AxLO2d8Z1sbQ
 zW/kVlP1sk0p5Lykhf3lBUd6W4Rtr0E=
X-Proofpoint-GUID: AwHHSyFwTqg2WhG_SrnxG67Cu7HmWHbG
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa420c3 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=o_H2acsbjChyEWv8a_8A:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX4+el/7Ozvqua
 GFH0sxH6xH6b6IAGD6mLfjfE85f2+IjoZSmm9aqQEFjEMCB+27eRjxHlMX0PnUFj8T1738Q1YDc
 mdbOaqq3VKAqYpYEv7YZlhz9sVi4fiqdkhSEcg1tcjiNVv7YY+gwEG41aRbPeUillMbALVSVlN+
 50D9JwhZs/Gb0YtWp0CkvunZqI9dQe12/XP51pJLrSuaR2T1yVjwND5/48xTnFrGDv3XfuRREE1
 uqBuyJCrtWrd6pLe8ph8hS39QS84S9W2ytp7L4xOGCGa4440SfJUi7De7H/MRj8NBzF4PrJxjux
 VmVhfD5fSDmKBmLZY/30XQxKtMgR5Hx8TlCspf0PzRLpAA0tWrFxkTc+XuKthJEJt24bfy2BLhM
 Rmo/bFx6PMY+ot738f7YWkXGYIJiNNIzHsOGx/h4WPdsHgifqvQDBpgNxJCyTuR+c8o9YeSUUod
 IpSV94URW7bMd86+MLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110218

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add "qcom,nord-dp-phy" to the OF match table bound to nord_edp_phy_cfg
so the driver attaches to Nord DP PHY nodes described in device-tree.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 338f28cb404f..f9a85ae8be62 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -1872,6 +1872,7 @@ static const struct qcom_edp_phy_cfg nord_edp_phy_cfg = {
 
 static const struct of_device_id qcom_edp_phy_match_table[] = {
 	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
+	{ .compatible = "qcom,nord-dp-phy", .data = &nord_edp_phy_cfg, },
 	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },
 	{ .compatible = "qcom,sc7280-edp-phy", .data = &sc7280_dp_phy_cfg, },
 	{ .compatible = "qcom,sc8180x-edp-phy", .data = &sc8180x_dp_phy_cfg, },

-- 
2.34.1

