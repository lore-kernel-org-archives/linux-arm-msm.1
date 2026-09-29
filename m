Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AEA3D3481
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656015; cv=none; b=lMZ6DEfgbhYkXX+fCP4uLRuyhrWjBb/WlXc5wFCAnG2eoVYuWPhihh7qMCnohIcD/Y/SsR4KkwebCKAzY1/XZa0tbvAH8PZgFpK6ZsPZLZzVYG0+oEaclgHBdikE4jMJvE9pvrs6M+kZxwcHKfnp+/UBe46PKLy9X1UuGhxyEzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656015; c=relaxed/simple;
	bh=92k6u5yw4lHhIhZ5PYG05z2SyuivYKW+Y/CKWxnvfUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PmNP5Now/1Q4usp8XDGAYwkNtk5ePjNTptyIDRVW7QBYDd5k2AcNTvvv6sgOJAq69PDyQnquDQDSL6Ev+/d8AFkBNbNLLBT7vhY5Zrj0VgBKQtbF1CiOjS3vpb//vtld+l2Rz6TERtjHPzd21Ge/v4Al7GgIbHphvDt/vHp6v7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OmMnRXEc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=adl+cLfV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OmMnRXEc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="adl+cLfV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47fhZ4052905
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1OEhDCF3SF2H3K65fLNYRGNT7bFmFP0t1Kq+8FW2ZKU=; b=OmMnRXEcz5ZgCfXo
	3kcIkJvjgI2OLL1fCobIaZlCpafuOf5yC3TdAVfQhMYdIvG244a3ZkAXHewkWhnW
	8dswTUYV8DxtM9tDX18AMEF+8O/enYGUXj0sTWyvQbMzUeL9wKc1DaziF/XhqM+5
	YsyLdh/QpsY0EBuGE5h+d6VsrybZWAziqtqqTzUulq34iBDimGH+22dd08gimhFf
	rh5DrMUytfjtpeY1TTzz6+LXDIrEpJPIwZ36A40W1Yu6Ut2nBhRJ97PQnICFt31s
	t1I8SOAPzl3viJN1XDDH8s7Q3P1iu2rAtoTf9g9BjtNAG+X6ZHQ6n8JoBHh48MqH
	n6+DSA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h05yxg29n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:26:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-532c2cac078so61995941cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 21:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656012; x=1791260812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1OEhDCF3SF2H3K65fLNYRGNT7bFmFP0t1Kq+8FW2ZKU=;
        b=adl+cLfVRVfQ7zArljDYNNzrVuLnVrANLVHHGP23FJ1KDGUcTN82WQ0l9XhLhp7EEi
         rWsmRiftgmaAPasz1ZGh4Yb68UVadZx+8tMaEAEyKlCLh180G7MV2VdwMeAdGJY6zfEs
         qrd2CHWPcqfWosRHZQ+ouNCwCLbPsiBtB1Egi+ZxOboOK/Uly79xyTDp4/Qo04j2j/hs
         pAeO6j8ec0qd3Yu3GLXQXEBMMxnj25NltU1EEQmW+Xyj+MGjqxGuk5dhXOCiCiRZssuR
         RxnoLQme/cXxlvdS7AUIjweeuNPj62+pXAbx0VfPj8Bk/QhLLjJO2xgbDrv7ropcP1W7
         rrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656012; x=1791260812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1OEhDCF3SF2H3K65fLNYRGNT7bFmFP0t1Kq+8FW2ZKU=;
        b=l7gRTFL659ZwAyfTDtpKEDdDxe0e/3MjSu9VLmxLVgEy8Jk/olAypjFADDMdGKOxN3
         ElojBdVs0Z7YRIZRqtz9JNZoVKUrVq/Jflcdi4aXZ1OnZz7l1BPW/JtGCYaJKgoWv+zr
         cCbGG5AcWDOYce1pc6mxSW4+C+Oj7deRvNtyNGsPD1XdigHoWiL+MHfJSEcPe19B0yTa
         tNyerEb/YYMEs63hLM3x1CCNoTLwxvPhghpvpEfJLHLQlKTJodlM4A7sj6Ty2IhmqBX2
         TZfy54SIwi372vmElPpqdaCWn0YqK2iqdE4ucQvHlQK5cg1WGdwxbPc2I7c8v5BDKG43
         hnow==
