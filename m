Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBD83B2FCC
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784527934; cv=none; b=aJ9gIdxjtGDitIFojaSNC+rFvBzBAxKCSgVQT5XEODZwFxB8hMI6oETdUpLwESCHZ01yVzFkE7O8vMwFrvSP8kyEvbj4zBCYV3s4KXpizn2oNach5Q1yzJBLLUdx7tejygVi06zhWtolw8FUB9GhRSbYSdQnMZ/VlukF2oQE7Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784527934; c=relaxed/simple;
	bh=5rx35bWSep3xN4RUyD5mNpeVVVjnUrXou8AE1KSwoCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pjUPM1u9K1aehG0ME173FL24ZzbMtk9xFFzy8uG2/zNigEY8029NfZpfpAKUm/LjwltPuAx9bh300du84g6cMQAggEYABjKKlG4Yn4ybr3YHxQx1HqbWDALi8F5Htf4yL7j58YsnMmxVrrFPxVVX2Nro7idnhF/6xP6+AQAeoUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AcE2U1Yl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ExJoaQCi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AcE2U1Yl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ExJoaQCi"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNst78565445
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s8YKg6IaKC7m0qneFSX4THum9YhnLsBA1sZ5MrH5/YI=; b=AcE2U1Yl6RWq5HE+
	OA3auvOJAR12m2YxiGcGzeHD7HZh4oeUTPJ8cXHS0bVNuAdNqWm6VVwUrlR5DOrX
	kJsISXg+VrpySxShB1exTvk/zG9yD1HsjAWU4abFu3avN7L7nYyV2+V/rPY7coA4
	zaqSGv4H0ztrsYDSRdwVy6F25zH2iRgflEGzK2bnAt4wUUaKnDr34PaIvcF9YdXo
	rGfqcHppUt0HSwYv6mvrjFSzKzu2ldfzPg+nzJMLt+h2Tgd1GP17OXsfozq82SoZ
	nQwd3tzsVMNv2UwoUbGzq6+vJkCj8hWbe4FqaLPggKsFGipxdWSj/4yEsGY0EbQ3
	2L/Gkw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2s7vk8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:12:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8e97889ac8aso159218876d6.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 23:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784527920; x=1785132720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s8YKg6IaKC7m0qneFSX4THum9YhnLsBA1sZ5MrH5/YI=;
        b=ExJoaQCikwX/QOQLn6Gdd6Xqi7TEPRgFdwWl+s2F0syogJ90NSCBi+ARyciGtT8lHI
         BoOP6RTLLEh0rQrHTtlgh5vCA1C31e/cEPvFb/MB64MB/5vYKqRamxsNd77IdcljsRA7
         ZaWzaHaE3cU2OjGLrsGd+QNALaOdJ5k73B9NutNbItQbGeAHyFU0Ayj+Zgb+thJ3fWZr
         MXGm/mM0XYX8BcAzsE1lQaS3Gl8iUrxA0K2MVXylB+nX7bpQ7BEiTr/vqts3ixvEkL9G
         eWpZd4qY5Zw3QsViVtBY1cQsgFRQyKwXdp2EZgx+SKCEg0PF8BroQLGNgA9JfsipyPug
         X0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784527920; x=1785132720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s8YKg6IaKC7m0qneFSX4THum9YhnLsBA1sZ5MrH5/YI=;
        b=relYuTLHqgLq7zeoGVFDaWI9/JSyRgWZ/UeZd54YELAYlim9/bFuFQ1cngnhp9ePfG
         5a6jOSRgxbVWyVYSPbwS19cI59Cqgq03uB3hi+oXK71Rres9eJTOJa/U/nIxqYi/mQbJ
         /vtIfhgBMT5/XePuuDUL111Q7wHuLoE0VE5QHZ3+pw+LtCsRJl7rBLFE55XkbGpsmDC2
         GKV+mLnTjMwimPghSuw/G072+OeHIL1oLwj/KUkjx0svhVlhh0suZT6/cvjCQTyv/ga/
         wkXkH1/zuXsJbLCqh7AJqqKCtQjVflQ8SRXFGWanaX0+O7tZIeimWr1ebbk2ashYVOam
         oz5w==
