Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBDD3EAC68
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656020; cv=none; b=aELe8JrkIHD46DtEIsSvWjzxqpUdTtIH9Rt3gr4ggoPuWdN7NgIG+KiIf6Vz0mqXZl//+hULijaYbh7Vv7XtRhutt7HB+3eHD3WKyvMeSyi3zYqS1rP9Ym+Kz3Yre7/soMZVcAbcOyqySbKQnp8G5mNuHCsm9zdmQBZR/cwYBCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656020; c=relaxed/simple;
	bh=8Dmslyk2Fa7jwFI4zAsCVxwM9n6Gty4eaAtju08j7YE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IVsZbaYMvRaFyC16KgZB7KP/FJnUzl3/FQk8tmNNWU6MJI8vh15OIF0rL+zrSCpwjDGu7bfyBvzy8Lda4h+BsHOl5rVX/YuvfYqiPHIM1cOgeQ/61W/Gq9vjYdTunL+Hbhq0Kg3U7hK31/t4FqEDJ6R4UkCv+X644uxEJxwOKV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVtVMdol; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j6V2dOfp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVtVMdol";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j6V2dOfp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T475AZ3390855
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0YGchqah0UzfAha4yAxOufthwsRqWdGvnD0C4S2BIAM=; b=VVtVMdolEjAmMa/l
	wLhRtBeJqDVLv+gKUdf5tCJyIcjk0l4+SagEKfZfbDYtDDzAzovFSUy2Sa/INPiS
	tAeCTqs4va5+hIkLc0EE4IQYY3Qum0NxTCVHFkwOLAzIvbip2RbjD3uj9+7io/et
	8IqZJstUEIFVLhaYit8IZIUPGFr5T/RmwwMCPPkG9cyQX24M3BnJbXi194wUXOCR
	y6GzHzNIx9MCUKFJFzKRaO64hhyZx+M73isi85jr/xrXhNCaknGcoHWM0TYre5UX
	f4FZU7CbCModcRIghXSKSW+tGCv9yJHyXWPR0e7sd9P1U2MXyu6PsCkZDmGrCxOP
	aqaTCA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkgvbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:26:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93bfb2da664so1087868485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 21:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656016; x=1791260816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0YGchqah0UzfAha4yAxOufthwsRqWdGvnD0C4S2BIAM=;
        b=j6V2dOfpBvWr4/ooJSVgoQeqHiqY+sDtJ5arPlZUwmkCRBWqYTOnkGf8AbYlmvxTrM
         l0pnS2XdhlJ8WofoMai8UQuEUoc8WSu5wboluMPfXI/Xuk+nlOfbc7Y6aK9Y5z6nNDtm
         yhSvj190V4Zt29lkdZkFn85P08mBonsvfdi9Qpo0qGIkgbJtEy0ZViosiYYFB2b7KlF2
         CSLYq7Tsj3VxXqmXDxqAfTwiLAHSmUJA7++sknKbc3t0ELnQZ31cU1SkW3O+Q0XMaHoT
         eXN8HhS19jR2lsHNYXbubbRSs6rEgRRqE6LXZNZjqUdkkt3hGltvqBxaVnSlxvm8ced5
         MT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656016; x=1791260816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0YGchqah0UzfAha4yAxOufthwsRqWdGvnD0C4S2BIAM=;
        b=YLoIlubiVUNgALQKzkIp31bXRQ0ldQrvq1yy01g6U7V6EBy0q0yNyMVGSpkA4feAY7
         LE/QNyw9aPEvQZ25ExKm5PZj2DrD0dBUK5gconvmFgCes41LXf60tR/Fo6HcQODCom+l
         ul5/xjSH7zFSVhgVsAc12tNjEkle8SrJjZXUba8Zw+DnFzTrSJI3wfXip/KxeZMN1N06
         +fFrbdMWjXUw/d8LTx8kJvrtXyJp9cpdSe6AD8WZ4fb+BNSAZ92c63iaZZ1CRUpSYKij
         FzDk6inmuqBrWHrdqbOAe8Hy8ghVzvKOrWeFVXgZbruX0WguyiwBQRsCukdD4CGDr/Ul
         IPaw==
