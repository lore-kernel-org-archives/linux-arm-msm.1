Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D933F27FD74
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784527915; cv=none; b=qtgG3Iowsd6mvJ4w/xxzpiIbcVBzV5LMEXYAnHg1i0MzE8kyDUD3j7IyZ4cznkglQ2kNwLKKiSnQmSmrgE7EzJ4/YFo74l7K1fM+APujiMsbZXoUEOQ8MFihxpj2LBRl9fqbLF+1vNRh9m3MIKKvPG2s5XGH0l/hymQlg/dfdfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784527915; c=relaxed/simple;
	bh=g8jJQRxEVRToO3ME6wioKJPVD8Wx6NKpH1Y6rxv1juM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q5Gsu6iv+bfdVjvAP5ryiv6AbWiBcEkf5VGvQly043SxjjEeA0y6K+08eMS7S1lcIgwonf44hhtMlV2+GzfgKyhxG3jimj0gS1JfPosEIYEs68rA9GDXPTd9hjIWitJQoUxraFcqrMSW7xxP3XvPM5uGWms6zjeq+fploNJVYds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T0BaR6Wt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MG8lS3T/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T0BaR6Wt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MG8lS3T/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNsaTi912345
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ElnWA0oWQD3Q2jSTrrP2J1EEOEKI1Sa6JObzupzNEE=; b=T0BaR6WtlyxIiA6F
	CCsJRbJXsB/55wSHJiZQRWoI2+3kIghp+IIyF4V0Z9j3xAW5l6L4Smb76bRAkW7a
	ERajE6Gdq6LGHeCdYyZZ1F6HLG9ofAgIwpiADkIJUlccvDnZgJo4RfHgE0D2m1xM
	IS3MCFKJpmFq+dNtoH5kmmqlaSLGRtT4eDWfIaJwJGhd8dW9we/R7SynXaLfhqqG
	UoTSTINxcp/l3GqAlf+DCKjaZ1+R4xYNsgfpRHvzmqDKiVey5CppgtDGoExw81Vl
	COdnPfy181thoq3fgb2ms94HJAlkYVyJmi7b8brVT0LlgIZj3QCRt3XxhJytlfhE
	OXdcTw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2af4mj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91931144870so1359121185a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 23:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784527900; x=1785132700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ElnWA0oWQD3Q2jSTrrP2J1EEOEKI1Sa6JObzupzNEE=;
        b=MG8lS3T/624159toTYnlb881P3rUq6bQHBJPKJ90mlnHVwcqeAzA04Wkx0PY3FR7Qh
         +45TAZIp0PII6zzvzpcpJ1wLbmaxt0ER+cbdnO30j3RZbR7SqtwQSt4EWRt0oZy8nGpN
         llzIs0scJjMHFqjWGsUhpK9gejq40eJkntkixZW6JZJlIerSBFTP5Xzyu2wTsF+O0mYR
         2ZeaB4UBBs+wiIdEJOssVCD39mAl2ogi5954RIorYGLUSK18qsxmQyk1UQY689IXX+TL
         e6K1oYOYCrWWYTWoHlRYUdIK55aQ625NDkSwZDUqsR6OMX339tN2rnyNi54UfCkUWkrI
         SlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784527900; x=1785132700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ElnWA0oWQD3Q2jSTrrP2J1EEOEKI1Sa6JObzupzNEE=;
        b=U/Etz49hITms0xpgzYncJiY8kf5Y2dirSM6vLR61NkrxJLK8Fe1NrNiLE1GPv4ksaf
         t2FVGzdzxiRz5xLKeZpUxbc4IOJKTMsW57G6feB8O+fYRISPSHhbmd8PDimMNYWcZ1Ql
         q0wrD2lPTizZ5yV51qYUXn6n5vUF1zKMn4+vJCvpMUr2WQp83HQpcqz9BqkKOCUge0Tu
         NfDyTR55qLSjh7/zqcPXUrpBn78t3TLXoXZzqc2DQLhQrqz3udroNI/k1mb+QWCad5li
         0Ku9zJtRG/VRnAH85bDmQVBcS+7fDQDoM8tUkQxaeA1eJvTtbCbERQjsGL2vBS7p41SK
         KkvA==
X-Gm-Message-State: AOJu0Yyk0HtjK30l2kOnrX8Mg6uV5lbP1PvKUWf5gZt+tGiSf36e3DL2
	g3crHDB22c3c7OX7CbJOafwhGD0UZJr0Y4/hSisZN/iJSEjO/AAsFVTJXVDY9N+1tTGyP7DrPx5
	mTCXqPxku1gxZ77Q8fd2ZKuPJ1E3hhjippXWompY+BQBS2pZ/wedYIRuL4dk/PhIWmsFK
X-Gm-Gg: AfdE7cnvucrmDOc7510ueRWgYdvBIf0w9mo/5e36Thuh+i+8XQVSsKcLDPXDIEdobiD
	gU1giXwHmYR4//TdBjhpcQo3EGeMpIWQqekos34iJ3jwsJRDNgF0uuacAVzXwTuE0/gWeV0Ra+p
	pbM30+zOTZSROEI9TN/5rUWaKD3C7gcI4fEU8TMDmY3vII5y34dEWRyDkPNU3/lUMYnxHanIC06
	gwFVde9sGSgyKw8TTGy7Y8aZojLPtMSkFjVr+9gW5gci4xntmbDgscPPn60j9hTFz+FoHhK3hwO
	4VDPSD+0HTr3wE8EU+MkUs/Ynjm+c90sBqchDm5sI0KMJ1LFKX/mDeAqXhj27Uox8kEL8p3p5x6
	251Z98VdUTkn9XGGGk4U1roQHxJLdUbifLEQuxRGx8iKya8lL01sFguQVZCvFWR8=
