Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286593;
	b=yMcwqizE506bDuOlVH/M+le8KvQhAsSZs44WKvdXt0tWpyDOY1p61ff1x8Mz4njD8gVJ
	 8CqzZTcv68qcIx+j/ErfsTZp+2qjRAxvc8FbiMyh8Vfr+xz4htMFtEQNxXQgDWxFYPMTC
	 Cy0+LkvOlbfUUiZd6kd0Np8DhYiWBUawoZ/y/QzbR0qmqiRZosNbU7c3+BPWAQNemumnM
	 IJP1opNntluMo7dIPn2Gd2WJ7pnhE0KunC0vkKxrU7hXVlZx6YuVJhTvWQP8R24+7PxA3
	 fvO9dpG+G9MucmFMTDUfdOVqIJuIYnJdV3vuHwIinj1jInSuI4AkVjlnRsfb6742iog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286593;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pHoKtlWw4MdcYFAmqyM5G73oF+4uGH19uwdrJT6LYX4=;
	b=GTM/OedFp0UBgf6T1ahCmKGqbA3ezSu2/l7GoQuctNPWn6e4rIzpro72qdB91dsV6BUM
	 lNZi4FmN9quHpIQPTUXxch6XbrsZV6l85jA5xvYPhmLiKZ24pN9V4InC5SoEixNr7v3W2
	 JXF8yjHtHVbz6jzgd4/atrsW5Ey5USra54RhZYiq/vIOzmiA6LhtWXPAus4YO7bCjilrW
	 aGGeOZNP/OEcFR9ji+GEQFiFtpqt1dGs/DdR3hDnZ7gyJ+WMcrwRPLnwTzs/SDwQV7m7V
	 VdkU0gba8uv8qxn75/Dw8+zErFwhj26c4EQ0VrW4p5nV+Fgfi/T51AOEnwIrcX+exAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E7wosx5r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CDLHLC0j;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C5760A260A
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6C5760A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E7wosx5r;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CDLHLC0j
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A4Cm679535
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pHoKtlWw4MdcYFAmqyM5G73oF+4uGH19uwdrJT6LYX4=; b=E7wosx5rAIy/sM+8
	3qCz8bXrtb6w+UuK1nBMioV2FuH+Ik67j5I27SPtC87BSE7nW/hS3WATJMf6vfh7
	tBxkv7NOpNDU/+O+H4iyS9fGK1oe6e2nmdvyKKKSi8eXhcfb0eudDvDnD4vj4Fi9
	9YVGew1FGUtJphXIi9Ip47CsKsLl/1Y4wchXRR6FYLVzcuvidh3ISwfKs3sLBecG
	xvQwCklWl4FDGO0R7UfZfzOowYsFf0B6jp2SSdHK0gvaGqZEALEamB1PBA1A32FQ
	2fW41nLO4/Cxr8+rRp8+E853n6MBu1QCh0IGqWm/Zs4kHhyceUMEiVqY2YNV8SNl
	2J7z8A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv48d5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:56:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91ea864ee9cso46275816d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 20:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286591; x=1794891391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pHoKtlWw4MdcYFAmqyM5G73oF+4uGH19uwdrJT6LYX4=;
        b=CDLHLC0jxCBRrR/ro9krjjLdTYzrLoc+KAaS5TGs0sIqdEYh/x/RdP6T3wXAJAGnJN
         xEwqCefp4n4j5ZLERJkLKNYpnWeFGiSDNIdRD8ZOT5YVy9xI+5BnvFciHGb+BedlkuE/
         bvyy5fTlCvKhWLuxCMmSCJKwPZEC8Fw+ikD7S9Nhv7TxUg7XWWOE3EpPw4gVtL20J2en
         mjkjUONRYfh36tB6/sxmyA8kSfLjXG6jws/9xAvSraa9+OlvuMQ9DpEkcIC6wgdmbo5Y
         SDVHsogGsgwwZLZi6yzmt5ILo3Az2umztu4g9uKvbHQssRvxx9n7A7D1qDTiS0u5TFlY
         b0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286591; x=1794891391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pHoKtlWw4MdcYFAmqyM5G73oF+4uGH19uwdrJT6LYX4=;
        b=Ml1qK2mcR+R+Zfc4V+bjskJ9e1koOK2zXklQdE6wF03KhYjugEN24juBrAC4rMxegp
         3hHcOxhKOB+wnVqSg+Jkra4q611OoFuzU29GBxYBpIrJmvXkpSKaW6P/6ZXB2No8tW+J
         FwY5Syqo9DH3GQ6GYjgvkCoir9iFBFpc71k1Kp0e+ioAY6yL1bWn3SMKIBKYOsXC9VIg
         XimrLZRGfkAzMA/ItPQiq9GPK8ZiWr1HwQr979HotZ99Werx0Er0GeqowPTHXZPsiDzk
         fOrvJ3+P2NMnWe71ytAGa/+V6AE+s1V7EkBsg69yBIMQEi/o4Xv8dsaU2NU2MELyhUeE
         h2KQ==