X-Gm-Message-State: AFuF++ln49THB1P4zx8MBhWnq4/posc/K2H97W9k3rxbvQUgt5d8g2Jn
	UnUf6Gyos7iQy6sMGc6YVQf5BuA1hh0ii44Th/Q0gUyRHV2bC2uVKyHKmMFyaEYv7rQ2FcZs1pM
	RSkcTHswHLEMr1bEd009ICNWqdzlPchgitDhzWoT50l05DEvmDTwDX3puzb1RTe6JfgKW
X-Gm-Gg: AYBFou3eF4nUz7L9s+sXlD6bn1mNhWu0RlT3n2OGmVNRNrw/pNao7JNakVTj/0LjVQM
	A9zuiHyyT8iiR2iWGfkceTFVv1Wo539mulEOB1M7L852WNihsTr7IrhIbup/XL1iOgOUe42bdS/
	n+h5KweJ6Lp6N0RzrczP8kd+PjsLHfbEsIS2aO+yCs5HfllaWDWagrMGZj1Ky8UjCSzAHTOz+Uo
	m1tF0WI+eXD1QlUNTbTl07fJkTeRySy27e/B0xn2jDzX0XBKAJTbEWvcuAjCl619SxWI/fBT/48
	njE4jLjdCN8pW8eLV0SeXu6lVgLPUO+GQgLTSmALrbmlFpOyPnnTTNbBD5m9r4ROnqn2r88GiJs
	Z1rJb2A65O7pnoQtDFEz2Mok+1SWLj8FIff4w6Ja/jEzWqvClJ6zHrwyjFjxYBC0=
X-Received: by 2002:ac8:5dce:0:b0:530:e36d:1855 with SMTP id d75a77b69052e-5330b69495cmr262115681cf.42.1790656012005;
        Mon, 28 Sep 2026 21:26:52 -0700 (PDT)
X-Received: by 2002:ac8:5dce:0:b0:530:e36d:1855 with SMTP id d75a77b69052e-5330b69495cmr262115391cf.42.1790656011456;
        Mon, 28 Sep 2026 21:26:51 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:26:51 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:29 +0800
Subject: [PATCH v7 05/35] drm/msm/dp: add support for programming p1/p2/p3
 register blocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-5-4b81473185e7@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=14213;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=BZ43TD0ZSuZoOlG1HhxPzdqNCMTfUEd6UCc0tGiS3AI=;
 b=5fLahBEY8YuW/Y0bDM9C7GpSQXOrJLygsGesYQTyKqfnIU+g4rxrd8K9goYETkSGi2MzLrl/b
 ip/C1D02vmdAHwrzg9XEb45cd+WSjAF5/OgbsBmtTUwu0Y1Z/eZfTmZ
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX0uTZawV9CL+k
 PBdtvLO7pHdGGLyfUe6D8UTuXTjzR+fDiBbq/zHoppBTiBW34HXPtVd+GlEojyP9GyUig5nZNuF
 8huyylSOaZT+MGofXsltLH9M/KF21Iw=
