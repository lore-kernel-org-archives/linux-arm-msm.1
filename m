Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B50C3A59A7
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784527896; cv=none; b=Z5NhUYKhTTOWOlQC0M+FnGS0wVTViFO5MYmNTg6t7Z+VFlHVX/cG1l1uiJzUiyMKEjDghLNQdxLiAc/HC1dzHlfdLXNaQTnmlL+NTt4p4Y/svlnkcyiz1ysHrNN5YDzP2kiW5+DI//P9oZx58xJaHeWr0PuWOb+sXWDzcWyi7jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784527896; c=relaxed/simple;
	bh=1+oXVdbGkUHZIMHtrmBtpebpoUulV0k7vcbiUM7OL30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vA8HUYtjz9kXvwD4MvFG42mGQzzrE+Jc6ds1kn+EZcJnn/8R/1sLz8FJGcBHuAgyO/4UuNkCceM79CF9aMoHOV9OjQihtR6+o2DG0GbLLBQcagBtEEjKk2rT3AUfpEpmwknrsqEm7OHhIEPfn7WZB6KTbvb2wuTkT8ELDqhFRUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ppmFMSkl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P9ZGTuz2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ppmFMSkl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P9ZGTuz2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNsb2X657712
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sAWajNDsmDdfgw72NoAHcvCR3e7RdbDxsK9dwsX38+k=; b=ppmFMSklB3436Zxy
	9PqEsxzuYjTG28612NtTCjhLxX13bY7JI13nWGJaLEvyY7iHGiycLUpeBbyultxR
	bMWEud/Cf/cQj/U0Mk2KF4XK5Lm+JSNLI/cE6UfFXmVu4rebDnRUve7hcsfXkcRc
	gxWAzritBaWM3ztG0eI/Ii4L3CvyAHq2zuT/WUYF1yzwI5R9RjukbASPNcF49wFm
	iuseN8aMW4RAcWo53X4qP+/B4BUQX/kb2TimobdIu0k33D7EhjcDLWlYF5WWq5hB
	Zuh++wrsQDQhYlslQLcxshQ3/ztBTNV5XKIdQIoEkizZFKt2MxUnBbUzxuIHM+rd
	F9UhGA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2chmm33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e62e3459fso1703344285a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 23:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784527885; x=1785132685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sAWajNDsmDdfgw72NoAHcvCR3e7RdbDxsK9dwsX38+k=;
        b=P9ZGTuz29a4iXR04/XY3icYwLh4NS1K7iVFpb9nJMDvGgUeAdcs+kKOaft5L554E4F
         9wjG664dyL65tkx8iDnodU69vuNcrijq8ferpjp+C/lgyTWfNd5q/ypd+DlnW5v7fTt7
         qW6UbkWrmnVELPajssgsorD6byIPh/hU8GGEqngl4TS0zMnuGQea7XwzSihec7mzpce8
         Crfv2QeLfZUPihRMmu812P7dPRnic5qGdmOy5vcCnP4WJozTnk/ECJLp4BSFeBqJ2vbW
         eI/niia+TQBWw7i4phM7zK5ZD/4LTx1qqhkJjZeMG5wO4W8q2INU3RvIG48uG/UqwoyD
         pdpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784527885; x=1785132685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sAWajNDsmDdfgw72NoAHcvCR3e7RdbDxsK9dwsX38+k=;
        b=Xp8btuXlQdjMBoawVADQjZFD4yb7sqXMd/KshFsVwHiSHfMJk64zjeH4s6kAxUv1jA
         vgWcAdWSpoUT+EpPTMamjZBVXTz7OjH5h6Yx97BacLtSIJO83P7zJcQejipDA1cqi/YV
         KU6wYtgCrIG1F0hDFqjx/GaCNs03ov8lBCo2qmJmK6X3j2RA46d2m5IRk25j+vlxfrCz
         LJT5bIe06EqGwhnMPK/OCbPVbnXr9RpDqSlZnukEZ1gYcGL7r7mEd/CkSVzfu2bAnq7K
         jmbLbNjR1Dt5lUTMzUHQRfvtGZoODI9m8wkHeQcilp1mdMnpmeyzUG0qmH5ooDs3zojJ
         i38g==
