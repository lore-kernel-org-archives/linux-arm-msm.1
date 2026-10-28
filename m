Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793183945;
	b=2iUzJW9Lcavn3F9hPG9M8WpTsCsX3dzxi4NdNPbCFPU2w98LQ7Fv7ZW1gxesDAPGpMJo
	 x9N2VBYmAZDVnW+LJSbQg8EoqO+vqLBL0fxsuh8Bapyk2qaXFgk/jGy6ftJCK4GcWVMzn
	 yRti8wXjFAQt7FSDrs70fCkelazJ6GLNEvpYtgCE0mh8BTU5JNbCnJawl7Pogybeoxcz8
	 alhvgIhBg4mfPr8+EEFc5pIjFLmzZ8Zl7ILWzrUhvFl64Rr/p8jr+W0O0UEqLnnVQszUg
	 e01n/wZ2VFVfmC8YIlRHjFtETNivVeLfLs6z3/0TacGerv5qtOuYGLPjXEzP5daaavQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183945;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dVEkpwRchLW+AC9+Ye0UAnXpImSjkQjdIlFmsdPvXLM=;
	b=f60qOraC7eZNZO6++ZeyvP2gKqVSzYmF+lYm3CUxCjAmm0h6fYbFF7U71nCobHZaBxFR
	 ayB9LmOlhokb+q8kC9ebLCiO8CrnKeSFEIOeK1gNgknG20Yel6GP0jOgtQJsX8uTYUCAO
	 ZzvMpYyt9lREHJV9XDQ8+2GFSfzlIHWICEaTrVAPQ9lzM+2UXp6s4uPkLXv4tWKIRzO40
	 OFhgPioYOddY8memVaJKP9igw1G3nt2hZdu9KlfZQLc+DdrFtp/PpgENGUlzKDwq5YdyC
	 z4qbDvsZoNflbKchqCWT/Z0MczUGXNA9VTWFHrw04hWxszfJg4RqsiiLr6PFqgvGOcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oT7vkNZB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CWkEUxj1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD20606A322
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BD20606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oT7vkNZB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CWkEUxj1
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K9VY1642876
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dVEkpwRchLW+AC9+Ye0UAnXpImSjkQjdIlFmsdPvXLM=; b=oT7vkNZBIslN3EUv
	Swm1Gyhe3dO+Ca9Eqe/YX3+NPagls77GUT7i7cMmYgdgw9l1tUO8bPCXpI3YvkKA
	NYlTaacwnuanejFii04r4OOnz+Vo3Q5zspzdAHqPH8sL/yErlL46fv44nslANsRO
	YQmxqGOdsECpcr6W9dSP6JqBWQ3lWC1XVNWNOQ/6O9Kcy3FIj7glVxbJFJvvB58r
	zbL2/aYyFcUEvZSSJXGhJ6n2nDNe2bsm1oOZuSk+2XQstSclAumwdmZ+h3r2/304
	8eMiUf41/JbG0j3e7TyjVOZr9aSHXf5rRvHx/Bi2d+3GTAM1NNh4lkZgiIPITeHx
	XRSGxw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpuk0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:39:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36998507c13so1380341eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 03:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793183943; x=1793788743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dVEkpwRchLW+AC9+Ye0UAnXpImSjkQjdIlFmsdPvXLM=;
        b=CWkEUxj1Bl847aeaahPcBnJUUEoyt/Rwzglw5gBJfYs/MxFPzx2hG/Dl0FfVCu5kNP
         hZYpXbCugQwdS2tBknUrmS89oyja6Zocba4kdYLyN95UXV/On10pWh+ffaNcmB5649cM
         a75f3s6Y7S5nAO7vWc2nwVgcxmF3O5Z+h0kZeUs0fAsyA6mZFEhqe6bWqt+foy+YAbHV
         q7kI0+jkB/5kM5/Eozv1hP3SIYb7m2p45uysJ+Q8DjcLebjSiUrX2Swo6hz8vK7wyvjG
         WsdXUTPqhYVhfECgcah9KYl2ZBykUVM9fIpktKnxRZN8vmJZ2RCWSaXioaiH5Fnpbj2k
         N3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183943; x=1793788743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dVEkpwRchLW+AC9+Ye0UAnXpImSjkQjdIlFmsdPvXLM=;
        b=FQ1fPDBeK5iIMa+/PmyjBCkF5z5NITTpixH5F82eWGEVcuNj24spvCk2SAUNf0/ef7
         oNk4BT9Sq2l7Fa/zATZauWmTP5JXL4fWfcB04HfJVycuNU2EtO5EacUZlw0j0c3Dejd5
         aXS3dsw8o5Ms27wv88maBh7R7IMMTPyTCTjWi2wqx6jVJTGyh9rjncCjkbIVhXmqO8RU
         BcVoJMwt2mWRo3YmIKO8Mcn8VqeOO1rEXCcX+hBZjsoMhJ2t6sReLH/4gsYAxXezcZGj
         u4PUHjocMvCxLibwMevi5BGZn0YmmPy97NHI/1ngz3pDBDLO12PpowQVCC6W/AeT1cq3
         rPWA==
