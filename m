Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286503;
	b=2NctQgbYa7BGMzQ0nZcy+QbPVmalYcK9ly7KHpw657dMsz9gb3U3iVX3I3I83IzbaP46
	 zaANTQq5Ius6PSRV8lv1yZvDLHDvHhF1p0fVDpzeL05k8VZ6EDrXoDIAgVR8T0An84qhA
	 g/u8kRCm1o+pLWfpe1r2KeAO/bAk4e0oNoIgvVWTZ6qcvL1ZuyMCV5G3FYK9rInI9wNAc
	 ZvOwH02ZfpLGW3CrivHoSe7h7abTD7kIT6qIK7PeNVwACDbGNh4tCZCC+rqxAh+T2bEs9
	 JI6ml4GtG8aYe4lQvquFRRS2EA1bUreshGat7qVWhTyktIpiEbS9+dS1rpcwHb1/1UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286503;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=o+4gC9v+ruTggTrvIA1zWjWIgQFEi8q477yOKxoTCWo=;
	b=StmxgPhjVC3SRzZ4tdn2A5gjDyINTCKHxjInd+MbElMUIxsR9g/mh3SFABHMA+ys+WjW
	 uXVyQob2pLg+G3GDl91s67RWTNZbMrUDtzYEp4h7p91NyRJr+NlEGRqo5M/N+76VDRJDh
	 vJpefvBOWUJ9NDuz6ZduwLimKSwTpN8lpmzBS06LP8fSmCi8ndoQI/uCYnhKekVZC8fQh
	 B+NvbMRrC1yHJsD2TfVKlbRjuia6j+i3fJXx2BNQ8BAAvKZBasLYbqDd1w5pdhqOFWdRR
	 /cC4g3D+C3vOgIuL4xWXgF7gKERnk5MjZvFw++C0vtCz5ajZ1l6lh4QBnHN4QVSbqyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WOepiCYz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H+TWmg2k;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABB5606A339
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CABB5606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WOepiCYz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H+TWmg2k
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4AAQS2928594
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:55:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o+4gC9v+ruTggTrvIA1zWjWIgQFEi8q477yOKxoTCWo=; b=WOepiCYzZxZW5qsF
	Hgate/qHVjDxmMGqXyDyC90/Wt8zeS335/GAom+5VaBwty1f7dHk/yBc0Y0odrz6
	s6WWcynpMO859vh7Ru049HK+rd739oGY3h23T7eKvc3QK/ux6GpGMCDUedmARM9h
	faZSdCdhHc+Dvl8zS+h/uPahvCipofS1NFkS4wBhHbtozYsE3xi++ymZOkC3/U9q
	WuTKJBM8bLAn8vlHsXHrAzo0PZcOmrSky21O4/lfI8yQI2txsYUBZBzuEok57LCT
	r6FwC0f62gCj55k5cG3V39B/Q6p0spN0Kjd98VhMitkFLkg8WvPl64DW0CfDOqRl
	0JyjDA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx83098-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:55:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-945b0154705so250404185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 20:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286501; x=1794891301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o+4gC9v+ruTggTrvIA1zWjWIgQFEi8q477yOKxoTCWo=;
        b=H+TWmg2kqNWc7RZVatUqx5jC6Sl715cnlvg3SVnEiCgOTG8r3gM4bRmt9RaQxWsNNe
         w6g4syS9euuPeLER7i1Y+9BtYDbdDMT6T1M9maaLMcRFj6fnJdZVWyfT1/NOxonJlolT
         HU13/yXXYx6uoc0REzy/+8sBCn1j+WNjWUQv3WwLoq4vgVtFXnIiEdyJlOMJRSCXS28q
         cZKwg73Wialaif+127EQLKKhzlALsTwpB16LUm5QM+V6Ya5SWOtVEsnx1D34G/pGl3pM
         R2Trk8JpgyrAmi5mpJA5rxpzoISTjIEKrZ1FvuG9bH/1MD4WmITD+DuyCiKtI5LOuCbK
         cAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286501; x=1794891301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+4gC9v+ruTggTrvIA1zWjWIgQFEi8q477yOKxoTCWo=;
        b=oBu1r4GkAUgvnWNnaUwIsY7nUzO4lKc2heWi/zwHE25qTtlTdWxt1acI9TLrmO2GAb
         8fYKkC2Ymp9ftriPWqnIXS/gUSkcgaMNvBe6WDq+SgxCtLJLcJS5MVNu+nCk6Uh41viP
         mw80S+ZDuUMNAYc8FQx15sMrYCrLkFjBnELH8B91cMmWW0A7uBwv8kuioKpGKW6UJrCO
         Z2HS4q941xaWAS9QmjhuiWUDb3i0sMkiJMr68UNQlIJCU3N9rsTP+cAHBj6hKiLCxrg/
         Vy2Mo73g63zTERX8yZ8/gKGpf1R7ZCEey4iY+YSTnh9f+pPm1+VEJL0uO1uF6iQ7hdUK
         n8wg==
