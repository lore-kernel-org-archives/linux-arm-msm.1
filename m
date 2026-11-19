Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076708;
	b=P8OJl7uz+/Yp90mIrv8KIAQYCSVod1S7CBRwFW453dRv2T/T9wUFqJfneXBA2oGdo3vH
	 mi09derLaI6I+rw6/rYMokwsGyZTcO8IPyg0eBvVqHD8Ys0gyahjii7WsoGWprdm09+75
	 FVszdLe0g0zhdkDWj6rLg3bDBte1O9dQIiespMTdm9FVM+F5ThR5dKU+eMQXdS1sdw2W8
	 LhZvWzbPg4ZknI9qtNWpxSTJdwnjwGObfU/gjzNxBMtco0yd+Aq6Us37jwgJo4XaM3QGB
	 V4PvfY+C84yKXpPyVMtZPk/8SSSngDPddGH5SdSOCRoX2RKb81Lt34dVkgBhfHmqOaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076708;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=eW3va2q7JSm+MHPdLUWITH1Ibb+qgO5YXOZ/LgVKaqI=;
	b=47hMDjquEiiT9KGIvS544wcVQ4iv5fENs73XVMEg3JzBfQyGQTf720O2I+UtY8wX8lKR
	 OKTcNk00p3r/shibOy+lJ5kXHSNzPpnmPXhMC0ewHL4aOUqkZqPixm4a9m2kNh9WP36zm
	 5hlrIO9kVCRZHZSz46/nMswxa3iEbXDzmMYd/W0UELdgKE7m/mEu99bs2FEff5nED69Un
	 Ku4YaJXpKuw1muQB4YlLCC3NekYDJXAstfwbTtvIdbOQlZ3WzruVIEXoF+Bl7gsJcNIyG
	 YvugTzKZ63ouEQYX2nNGMLz3GtZMHlZ0rTAmCOtK+vD/5vVW42azhwIc5S8HMo2SHMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NMEU3En7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifMm3qJT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AF2606A32C
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58AF2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NMEU3En7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifMm3qJT
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6v6SH2030616
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eW3va2q7JSm+MHPdLUWITH1Ibb+qgO5YXOZ/LgVKaqI=; b=NMEU3En7vEduMex5
	9yZdvqIyLL3WyuVo7xlHwWjL45jKxNW+NvUEWFuJZJ2cgaFHADW8vr41U5KofdIF
	gY6z6FttPdaOKhtmYh2ees0o43FWGp6NDgOVBuqjA/AoOGOOyBqcW+1+H0KsVQ82
	/lZkVERcxnvF8mcK9SRRVoLCmHQxa69LS2N0Xfj/fOZk0xFQeL/p75ee7RDngmO8
	9DuJkgh31j5XA7UmcQhXu7+4q/3hlP06n71Liwsfcm18g+GILeqDElayE6Yn/7M+
	5r0uTxvRUaVYxn74RwWHD8DgnEKGq07OGWBf1vuB+LWW/8WZsttU8fgGAKS6SumX
	kEFbNA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g3kueqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:25:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f559420f3so236541885a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 00:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076706; x=1795681506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eW3va2q7JSm+MHPdLUWITH1Ibb+qgO5YXOZ/LgVKaqI=;
        b=ifMm3qJTkEszyc9kboiFOcdWetzFROVOtIVXLA4M2EPd01APQ24BSYsA3Pb2zk68A0
         1dsfU6J4GV6TSvQENg/3rNf43Ijk0QAK5UArJ1rb2yUJXQyv4K8Fwfwr7Hqec0m03uqT
         wsHAI9bQfXbIVE8GMX0TRJfHQlwVJjMPRndg99WGnNSGcqI056AiQUd5yVDXMie/B/4R
         iF0jGM/AS1XQSYATy5BM73iJ2abZuTmkfj7m1g1mZICk/pBMIO4Nkyf3VkfuprsPg6Hz
         6Dm0zwnvu9YYvjUX/znQ/fLuPcWCq3Gce90JWvKRqFIH9a/PvAjuE08Rp2CxOpGVMJRC
         K1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076706; x=1795681506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eW3va2q7JSm+MHPdLUWITH1Ibb+qgO5YXOZ/LgVKaqI=;
        b=qhAQE3ea4/TjOLdKuwArjD7jWqjqttfrMvFMDlJHMIjMmwztJ/Gu9cgfD0wIPCSBJy
         iNqeMMGciWwku1U6vlvFBAcyKtNSbZ1Cbo9oqHDVmS6eb+kv017SJPhoBMXwRKgMLANn
         jnC3/KZqtvMOXLPg0IA5EfzpU3IOcZDSniKszvb5eqWe8VXj3WaYTC7nTRomnfn65aF0
         mQiM9Gm85MiU5glz3yi6U/LX54wPa/0MfQxLtcLEceXT2Vjfmub1LEFyve5q6OoVYEXF
         d9nZixvU3TT1agU4Tb6jlXsQ06dTNZVe9NMN6JU7QkP4MlnLPUhfMSvyghGG0UZ5Go+F
         m89A==
