Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60063E4510
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790655997; cv=none; b=evFcbsM5OKNgsT9tD/CdHmYM8VsfRvRSbiGhi2n55syNXRzCdh4S7idg7cX6PIlsx6e3geUwUyELT38Rf+LfMPNOuOfjqKNWGTEv1RMLzGoheGFqhuHK0919OeT1561HU0Xmnd3Ns8Qqyo/xB1Uzf+7HlTk39vXdl28TyWv6G8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790655997; c=relaxed/simple;
	bh=f1K4UM0j8Cl3LGM224EgN5DwT8LVjxn8PqEmhdhVTyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OhpFgptyEYdlpXxV4EHAkr2IodeGF9ZJhf68E1UN3QCvd5+s5Qw+nAcDscviMLt0HhBS+SP8pvCPixmgL+DIHruEZ6u6aktBldpj6wRqzAcnC36EjfmoN25NvAHhmpuIE2CXCr9W8KME63vt3a5EZAxTlbEok6NqMpg0a8R/sJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hIfvVlvJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QZpCmzE1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hIfvVlvJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QZpCmzE1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T474jG2686122
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oyHmFa9wvulObjT4LWttQonigm0eeqeoGmSfl65guNQ=; b=hIfvVlvJl159u6UI
	9vUei3ndeCvErksnbbiFNQIAA23X3IMaoyXdrkJi9NJfPsbaSNF5wOgPSz3AEApi
	PvQUNakD+mFpHyD+l0Z57noE7RCfWm8EnFwj41DB1nMmCMSMsDQtGd30FPKHSm1N
	kg36m20ekUJgM8hnTbqkEWtytPFfBk/4d1Gvy6wUJWujzbwbTpj1hIBmQ3KXfH0a
	WzkjO4d7kSfKe2YxaHeCOm4VqLd2JTrpAkhC36wbJL3RQFyJRc0AuPn3DkIGfvBH
	EnlI9cyJgfQP4IQo42XH4KIzXO+ollI3XalV+p6k5vWQ7Z4L7u07GfQTES/INvae
	nizBlw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mjgqw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:26:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9143d796129so64802776d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 21:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790655994; x=1791260794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oyHmFa9wvulObjT4LWttQonigm0eeqeoGmSfl65guNQ=;
        b=QZpCmzE1xAEbAd0fUmuf058kU6uQXvMwXlD3LVgcFciagqIp4iSPs97AeyxppfsE2r
         3D5YcL+YJ4qG2hcreRLv6wRk1kNz9u93Pli+MbZbwtbrXPOA8eIjQc5oNyrVLL+gxTqo
         sf5lJpmuL6RhuKNA9X46QtruIBBba8uTw0zu5wtdNX/Pgb/tSpNxiHBkbSt0VRCZnrbb
         8+RrjfBKaSdi5+4HG6wo+RfcQ+kE2XppduSRT6D5ugnEOE9PVvXu/RhfiMvjsKnHI9F9
         wfRXBvBEsfRgZwBu/40TXNnceEkxOrKFuw+XOQyGsCjU4j7t4zslk8CIPd/V2yA10YSK
         8V4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790655994; x=1791260794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oyHmFa9wvulObjT4LWttQonigm0eeqeoGmSfl65guNQ=;
        b=MeViM3p8j/dSA4Dwk+lwzHtKsmYpsVI5aZlgevblqfwDP3MdvhVWiEEyE4NABGWEVE
         hteKQ8PDDnPvwbZkTDeYxOpQJbsbRc64RqDk9WiX0Z6Fhu4PU/BRICnqXQO5RHofoW4s
         PRqDeEjN1jsIxjtU1NXLgxaXwZHyulrLkzf7jLDLWZAYcElCYzcdWeuQBaLNR/jiRu3y
         BBKqRwerpWzU7GLzInwux+AhALMz+HrTgypRYFpaTUMcJRN63aM9llBOIGZ2Zj3Y28Xo
         xu4b/GB333hgqtv9FuIBMwoknpSefm/VSfBVwgl/2Ivb0M08wbySGx10bxKn8njtlTEs
         KNLA==
X-Gm-Message-State: AFuF++k6AaEfBjtiv/qYFqV/ZuGsrBY/o88vrWvk8S5LV2LzA87xl+ga
	Jx2I1jW3REym/B2nhTyw0fG5yHq7n/JKgeu7GT4zXX0kr88xT35TDb9yW2zubZ+zv09mDS3NVxy
	o/mpKU2nSA1pzFtfaVLS540sFvxPe5Ywe8znuyFoVkO0rieMm6ehugK6yLL+IcfkoBmGT
X-Gm-Gg: AYBFou0j8cO7iuCTUkyajijVr+Z+2thwSbDXkySgBz63bQBMQ186r9DlmK1+MMVhKB9
	p7BaMK6iIVD9ZMSBkD3qN5APePNxWspxlEXBlsKWNtLk9loNncPjiRlsvxPaBgQUhFwntHgPbMB
	0WjCcGa3BKmuJj0uhQrh60Hadmokg2GIMWXCKU7s7WPkANSnQViIG4IRG1SsmM2tyIuDiCp3a1H
	36WhkhxtkybmEedWBSoRH5l18Bx9BNEirNyMWIIb+2x4JhrIhtZcVhBelfaCv0VhB/CzHbbtvQD
	X3q3e3GlSkA8iSlv1uTE5oC+54fJiTF9rUJwwJV5jZ/p2ZGuYaMICEGjCQr3P/Tu6Ck8/xSqdNn
	9KIjsl8A2TC4q2vmW69hQiBUiSiUMU3Y4v3dWWRPxEOJZyZl7jlVGM85ow0ctb8w=
