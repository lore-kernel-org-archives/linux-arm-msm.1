Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DE712FF69
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 00:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790985802; cv=none; b=qQKFcooytISA/ujJ9ZAJfy2npLZ/Xiy1nG67PDk7ER0Iq0zx8+4/tY4aidrI+GFFDWPYx2ATAfIIPhpHRjcDJAvgQqiBSXYKGotgbuhTabOu8fP2CYunZRQ3O37n4pFLX5NlJ73VxhZoZll8HxBTF/PIJOVN68SO+d2rbziVCrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790985802; c=relaxed/simple;
	bh=oP3/CjHCCGN9jaJJazHsrEVHjsWzU9+MbuDsu1mNgUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D7Zvqq+cLJsp7FKZ496qdPeoHrx2+sMNaIPLt1llbnzScR1tFk7YmXlzCFiw8EYXnvHp3jYETxF8zTlR0ZMpi9FHHSARxrXuA/RYxVgj9fK/MnO0EGhAyO40KdBAHr2yeGBA+Mp7eVBBsU0pW/pgntYgwuv5Hyjw+eAU7qXnNb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S699ktkq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z7TW52ds; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S699ktkq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z7TW52ds"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NeG041504018
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 00:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sILekc2P/DM6m47lNcKQ5eIiQB1Fdkg00WdMRyn1yq8=; b=S699ktkqGAB0MCzT
	BkEgbIEmDUK7VV7q4905VtlLuJ4SCuYPY/Cm1LuLFjHuapGOAFZ3hoqiFQXpT+1n
	rDVdfIzFeDPgpsKHyq0mwi58T2YteZRI1E8qIDKVa4MHR++HlMiEV7xyAnFxXKSv
	2KtFTUEgpQcy++9qQmqbiXFUq0+g/hC5txfoL5ALjo1DRPKCaNf2MDB/KsGorBgJ
	5PCNP/rMBj5JmTv2wMojSMI46V+PoIZBhe8OVVAOYZGhi2ajuhIXdHaXKvuMeHOT
	dWYFI+52DTpk9i6OpKYHhWF6CTjNmrJmow4PJRaWSAIbnvIzeB9m/RarjEq3+QLc
	impxww==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2n2rrb0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 00:03:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so21862685a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 17:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790985793; x=1791590593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sILekc2P/DM6m47lNcKQ5eIiQB1Fdkg00WdMRyn1yq8=;
        b=Z7TW52dssUg3G4LXCv3xX/5kZycsLxV887J9VdjWWXR1oslxd6XyifDzSOOJnOLLQ7
         Bc/9ZmuGkn4cR+s8lS40MseV+1pUGu4M3zhAP/XpcpfJlLxrsLQFUUMeBCKmPwUF4sS+
         p+U3aUUJ2pWL21tonABuxjNORQ6WgJATDVl+vQpRatRF2r90t3Tlw5WBzppI9bNCAu9h
         kS06yBEA2Lhm0pJ90C5fjTiSYBIo+P4egflJSXC9ySqsVP5Kp7WWAy1L3+wwih2fxk4a
         B2HjwU95igUze1BgXSaXQjVT4DuN2dia3lTffSiqFs0DCG/v0pWSZa8YGkY9aNRGbzVv
         kn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790985793; x=1791590593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sILekc2P/DM6m47lNcKQ5eIiQB1Fdkg00WdMRyn1yq8=;
        b=P2sa8xQfZ1/eFhuCZpm9sjVGc/BzCJ5bNO15CZGC3GODDjnL8PrXx+tyckwqd22Fab
         dUb0nrLCQVdvGai2A4ktoQqoyfp6l9Xf1IEXRd13ATpfzfVHeCNCrTqT8XO64TmcStix
         Y9tQXa0GbjaGyc/erVyhEwB0pEHnmSi49bDHvBIvxYC0abpznobZN5iedWyKUfPwITqh
         QUkjVgH+Op3UNhUorBbLjZ61iyJHMxmf2Lu+zX7FhonRM/GJNkPhWsBP8bCc5SZQ1Y34
         Gpg1ixashU0baRfhTi+dNtpeJyFa0JhR9S2KHl1hHz6aWhjrO4uSvO3D++PfF9brqfNW
         gl9g==
X-Gm-Message-State: AFuF++mf3Vkax2fCwSHg7E3HJqNIFoUFrjgljkw3J55LLaMnSix7n2lM
	kH0ram/So050XRvmMfNyJ9mGQ7E4fRzIYAz1sYDGmwDiqHbxSybiQsE4TPofPN0UciCbjyTz6O0
	cFYuRBkm2lOWolnhMqV4ojJxXGYzbm5FC8cDhSPrxRkNkP9qKfoeP2agKdr3kDU+QpaOFjAcUnP
	6M
