Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2969527AC57
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 13:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791639524; cv=none; b=QCV4XDuVFLmqolg0UtRIjew3AkxVfIMPiiJi6uKVgFN6ECShliFSrcD93D2ixLO8rz8fpyDmzbrvTiepgpDx91vGl/UadJD5LN7nY8jT5L1i5j0QjZUD1qsbVKAV1lT5Eg2j8EVOAwxqPKS4TuZXjQ3PKXuTjBgGHbWLP5IX5L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791639524; c=relaxed/simple;
	bh=rmFIBBdLnwpW2eE/0l3ytGX1iuO0WIb/U+KmegawFdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S5XZxLREw33ZviZ41avTcBh3SvOqzz4JiKce+1W+DciFqa+0qRLDNCCP4fufbAZM2Ir81wAvqKUu+IfIp0O6nkW2Wdqcco/fTxoUhfSKEccT/90/MoMc2SJigmsWzDG1mFYnTX3nalEh9lJPPuADKcGGNHe/L5F9WTd43U6YWbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lnFFoJMh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jZq3gCf2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lnFFoJMh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jZq3gCf2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ACUmd3444606
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 13:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nHgDkse1J96XXA7m7gVuOIekqMbkMW4XF0e62Fe8Mkg=; b=lnFFoJMhIiExyeI9
	h4x0ut8XLz2je2DkZR/cXjPE6+o20p4RF5AYM1WmKaVX6rnweXmMuIAjGRfiFYes
	Ke7m1UpHxNt9p+lZUw2glOEbHGcBHNVhmOF7+9vDIDfRLTEpdntxjFkSFMnXdX2x
	x80nihr+tIYof4Q+AjuJmizoF94JIz3Zit6rGJuoGu33CxMKBzQYlv+RkpDv4LkU
	UgOPYNARZts08kDbxP2ZI6FVQB/MSI89gQfCucjIdr2+yDxiVd3zSiwYPkH8LSVj
	QuwZ4cz5EZ2iFHYTwdiJSPivyxyqkxpWPvKHT3+VmiWQODmFsnr91/dJNz4zW7mf
	wsSqAA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7aqmsg5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 13:38:40 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34ef0362d95so1619411eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 06:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791639520; x=1792244320; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nHgDkse1J96XXA7m7gVuOIekqMbkMW4XF0e62Fe8Mkg=;
        b=jZq3gCf2qk5rnghNp5DDEJ5iTTaTHsPR8qjFeB1Dyv6Jy79ubgIR3tg8JvNWAgIb4D
         Ze51KNDrrBmGrTBWPHcvKFqrMmLP70o740W9Toe/+Kc33mJSQPUm/1IS1x5/dmlPi1/G
         /r6pEQFxi0xcmiroSYRGjlv7F/KYYdMB1ob1pkK9k3pVMXjjhNJ7w5pIObOS/sRjehJx
         vG0Rxlqbl99YgENovnkj/Br9WT1nPUuLgYgoi7X14eD43C1+1Rls28qzJEQxIWvCLpZt
         pYKvq2ofbHMDdzWTAs7o5wiJ10mMfVBMDZa0Rf2RpRhXTpc4PGG3OK3gLaO1vxjv1zGs
         qDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791639520; x=1792244320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nHgDkse1J96XXA7m7gVuOIekqMbkMW4XF0e62Fe8Mkg=;
        b=KD8j72hM4ZlzOj0APCGnu+bL/g+iJMAO1sHWDRwbhI1jqE7SNtrDZEbimDoyPypzPV
         2D7GDW6eS8w+KR5earXW0gJH/8uDna+EjYgixU5rc0WzJCqvxJXJp+r6Lnr4uUyRVQdh
         y9xJOL/7hNjsAnx1OngLvT7o16q9ePWzIf3XX4WpWjWZhkimil4fe7k9yuPSrvbcvedo
         SBeN/dT7Pj5yZ1+HLCTWyblKlWwIdwqtOR87GfS+psrp8QOlpj2/x+D/cwZthAhfTIkQ
         hxi88AGAYjXhCXLtQojrEbdvSwGhCb6ysff9DesjpijQOORD4aUfYIFYc3joPipHdNOh
         0KPQ==
X-Gm-Message-State: AFq9FYJA5ILvBMRSC6HCGvCl9dsM/y4tcRRDCHhYiB/qPOj9MB6SWnwU
	LxLj+75f2uVc7wDprb0kI5qlkXEwSrHri42L7WnjK3Wg4YU5yqU8NNxD4ZBRuqZuhkR5FFf6t2b
	FKjR40Z0y9KVICcQ/4i9YnVjkIuFALhad7IQsSiFKOLO/wpcy3zQ4sG2bf37fPxRQdnZh
