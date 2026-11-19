Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076725;
	b=bbc2nygypyH1UPkQaGCgSqU+9G8dt4fpGfZqWXPz4a2B5g8tt665L1XCGSBukTCBTr7l
	 /rVRxZpiwOwIf++46J0TUav3cO4fBTOLFWiS1EQnQcyxqS1PWa8Pv3UKJyjRyrF+POFl7
	 0KlaD4A833sz+V48ORdyQFPBSLsGunFBKVwaCqx6j1d4ZIkb6GqO5ZXNGoP7oGSAjG8H1
	 ywHmGwRaRaJUz/D0yBYJahcd7PFCrWBB6fr/DJ40XdEM8YL22ow8S43NuYVa5fLBGqKVO
	 oGeFAHwr0dE2Y2Qmmuwr71ZBMESBRgdtVbVxIRQ1Ro/4Ttl6E/oW53IsXL2PUp8M9Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076725;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2NQQJCUCKgk3YATCqxgYTShGgTKSy0xN+5ygLCnYwnw=;
	b=T1l22P9OMnmoaxuKo81ZYVJCwbiRIZmv5O+Wrw3RqTrB3GcFZKMxgCiqp9cqc4AnZ34t
	 RM2mODh+XEnAZ1FLJxtR1AfRiZQH0N0XuEHeR1LjcXJcFwO0K25VV5UjqLdoPtguMGrJ5
	 W27lw1xmPuQNxPs2ss/3AuzkIyvu3MQ5n8TeRlC4s8Zrb79UIJKi/tUGOQELDn8DtDn41
	 RhgR/ABkQ1Aw3sLFQUwPYydrm9ERNfcr7o1JDkPngiTqabebtpMMQDuV5jv5v+pwZ9XPr
	 LFfmUjEQv16wqo7XvMR1AmoeVLyXNbGK0TDCOinu3C/hFtHzEPHUnt5jI/i5CF2Ihaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m96NYnez;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aKHPL3Kc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EBC606A325
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66EBC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m96NYnez;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aKHPL3Kc
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ7ZeOK3717923
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2NQQJCUCKgk3YATCqxgYTShGgTKSy0xN+5ygLCnYwnw=; b=m96NYnez1sZID3NH
	owVsgQARhDZexVeTLT7jeEuE2hQUUD0tRJ1kG07Nwg+WKankeYhQgESHj3dP6NwJ
	Rh3GkOZcC4UBoco7VD3WWUiacuUDx2G2NIwW91TGjK/f9YtHWuJWTTS+/JCJlth0
	23cSpBb3ZxaDuixuISNGRVua6GWeGP5gjJqM3gIfctib8R2qSLdAG0DPyrMdOEro
	u0FP4yJBD3QN8UFO1/SLDqWFDTLW3DXOwY72Eo0az6FC/A6w0AnY3+xKvuklHLFO
	pYjjeJ6gvoBKhbp5ch0JgAjKz0ysdiBxfWm8fm3zjlglOCVx6Jx35YllLz+t5A/N
	EESYvQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1vv2r70r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:25:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f32050e72so519850785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 00:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076722; x=1795681522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2NQQJCUCKgk3YATCqxgYTShGgTKSy0xN+5ygLCnYwnw=;
        b=aKHPL3KcWl9xZzV06HGhm+vk+mhjgqnAVZwMtyqX0lnlGPYlMD/heVSeKdLMz6DDyb
         J7vMaeudGsKWpSxLZmDOb+c1obCd6BLT4dBxG/ODEf9SERZPr5f2NQA0y5me7iq3rQUk
         m1KkaV3j00/o3yOY+hsTH+KgOnINv01cjygZ0Fk0oCWktXUOE0OCIdqnkGUPf2BLAL2p
         e9FIaScs2vmsn0mrvIVGvTduYYNyeQ12BdYfHeY94lpJATUDi113+LtektquAnky7KqP
         bK03TJHDS5IBeOJlShJdJgj5HCYNbQfl3bBFeziQ+9SyC8ZqYoECxmQeIV5hmlr4C+Vh
         Flkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076722; x=1795681522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2NQQJCUCKgk3YATCqxgYTShGgTKSy0xN+5ygLCnYwnw=;
        b=V9QAORtndsjHUfNErgazpt60JudecGV32lSNLKhnUtyMoblPZngaaO4BqulhwZNvNr
         XBHvxynKBGAcx6Ez0n/occddHiTMUMAEzaF89I+QrY777XB84cbAU1mnlsFy5NCl5q0m
         QnEnxmF2GawYUl7AGLCLqITbdp2U6o9uUAvlAQsZfQAJHNiN7GkTRUPLN3w25zjiPkGz
         ZBmvFjR8pdEAh/vaSbaqksAGYB2rC/6mRV6iZ9Xx/rhxifDb5c78rL9hpbBiVDqI1p/v
         Q+ppAau3gPhkMXf058EBDnTC5fwjCcGTxhc78bW9lN/Y8+FnKRGLhvl92Jkb7FspvgnS
         y7nA==