X-Gm-Message-State: AFq9FYIu16R8Eo/1YDM7/kK/iuGuVILZwxPEdgeluix4qJD3Ta+z67fG
	pUj3/j5Z2VVID+qzBZ7FFpJOSedG9LTez2f/u0KSzK6h9uPWazeGDLy3yghK5PkDMtszF284RYF
	Ed3sxhnoBF8UvyPJZi3UnXiPZOWVHfESkEAWG7ECxAddgK+G1Iz8XwajGLhHch68CcOzz
X-Gm-Gg: AYBFou1SQEqy5IAKLdUGvDWlKKYhQ1QKtnftLYMg8EisCtQV9GCHH5PkrGsXtjWQMOI
	8olVWgqwcPMZZPmAtFFWMiQDnjoUzRpuXU/gBWu4cd2DwOKuN8sVyHD6n3YHRvCIxJy53pfwUJl
	jQUnPqF9M9NoBkamcNaTlK6mqTd9smyz3WtAzn9vV7Hc5y9wSN8w9ENTH/47cmT3uEic7NrzDny
	A90BNaIVlfExZVeEXHfraYunvX/nx/x6TEMmBBYYLwSkq+BtGXXx+h4zB0yURKuTDfGGJ65zxfY
	pb+a7tWxnGlfK4J4KeI+uVjBAIQgSDPqH4rkZ3flwdLyjm/iuI9MuUUoXBWA0Q60mNOwwJx5TJz
	ZZGCHRYL63SM6whci8eSAh8mnc5ORmoOUg4d/nubsNxjdteogmT0Lrk0jKykLKa1hVy3a/alb0B
	k=
X-Received: by 2002:a05:7022:298:b0:19a:20d3:a3d6 with SMTP id a92af1059eb24-1a6c85d1368mr2406141c88.1.1793183942562;
        Wed, 28 Oct 2026 03:39:02 -0700 (PDT)
X-Received: by 2002:a05:7022:298:b0:19a:20d3:a3d6 with SMTP id a92af1059eb24-1a6c85d1368mr2406097c88.1.1793183941757;
        Wed, 28 Oct 2026 03:39:01 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75e5c6d4fsm8340186c88.14.2026.10.28.03.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:39:01 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:08:02 +0530
Subject: [PATCH v6 06/11] phy: qualcomm: qmp-combo: Add v8 PCS-level drive
 level tables for Glymur
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
Message-Id: <20261028-glymur-phy-v3-v6-6-1f1d2e565a66@oss.qualcomm.com>
References: <20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com>
In-Reply-To: <20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Jeff Roach <jeff.roach0@gmail.com>, Luke Macken <luke@phorex.org>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793183900; l=3473;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=Sw/ZYky4CdDLEqQ56kVf3VBPp3puE2q+tG/wrOIoOkI=;
 b=QOf2Pp20q935BMbruY039v/Akr5VHgW6GludkCp0SNgHOpzum3yZIAamoK3AKiyG96lQwZRJn
 WlklC7ydUTHDlJH/zUr32tPDMYQExlwpujL9OdTOq/TLDEPJYcn4mrR
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX1xge0Z23SqH2
 y6iyMzhSsGGttdro2iLhz7a/er/gvyXiGKuM018XKNcHUaQAXCuvLf+GWBWvFNkAbUYdSoC0VY8
 2FHLIqLHaizGlrz1cawSd8u70+dPWCdUOwySlg8IDQy9Nz1gsZF4kLockWcJ5g2/CBTs9OEb6fC
 FzGKT04QMwRCKuDtF7aQVYL+JrtrCJ4n0HIQXckqlhy5VI9EIv2DXk/mMFwI4PSZf52ej1TlgP+
 VqCcd8GVUGwkEi17x5r3KR3ee0iPFdlOsmEFTO388edR6Nl7FR2q7dLzOv1Eo2VYLf16rBmOR+X
 suVUXIVThIUMV44DpoCs8n7i6CrztwdNNF8YDYF20eCXWyZ1QlqCagoO4d8a04WpCsqPpXkEkB8
 tpi7OBQ0BGZtStLXz3vK94HREaiDH9KbLSpVd27C7qbCYtED4taLANm223Rlg5CADhnaThC5vBz
 E7RqF1/aZInAArQ1hGw==
