Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B81F428481
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234146; cv=none; b=D2RWaRQs7l+zc61UPEVycwXhsv4DJIKYvxxFJdMRSDX/ievZ+59uREWF7czUU84oAmOX9by7DjMMTZWCZYEhYSUjF7mburPW+2GX9sOGod3L1bAvBwjOuTAwSdN8pMpg/pqTmC979/vfEiLgSpg2Ik7Fz8Np/+9qu80x3Gf0QJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234146; c=relaxed/simple;
	bh=6mk/PoXLIhw0ITD+adGc7mL5KXxIo1jFmaML+IIWZms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E73hRHrKe9QD1tslN7LEKci8N/764jS0JwiNaqXVnP88JpHEfQSNzMEhXQKykh38OTWReX8AOrrx3bgk+rzVERPyDKIA0mEXbF0jsITZtlgL6ZcslOgzpZTh4KIhRpHg/dWcgIpc0ocYW5+WitxJgk+1lac1DVLxhkTAEfqYTQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gs4+pObe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OOguwz0b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gs4+pObe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OOguwz0b"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82Kmt2359333
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dEgBbhLWo+6BBjEmNJGllK1JmefhGWnjeDK6DcbRo20=; b=Gs4+pObeTIlv7vmM
	fJ7xT+jRGZk7601Nc412WIS5nAg8BYNGsFAYpL7F7h3C4J2RTf2ObL5OfKq4CPqv
	IN3TNueslBLRBND5ASTQed1ToRyktwJPzmBEOsEA2+KPq4vnabTRGjbc5ifs4iMl
	hgFQZTB2UzB1St3RTzJTnJH3YseZ20kzNUUSfJS32f2gwC5StNSLtwgnTtvm+lNG
	VaQjrzEzbjQ4rydRpuJA7ugi5magUsHaudiAfF59vZymxL7/+NonqLQYCyzmRpjg
	Sg3lNvB0fLNzhS0QftBLXzFF/qzAG3Sr+wtlcinuU3z3QyzhP0vfwC6o/z1g+9v1
	CEk9gQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn3y1ed7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9077b4c35c5so82720526d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 03:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785234143; x=1785838943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dEgBbhLWo+6BBjEmNJGllK1JmefhGWnjeDK6DcbRo20=;
        b=OOguwz0btCaS7fD1gvvCNv+EdYhvgMK5ohznvJo1NZCmSE57baTYbpTJFP8KlwcNah
         0Miq7zZ7CoF7Dtr/L6Dn/z4VhWwOxPvP7XxynuG/9GA7D+EJlxyDiWaP5TmyTVPrdZEE
         J6krToIK5OurHsFM4YaOQWEb8LdsiSHJw85ek3xJyrowzZpIExrF3uEOZ/jhlGo69RxN
         9Cic92JvxKoDm69c7FX82J402xQjyBmVKRdns6WABhkQbqBZTrwyy9YI/kgPxZEnu6qr
         OK0FTO8wcR8Bzm/LjdhS1QiCLIlMEY7gVe/40k6AzD6Uxj7N/F1RzTEyfCb/w536S94y
         JlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785234143; x=1785838943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dEgBbhLWo+6BBjEmNJGllK1JmefhGWnjeDK6DcbRo20=;
        b=Ta8LZNa0FjeYp0o/OK+sjUcnhivP4WXOIPDLX9rzqws2LhDYX07gyLgAyasUEt8zYe
         1q636HX9OwUi/zVKSUeH5jFsGztu0sQh9fDuEtODT3cL1AYDr63i1MX6AB38TKUYbaNg
         0k8zfeJM8YIjTdW7CSw/ilYMoAUVlFLYcBt2Rr2EBtJMpAVW5C0NPGQjlkSDU9F08iIa
         /DRgwprbJmLVBRnjsRsgqDjRMprSiOmlQUTs7jeAy6Rj0s3O271YKrrRgY6vQCLToIqU
         kc+DfEOkR4JZhd3B2njIdJfxCo1SjPMsPXIdKPp+sx9jdEtRrZthv2zHlZGBhTv5VWNI
         gKwQ==
X-Gm-Message-State: AOJu0YyBXfYZJrB2u6dnbFSFtLEuhhZX/I5qtkF4pi9WDmDPzN68LRgk
	aBIdItSFLgkLZA+IMdvPP663RezRfTZwkXSsXjwPcXDp9obnXSJyIhw7dsXN1ffbRo18uoCaHva
	YHZipzM159EXZkNGlf7BtPRFQjdj8GGZOwkav6GnDD7WV+quX8VLs1mqGnwAiwdZgbZRh
X-Gm-Gg: AR+sD13NcmOBchkSs43PFYSdKBs/e0wlJkRdq1VG0bPFja9nMAhlJnB2nmKzA/xf3vv
	//BA1k4qMjHkDD2glmB2stU1WrgvnPtmvcvVSDf1vVoO2zZL21wwbBsLAFKsnE2xy7mpdhtK3p5
	9bje87uradIOJCiy9TzJOR7uOvZpQCbeWA89T08Ai61QUmo8HcdD18lY5aPNBEOoWps38wPJhbl
	Pa/62SUHUuaR/9+MKTGDWdzdDUw1ewc9SejI/Wcz/ZzZoqM55XI98G8bg/4ZwmKe5qXwSl6H0m4
	VttOcH93wJIhc7tRwBEm2ZyszWtrrSZWPCWD6O/qKHBHOnj/6Nz1mApFv78IkyHGlvKwBBJFky+
	P0oO2xdzquODpAlxQRVMLByVsETeHRTRd88MGxwrEOuQUa87PErqpUSp5v0GldAo=
