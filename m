Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E273D75CD
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164352; cv=none; b=PKeQJXKyc7qLl+WVIbJFo40rWEgagcMhftblh9curU32Q5+T/xg9b+VR10HKV21W/+M0QM7neblrvIyr5sVuo3XRpxdfSN0jNezwNuuLGn9A6OpZ2e1+772lmrDZey2NNlVloBoTfkAI7edI/2KokegO6HVdm2f5+9LZOLW+5ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164352; c=relaxed/simple;
	bh=e/mJkcnqYocDRes/WTYyDoAWeAejUemQCgMDalQGyXw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D/TsQJsnshhirZkHXO5+D4GUnx0NTio++4RvukgN6qfUI2cu9+CPMIK+awVK9brH6Tsoy76xxeUuU5g6aCqAqdZrGuKaWiT31TivxLICvWLWUDyqweiz0glnaaCVeoxcHohTIwtwPb+MqDOmkqeZIUMKbxGeOvWoHt0Oj5KrkUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IYjzDrlX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J1LQBuxB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IYjzDrlX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J1LQBuxB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xMLw3018214
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:19:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2DfGKdATfOjFFY9gM+0rCf+mT+yAPmvFB+hWTIxVlXs=; b=IYjzDrlXZgOn9ZG7
	204v2FZhOtGB/iI7kQWIG3dMk3vFTskZ2zN4nosg3bwXHIzFMjCL3c7aS1nri9vY
	ZqIhP/opXdc9i/y7oc823v6uxDyAnVZvloX5JuSrZhuNFBHst32N+Upm7bmKHBym
	mhIZWt+YCnGnWyIr4WadFz6FjkuarX2e4aUmLdXc8UHsUyowbn70up2e9uerRzXZ
	oKqS14mfis0xnTbyZYb4MBqmY5Du1fy8+5UhbURT09EvHiQvHR34qkY0CHHnlWAL
	QDkXOOh3/SFJb/mUg5894x+C0x34zC3Y0JFwTgSMN7EqD80guK2po7F1QJBzu88m
	QYUUcA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqn2ncsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:19:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93494cce712so541665685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 01:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164349; x=1788769149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2DfGKdATfOjFFY9gM+0rCf+mT+yAPmvFB+hWTIxVlXs=;
        b=J1LQBuxBe6r/GMHXBKifg6AfchNhSKEP/SIWd4pfp9b80C8OTbkgT7TVyczKFNA+lk
         ppVvwtfyQKL30YAajsNhyrY5Wm7zLAVJigvS5uzmFiXZ2wj01x5jD+xKtjh9/EbyA6G5
         Kc7DEKSzfFwUe+Mb9trPJ+O+SvNdpq4PuwtYP2U41IEp3GjRUWTNTvlDDmmOrwJl8dwA
         GuSUertk7FWQV7uYIz06w+KtJFkeMbgojimAj0B6r1uoZBVK5EWh0Flt1XgDCtyLWXB8
         L3iwv9CSfA4TIwylJk/1L4dzUD18UTlZ30k3YvOYphWFDAgXlwFoyrJ3oJ/rw56PlBck
         ipiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164349; x=1788769149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2DfGKdATfOjFFY9gM+0rCf+mT+yAPmvFB+hWTIxVlXs=;
        b=eovJyjGyNist31tJcrH1Xdqh31t8bG1qF8dM/c8ikEvNdOc0NyH3xPozhwzAs6awyS
         fq4Y04VNhjhtkMp3PdoljA86qMUj3DvFq8lnSItlvRMprSGeB+pwWkDN//Ji6rsTsZIN
         izi4pcSJDoeoI4mMGupy6EwD/182xAFGTtALRvb8auLzDfxQ7kbV9ZqK9EnZeXAWTv3H
         FENOV8FoGjs7CaHxgkL10CuE8QJkP/Ys4o+DXWJMpQfpXLyw57NIIBVZlqjzBO+O6Ol5
         C5D/ppXbJfd1296wAn9ebef2Nt2bYzqDqa1uCXh96UU8e2yooYJJERpB6b9JXFzdY4QP
         HY7w==
X-Gm-Message-State: AFuF++lH4k2L30ucaBS0cp7nmN7W7M0DcxYeW45QxuSmsZFZ5Jzt2kuK
	t50mZgan6BnhfeeCvW/Yex9rRvw1f4fojAanHRE07wq9tNd8hgSFMTY0EVwETRPisw4dlJsA29h
	ghd07tIvmLliVyU6LS19dN/N/mYrcdbbx0CMdKzOTGTJuwz5VVtkPErd/r7sXk/BDw6MW
X-Gm-Gg: AR+sD12TrgRYkI4Q1NxIlElByCMxlKUle/b0fP+sCvoLen9ZolxYxBL2GSIXq9a/NML
	YIuxOZwqOeClKYqFZjNoHOluvTG0huPYkwobE1kRmouppUClqOucKerVZ0Q3HujP+FvcN0Q06WO
	cMLmouvXX8C5wZ9bZ93yXVt2MtVtMUl0gi8u+Mb4GWbTojgl248oL4GpiSs+HZ7Pd63pBzDN93G
	DvIcX+roxxljUMA1tr9/qJEbuUaDo/nTuwAI+6SfF3B1g6d8muQ8lRrhS1mF7OVW0JiJMQdy9PD
	0UfvE65QCHx5/KbALeCUdOElxVO3kcFcWHtRcHEKW4nw2gLQ+/S1K/Kq3fNrww4gnTcGWCh4Hss
	iT84PmdEfQHtdeB5GpUfTfTL/kqBcvEGC/VclLITktnuthP1JjezXNiQ8AcNs2Os=
