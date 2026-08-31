Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA093D25B2
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164266; cv=none; b=FhEgDnTLBE1FD/d6EKJlTEN2hU9fcjDt74BtGX2fdv5VS0GxdkSzqzqBsi5evfY0zF5asplpkfFNoFx1qzF8dyID3f92Ebip9yZ9RA8oAzHS80cDnVno9oVUdF5rxmZx/OryJxOYSuuIHgHnOXKE1UnNjjSo7X0WF+JarEzIUJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164266; c=relaxed/simple;
	bh=1Dvt36Iz2rR47bCfGnFTYvWtkSA0SbZBJEcZBGDHD2s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GtGqv/ab3EzrlpCN6rBHkelDRb+xCknig6AZkXvsp2dZz8fNGSRCFj80E3zo+bIVu5qWHuv/kN908TYSwr5L26+w9twF8oWRS9EKWLKLKUTF2kN/e8anZuLChVdUEAFrZ/41+E0ttDi4xvnYlJ+VBZrsvjznYXmtcNEJXMYznPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jidii2EP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gpsTBktT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jidii2EP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gpsTBktT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xLaY4081777
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NbKS5wp5S+RisOn+z3kwh1eHsCAjG5mu+3wciJLhaUA=; b=Jidii2EPuh29Dzpo
	j4o4cVVuO0Va0uORJ0h7iZdgN2wvMjZpLvVzRAbg2/8ktFEHV4dqlCI93m7hZqJt
	wwqMNZgq8Wrxz+RbM51XaeCgOaUfOsKILqv6wC+AdI9qRORvHfUgf8iyTWaBc8gN
	Wn4BTeRq1dUUzkMxRMb5xr3shPVQFYkjN+iv89cQZG2Ju7EodcvUs6NS8Al/JX0N
	nhxMMcanpn3pmLHi+w6K6/se3owfZmGhTBLMOlZuclUGdEGPEAbrz8fCwxpSGmtU
	UUh095I8NSfRB0MiA1+yMJ35EeWLkrAXCXXvrB4q13xR4A1f9ly7kMzl90+c7Ivv
	y/gJNw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv8h1n5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:17:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930b571432fso459201285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 01:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164263; x=1788769063; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbKS5wp5S+RisOn+z3kwh1eHsCAjG5mu+3wciJLhaUA=;
        b=gpsTBktTLFBlE1wzF0rtWsuwxhipV5J5dSXEjse44QqV+gNTnB4x5yyAB+AAP89ndc
         7XQs9Wwy6Fzv0Afflgg976hjXXuwDQJIwbE4jmGbfY8B/tYU6jytB6Xh02ZjlbyngLYA
         T0ZGMxhU7axDfowzEIC5AHF+IEWVfL9eZtW5PmP/wuZqEXtuXtefPdCMwebaNpLx8Ils
         1UK6RRiJVdK1VpFc3n3emdKmDcNyvX9C2vUhrOu+l8XGzCYdFttMOEh1w7rperxRylZR
         Z53xrLZbXGKDkMYbsloYaaATkNG570jbFM1dpZm2ha253TPcXnRh/KmejgBRYd+DpGu7
         zKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164263; x=1788769063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NbKS5wp5S+RisOn+z3kwh1eHsCAjG5mu+3wciJLhaUA=;
        b=q/EFLXVGx4AAYU7fr+sQeyUhfJfkWTAx6xlcY+XD5iFn4fkWzZCplTaTqJPRrzb6vJ
         +SB4w43ixq506jeBdZa0vxIpwLrp+EYIrBtr4cOFV4fdr4abxftVR0O0JV6qLakbbmX/
         /dysAE2nIvXfTQ3fzyhdIaT4PV4Zsytduk5wXNZy3yaR5b11VKUDk6DMUTigLZ+qC7Xi
         DBnd1DFizjN9OEjmKVuBW3rYiLZxB1I0EIDdRCIwM4XCHbt50ppE+p2kqG86FPI1vhaY
         nilnNztSDtYQs1lIaMYFOTv22o8Ugopr1Ep8UQ6/QvmNURvNk/q8EuVNRORp2pZrgc13
         TrPA==
X-Gm-Message-State: AFuF++mvXx1vau4jEMtkO9telJ2cyf24hGFUy1HLCEZrKMw1e/Kw5vjM
	OFtrvLjrPhwsqELmX1ouDdL4S2qN0SEKHzPNfK7Z8O9ZQSqepWEExkS9CEEpDEbUD0WGE5EuBzO
	lRPcV3t/bHepz8kaMZU50tpDs5gwL8nmZA5IM0tlAQzKySrpwMZmd2KATx9YGZNd3Csd8
X-Gm-Gg: AR+sD11VKDpurLmO46Bz98vVruF+8dSlGToEpvx9HvXd9AyT4LzNp1hdaNRVg/o7kN8
	JDDY5c/s/JZ4/l/IPGDmIkM8D76R/hH8EdHBV5f59/U1TIwLP6Q2MOX2I3AdDrhfqIwcDoct2h0
	dODLQoEz1kmi7Dwsg3dOwLCqUNyA3fxgSBugsBOXdbjkKwOxyK/Sucpgy3b+v3/4loNIfA8AVPK
	4IFu39wZ++YxJLOROO/2FODTjM7zS2Cn6GfGHtju192FTc1Z9+fbg9s08YMKohl0mokouNpPHzw
	Lh8QNPMKNpwNP5LK6TM76YrCsmHisFBPP79w2HnlTacjwT9dQclHU8MKp52l481aIHNb6+nfOQ0
	v7SuGmQlbk/JlI9G+Myh91EqoPujCANEJU8yDhQn8pghoGU6urkfj3EONkn0YJY4=
