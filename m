Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639443D3336
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164292; cv=none; b=YpzNlBwKWkhJdmTVXRHqbZoT5Rh4Cbci04S+mqxoUXuu+bUUAZCYBWIqqvKo3AvKSzzsnt4u28wA6iQHKLNOUesacIgpsJT3CBtJPS0SVspKkHA27yY4jlMwng+GZcJbwnP/xNWhjpSTc+SfTqsOEoQHcY0JeCJkHorb3HLam7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164292; c=relaxed/simple;
	bh=8Dmslyk2Fa7jwFI4zAsCVxwM9n6Gty4eaAtju08j7YE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZJUTxBCO9UvhpBZ1qrK5FvAeeD+KQfB8XGStDQ8VTrDCZmdeFaMltph4XlhbrpjGCMzgDu3pH+nPQLjuouSMMa3vyjSIjN/gE90pv3HJMIXSKkRXEaKbaskLLJsLKma2j6ezp89AzPBsfkotI5eVGu2uH4ieW+teH8Gd5+RFIAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lavDuOap; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A42jCtDp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lavDuOap";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A42jCtDp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xeNm2824429
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:18:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0YGchqah0UzfAha4yAxOufthwsRqWdGvnD0C4S2BIAM=; b=lavDuOapPspxC/xJ
	ylxmftYTEZe3RhzL62QFQAs2f3VK6SgaZyEJYl8N1XDH19WVngVp9qqhO3iBwN0U
	EaeQzE+ema3cjzOOR5uORzYwP85Lzp4keIwiNuetdFPVNoePrTnm3KzCNxXVT306
	W4AfUCNG88NwaohoKFio4fBg1L8kcogYMG78g7tvn3nVBPBZmTHG5VBo/xvsvyy6
	KjMa74ojh0MgsEYIt7DoU01Le0+Cs4rrQVZIDeSIi1/fmLsHQ2SA/5i18UXpo6oV
	yHkL4KeDEKTy0qMihvspTrSlaqNvnPkdV0fc2Dhv9UXuXj28T3l58RPb+vOr5e0o
	8dr5Aw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqe2dd7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:18:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93903622880so639896285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 01:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164288; x=1788769088; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0YGchqah0UzfAha4yAxOufthwsRqWdGvnD0C4S2BIAM=;
        b=A42jCtDpjEqO2Rmwbr5Mi0pAg24+UrGmg8dLw5tUaxcOOwBVPEEOJj+UVBJkJTHTPc
         4Tmqlbh3scWXItwqum5FGAWOjUHCwfdZvETWPuHJo/QpK9kI/SlmbvRk0K98agQ4hSJL
         AenrkP2QKfWfHavuDbLdXOTTHl4r58IxrBJnVEUcRzfwmFYUiGZ1paQC0gO73j6QmXwV
         PUxzUdLSFufei7/sW9uYPEV0e8aV4N3ZsP77BeJqjaw5Bh+4scxk4C9Q+NVNfZUvo3lT
         Wa86R67bYFbh6+SAdPdf6JVurIIM0yyCLwkojfGHpec/5tRwjpubtsOFddnXO5QV4Ih3
         G8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164288; x=1788769088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0YGchqah0UzfAha4yAxOufthwsRqWdGvnD0C4S2BIAM=;
        b=nHnz/0klapnr6C5+rnRTCicqx/TVF1NIaaysGVKJK8gZIluQWb4dv/1QjcxJSB7tSk
         VGrTDOImKnJbY5/qnyDtk1F8zqeUB8/QlUQOugF/OcD3uDj0I2XPuMc3x7V/sKMlQK8Y
         HCppr4J/WtKhOU8OJQXsa+RX/annItyM0ee575vOg2H7kANVWSAn5qytUQEY5UWzjom6
         kx+aPYUXutyPopjK/r+zmDAwb00kXWKaBN32m0ApVxqJ/FYvcI3+8drVoPMD7nuxk7b0
         RGVC1E6NyfwIWaf6LT+YGEj3ibHaaJ8FAuiCxob8YPq+8hbAU/DwYhLT5Q2mxctkg9do
         NeTw==