X-Proofpoint-GUID: uApgGS93CSGjnn5DoYVbzuwCS0KnxhFf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfXyUnQIXAVTYgA
 4w+dPsbaEQGX142pqJmtcgiz2xghs0oXAclsGkcBPiiCRGXkuZ/7NaQy40lxoeea/JsPPINPVMX
 7GA0RJaUUY8z6GXupJFD0LsYfFYphYPD2Tlg3Ou56tYbs0i0pivLPKVb1O9AJOgyKqzkPasYfXR
 1z+SrdzOz3rv5gr76p2knQk5tmagW3qFcV5TKIr0TUTHp48/C/2biUXvPa8n673YkTRjF0NOQLX
 1XSPiHWbOdy/+nF65iVpZIPxab5UQvksO7CauU7BCD0Ah0RSOZVARnhNFUDh6feQJKECtRGUzWA
 NRTh1tMBdORzUxC925jv39K5hORR9hYABHxQfJGENuJQrnRWnzj+KVuvqpJrdw+gbeKbiZcLXg8
 GXlKqVjRTU9fhXniuwqNBgxNjfNVCTlOPmYlGwwfwCFnVVWDbXYfaRAEteO0k0F65JdUO2F6hNE
 fwX6H+S0z7DlUgfD8AQ==
X-Proofpoint-ORIG-GUID: uApgGS93CSGjnn5DoYVbzuwCS0KnxhFf
X-Authority-Analysis: v=2.4 cv=SaFi5fRu c=1 sm=1 tr=0 ts=6abb3e0c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=diwio8806UQZP21u3w0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Each MST stream uses its own pixel register block. Extend pixel
register access beyond p0 to support up to four streams.

Not all controllers provide all four blocks. Check for optional
resources before mapping them to avoid misleading probe errors when
they are absent, while propagating mapping failures for resources
that are present.

Track each block's size separately so register snapshots use the
size of the corresponding resource.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 10 +++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +
 drivers/gpu/drm/msm/dp/dp_display.c | 56 ++++++++++++++++++-----
 drivers/gpu/drm/msm/dp/dp_panel.c   | 90 ++++++++++++++++++-------------------
 drivers/gpu/drm/msm/dp/dp_panel.h   |  2 +-
 5 files changed, 103 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 67f1da46b973..c0f5226dc383 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2770,6 +2770,16 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
 	return 0;
 }
 
+bool msm_dp_ctrl_stream_clks_on(struct msm_dp_ctrl *msm_dp_ctrl,
+				enum msm_dp_stream_id stream_id)
+{
+	struct msm_dp_ctrl_private *ctrl;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	return ctrl->stream_clks_on[stream_id];
+}
+
 struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
 			struct drm_dp_aux *aux,
 			struct phy *phy,
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index be0d89d60914..bf593f4a4480 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -55,4 +55,6 @@ void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 
 void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
+bool msm_dp_ctrl_stream_clks_on(struct msm_dp_ctrl *dp_ctrl,
+				enum msm_dp_stream_id stream_id);
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 01a60b4f83e9..d8b28a562653 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -85,8 +85,8 @@ struct msm_dp_display_private {
 	void __iomem *link_base;
 	size_t link_len;
 
-	void __iomem *p0_base;
-	size_t p0_len;
+	void __iomem *pixel_base[DP_STREAM_MAX];
+	size_t pixel_len[DP_STREAM_MAX];
 };
 
 struct msm_dp_desc {
@@ -562,7 +562,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		goto error_link;
 	}
 
-	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->p0_base);
+	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->pixel_base[0]);
 	if (IS_ERR(dp->panel)) {
 		rc = PTR_ERR(dp->panel);
 		DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
@@ -846,8 +846,13 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 				    msm_dp_display->aux_base, "dp_aux");
 	msm_disp_snapshot_add_block(disp_state, msm_dp_display->link_len,
 				    msm_dp_display->link_base, "dp_link");
-	msm_disp_snapshot_add_block(disp_state, msm_dp_display->p0_len,
-				    msm_dp_display->p0_base, "dp_p0");
+
+	for (int i = 0; i < DP_STREAM_MAX; i++) {
+		if (!msm_dp_ctrl_stream_clks_on(msm_dp_display->ctrl, i))
+			continue;
+		msm_disp_snapshot_add_block(disp_state, msm_dp_display->pixel_len[i],
+					    msm_dp_display->pixel_base[i], "dp_p%d", i);
+	}
 }
 
 void msm_dp_display_set_psr(struct msm_dp *msm_dp_display, bool enter)