X-Gm-Message-State: APuU4Z9FfpKKfrQyyfvIM5qFYAVLrg19I1tTGqQhacKTjhpJoRFDdx79
	aSDujF6k1EF4ZQQ33LzOqUsLle6eZWr6FX0YziWwI9R8yqFQJaa/M1FpU7bjOgm6iS/UeaRq6VV
	mSFQBHIieg1fBYz+t2POzPXbvDnqbhT9InWumT3kIMuWbvJHdADPj16R1okG1rTUiJXhh
X-Gm-Gg: AYBFou1mnQ6e5POONOiTOOHs4f5FawqoBYC6UpKe8z/wlnon76iU3DZ4XAx5GgQaDyy
	efxF3cfaEEgn10SinAx/d5xaWTtvj3b9HHqIWKrmVBrvIyXINu0a3W5+reJwMmzogNF92HC7KXB
	BA0m1e6jCXtz8WeeT4r02xA8JSrn8u6z46YFCBSvZ3Yl4h4GXEh/n5ts9FypB/YQzFCwgP5hcZL
	ozVyOgIAsHcRCAxdXBgVw0NG2GQOvbZCloskDONHbi3sc/SSza98SZifSj15SZ3Khy3gr11auXN
	qPY4GenmfFLH40BHfDWJe5V+kkpoBM1o1aFee/R4EM51KPCKrGREH6vbvqqpsnErmsR5Lg1djc1
	oB7W+HUMmiAWnBrnSEevSJwQhqw7v4K+Mk9GRMY+QYl062ZWUhTPpqYtSxhYZBEc0GEE5R7JANB
	OXjV31TChNNq7Fb4BeZjoRDcVwqIplYLiBMJta
X-Received: by 2002:a05:620a:8398:b0:944:3c5:ffd8 with SMTP id af79cd13be357-949995d04eamr917784185a.35.1795076706224;
        Thu, 19 Nov 2026 00:25:06 -0800 (PST)
X-Received: by 2002:a05:620a:8398:b0:944:3c5:ffd8 with SMTP id af79cd13be357-949995d04eamr917779385a.35.1795076705601;
        Thu, 19 Nov 2026 00:25:05 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:25:05 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:09 +0800
Subject: [PATCH v9 07/29] drm/msm/dp: add support for MST channel slot
 allocation
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
Message-Id: <20261119-msm-dp-mst-v9-7-ca61be4edfc3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=10561;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=rIw12qZ3elZKb5+qv1Q7HIYBbr6NIZBr22qfi78UU7A=;
 b=PTYzbaWHMyLPMarbnbpjfW4HKgHEojCWR+FJUX40IoZYPtFyCTg2Ry/hknlgwHyJfdzBqmn/y
 P+1K9j3V4ZmBLzgUPYzOTKUiczzB84N3GvjY+7vQ6CndfP6FLioVujy
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX6tYbjo+CEQ4y
 J5CCGxWTGNTMurRReyv5iUlasK4jpgP58rsfy+LGdtLfqXahGfpbKufBrq0ahftAqa5oeHoINl7
 MASmxWFBNoaOJP2kHsmYX9Dy+iG/f7eoQ8AYKovxOv938k+okqtwuMItDOpD/3vcgipA6R6CexJ
 sODHidxsMEVbsNjZRk5eHOEgXScWUgcHupqxdv0dZlvW1WfoCXpDydhg7eyDBUQkc71P0TY+HOh
 7/leIpXc007SNFaSh2Cp5suPrtj5BaC/j12XSDevuPSNInemwMDLJFL3APyEP581iu1wlYWuMUl
 RMtLgWhwyE0cRuuutj5zXuSnIyKvoQfspid/QlayDEFzLZxWhZufG1kM7cXo228EZD+iR27qt1m
 ZE81CsjWaDDEeHNkbqpGIgie4YGjENwzQKcHuN98FQLwJvINgr735Ow2ZDlKIEx+YV39uwL9C4s
 ERg27Ve6btHgJ3q6NKQ==