X-Gm-Message-State: AFuF++l6UCa1CrlC8GoW/QygcCsPqwbWtvnpF3hdUB+/++QJnc+CEyhr
	c79K5haKEmD78+U2Sbed1IwfSEiqVDvsrXAGWfG1606s0rgULaqhO0D4PdT7d0gGQrgu9UeEGNX
	cGi0KMGL4ngeATAKALHUMrk24xBd3l2eKsHUzYCIkLWtKhdndbhcdgx4WCrzKWPFDjkqE
X-Gm-Gg: AR+sD11nXLWxOntIB9JaNYC5/I+ulu/yMaFbUFKvF2vA/akce9Rp+uV8xPEirZB1KOP
	FVXMLYWxaPG2AvZKN/LL8+TBhvd4Lcu9dzdXcoDfDycEbJBsN6IzX22lgDoCatMKKaFg+UfH28P
	PPSSXF/rjJyjIL7NtVZU3GW6idrxFC+A95BpuZsNRiCKg1pNxE7/CqvjrlNPqQqysx0SXA689ag
	BQQz2BuKd2orS+8Xk1QWmkaBjVFpunbDVT9qAgmOmfDzXN/M5CGDiUEFIZ6uYvtVW8dzDjVfR+c
	j2DnKJAJDHcjhR/3SE36XzdOPUiibQwKedSA0FSznOh253jW72Pvd3XmCs0uAhz/HJkrSXp/xoM
	xhGG5PtRvLunRzaDsx2QyVCh//UX9KVT+roQC7Hm9c1bYHYkWQTnyOxl+mvnu8Gw=
X-Received: by 2002:a05:620a:4148:b0:939:f89:368d with SMTP id af79cd13be357-93936daaf1dmr641887585a.22.1788164288154;
        Mon, 31 Aug 2026 01:18:08 -0700 (PDT)
X-Received: by 2002:a05:620a:4148:b0:939:f89:368d with SMTP id af79cd13be357-93936daaf1dmr641865285a.22.1788164284638;
        Mon, 31 Aug 2026 01:18:04 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:18:04 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:23 +0800
Subject: [PATCH v6 06/29] drm/msm/dp: add MST stream register definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-6-c91d35d6fb9e@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=7708;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=8Dmslyk2Fa7jwFI4zAsCVxwM9n6Gty4eaAtju08j7YE=;
 b=w/zSTzHIBylC5OEE1JFvza/Hjm7dzHdrNSUdexO9AZv/Xjh4bGkg9L/u/jZW9utBO7DpDU6U3
 MPeWImQHOkyAc3W5yify5tJdsTNKxGyUL6jf6COdYPkTvVFGyYXX4MN
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=Iskutr/g c=1 sm=1 tr=0 ts=6a9538c1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=qrQA6X-0r1DpH4znwvkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ZMcW9ajwEEQ0yxm2_T-AZwsDexKG3zqZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX4vsK7nMx65EY
 3L2mCN85N5VByeJu2rhdz2CccviUVuF2EcKEgWJEqmX5PlY0v92vtOOVfXwakGCwqHylBBnzDij
 9EQipnNxRVmQN6XpbeEnOVS/gGkMmSo6GJ4zbc6JgD2B4e8npWYpxpPy53RMzqlB70gLExe4wkn
 YLJHBaHSgHA52/NGAWco7vQJJC4Mo4jVuDFkdPpKepeaipoCWuzgtqBWaG01K8QngDpNAMY5i6r
 XD66IXPhDQn/uGVCjizWwc8BZom+z4jyvQj0NMasaHVPxD54dr/JYpyOvnACgCU2VSatKjX4qeK
 v4CbJ6vFF3YeZcsm5oLa+XNX2GKEqFXr56+H5BQsCmVzwEyTEZh27Q2OLTUaJ2WSSKyb+g0oNA0
 ey1DCaHBoKvF+JIbd1K3oObPxM7Ynm2xXUpMx9XL4TMDg2Ba0RoNyUHL1o753YP7kZZF/e1Lh1X
 WY7SE36yda8obeim8OA==
