Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819423DCDA4
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164346; cv=none; b=a5bx30DN1mFfBNJhQSEHWhPzq9SPOvCLHh64s3MzcWJJ27rIpJ2Q2q5DqX3dszLyYuP8jr6aIgYYKAof4R5g5d1eJ1lJ3aeggVQBqIxxLzfVJOzBinswxzoOm/f/8kluEVKDHecoGZqY0Gf7DLqkxc0PA4wKCy88f13zqUTjRbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164346; c=relaxed/simple;
	bh=uuB/kWSqCnC2Anxq2zqCZAxFvPhs/LbiFjZoseT/nlk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b8YkD3K7tNhG33tPYEZdzCwUMnjamXaU615F0kqMh5x+v80VD0Nmt6rYSTieTgIirXvk+ibMW/KiDtvlhnEIdOycQbAxivMIyfMaiYf9/575uKH3SdkdRgXJ5KdO5hQbg+FwoxyE1Q5FkYBNgcChIHvKCg1QYHGYlbPqb8jtm0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lq9t5lQD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SbnKWhGZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lq9t5lQD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SbnKWhGZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xF0v2332432
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ijqdpdqd4fOklmbBbFbJhuoyH/PigwN1E1PBP7ePCFw=; b=Lq9t5lQDFqSkLzMV
	puYPO3u+TyycIReAIIwXDV/k0U3k3b+r2Cb5+rPX4Ynl5ifeBQlmB3WCPu+Udiq0
	ARnSjJ62WiPF1wGkCzpCriUUxBzw1qwM5Pu8DtqXxYpdUaapgTsbawU+guW6KWKr
	GhIEXx4leRAhocNACrr3Tb3TbjQENLs/ZxkqULRl0fRfn9eJPWRaI/scs9jELah9
	7EHCAHbvZvAfEJQevMHOQq4V4MRXBD209T8HYRnMXI/LyhFrYoRN4vQyGsz6iQfm
	2Bt5uIg2ba8wCvhMb9gbAfafolV66tc/wVXHCt0z4jLcoMgzGocWcgjRf0ICarVz
	Es+Ijw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq856xq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:19:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9375d92d8cdso572482485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 01:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164344; x=1788769144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ijqdpdqd4fOklmbBbFbJhuoyH/PigwN1E1PBP7ePCFw=;
        b=SbnKWhGZdEtYJNd8uLqR+AfX9l3aL1iWmxJhGWYT8Edil5dFRu8tXiajSMyz26w7qy
         VWKbGt4sP+r27fgTw06z65xp92hBqZzOK9pX7S/0ABiTZOpRfqMMuwhtIOz33+uEkpDP
         RPLrDM+AWRb784ThQwP4phw2cXPEKssCE61nXm9QGR8jN7inhADWx1q9Xh8MjUiQotd0
         wbtUzMdi0iy7b5RX4ffaPm4sYZwU7O6fGPgtoSIAHo75hHkYtImAZQbuLERifNzZpDJC
         6S8CaG/NamrpoASXY2zoN39xb6SIwdpv+ckEFBT6ki2ozzZ5Ihl7a+iLjzjkoUFfANM+
         m+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164344; x=1788769144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ijqdpdqd4fOklmbBbFbJhuoyH/PigwN1E1PBP7ePCFw=;
        b=L+62dUW9KCc7c8ShnNYV9y/nsNqIrBH47GRlGv7eNT7Fkf7dOJwDcx+LpN9wQ0nlem
         PHFhnUG0hoBHhFdvodAptCRnqjRXSZxbzpnQKMUDHgJDuEhDR1PZmf/e+d9/Yd2zSzbi
         bhig7Z6I4E587fKCaH+u5De2CvoLcG6IPH5QwQxn5TZf6eD0QlI3wTqbV7lD2CZxb3Q2
         8HKvGbTQLlKKSJz8W0tda5TqmG6C7f5hapHmzEaqAmS3fIKZAw/61KlpJcW5TGiED5x2
         MvD/RaIvSwAyV7Zq9/SVsZnz7fomsW0eD4uh07aTogFyCHOjQeFYezdcfDMMLB6EVd1B
         IX2w==
X-Gm-Message-State: AFuF++mj2L4+m8BGRxkrp2qX10d8tDI8tnSqVGdbkaq6UAOKnZl2SIv7
	+v8Ji9LTJRJDgucbbeqjuNnrhSskaam7525qcBjmTnUGq8eK+5sSeGmh1q6mPXfMBZXRuBCLMJz
	QHzdcLIv+FNYOGk75IB0X5d7dyiSbFm5kJUlMd1jj2ODXQfLuTyhKsgHWYmSd7GKGT+B59YtG5Y
	VtZZ4=
X-Gm-Gg: AR+sD10ekhZINeXXPGYdLwl1KnxEe50+aFCU8lJ0bg/WNcNCE+d15r/1ZLP43DjFaRl
	j/Dehtgn5zn76dSNZfnvqr+1GXSBjXBwyuG+X4PSSvr9clUFtCUIx95reiozuh/pzxGs3Y8rpJE
	LzcQpHC7IGlZbttP5LITlgnDMA6W6szVnmJAqJEk0A/R2LFaDMPsyU1s75K8lSjbzONDZL46LzQ
	dfDZgoeyaGWR/GF6GUHXSQbr2pdg9gs/hAaFzoJFu6GC6iFUTkqVa42A5OKCJlPENSwQimbGWFo
	hv23pplbU6P48QmZjtIg+gkMdtTs9slyiGYodgfpPGPW5EaePjg0Aoswv57Z8sRB2MVttGUsxD+
	YgUHzrszmUKkb/d3uYV6YWIztzoi1rMO/CjbS01xc3W6RRO3d96YsKQ1Q1oFRBiI=
