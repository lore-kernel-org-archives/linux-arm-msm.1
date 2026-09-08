Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876EB49365C
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 15:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788881078; cv=none; b=qYJiEqCElzsREmugfTZhBFJGNckagcjo3RN6/G0SVDyvAMZ5RxWJXGtMD30c7EzYgy/Xks2XWIFALN52yS1b20mOShJDZHZamOzzNVr1ehav3rZHM5SUpFgwpWD7YpXGoJc1d//G7Hmk8hiucKindgutHEaoW2R0PpOtGCWZJZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788881078; c=relaxed/simple;
	bh=mqhM4B8gnWC0chv2JmS2nzeA441LZsa3HAirQn66G6Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mdx7V+x1uAGie2Kbtmhn6CA6VixiT2kRrA5/EGcgm0w7T3xK9+4q2PCo8k9oc58+hYUdjhrQJ12cgjxd8VJGVpS44Vi+5E5Jp0G03AwiG1Q6657kXQsEd5Ou2ku0hut8AYmAVG57y0jMRX0VDQnz6qx5OKoaeg0oP5L7VW54trU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lbRKsWQL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kMNpk+9A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lbRKsWQL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kMNpk+9A"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688F1KGm2684497
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 15:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U8Le9HTbvX+Njx4HmZDZ+JWS3P6BGRgoiPUFcnspqrw=; b=lbRKsWQLJP+EUBo3
	ipXSqVpvXN3TNSa+WSKcrq7wc6O1K2ET7ONS/9Ucsy5NFt2IjXisrif/irXtXyZF
	35/juPKlrrCvdXQFsgxVRBbyn/PjfEuJSlZ6AFd1nsvw4Wdayrw4nlZdxq6wdMR5
	lU1G6kGyNdQUUafQeIaIyCgCBnWj12rfRysIuX7R9M8N2TUpSiiHp0ln5sN6JyeZ
	u6NxuqCKUc5HuCH9wCrMwAqJ9E35tPY7MO2sBAtsRg+153r1x9Lz91jpTFBjT0ox
	sg5U/jh9y0IXMxGIp1YSdDGlybhN45FIHUklCjBZuhFM3//8GmRBcuQHv+H2txWo
	kpOTdw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjjvugpxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 15:24:24 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97c7e1d8bbeso374831241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 08:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788881064; x=1789485864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U8Le9HTbvX+Njx4HmZDZ+JWS3P6BGRgoiPUFcnspqrw=;
        b=kMNpk+9AuBTngCQEXj2YduP/A9L18+Ww8dH7+5o7d9eVKXvkFnYcgKFU0OVw4/XG2A
         OPtUAR9Ho037PG57N9YBaa1u1BaCC9s76pBtDpvk1kfh9Cpi3CBkaGHCbwME2ZRVZfoR
         7qfkTjcGJ8pxengZs/ZUyQDU0F+GHf274Couz4ygzYpEfe/VhSYwuSF9NGeVVd3tgpMc
         8/2nG+xoQSKD2WZjRy7rWZYIgfE7Jhp8g9A8YMz6BW7XcxLlVyv0qzg/iFsNWOwdYlN5
         1g9Yal2UceAbLHrN3RA4RVTZfrOsoHk/SrP8KDDiOwLkh2dJgKzNz4wIMCQyHD1zDZiX
         GNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788881064; x=1789485864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U8Le9HTbvX+Njx4HmZDZ+JWS3P6BGRgoiPUFcnspqrw=;
        b=EfSzBxUfB2kuB1v/R2r4By7nXGBOTbAj8D0iS4WIOxMx+aX9A84hZ34Vd//lz5kQ7v
         0DRgqbfYOT64ilsI0fE2ZAF8lxjngCRwHZ7ftsmmE9IiVGgKUsQEkiGWTD2r+pR40Zbk
         Pm2aeSg0uEnYycA0YJhMGqnR99cklMXJVfZl1qkTqGhuHan2wUDAmdyOSpWmkHbDbi+V
         uBqyvlLtArgtH58lho5N70DsEeXDW1427zrHbyTdudTAK2Of9sUhkjX02UNFUWV6i012
         hpQGQEIeV5r+QgPmT7dLXduR8M3eqCjQkH0G5rBlUUjWdOXad7VoCj+44y9Kc98oT6nT
         1XGg==
X-Gm-Message-State: AFuF++nNVjadmwxTh7hBZ7UQ6R43wOjz8gun3nZIxijGMBbYbEJeauhu
	Ku3/0fOiKCri+KpgEi7LhtbEIdpyFYhNr/w2pJt1uxFi407yQa7uxHiJwzsaAZDMv7sQIkb7cGN
	A7aJpEuaZvSgaWzQuCBp9p6tygDl6wj0HFW1CC+1UQ4Kgwz96o2hj/HbcGihlUmw0i3St