X-Proofpoint-ORIG-GUID: AJDFi8OdE9cqrfiqRsDOW4p4K9QpXDG_
X-Proofpoint-GUID: AJDFi8OdE9cqrfiqRsDOW4p4K9QpXDG_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX5S8ONjxOm+LI
 NG2FPsZmiCzm0KRulzAh21dGdyRP1z3ys7SfEDmrTgCLKaPfu+Lip8qFfL88Q8E9qrjfNHsiXyN
 uUz66y0iQqVwadZ1hPyHgJ3MgcFjv60=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1d0c7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=mO8_gwkcAAAA:8 a=pJ9Jp-POzqCVGtXzzgwA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=InTEqNb8lIr1xazlwGwc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280042

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add PCS-level drive level tables for the Glymur (V8) DP PHY:
- qmp_dp_v8_ln_drv_lvl_hbr3_hbr2: LN0/LN1_DRV_LVL settings for HBR3/HBR2
- qmp_dp_v8_ln_drv_lvl_hbr_rbr: LN0/LN1_DRV_LVL settings for HBR/RBR
- qmp_dp_v8_pre_emphasis_hbr_rbr: updated TX_EMP_POST1_LVL values for
 HBR/RBR

Add ln_drv_lvl_hbr_rbr and ln_drv_lvl_hbr3_hbr2 pointer fields to
qmp_phy_cfg to allow per-platform PCS drive level table selection.

Wire the new tables into glymur_usb3dpphy_cfg, replacing the previously
used qmp_dp_v6_pre_emphasis_hbr_rbr with the corrected v8 table.

without the correct v8 table following issue can occur:
- Link training failures or instability at higher rates (HBR2/HBR3)
- Incorrect LFPS signaling timing, potentially breaking USB3+DP combo
mode entry/exit

Fixes: d10736db98d25 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
Tested-by: Luke Macken <luke@phorex.org>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 2a4cc45d6daa..2ca67c70b17a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2478,6 +2478,27 @@ static const u8 qmp_dp_v6_pre_emphasis_hbr_rbr[4][4] = {
 	{ 0x22, 0xff, 0xff, 0xff }
 };
 
+static const u8 qmp_dp_v8_ln_drv_lvl_hbr3_hbr2[4][4] = {
+	{ 0x02, 0x12, 0x16, 0x1a },
+	{ 0x09, 0x19, 0x1f, 0xff },
+	{ 0x10, 0x1f, 0xff, 0xff },
+	{ 0x1f, 0xff, 0xff, 0xff }
+};
+
+static const u8 qmp_dp_v8_ln_drv_lvl_hbr_rbr[4][4] = {
+	{ 0x07, 0x0f, 0x16, 0x1f },
+	{ 0x11, 0x1e, 0x1f, 0xff },
+	{ 0x16, 0x1f, 0xff, 0xff },
+	{ 0x1f, 0xff, 0xff, 0xff }
+};
+
+static const u8 qmp_dp_v8_pre_emphasis_hbr_rbr[4][4] = {
+	{ 0x20, 0x2d, 0x34, 0x3b },
+	{ 0x20, 0x2e, 0x35, 0xff },
+	{ 0x20, 0x2e, 0xff, 0xff },
+	{ 0x22, 0xff, 0xff, 0xff }
+};
+
 struct qmp_combo_lane_mapping {
 	unsigned int lanes_count;
 	enum typec_orientation orientation;
@@ -2566,6 +2587,10 @@ struct qmp_phy_cfg {
 	const u8 (*pre_emphasis_hbr_rbr)[4][4];
 	const u8 (*pre_emphasis_hbr3_hbr2)[4][4];
 
+	/* PCS-level drive level tables (v8 / Glymur) */
+	const u8 (*ln_drv_lvl_hbr_rbr)[4][4];
+	const u8 (*ln_drv_lvl_hbr3_hbr2)[4][4];
+
 	/* DP PHY callbacks */
 	int (*configure_dp_clocks)(struct qmp_combo *qmp);
 	int (*configure_dp_phy)(struct qmp_combo *qmp);
@@ -3457,10 +3482,13 @@ static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
 	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v8_dp_serdes_tbl_hbr3),
 
 	.swing_hbr_rbr		= &qmp_dp_v6_voltage_swing_hbr_rbr,
-	.pre_emphasis_hbr_rbr	= &qmp_dp_v6_pre_emphasis_hbr_rbr,
+	.pre_emphasis_hbr_rbr	= &qmp_dp_v8_pre_emphasis_hbr_rbr,
 	.swing_hbr3_hbr2	= &qmp_dp_v5_voltage_swing_hbr3_hbr2,
 	.pre_emphasis_hbr3_hbr2	= &qmp_dp_v5_pre_emphasis_hbr3_hbr2,
 
+	.ln_drv_lvl_hbr_rbr	= &qmp_dp_v8_ln_drv_lvl_hbr_rbr,
+	.ln_drv_lvl_hbr3_hbr2	= &qmp_dp_v8_ln_drv_lvl_hbr3_hbr2,
+
 	.dp_aux_init		= qmp_v8_dp_aux_init,
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v8_configure_dp_clocks,

-- 
2.34.1

