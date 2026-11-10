Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286512;
	b=VgA2hVDaRuqvBuC0XOtClOMchehhOkibzI0uWPpznsMVzBeR1YkeYt0B6jsLZf7F7Lqc
	 sVCBadJ0/PN996kYBDr2VH6twREzp01wb1NtDlwcNgadNVsx2SY5nXJFnNIEVY/q9zWrT
	 dRGKtA9G/Hkt7A6aWVwaMzW/UXYYvWeg8DkPCcqQnqN9XXVZbz4ovE9CAwUkT0MVW/HIF
	 krXTe//YnbT0AENIEgTJj5XYT9XAZw5OmEoA0zGHJu562yhLr2+61A+dPGZDA8Ak0woiI
	 YaQ9rdpq+3IZZJe0S+v9QgLuSGVmS6DZ+7s77u9wBQEYKzQUknDE+J1jQE5d8ED8nsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286512;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=F99lAPL+7HQeILJRdNMuZUG76hPlnadtFUgoCd83+8Q=;
	b=raSOM023B5sp6hyJP/9arrwQFkEmRuqQtzCqD9RjBuQDDaQD+BWYxLTkzuBcQoc2SV8y
	 3vz8AlMaN6qvKQ+yl4QpvUKg4akz2JlJTDuU7loQ3fIZliRWMnPi531g9bFbA0466HfVh
	 c2NesU3iRCz+bJdE12apwLeXc1X9JAzKpVrIBC0V23HzBFWaKWYo5ZJfUYTMnwKWixgo4
	 ngdOShymXKs28DsWeFdHmmDJzD8aPRNj2NiNvehDUnoJPwR/PZNcmutYX/Xf1wqKHk21v
	 Nwad/bp3mhCbjI17oq5lih4R3F4W5ZzKMmDcNGiO8TvJhXm9rMCe7aH1m/leNlIgbpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="bmQTFo/h";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AiiWyqem;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8F1606A325
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E8F1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bmQTFo/h;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AiiWyqem
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4AI3W679825
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F99lAPL+7HQeILJRdNMuZUG76hPlnadtFUgoCd83+8Q=; b=bmQTFo/hLnUNHIbb
	TrjW0Zgm6E2f7rP+VtBS6uXAdNaCNu63XwB4XnKKkQaIdOywRAySOvdnplPebPyU
	nGAtvvCXrUcwO2ALNTtN06ARA1ooym7TrEQGDvGF3LqM+g7ss4vYqR/M9HyvANoL
	eOPpwKEho7/CSi/owq2pBemRYOa0+U/4rpQc4GfMApSO+cYVsBXk8osqOmVyvC2E
	usoD8cnMkaXazKOHXbCdaf/4jqwNHS2N8NDuYa3xyDyr6RTBwMc1uCEbdX3NTYQ4
	DTIE+j5mTHTRW5VKH/qvMDYEEsh3BLEJ0l2+KpL9L6Y7anvNl9lrMEBRxfXep6aM
	jas+xw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv48d2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:55:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5364605e74bso45191401cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 20:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286511; x=1794891311; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F99lAPL+7HQeILJRdNMuZUG76hPlnadtFUgoCd83+8Q=;
        b=AiiWyqemimcr0jAyzVf84AKm85UalLhh6gNJo+GEMIeQXKg4E0iHwZb8D2ViYlbZIG
         IHqrgirhu7dBnWyueJL7gZAQm4d/ssC2+pMc6nXhVIur0+i238pe/6dDtBpohH2FgBoA
         IdChoXPK9bP3wFaOOwRrOn+fsByxRt+mHtEtQYPNinXCuu68E8NjoulFtI/PVGBzNhWi
         THNBIN3XXQfG12KugFgxC9bnjcoEkObVSNa57udlKXAMoi1pZzwkO+lFafbvleBcWxr2
         gnNSMA0ZgCYJk7ZIJgR9ecqBS1iPaGCATFaSwJAQphHHSouBAyFUhr/piHc5SxXFTiPk
         +oCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286511; x=1794891311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F99lAPL+7HQeILJRdNMuZUG76hPlnadtFUgoCd83+8Q=;
        b=lHy6OZ3ioieJfGWNIRxC1TSl0PLXOujhi7rrEHRtD8XYmoctXOlGHjmGNE0UBtVEk7
         mnaPVfKxlldr8KS+Y18N0jsNjfVaIKtGdOVJUOp0TKbY7dJU0n8Ba8ufrMILjXUQ1jkk
         OyzHuMlEhha6bhXqt9S1TB9DwYsv1z4tJb8i2Xz3PEVcd9UoDjAS1rLyd/9InO74CdBW
         9hUMrily38k5FMX0oVDQL44NTy/UqpAcL41fNJDgeB5a73CuFhuC6K5MR0cy9BzZbOkT
         uY0NiSeuV23CZPPAgg5lhnPgWnGLPqwiKPSLDV1SnANShCFGq0JSDG9xhE98GxMB+rjq
         Q6NA==
X-Gm-Message-State: APuU4Z8EJAf0D0v5RNH0oGksQkhxWZcPxyygoxFZsAGu1jwVjEbrv1YJ
	2ecI8O8jPm20nbCkiInaMgHWlscR9tZdcYCVEovwxNyatOIw+uzJ8sJboUKEIsBNr+g/8trW7Bd
	wiSAEMT+mqZG5dbdB3ga2hU7N83BHoMMdvZ1686FYdG2XCHP9clPzfJKMEf+BxmDTF60X3anbF1
	xJlzI=