X-Gm-Gg: AYBFou0hzL/YukVSgLOHgXmdIGq/ilEf388KtFSBf6z47SPnPTPOiyqGVNTi/0EbZc7
	1JxK4fLy04WfOBUnO2rGjLcR4Rf7ZFxrTepZaHC1XgrtO93iCowmD7cdpaaGZCAO2jesH/yJJih
	IRJuWvFQT4FcxT+WBWZTqUMnib9HLG4wbq+q2IVlovtE5wqFwStiTo6LkP6IszXd8lqgTInAhrX
	Q8iUC/9eCQWtA8jbjKB4R5ZMhs+DFuDw8xbsLUQIu859ud6hqssibd3gdwO9z6wfZMwZfkiqs9W
	kR1bSvjDLmUXVlH1nqRPjNP74Katq4bBHXKG0xEm2BEplQDgN3A9mPVLQuJe74AFzuAVgh76DRt
	6O2awc5CYGJYGaFxys2jyxIbaw6va2LdRxTvHqkbdRdIcfsvv4aToTIvs1X/X44CZ/rSrJlpzm8
	DSFa1ip15HTd3r
X-Received: by 2002:a05:6102:c10:b0:785:bfc7:26f5 with SMTP id ada2fe7eead31-78a4a90fcd5mr9832302137.12.1788881063555;
        Tue, 08 Sep 2026 08:24:23 -0700 (PDT)
X-Received: by 2002:a05:6102:c10:b0:785:bfc7:26f5 with SMTP id ada2fe7eead31-78a4a90fcd5mr9832259137.12.1788881063022;
        Tue, 08 Sep 2026 08:24:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166fe10asm3103722e87.47.2026.09.08.08.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:24:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 18:24:13 +0300
Subject: [PATCH v2 5/6] drm/msm/dpu: only reassign resources when the
 encoder is reprogrammed
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-fd-kms-fix-smmu-v2-5-9391815742a8@oss.qualcomm.com>
References: <20260908-fd-kms-fix-smmu-v2-0-9391815742a8@oss.qualcomm.com>
In-Reply-To: <20260908-fd-kms-fix-smmu-v2-0-9391815742a8@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4595;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mqhM4B8gnWC0chv2JmS2nzeA441LZsa3HAirQn66G6Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqoCibQ4v+3xz6gXgMM67Lj25TN381/8vr2dV3L
 TPNijYSX6GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaqAomwAKCRCLPIo+Aiko
 1ZhjB/9YWAtK+tNC0VwfytRlQokdPcSIkOyZ6UViPCWNaIec8JdeF4Z1JCL6+sRD5ZpGB+MnvB9
 0SzQHxLMVfZTryBEAho+16UeAi9knWrxO6mJ73XshB/5D5Y8kzMXe+ChjW5Ni5OXePTrWUC1xa5
 GoCisPecJg2z2PCmaZvx3TtdWzc0DcfuU5TiIfT5baCHJmdMeSXvFNSUkfZ9cW/Lzjg/nIDNKxH
 hYaDwQiHkV0oatMvUcqJuJz4Vy5kRddHzUTx4iw4tPzLJEpjNVuAM4PIlMU5FVcsvjr0yHdhwLO
 EzaGPaG32UCQoff79bwTuMGVtiA1JBE0N1+jR/nsDa0CbbjV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: plPpgxzqx6DbA-L3oVhmGAZgPxEJV0ZK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NiBTYWx0ZWRfX/+KeBwXtisOO
 cLgf3rAgRzC6G93eKEulHtSYXOnAd8bOvHUDEqLs9wkkUwKcYZDFfJjoIcQrklh1SrNuif2pr8N
 F/QuFML/tcsEuaHU2bd05lpZZX0lWPFAQMQaRCnh9qojRv0pEJb7waMhjWdNAgG3W9LvbT2spsE
 WFIrarkJk7dxll0oUZco8VWf+bHxFuoLc42ajnp1SHl+uRAPjNt1T9je7367+8yPKuTMT7QQrby
 g1qQ1XsXhyH/tsXI2yOJ8XIr+h1ohpvNCmq+qjzWoNYcWNDbOxhT/kNJ+EuaZ0zCF2cdjFG63ox
 /8Z3db2qNZdZ9QxFklRkwo07l9Hc+MZlQ1UP8e6NTSIo8FDEpkf2y5qlGhLHjTD8O1fInEq1mFq
 j1Pu4kQTY9izujx+SMHnaaXLiuYtt2WUOWO5hILyC8mJ/5Oyd/Xy3UpUkxcHaUNzJ6SlZ6LtI4s
 Xv31YWAPkO8SrLcaKOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NiBTYWx0ZWRfXx7gdLoPES146
 k74moDB9G3zAwbkyeRq+l5gFMalBCHGaKECkNPQ6VHx+s4IqssH/oxKIQa+0cRvi7ttsXtsqbUL
 XaakTVX7UFZBpAt6goaEjGmvAuLG/e0=