@@ -1115,6 +1120,26 @@ static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_
 	return base;
 }
 
+static void __iomem *msm_dp_ioremap_optional(struct platform_device *pdev,
+					     int idx, size_t *len)
+{
+	struct resource *res;
+	void __iomem *base;
+
+	if (len)
+		*len = 0;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, idx);
+	if (!res)
+		return NULL;
+
+	base = devm_ioremap_resource(&pdev->dev, res);
+	if (!IS_ERR(base))
+		*len = resource_size(res);
+
+	return base;
+}
+
 #define DP_DEFAULT_AHB_OFFSET	0x0000
 #define DP_DEFAULT_AHB_SIZE	0x0200
 #define DP_DEFAULT_AUX_OFFSET	0x0200
@@ -1127,6 +1152,7 @@ static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_
 static int msm_dp_display_get_io(struct msm_dp_display_private *display)
 {
 	struct platform_device *pdev = display->msm_dp_display.pdev;
+	int i;
 
 	display->ahb_base = msm_dp_ioremap(pdev, 0, &display->ahb_len);
 	if (IS_ERR(display->ahb_base))
@@ -1156,8 +1182,8 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
 		display->aux_len = DP_DEFAULT_AUX_SIZE;
 		display->link_base = display->ahb_base + DP_DEFAULT_LINK_OFFSET;
 		display->link_len = DP_DEFAULT_LINK_SIZE;
-		display->p0_base = display->ahb_base + DP_DEFAULT_P0_OFFSET;
-		display->p0_len = DP_DEFAULT_P0_SIZE;
+		display->pixel_base[0] = display->ahb_base + DP_DEFAULT_P0_OFFSET;
+		display->pixel_len[DP_STREAM_0] = DP_DEFAULT_P0_SIZE;
 
 		return 0;
 	}
@@ -1168,10 +1194,18 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
 		return PTR_ERR(display->link_base);
 	}
 
-	display->p0_base = msm_dp_ioremap(pdev, 3, &display->p0_len);
-	if (IS_ERR(display->p0_base)) {
-		DRM_ERROR("unable to remap p0 region: %pe\n", display->p0_base);
-		return PTR_ERR(display->p0_base);
+	display->pixel_base[0] = msm_dp_ioremap(pdev, 3,
+					  &display->pixel_len[DP_STREAM_0]);
+	if (IS_ERR(display->pixel_base[0]))
+		return PTR_ERR(display->pixel_base[0]);
+
+	for (i = DP_STREAM_1; i < DP_STREAM_MAX; i++) {
+		display->pixel_base[i] = msm_dp_ioremap_optional(pdev, i + 3,
+							   &display->pixel_len[i]);
+		if (IS_ERR(display->pixel_base[i]))
+			return PTR_ERR(display->pixel_base[i]);
+		if (!display->pixel_base[i])
+			break;
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 745ee6976897..7b5fc5bb16de 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -25,7 +25,7 @@ struct msm_dp_panel_private {
 	struct drm_dp_aux *aux;
 	struct msm_dp_link *link;
 	void __iomem *link_base;
-	void __iomem *p0_base;
+	void __iomem *pixel_base;
 	bool panel_on;
 };
 
@@ -44,24 +44,24 @@ static inline void msm_dp_write_link(struct msm_dp_panel_private *panel,
 	writel(data, panel->link_base + offset);
 }
 
-static inline void msm_dp_write_p0(struct msm_dp_panel_private *panel,
-			       u32 offset, u32 data)
+static inline void msm_dp_write_pn(struct msm_dp_panel_private *panel,
+				   u32 offset, u32 data)
 {
 	/*
-	 * To make sure interface reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
+	 * Use writel() instead of writel_relaxed() to ensure the interface
+	 * register write reaches the hardware before subsequent operations.
 	 */
-	writel(data, panel->p0_base + offset);
+	writel(data, panel->pixel_base + offset);
 }
 
-static inline u32 msm_dp_read_p0(struct msm_dp_panel_private *panel,
-			       u32 offset)
+static inline u32 msm_dp_read_pn(struct msm_dp_panel_private *panel,
+				 u32 offset)
 {
 	/*
-	 * To make sure interface reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
+	 * Only reads a configuration register: no DMA or memory ordering is
+	 * required, so readl_relaxed() is sufficient.
 	 */
-	return readl_relaxed(panel->p0_base + offset);
+	return readl_relaxed(panel->pixel_base + offset);
 }
 
 static void msm_dp_panel_read_psr_cap(struct msm_dp_panel_private *panel)
@@ -367,34 +367,34 @@ static void msm_dp_panel_tpg_enable(struct msm_dp_panel *msm_dp_panel,
 	display_hctl = (hsync_end_x << 16) | hsync_start_x;
 
 
-	msm_dp_write_p0(panel, MMSS_DP_INTF_HSYNC_CTL, hsync_ctl);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_VSYNC_PERIOD_F0, vsync_period *
+	msm_dp_write_pn(panel, MMSS_DP_INTF_HSYNC_CTL, hsync_ctl);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_VSYNC_PERIOD_F0, vsync_period *
 			hsync_period);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F0, v_sync_width *
+	msm_dp_write_pn(panel, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F0, v_sync_width *
 			hsync_period);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_VSYNC_PERIOD_F1, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F1, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_DISPLAY_HCTL, display_hctl);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_HCTL, 0);