X-Gm-Message-State: AOJu0YylgdC/jVD9TV7GLPXmjzDwCNP5GxhN1X4k4rwgdtdxzqdDRjHr
	nwF7ZS5JPCh13rFs7auq2LdfSRIonp84KlK8elI44U6vVFbwJH7abJhN/Ol/zj5qOTmpHp6907v
	8x6jnkYZc1H8ka4RE6cbyXpbZQ61iviZjUb2Nlf1T5jPu7n22aCq1KS8z0ozh5Sm7vacd
X-Gm-Gg: AfdE7ckDpi50/IW3OVhRNqPsZtHs66TF2GHn6otaQR4oAiGjP+FBQGvTXdauMcN75u7
	eJRvJp32FGbaZGoBvgernLb9CxRuXz36qCe4jiN5dvjJOGsI3I/COwGOy7LU7yT4D+ok2M1B+r3
	LXtq4nOOMhScEs8HX7qtPQfIl9j/pDI8SKtU9bvvKq+X2z3LwcMUaOL5Du76MM6gmOux22CUUdB
	CEM0Lc5skl1sUI81UtfOSQOQ9XArl4//OtQPLyt8zEPNisza149YKSDSrNIKHVP3NpLbm6+woY9
	5j3S7mpVZJwUoLeaz9PosJcKA98SBKUWjmn/h6cB78dtZMGU6CGClm3s6rrCd5Z32XrdRmK6VjM
	OYoDHBLj9HFGVsEYoa8uoQV0qDbOcrBF4o1Kd+7sv1ux6zAniiV2YEC3lBpgo930=
X-Received: by 2002:a05:620a:d8d:b0:92e:db54:a2bb with SMTP id af79cd13be357-930b430817emr1250669885a.64.1784527884859;
        Sun, 19 Jul 2026 23:11:24 -0700 (PDT)
X-Received: by 2002:a05:620a:d8d:b0:92e:db54:a2bb with SMTP id af79cd13be357-930b430817emr1250667685a.64.1784527884421;
        Sun, 19 Jul 2026 23:11:24 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90778588a39sm84793216d6.20.2026.07.19.23.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:11:24 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 14:08:15 +0800
Subject: [PATCH v8 08/15] drm/msm/dp: break up dp_display_enable into two
 parts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-dp_mstclean-v8-8-bea261bf4e7d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784527840; l=10329;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=hRpmG1O4u0ItaVOBRpgfp0VdhTJDT1a7d1EXr1Y1NZQ=;
 b=pYJS2Ny10rtwnjhmq5+hOOZYBvFl2tXORlmGDlWwZaUrH/D3jEOxHKrIF8fEipzabRv47T/YN
 g/ppEs/yBH5DAyA6WdW3qtPoBGjXNDIpbriJL8T3Czn4DoWGRRN+Og0
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA2NyBTYWx0ZWRfX70exMz1CUBMV
 FQ+e83LTUuRgWz/KvUbAmIDSqDEYmn28oYUpe3kdj4o0VGxqVw+H2Di1V6LjSf5NiS3mNeS7LmG
 hJY6fj3gWknuJWZuDGbfsr2mVr1PX4E=
X-Proofpoint-GUID: Q4Ke8BTEprDyOtOtvA-Nq7LKX3yvH-LQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA2NyBTYWx0ZWRfX0uAJ/uPtIIbN
 ZdZu33OPZ/kbrO+eC64xa9UuKePt35hJeXRrdGEDbbSuSBF5R99XeLTb8TIrKzVlI89a5B9meqQ
 O3tvp8w79L2Whu023m9yFTglat3BOnBZnV7TOkQygg1fEXZnkG7gnJ97CMZFyo8MWWKb5T8N1Ao
 IwRzk/YdkSnBxPwFe1VPMAqWnfoYgVRXi/xVuQJSn1YloUdiQhQ+W8dEHIOtUYOxHJe1d6XZ5Eq
 KzkSg30OpMQjZdsKAiYN0tMjhcakFoUWw1Pp8VUpoays+ZGoUPVokX57RpA65HLIoZwt9oUHbJk
 pedfeCJIp0poUZgwc6p92TysMxigPc6lbfGyaVtbLxDAu1jQcWwXs9VHZmprbyCjxXwpAJqS/KQ
 MVYv6wyffhC4ZvsXWU7zNJuBDYTMa6sHqf68X5JmsD3EhNPtySrDm04eSDjlwJfXIqLe0AyLblT
 AJXvJuoDKI3Fdz6OXaw==
