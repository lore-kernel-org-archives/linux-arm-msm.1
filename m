Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076714;
	b=eb8Ki2mlRG/Fw1IPoSS7vx9VKSazBpcg88O0a/aQchtcOUpeJLFaN03OW+Vg0HftgbLb
	 XeYFyjeKzb9Z7k+SGz6Fk1zrdcQIKRyxeJqDN91hExt+0tV1VXF/apoejy2yvUQ7aBGAh
	 x4PtVtqTYU1uc3masXOkvXD9tev0ERcsguewnbWNVvfkVqkSGvjFuW5qk7+XVm8hriT2D
	 dE8SCwRWoj8jpeMMcEgEypnCpUV1/bmPRT2g4+kD2Jt8X8aKS87Ri8mAsUU7esQOFY8qW
	 piWslmUouKMcJHATNOq9O3mCfUAMfFmOefOdx+Xez2g+EOLAAZVgN6bqQEF8JjgT2FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076714;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wRoGi+ko4pfiJX0p7XmAqIElu01RnwG2HIv7gmybVcg=;
	b=ZWcJP7HpK/yAClo9rNumCZv0y/lxxIEMkgXRc4XjCqd44wTMAGtX1Y7DVORgQpcao7s3
	 BklNFFQJNU6ZciXEriuV+4Rw1dL35SrY8vgcnI7EeaRkwuKbv9OjurLvvaYGJUuSBvJpe
	 LwdORenh1g8NW3eFVO6Ow0RQAIu1MwdRo7a63E5Bxk9PwjCRYC1UyfoKyR7PM8N7vkdOb
	 8cAB3pkvmFZvhXsEpIdOhUvSYyPN+U5roDdaSs+No0dv771Sdu8dmc0/RcTJgdPRHHu7X
	 FAwICRoEV5SjWrRqKdc7A5NRGOZ2zYh9sqoiiLywoM4RUfrSUDh2OwuxTVCpIPwuVVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U1jgcsrx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=apmY1m2L;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6994606A32C
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6994606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U1jgcsrx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=apmY1m2L
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ7ZsjC3718253
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wRoGi+ko4pfiJX0p7XmAqIElu01RnwG2HIv7gmybVcg=; b=U1jgcsrxMhLcQ8l5
	pqXVecDODk8xIyp6fd8m6IKCad1u53psHkWpZm5BaN7weABoFgK7t++YnxpryxM6
	mwavuZS/P2DbIFx3w7IY8wVPIXVEuc/UpaGbfuL/G+QY79pSzdpL2CCPVweBX8XB
	3Z9iOVVZn/Lg1/fJybg8BqN2nEWgU5uUXTAOv1cIjJBJHLkGHH7kmCuBzoSBezRu
	60u7xiq8sAT7mfbbLDdPLpVVNAyLOjsUKY8O5ss8oZJG6wncRpeJkLliTO9xhHQ2
	pWid9tjOZFNOQqXZ9Ek0N0vNKjmZvqASTm3OcdRbF3qtazdaLmiIercQ1F21Gvfk
	VuNDJA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1vv2r703-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:25:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so376085785a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 00:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076712; x=1795681512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wRoGi+ko4pfiJX0p7XmAqIElu01RnwG2HIv7gmybVcg=;
        b=apmY1m2LAa/MC/NR/uhQ15oDUAi2Id5ammQHG0KzBPnhzHB2n9uYFGko8dLwtBq/aJ
         3hzV+g/jTJ5mRk5SVYnLSkd2SH8/9nqywUBpz4GyhXichkBxF6SjVb7H6OQzaOOr16yn
         ohJwFJuhH/hNrfE26kr+/feZqClB+sunPzCHEm4yqxlTddbecx0vHbrFH/+tGLXwECZm
         rlGDxCtTufeVr+qsyOKWOXVOFCaLSKvgP23OemzkxsqTxEVsQfzCZ8umJzHymRMgolNn
         oU6zHl3+JB2SA6Ynzdtl87p8BQuyG6cSc+pMVHDdYarnyOHP5bEf7tVmWgtUMNy4ETLo
         h+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076712; x=1795681512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wRoGi+ko4pfiJX0p7XmAqIElu01RnwG2HIv7gmybVcg=;
        b=IcMMsEqcrVT1Q/QFEM9IHsleBlOMmTqvpD/K7/cf+frH2pvhlNi/ZaOXon4iChUWhl
         uuT+kDWJRyFu5q/SyS5JtX6kcpo/KYpA53jXfcGqRmYi2c8F7KVCzzWNv4SLE2UBgKJy
         1FITnfm5dEkvp5zD0LdAsHALAel1ZO8/xxT9Q9DemrTyz7dPIezS5rHfH5QRZcXL/Std
         dsMC+7ofMKx0U3d/N6oupE7wMGUUPgZ1gae6YMZLkCkZVUR45QSG7vmQBOVlUHFxViGQ
         TKL94UqcfivgK9Id9rismGCYdyhJTcsiVeqYa8z209WvY5vbphvTWLCbhjzG8uPFBD77
         a+cw==