X-Gm-Gg: AYBFou0h3UipN83/MbeWtozmUqB1nRlTtitdMThaFHYyH0VlKXuMqkoQf7LXkLvLQdW
	bVkgxHeHO3cekOa4st/ilnq+stdZZEkdXGyCMBzQEFjs8x306tn2XBX/T07QgSuOk6bcMIDxbr7
	f8KIjbXxL/FmEuenAFP5UhLy0kyZDotx7X+57rN3Snd/FjWSbEcvYWi67shrCEb1DKQkH1ocx3S
	SKMwgJ9KPYH+uq+G4OZSD9X0WYjLQOrGXqwcLCISFaOwjt72YLEhRnq9L4tTFcrNOa2phBFxA+C
	uuupP3qInMfS7Ju2coqkm3W41zgUwzPut1VTckxFot6Dj0kkipWIXLE4zC9GYet/RYrMzyTDCsx
	ughJW2yfXuYQw8lk+Shk+fkADW2wnKX3iLSGohCKJAP5hgSVhJ5Mk6AY8aao5nfQnq+cfxX+h8h
	xsCMZFY3fB1V423e4KTHpf7N55afT46SufIZWy
X-Received: by 2002:a05:620a:28c7:b0:93f:6f8:9d74 with SMTP id af79cd13be357-9479f42f4cdmr234912085a.77.1794286510471;
        Mon, 09 Nov 2026 20:55:10 -0800 (PST)
X-Received: by 2002:a05:620a:28c7:b0:93f:6f8:9d74 with SMTP id af79cd13be357-9479f42f4cdmr234908385a.77.1794286509988;
        Mon, 09 Nov 2026 20:55:09 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:55:09 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:28 +0800
Subject: [PATCH v8 07/29] drm/msm/dp: add support for MST channel slot
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
Message-Id: <20261110-msm-dp-mst-v8-7-d040fb33db5f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=10674;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=lz1Q+o19JAoj7r4K8SAHKIodd9gZOEKvNakfsThKtro=;
 b=vfhvAtvbJBjpDRKMa8BTsECnIjUTtLpMRbqZluwUbzmlCsxlKoXIATmUHHvYsl2LQ9/yb2cta
 dDUmyLgqGVTDFhhfCRmnw3oVzs7y5B9tHILJ7vuCXHYvAiWvJpKLA1S
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX46/pteGWFVFy
 3hZaiAxKkaoS9/d05yIatzMhzebIwmeqE//aXUoQzbqX/vMTq7T3T4GlLIsKz+K7aEWDNsGYR9D
 pn4M4ApnVgwsZg9mEZrFJ94DHaHBxws=
X-Proofpoint-ORIG-GUID: AUWH7_uYMw98p7nxzZEmekcLdD-QtQ9k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfXznnerc/0xSy9
 qo1qalf4rUrV8BZjjXZOVW+rYuHvnf5mW0/EfDM3ZYaNxGBkwrs4p5Vp+/0wgXbbhpPrmiNb+Lz
 MESFwgKEV+1YZLIymRRd6/414RQ5/yJOcdODRkchf8RcmvVgO23GLvzCzrh7NbGEOSZidRz2y0n
 T6iTF0HIx0RqJP2r2N95jatY/AKjYROICmSevi4XLHiRt8auUC1jmj6DMqvDYhwwHPQa1CtGJFy
 vdxePQWMgVs+w7OJqXMv5T7BlRdkRtlnDR+uHDbRhUQwWy7r1ZUx1U8XmMn8Oep6u7RKxIMNQ6j
 A5YPGqHwZ8Zu/EL4wtFvUsYtiAErYmsQlNCehz19o9gV4zH7dkGKek5zTUAnK+96DZOQbl7WBRi
 6p0QAMsQyHWH8//DOmcMKuxwZ/If8lf+VloxXvDfQ2pnft1VI174a/gL25PCEGh9HurEdIv9zsd
 p9vaCnfAtMberg1umwQ==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af2a3af cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=pnEgmsRcgLnKDHl58KcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: AUWH7_uYMw98p7nxzZEmekcLdD-QtQ9k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100019

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
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 147 +++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   4 +-
 drivers/gpu/drm/msm/dp/dp_display.c |   9 ++-
 drivers/gpu/drm/msm/dp/dp_panel.h   |   6 ++
 4 files changed, 161 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 8a2396aec6d5e..0b34db3bd5d22 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -83,6 +83,7 @@
 #define MR_LINK_PRBS7 0x100
 #define MR_LINK_CUSTOM80 0x200
 #define MR_LINK_TRAINING4  0x40
+#define DP_MAX_TIME_SLOTS 64
 
 enum {
 	DP_TRAINING_NONE,
@@ -299,6 +300,37 @@ static void msm_dp_ctrl_mst_config(struct msm_dp_ctrl_private *ctrl, bool enable
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
@@ -2710,6 +2742,100 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
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
@@ -2747,7 +2873,7 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
 }
 
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel,
-			  bool mst_active)
+			  bool mst_active, const struct msm_dp_mst_slot_info *slots)
 {
 	int ret = 0;
 	bool mainlink_ready = false;
@@ -2793,6 +2919,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 	if (!ctrl->mst_mode)
 		msm_dp_ctrl_setup_tr_unit(ctrl, panel);
 
+	msm_dp_ctrl_mst_stream_setup(ctrl, panel, slots);
+
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
 	ret = msm_dp_ctrl_mst_send_act(msm_dp_ctrl, panel);
@@ -2844,6 +2972,23 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
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