X-Received: by 2002:a05:620a:27d4:b0:930:adac:1e99 with SMTP id af79cd13be357-93913988103mr3002958085a.38.1788164349397;
        Mon, 31 Aug 2026 01:19:09 -0700 (PDT)
X-Received: by 2002:a05:620a:27d4:b0:930:adac:1e99 with SMTP id af79cd13be357-93913988103mr3002953485a.38.1788164348971;
        Mon, 31 Aug 2026 01:19:08 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:19:08 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:34 +0800
Subject: [PATCH v6 17/29] drm/msm/dp: add msm_dp_display_get_panel() to
 initialize DP panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-17-c91d35d6fb9e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=3826;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=WB3JEW4F3W0Nb4YZZ57tBhLxCoKYBW7PUps9LAMtJN8=;
 b=CROqjXteH0mUBcQP9g57bVnwYJgCdbRhRQYMKcKyZpYZkrxlX8gamFJM3qttKaqfJoa3b4Ftf
 yaFiAgwOGu1C24Hq+Vp+l/p6ScXCuCHyajbRMmxg4wrwplDbOfchDSn
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: G8K37dcE7rKW1cleklDD87WxXZAOjuEK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX8LwG2bG1tvPa
 f15+LtoLjJX767ydmwgWlixVa1+Z8i2vT3bSV06AmnM8glHErI1u8pHqQjD2n1YxdE77tQfQ7T4
 2jBHHfC9zqLyZOtWjtl0O4LO4P63oGwXsiw67byoa2a4cnOX9kewK7V/6D6Ihi5/qRxrnozr8eD
 YYgYYU+0Hp1gMJrxRW5RHPFBPoEwngjVBLwe0pYrL18jC8zpl+IcO4viGFGrYN+HP1ZM92idzDU
 dX48frpadAVpR6yVEPP11kEHEX3ZZpC5fhCudhheFUS4zznj9UE8xKo6T4IEW/WrU/mj97WefxE
 F8uBwu+/UIC13YRpkyZccZSNkEeTyB/1ykriH6qOuh2+H9B41Z5Plx1zi/k0vkPBSKK6zCBHO+1
 hgPDEjWkZhqAiNAKW26Q9ASvhSqrEjrrhOILiFJfAZ8mL+MY6tVVAobvJYVMlXY8eDNF7NrO7hK
 3AggA67Zfx0EE/3ufmA==
X-Proofpoint-GUID: G8K37dcE7rKW1cleklDD87WxXZAOjuEK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX/JiSXVqsTkw4
 xwOPmd/dYdlDUFxuvpTn1I7fSmpVRynRhd4x5JFA/exGJG/bGQ22+GeNMCcNAdGQD2xaYjNBmc/
 dmhUo7O9AN3FZS6GujTe8x6+ByLdsZY=
X-Authority-Analysis: v=2.4 cv=a5kAM0SF c=1 sm=1 tr=0 ts=6a9538fe cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=kCKOgzAXqFYlHSlaV6AA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add an API msm_dp_display_get_panel() to initialize and return a DP
panel to be used by DP MST module. Since some of the fields of
DP panel are private, dp_display module needs to initialize these
parts and return the panel back.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  9 +++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
 4 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 73aabd219125..c4936e8ba48f 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -3130,6 +3130,15 @@ bool msm_dp_ctrl_stream_clks_on(struct msm_dp_ctrl *msm_dp_ctrl,
 	return ctrl->stream_clks_on[stream_id];
 }
 
+int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	struct msm_dp_ctrl_private *ctrl;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	return ctrl->num_pixel_clks;
+}
+
 struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
 			struct drm_dp_aux *aux,
 			struct phy *phy,
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index e8b445c552f7..111300784edd 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -61,6 +61,7 @@ void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
 bool msm_dp_ctrl_stream_clks_on(struct msm_dp_ctrl *dp_ctrl,
 				enum msm_dp_stream_id stream_id);
+int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *dp_ctrl);
 int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
 			     struct msm_dp_panel *panel);
 void msm_dp_ctrl_mst_timeslot_setup(struct msm_dp_ctrl *msm_dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 90e3d2c4ef47..6952f83db006 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -529,6 +529,33 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 	return rc;
 }
 
+struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display,
+					      enum msm_dp_stream_id stream_id)
+{
+	struct msm_dp_display_private *dp;
+	struct msm_dp_panel *dp_panel;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	if (stream_id >= msm_dp_ctrl_get_stream_cnt(dp->ctrl)) {
+		DRM_ERROR("invalid stream_id %d\n", stream_id);
+		return NULL;
+	}
+
+	dp_panel = msm_dp_panel_get(&dp->msm_dp_display.pdev->dev, dp->aux, dp->link,
+				    dp->link_base, dp->mst2link_base, dp->mst3link_base,
+				    dp->pixel_base[stream_id]);
+
+	if (IS_ERR(dp_panel)) {
+		DRM_ERROR("failed to initialize panel\n");
+		return NULL;
+	}
+
+	dp_panel->stream_id = stream_id;
+
+	return dp_panel;
+}
+
 static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
 {
 	msm_dp_audio_put(dp->audio);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 51eace1d1346..4d4349068c2f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -59,4 +59,6 @@ int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
 int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display);
 void msm_dp_display_unprepare(struct msm_dp *dp);
 
+struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display,
+					      enum msm_dp_stream_id stream_id);
 #endif /* _DP_DISPLAY_H_ */

-- 
2.43.0