X-Gm-Gg: AYBFou2Vt4CxqBo+C19NcIrXTbrKhfe0xeH8BOxP7Wg5BVrCp782zhrffbM5HpP50Jm
	/keCxUIqDxXq26FEs2VgIHBXaUJHH46jUkawr3E6BIfKsO/mmhAbHDIBoLELubF5u1tengwNom9
	oW9dBPa2fadwxyafas5SAbNFNzjM5ONLk5TV9bmj8jDLD+A06LrfMKID/JJ8g5H8xQaiODhEH14
	UrGPZBnSBTRliqsa6LyhztENHeQLSWiBciVApn6v6q5y9qJUBPQHxu0/v6xJb6ilbq8ocJiIsCG
	ZGs7szQ+PWSQRb6mgmTSSg2sAoXwL/J3f3aD+6VXa3WYiQQhb2GfI6vx0pJru1RQ648kSySna68
	7rbr5pQTpXsd1FGYi7o/iOA39v+4LLiparFkYgZgoZVp/7dgKm+b1mcd491LZoZBB5yO47p9wQU
	Dua0XeAhro1CZ9
X-Received: by 2002:a05:620a:2a0c:b0:93c:6450:9cf2 with SMTP id af79cd13be357-93e50ffc937mr195528785a.28.1790985792760;
        Fri, 02 Oct 2026 17:03:12 -0700 (PDT)
X-Received: by 2002:a05:620a:2a0c:b0:93c:6450:9cf2 with SMTP id af79cd13be357-93e50ffc937mr195522685a.28.1790985792261;
        Fri, 02 Oct 2026 17:03:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e2f7b4esm14234531fa.14.2026.10.02.17.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:03:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:03:03 +0300
Subject: [PATCH 5/5] drm/msm/dpu: enable quad-pipe for DSC and dual-DSI
 case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-dpu-quad-pipe-fixed-v1-5-6a6a00917b71@oss.qualcomm.com>
References: <20261003-dpu-quad-pipe-fixed-v1-0-6a6a00917b71@oss.qualcomm.com>
In-Reply-To: <20261003-dpu-quad-pipe-fixed-v1-0-6a6a00917b71@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jun Nie <jun.nie@linaro.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vinod Polimera <quic_vpolimer@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10118;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=nrrCgDrgJ3C4199iiuNCZQkWqWXFAYcwqICxwBeXlkc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEY0A9vFa0uKxgWB1iy8vYpX73eJgB0BRQ1o7
 is9miNJTnCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBGNAAKCRCLPIo+Aiko
 1XChB/0aT++k1Lc/ko176+LkQiPfP8WBsnSVnCMx3ceNTjxtUezt9SDxjQxQykcDsh9gPvkDOH+
 j7X7zRxmTwm2m33qOr7plv0wwMtgqRfeVOoiUls3LG1rGhrlWakZhLtrcOoUMJM7lH01c3FzpI0
 eUCZ2EFVNUleekStV0YJ9OgmB/uBguD31ePYn0aKcWuJC5qKDY3Ci+ClRoVjxpuX/SLxMfK1vao
 4DkHQXpnEyK5o7FVKhNtJNUVZWbnOm8jCv2Ok1XJPGZIlNJIMwOTxFNXzUwSTht2ficqyHmxQsG
 1/ohWkknP9J8sVvBrz7vrurqEb3SLt7IWFo1X9LkGUHsbPjd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=d/VgWhjE c=1 sm=1 tr=0 ts=6ac04641 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=jxoRB77mndzDA2bPJ-wA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: CweDq5gK_gVN0-LcxuC1L2zdv2uRPHXC
X-Proofpoint-GUID: CweDq5gK_gVN0-LcxuC1L2zdv2uRPHXC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA5NSBTYWx0ZWRfXysH25hC+0y95
 G5LNnbaheYjZBkIjI5ip0W2K8a/1bIpmzqhp72h220egHLVnePuZdAxnQjXD8mlCvAEd0Oap+t0
 DM1pgeQl6eIEJPW8ONvGn9HPYI6GLqU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA5NSBTYWx0ZWRfX5F2HTFrZiXRS
 JHYrlPtxXLFejNJH1YLIHeyiFpkSzInlAaRMeIzLgT331fMGHYoN4Eea88AE+PZlhlJvqAlbYcW
 lGZGFb6aXIFfR5fwmi2NI4AvP+wPpICigZ9f9t3QgdPHd5PkvmCg5q+//mDBII9NZs3k9G/o8b8
 EJjf7QqelnrVQ0LkwJKMcIh398935LlxHQg2AyzcXTiLph7S7q1MWJrxKQermYeQwvcS73UFn6A
 USgaU5FezXdC3+SaTsEMqqUZ/4uXhycMxxg6xqmsIhTxzZoVqEMuLe/MtlPSWk8ZbuG1aAMcl8t
 Nffqd2mXt12tVdbCP1/sCF52wVDvitbn/y/YeokTE5L9wxJwQtb7Kf1Zps97Y1Grw3XDAHroTeo
 Ou3tUFL3xPrIkEZ2hflWUa8SeqkEInreN8ljAHaSMcOJSFigL+AwcLajkAAwFh5bZeo0k8f5qtO
 LP6a2I9sMoIdYSY8s+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020095

