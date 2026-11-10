Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286493;
	b=JenG+djti1OlsWdF8kE1/rpI+Y1K4D7dUmc+u0x/TQtDtdqFV+o3PqlNk5QqluYSdeV0
	 vEwB0jNe/P7pfaOXtQeohg15Nzv08jW0BA+Q/g8HSo4rncKUi8LKPYq+LlD2xvS8khZqr
	 Q/0Pfi15J/uS9+3OCd5widwQAEMotAdybgCAUIXHtdxxiwOzMNjAkmqH3QfGCP3NIbqpm
	 3btXsj2irARXzjhyO/F6MSLd/NY+vWTvuS2gTho/v/jWUP2wTEtS8qAh/OFqWjiEZjA1z
	 Vz5dsvfeBpitomVbAuP1UpLD08m6uJDf1XQuMIkxoffuCL+iQXp9GofmqGgkUtwZHew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286493;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WfpbcANzc7mAC2CZRQq/40TL4/ybnjc85bywIUfZUok=;
	b=1YFbgQojSS4gu9w6O/kkJQ/kvwx5fyww24mRRSy13ZUhmWVe+thmu5Jpy0txD0jTJPmt
	 dJbENG9Um4itNRW7drLAtx9VUDKNGf8rWGGH35OWcBOy4whzS1U9Z7UpxF3vUIHcfrVu3
	 YLT/ZngZsy11p8AzzAWDJgIqr6lb5MfQkwkOdX22LPAOIeRbDdcXYl/+jaCvJWDCni6os
	 p4oKjofr0Oq4nE4G1SHFFZh78zBXe6rPfSNWEu3ZwEeh+V2RmxTDWWjLaCvWdqFu9p8E4
	 srPfgjMznYFjH8DmJyL4ZpmkP6sMi27+nQ1MTzb85+GnNv2lQrfcuXzianvgN8OFRXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KcDWHYmG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K5kvFnaY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD80A606A333
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD80A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KcDWHYmG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K5kvFnaY
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4AAk12928593
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WfpbcANzc7mAC2CZRQq/40TL4/ybnjc85bywIUfZUok=; b=KcDWHYmGxidiY0XM
	yk/pb68uA9h+1sodu+vD0Fy4wlDgEz0lhQL2wevJRURnw/XPNIzhN0QryMZEW5n7
	aYq7468RKsRgsh9nPLGGdv3tKI0kNlkOFsjKv7SHFEliKSi2MAQ4JC5HiASk/YZ6
	OLnRFF6HOF4oWWJ6IjN82w1OdeVBVnLeJK/Pmj+5Tmr/svhT9+Rh2RSkBKx9E6mP
	529bNm9mi7b+5n0Ljw88y58eUReeC1TWga2kVp6YBCEdHXszIQgUM8HipNrQNK0A
	BC6nEaEPGpn7k6xFJ7FIT4ewAbjb6Im15WWwNlwV+FzzbYj0P7WYj+LX5mBWzXln
	cKtF8Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx8308w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:54:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844cb60so324496485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 20:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286491; x=1794891291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WfpbcANzc7mAC2CZRQq/40TL4/ybnjc85bywIUfZUok=;
        b=K5kvFnaYCyuHrpE1h+kKucjRAm+cQeHUGOql50EsvZNqv8P5B6Cabn1+Bv9B3r6V2Y
         xhCyNyEuEAfqLSX0nW0U9tcQmMctAi0DsHYvKnVSN63wNwXV0nmHDAQagthn6suf5VKL
         QfWQrPKFXGx3c9EMACyLFqY83P9GrLumJRcw5MtMJ+t/ncRNkQZJYBWaL5MssTXyYV52
         vmIAJYOw+7hiw2BmgyhaOoH5DRsHLg2zG6tl3/2Xj/q8lhLFc7UQaR9N5nYkYiKi7gxn
         K0XSXXtr7qZd/DmYd8jRCtk5wHSbKjrNnVy3xPDbK30/gem8VgbqPUL5jsGBnw8fBCm1
         pGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286491; x=1794891291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WfpbcANzc7mAC2CZRQq/40TL4/ybnjc85bywIUfZUok=;
        b=qY28BGRle9a+I+qjkzjo0+eY4+8z4eU4ZRHEPvFn9q9fk5q44TwIJqIAw1nu/2gn2M
         LUj+p2zxfEud9xgKQLTwq6ql1EHNU+vk8n6vbn2sZKfCIlpEOGXwXDelNdvfR3RD+4aj
         He6hBpPvOKhzlpbdedO/GoWxRkR07geBWfzMF9rX9/IgjpWrJe4UV5F+ZW1Ky3jw/jFE
         RCn9nCqgHhq7jevqv7wEcNA+qCP8Nm87LzHJngd3VWsmjs/VuDxHotr5gg1yc3+JfP1Y
         AvH0FMN19liWl1Beo5ZpX44r2tkbOSLfqmiIesWZBdhXH0dHS5t54s6vuyI5k0MNE7hz
         69Ng==