X-Gm-Gg: AYBFou13706Kx8hp/NXxAlpHau7zWEV4kBdnfwnEsuHoF/c0TsXdQEZi63ypx+BPqkh
	k/vLvtfGgsGJoJjiyPVC6WEXqH0ndnIvoQ4fqn3ZMc7RNOuDSX+uow9IEXkb9KZ0tmise0dc0bc
	mRrFiiac94Cqi8hk932AKUdl0saHU6g4O1xAan0BbLeexzuIpvDuVmVdM7eEhJ0PofiCY7S9iKv
	snSxAmgUbHp27vM42Ux+Auk0yV0plJdGJ3cLv2iPq3j93E1zkK4m34dc+GYiIJbXo/TeEdnqdmW
	NYQQlfEAL/qU711NGsSeLoQOowLFP1SBTA4j9oMbcJPqVPAZDp7+XyDx0pp2eWryRVURyyZ0BSE
	GEWbKb7+AQJRKEBJb54F2neCgIA==
X-Received: by 2002:a05:693c:83c3:20b0:351:591b:7684 with SMTP id 5a478bee46e88-3537e04271amr7620397eec.33.1791639519559;
        Sat, 10 Oct 2026 06:38:39 -0700 (PDT)
X-Received: by 2002:a05:693c:83c3:20b0:351:591b:7684 with SMTP id 5a478bee46e88-3537e04271amr7620350eec.33.1791639518619;
        Sat, 10 Oct 2026 06:38:38 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841579sm15232827eec.4.2026.10.10.06.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:38:38 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 19:08:22 +0530
Subject: [PATCH 2/4] drm/msm/dpu: add SSPP op to program the source split
 order
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-pipe_order-v1-2-9d8bd29fd78a@oss.qualcomm.com>
References: <20261010-pipe_order-v1-0-9d8bd29fd78a@oss.qualcomm.com>
In-Reply-To: <20261010-pipe_order-v1-0-9d8bd29fd78a@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791639504; l=4157;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=rmFIBBdLnwpW2eE/0l3ytGX1iuO0WIb/U+KmegawFdg=;
 b=R2KZBseePjfVkJAOeHkE5tcvy3+YCr50BkkxV1BOYcfpURVsHwkKo0EmCw80HY9MXspq/aQYn
 8awH61Fp+oeCp8uuuiOqev2jmNKrezKsRKehRqqemYL5NjGxezPobyk
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA1NCBTYWx0ZWRfX8Yv/LueffI9q
 FCZ76V+O7rgsSQ+DjNCsCl9gl6jAX4ydGTpZtnsQ5uW+k/SxoqCslJ50pfOu7ygZeI4374iJOnm
 MJQqhkJQ2zZEhd/TAYhyD0C00TgDWSs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA1NCBTYWx0ZWRfX7TaXXWI4gZJW
 AXB1+WjNRzGngDlLH2TB23f5uewjJqIo9K288PZiHyQ1mYvnUVDDC91i9FULV0kyI8bcR/tRyA4
 7cM9PSCBgs1gBw+9eNEsOqA7xdvZGRSCf792DHjuA7LyyvMk+zIRHbG5PXLF+VG8yPLftyvnHZQ
 Qe/0t8bBSk9JOIuY8FoL7gV6gNWoNu8NUa4dASyZea//MCzURwp+nG7pqUEi3gJDXs/J3+exIZE
 GCowj2sVTY/HPSS1aQ8jD2kb7E43aKDN8rt8MCiZRrk/HXQpUBvfTdk0bPLA50zbrN+P18tLmJk
 oqpJ/KIx9Peq+7nm7Rwp7qp8euM9TXDzDSoiLvopPFFb3+OKPQjXY0lzO/tdij1wqmZOqQIbOOW
 LL8ha00akgz2RQf573UMcMomeE3Xi4LBst8NCnucOJAmXLSJTIJSo5FpudMkeo8Mc9XFsHl/Vi8
 QNyCaN5tiJFXbIavV2Q==
X-Authority-Analysis: v=2.4 cv=Uq32pOwB c=1 sm=1 tr=0 ts=6aca3fe0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=h-rY-VAj1oihTiXfbOoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: yY9QGkICnQVNTy_K_-saoCIbY5CvBKrs
X-Proofpoint-GUID: yY9QGkICnQVNTy_K_-saoCIbY5CvBKrs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100054