X-Authority-Analysis: v=2.4 cv=T5K8ifKQ c=1 sm=1 tr=0 ts=6a5dbc0d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=yY1IV_0HXbUsaRqM5MUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Q4Ke8BTEprDyOtOtvA-Nq7LKX3yvH-LQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200067

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

dp_display_enable() currently re-trains the link if needed and then
enables the pixel clock, programs the controller to start sending the
pixel stream. Split these two parts into prepare/enable APIs, to support
MST bridges_enable insert the MST payloads funcs between enable
stream_clks and program register.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  48 ++++++++++------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   3 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 107 +++++++++++++++++++++++-------------
 3 files changed, 104 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index a79d9bb93cd0..32607eb678a0 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2507,27 +2507,19 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
 	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID, nvid);
 }
 
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
+int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
 {
 	int ret = 0;
-	bool mainlink_ready = false;
 	struct msm_dp_ctrl_private *ctrl;
-	unsigned long pixel_rate;
-	unsigned long pixel_rate_orig;
 
 	if (!msm_dp_ctrl)
 		return -EINVAL;
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	pixel_rate = pixel_rate_orig = ctrl->panel->msm_dp_mode.drm_mode.clock;
-
-	if (msm_dp_ctrl->wide_bus_en || ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
-		pixel_rate >>= 1;
-
-	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%lu\n",
-		ctrl->link->link_params.rate,
-		ctrl->link->link_params.num_lanes, pixel_rate);
+	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d\n",
+		   ctrl->link->link_params.rate,
+		   ctrl->link->link_params.num_lanes);
 
 	drm_dbg_dp(ctrl->drm_dev,
 		"core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
@@ -2541,16 +2533,40 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 		}
 	}
 
-	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
-	if (ret)
-		return ret;
-
 	if (force_link_train || !msm_dp_ctrl_channel_eq_ok(ctrl))
 		msm_dp_ctrl_link_retrain(ctrl);
 
 	/* stop txing train pattern to end link training */
 	msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
 