X-Gm-Message-State: APuU4Z/fi2Ru/mALWVps5gK7JgLp/GLRT5rH5wXZTWA0vDzlBQNoY2NI
	NZIxAa7NV7qaFN7xILthxSnUX1Qi4xcpyjVNW3E5RPqXAn0EOFDtfsIUY9u5QMrojrACknSOZDG
	BiFfnrmLvCWEl8obeBa4uVxDu1YDvP4eWzRudOZDfYCO+M5rfz8ET2RXEjPDU7XSqJJrM
X-Gm-Gg: AYBFou1O+CITTS1eapXgAK+ZEfcfTx3Mz1NAGbK3Flvj/f99fftN8dx0A6TZPaop7ZZ
	sJOcNAAKjuWsgeHNuKuRBeRZRCNnFdRT8R359GgtqdcrtlQxH/pomuvGUhcmUOo3Wfng4IFavnu
	LoW/S9RVjp+3LnXv6H4Z0/lX/q9X94qat4x7msvxmgg52sOHSxNtlzjKQaB5TxG7RtRuLZWTHc7
	EmkQBWFjRuY/6ZoqSfElJnq3KEyNMbdD4gaZcRwLItO4GVyIEL1VKEmG94l5Eokd1xeiMAEa7gS
	H35QbWOJIkMLUibewvQUXU2Sz1+diOUK3ewAuCpA7MCCfglIuUF3mqdkoddEifyBe5EQ0gGe9sL
	yyaiXhq17Y0vGCEVRCDk+FSDS46qt8JoeShcyAI3oGPRjEYcPc7mM6872NjqIdR99RKRUFylCpe
	gxlS4gKaH66PK9S8vlzEV5FYykksf54dSFRhV8
X-Received: by 2002:a05:620a:4722:b0:93f:568d:ebbf with SMTP id af79cd13be357-9479f33ba8amr246376785a.75.1794286500866;
        Mon, 09 Nov 2026 20:55:00 -0800 (PST)
X-Received: by 2002:a05:620a:4722:b0:93f:568d:ebbf with SMTP id af79cd13be357-9479f33ba8amr246374785a.75.1794286500317;
        Mon, 09 Nov 2026 20:55:00 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:55:00 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:26 +0800