From: Jun Nie <jun.nie@linaro.org>

To support high-resolution cases that exceed the width constrain
or scenarios that surpass the maximum MDP clock rate, additional
pipes are necessary to enable parallel data processing within
the width constraints and MDP clock rate.

Expand pipe array size to 4. Request 4 mixers and 4 DSCs for
high-resolution cases where dual interfaces are enabled for virtual
plane case. More use cases can be incorporated later if quad-pipe
capabilities are required.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
[DB: reworked the mixer and DSC selection in dpu_crtc_get_topology()]
[DB: dropped the DPU < 5 limitation]
[DB: compare the clock rate per interface]
[DB: limited the clone mode to two mixers]
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 51 ++++++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 28 ++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h      |  2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
 7 files changed, 49 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 57f50a3cd9cf..0e4f2fd0a8f3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -200,7 +200,7 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc,
 		struct dpu_crtc_state *crtc_state)
 {
 	struct dpu_crtc_mixer *m;
-	u32 crcs[CRTC_DUAL_MIXERS];
+	u32 crcs[CRTC_QUAD_MIXERS];
 
 	int rc = 0;
 	int i;
@@ -1382,39 +1382,66 @@ static struct msm_display_topology dpu_crtc_get_topology(
 		struct drm_crtc_state *crtc_state)
 {
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
+	const struct dpu_caps *caps = dpu_kms->catalog->caps;
 	struct msm_display_topology topology = {0};
 	struct drm_encoder *drm_enc;
+	bool dsc = false;
+	u64 mode_rate;
 
 	topology.cwb_enabled = drm_crtc_in_clone_mode(crtc_state);
 
-	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
+	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
 		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
 					    &crtc_state->adjusted_mode);
+		if (dpu_encoder_get_dsc_config(drm_enc))
+			dsc = true;
+	}
 
 	/*
 	 * Datapath topology selection
 	 *
 	 * Dual display
 	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
+	 * 4 LM, 2 INTF ( Split display using 2 interfaces and stream merge
+	 *		  to support high resolution interfaces if virtual
+	 *		  plane is enabled)
+	 * If DSC is enabled, use 2:2:2 for 2 LMs case, and 4:4:2 for 4 LMs
+	 * case.
 	 *
 	 * Single display
 	 * 1 LM, 1 INTF
 	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
 	 *
-	 * If DSC is enabled, use 2 LMs for 2:2:1 topology
+	 * If DSC is enabled, use 2 LMs for 2:2:1 topology for single display
+	 * to support legacy devices that use this topology. Use 1:1:1 topology
+	 * if there is only one DSC engine in SoC.
 	 *
 	 * Add dspps to the reservation requirements if ctm or gamma_lut are requested
 	 */
 