X-Gm-Message-State: AOJu0YwKeP60rnILbzRJmZnlKxpMqGq5tlSYp+dLX4WJhhA+sJ7u+mkL
	GgDqk+tA/Em8LuarSAWXok5YIvhml0bAXEuz4VqkKdFa8+hmiZfb84YGVfMaoujNVusicxt5kgU
	6cEz2L/kigshsZcRXQqvTc+ZT1I1brB/SCqrNbdMghAjXRCasv+vt/oG9IouH5Egv46oJ
X-Gm-Gg: AfdE7clu4uSf9Th39b7SEWYleKQTdgmbqqKyO6sTHIAh5wvSFDwJqLNEic5EIqKmIWL
	qwf5mbY7F2IB02RhLMVSZ8yHFacoKP9eWEBGHYqUZ+FdE0mjm0DVce48hrCvclzzt7hp6N4aDGu
	BmaOKPkH37ZXDtVoj1RgOttErhuTyyVVtvhtCiAWY/vTZQTdO2cYemZ3JSyL/Sd8VgoZsyKIwTD
	+H6g9bJY56kKT/08zP1dqYe6+lfy90vFST9/uNFpo6Lzl4Wc7AC70Wc3em4BXtNvefrNhRMLmn2
	BQ0BMaoqw4LCuOB9BNdwsRNxQEtMqrGMl0ol7U+nrpMg88ioKawJs+BOo/lkPk8gSdMTkgoT3XD
	3c5epDDU9Kol20XQGI2+7BudX4MvyyqCB+xfz3XNlPg9g6ySHG3iZIkWswH6DlLk=
X-Received: by 2002:a05:6214:c87:b0:8ee:efa3:4466 with SMTP id 6a1803df08f44-907783761bamr126610496d6.28.1784527919809;
        Sun, 19 Jul 2026 23:11:59 -0700 (PDT)
X-Received: by 2002:a05:6214:c87:b0:8ee:efa3:4466 with SMTP id 6a1803df08f44-907783761bamr126610376d6.28.1784527919447;
        Sun, 19 Jul 2026 23:11:59 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90778588a39sm84793216d6.20.2026.07.19.23.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:11:59 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 14:08:22 +0800
Subject: [PATCH v8 15/15] drm/msm/dp: pass panel to display enable/disable
 helpers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-dp_mstclean-v8-15-bea261bf4e7d@oss.qualcomm.com>
References: <20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com>
In-Reply-To: <20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784527840; l=3650;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=5rx35bWSep3xN4RUyD5mNpeVVVjnUrXou8AE1KSwoCE=;
 b=9efT/qG81EEi+uKNli7LulrsXg3ziNpwjh3xhB+lKuMhE88HpsM9E2ogd6lKku6bcEOAuDMmN
 JoGJ0qHa069B9hoplrk7MPRQCRJ27x7b94BUElUR1otrMC4OpZZKFm/
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA2NyBTYWx0ZWRfXyphaklbaWpEd
 hrnHMlKwjqXGhlQddaeNqOAyKLebhIMiroDEEEXj7XL/vehDi8Yxdx3SGZOAGooGnmmD1BkzCtv
 CSqfH5XmsnxeXm29ai7eQKjj/kKYLSOSkRAnA4I/8ZdA3qszqEopML79gB70hQ9H6QLRzSjcuxv
 1/PHqrjgfXsUVSmtlESstVdcgYPwYjIzcZvf/Q42TzSvBj+BqctkIBfpUc0px4LE8WKDeb289Qz
 HSlYl5bJx8fDleo1IDjk+HqVnGZh1qUJ0wJJjPrtOhLilR6/InZKJEZV9EFrjuhQl0B4bSIviEB
 943L5yl8FhZOvoVu4PK/WSf22sWxAFRoyqWqGbt+yprrw15Pd6UoAFxz/AVeTHbX4Mz0G4F9MvT
 DkbjCNdhPgeZYlDN0ofiBplS+yoNzZcbRDm4OojrEuNbAuXvQeN3KyXAITIwyZR7clM3Z8NWy5H
 ysfmUlE5fxOj/Wj4ZlA==