X-Authority-Analysis: v=2.4 cv=Wom+otfv c=1 sm=1 tr=0 ts=6afeb262 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=pnEgmsRcgLnKDHl58KcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfXy97ktfvzRn0i
 Eg8iXcLQeKJIuKy7vvsHddPwEjSwik7F6Hw21oF8ypOBcMMjzWyl0XRja/L6arEg7pWJtIhmWXk
 7cTWCb/OBPXxZKAefYzxScvXh+1xjic=
X-Proofpoint-ORIG-GUID: 4XW9jgPRejfCtnl9Pn1z1_pcuWkLGM2n
X-Proofpoint-GUID: 4XW9jgPRejfCtnl9Pn1z1_pcuWkLGM2n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

DP MST streams share 64 MTP slots in a time-multiplexed manner. Add
support for calculating the rate governor, slot allocation, and slot
reservation in the DP controller.

The per-stream slot allocation is not tracked by the driver. Callers
pass in a msm_dp_mst_slot_info table derived from
drm_dp_mst_topology_state::payloads, which the MST helpers keep up to
date, and the controller only translates it into the per-stream
timeslot registers and the rate governor inputs.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 146 +++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   4 +-
 drivers/gpu/drm/msm/dp/dp_display.c |   9 ++-
 drivers/gpu/drm/msm/dp/dp_panel.h   |   6 ++
 4 files changed, 160 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 2ff36d3fcb67f..a9d0956a9751b 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -299,6 +299,37 @@ static void msm_dp_ctrl_mst_config(struct msm_dp_ctrl_private *ctrl, bool enable
 	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 }
 
+static void msm_dp_ctrl_mst_update_timeslot(struct msm_dp_ctrl_private *ctrl,
+					  enum msm_dp_stream_id stream_id, u32 ch_start_slot,
+					  u32 tot_slot_cnt)
+{
+	u32 slot_reg_1 = 0, slot_reg_2 = 0;
+
+	drm_dbg_dp(ctrl->drm_dev, "stream_id %d, start_slot %d, tot_slot %d\n",
+		   stream_id, ch_start_slot, tot_slot_cnt);
+
+	if (ch_start_slot && tot_slot_cnt) {
+		u64 mask = GENMASK_ULL(ch_start_slot + tot_slot_cnt - 2, ch_start_slot - 1);
+
+		slot_reg_1 = mask & 0xFFFFFFFF;
+		slot_reg_2 = (mask >> 32) & 0xFFFFFFFF;
+	}
+
+	msm_dp_write_stream_link(ctrl, stream_id, REG_DP_DP0_TIMESLOT_1_32, slot_reg_1);
+	msm_dp_write_stream_link(ctrl, stream_id, REG_DP_DP0_TIMESLOT_33_63, slot_reg_2);
+}
+
+static void msm_dp_ctrl_update_rg(struct msm_dp_ctrl_private *ctrl,
+				  enum msm_dp_stream_id stream_id, u32 x_int, u32 y_frac_enum)
+{
+	u32 rg = y_frac_enum | (x_int << 16);
+
+	drm_dbg_dp(ctrl->drm_dev, "stream_id: %d x_int:%d y_frac_enum:%d rg:%d\n",
+		   stream_id, x_int, y_frac_enum, rg);
+
+	msm_dp_write_stream_link(ctrl, stream_id, REG_DP_DP0_RG, rg);
+}
+
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
@@ -2710,6 +2741,100 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
 	msm_dp_write_stream_link(ctrl, panel->stream_id, REG_DP_SOFTWARE_NVID, nvid);
 }
 
