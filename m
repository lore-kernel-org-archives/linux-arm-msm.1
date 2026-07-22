Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C954028FF
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784702251; cv=none; b=PnW7oo1HpmTpnqoLmDYCuJv0nWsVtHZxOUmBCXcf7yvhQN3ZdifCJW8JmsEG2PnRTM7kMA7opskcW1SflI/l7MKv7Hsx9HiDsblKhSrAEefF84Q735YgjD1NiGu+iJfUObK+KDXFdqT/CmE4lln2ha+9b95GRQtZmXtNWpTuwpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784702251; c=relaxed/simple;
	bh=ru2Wb6WusJrEqzG9fcYZvfqNT3ibrquiqxYIOULpW3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ONCsJmQL/5AMa2zhRvfYu1NmvnCxZlZlQb5cXqB5KhZZ87+ykoLiUPhQo3cETeeKcF7qdkRaTJhPM85jU4/yU2kENNU4DzmIV51UPLn7WTvo+19m8Il5vDTMlLiHRdn7U9/TtY0UqEKuJzWp9Fq6qRFVDHpn2FsQhnK5x450P44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SvqVDo1k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B5HHpW+g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SvqVDo1k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B5HHpW+g"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53gvM3473627
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RkBsQAWB9soKsoLrvCV1NtPiFvCgA8F8m7591cr4bVk=; b=SvqVDo1k0aC+hWx9
	mj7liaY+to0Mp4vspuNWeID2pX5m8amrD0BHR+vXtYZdiA59nhYIvL9vnqIIl/B7
	wl8J+UuEecS3loZwwve7Qp0/1QzndntHHVt5jkU2LKd+QK2WGKkciwaCoAVPb5Ui
	LUsN1nHx/03t7+7hAbYCLvQafn+tp4rZxDZebgfK/N7Zk1lARSqBxNVZTO3vfoCh
	5vqqxnkQ6D6NXdagserTw7egeNoBdZT/5xG/zOdkFDnZhaao6DdHf31XuRe/JFJZ
	R4ZGMzyKIlRgjJ5TsC7ACYsviix0cBXgHMTmon6vN1GeKyUQ7PDCpbRQ6uAMxWIO
	qaXI5g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6ftmd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1c7f135bso182826451cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784702249; x=1785307049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RkBsQAWB9soKsoLrvCV1NtPiFvCgA8F8m7591cr4bVk=;
        b=B5HHpW+g2uFGclUAW5qSsFC7WUle+vGxRCzzznfxObJ2+4wBbIRuAOLn1irJVbG6vh
         fagHm8stcVEMp9+zPGOWkoqlkYV+R+5ZPrgmsekh4XZqmWg5ZCcFusNdPbnhZQfg80CB
         KZ+/JDAguzziqjO+F0OqS33KlwliKg/kZImI6kfrGIJyN2p8l2IBhz7t9SQvX0yRUn0P
         Ty2x4smuEKysbsCAHNv3BN2EAgh5Otm2yQ9qWWWqNpkZCgS7vPtnC1d3ahMMPk5hmGkb
         BsFGKSUo0louW7VYitUey7ZZN2VlDLfTIoYyqDggfJawFzlw54yrkKabYptPHbYcc6sD
         Wd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784702249; x=1785307049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RkBsQAWB9soKsoLrvCV1NtPiFvCgA8F8m7591cr4bVk=;
        b=LHVRkUXHdzEPF0jBIgt0iqz6UbUjQwEs0ujKfom74wIrCPkfmUrTE31hDWWy/IiQAJ
         T9viN9HwBVxvY3qtKe9FyhNGFlOyKGlNecbNraKOYToEXZyYqFM/gRMWUI9w/Rib1C/g
         wXycgnJYn3GmHZ0qre5aUVeGu0EuQHJ7Q5bVd7jXy3UZ7xcALRr3yOA9zqqy7ZnQJXvW
         V5mBMQ3D1pFeJIqL9GFW6UeXfwEDc48rkMl+821ew51NiIYO1eZ6YSQziCOqZN72WDwV
         QCX7Wf/CiVhqQseGwnjCTrx1wHouXyBuz8w6UfGlhV5itH22Qb3GYmCgTctL+FSIKC75
         YPzQ==