DPU 5.0 introduced SRC_SPLIT_ORDER in bit 4 of SSPP_SRC_OP_MODE and
SSPP_SRC_OP_MODE_REC1. For source-split pairs using legacy CTL routing,
this field identifies the left source with 0 and the right source with 1.

Add a setup_src_split_order() operation for the SSPP register layout
used on DPU 5.0 through 12.x. Select SSPP_SRC_OP_MODE for SOLO or RECT0
and SSPP_SRC_OP_MODE_REC1 for RECT1, and update only the ordering bit.

Assisted-by: LLM
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 35 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 11 +++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index b5e50fc1916f..f6ec883f9066 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -84,6 +84,7 @@
 #define MDSS_MDP_OP_IGC_EN                 BIT(16)
 #define MDSS_MDP_OP_FLIP_UD                BIT(14)
 #define MDSS_MDP_OP_FLIP_LR                BIT(13)
+#define MDSS_MDP_OP_SRC_SPLIT_ORDER        BIT(4)
 #define MDSS_MDP_OP_BWC_EN                 BIT(0)
 #define MDSS_MDP_OP_PE_OVERRIDE            BIT(31)
 #define MDSS_MDP_OP_BWC_LOSSLESS           (0 << 1)
@@ -260,6 +261,38 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 				 ubwc_ctrl_off, ubwc_error_off);
 }
 
+void dpu_hw_setup_src_split_order_impl(struct dpu_hw_sspp *ctx,
+				       u32 op_mode_off, bool right)
+{
+	u32 opmode;
+
+	opmode = DPU_REG_READ(&ctx->hw, op_mode_off);
+	if (right)
+		opmode |= MDSS_MDP_OP_SRC_SPLIT_ORDER;
+	else
+		opmode &= ~MDSS_MDP_OP_SRC_SPLIT_ORDER;
+
+	DPU_REG_WRITE(&ctx->hw, op_mode_off, opmode);
+}
+
+static void dpu_hw_sspp_setup_src_split_order(struct dpu_sw_pipe *pipe,
+					      bool right)
+{
+	struct dpu_hw_sspp *ctx = pipe->sspp;
+	u32 op_mode_off;
+
+	if (!ctx)
+		return;
+
+	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
+	    pipe->multirect_index == DPU_SSPP_RECT_0)
+		op_mode_off = SSPP_SRC_OP_MODE;
+	else
+		op_mode_off = SSPP_SRC_OP_MODE_REC1;
+
+	dpu_hw_setup_src_split_order_impl(ctx, op_mode_off, right);
+}
+
 void dpu_hw_setup_format_impl(struct dpu_sw_pipe *pipe, const struct msm_format *fmt,
 			      u32 flags, struct dpu_hw_sspp *ctx, u32 op_mode_off,
 			      u32 unpack_pat_off, u32 format_off, u32 ubwc_ctrl_off,
@@ -636,6 +669,8 @@ static void _setup_layer_ops(struct dpu_hw_sspp *c,
 	c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress;
 	c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill;
 	c->ops.setup_pe = dpu_hw_sspp_setup_pe_config;
+	if (mdss_rev->core_major_ver >= 5)
+		c->ops.setup_src_split_order = dpu_hw_sspp_setup_src_split_order;
 
 	if (test_bit(DPU_SSPP_QOS, &features)) {
 		c->ops.setup_qos_lut = dpu_hw_sspp_setup_qos_lut;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 69d68cc916b2..9b9ea2e00a00 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -236,6 +236,14 @@ struct dpu_hw_sspp_ops {
 
 	void (*setup_multirect)(struct dpu_sw_pipe *pipe);
 
+	/**
+	 * @setup_src_split_order: program the position of the pipe within
+	 *                         a source split pair
+	 * @pipe: Pointer to pipe context
+	 * @right: true if the pipe fetches the right half of the pair
+	 */
+	void (*setup_src_split_order)(struct dpu_sw_pipe *pipe, bool right);
+
 	/**
 	 * @setup_sharpening: setup sharpening
 	 * @ctx: Pointer to pipe context
@@ -349,6 +357,9 @@ void dpu_hw_setup_multirect_impl(struct dpu_sw_pipe *pipe,
 				 struct dpu_hw_sspp *ctx,
 				 u32 op_mode_off);
 
+void dpu_hw_setup_src_split_order_impl(struct dpu_hw_sspp *ctx,
+				       u32 op_mode_off, bool right);
+
 void dpu_hw_setup_format_impl(struct dpu_sw_pipe *pipe, const struct msm_format *fmt,
 			      u32 flags, struct dpu_hw_sspp *ctx,
 			      u32 op_mode_off, u32 unpack_pat_off, u32 format_off,

-- 
2.34.1