X-Gm-Message-State: APuU4Z93/EYi2RqbqZTYIVOMYtTOoDS7A8dLPZz8ccD4fC5+hS7utUSp
	47iiuLBk9qXW+CNryRo3d/W1OjWyQduL5YLANjyruID9Ru4wD8o9Ivu55L10fu0K6PKFZEXqz12
	W2gRtpTxuRboLVV4gEiW8Jg15nEvSiHgRUEFB+c4gUgwjKkxaDRw+RQpi0e5BsrGhwmcg
X-Gm-Gg: AYBFou2VH0Z81lnEm7og12ai5dSqKOFIFS1MoQ2n4BldoJ0mAP9rfMZL1zmz4Z0uX4m
	/U66HnD0cH9PJ9piWNa4pZZdCae1lTlNd8sKIHkq9v+uxHb9ZD13+iGeHtvSb4spZ9xmUlYELwD
	CsdGupv/WbRP7nKMcuxmtz5A82P0vlVvs6AQP4h/uza6ZgIHO84Nd1Cf1JXAcUmmp8eUuuFuMfh
	RfKHrpOsfdgB/sTWJUZjd7GxGzlMEUmyesd0HkyCnZV6HjRjLhh9NAiB8gNm3u5AeLaIcxgNm7g
	4ZfrVJt2IjiNAgY2+r1mxvAfFXS24uv3QU1uO0eEq/wYC3pmV3Rmw9wLMPRCAoqY1JQrxeUhXVr
	Wz2sWveAiDkIxDsiTZvOp58//wilcPZWZbXq8NbB5bT0+IL2cIA/cAvjwI6MhwRdBnyM/admdK+
	nqyzknjXAOoNSBpyXmP/awpEO6xh8uCcavRaAo
X-Received: by 2002:a05:620a:28c7:b0:93f:6f8:9d74 with SMTP id af79cd13be357-9479f42f4cdmr235196185a.77.1794286590886;
        Mon, 09 Nov 2026 20:56:30 -0800 (PST)
X-Received: by 2002:a05:620a:28c7:b0:93f:6f8:9d74 with SMTP id af79cd13be357-9479f42f4cdmr235194485a.77.1794286590434;
        Mon, 09 Nov 2026 20:56:30 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:56:30 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:45 +0800
Subject: [PATCH v8 24/29] drm/msm/dp: enable MST on capable sinks
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
Message-Id: <20261110-msm-dp-mst-v8-24-d040fb33db5f@oss.qualcomm.com>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
In-Reply-To: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=5632;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=MQxn5IlgLyQD5lvs7GYrzOJlBKGomT/Bam5EUTVFUfc=;
 b=pqZSBqM/KXCOlw4EjXksUQ8SdzCIZAWlXsfM3ImxYIWXm1ATC+5t66RSCeWSpx6vnuvWSxaH/
 QfCGsnw83EjAGn6V54d2TbYTDqyKSseO5tNPNy7IYCSXN2wLr/pN24U
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX0eE3P8JNWXEO
 Kl+skg/ui7lyDal8VoGo/Tn5dcL2NM/9ALvXP4uz6WUgtW2CdeAS4Q4NTPcsKcJ7malhTTtJdJd
 LE94wuSLaV1/fvpfrLaeEx4jd8lKX7U=
X-Proofpoint-ORIG-GUID: 7I7RjqithFvKCuhqXCNmEA28fpT2zXc4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfXxTFP2CX5Ilm+
 9BxBw9sYDnMtxL75qpDRV4BQMzVagHdsld9MMnxS/VCX+IjBGVPyaSS6gUp3+Y0Y2AyucbvH6Gp
 5spPa0y4pOtU7weYj6sEEqlcsbC9Plc76AE6J/voSYlFKBPSUMvQaNkYpuXm4hjWuyISpWgCIM2
 lfv/UMr2feJeYqyWYjIahiXI1yGvBTvvdG8IyzpbDZ6WRvg5qzll9nGBXnLNkLEUzaSUjnB3TPy
 11LA9Dh/lts9RSZ97RnqTF74Y/zl/5zVDDM1MsfNjCRzyHFow5+R51kn5zBzn+Pvz2ag7hYYyo7
 9mF+i4T5EJw31KfqIx/5q8csXD2GwAgwqk/t9grNvKGiWb+vQqarwtwzyDzVdrqOzl2jMSK7EXY
 TnjpORFY96fgHKqNTat6IqPSFhyCYbX8ZnAI8kIuolc4Ld2esB3qlKjB324JrP2Su236RfkrpEp
 Rrmg9i6kVdo2aBjIWIQ==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af2a3ff cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=-w6CXN-5EBmt9i3D_LUA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 7I7RjqithFvKCuhqXCNmEA28fpT2zXc4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100019

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