X-Gm-Message-State: AFuF++mDp2oMVNCdSIf212Mq2oRsQ8YtTR8SfFFRm8jUxIQWaguowIyP
	uUTje+XDZaMzSnfRI+akLR69LhHabhIWEuzQa7ymwnwiCSzRJcUp2YSUm3GiHgjho9Z8agNnTIj
	C/eHZYfjUNb0nEsZ6njVSxCI9EjCjDg6EH9f24r1d9GGp3au+KgtoThA03MOK/7q+sHyl
X-Gm-Gg: AYBFou1QmPMFmGjNGFER6yIvuh4Ys4h22fMRzmqJKWlxjtnAUUNDbQ+cbiI2EX25qOR
	TC/6TXxQRgXkm0e85h20FRIQB2Cakv+2VVIOX4qOkUsfYq1LJ386mLPkamq517r3Dkq4/q24mbq
	G4EEdYVHmtS9i/BEuG+DKqwXsr3CpB7Dof04RIbujRO7nu/DfbfDA+BvNgQ+o8Vg7rFzgypVIAz
	3red7oh0/BJBgugei4JU9ZUf5LklYzxF1/VdDmPoJwE9OMR2g6oDnd1wt/ROsgMWw1FRAgVtFmT
	hGI/Y0jlxNuhatvaeonrCVUG/jCyuuPfc2souZjkYs62bOr1SzYFRhOWTxLZ+N3gjMrbo8lP2uO
	UqpKy1/DrayVAJUBHrm7Yy2UTQ63KVLo0tz98mon+1ElGO7zEwzj0LabM+K8jLp0=
X-Received: by 2002:a05:620a:454d:b0:93c:779f:3e02 with SMTP id af79cd13be357-93c779f4691mr1143571585a.11.1790656016320;
        Mon, 28 Sep 2026 21:26:56 -0700 (PDT)
X-Received: by 2002:a05:620a:454d:b0:93c:779f:3e02 with SMTP id af79cd13be357-93c779f4691mr1143568985a.11.1790656015798;
        Mon, 28 Sep 2026 21:26:55 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:26:55 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:30 +0800
Subject: [PATCH v7 06/35] drm/msm/dp: add MST stream register definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-6-4b81473185e7@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=7708;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=8Dmslyk2Fa7jwFI4zAsCVxwM9n6Gty4eaAtju08j7YE=;
 b=I/7nIHP1RW9aZmYgnWyL0LaA78c1Jsbnpx1hjSBTPHp9cgY2ReI1JipgsXq3wuprE6c46hOnD
 trpNSP+Q6BVDLf1Rf24xNIkOzt0dN9LylUswugJTH5rlyq+qcws3h5f
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX0L4va1V2d3gG
 q5hjTKES88y/P085mqw5RIKA33A7ciTTb5a9TinHcTWwZxafEvff8vzc+o1HqyrK5h5s2FkzOKF
 dKHho9bLxo9KWFj6W5zklI30Kd1zgUH86ED9wVYR4VhIi+Hx2NVHzHz9vZkIk86huXE53XYYhA0
 iaGw8vGt5RcbP9eYLGla3teq5stWHKMszcEDSE2yeoZ3LSRQehRxnBfZ8WymClGQIGN6C8z4+RI
 j7hycyejmFP6t68KEOzPhZdUJX9IgklsPNOREX7hVkjH56Zdo8aLPdSXBnODZL2YmfAHw7syHWO
 DsXtDIuvyuwvbZ3djnUBF0m7Kjn59vI7K4Ulis8ptnu9ToQugy2aboYpYCmf5hjZFgJIqjUj9gt
 0m6xns/E2HKn9enkEpl0T1YBuix9VAKAlewz4ibtvQiFME5CizR/nlSRsKNiOo+DpEjmqA8NrZZ
 Z7jZFuI8a9RqBomAqIg==
X-Proofpoint-GUID: vnCeuxJhQt8IbHKw-0-I9aF7U_VVQHRj
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abb3e11 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=qrQA6X-0r1DpH4znwvkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: vnCeuxJhQt8IbHKw-0-I9aF7U_VVQHRj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX9XAZtKhOrx/L
 YIez3Zh3AgX4eUAsptv6p3Pe4miiKt3kTgzAfYzEI6ntPo1IRDaXkax4UXKRo/d3187lPkud9qU
 TjL9k2xgMtSmivcjuWEuHl8bXiEhv10=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290017

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