+/*
+ * Calculate MST Rate Governor parameters x_int and y_frac_enum.
+ *
+ * The RG paces symbol delivery per MTP via: M = x_int + y_frac_enum/256
+ * where M is the target symbol count per MTP across all lanes.
+ *
+ * min_slot_cnt = (pclk * bpp/8) / (lclk * lanes) * 64   -- slots at 1.0x BW
+ * max_slot_cnt = pbn * 54 / (lclk * lanes)               -- slots at PBN limit
+ * raw_target_sc = (min + max) / 2                        -- midpoint (~1.003x)
+ *
+ * Quantize raw_target_sc to 1/(256*lanes) steps, then:
+ *   M           = Chosen_TARGET_Slot_Count * lanes
+ *   x_int       = INT(M)
+ *   y_frac_enum = CEIL(256 * MOD(M, 1))
+ */
+static void msm_dp_ctrl_mst_calculate_rg(struct msm_dp_ctrl_private *ctrl,
+					 struct msm_dp_panel *panel,
+					 const struct msm_dp_mst_slot_info *slots,
+					 u32 *p_x_int, u32 *p_y_frac_enum)
+{
+	u64 min_slot_cnt, max_slot_cnt;
+	u64 raw_target_sc, target_sc_fixp, scale_fixp;
+	u64 pclk = panel->msm_dp_mode.drm_mode.clock;
+	u64 lclk = 0;
+	u64 lanes = ctrl->link->link_params.num_lanes;
+	u64 bpp = panel->msm_dp_mode.bpp;
+	u64 pbn = slots[panel->stream_id].pbn;
+	u64 numerator, denominator, temp, temp1, scaled_target_sc;
+	u32 x_int = 0, y_frac_enum = 0;
+	u64 target_strm_sym, y_frac_enum_fixp;
+
+	lclk = ctrl->link->link_params.rate;
+
+	/* min_slot_cnt */
+	numerator = pclk * bpp * 64 * 1000;
+	denominator = lclk * lanes * 8 * 1000;
+	min_slot_cnt = drm_fixp_from_fraction(numerator, denominator);
+
+	/* max_slot_cnt */
+	numerator = pbn * 54 * 1000;
+	denominator = lclk * lanes;
+	max_slot_cnt = drm_fixp_from_fraction(numerator, denominator);
+
+	/* raw_target_sc */
+	numerator = max_slot_cnt + min_slot_cnt;
+	denominator = drm_fixp_from_fraction(2, 1);
+	raw_target_sc = drm_fixp_div(numerator, denominator);
+
+	/* Quantize target_sc to the nearest 1 / (256 * lanes). */
+	scale_fixp = drm_fixp_from_fraction(256 * lanes, 1);
+	scaled_target_sc = drm_fixp_mul(raw_target_sc, scale_fixp);
+	numerator = drm_fixp_from_fraction(drm_fixp2int_round(scaled_target_sc), 1);
+	target_sc_fixp = drm_fixp_div(numerator, scale_fixp);
+
+	/* target_strm_sym */
+	temp1 = drm_fixp_from_fraction(lanes, 1);
+	target_strm_sym = drm_fixp_mul(target_sc_fixp, temp1);
+
+	/* x_int */
+	x_int = drm_fixp2int(target_strm_sym);
+
+	/* y_enum_frac */
+	temp = drm_fixp_from_fraction(x_int, 1);
+	temp1 = target_strm_sym - temp;
+	temp = drm_fixp_from_fraction(256, 1);
+	y_frac_enum_fixp = drm_fixp_mul(temp1, temp);
+
+	y_frac_enum = drm_fixp2int(y_frac_enum_fixp);
+
+	*p_x_int = x_int;
+	*p_y_frac_enum = y_frac_enum;
+
+	drm_dbg_dp(ctrl->drm_dev, "MST lane_cnt:%llu, rate:%llu x_int:%d, y_frac:%d\n",
+		   lanes, lclk, x_int, y_frac_enum);
+}
+
+static void msm_dp_ctrl_mst_stream_setup(struct msm_dp_ctrl_private *ctrl,
+					 struct msm_dp_panel *panel,
+					 const struct msm_dp_mst_slot_info *slots)
+{
+	u32 x_int, y_frac_enum;
+
+	if (!ctrl->mst_mode || !slots)
+		return;
+
+	drm_dbg_dp(ctrl->drm_dev, "MST stream channel allocation\n");
+
+	msm_dp_ctrl_mst_timeslot_setup(&ctrl->msm_dp_ctrl, slots);
+
+	msm_dp_ctrl_mst_calculate_rg(ctrl, panel, slots, &x_int, &y_frac_enum);
+
+	msm_dp_ctrl_update_rg(ctrl, panel->stream_id, x_int, y_frac_enum);
+}
+
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
 				  struct msm_dp_panel *panel,
 				  bool force_link_train)