X-Gm-Message-State: APuU4Z85m1EJLLo3i2DfWXJUfLnikDlx8nijWyuQGofSUs4/onTe39xA
	P6ZaElXpTOWCRMwMM3I57NJnTUMEVRbbp56x65BJMLpQjF/iJJF8uVkOpPEPH8fygN6k8he0dxV
	Y7RNWXfNP33W2l9JJK/7iU0OTdX709mqT9Wf0dSLbNcX9IDplaN3PyUpqcYGOSIqE0XlI
X-Gm-Gg: AYBFou3eG2RE7q2X8A2+o1KkgMEoCn6/HhY3M25fne6XLK81ti9kEzwTRVsW6lWo6vX
	r0pDFCBvze7osZrIMRC+t5yyf9S0QA8y21sS9W/XpX4g9dnCo52WP23jXbbStReHNAXv0Cv1xPl
	WpTtS4kd1SnLeGIkaAqQxBmKTI3v+o+/wvvGUNiPL88tTfvWuaUiLEydx05rgpg3HdaCOSqvX8l
	zNwAcE+zhu2rhKKyH+RCd+8Wwn4T0Z+qjg4Xa+tAw4VERP5f3F7ttYMBn8F3qlgCowt5NdAtAXo
	Y7wdxxILSHOdhZaA7/KZ9t5X26djkVxYrJ7GEECTVL3fYGQok6BOo24fW3e7m0i52ywWIPnt6PB
	+N1yrVl1i3F46gxNi+JDnRvcblVcQf2qKvvk41g85paCjrsil4OJa7kLyVLWpEOAvgJg/W4LQlI
	d0GVJjhoQfOqp3Oo130X96fuvNrj4ycxwUFLsD
X-Received: by 2002:a05:620a:ac08:b0:93e:c12c:4402 with SMTP id af79cd13be357-9499b303374mr661244285a.79.1795076711769;
        Thu, 19 Nov 2026 00:25:11 -0800 (PST)
X-Received: by 2002:a05:620a:ac08:b0:93e:c12c:4402 with SMTP id af79cd13be357-9499b303374mr661241785a.79.1795076711265;
        Thu, 19 Nov 2026 00:25:11 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:25:10 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:10 +0800
