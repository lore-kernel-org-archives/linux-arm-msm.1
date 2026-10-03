Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADBF224AFA
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 00:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987457; cv=none; b=Yjw2ScNM81ecM+ssy+dHfwlrxyWbclzUXujwR9Y2BVd+yWxK7VBDH9EddQjA8ZGnZV2ZP7BriiJLgh9Jq5kvdQykeC7ZHGJIfMq/U5RCZT//qXPTNpZQPwFZXOIyv2HAMIMfOPaMr2E2lq+i3+IY2cZ++kQP2lNceKkVYvV3jpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987457; c=relaxed/simple;
	bh=9SDSxKOaGPLQHPgJJ/MJ9sA9C1jx4gbbbbOh77Pqu4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nWax/mymCHU17gOWHz7wX69h2wyBIQRzoA8by+sh57yMH07bg4iWA1TMl/UxMKTQSgyXFW5rYL7kSrzZDCg5tSOiyjd/7tmPp1sg030UGqSYZOTDfGQHvJSGQmKF3tSS6tkdm6PNY3f926II3ZtgjPo5S2e2slnauAND3YnLxzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QNJGTYJq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UqWZ2U56; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QNJGTYJq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UqWZ2U56"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NelhL3338223
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 00:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TKSzVpF9Y5u9f1YmazNZW9NP4SNsefNUw/+8xaOI3ao=; b=QNJGTYJqYbva8TwF
	BeM3Umn0WIG+tM6NsEM14V0TP8J9qt0lfoFkNpcHD/rN1qMQT9jFWEdBEwf6Ji1+
	gdHc/I2Uf7MCT/AxVT83+UE+X4zbzDMi9ehVGqLg7i0jwhPillfFi9UAMMr7EDM3
	miuJzD/eflCilqXQjmbgpb26JRKGYL5Vgyd1qeT8Wp3dYsLp+omeyvTHrW+DzbeS
	dXjQ6sBvv8c21YSlekTYWmWc8Z7CyyZFZFgiWQyEBniBIJx2gy+PoZHOfoJGwyxa
	8A5pO6KAyuOMwlpQwRihd2gAnUcUIP2+TYi5ZnD5P4xevlzfJthaYfnOEThozHD9
	GVcvvQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2aj033c9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 00:30:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb6391e89so20569285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 17:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987452; x=1791592252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TKSzVpF9Y5u9f1YmazNZW9NP4SNsefNUw/+8xaOI3ao=;
        b=UqWZ2U56UKJMWi/BKlWo9JbQmtxn8kv6AdDs69zi9c0tBoECYK9FhuQLrpeVk00i2H
         CsqqfOAjp227qAFLSjuTd0c8fiBsxQtJcrhirHNJIJpSJSEXqwXTP3fsYlYLPcOIA+/S
         pqCk/TTdyEmLWBANWzzJlW0hmPosqHgP/z59kYifDiKMplHjBMKzGidkvKkdbADGzQ+M
         a1hlDyzGgCjUyqb6Jl6n7c0LOishaaySXjdjQtIQ6fV8Uk+xA4A4MBtOlYS84C7WT/oT
         WZheLVdW5rQDO8p6kdi4WWQ0kJM2zFP5GdrNdu7tJ+I69Z/GlFy/QzvAd7qKK/py68u+
         XRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987452; x=1791592252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TKSzVpF9Y5u9f1YmazNZW9NP4SNsefNUw/+8xaOI3ao=;
        b=Rf4cQm0uM5iPG4b7hu/G4aNtAEikJNtgGc3U78WjIXsvRU0/BY/74cK4X8pe/kNb/f
         EiSg94oDa4DdjPWmY1A1D90YvmYb8FbyjXe0HM8DdsSUstf1u5gWudA4myc4C5xrVUt7
         7X01EVDGHuLKTfCQT0/Pcg+a3+CRpSBWsDofjYkRluQhDB3I9Tk/XsNV2NZ2vFSyf5Nh
         kRRV8YRyuVXqAudF6HSIQXxXHxHB4CGr9V2/RyrOrb5AhEp4kQaDR1Xcp7D5gICMOveW
         hFrkcjvxmp64GnNVcNeUWg4/NdY1Jea5k/VgTx0vWH0kcVPpVCLp1MqXYOBixQJt11NL
         3AsQ==
X-Gm-Message-State: AFuF++nECurhZHA8Xq4c8f8X69EBR4s4TzZOtJksb6Ku41/p/ZE11avt
	A5gBo9Iw4bYpmOVWhkgh4zwEtpXVKHq8vF0oyLE61zw6Z4wmeOv22qKyb9V0ljmNG7x9nPrEAC0
	6YL3lOAAIlXbwme9kFEI4Y4CKcIY1xzhBBi00RJn/utdVwnpSIm2OJgab4JQ3D31oCxFn
X-Gm-Gg: AYBFou3Emvm6ulxFPTw5ufMStYf/97njIJry+VaOsXHoWLUSUd7qjeRr1Uz+J+Uq313
	PiyurUtvs/P1qbk4vjgmwUH+WEDx0fx2nNiXaDSAIwXkZmCj4pTFI/qaEcVNoDzJCXiB92myDUJ
	fc88Ty3KdePzBsKYDQw7AnSouSD6FSz937Fv2ysJVbkrl0KcWBnqG5fGKa0/ZgxDrTPii64bmL6
	LpZlSkHkG7RO0s36T5yK334hwwKmEoYxRt4zezOSqGbFyRxvVyOYv/ezShxlBmcsCSO/ChZbfGq
	QGYtBinX+KP5tp8tq08xluXqb5WKvd7tmelh4sdCr6q6eyZuc8DRfYDolTXAZpEoizxzv5om6D/
	ooeEpDawAgxeEjIt+ckMZviorC19VqF0vxgNwK73WsipJ9v7+asaoXrQyrQ2tDyx3Mv2OItrzEv
	f+u215ZgmR21qP