X-Proofpoint-ORIG-GUID: ZMcW9ajwEEQ0yxm2_T-AZwsDexKG3zqZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX/afjwb/h//m3
 IQlk8Hd3xsIxu1qKyVnMg5ZKjjNUqNhK5OwbWAzhT7kZO+5qrCQxxYAt9r01qEcOWsIGdeb1rzO
 3Su/KRiN9psbw2evyV4divEnCjsH2GU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

Add the stream-1 (DP1) and MST-link register definitions together with
msm_dp_stream_reg(), a helper that translates stream-0 register offsets
into their stream-specific equivalents.

Keeping the register definitions and translation helper together ensures
that all supported mappings are defined in one place.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 65 +++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_panel.h |  2 ++
 drivers/gpu/drm/msm/dp/dp_reg.h   | 56 +++++++++++++++++++++++++++++++++
 3 files changed, 123 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 7b5fc5bb16de..504d7542d30a 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -29,6 +29,71 @@ struct msm_dp_panel_private {
 	bool panel_on;
 };
 
+u32 msm_dp_stream_reg(enum msm_dp_stream_id id, u32 reg)
+{
+	bool is_s1 = (id == DP_STREAM_1);
+
+	if (id == DP_STREAM_0)
+		return reg;
+
+	switch (reg) {
+	case REG_DP_STATE_CTRL:
+		return is_s1 ? REG_DP_STATE_CTRL : REG_DP_MSTLINK_STATE_CTRL;
+	case REG_DP_CONFIGURATION_CTRL:
+		return is_s1 ? REG_DP1_CONFIGURATION_CTRL : REG_DP_MSTLINK_CONFIGURATION_CTRL;
+	case REG_DP_SOFTWARE_MVID:
+		return is_s1 ? REG_DP1_SOFTWARE_MVID : REG_DP_MSTLINK_SOFTWARE_MVID;
+	case REG_DP_SOFTWARE_NVID:
+		return is_s1 ? REG_DP1_SOFTWARE_NVID : REG_DP_MSTLINK_SOFTWARE_NVID;
+	case REG_DP_TOTAL_HOR_VER:
+		return is_s1 ? REG_DP1_TOTAL_HOR_VER : REG_DP_MSTLINK_TOTAL_HOR_VER;
+	case REG_DP_START_HOR_VER_FROM_SYNC:
+		return is_s1 ? REG_DP1_START_HOR_VER_FROM_SYNC
+			     : REG_DP_MSTLINK_START_HOR_VER_FROM_SYNC;
+	case REG_DP_HSYNC_VSYNC_WIDTH_POLARITY:
+		return is_s1 ? REG_DP1_HSYNC_VSYNC_WIDTH_POLARITY
+			     : REG_DP_MSTLINK_HSYNC_VSYNC_WIDTH_POLARITY;
+	case REG_DP_ACTIVE_HOR_VER:
+		return is_s1 ? REG_DP1_ACTIVE_HOR_VER : REG_DP_MSTLINK_ACTIVE_HOR_VER;
+	case REG_DP_MISC1_MISC0:
+		return is_s1 ? REG_DP1_MISC1_MISC0 : REG_DP_MSTLINK_MISC1_MISC0;
+	case REG_DP_DP0_TIMESLOT_1_32:
+		return is_s1 ? REG_DP_DP1_TIMESLOT_1_32 : REG_DP_MSTLINK_TIMESLOT_1_32;
+	case REG_DP_DP0_TIMESLOT_33_63:
+		return is_s1 ? REG_DP_DP1_TIMESLOT_33_63 : REG_DP_MSTLINK_TIMESLOT_33_63;
+	case REG_DP_DP0_RG:
+		return is_s1 ? REG_DP_DP1_RG : REG_DP_MSTLINK_DP_RG;
+	case MMSS_DP_SDP_CFG:
+		return is_s1 ? MMSS_DP1_SDP_CFG : MMSS_DP_MSTLINK_SDP_CFG;
+	case MMSS_DP_SDP_CFG2:
+		return is_s1 ? MMSS_DP1_SDP_CFG2 : MMSS_DP_MSTLINK_SDP_CFG2;
+	case MMSS_DP_SDP_CFG3:
+		return is_s1 ? MMSS_DP1_SDP_CFG3 : MMSS_DP_MSTLINK_SDP_CFG3;
+	case MMSS_DP_GENERIC0_0:
+		return is_s1 ? MMSS_DP1_GENERIC0_0 : MMSS_DP_MSTLINK_GENERIC0_0;
+	case MMSS_DP_GENERIC0_1:
+		return is_s1 ? MMSS_DP1_GENERIC0_1 : MMSS_DP_MSTLINK_GENERIC0_1;
+	case MMSS_DP_GENERIC0_2:
+		return is_s1 ? MMSS_DP1_GENERIC0_2 : MMSS_DP_MSTLINK_GENERIC0_2;
+	case MMSS_DP_GENERIC0_3:
+		return is_s1 ? MMSS_DP1_GENERIC0_3 : MMSS_DP_MSTLINK_GENERIC0_3;
+	case MMSS_DP_GENERIC0_4:
+		return is_s1 ? MMSS_DP1_GENERIC0_4 : MMSS_DP_MSTLINK_GENERIC0_4;
+	case MMSS_DP_GENERIC0_5:
+		return is_s1 ? MMSS_DP1_GENERIC0_5 : MMSS_DP_MSTLINK_GENERIC0_5;
+	case MMSS_DP_GENERIC0_6:
+		return is_s1 ? MMSS_DP1_GENERIC0_6 : MMSS_DP_MSTLINK_GENERIC0_6;
+	case MMSS_DP_GENERIC0_7:
+		return is_s1 ? MMSS_DP1_GENERIC0_7 : MMSS_DP_MSTLINK_GENERIC0_7;
+	case MMSS_DP_GENERIC0_8:
+		return is_s1 ? MMSS_DP1_GENERIC0_8 : MMSS_DP_MSTLINK_GENERIC0_8;
+	case MMSS_DP_GENERIC0_9:
+		return is_s1 ? MMSS_DP1_GENERIC0_9 : MMSS_DP_MSTLINK_GENERIC0_9;
+	default:
+		return reg;
+	}
+}
+
 static inline u32 msm_dp_read_link(struct msm_dp_panel_private *panel, u32 offset)
 {
 	return readl_relaxed(panel->link_base + offset);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 218a09a2fa65..75b23c106a99 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -99,6 +99,8 @@ static inline bool is_lane_count_valid(u32 lane_count)
 		lane_count == 4);
 }
 