X-Proofpoint-ORIG-GUID: plPpgxzqx6DbA-L3oVhmGAZgPxEJV0ZK
X-Authority-Analysis: v=2.4 cv=X8hi7mTe c=1 sm=1 tr=0 ts=6aa028a8 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=lVXjEyyklXRvgn5FDE4A:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080166

Running kms_plane@pixel-format-source-clamping causes SMMU faults
(fsr=0x402, iova=0x0001fb00): it sets a CTM, after which the display stops
updating, so the test times out waiting for a CRC and the pipe is still
fetching the framebuffers released when the runner kills it.

dpu_crtc_atomic_check() reassigns resources whenever color_mgmt_changed is
set, but crtc_set_mode() only calls ->atomic_mode_set() for mode_changed or
connectors_changed.  A colour management update therefore re-reserves and can
get a different CTL: cstate->mixers[].lm_ctl points at the new one while
phys->hw_ctl still points at the old, so the flush mask is accumulated on one
and triggered on the other.  CTL_FLUSH is written with zero, so the pipe is
not reprogrammed again until the next modeset.

Reassign only when the encoder is reprogrammed too.  Enabling colour
management still needs a modeset, as that is when DSPPs join the topology, so
ask for one in dpu_crtc_check_mode_changed() and only there.  Drop the
msm_atomic_check() hack, which forced a modeset both ways, ignored GAMMA_LUT
and overrode allow_modeset behind userspace's back.

Fixes: 39a750ff5fc9 ("drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT DRM property")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 28 ++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_atomic.c         | 17 +----------------
 2 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 5dc0c9aeaa5d..a3b1d2d7669a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1496,6 +1496,26 @@ static int dpu_crtc_assign_resources(struct drm_crtc *crtc,
  *
  * Check if the changes in the object properties demand full mode set.
  */
+static bool dpu_crtc_needs_dspp(const struct drm_crtc_state *crtc_state)
+{
+	return crtc_state->ctm || crtc_state->gamma_lut;
+}
+
+static bool dpu_crtc_has_dspp(const struct drm_crtc_state *crtc_state)
+{
+	const struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
+	unsigned int i;
+
+	if (!cstate->num_mixers)
+		return false;
+
+	for (i = 0; i < cstate->num_mixers; i++)
+		if (!cstate->mixers[i].hw_dspp)
+			return false;
+
+	return true;
+}
+
 int dpu_crtc_check_mode_changed(struct drm_crtc_state *old_crtc_state,
 				struct drm_crtc_state *new_crtc_state)
 {
@@ -1506,6 +1526,11 @@ int dpu_crtc_check_mode_changed(struct drm_crtc_state *old_crtc_state,
 
 	DRM_DEBUG_ATOMIC("%d\n", crtc->base.id);
 
+	/* DSPPs are only reserved during a modeset */
+	if (dpu_crtc_needs_dspp(new_crtc_state) &&
+	    !dpu_crtc_has_dspp(old_crtc_state))
+		new_crtc_state->mode_changed = true;
+
 	/* there might be cases where encoder needs a modeset too */
 	drm_for_each_encoder_mask(drm_enc, crtc->dev, new_crtc_state->encoder_mask) {
 		if (dpu_encoder_needs_modeset(drm_enc, new_crtc_state->state))
@@ -1535,8 +1560,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
 
 	/* don't reallocate resources if only ACTIVE has beeen changed */
-	if (crtc_state->mode_changed || crtc_state->connectors_changed ||
-	    crtc_state->color_mgmt_changed) {
+	if (crtc_state->mode_changed || crtc_state->connectors_changed) {
 		rc = dpu_crtc_assign_resources(crtc, crtc_state);
 		if (rc < 0)
 			return rc;
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index a8babf1dbe0d..7b480981becc 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -185,22 +185,7 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_commit *state)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
-	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
-	struct drm_crtc *crtc;
-	int i, ret = 0;
-
-	/*
-	 * FIXME: stop setting allow_modeset and move this check to the DPU
-	 * driver.
-	 */
-	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state,
-				      new_crtc_state, i) {
-		if ((old_crtc_state->ctm && !new_crtc_state->ctm) ||
-		    (!old_crtc_state->ctm && new_crtc_state->ctm)) {
-			new_crtc_state->mode_changed = true;
-			state->allow_modeset = true;
-		}
-	}
+	int ret = 0;
 
 	if (kms && kms->funcs && kms->funcs->check_mode_changed)
 		ret = kms->funcs->check_mode_changed(kms, state);

-- 
2.47.3