X-Received: by 2002:a05:620a:8ec9:b0:939:492:20ce with SMTP id af79cd13be357-939137b3b66mr1631238485a.1.1788164343901;
        Mon, 31 Aug 2026 01:19:03 -0700 (PDT)
X-Received: by 2002:a05:620a:8ec9:b0:939:492:20ce with SMTP id af79cd13be357-939137b3b66mr1631236185a.1.1788164343495;
        Mon, 31 Aug 2026 01:19:03 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:19:03 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:33 +0800
Subject: [PATCH v6 16/29] drm/msm/dp: add link_ready to manage link-level
 operations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-16-c91d35d6fb9e@oss.qualcomm.com>
References: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
In-Reply-To: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=3537;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=uuB/kWSqCnC2Anxq2zqCZAxFvPhs/LbiFjZoseT/nlk=;
 b=7Bp9XavBeVerBws9xUJYdFSv1wxDi6k5IvyNyqbT5GQqdmLhWm2kwqkxJfELrHz9CUWC5wdRD
 qMjk71yKkgGDUpfILjeooKLCrqQiNs129OUbc/9OoFMPRoVJFQU14qD
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: mXKb_iaTNlrKei1fHG1PFtu2ehUIj5rR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfXyNVSruWXYURQ
 qNDKy07wtuFEBbx7RvTmc2AAUiaJGgarZRcWKqocMwVShLXpbLIKlq5SVd4rlU06m2l2zdNrPPK
 g42Bt2kq30ushrNZqNOuaJ4byhmxPPc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX4mWmKsQ37WWB
 JwpbWiH+BgJHILVzlAXDtB5liAholipnJZBAWJ6P4cXC0bg/4GQHsYup9fq5zjFJRKlm06zi2RG
 iI7Er1cp6o5Zm/WAPFAFJoSylUt7HvMqn7lj6XYyvHSiztTIFop/OTbga5XxmL9zvS9xxS2uhyu
 vI7UcRlbUYy/UWEkkv1bNEh59kpKSLC8J5oH94inR7SDyivoKouu2hxSVQhOK6z3IXMflcxwPfl
 zu3Rlh9FmjCgQSwOVtjrme21YXFr9r9KSbccNTpmXKObalZTfLkikW6R6ee5fpOjkb+zVzRN265
 lfBd4pDcX7RhCIOYz3PbMtg7a6jFL/dGDsqq0lGUD3QvfS/TNHoKI23oVu/1Fqepz/VWeAEwOxx
 u4I6T4q1dqtoUsuJy/wybz+47gvEP+708hLU2Kcqb7kpRMigK/drPH41CyXOREFjwxNi8ugLrsW
 Ocqz3sGA00za3tZWJGg==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a9538f8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=BYzu2gpcbUJpO-7lbgUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: mXKb_iaTNlrKei1fHG1PFtu2ehUIj5rR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310070

In MST mode, multiple streams share the same DP link. Track a link_ready
state so msm_dp_display_prepare_link() runs only once per link and
repeated calls are skipped.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 33 +++++++++++++++++++++++++--------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 2 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6103fa67f3ee..90e3d2c4ef47 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -638,6 +638,10 @@ int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display)
 	if (msm_dp_display->is_edp)
 		msm_dp_hpd_plug_handle(dp);
 
+	/* Serialized by modeset lock or mst_lock. */
+	if (msm_dp_display->link_ready)
+		return 0;
+
 	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
 	if (rc) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
@@ -659,7 +663,11 @@ int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display)
 		}
 	}
 
-	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
+	rc = msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
+	if (!rc)
+		msm_dp_display->link_ready = true;
+
+	return rc;
 }
 
 static int msm_dp_display_enable(struct msm_dp_display_private *dp,
@@ -1493,14 +1501,16 @@ void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display, struct msm_dp_p
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	rc = msm_dp_display_enable(dp, msm_dp_panel);
-	if (rc)
-		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
+	if (msm_dp_display->link_ready) {
+		rc = msm_dp_display_enable(dp, msm_dp_panel);
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
@@ -1543,6 +1553,11 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
+	if (!msm_dp_display->link_ready) {
+		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
+		return;
+	}
+
 	if (msm_dp_display->active_stream_cnt) {
 		drm_dbg_dp(dp->drm_dev, "stream still active, return\n");
 		return;
@@ -1561,6 +1576,8 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 		msm_dp_display_host_phy_exit(dp);
 
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
+
+	msm_dp_display->link_ready = false;
 }
 
 void msm_dp_display_atomic_post_disable_helper(struct msm_dp *dp, struct msm_dp_panel *msm_dp_panel)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 9ecd5025fe4a..51eace1d1346 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -20,6 +20,7 @@ struct msm_dp {
 	bool audio_enabled;
 	u32 active_stream_cnt;
 	bool mst_active;
+	bool link_ready;
 	unsigned int connector_type;
 	bool is_edp;
 

-- 
2.43.0