X-Received: by 2002:a05:620a:4405:b0:934:b798:c245 with SMTP id af79cd13be357-93936d0293emr610517785a.16.1788164263316;
        Mon, 31 Aug 2026 01:17:43 -0700 (PDT)
X-Received: by 2002:a05:620a:4405:b0:934:b798:c245 with SMTP id af79cd13be357-93936d0293emr610514185a.16.1788164262891;
        Mon, 31 Aug 2026 01:17:42 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:17:42 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:19 +0800
Subject: [PATCH v6 02/29] drm/msm/dp: refactor msm_dp_ctrl_config_msa() to
 take panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-2-c91d35d6fb9e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=2550;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=1Dvt36Iz2rR47bCfGnFTYvWtkSA0SbZBJEcZBGDHD2s=;
 b=2y/HmOwgCkVqSGh5Hadd6IDPuaLb73KeDVgi50efvxk361fGKhZPWwnMmbwKCVUMZRZDeEEbW
 b6vH6WZ+Q8oA4hbNbaRIENY+/8wV8aucLVs0pzMdrX/3ilR+x2btSii
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=DY0nbPtW c=1 sm=1 tr=0 ts=6a9538a8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1b9t6BJMd9RmoPA7DzYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX08SH6HVTX4AI
 HgqR8QETXI+373K5YsTSsGxRMoH3PDOZlmoT6gxSXQyIa9disE/h8HWgmSdSh0fLxeiWdcsiYQW
 lcVnuSy9w8nWjs9qItiP9vTO+LDxZWnc8/5t0xEGQKQVkyMxlQgEQnCug+1Igy+4bBuL1PEP4Tk
 SJGyz1VDKN3xipwbxHoGE4b7bamDrtJuxdCUwCh/LFyOy2YhYH9dChHk5CGqnuQBwqgU/tll7/b
 q+aT5y2/OZNS7DSdgJ7XcTftlSUSeEWX6XP1olqDDpnHKvVFe7GzaxjlOmo5FrEBo1NScMgYXZs
 XNJSLemyO/XAjO+IbAzJij6dk+LaQZEVBII+jYFrFdu8o2sIXug+Ba8Vx8v+/lqysa0KOzoJr1m
 crprgdXuiRdrwalB7+/OjKkaNi1vaQ62xXb9/dP+w1xJeNMsoUlMKcRDd/C6XOu5lan+6NKcPZF
 bNIt246Jd9tpnHkht7w==
X-Proofpoint-ORIG-GUID: R_hIzjVyZqtahsC38-lXri-AxpRkM5um
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfXwCU1/Behc+0n
 MdSKbSmHAJvQnwCiF1eJk1UniJV5H8VSqRRI1Co43PEYRtJCAF+UnHNKNOWK0parwy6rzX0bxzj
 +mFqoFT0Cn4PwPTyMf9z8gAHTuDrqrM=
X-Proofpoint-GUID: R_hIzjVyZqtahsC38-lXri-AxpRkM5um
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

Replace the (rate, stream_rate_khz, is_ycbcr_420) parameter triple with
(panel, rate); both values are already derivable from panel->msm_dp_mode.

This lets config_msa() use panel->stream_id when writing
SOFTWARE_MVID/NVID for MST streams, added by a later patch.

No functional change.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 59070f399e2d..1ed713b957c6 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2463,14 +2463,14 @@ static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl,
 }
 
 static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
-			       u32 rate, u32 stream_rate_khz,
-			       bool is_ycbcr_420)
+				   struct msm_dp_panel *panel, u32 rate)
 {
 	u32 pixel_m, pixel_n;
 	u32 mvid, nvid, pixel_div, dispcc_input_rate;
 	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
 	u32 const link_rate_hbr2 = 540000;
 	u32 const link_rate_hbr3 = 810000;
+	u32 stream_rate_khz = panel->msm_dp_mode.drm_mode.clock;
 	unsigned long den, num;
 
 	switch (rate) {
@@ -2516,7 +2516,7 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
 		nvid = temp;
 	}
 
-	if (is_ycbcr_420)
+	if (panel->msm_dp_mode.out_fmt_is_yuv_420)
 		mvid /= 2;
 
 	if (link_rate_hbr2 == rate)
@@ -2573,15 +2573,13 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 	bool mainlink_ready = false;
 	struct msm_dp_ctrl_private *ctrl;
 	unsigned long pixel_rate;
-	unsigned long pixel_rate_orig;
 
 	if (!msm_dp_ctrl)
 		return -EINVAL;
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	pixel_rate_orig = panel->msm_dp_mode.drm_mode.clock;
-	pixel_rate = pixel_rate_orig;
+	pixel_rate = panel->msm_dp_mode.drm_mode.clock;
 
 	if (msm_dp_ctrl->wide_bus_en || panel->msm_dp_mode.out_fmt_is_yuv_420)
 		pixel_rate >>= 1;
@@ -2604,10 +2602,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_ctrl_configure_source_params(ctrl, panel);
 
-	msm_dp_ctrl_config_msa(ctrl,
-		ctrl->link->link_params.rate,
-		pixel_rate_orig,
-		panel->msm_dp_mode.out_fmt_is_yuv_420);
+	msm_dp_ctrl_config_msa(ctrl, panel,
+		ctrl->link->link_params.rate);
 
 	msm_dp_panel_clear_dsc_dto(panel);
 

-- 
2.43.0

