Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B574E3EB0F1
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656034; cv=none; b=VpM8GXmc5P+eotgtFuFWk4tOuA8P3Mwtx8Ab2xYBlJxMR8eV/dA9qrF5GxmSTQwByUXDhd2LZ/sudevBU5YvW96ju9yfFUr/5WZ9T1maTwcdb7bONR/NelD999d+wAUGl50v+aX/r3/i3gl4XKB11sM808BKJXfRdHoIW26WAp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656034; c=relaxed/simple;
	bh=Rmad8rIknz1sOMSvhuH7OEp7pReINDO+wK4qwai4xjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oEIYNA7YRv9FNaI6AlKeEWesX9GbwzU5YnsV8aeA5yR9BiA1Bytn3fEqC2rBkYjkjQ0PhPfLyiNHaaMHJNPS3mo1swbpRzfLehcYasP4gaC/o1Y2BHkDBxwjumvEyrlEVEKXfML8fKqOfSTGSfcW1Cay6XMG4d0ssJGz/0T+bKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AEmq3QI5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NWPWvf48; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AEmq3QI5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NWPWvf48"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47GwH420005
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TOMG3yp218IRb7X4mHLShdrli/+A+w+d0UixRrJLDGE=; b=AEmq3QI59mjTs70Z
	S0jBZqzcYfntt/6AeeI/VAVRkU+jJmR/pk0s5bWeHk79vid9bmppPUcBfCu+07jO
	k0kOXE5yTo1s+TefUVE6qYsAfWpCcud0fejiqjDaOU5REYNFPXVFCusvretoKq8P
	Kxx3iA+tenki7u0UhCEMjYhmzEDBQUSmMXUBxZJbYB/uWdKcZOyM3tqyWTckFsqS
	wES9q22RgUoo5s4qUVcgXHeqFNDzauwZmWtBqO4p1++bpxvDzPF8l2PDU2SDag43
	A2prYRWkoQlUWI+NgTbMzBxBdknKyEA7UdSPkcO1ogaQV56gxrlYELow5HUiPwlQ
	gEHS1g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyxmu9kay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:27:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91431adf55eso69541026d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 21:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656031; x=1791260831; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TOMG3yp218IRb7X4mHLShdrli/+A+w+d0UixRrJLDGE=;
        b=NWPWvf48icYVhwcwKiuDbfH24HO2R9/YvK7SjLFA4xk0qd8phAVEQCcuRndb/iE83v
         fnScz8KCZUVJa44gmiNHNVGnEAojLtEtG/GT4UyjdtRRMHsxxt7n2RA4jrBLsueOgsNJ
         E5L2eQxv0Favb2rHUesh3nwp/48HqKzj6mHKgaJgYKFRlqGxTOwWK6Mz737n7dC5mLgY
         gg79sJkod1tDZ5q/DSLKblXIfBuCf+bWACvgkz328+0jQ3hzz0mlkbR5ZSwEkCZhvqVO
         4qMxMOvu/ydvtfBs6iE3lVevyuX05T64JhE/TYessjw1sX+W4t1wMRKJcz2UxpYH3++F
         b97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656031; x=1791260831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TOMG3yp218IRb7X4mHLShdrli/+A+w+d0UixRrJLDGE=;
        b=GwXHhGwnWkKznrnIDKlGPnRZ+XEZLYumL7flUY9i9v6bkckV2thnD4iZ3r01KEgn4F
         KNCSVpp0u5pbmBU4FqMuEDzLdcbaMIz/zO36aTRrHuwimLr2SbUpmuGFlXqQ3tAXnCfL
         OQ5VtDkuFq+hvsCP8HZXIJFS359s3POLnDDCurqVe2+rCqysmaKwkAlHqT8wdSw+T91G
         kTu5Rf9DhoVuelXAXl7AZJhSAMeVGY6t7BLRIjVfbh1I21meizIvEpqRklvYmcWaORco
         VXcnx3WMxsytANq0OMjlX9pFdmlC/0fCo7oPBoM7mAO6rBemGTZKwx73ac1vDmrxhbAf
         u8lA==
X-Gm-Message-State: AFq9FYKUTPMkeRJDijkrG16f5fz6g/VYb1kPLpieXhgJNMgKjctIXVW7
	LUbOQjgloBd6Qm0uAHJJXdprmwguwALKrJjOfr8zREK8GYR9mdAqRj3ZR46HhVYWqEZI/dO1Uhu
	iQhR2519+Pg2g+2RrB9k11XX5KyeUvJXT3MqvXF/q05/DZ/rHSVyVr0vVVWwT+bF/+jhk
X-Gm-Gg: AYBFou14p2ulA1cn4BReuVKlYTOTROlLAp3fQQ5bIyFBk5opuHnPYkNSrprR6Z7ocqj
	UiYoXeFn/RGGjLDKPEWJfAd9k3+0Qqk2j1hcADmVO0IBg9DM6hGFUpgHBY9lScNiO7P3JFf8BGl
	NTjvmsSJvSZcGZY3XisWG5q8AjArASCbrxF17ICb/DE/z9NhC1NzGwFuV7wa/toftLCKWQmYedf
	Ozq8kf7cI/ZUzoh6uFdDCMDRC242aWhybT1akRmovtBmmV4qrRZM3UGzrGQvXUGQ+4dikYTVUyA
	DdJ2npqixTIVx9UDzBiP2zKt/clqoTrLvP8IVIPa1MkFybFnY4BgBlEDum2MFVMaw9u2x3hoVby
	+oglNY9lZiznMVLutg04hKPzJUEvh/hSh8VBGtGPZjAZGuCKw2LXRCxbqMAsbapM=