X-Gm-Message-State: APuU4Z8IqQRxSnvY3UjLqtTU/nSYwNF7C4lLelTcTpDn10+NfIVaAe1N
	Ztqc+kBsLvDxS+eOqYR2plwkR3CIAQ9xS4RppaxIwcGRt78Z6UI9dzyQ9aZ55sBUA9R83a9NerS
	6UGO06dTDRfCNUc01K1gFhyIG0qNdCXYIlGc2H3A5uwuE4/wD+lqoE3vSpbnCY6oI2kH9
X-Gm-Gg: AYBFou1jZNla8RhYR9HFZssqH6UyN1XoZmttPlVXAYhbinFj1UiSBboUNJNrxYYVS4l
	LlQTWlW1bXlcme/emI8L3d0/o17ogj51qqFMvSgMc9ir9653kL1IJRxB/Bxcg+cLOzs+6Twbj26
	7o8EG69mpm5oXJveaD7ewEPOoh6aA/aQkp7InmFmCX85vTI9NYdXQaILUv8TSEWAoS3ILcj1AAs
	S2RFCVSdSc7QimzaJPFZS2jHJLz6j+WKDz7e8LqPpziy4qvz5oRZoE3RFYXx6AqDhN/T4EBxSwq
	sbp15qArXSBFEMLaQHpLTTyEez5Q8Tnyp2FsiccoELEOz4kFr12i6OF/X/uMaX1K5nuvHzq41E3
	YKpX0bBEmzLUYNlCvMlgJfMoaAXnsE0hFpKWjUIFdNI/Hw7Vxif4jZtLMFLnt2JHte0ERiemlLL
	WKmE1GZtw9gvVwIg09d5udNwfoIqMUf90gYQkZ
X-Received: by 2002:a05:620a:6301:10b0:949:ad9a:c076 with SMTP id af79cd13be357-949ad9ac1demr127397285a.82.1795076722542;
        Thu, 19 Nov 2026 00:25:22 -0800 (PST)
X-Received: by 2002:a05:620a:6301:10b0:949:ad9a:c076 with SMTP id af79cd13be357-949ad9ac1demr127394785a.82.1795076721924;
        Thu, 19 Nov 2026 00:25:21 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:25:21 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:12 +0800
Subject: [PATCH v9 10/29] drm/msm/dp: add link_ready to manage link-level
 operations
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
Message-Id: <20261119-msm-dp-mst-v9-10-ca61be4edfc3@oss.qualcomm.com>
References: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
In-Reply-To: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=4145;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=lHXbJUjnv0+TY2wsZf5fppD8DzUXiA1zsh8PozRg+aE=;
 b=IbmTIzgusdeBavxDHQ2ePQOSARduXUVYH8ZH+82pZ1ZU0eN6CEwr6b3Y1FTJtCMNv/sFlag0B
 /MHt6gFNVvODvCZrZ+jftuNd5Y1hYVtHu97/OVIxNod5oZAyhcl4hpW
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: 42NwbH7HBNyIkez8GYlUDWayN1pP-f3S
X-Proofpoint-ORIG-GUID: 42NwbH7HBNyIkez8GYlUDWayN1pP-f3S
X-Authority-Analysis: v=2.4 cv=ZZWIpcVA c=1 sm=1 tr=0 ts=6afeb273 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=EJHzXNQmAnllz_DQdb0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX/eGi1sNr9i14
 Znz+uoIf1OoAo8+N08YzC0VWu5x6YeSDSNjj9FoeQ1tocoWJJL6JOK5248rEcTPu/91/nqdT6E6
 1lf7gI4OnGqBwgmxzA8Tnc36A3JIAoM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfXw7CaCcTO4QJX
 I6X2ryLgc2AWLisItgH++mn9twKG9qnLWWQ37o4UIWORNs06SdrzXwOOLDhqXkDbyYcAuZ5AoQs
 HhZVXb7XX2aPGHHxfsS2GLs4whNaB70c8FYF2tP8bR38iDvagdcKZK2opv/+HYF+HC0fvBuRXWG
 vwYcSIQiO0I/xuiMN+2j1bsO/9dMnszdAxL8QCBvM2HhVVrHmeAzOck85VVryR5pAOjf1/aGYrP
 3vnl2+Fc2qvIqM68QgjzckWqaSXf7CrXX03yWsgwhsmk8NokF0twun1foPNoJt3AxxUse/lbx13
 4KkWmK2Oh2n+ka7MeKQ3qr2UBQEk1yuaH2TIpPceMuzjMX3YeYxLhVKD1Gax9q0YIJvxuL0WFGd
 h5SuBMcJxU9upgmGzoKwflqQ1LNIGpEoUZ0Rus0Ne8AuKJ47DKkUJOLDqvOGhSnF9IBJ1czh8wQ
 UxuSWC+iVFGlQcrcmIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190033