X-Received: by 2002:a05:6214:3d99:b0:8e1:4508:ee58 with SMTP id 6a1803df08f44-908172b3c28mr17238426d6.40.1785234143406;
        Tue, 28 Jul 2026 03:22:23 -0700 (PDT)
X-Received: by 2002:a05:6214:3d99:b0:8e1:4508:ee58 with SMTP id 6a1803df08f44-908172b3c28mr17238026d6.40.1785234143035;
        Tue, 28 Jul 2026 03:22:23 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e869ba73sm84791396d6.25.2026.07.28.03.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 03:22:22 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 18:21:38 +0800
Subject: [PATCH v9 09/14] drm/msm/dp: re-arrange dp_display_disable() into
 functional parts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-dp_mstclean-v9-9-f7779fce10f4@oss.qualcomm.com>
References: <20260728-dp_mstclean-v9-0-f7779fce10f4@oss.qualcomm.com>
In-Reply-To: <20260728-dp_mstclean-v9-0-f7779fce10f4@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785234095; l=3890;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=RsF+yW3Msa3coKJSAtohUOHV79wFxjILMeiibWSV2AA=;
 b=h8q/J03hPk2xyS9hQcrUH9M6orPLA2Ns7ztzWF6I97C+inPhQznOBHZzwbmGjGzrd8OzbhZfo
 /PD2BTjwKPGDF5+KI/5MB3VVBzcEGWr9cjpLy12+A3fQvMjHCvA8cS9
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=fbidDUQF c=1 sm=1 tr=0 ts=6a6882df cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=3ttbkIfPOWFMAE6HwJMA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfXwny0DWlSoMbN
 pRzQu+2+ZjQIzgQxyK2CPCIwq4VHHToVE9Eoy1tGcMVoNwCk9C987vlVhWuKbJBOTfwIeE3GOON
 ci0a1bdYUA7xOgfcrlVJHfRVv+0JvjY=
X-Proofpoint-ORIG-GUID: o_JVCBe9m1rtYm7SD_KViuIhbsFmRzdH
X-Proofpoint-GUID: o_JVCBe9m1rtYm7SD_KViuIhbsFmRzdH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfX1kQ+PRpqK7ZI
 jJeJ6CRovkWytfmMOKpFNP/M5DiGp7KE+e6iJwznZ8JZZp4Zi4Q7j3erTv+mhZxAc/ELQ3QE8L/
 5RAKRBQq+LLq8FvEWtwqOD2qNaD/fLlsNNskbbAQkKvwxGMc7vcRcrsz4Opg+F+o8u5fKs3FqSY
 9KMfyBiOoaXlwzuq5FstMp54l5nxqcqhPop2MX8s22v2/Ny0Y5+fN5i1iqNCNJEVRHqNIJ87yLU
 I9l9H+O/N2GrxvJrOD4t34vSLnQPrbuMsOA5NBxTGaxuiJlSSianF+8egX7TGzIxIhjU9LtUrbs
 gybs5RnF90lgWyUOQZRjeCLa5wZgTb4D9HOYtidaS6f/Mp9eKnuwX0jGe6+xSEmAsbFXtM7KehR
 iYR35q89zuHTpJ3FkcDka+ayNQnsBP80kig1iSuNqi7q+t4vr/0jFCMRJFXYE22EEF8I79oG33o
 2OkvUkz+90BQnkZ4Fkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280091

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

dp_display_disable() handles special case of when monitor is
disconnected from the dongle while the dongle stays connected
thereby needing a separate function dp_ctrl_off_link_stream()
for this. However with a slight rework this can still be handled
by keeping common paths same for regular and special case.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 19 +------------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++++++-
 3 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 43094dda3434..272ac3b25b13 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2605,7 +2605,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	return ret;
 }
 
-void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	struct phy *phy;
@@ -2613,23 +2613,6 @@ void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	msm_dp_panel_disable_vsc_sdp(ctrl->panel);
-
-	/* set dongle to D3 (power off) mode */
-	msm_dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
-
-	msm_dp_ctrl_mainlink_disable(ctrl);
-
-	if (ctrl->stream_clks_on) {
-		clk_disable_unprepare(ctrl->pixel_clk);
-		ctrl->stream_clks_on = false;
-	}
-
-	dev_pm_opp_set_rate(ctrl->dev, 0);
-	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
-
-	phy_power_off(phy);
-
 	/* aux channel down, reinit phy */
 	phy_exit(phy);
 	phy_init(phy);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 1497f1a8fc2f..5d615f50d13b 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -19,7 +19,6 @@ struct phy;
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
-void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
@@ -46,4 +45,5 @@ void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 
+void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d094d484474c..cd8a3b171d9d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -716,12 +716,20 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 	if (!msm_dp_display->power_on)
 		return 0;
 
+	msm_dp_panel_disable_vsc_sdp(dp->panel);
+
+	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0) {
 		/*
 		 * irq_hpd with sink_count = 0
 		 * hdmi unplugged out of dongle
 		 */
-		msm_dp_ctrl_off_link_stream(dp->ctrl);
+
+		/* set dongle to D3 (power off) mode */
+		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
+		msm_dp_ctrl_off(dp->ctrl);
+		/* re-init the PHY so that we can listen to Dongle disconnect */
+		msm_dp_ctrl_reinit_phy(dp->ctrl);
 	} else {
 		/*
 		 * unplugged interrupt

-- 
2.43.0