X-Gm-Message-State: AOJu0YxDFqmPoUhzfI28kzBmVsH0mHtB0+9623I/ml+7apcE0n0xrEZv
	1a0qe6/DTw3qrmHOwmtUZUgDIH5QdoWNZMdjkJHH9nO3/PyWvz1ybBeA6LWoRdHH68180LEkZBh
	IEuu3HMWypOZ/nifrw9l91OPjJURRAurbQPZEKpWW3pEd6Kx+mL4H3TL09koeW3Du2ZJ0bW1gUr
	YO
X-Gm-Gg: AR+sD13XDefMDHPUELwvQPOdcMEhIsR0Ps9odsal/NvRsFurW9UdITighePL409irV3
	/ro6Hf7f1gzuRsfUyHvHsP2vTrkX/cVOOiEKdJ0cDyE4pKF+l0czFM5CjG5YUOJ9A0QlPgJUqFL
	8oLqa82KPZIt2Na2TBRXFyajh08uZV4vYL37Xja8NvN2gzwvBiO5SlLGSvaaSvPLiduyCbz1mOJ
	lgrr7JsdTVf15uhMPlPABCzPfkm5gzcrTEchQ168kGgbtcpCWW/3Vf1U+hCBJH2SAFecMO0CyKp
	v2jw7LCcCl1+otYY58mRSnuPq5l8t9qJ9GKB0EmCeqVweahN6bpNE0Cg3bX+x7Mu7NIcHsEhhfO
	BrUqTa8Eh23m57Ks/Pt7muxkIj/HyvE6S25VXdBmxq4BRJUSJN+9MshWwslbqcZxzDJSZbcmwQb
	zV7P6YOCLz5z+mPA==
X-Received: by 2002:ac8:5a86:0:b0:51a:329:e802 with SMTP id d75a77b69052e-5213f66c60amr209095021cf.41.1784702248632;
        Tue, 21 Jul 2026 23:37:28 -0700 (PDT)
X-Received: by 2002:ac8:5a86:0:b0:51a:329:e802 with SMTP id d75a77b69052e-5213f66c60amr209094831cf.41.1784702248174;
        Tue, 21 Jul 2026 23:37:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c6f6sm309696e87.4.2026.07.21.23.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:37:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:36:35 +0300
Subject: [PATCH 20/24] drm/msm/dp: use drm_display_info in mode_valid
 callbacks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-drm-msm-display-interface-v1-20-368c10fe62fd@oss.qualcomm.com>