X-Authority-Analysis: v=2.4 cv=eKsjSnp1 c=1 sm=1 tr=0 ts=6a5dbc30 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=7Bdkmk_NF71dONvui9QA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: IHeGwjvXTrIjQDq1vj1ryO1oQYIL-CFu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA2NyBTYWx0ZWRfX0VYbzBxUD/hE
 nJQJvTnBFt2wxgBr7lsR0GydHnsbzcZiUekzpT3IDz7mv8WxcC+gDd82fHmQVkUqxbieH4Mw6MP
 FKTmH9kmfW6j5PaUHcseS2Sfn1iO/+I=
X-Proofpoint-GUID: IHeGwjvXTrIjQDq1vj1ryO1oQYIL-CFu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200067

Pass struct msm_dp_panel to the display enable/disable helpers to make
them easier to reuse for MST stream handling.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 74d885e38b8c..c31d155715a1 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -652,7 +652,8 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
 	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
 }
 
-static int msm_dp_display_enable(struct msm_dp_display_private *dp)
+static int msm_dp_display_enable(struct msm_dp_display_private *dp,
+				 struct msm_dp_panel *msm_dp_panel)
 {
 	int rc = 0;
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
@@ -663,7 +664,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp)
 		return 0;
 	}
 
-	rc = msm_dp_ctrl_on_stream(dp->ctrl, dp->panel);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel);
 	if (!rc)
 		msm_dp_display->power_on = true;
 
@@ -709,22 +710,23 @@ static void msm_dp_display_audio_notify_disable(struct msm_dp_display_private *d
 	msm_dp_display->audio_enabled = false;
 }
 
-static int msm_dp_display_disable(struct msm_dp_display_private *dp)
+static int msm_dp_display_disable(struct msm_dp_display_private *dp,
+				  struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
 	if (!msm_dp_display->power_on)
 		return 0;
 
-	msm_dp_panel_disable_vsc_sdp(dp->panel);
+	msm_dp_panel_disable_vsc_sdp(msm_dp_panel);
 
 	msm_dp_ctrl_off_pixel_clk(dp->ctrl);
 
 	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0)
-		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
+		msm_dp_link_psm_config(dp->link, &msm_dp_panel->link_info, true);
 
-	msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
+	msm_dp_ctrl_off_link(dp->ctrl, msm_dp_panel);
 
 	if (dp->link->sink_count == 0)
 		/* re-init the PHY so that we can listen to Dongle disconnect */
@@ -739,7 +741,7 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 }
 
 /**
- * msm_dp_bridge_mode_valid - callback to determine if specified mode is valid
+ * msm_dp_display_mode_valid - callback to determine if specified mode is valid
  * @dp: Pointer to dp display structure
  * @info: display info
  * @mode: Pointer to drm mode structure
@@ -1439,14 +1441,14 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	rc = msm_dp_display_enable(dp);
+	rc = msm_dp_display_enable(dp, dp->panel);
 	if (rc)
 		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
 
 	rc = msm_dp_display_post_enable(msm_dp_display);
 	if (rc) {
 		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		msm_dp_display_disable(dp);
+		msm_dp_display_disable(dp, dp->panel);
 	}
 
 	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
@@ -1481,7 +1483,7 @@ void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
 
 	msm_dp_display_audio_notify_disable(msm_dp_display);
 
-	msm_dp_display_disable(msm_dp_display);
+	msm_dp_display_disable(msm_dp_display, msm_dp_display->panel);
 
 	msm_dp_display_unprepare(msm_dp_display);
 }

-- 
2.43.0