-	if (topology.num_intf == 2)
-		topology.num_lm = 2;
-	else if (topology.num_dsc == 2)
-		topology.num_lm = 2;
-	else if (dpu_kms->catalog->caps->has_3d_merge &&
-		 topology.num_dsc == 0)
-		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
-	else
-		topology.num_lm = 1;
+	mode_rate = (u64)mode->hdisplay * mode->vtotal * drm_mode_vrefresh(mode);
+
+	if (topology.num_intf == 2) {
+		if (dpu_use_virtual_planes && caps->has_3d_merge &&
+		    !topology.cwb_enabled &&
+		    (mode->hdisplay > 2 * caps->max_mixer_width ||
+		     mode_rate > 2 * dpu_kms->perf.max_core_clk_rate))
+			topology.num_lm = 4;
+		else
+			topology.num_lm = 2;
+	} else {
+		if (dsc)
+			topology.num_lm = min(2, dpu_kms->catalog->dsc_count);
+		else if (caps->has_3d_merge &&
+			 (mode->hdisplay > MAX_HDISPLAY_SPLIT ||
+			  mode_rate > dpu_kms->perf.max_core_clk_rate))
+			topology.num_lm = 2;
+		else
+			topology.num_lm = 1;
+	}
+
+	if (dsc)
+		topology.num_dsc = topology.num_lm;
 
 	if (crtc_state->ctm || crtc_state->gamma_lut)
 		topology.num_dspp = topology.num_lm;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 6eaba5696e8e..455073c7025b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -210,7 +210,7 @@ struct dpu_crtc_state {
 
 	bool bw_control;
 	bool bw_split_vote;
-	struct drm_rect lm_bounds[CRTC_DUAL_MIXERS];
+	struct drm_rect lm_bounds[CRTC_QUAD_MIXERS];
 
 	uint64_t input_fence_timeout_ns;
 
@@ -218,10 +218,10 @@ struct dpu_crtc_state {
 
 	/* HW Resources reserved for the crtc */
 	u32 num_mixers;
-	struct dpu_crtc_mixer mixers[CRTC_DUAL_MIXERS];
+	struct dpu_crtc_mixer mixers[CRTC_QUAD_MIXERS];
 
 	u32 num_ctls;
-	struct dpu_hw_ctl *hw_ctls[CRTC_DUAL_MIXERS];
+	struct dpu_hw_ctl *hw_ctls[CRTC_QUAD_MIXERS];
 
 	enum dpu_crtc_crc_source crc_source;
 	int crc_frame_skip_count;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 65161efc4294..2c2b98ce1093 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -55,7 +55,7 @@
 #define MAX_PHYS_ENCODERS_PER_VIRTUAL \
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
-#define MAX_CHANNELS_PER_ENC 2
+#define MAX_CHANNELS_PER_ENC 4
 #define MAX_CWB_PER_ENC 2
 
 #define IDLE_SHORT_TIMEOUT	1
@@ -659,37 +659,15 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
 				 const struct drm_display_mode *adj_mode)
 {
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
-	struct msm_drm_private *priv = dpu_enc->base.dev->dev_private;
 	struct msm_display_info *disp_info = &dpu_enc->disp_info;
-	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 	struct drm_connector *connector;
 	struct drm_connector_state *conn_state;
 	struct drm_framebuffer *fb;
-	struct drm_dsc_config *dsc;
 
 	/* a cloned writeback taps the datapath of the real-time encoder */
 	if (!topology->cwb_enabled || disp_info->intf_type != INTF_WB)
 		topology->num_intf += dpu_enc->num_phys_encs;
 
-	dsc = dpu_encoder_get_dsc_config(drm_enc);
-
-	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
-	if (dsc) {
-		/*
-		 * Use 2 DSC encoders, 2 layer mixers and 1 or 2 interfaces
-		 * when Display Stream Compression (DSC) is enabled,
-		 * and when enough DSC blocks are available.
-		 * This is power-optimal and can drive up to (including) 4k
-		 * screens.
-		 */
-		WARN(topology->num_intf > 2,
-		     "DSC topology cannot support more than 2 interfaces\n");
-		if (topology->num_intf >= 2 || dpu_kms->catalog->dsc_count >= 2)
-			topology->num_dsc = 2;
-		else
-			topology->num_dsc = 1;
-	}
-
 	connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
 	if (!connector)
 		return;
@@ -2177,8 +2155,8 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 {
 	int i, num_lm;
 	struct dpu_global_state *global_state;
-	struct dpu_hw_blk *hw_lm[2];
-	struct dpu_hw_mixer *hw_mixer[2];
+	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_mixer *hw_mixer[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
 
 	/* reset all mixers for this encoder */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 4942097e7613..7dfaa3ed4dff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -82,6 +82,8 @@ int dpu_encoder_get_crc(const struct drm_encoder *drm_enc, u32 *crcs, int pos);
 
 bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc);
 
+struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc);
+
 void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
 				 struct msm_display_topology *topology,
 				 struct drm_atomic_commit *state,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index d24e39597f2f..0bfbce317575 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -314,8 +314,6 @@ unsigned int dpu_encoder_helper_get_cwb_mask(struct dpu_encoder_phys *phys_enc);
 
 unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc);
 
-struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc);
-
 u32 dpu_encoder_get_drm_fmt(struct dpu_encoder_phys *phys_enc);
 
 bool dpu_encoder_needs_periph_flush(struct dpu_encoder_phys *phys_enc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index f45faf87333e..ba1554095a33 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -24,7 +24,7 @@
 #define DPU_MAX_IMG_WIDTH 0x3fff
 #define DPU_MAX_IMG_HEIGHT 0x3fff
 
-#define CRTC_DUAL_MIXERS	2
+#define CRTC_QUAD_MIXERS	4
 
 #define MAX_XIN_COUNT 16
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 0e65bf5ddc4a..fd1f3e798206 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -34,7 +34,7 @@
 #define DPU_MAX_PLANES			4
 #endif
 
-#define STAGES_PER_PLANE		1
+#define STAGES_PER_PLANE		2
 #define PIPES_PER_STAGE			2
 #define PIPES_PER_PLANE			(PIPES_PER_STAGE * STAGES_PER_PLANE)
 #ifndef DPU_MAX_DE_CURVES

-- 
2.47.3