Subject: [PATCH v9 08/29] drm/msm/dp: replace power_on with
 active_stream_mask
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
Message-Id: <20261119-msm-dp-mst-v9-8-ca61be4edfc3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=7050;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=tcZD36jERDRUia7uqcbSeMVy5ZQ1xToMDIHFkd6tYro=;
 b=nsMtwPuBEWLD2C1MrMyXzUXTqZidodIWKX4eiK4MS4dBFcCBTYYfeipIfrGXCNF4kDJc8uQPh
 DC7Ebp5J1MCBYt9x97NJlIA3LWg7+vddBGLQr7Tq2hAg00JnX3agL1f
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: peLQgvofgKCc1VpGhXI1xCxIv4e7SEug
X-Proofpoint-ORIG-GUID: peLQgvofgKCc1VpGhXI1xCxIv4e7SEug
X-Authority-Analysis: v=2.4 cv=ZZWIpcVA c=1 sm=1 tr=0 ts=6afeb268 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=OPa7gS6xof81t_cfdRgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX09TOUTI6QTME
 8z6ric+a+tqprhyBkCfgL8BPU0vdvOATBPf2pXpT8yItjkO5qcL1ed3nVJhD3ziVdTLEm0X460h
 5HF0Mamn1bmKpmpGJ2pv0cyHdh1dmwg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX05uI6QyFX1OO
 re7ceBbj5JyKjGdB4oRnXXhDKY2pasluiWoAVfL/CSokqHKKcga/G3X+C8VRi7+Wwa00LS+xr1m
 xAJyzKb6uEAwZEOSvEfXINSlwwbL/mnCwLgesdlj8xN1fZMvnXrSUYzP/D78GsXdNyiJeCV9KAb
 F4SSxCZeXnssmky8XDFKQpFGCiFPghzxMlcGruzTyyyIahDMzViv1sBS+IaxK1mEXMbeAor3pvG
 Mdf1hrAWUBCvKuEmcJfZQScSSPAMConQngnAZlh/X7vHMXXGs6zIerAAegFySi7A0ONNRUQionc
 mV0VPFc5pxLmvcZuITETifU9OYhAWTM/wZKhTonCTbBKXzI+XX44f4R8F5kbolEGu+mWCHWOhhh
 8Q3slZTdUBcqoIOHkualpvcEK0+00rdOwNbr13lAO2wGe1g4MGnaY343f/XKbDVdXxxawOCKGxM
 Nsvx6UDZbnEOsSnGHoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190033

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

The power_on boolean cannot represent DP MST, where multiple streams
share a single link and its associated resources.

Replace power_on with active_stream_mask, a bitmask of the streams that
have been successfully enabled, and use it to track the lifetime of the
shared link. Link initialization is performed when enabling the first
stream, while link teardown is deferred until the last stream is
disabled.

A per-stream bit rather than a count is needed because two callers ask
whether one specific stream is up: msm_dp_display_disable() uses it to
stay idempotent, and msm_dp_display_disable_helper() uses it to tell
whether that stream ever made it through .atomic_enable().

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 56 ++++++++++++++++++++-----------------
 drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
 3 files changed, 32 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index df222943ae57f..05972a302e542 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -284,7 +284,7 @@ int msm_dp_audio_prepare(struct drm_bridge *bridge,
 	 * such cases check for connection status and bail out if not
 	 * connected.
 	 */
-	if (!msm_dp_display->power_on)
+	if (!msm_dp_display->active_stream_mask)
 		goto end;
 
 	audio = msm_dp_audio_get_data(msm_dp_display);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e046184a30f50..169990c10b367 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -652,16 +652,16 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
 	if (dp->link->sink_count == 0)
 		return -ENOTCONN;
 
-	if (!msm_dp_display->power_on) {
+	if (!msm_dp_display->active_stream_mask) {
 		msm_dp_display_host_phy_init(dp);
 		force_link_train = true;
-	}
 
-	rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel);
-	if (rc) {
-		DRM_ERROR("Failed link training (rc=%d)\n", rc);
-		// TODO: schedule drm_connector_set_link_status_property()
-		return rc;
+		rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel);
+		if (rc) {
+			DRM_ERROR("Failed link training (rc=%d)\n", rc);
+			// TODO: schedule drm_connector_set_link_status_property()
+			return rc;
+		}
 	}
 
 	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