X-Received: by 2002:a05:6214:cc2:b0:915:ea96:d746 with SMTP id 6a1803df08f44-915ea96d8c5mr98257396d6.28.1790655993765;
        Mon, 28 Sep 2026 21:26:33 -0700 (PDT)
X-Received: by 2002:a05:6214:cc2:b0:915:ea96:d746 with SMTP id 6a1803df08f44-915ea96d8c5mr98257156d6.28.1790655993310;
        Mon, 28 Sep 2026 21:26:33 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:26:33 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:25 +0800
Subject: [PATCH v7 01/35] drm/msm/dp: move link-level teardown from
 display_disable to display_unprepare
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-1-4b81473185e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=2701;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=U5xt8vpiVAWHAYVlgspV/jOouZBlgXr0Z45thYBSl0w=;
 b=mnCVYmvynhZjvcbku2fjIveX0aUa6o90Mrbha+MhPr0b30P9vazI5lWLiXIWJ8adE4vGKknar
 F9pEXIjcF9gA1xqJjIq2npMvB4bL5tEvk2psaWB44cx12CMfyfN2WYS
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX4HBY6qiCMjB+
 fnNCmmhknC8pwWp1MBk82nv7samEzQVQ9YOwuHLg0giTO6IQ4BsUgRBoNTk9K1rWjRnpsi3fGNa
 557z/gLz7NoNKXcyJI0tlGR/O4jDd4DYqFpkNUMKezp9SpX1sLgGnApYQX3CXPmHRP+6oBTbL8g
 xxLmR6jQueUAtDJ+NyW02SAD7zLrgdVpW2Wy3Z4HxPlEa9HnQkKWWSLME6tFqaHLkCZkJORaWuu
 wW1ScFr0inc/r6CmREM8TpZC/05qY5c88Qz8rJLN0OJpRZgGEp3y5QrcjDwoqTmEz/G9WXK9+R6
 xgBHv6omD8yd3TKGpmrPLcSTPfhUq33a9kYp+U7q7Z6IJs4F8bn8NVyMe0BtiIdGHWZcZU4tCuI
 iRgcTj6Y5ebdyh6YX2KF0V0Tr4D49ycfRbfqkOxG9Av1PnS6ksMHpNKAPob99C0cCgvn/VkqlDl
 yvLW59CFoA6d9NLC6mg==
X-Authority-Analysis: v=2.4 cv=OdgNnRTY c=1 sm=1 tr=0 ts=6abb3dfa cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=a95-bzEMD9sxZBs1_CcA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX/exM4M5ZYj6i
 /19rHAyrKZ67Pv/hZCApQZeG60UeMmxk2eHTbjWUl6HnV3geuxbR1zSfVHZkvdo6pcDBBhxHqea
 Js+ua1omvOl/Brhph57K+2sbdALBpWI=
X-Proofpoint-ORIG-GUID: _H-1X0gQkFPSLlCopmYYmPx-J79z3kZS
X-Proofpoint-GUID: _H-1X0gQkFPSLlCopmYYmPx-J79z3kZS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290017

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

msm_dp_display_disable() currently mixes stream-level shutdown
(disable VSC SDP, off pixel clk, clear power_on) with link-level
teardown (PSM config when sink_count==0, off_link, PHY re-init or
host PHY exit).

For DP MST the same link is shared across multiple streams, so
disabling one stream must not tear down the link. Move the
link-level steps into msm_dp_display_unprepare() so that
display_disable() handles only the per-stream sequence, mirroring
the split already present on the prepare path
(display_prepare_link vs display_set_mode / display_enable).

SST behaviour is unchanged: atomic_post_disable() still calls
display_disable() followed by display_unprepare() in the same
order, and the cached dp->panel used inside unprepare is the same
panel that was previously passed in.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index a420e3d49928..03ccdf7e0366 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -722,20 +722,6 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp,
 
 	msm_dp_ctrl_off_pixel_clk(dp->ctrl);
 
-	/* dongle is still connected but sinks are disconnected */
-	if (dp->link->sink_count == 0)
-		msm_dp_link_psm_config(dp->link, &msm_dp_panel->link_info, true);
-
-	msm_dp_ctrl_off_link(dp->ctrl, msm_dp_panel);
-
-	if (dp->link->sink_count == 0)
-		/* re-init the PHY so that we can listen to Dongle disconnect */
-		msm_dp_ctrl_reinit_phy(dp->ctrl);
-	else
-		msm_dp_display_host_phy_exit(dp);
-
-	msm_dp_display->power_on = false;
-
 	drm_dbg_dp(dp->drm_dev, "sink count: %d\n", dp->link->sink_count);
 	return 0;
 }
@@ -1482,6 +1468,20 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
+	/* dongle is still connected but sinks are disconnected */
+	if (dp->link->sink_count == 0)
+		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
+
+	msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
+
+	if (dp->link->sink_count == 0)
+		/* re-init the PHY so that we can listen to Dongle disconnect */
+		msm_dp_ctrl_reinit_phy(dp->ctrl);
+	else
+		msm_dp_display_host_phy_exit(dp);
+
+	msm_dp_display->power_on = false;
+
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
 
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);

-- 
2.43.0