MST topology discovery requires the sink to operate in MST mode.
Enable MST on sinks that advertise MST capability and are connected
to a multi-stream capable DP controller.

Once MST is enabled, downstream sink discovery and EDID retrieval are
handled through the MST topology rather than the primary DP connector.
Activate the MST topology manager on connect and disable it on
disconnect to track the sink topology lifecycle.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 52 ++++++++++++++++++++++++++++++++-----
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 15 +++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
 3 files changed, 61 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index f87eea19c4f5..eeb0e0494900 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -14,6 +14,7 @@
 #include <linux/string_choices.h>
 #include <drm/display/drm_dp_aux_bus.h>
 #include <drm/display/drm_hdmi_audio_helper.h>
+#include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_panel.h>
 
@@ -270,10 +271,34 @@ static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd
 	return lttpr_count;
 }
 
+static void msm_dp_display_mst_enable(struct msm_dp_display_private *dp)
+{
+	struct msm_dp *msm_dp = &dp->msm_dp_display;
+	int ret;
+
+	/* Clear any pre-existing MST state before enabling MST. */
+	ret = drm_dp_dpcd_write_byte(dp->aux, DP_MSTM_CTRL, 0);
+	if (ret < 0) {
+		DRM_ERROR("failed to clear DP_MSTM_CTRL, ret=%d\n", ret);
+		return;
+	}
+
+	ret = drm_dp_dpcd_write_byte(dp->aux, DP_MSTM_CTRL,
+				     DP_MST_EN | DP_UP_REQ_EN | DP_UPSTREAM_IS_SRC);
+	if (ret < 0) {
+		DRM_ERROR("sink MST enablement failed\n");
+		return;
+	}
+
+	msm_dp->mst_active = true;
+	msm_dp_mst_display_set_mgr_state(msm_dp, true);
+}
+
 static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 {
 	struct drm_connector *connector = dp->msm_dp_display.connector;
 	const struct drm_display_info *info = &connector->display_info;
+	enum drm_dp_mst_mode mst_mode = DRM_DP_SST;
 	int rc = 0;
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	const struct drm_edid *drm_edid = NULL;
@@ -288,14 +313,19 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	if (rc)
 		goto end;
 
-	drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
-	drm_edid_connector_update(connector, drm_edid);
+	if (msm_dp_ctrl_get_stream_cnt(dp->ctrl) > 1)
+		mst_mode = drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd);
 
-	if (!drm_edid) {
-		DRM_ERROR("panel edid read failed\n");
-		/* check edid read fail is due to unplug */
-		if (!msm_dp_aux_is_link_connected(dp->aux))
-			return -ETIMEDOUT;
+	if (mst_mode != DRM_DP_MST) {
+		drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
+		drm_edid_connector_update(connector, drm_edid);
+
+		if (!drm_edid) {
+			DRM_ERROR("panel edid read failed\n");
+			/* check edid read fail is due to unplug */
+			if (!msm_dp_aux_is_link_connected(dp->aux))
+				return -ETIMEDOUT;
+		}
 	}
 
 	msm_dp_link_process_request(dp->link);
@@ -317,6 +347,9 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	 */
 	msm_dp_link_psm_config(dp->link, &dp->link->link_caps, false);
 
+	if (mst_mode == DRM_DP_MST)
+		msm_dp_display_mst_enable(dp);
+
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
 end:
@@ -502,6 +535,11 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 						 dp->panel->dpcd,
 						 dp->panel->downstream_ports);
 
+	if (dp->msm_dp_display.mst_active) {
+		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, false);
+		dp->msm_dp_display.mst_active = false;
+	}
+
 	/* signal the disconnect event early to ensure proper teardown */
 	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index 15405080107f..2b96e003225d 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -362,6 +362,21 @@ int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
 	return 0;
 }
 
+int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state)
+{
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	int rc;
+
+	rc = drm_dp_mst_topology_mgr_set_mst(&mst->mst_mgr, state);
+	if (rc < 0) {
+		drm_err(dp_display->drm_dev,
+			"[MST] failed to set topology mgr state to %d rc:%d\n", state, rc);
+	}
+
+	drm_dbg_kms(dp_display->drm_dev, "[MST] set_mgr_state state:%d\n", state);
+	return rc;
+}
+
 void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display)
 {
 	int rc;
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
index 3bd3e66b4eac..84de7ca0c689 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -12,6 +12,7 @@ int msm_dp_mst_mgr_init(struct msm_dp *dp_display, struct msm_dp_link *link,
 void msm_dp_mst_mgr_destroy(struct msm_dp *dp_display);
 int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
 			      struct drm_encoder *encoder);
+int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state);
 void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
 
 #endif /* _DP_MST_DRM_H_ */

-- 
2.43.0