@@ -2747,7 +2872,7 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
 }
 
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel,
-			  bool mst_active)
+			  bool mst_active, const struct msm_dp_mst_slot_info *slots)
 {
 	int ret = 0;
 	bool mainlink_ready = false;
@@ -2793,6 +2918,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 	if (!ctrl->mst_mode)
 		msm_dp_ctrl_setup_tr_unit(ctrl, panel);
 
+	msm_dp_ctrl_mst_stream_setup(ctrl, panel, slots);
+
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
 	ret = msm_dp_ctrl_mst_send_act(msm_dp_ctrl, panel);
@@ -2848,6 +2975,23 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 	phy_power_off(phy);
 }
 
+void msm_dp_ctrl_mst_timeslot_setup(struct msm_dp_ctrl *msm_dp_ctrl,
+				    const struct msm_dp_mst_slot_info *slots)
+{
+	struct msm_dp_ctrl_private *ctrl;
+	int i;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	if (!ctrl->mst_mode || !slots)
+		return;
+
+	for (i = DP_STREAM_0; i < ctrl->num_pixel_clks; i++) {
+		msm_dp_ctrl_mst_update_timeslot(ctrl, i, slots[i].start_slot,
+						slots[i].tot_slots);
+	}
+}
+
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
 			    struct msm_dp_panel *panel)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 84ea37d8db2e3..9478f127c6d34 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -19,7 +19,7 @@ struct phy;
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
 			struct msm_dp_panel *panel);
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel,
-			  bool mst_active);
+			  bool mst_active, const struct msm_dp_mst_slot_info *slots);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
 				  struct msm_dp_panel *panel,
 				  bool force_link_train);
@@ -63,4 +63,6 @@ bool msm_dp_ctrl_stream_clks_on(struct msm_dp_ctrl *dp_ctrl,
 				enum msm_dp_stream_id stream_id);
 int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
 			     struct msm_dp_panel *panel);
+void msm_dp_ctrl_mst_timeslot_setup(struct msm_dp_ctrl *msm_dp_ctrl,
+				    const struct msm_dp_mst_slot_info *slots);
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index f6d16c57afcc1..e046184a30f50 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -668,7 +668,8 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
 }
 
 static int msm_dp_display_enable(struct msm_dp_display_private *dp,
-				 struct msm_dp_panel *msm_dp_panel)
+				 struct msm_dp_panel *msm_dp_panel,
+				 const struct msm_dp_mst_slot_info *slots)
 {
 	int rc = 0;
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
@@ -679,7 +680,8 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp,
 		return 0;
 	}
 
-	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, msm_dp_display->mst_active);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, msm_dp_display->mst_active,
+				   slots);
 	if (!rc)
 		msm_dp_display->power_on = true;
 
@@ -1491,7 +1493,7 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display,
 		return;
 	}
 
-	rc = msm_dp_display_enable(dp, dp->panel);
+	rc = msm_dp_display_enable(dp, dp->panel, NULL);
 	if (rc)
 		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
 
@@ -1525,6 +1527,7 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
 		return;
 
 	msm_dp_ctrl_push_vcpf(msm_dp_display->ctrl, msm_dp_display->panel);
+	msm_dp_ctrl_mst_timeslot_setup(msm_dp_display->ctrl, NULL);
 	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl, msm_dp_display->panel);
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 04938b9d2091f..9f34cc9010d38 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -36,6 +36,12 @@ enum msm_dp_stream_id {
 	DP_STREAM_MAX,
 };
 
+struct msm_dp_mst_slot_info {
+	u8 start_slot;
+	u8 tot_slots;
+	u32 pbn;
+};
+
 struct msm_dp_panel {
 	/* dpcd raw data */
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];

-- 
2.43.0