-	msm_dp_write_p0(panel, MMSS_INTF_DISPLAY_V_START_F0, display_v_start);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_DISPLAY_V_END_F0, display_v_end);
-	msm_dp_write_p0(panel, MMSS_INTF_DISPLAY_V_START_F1, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_DISPLAY_V_END_F1, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_V_START_F0, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_V_END_F0, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_V_START_F1, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_V_END_F1, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_POLARITY_CTL, 0);
-
-	msm_dp_write_p0(panel, MMSS_DP_TPG_MAIN_CONTROL,
-				DP_TPG_CHECKERED_RECT_PATTERN);
-	msm_dp_write_p0(panel, MMSS_DP_TPG_VIDEO_CONFIG,
-				DP_TPG_VIDEO_CONFIG_BPP_8BIT |
-				DP_TPG_VIDEO_CONFIG_RGB);
-	msm_dp_write_p0(panel, MMSS_DP_BIST_ENABLE,
-				DP_BIST_ENABLE_DPBIST_EN);
-	msm_dp_write_p0(panel, MMSS_DP_TIMING_ENGINE_EN,
-				DP_TIMING_ENGINE_EN_EN);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_VSYNC_PERIOD_F1, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F1, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_DISPLAY_HCTL, display_hctl);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_ACTIVE_HCTL, 0);
+	msm_dp_write_pn(panel, MMSS_INTF_DISPLAY_V_START_F0, display_v_start);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_DISPLAY_V_END_F0, display_v_end);
+	msm_dp_write_pn(panel, MMSS_INTF_DISPLAY_V_START_F1, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_DISPLAY_V_END_F1, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_ACTIVE_V_START_F0, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_ACTIVE_V_END_F0, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_ACTIVE_V_START_F1, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_ACTIVE_V_END_F1, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_POLARITY_CTL, 0);
+
+	msm_dp_write_pn(panel, MMSS_DP_TPG_MAIN_CONTROL,
+			DP_TPG_CHECKERED_RECT_PATTERN);
+	msm_dp_write_pn(panel, MMSS_DP_TPG_VIDEO_CONFIG,
+			DP_TPG_VIDEO_CONFIG_BPP_8BIT |
+			DP_TPG_VIDEO_CONFIG_RGB);
+	msm_dp_write_pn(panel, MMSS_DP_BIST_ENABLE,
+			DP_BIST_ENABLE_DPBIST_EN);
+	msm_dp_write_pn(panel, MMSS_DP_TIMING_ENGINE_EN,
+			DP_TIMING_ENGINE_EN_EN);
 	drm_dbg_dp(panel->drm_dev, "%s: enabled tpg\n", __func__);
 }
 