Subject: [PATCH v8 05/29] drm/msm/dp: always program MST_FIFO_CONSTANT_FILL
 for MST use cases
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
Message-Id: <20261110-msm-dp-mst-v8-5-d040fb33db5f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=2543;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=j2fqlJcjMVtjRnKxnkNTkMekgG+qai5ABTbaNabRSf0=;
 b=ENcaNasL578wGbSz7mh3yjYfPh1SGMpHK+rUDVSVqTXgskgMTBlJ0hnSef8jsVtVVlCktM9aq
 U6l9gtc9IysALu77JpO0l+Gm1fDVQ7zLSJpYXu11eDyTTzXdaSK5S1n
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af2a3a5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=_o_Q1azn2oY438DeJ5EA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: zg7tNdJ4UTCjMpumNE9UeBBQqw8jcgu0
X-Proofpoint-ORIG-GUID: zg7tNdJ4UTCjMpumNE9UeBBQqw8jcgu0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX/BLTiqywETKY
 xOyaC3EU4oM7YV/8G6XNdjNr7AIolKjlS7V8fJB90AStJGqwYpwPKV8jo06ImI7PNGHWC7ajw1x
 Rg4uVzVFm6qG8gJyqs8yOZOdCG+C+dg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX+5skIJ1d1o5K
 uOpB4AATtKxat95O3M1C3hDNw/kITRwUrOaW4dAR08oWhimMU/bzraUXv6I1+uSqMgnTfgshrxV
 WV+jyXQ0OIjpVJ4XnPKQeDgZ8kiaXZG82mdwHU5NBm4xx8SKCLo3TQeCjE3sO1nY3DBwfiuCejL
 lmBMS8X6isJB9sLuLUkW3uU/cGM7JxdKF1jLxrAmvx4IlF+NLDZTcz7ZJfbDGgK6t2XuHiBAyxy
 67HUBo2PpxEJ3ctJJACLRU7ePF1iwkWgZUTNVk3zJAZBJP02xP8KrRqANHy1I32/icxbtCdb19q
 GdL7U9ughpDkP0hUr7T/3SEThU3ZIWMXHPmt4ajCA+OVvNtu+y1EEH4BL/qS0XuGjr8uqiCjCKJ
 CcXRO8JibIuiOb9c4m+PIWe+Lr2SRxHMdmDwC31QnHFKHC5ueGkIBbt/TyG8u8+kPMNbHMuQ8Up
 vTwVeZ6YABrVkCis40g==
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

As per the hardware programming guide, MST_FIFO_CONSTANT_FILL must
always be programmed when operating in MST mode. Ensure the register
is configured accordingly.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c  |  2 ++
 drivers/gpu/drm/msm/dp/dp_panel.c | 12 ++++++++++++
 drivers/gpu/drm/msm/dp/dp_panel.h |  2 ++
 3 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index a7cd3c87cd7e3..249c818fe79c5 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -584,6 +584,8 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 	msm_dp_ctrl_config_misc1_misc0(ctrl, panel);
 
 	msm_dp_panel_timing_cfg(panel, ctrl->msm_dp_ctrl.wide_bus_en);
+
+	msm_dp_panel_mst_async_fifo(panel, ctrl->mst_mode);
 }
 
 /*
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index d3468b73fdc32..bc7bad5ca3b18 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -741,6 +741,18 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 	return 0;
 }
 
+void msm_dp_panel_mst_async_fifo(struct msm_dp_panel *msm_dp_panel, bool mst_en)
+{
+	struct msm_dp_panel_private *panel;
+
+	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
+
+	if (mst_en)
+		msm_dp_write_pn(panel, MMSS_DP_ASYNC_FIFO_CONFIG, 0x01);
+	else
+		msm_dp_write_pn(panel, MMSS_DP_ASYNC_FIFO_CONFIG, 0x00);
+}
+
 int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel,
 				 const struct drm_display_mode *adjusted_mode,
 				 u32 bpp)
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index dc046fec24fc7..04938b9d2091f 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -72,6 +72,8 @@ void msm_dp_panel_clear_dsc_dto(struct msm_dp_panel *msm_dp_panel);
 void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sdp *vsc_sdp);
 void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel);
 
+void msm_dp_panel_mst_async_fifo(struct msm_dp_panel *msm_dp_panel, bool mst_en);
+
 /**
  * is_link_rate_valid() - validates the link rate
  * @bw_code: link rate requested by the sink

-- 
2.43.0