References: <20260722-drm-msm-display-interface-v1-0-368c10fe62fd@oss.qualcomm.com>
In-Reply-To: <20260722-drm-msm-display-interface-v1-0-368c10fe62fd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2317;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ru2Wb6WusJrEqzG9fcYZvfqNT3ibrquiqxYIOULpW3A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqYGTpm9cXV4806bVBAhjFnRwAnQLIwryFRMcY/
 YP0nY0FHzGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamBk6QAKCRCLPIo+Aiko
 1TzoCAClTRqjxWI6IzRO/17UiIDa4gaX3f+NszHxiYQEom48W2TfKB8mGh9fsRKRnstpmfgPPzO
 fH6WvlGb2eutiVuEOieqlgFatmgNuZPmCuoZdnrFXKQYXeh7IUvQiuwvF9ZanX862b9NojoXefo
 EZ7mXokIAdN/tyI6s1EVEBjr3NhsGPq+/K6sWvlWhFEb+qcLvKumZJOqyD/8it5jnP6NxeUpKGq
 HvVbWWv0GY2cb2nQBlqUfsZObXK6e+8nkrsVXHNAJLWADwOMuU449p1JRPfQO4kz+DXrKrcf+bt
 YLqojqDPX7hIT/gx/7HcbnLPzWOlzQJhZsKnYJAF/Fe/pW4d
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 0MPxnZP_QOn9lXf6thYQIKOmhIME9Gkq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX9/DP4tpDAmBH
 w3e05OiqQmvJZRDWcYJfSDRMH22L+/ttozUrtTejTQ1MvApBiZPfLsXEiCcZWu+E1A4SiC1CjIN
 QJ2OVJRzGLUT6i6yTes0EHhMoXD+uGAUXjPVOhOjJX9BR5iqunWBY3QPC7WhWXKRrT4C8T97bKD
 qhAmpD9iRTEV6N5QwHrF8lpaUsIm315Hvc/9ODF15b+N3IhapN7lcedb2iPrzJL4yMBk2sByIfK
 Hc3/CC8YCimrP4XU47PBwnuRQ9VdZkn1gkrLTAT7mhshtImI6CZAyVbWE9QmSG9j71davuF6yPm
 z5nNrmE+78zqewEWT/SfPSCNRj3E5hAruOSAKKxmJP3WcONDxrnnotCWQt+rHxeaScBzrElk8+T
 3hadaiu2tEv1wndGO9aB88n0BIZKY/YwGAyjrQif/dweMn6xfGCY/kVflEqF7XFcl4SGAEQ35jW
 9neu6qjg2/PyUDUkfcw==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a606529 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=oESPpdQVtlo-kY4fL14A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 0MPxnZP_QOn9lXf6thYQIKOmhIME9Gkq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfXwdlciGbr1UP/
 KYXOvmvOZ/QdGxwHGmU6MKOmHsobLvjK9mTIbrvuD33B8W5V7JVHNh6elR1eXaJV9+ioQjeNIKF
 sXoSOOwAjOsysNfg1iA++hd18YFLQf0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220060

The .mode_valid bridge callback is passed the sink's drm_display_info
directly, so msm_dp_bridge_mode_valid() and msm_edp_bridge_mode_valid()
have no need to reach into the stored connector for it. Use the supplied
info pointer and drop the now-pointless !dp->connector guard.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 +++---
 drivers/gpu/drm/msm/dp/dp_drm.c     | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 461420a72820..3397a3a47ef3 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -731,7 +731,7 @@ enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
 
 	dp = to_dp_bridge(bridge)->msm_dp_display;
 
-	if (!dp || !mode_pclk_khz || !dp->connector) {
+	if (!dp || !mode_pclk_khz) {
 		DRM_ERROR("invalid params\n");
 		return -EINVAL;
 	}
@@ -739,7 +739,7 @@ enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 	link_info = &msm_dp_display->panel->link_info;
 
-	is_yuv_420 = drm_mode_is_420_only(&dp->connector->display_info, mode);
+	is_yuv_420 = drm_mode_is_420_only(info, mode);
 
 	/*
 	 * YUV 420 is carried over DP by signalling the colorimetry through a
@@ -754,7 +754,7 @@ enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode_pclk_khz > DP_MAX_PIXEL_CLK_KHZ)
 		return MODE_CLOCK_HIGH;
 
-	mode_bpp = dp->connector->display_info.bpc * num_components;
+	mode_bpp = info->bpc * num_components;
 	if (!mode_bpp)
 		mode_bpp = default_bpp;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 8dbe7d682ddf..6b55753da0f7 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -203,7 +203,7 @@ static enum drm_mode_status msm_edp_bridge_mode_valid(struct drm_bridge *bridge,
 
 	dp = to_dp_bridge(bridge)->msm_dp_display;
 
-	if (!dp || !mode_pclk_khz || !dp->connector) {
+	if (!dp || !mode_pclk_khz) {
 		DRM_ERROR("invalid params\n");
 		return -EINVAL;
 	}

-- 
2.47.3