@@ -671,21 +671,19 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp,
 				 struct msm_dp_panel *msm_dp_panel,
 				 const struct msm_dp_mst_slot_info *slots)
 {
-	int rc = 0;
+	int rc;
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
 	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
-	if (msm_dp_display->power_on) {
-		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
-		return 0;
-	}
 
 	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, msm_dp_display->mst_active,
 				   slots);
-	if (!rc)
-		msm_dp_display->power_on = true;
+	if (rc)
+		return rc;
 
-	return rc;
+	msm_dp_display->active_stream_mask |= BIT(msm_dp_panel->stream_id);
+
+	return 0;
 }
 
 static int msm_dp_display_post_enable(struct msm_dp *msm_dp_display)
@@ -732,9 +730,11 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp,
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
-	if (!msm_dp_display->power_on)
+	if (!(msm_dp_display->active_stream_mask & BIT(msm_dp_panel->stream_id)))
 		return 0;
 
+	msm_dp_display->active_stream_mask &= ~BIT(msm_dp_panel->stream_id);
+
 	msm_dp_panel_disable_vsc_sdp(msm_dp_panel);
 
 	msm_dp_ctrl_off_pixel_clk(dp->ctrl, msm_dp_panel->stream_id);
@@ -851,10 +851,10 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 	 * if we are reading registers we need the link clocks to be on
 	 * however till DP cable is connected this will not happen as we
 	 * do not know the resolution to power up with. Hence check the
-	 * power_on status before dumping DP registers to avoid crash due
+	 * active stream state before dumping DP registers to avoid crash due
 	 * to unclocked access
 	 */
-	if (!dp->power_on)
+	if (!dp->active_stream_mask)
 		return;
 
 	msm_disp_snapshot_add_block(disp_state, msm_dp_display->ahb_len,
@@ -1514,16 +1514,17 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
 
 	/*
 	 * If .atomic_enable() bailed out - link training failure is the common
-	 * case - the mainlink was never brought up and ->power_on stayed false.
-	 * Driving the PUSH_IDLE pattern into a controller that was never
-	 * enabled times out, and .atomic_post_disable() then drops the
-	 * controller's runtime-PM reference without tearing the PHY back down,
-	 * because msm_dp_display_disable() returns early on !power_on.  On
+	 * case - the mainlink was never brought up and the stream was never
+	 * marked active in ->active_stream_mask.  Driving the PUSH_IDLE pattern
+	 * into a controller that was never enabled times out, and
+	 * .atomic_post_disable() then drops the controller's runtime-PM
+	 * reference without tearing the PHY back down, because
+	 * msm_dp_display_disable() returns early for an inactive stream.  On
 	 * glymur (Snapdragon X2 Elite) that combination is answered by a
 	 * TrustZone-level SOCCP/ADSP force-stop and a silent SoC reset.
 	 * There is nothing to push idle, so leave it alone.
 	 */
-	if (!dp->power_on)
+	if (!dp->active_stream_mask)
 		return;
 
 	msm_dp_ctrl_push_vcpf(msm_dp_display->ctrl, msm_dp_display->panel);
@@ -1535,6 +1536,11 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
+	if (msm_dp_display->active_stream_mask) {
+		drm_dbg_dp(dp->drm_dev, "stream still active, return\n");
+		return;
+	}
+
 	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0)
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
@@ -1547,8 +1553,6 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 	else
 		msm_dp_display_host_phy_exit(dp);
 
-	msm_dp_display->power_on = false;
-
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
 
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 472429d092009..b163954deafcd 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -18,7 +18,7 @@ struct msm_dp {
 	struct drm_bridge *next_bridge;
 	struct drm_bridge *bridge;
 	bool audio_enabled;
-	bool power_on;
+	u32 active_stream_mask;
 	bool mst_active;
 	unsigned int connector_type;
 	bool is_edp;

-- 
2.43.0

