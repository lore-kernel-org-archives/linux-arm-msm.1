Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CD63B38AA
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784527930; cv=none; b=htKTsFmbAHyIQ8eQIvACt2hF6bE3SdYMaOewMiyfrPP3HFVAlmAMp5yZuUxsNImwP7c2jlKAYJLRffI20rLjI4PVKVHmQ6rdZi4fTBIKRo3P8BVfxCW8NuKAHysCNXWYtzpYERDmZ0V0dPr0+gMT5/22afJ+OuMpmNtTfM48zjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784527930; c=relaxed/simple;
	bh=RNLPVjE+SfZk7j0X0e34jAzc/pfGo5F/5xEO1UBPxow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OrAGvtTlEQV14uepis1ImT6qfe3Hish+myqmy8gC7WnqNGyykWmB9GboUFB9XkZIXXk185VQzoApPTAtx42lomvLPhRSCFmpYlBXxXsO3SgFEoii43q/k4i3ftwpSPs+MvnAN1HgL6rTZG4gm7XUcAZsh/VewwflBabSwZKMp8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wqe5iLJs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZ35/W9C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wqe5iLJs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZ35/W9C"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNsrtT912628
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ylLRUd4CVKSO/kHhZcIuaA8UF2WRTOjszP/kyXRriFY=; b=Wqe5iLJsSiedL+nO
	SPsEZFQJhr/lBkR343Km51pBe1Z/QUQ3HkG/kHMlcIOrCU0CbQLz7WBG8Q8hXaiJ
	zvhjfedDVePDiOmwpFIwEeNUD4X5fizH6FV/TAqrdOYZwbxoNo6KglsaCJuMnwrr
	nopv8xv23UC1mWWSNMavIDjG8/KPsPupyNRk1fqGGVvTiCdSfqeOIK2mS3fw8/SU
	+GU/qYvnSQwSZYVSp3x+jnxu7LFOSJllh16I3qY1YIevMwX0oUtpZwqiaj2Lpoae
	xGMJP8Xm0Hh45/765pkSlXXo0nW86AfKIRd40ERXPDMaGxlWe/XFWjInqAk0KJMr
	uMZzxQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2af4mka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930a098ea19so560054685a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 23:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784527915; x=1785132715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ylLRUd4CVKSO/kHhZcIuaA8UF2WRTOjszP/kyXRriFY=;
        b=cZ35/W9CNriDHFBBT5xN2VbgIWNcWUnqR1nFmOJ/3+XyK9vvHAIwqqFFk8YrRydXRt
         DbAjY3qcG1Nfrep6N1AOXsi2kOefsQPSFCZUGS3oLO7tuDNH5YjOsTpwd/W8u6CTASFj
         B85D/Tt6jG6kGoJ4/ejs+7ibvJf/C21btoZV2JffGT7CMcKflx77mNP+HnxQpoMSbd4K
         EeunmOBAylFxWzJRz4zvzjc59ivSKB3JD0r2GyjcIggwB0oPY99cdwM06DnihdqGrfkb
         ObLvQNOw0UngbhttXY4Ai/FNPoJr1kkxgpfkXLQiKlPOp0GQELTH2EaUhYtZR4Fgk5c9
         OEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784527915; x=1785132715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ylLRUd4CVKSO/kHhZcIuaA8UF2WRTOjszP/kyXRriFY=;
        b=HWBcz7+M5Cms7pjW41qOHpJ4sSKiXEzr2pCsG/XURuVPcgY+wqgGp3By/SSSR4Mxku
         OWLIKU3MpxvTjOGmEchKf9cZbCmDmDfbL+1pse9h54O5CerCfXCeFdDCmwb5di4la4kx
         KxllZ23omebQfqYTzwBS3WWrk0OQxDKDgxCPOW3iScoa4KYye8hnFu3NKBXIMtbexnIH
         nj0NCqtsM+e7gM96S5YO5PMm+V/xoWN5cwrlQqQDyzHpAU2dEhvdCt3OQ+7GgQlNfpU/
         n49YvVCfGMR/HMmprHgL+lDWyyRqD33FP5MnqGB+WMjmHdgOVA8uhxgGfylThDHUrcDN
         p2jA==