X-Received: by 2002:a05:6214:5a07:b0:8eb:eb8f:a37b with SMTP id 6a1803df08f44-9077835b93dmr140028856d6.24.1784527900012;
        Sun, 19 Jul 2026 23:11:40 -0700 (PDT)
X-Received: by 2002:a05:6214:5a07:b0:8eb:eb8f:a37b with SMTP id 6a1803df08f44-9077835b93dmr140028786d6.24.1784527899666;
        Sun, 19 Jul 2026 23:11:39 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90778588a39sm84793216d6.20.2026.07.19.23.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:11:39 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 14:08:18 +0800
Subject: [PATCH v8 11/15] drm/msm/dp: split dp_ctrl_off() into stream and
 link parts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-dp_mstclean-v8-11-bea261bf4e7d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784527840; l=3896;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=Hm/Z28jFbNNIpMkSUALvMx+PzLChWdRQ0AfWWBpGnus=;
 b=ODlZsMU1OSad2GOkqijy6Bi+SzBmkedQmePHZbWrIu547duYgTj9QlXP2kEZGI3zp/oV9xFpv
 LnKYiY411WKBEVKGMhH9hKl8NKiO4HwRIGQ79KgsGz5GSNqaKuhAx0C
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA2NyBTYWx0ZWRfX37WGR0j8j8t/
 hDqLn1Lap541JtzeKTcuaslMh4nxHlkZZrTWXeMKESXp9jnYU9LCqs9PE4gWmC4IMKLWsK8cCWA
 5mOl5tchfXNCL5NZnSrtC0396/Zt0Wc=
X-Proofpoint-GUID: HY7q5cmCXADuYfR4NrkKYLKJFoOOtikE
X-Proofpoint-ORIG-GUID: HY7q5cmCXADuYfR4NrkKYLKJFoOOtikE
X-Authority-Analysis: v=2.4 cv=a+sAM0SF c=1 sm=1 tr=0 ts=6a5dbc1c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=btynFov_yHAME20h-3wA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA2NyBTYWx0ZWRfXyXQWaQeHe29u
 PzUCJC5WxkiVctqAVMaAYNZ8YDKiWj9LZuAV8qwKq0xTsFd8ayxQK8pVbJD2I1nXOZ5PCyW2kqn
 QVdpXwWRTjdVbcJ3Lt6qpfk83Lqv55rToNT6NjuLq1IvlE7G+iUosQrvLxtD3pyXIfjcL2qSMeI
 1JpMQ/jxDjOdL7pQi3UuxIraC76uh+3D9raHy/L8pZnXeYbPMAYT7B791CS0Vidiu/vbErDXGs5
 D8xU1FIwTF2KWV52D0hJ1CjEPdgGx2ngFspVawhWTs9wPW9k4zdhw+QHngs0gXz8NqOdq9OJ1mw
 euD1Dgq+I9X58RM3PJbx+6CQOvwearVTz01mIqNMPY/dYU0/w1uaxWpaheTbYH+gM8XMHu6FGlK
 BSKrRy1xtxrVoyPHkXKUqB78EFct64lfQLacQqeI4J4+/Jo6H4AdgtYSeuohoX1I2UTwKD80rTe
 Ju0hgvqRGPtdny+L7Vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200067

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Split dp_ctrl_off() into stream and link parts so that for MST
cases we can control the link and pixel parts separately.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 10 +++++-----
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 +++--
 drivers/gpu/drm/msm/dp/dp_display.c |  7 ++++---
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 207643fa7306..fc3fbc40b118 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2212,7 +2212,7 @@ static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned l
 	return ret;
 }
 
-static void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
 
@@ -2241,7 +2241,8 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
 	 * running. Add the global reset just before disabling the
 	 * link clocks and core clocks.
 	 */
-	msm_dp_ctrl_off(&ctrl->msm_dp_ctrl, panel);
+	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl);
+	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl, panel);
 
 	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl, panel);
 	if (ret) {
@@ -2637,8 +2638,8 @@ void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl)
 	phy_init(phy);
 }
 
-void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl,
-		     struct msm_dp_panel *panel)
+void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
+			  struct msm_dp_panel *panel)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	struct phy *phy;
@@ -2652,7 +2653,6 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl,
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl, panel);
 
-	msm_dp_ctrl_off_pixel_clk(msm_dp_ctrl);
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 00b430392a52..5902cf7e746a 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -22,8 +22,9 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
 				  struct msm_dp_panel *panel,
 				  bool force_link_train);
-void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl,
-		     struct msm_dp_panel *panel);
+void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
+			  struct msm_dp_panel *panel);
+void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
 			    struct msm_dp_panel *panel);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 8694f366623d..1ecd700a474f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -727,15 +727,16 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 
 		/* set dongle to D3 (power off) mode */
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
-		msm_dp_ctrl_off(dp->ctrl, dp->panel);
-		/* re-init the PHY so that we can listen to Dongle disconnect */
+		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
+		msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
 		msm_dp_ctrl_reinit_phy(dp->ctrl);
 	} else {
 		/*
 		 * unplugged interrupt
 		 * dongle unplugged out of DUT
 		 */
-		msm_dp_ctrl_off(dp->ctrl, dp->panel);
+		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
+		msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
 		msm_dp_display_host_phy_exit(dp);
 	}
 

-- 
2.43.0