+	return ret;
+}
+
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	int ret = 0;
+	bool mainlink_ready = false;
+	struct msm_dp_ctrl_private *ctrl;
+	unsigned long pixel_rate;
+	unsigned long pixel_rate_orig;
+
+	if (!msm_dp_ctrl)
+		return -EINVAL;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	pixel_rate_orig = ctrl->panel->msm_dp_mode.drm_mode.clock;
+	pixel_rate = pixel_rate_orig;
+
+	if (msm_dp_ctrl->wide_bus_en || ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
+		pixel_rate >>= 1;
+
+	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
+
+	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
+	if (ret)
+		return ret;
+
 	/*
 	 * Set up transfer unit values and set controller state to send
 	 * video.
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index f68bee62713f..1497f1a8fc2f 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -17,7 +17,8 @@ struct msm_dp_ctrl {
 struct phy;
 
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
+int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
 void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 155beefdfdef..ced299cad831 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -617,7 +617,42 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
 	return 0;
 }
 
-static int msm_dp_display_enable(struct msm_dp_display_private *dp, bool force_link_train)
+static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
+{
+	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+	int rc = 0;
+	bool force_link_train = false;
+
+	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
+
+	if (msm_dp_display->is_edp)
+		msm_dp_hpd_plug_handle(dp);
+
+	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
+	if (rc) {
+		DRM_ERROR("failed to pm_runtime_resume\n");
+		return rc;
+	}
+
+	if (dp->link->sink_count == 0)
+		return -ENOTCONN;
+
+	if (!msm_dp_display->power_on) {
+		msm_dp_display_host_phy_init(dp);
+		force_link_train = true;
+	}
+
+	rc = msm_dp_ctrl_on_link(dp->ctrl);
+	if (rc) {
+		DRM_ERROR("Failed link training (rc=%d)\n", rc);
+		// TODO: schedule drm_connector_set_link_status_property()
+		return rc;
+	}
+
+	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, force_link_train);
+}
+
+static int msm_dp_display_enable(struct msm_dp_display_private *dp)
 {
 	int rc = 0;
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
@@ -628,7 +663,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp, bool force_l
 		return 0;
 	}
 
-	rc = msm_dp_ctrl_on_stream(dp->ctrl, force_link_train);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl);
 	if (!rc)
 		msm_dp_display->power_on = true;
 
@@ -658,13 +693,10 @@ static int msm_dp_display_post_enable(struct msm_dp *msm_dp_display)
 	return 0;
 }
 
-static int msm_dp_display_disable(struct msm_dp_display_private *dp)
+static void msm_dp_display_audio_notify_disable(struct msm_dp_display_private *dp)
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
-	if (!msm_dp_display->power_on)
-		return 0;
-
 	/* wait only if audio was enabled */
 	if (msm_dp_display->audio_enabled) {
 		/* signal the disconnect event */
@@ -675,6 +707,14 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 	}
 
 	msm_dp_display->audio_enabled = false;
+}
+
+static int msm_dp_display_disable(struct msm_dp_display_private *dp)
+{
+	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+
+	if (!msm_dp_display->power_on)
+		return 0;
 
 	if (dp->link->sink_count == 0) {
 		/*
@@ -1371,14 +1411,13 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 				 struct drm_atomic_commit *state)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
+	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *crtc_state;
 	int rc = 0;
-	struct msm_dp_display_private *msm_dp_display;
-	bool force_link_train = false;
+	struct msm_dp_display_private *dp;
 
-	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
 	crtc = drm_atomic_get_new_crtc_for_encoder(state,
 						   drm_bridge->encoder);
@@ -1386,44 +1425,29 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		return;
 	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 
-	if (dp->is_edp)
-		msm_dp_hpd_plug_handle(msm_dp_display);
-
-	if (pm_runtime_resume_and_get(&dp->pdev->dev)) {
-		DRM_ERROR("failed to pm_runtime_resume\n");
-		return;
-	}
-
-	if (msm_dp_display->link->sink_count == 0)
-		return;
-
-	rc = msm_dp_display_set_mode(dp, &crtc_state->adjusted_mode, msm_dp_display->panel);
+	rc = msm_dp_display_set_mode(msm_dp_display, &crtc_state->adjusted_mode, dp->panel);
 	if (rc) {
 		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
 		return;
 	}
 
-	if (!dp->power_on) {
-		msm_dp_display_host_phy_init(msm_dp_display);
-		force_link_train = true;
-	}
-
-	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
+	rc = msm_dp_display_prepare_link(dp);
 	if (rc) {
-		DRM_ERROR("Failed link training (rc=%d)\n", rc);
-		// TODO: schedule drm_connector_set_link_status_property()
+		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
 		return;
 	}
 
-	msm_dp_display_enable(msm_dp_display, force_link_train);
+	rc = msm_dp_display_enable(dp);
+	if (rc)
+		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
 
-	rc = msm_dp_display_post_enable(dp);
+	rc = msm_dp_display_post_enable(msm_dp_display);
 	if (rc) {
 		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		msm_dp_display_disable(msm_dp_display);
+		msm_dp_display_disable(dp);
 	}
 
-	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
+	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
 }
 
 void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
@@ -1438,6 +1462,15 @@ void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
 }
 
+static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
+{
+	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+
+	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
+
+	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
+}
+
 void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 				       struct drm_atomic_commit *state)
 {
@@ -1450,11 +1483,11 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	if (dp->is_edp)
 		msm_dp_hpd_unplug_handle(msm_dp_display);
 
-	msm_dp_display_disable(msm_dp_display);
+	msm_dp_display_audio_notify_disable(msm_dp_display);
 
-	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
+	msm_dp_display_disable(msm_dp_display);
 
-	pm_runtime_put_sync(&dp->pdev->dev);
+	msm_dp_display_unprepare(msm_dp_display);
 }
 
 void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)

-- 
2.43.0