X-Gm-Message-State: AOJu0YxK9q6Ou70rdYw8fbdaSTUKS0GAZvnf76/o+i3/9CJwF+kwsCSR
	7m+FfcUz2F8D0yxojE7tYFHqLf+vVjY6kOg7KN/p5rsDYYstiCfjR/g6kgDR+q5DMyKWigP3z7o
	OAVDuMRTr8JYz9aRVc2u6O6FAffY2ymmlxwUEcA2WkjFyiuH+ethz/VAwisjxChhF9FuTCJ3dKS
	vt
X-Gm-Gg: AfdE7cmPJP3V57pZWG/ft2OtS1R5afPiaLgU4GexqoYQr0sc6AEUxsSYC1ASqbK+qbi
	004W6mUFjYULfSFQ7rpU9cVOurHOXzyTuoPV8IIcHOYOTWwnvKc3SqqwOJlMOPg4yZhCB84VL8A
	HBEe6v1WZSI9LNWuwxAQMgzIB21BQOlM951f5tr1VR6VGPt9IHVdhc2O07IK/0XjTQ3o4APufBt
	pD5W/F3icZ7bvEw3hER1ubb5yCIMzcCU2qi7N5nwcPJKnd1tLrjj2QETBX5TOFp65byHrRvsOeR
	ZbaoRGDhJIEYNQx1f96K4Glt8AuqM6tr7ta/vdptrbusDC1Xets/zYR8xlbXiPuex2HJnvuFkse
	BcSI/EF3gk6vGQSC4MD8glXQIBWw9UEM1VHIiBo+Y2jDLslbp+r0IpJNKiXXv11E=
X-Received: by 2002:a05:620a:370e:b0:930:9a84:d90b with SMTP id af79cd13be357-930b416db01mr1277262585a.50.1784527915162;
        Sun, 19 Jul 2026 23:11:55 -0700 (PDT)
X-Received: by 2002:a05:620a:370e:b0:930:9a84:d90b with SMTP id af79cd13be357-930b416db01mr1277260585a.50.1784527914660;
        Sun, 19 Jul 2026 23:11:54 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90778588a39sm84793216d6.20.2026.07.19.23.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:11:54 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 14:08:21 +0800
Subject: [PATCH v8 14/15] drm/msm/dp: separate dp_display_prepare() into
 its own API
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-dp_mstclean-v8-14-bea261bf4e7d@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784527840; l=3743;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=mBYoC87KLINdqnZzZwKmgMGhIowtcsCVrUUNDqvxcdw=;
 b=a/BTRE6d9wccE7tbAn/n0CU6acf9zm1TIOHrJVwbItdm0fhgyPlCyZXA2XDUL/zky0LEq97xi
 sk4fkvED9iDCHwY2OxH3C4TuJaRcvD2yNCqPJTIZ0SZfgnakI4wR4pX
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA2NyBTYWx0ZWRfXy4zmPcjUv0dR
 akVd90NZReXG4nkr3/t7zTsBpEODsGWX/lso7WYZbY5l0THVjJvaBcMQjX9mriBsAQ4VDlidVlI
 +Dzqu5A1U5nnJpUAkSzUMRlcQpjtMpc=