X-Received: by 2002:a05:6214:19c3:b0:914:5028:ab76 with SMTP id 6a1803df08f44-9145028ad09mr160456496d6.39.1790656030948;
        Mon, 28 Sep 2026 21:27:10 -0700 (PDT)
X-Received: by 2002:a05:6214:19c3:b0:914:5028:ab76 with SMTP id 6a1803df08f44-9145028ad09mr160456286d6.39.1790656030480;
        Mon, 28 Sep 2026 21:27:10 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:27:10 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:33 +0800
Subject: [PATCH v7 09/35] drm/msm/dp: add support to enable MST in mainlink
 control
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-9-4b81473185e7@oss.qualcomm.com>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
In-Reply-To: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=2557;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=8IxMe+vOOiLPxKEsXO6U2qctxURhGCfNOY0j4XpqOyE=;
 b=/Til5sl5abipB/ZBrB06zibhqaVCbrF/t2LOhTaX3qu2Yrd6xfA+pWIvKvCU6Ez5DlNrmeVYZ
 QVccIt3bM1MAO0YQf0bdVEkIM59qfy8MFC7fQt4hwcxRs1S7CDPVgdw
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX5n4zofIti2g7
 jxeGGJZ7akbHcL3o6RT5EKgdXVC3AVhKcptsW9zoZ34Au2vcQeC0137q4Ep7ajznqJuDLvrTL7D
 fIu2k/WFBP82tEGLaQGCu4cytlC1mWYnRzUzTlJchP0BeKTRUQ2tvxYeIoPOlT7BLbSMF6kexD+
 mtNkX1mlHocsAFiXLiJCDJlio1O8ni3K63opM8ArH+BIxCdia11O8LK6Oq7mjjU+cQsvbxF4Hv2
 /pC4OBaJNsSiPXeqfH/EIzaHk3OQ/alqdL7VEEnoa1ArzygPJqNkOW0wwq2hudGB3DAcFCZXFgN
 FWQLKNJ7KLwXcjp/fc1L/H877lyEh1kCxqqDHd7Rehl+3MpXmzZUuhifK0ZcML61ZunH+nf3phH
 cC0vhNUwebj8quTk1F6cOOSucCWPJ0Hx+/s/tV1ddBP6DygFPdUcV62QQ04rM0DfTbqbtDp0u89
 zIRYlXW8+2C/cbbCkWQ==
X-Proofpoint-GUID: eh6FtC8RhSwpffcNwbQ6UgRc18JE0mHz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX820MDLPf3I5h
 XgIvju58kx8iHGQqScd3KGe33vBOwBaMvdGBBD4oXHIfnX1UkvpwYSe7oapGAM0fRNyexamN3Ht
 eM5wmAklOAqHi6S3MoiaOgnvIrJk5CI=
X-Proofpoint-ORIG-GUID: eh6FtC8RhSwpffcNwbQ6UgRc18JE0mHz
X-Authority-Analysis: v=2.4 cv=c70+0h9l c=1 sm=1 tr=0 ts=6abb3e20 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=GJT6Fafo9oTAj6z5dyEA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add support to program the MST enable bit in the mainlink control
register when an MST session is active or being disabled.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 16 ++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_reg.h  |  4 ++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 65d22505c2b6..cd6ae0d5372c 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -276,6 +276,19 @@ int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
 	return 0;
 }
 
+static void msm_dp_ctrl_mst_config(struct msm_dp_ctrl_private *ctrl, bool enable)
+{
+	u32 mainlink_ctrl;
+
+	mainlink_ctrl = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
+	if (enable)
+		mainlink_ctrl |= DP_MAINLINK_CTRL_MST_EN;
+	else
+		mainlink_ctrl &= ~DP_MAINLINK_CTRL_MST_EN;
+
+	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+}
+
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
@@ -2680,6 +2693,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_ctrl_lane_mapping(ctrl);
 	msm_dp_setup_peripheral_flush(ctrl);
+	if (ctrl->mst_active)
+		msm_dp_ctrl_mst_config(ctrl, true);
 
 	msm_dp_ctrl_configure_source_params(ctrl, panel);
 
@@ -2730,6 +2745,7 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 	phy = ctrl->phy;
 
 	msm_dp_ctrl_mainlink_disable(ctrl);
+	msm_dp_ctrl_mst_config(ctrl, false);
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl, panel);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 9263e61c794c..cc74b1ed628e 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -128,6 +128,10 @@
 #define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 1)
 #define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 3)
 #define DP_MAINLINK_FB_BOUNDARY_SEL		(0x02000000)
+#define DP_MAINLINK_CTRL_ECF_MODE		BIT(26)
+#define DP_MAINLINK_CTRL_MST_ACTIVE		BIT(8)
+#define DP_MAINLINK_CTRL_MST_EN			(DP_MAINLINK_CTRL_ECF_MODE | \
+						DP_MAINLINK_CTRL_MST_ACTIVE)
 
 #define REG_DP_STATE_CTRL			(0x00000004)
 #define DP_STATE_CTRL_LINK_TRAINING_PATTERN1	(0x00000001)

-- 
2.43.0