+u32 msm_dp_stream_reg(enum msm_dp_stream_id id, u32 reg);
+
 struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
 			      struct msm_dp_link *link,
 			      void __iomem *link_base,
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index dda4b642c81b..265da58e064c 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -302,6 +302,35 @@
 #define MMSS_DP_VSCEXT_8			(0x000002F0)
 #define MMSS_DP_VSCEXT_9			(0x000002F4)
 
+/* Stream 1 (DP1) registers, relative to link_base. */
+#define REG_DP1_CONFIGURATION_CTRL		(0x00000400)
+#define REG_DP_DP0_TIMESLOT_1_32		(0x00000404)
+#define REG_DP_DP0_TIMESLOT_33_63		(0x00000408)
+#define REG_DP_DP1_TIMESLOT_1_32		(0x0000040C)
+#define REG_DP_DP1_TIMESLOT_33_63		(0x00000410)
+#define REG_DP1_SOFTWARE_MVID			(0x00000414)
+#define REG_DP1_SOFTWARE_NVID			(0x00000418)
+#define REG_DP1_TOTAL_HOR_VER			(0x0000041c)
+#define REG_DP1_START_HOR_VER_FROM_SYNC		(0x00000420)
+#define REG_DP1_HSYNC_VSYNC_WIDTH_POLARITY	(0x00000424)
+#define REG_DP1_ACTIVE_HOR_VER			(0x00000428)
+#define REG_DP1_MISC1_MISC0			(0x0000042c)
+#define MMSS_DP1_GENERIC0_0			(0x00000490)
+#define MMSS_DP1_GENERIC0_1			(0x00000494)
+#define MMSS_DP1_GENERIC0_2			(0x00000498)
+#define MMSS_DP1_GENERIC0_3			(0x0000049c)
+#define MMSS_DP1_GENERIC0_4			(0x000004a0)
+#define MMSS_DP1_GENERIC0_5			(0x000004a4)
+#define MMSS_DP1_GENERIC0_6			(0x000004a8)
+#define MMSS_DP1_GENERIC0_7			(0x000004ac)
+#define MMSS_DP1_GENERIC0_8			(0x000004b0)
+#define MMSS_DP1_GENERIC0_9			(0x000004b4)
+#define MMSS_DP1_SDP_CFG			(0x000004e0)
+#define MMSS_DP1_SDP_CFG2			(0x000004e4)
+#define MMSS_DP1_SDP_CFG3			(0x000004e8)
+#define REG_DP_DP0_RG				(0x000004f8)
+#define REG_DP_DP1_RG				(0x000004fc)
+
 #define MMSS_DP_BIST_ENABLE			(0x00000000)
 #define DP_BIST_ENABLE_DPBIST_EN		(0x00000001)
 