In MST mode, multiple streams share the same DP link. Track a link_ready
state so msm_dp_display_prepare_link() runs only once per link and
repeated calls are skipped.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 48 +++++++++++++++++++++++++++----------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 2 files changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 471085744c7c..544b76e2c6f6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -645,15 +645,19 @@ int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display)
 	if (msm_dp_display->is_edp)
 		msm_dp_hpd_plug_handle(dp);
 
+	/* Serialized by modeset lock or mst_lock. */
+	if (msm_dp_display->link_ready)
+		return 0;
+
+	if (dp->link->sink_count == 0)
+		return -ENOTCONN;
+
 	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
 	if (rc) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
 		return rc;
 	}
 
-	if (dp->link->sink_count == 0)
-		return -ENOTCONN;
-
 	if (!msm_dp_display->active_stream_mask) {
 		msm_dp_display_host_phy_init(dp);
 		force_link_train = true;
@@ -662,11 +666,22 @@ int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display)
 		if (rc) {
 			DRM_ERROR("Failed link training (rc=%d)\n", rc);
 			// TODO: schedule drm_connector_set_link_status_property()
-			return rc;
+			goto err_pm_put;
 		}
 	}
 
-	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
+	rc = msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
+	if (rc)
+		goto err_pm_put;
+
+	msm_dp_display->link_ready = true;
+
+	return 0;
+
+err_pm_put:
+	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
+
+	return rc;
 }
 
 static int msm_dp_display_enable(struct msm_dp_display_private *dp,
@@ -1504,14 +1519,16 @@ void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display,
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	rc = msm_dp_display_enable(dp, msm_dp_panel, slots);
-	if (rc)
-		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
+	if (msm_dp_display->link_ready) {
+		rc = msm_dp_display_enable(dp, msm_dp_panel, slots);
+		if (rc)
+			DRM_ERROR("DP display enable failed, rc=%d\n", rc);
 
-	rc = msm_dp_display_post_enable(msm_dp_display);
-	if (rc) {
-		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		msm_dp_display_disable(dp, msm_dp_panel);
+		rc = msm_dp_display_post_enable(msm_dp_display);
+		if (rc) {
+			DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
+			msm_dp_display_disable(dp, msm_dp_panel);
+		}
 	}
 
 	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
@@ -1570,6 +1587,11 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
+	if (!msm_dp_display->link_ready) {
+		drm_dbg_dp(dp->drm_dev, "Link already disabled, return\n");
+		return;
+	}
+
 	if (msm_dp_display->active_stream_mask) {
 		drm_dbg_dp(dp->drm_dev, "stream still active, return\n");
 		return;
@@ -1588,6 +1610,8 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 		msm_dp_display_host_phy_exit(dp);
 
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
+
+	msm_dp_display->link_ready = false;
 }
 
 void msm_dp_display_atomic_post_disable_helper(struct msm_dp *dp, struct msm_dp_panel *msm_dp_panel)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index f6ebb3d409cf..b0b7570cb16c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -20,6 +20,7 @@ struct msm_dp {
 	bool audio_enabled;
 	u32 active_stream_mask;
 	bool mst_active;
+	bool link_ready;
 	unsigned int connector_type;
 	bool is_edp;
 

-- 
2.43.0