X-Received: by 2002:a05:620a:a2cb:20b0:93c:9edd:7e6b with SMTP id af79cd13be357-93cf170bfbamr599119885a.29.1790987452184;
        Fri, 02 Oct 2026 17:30:52 -0700 (PDT)
X-Received: by 2002:a05:620a:a2cb:20b0:93c:9edd:7e6b with SMTP id af79cd13be357-93cf170bfbamr599116685a.29.1790987451614;
        Fri, 02 Oct 2026 17:30:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7957d0sm1133979e87.31.2026.10.02.17.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:30:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:30:24 +0300
Subject: [PATCH v4 09/10] drm/msm/dpu: only reassign resources when the
 encoder is reprogrammed
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-fd-kms-fix-smmu-v4-9-2a44d4d8ac77@oss.qualcomm.com>
References: <20261003-fd-kms-fix-smmu-v4-0-2a44d4d8ac77@oss.qualcomm.com>
In-Reply-To: <20261003-fd-kms-fix-smmu-v4-0-2a44d4d8ac77@oss.qualcomm.com>
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
 bh=9SDSxKOaGPLQHPgJJ/MJ9sA9C1jx4gbbbbOh77Pqu4g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEyed8IZzZGwq30zWZitw+ph3kFy0hD5iced0
 HynY3ZqVieJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBMngAKCRCLPIo+Aiko
 1VklCACNn7rkJtTd/eFXEXonWfW2YKR7qyLoPYl6sZPBfDd1NWWakc7215rba5CUGoGIuvVLhJ4
 atIHIm5wUuK/xGLzKdzARtyWbqBXAFbPafHGGEMdg8qv0xZATS8iOe8Ir4plnULmOxM1ZBvfKg1
 JbG9E7qIRP/KbjFp2eLEjHwsb2R0nNr+frfn3fNbW5AW+ATyhfQYdyeoij1oqCoY1z90Yw6IEae
 2K3+kMc3/0evFg6DuWGYLQw5pIQmDKOMVpeDcKcexT/eaDMzCR987ictRMLtEgG1t4qrZqzz5Gv
 Tu05Efwh020EvGg5jTmHx6Ejj9dVzbBrOflPo2i5JhaBTUJE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX51BJClfH3FFc
 83ho9OzH58hat/C2ZAc0dJCKOWua4fSsduaNNvxCN5Cl8gGi0xkf5PHuzyFhzeOptzftDMdRIwP
 QbfxYX16ejLg4wMvcGV5fndz6WKYMCw=
X-Proofpoint-GUID: 1m4w4515fK7uqmEgE15VcXc9UZU80qZV
X-Authority-Analysis: v=2.4 cv=UJZIjyfy c=1 sm=1 tr=0 ts=6ac04cbc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=A1gMwnIAOo8MrSanVxoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfXwvnZDyXHgYSZ
 Kj051MhWeTlFs+yElPErgFko6mYYHNrRKvwYC283kAbiTsBWj5WP9pOrXlhHyK++AejAf1tfd+t
 b8M051YIvhnVNKWTgmVjElNslTS1pMVl15vn0Q3StYsO6a6byA9CD74N/YHPhG9vdXdnpV9+UCR
 XIqvumt/HWuugAwTWRvQs1vB7Eh8IjHyGy6jyVJUI/rzPn+HsKhhBL7izUlTaCO4TTn8dsdmIhj
 xhqhojTZ1D0rbi6nWmc998yIM/9gPB0PEpBbrxl44qX+bGMnKJ98w+emn7u4WdLpYWhRpe1GeXX
 0L5RfcLlK7jaGhL/1bo6n2f0I7sHhUYIPDn1eWHCsnuYarVSm05DJCPAcX3uZ4QgL4v9Qu0ua8y
 lx/GwHjrQtMkkoYhwqMOGGAVg9/sLUpheqPa1+kr4dCYpIp8k/gMzdiYV/24ydpuk7uiTSwECgS
 7V8AwwRncxSLbaiFYoA==
X-Proofpoint-ORIG-GUID: 1m4w4515fK7uqmEgE15VcXc9UZU80qZV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030001

Running kms_plane@pixel-format-source-clamping causes SMMU faults
(fsr=0x402, iova=0x0001fb00): it sets a CTM, after which the display stops
updating, so the test times out waiting for a CRC and the pipe is still
fetching the framebuffers released when the runner kills it.

dpu_crtc_atomic_check() reassigns resources whenever color_mgmt_changed is
set, but crtc_set_mode() only calls ->atomic_mode_set() for mode_changed or
connectors_changed.  A colour management update therefore re-reserves and
can get a different CTL: cstate->mixers[].lm_ctl points at the new one
while phys->hw_ctl still points at the old, so the flush mask is
accumulated on one and triggered on the other.  CTL_FLUSH is written with
zero, so the pipe is not reprogrammed again until the next modeset.

Reassign only when the encoder is reprogrammed too.  Enabling colour
management still needs a modeset, as that is when DSPPs join the topology,
so ask for one in dpu_crtc_check_mode_changed() and only there.  Drop the
msm_atomic_check() hack, which forced a modeset both ways, ignored
GAMMA_LUT and overrode allow_modeset behind userspace's back.

Fixes: 39a750ff5fc9 ("drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT DRM property")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 28 ++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_atomic.c         | 17 +----------------
 2 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 2ff0dab33710..b1aea5769777 100644
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