@@ -334,6 +363,33 @@
 #define DP_TPG_VIDEO_CONFIG_BPP_8BIT		(0x00000001)
 #define DP_TPG_VIDEO_CONFIG_RGB			(0x00000004)
 
+/* Streams 2/3 registers, relative to mst2link_base / mst3link_base. */
+#define REG_DP_MSTLINK_STATE_CTRL		(0x00000000)
+#define REG_DP_MSTLINK_CONFIGURATION_CTRL	(0x00000034)
+#define REG_DP_MSTLINK_TIMESLOT_1_32		(0x00000038)
+#define REG_DP_MSTLINK_TIMESLOT_33_63		(0x0000003c)
+#define REG_DP_MSTLINK_SOFTWARE_MVID		(0x00000040)
+#define REG_DP_MSTLINK_SOFTWARE_NVID		(0x00000044)
+#define REG_DP_MSTLINK_TOTAL_HOR_VER		(0x00000048)
+#define REG_DP_MSTLINK_START_HOR_VER_FROM_SYNC	(0x0000004c)
+#define REG_DP_MSTLINK_HSYNC_VSYNC_WIDTH_POLARITY	(0x00000050)
+#define REG_DP_MSTLINK_ACTIVE_HOR_VER		(0x00000054)
+#define REG_DP_MSTLINK_MISC1_MISC0		(0x00000058)
+#define MMSS_DP_MSTLINK_GENERIC0_0		(0x000000bc)
+#define MMSS_DP_MSTLINK_GENERIC0_1		(0x000000c0)
+#define MMSS_DP_MSTLINK_GENERIC0_2		(0x000000c4)
+#define MMSS_DP_MSTLINK_GENERIC0_3		(0x000000c8)
+#define MMSS_DP_MSTLINK_GENERIC0_4		(0x000000cc)
+#define MMSS_DP_MSTLINK_GENERIC0_5		(0x000000d0)
+#define MMSS_DP_MSTLINK_GENERIC0_6		(0x000000d4)
+#define MMSS_DP_MSTLINK_GENERIC0_7		(0x000000d8)
+#define MMSS_DP_MSTLINK_GENERIC0_8		(0x000000dc)
+#define MMSS_DP_MSTLINK_GENERIC0_9		(0x000000e0)
+#define MMSS_DP_MSTLINK_SDP_CFG			(0x0000010c)
+#define MMSS_DP_MSTLINK_SDP_CFG2		(0x00000110)
+#define MMSS_DP_MSTLINK_SDP_CFG3		(0x00000114)
+#define REG_DP_MSTLINK_DP_RG			(0x0000011C)
+
 #define MMSS_DP_ASYNC_FIFO_CONFIG		(0x00000088)
 
 #define REG_DP_PHY_AUX_INTERRUPT_CLEAR          (0x0000004C)

-- 
2.43.0