X-Proofpoint-GUID: YUfe5AwZvbvVvxeTVd-UCS7nEmqKgKLQ
X-Proofpoint-ORIG-GUID: YUfe5AwZvbvVvxeTVd-UCS7nEmqKgKLQ
X-Authority-Analysis: v=2.4 cv=a+sAM0SF c=1 sm=1 tr=0 ts=6a5dbc2b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=rHTcTV9uYuKpyGuOXCsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA2NyBTYWx0ZWRfX1WCoucuChkiR
 9wLUM8iVVF4S4P+KJsOP3W8hBYPznMyD7T4Nj1wRVkcQ/titSk8aUBqhZJssg1IMqz+GjCnvqUY
 64PwnTnTSfKxSrtXT/wECoMEir2VnXTQOw2fo5qwql6Se1aUGwhPNClVJaQYwCjKQwICy3bS5Km
 g8uyIKqOEn3QKuv88LPn7bikT3yoZ43h70UzXIP5A2U9mgyLlSlznbAkUpjopZQlPl4G5tiltxD
 1LSO7MNnrqQB0fgLaUeDacUonAXzZc+EovB2GdUancSK4yWod7rwLeqltPRrEevxm5RuqciLn9R
 B2Pd2Z905X/q8oc0aDvZ+2EVkYjQe5XWHtkJYlPSt0Q5d9NmxBZZ3vTEA7DUW/QuDY8kvnfLm/J
 7otIbts6+NtCXycwh1cFyfh0bCk2IHlurUClNaPF59HsYrzElNgKl4LovRvPfJu/TOT5Kb+isFp
 5biAQPiV4cZsps6WP4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200067

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

For MST, the link setup should only be done once when multiple sinks are
enabled, while stream setup may run multiple times for each sink. Split
the link-related preparation out of msm_dp_display_atomic_enable() so it
can be called separately before the per-stream enable path.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 16 +++++++++++-----
 drivers/gpu/drm/msm/dp/dp_display.h |  5 +++--
 drivers/gpu/drm/msm/dp/dp_drm.c     |  6 ++++--
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index deb21cee1183..74d885e38b8c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1405,8 +1405,8 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	return 0;
 }
 
-void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display,
-				  struct drm_atomic_commit *state)
+void msm_dp_display_atomic_prepare(struct msm_dp *msm_dp_display,
+				   struct drm_atomic_commit *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *crtc_state;
@@ -1428,10 +1428,16 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display,
 	}
 
 	rc = msm_dp_display_prepare_link(dp);
-	if (rc) {
+	if (rc)
 		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
-		return;
-	}
+}
+
+void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+	int rc = 0;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
 	rc = msm_dp_display_enable(dp);
 	if (rc)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 5116f7bbbd02..43ed79093e24 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -35,8 +35,9 @@ void msm_dp_display_set_psr(struct msm_dp *dp, bool enter);
 void msm_dp_display_debugfs_init(struct msm_dp *msm_dp_display, struct dentry *dentry, bool is_edp);
 void msm_dp_display_atomic_post_disable(struct msm_dp *dp_display);
 void msm_dp_display_atomic_disable(struct msm_dp *dp_display);
-void msm_dp_display_atomic_enable(struct msm_dp *dp_display,
-				  struct drm_atomic_commit *state);
+void msm_dp_display_atomic_prepare(struct msm_dp *dp_display,
+				   struct drm_atomic_commit *state);
+void msm_dp_display_atomic_enable(struct msm_dp *dp_display);
 enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 					       const struct drm_display_info *info,
 					       const struct drm_display_mode *mode);
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index aa98f101b093..75ea52afd9f3 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -55,7 +55,8 @@ static void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = dp_bridge->msm_dp_display;
 
-	msm_dp_display_atomic_enable(dp, state);
+	msm_dp_display_atomic_prepare(dp, state);
+	msm_dp_display_atomic_enable(dp);
 }
 
 static void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
@@ -152,7 +153,8 @@ static void msm_edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		return;
 	}
 
-	msm_dp_display_atomic_enable(dp, state);
+	msm_dp_display_atomic_prepare(dp, state);
+	msm_dp_display_atomic_enable(dp);
 }
 
 static void msm_edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,

-- 
2.43.0