X-Gm-Message-State: APuU4Z+KppFCsROeSMPd3lXwpCRMHchkveRK8KX7NcXDq1X6Lo8/xDe9
	J/g/xJJYhPfa+HS8r1oPgeFzdCXD+Wzu193HExwPd3kaNMieSXJ2dZkrEwgjqms7whk6amc+ln7
	mSOHqAffDIABreGnTExynOLcTp7SjG8WJe2y6a4QxkorS96/goSkzyUCws5RE7otUxpcs
X-Gm-Gg: AYBFou2hRTlPtwCbgKtdfAIfahvBSOhNWpci6VZhDPn3JbmNb3rGxs51cMj0caujv4r
	61L2WEnygCpQu0ZoCKbgr8TTwR8aqubWLOJvTxkBlIRyRZyjU3YqwOr9OXS07jk5T2msUl7wjXY
	UTYxzHfIFNI1OO4hAGGsj2XBOJTe/ZoOaLgrflp979Nv2IR1wibl+5tsuSH/N09a3L8EUeWGCLx
	/IJq1bF5XOTRONp9mHJ4dW/QmDefH9vSt4yq1aNb/BHh9xrnLNSv6G77A45HWBIzuFy8MCUhVDQ
	5aWvioOlvsP7B+IeJsJDTkW8EFr5qWw22VX5PK4SjAHVZYDYOtaBKmYuHzruMlmJEURzkSxmujw
	WI60Q6jaUWCXWkGooZOd86GPgH7iAKPEN86ka099kbhRnhbsKaz3mFy8sRajSz+OpRTai4CM+1x
	TVvMnanmtldUWz3jhfZsxp10zbRhrCugYURXTI
X-Received: by 2002:a05:620a:4449:b0:93f:3193:ac09 with SMTP id af79cd13be357-9479f1ac375mr261588285a.15.1794286491047;
        Mon, 09 Nov 2026 20:54:51 -0800 (PST)
X-Received: by 2002:a05:620a:4449:b0:93f:3193:ac09 with SMTP id af79cd13be357-9479f1ac375mr261586885a.15.1794286490609;
        Mon, 09 Nov 2026 20:54:50 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:54:50 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:24 +0800
Subject: [PATCH v8 03/29] drm/msm/dp: add support to enable MST in mainlink
 control
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
Message-Id: <20261110-msm-dp-mst-v8-3-d040fb33db5f@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=2559;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=1R3kmWVAchrWxMW+GrgfYnJ3iT9s5hz9hnS0dykL1+g=;
 b=n5/USZ38RA+t7EKjG3ozYfbItnOm2eC3jTVm+gz4hsoE/z/pl2bi+5S18b0Fv+BfOANJWgAQW
 ZmqDnmIH4+EDGB2MtBgXlioX7u2QDf2QJ4xCWk5qtZe9DhHipWvAdS3
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af2a39b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=GJT6Fafo9oTAj6z5dyEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: bjrfB76ReQjibnRqyMpvUAnc9X32WxKd
X-Proofpoint-ORIG-GUID: bjrfB76ReQjibnRqyMpvUAnc9X32WxKd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX4ymgeoG1I4ZO
 QRNxE8+ZEtbCywL/3zDAxGxnI9BO6FXN2h1HoL+hOOj1A6ztPueQiX+njeXd/8m/Fg80k9xN4Vb
 VCF74BGiL4fWjMSe5f9o2Qw1kc+sMmQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX9Sjas/yMhl/y
 7fi704gUzx0vwWro14Jrx1ooUIb2pQG4GMhpZZJxGH3pX3cHIulLTXJC9WORfz6CTmJIjwVnLLY
 2UL28ZYYJ5t2h9EAfk/TbNacZ01IT036tf5fkyCHjak4BTUbJUmFlAy2rRjXrGrKvXRR8Nz8RfG
 GDXrRzqj9Cc3aNANcTmBBdB9ygWBrm2zdTQQIOvJEifZuwgmtutMgrQAhN17TxGAxYMQalUcnML
 Y1f8XYrOgwBeo/KFvt0tmmHxtnNelqnX2JfBSYB0Cc8BgNbT8na6YTUxac0HoYx/Ttf2PFBONMl
 OupheZTWjOHihHmRbmnJ7atm6ArXesv1+8pme050F/YEhCze/K9eOQuwwHYSFdj70CoVm0Ebs+W
 hybY7PA0oNcuNhqgZsA4AbqyN8eNtGrVb7BMC6gcBcdfpx3WfgELBQdHGiHhMWNHuFBJJKXcZtF
 4/mBc8KGXPDjNEbAVxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100019

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
index 288f84c33275f..b6ff3d8caa2b1 100644
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
@@ -2689,6 +2702,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_ctrl_lane_mapping(ctrl);
 	msm_dp_setup_peripheral_flush(ctrl);
+	if (ctrl->mst_mode)
+		msm_dp_ctrl_mst_config(ctrl, true);
 
 	msm_dp_ctrl_configure_source_params(ctrl, panel);
 
@@ -2739,6 +2754,7 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 	phy = ctrl->phy;
 
 	msm_dp_ctrl_mainlink_disable(ctrl);
+	msm_dp_ctrl_mst_config(ctrl, false);
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl, panel);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 9263e61c794c8..cc74b1ed628ec 100644
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