@@ -403,9 +403,9 @@ static void msm_dp_panel_tpg_disable(struct msm_dp_panel *msm_dp_panel)
 	struct msm_dp_panel_private *panel =
 		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 
-	msm_dp_write_p0(panel, MMSS_DP_TPG_MAIN_CONTROL, 0x0);
-	msm_dp_write_p0(panel, MMSS_DP_BIST_ENABLE, 0x0);
-	msm_dp_write_p0(panel, MMSS_DP_TIMING_ENGINE_EN, 0x0);
+	msm_dp_write_pn(panel, MMSS_DP_TPG_MAIN_CONTROL, 0x0);
+	msm_dp_write_pn(panel, MMSS_DP_BIST_ENABLE, 0x0);
+	msm_dp_write_pn(panel, MMSS_DP_TIMING_ENGINE_EN, 0x0);
 }
 
 void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable)
@@ -439,7 +439,7 @@ void msm_dp_panel_clear_dsc_dto(struct msm_dp_panel *msm_dp_panel)
 	struct msm_dp_panel_private *panel =
 		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 
-	msm_dp_write_p0(panel, MMSS_DP_DSC_DTO, 0x0);
+	msm_dp_write_pn(panel, MMSS_DP_DSC_DTO, 0x0);
 }
 
 static void msm_dp_panel_send_vsc_sdp(struct msm_dp_panel_private *panel, struct dp_sdp *vsc_sdp)
@@ -629,7 +629,7 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 	msm_dp_write_link(panel, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
 	msm_dp_write_link(panel, REG_DP_ACTIVE_HOR_VER, msm_dp_active);
 
-	reg = msm_dp_read_p0(panel, MMSS_DP_INTF_CONFIG);
+	reg = msm_dp_read_pn(panel, MMSS_DP_INTF_CONFIG);
 	if (wide_bus_en)
 		reg |= DP_INTF_CONFIG_DATABUS_WIDEN;
 	else
@@ -637,7 +637,7 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 
 	drm_dbg_dp(panel->drm_dev, "wide_bus_en=%d reg=%#x\n", wide_bus_en, reg);
 
-	msm_dp_write_p0(panel, MMSS_DP_INTF_CONFIG, reg);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_CONFIG, reg);
 
 	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
 		msm_dp_panel_setup_vsc_sdp_yuv_420(msm_dp_panel);
@@ -701,7 +701,7 @@ int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel,
 struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
 			      struct msm_dp_link *link,
 			      void __iomem *link_base,
-			      void __iomem *p0_base)
+			      void __iomem *pixel_base)
 {
 	struct msm_dp_panel_private *panel;
 	struct msm_dp_panel *msm_dp_panel;
@@ -719,7 +719,7 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
 	panel->aux = aux;
 	panel->link = link;
 	panel->link_base = link_base;
-	panel->p0_base = p0_base;
+	panel->pixel_base = pixel_base;
 
 	msm_dp_panel = &panel->msm_dp_panel;
 	msm_dp_panel->max_bw_code = DP_LINK_BW_8_1;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 50a721401751..218a09a2fa65 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -102,5 +102,5 @@ static inline bool is_lane_count_valid(u32 lane_count)
 struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
 			      struct msm_dp_link *link,
 			      void __iomem *link_base,
-			      void __iomem *p0_base);
+			      void __iomem *pixel_base);
 #endif /* _DP_PANEL_H_ */

-- 
2.43.0

