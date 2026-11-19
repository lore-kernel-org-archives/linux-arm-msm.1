Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076697;
	b=KnVuu/mUZgdPZtk1owDPPJ4GPciTfGXFTi17FKbHjvwF0fAllDZ0QerXpaOJbqRzCBXX
	 YSI3c+iP+mIT412yAm9n4Gav+OdCyhvkvRbwPfR+8KEocxejW9wkPmCfQmau7+K7vhjaZ
	 +dAIDztYhgKMuylfNaUK3WDkcqZbzdxczPfvN+sHaACvl4+8PdKj1J8P4vTFklwzWAP97
	 ZYU0Vv5AzXN1FQc3Jgd4irjM1KnpQxWNsIVbN8NBwLV84ZkSlpDCaLm/aMi9i5+Nwi6nc
	 cV40gMg0xaWlH82MeJn/LJ6u+9CXF7FwlYP4CAcOzVrihiJQXBrFqAaNW0jhcWLq1AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076697;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/op15N+dk/kFzQiPKrVNKKswtw3ovipu+xGcbt9hcwI=;
	b=Xytl/Osj3z8paqFD0uCfqv27Q0jZgDffy1E4M86PTLKaNrBLDOAChhImeDGC/mO7BPOc
	 FAAvYFksAjkFPXbhgRJEgtM5FMjG6hXkmtqwjzX36fSvmAVGYIgVPim3M2Wn6YfdMOuxc
	 MhIpNZZKZCsFd/OaDKs7A9+rWCi6m5maEpoMuusDjlj73aM3VKtGkue1A2ZS4TR6zEfBr
	 Idr7jSc1r1Sjp4xjVCVIK6ruPyO2YnVtLGnPJgLJWKJ3Ws3AP5lPNSBsfcsYiUIYEbEfZ
	 FNPJfUYTRvmparuhKmJNhqqfVWFQRMnFh4dNdw/c2i6zI6hNcYLtfBpFP3hyjOBaGCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Np6W6Unx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="jLW+X8/b";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE66606A33A
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AE66606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Np6W6Unx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jLW+X8/b
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6v3dd1962323
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/op15N+dk/kFzQiPKrVNKKswtw3ovipu+xGcbt9hcwI=; b=Np6W6Unx7oVmngR8
	nY+Vkve6gsZODrE/5nksVuERVDpZmsNlRv1oOXWWsRYmsMBnU0bgZRw2/SXdo87B
	IB8zks3HYSlvsPbgWYyF3xdYHdpEmrnD1Gnwc4Fqg1Z40a95H0PUzsto3vFVZSaN
	XqmgroHCIxw+xgs9g57ntCy7lObo1w6ZJdxOZ+Qc78hRCtChAmnEj1CXVxZ7o7Gr
	7kY+bI/iThsOohyVv6Ckw0HKus/3tOGTFFCv9n2QBX8J1aFGOLJ2Ly75y0BEwktq
	h+GZxIulWo+WsyLCsg5IR2erdCYw/TqbAi1DLZNVXKnONG5JexUPCxkb31Ihd/nL
	sYWS0A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1gxcu8nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:24:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f33438950so384392185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 00:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076696; x=1795681496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/op15N+dk/kFzQiPKrVNKKswtw3ovipu+xGcbt9hcwI=;
        b=jLW+X8/bgZnkP49heo/4hF4786JwiszWV31u6b61odZqHOthNWLXJGVj4jAzUeNW97
         NFC6QaMUeekTOTS7DUcZqSyFq+CLT6OaGnjFZt5VdfGKQGb8/hi3Uck7KphQNRKQXDp5
         sU2h+d0gm6bWA/RiTXMu6PG9T1NnVFhgmaqjsT25HXFa6LrrLkTqh80Vo5C+XDjuAhy6
         UfOAgqi+UumxkNtibXbnMqC877xg+bBSqSB03XdVjdmINg54rlR3MIRJYi5dVW3S5DRg
         2tQF8ylJUHmddjHHA7qG4mgbX5e2uByj95IEeSQCqHt47/L85RBBq1HwpeEhOkhPiqxm
         grNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076696; x=1795681496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/op15N+dk/kFzQiPKrVNKKswtw3ovipu+xGcbt9hcwI=;
        b=BMabssSBgSE0AjF+vSgoqdFaZXGOK029KhkOyTIAg33RIgiS/j9T2mj6vaHw6b1Kid
         c3YFaHRFjA1UozZwPdC+ztocflUqgPqjr0p5aF1+Wpnhn7QvRF2cnRQxkpTYooxjvsRF
         JSWEbp8ZGeWOHWuRsX0GHsQr2Uw2wk/C1OJ53UxBc/P8wfVxig0yleiuAe3WlcAC3VWG
         Vw35j2aecX1/2CSFjWBpK/ZPmq569vR76PJdqJ24sQ3zorUabzFj77tpC3RkSsMF2P9J
         CF8IqIj6kt5eK/+7d3iVjfeKaNN7d3QNFYXRJZefGrtLIosek0Y6hUZ8t2lpR12dqEcw
         OgMw==
X-Gm-Message-State: APuU4Z8el4nv38Es6VjYZgOgecTWG7kOPj/nA094AhPuILwbC80pmjEV
	YcqDa1wihA2GHwJ9FZQDlq/ma9Lg71Y6SspZCZY3uXx4MIbEDluPMZIoozTYiS4W28x+7XsShIh
	BZ3cDjMRFh6eC3zCOw2jNaZ4EVCcH0nmQnKhMmml1g8NRURR6iYNu81BpwXr3blyGaRu88JIcnr
	kGxaw=
X-Gm-Gg: AYBFou0YpuKqiGrMil4MMcTPggV5XKehGBXIP2+930RZm49xKkdRpwKzTzmhWLSCUEQ
	dFZWg6cbUFu9tFdNdFKhsMur8MuKFb/M0ZQImj06slerkDWZFW38QYKv7glHbDPpu8MckWswLUk
	apCKGimKkgjhtEtTHhrEf3RDdwKZO7YOdjnk2ft/rnbypv6vOCo2gfIXByp1C6NDyb4kbcXSwxV
	Dj6/M7y4cTdnbVPW1xnckolt+Sw2CVY9IgxOQ3a8mfPtbCpI0auP1xOSHoBguKAH1Q6HV6nL5cU
	v0LvjH2l8URA6IuhQrDatYiWg+C4iu6rYIiUWPzRnd4+Egal6QjnfPSz8gECevA1DupgRTD+FyZ
	OsxeWlXKW1x7BaiiPNNUk3nCBhH8MtSNRHNY4cOYfNVquOR7kQXwZ+BEmD6NYK1XkYPHnVbkQoF
	Po03uPERJuBouIC5JGqZcxJ5E/GPgUgsaU2+bV
X-Received: by 2002:a05:620a:7008:b0:949:326f:bd2b with SMTP id af79cd13be357-949995b5a7amr965124585a.43.1795076695726;
        Thu, 19 Nov 2026 00:24:55 -0800 (PST)
X-Received: by 2002:a05:620a:7008:b0:949:326f:bd2b with SMTP id af79cd13be357-949995b5a7amr965120885a.43.1795076695233;
        Thu, 19 Nov 2026 00:24:55 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:24:54 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:07 +0800
Subject: [PATCH v9 05/29] drm/msm/dp: always program MST_FIFO_CONSTANT_FILL
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
Message-Id: <20261119-msm-dp-mst-v9-5-ca61be4edfc3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=2543;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=MVPwEB6GiAIVVN89kkQvG4WB2TiaPNUUb+TMfZpXjic=;
 b=H4BxblsNZpj0t6p86OkaQw/cMiFN86vt41iSqzygdVcIGdXJZpWYFqoTsc+Uvp1VvGnioKTvf
 +5GIKAQ9BCMCOmy7mbBPGawtxlB5deWwLBtZLZzekhQfzlrxHo+smPq
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=LZapeTfi c=1 sm=1 tr=0 ts=6afeb258 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=_o_Q1azn2oY438DeJ5EA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: EB_PT1j6wE88u3fJv7Cob7hPnuQewdqu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfXwbV2mPHkhoh3
 /O6ZlNdPB3230P29FTIQ+LjpWQw7i0I+dL2o+iGQ7fa7HlCnGrCnTccqmWzzGi+BtSOqgS4KP9Y
 jQMYWknmQuoh82Iro01W0QOUor1t4sN6xUHxzbVAXMFFhH9zAh+/FE9cWocnm3FXx0+62R14EvL
 J+/X7+aUFizsIUeO/34Zdla9iJw1miY1Rq4pLuh/JFbg/d2KU6esCeT17nsEckNzq2cLaPMpS67
 8g0zelN7BCweOndOGA/USFlnHZ+NTMyrHNiUfIPx2i3iEZI0KpgmLTVwQsqTWBHP4tkV1LGUiDm
 ZdMDiojgB+t34WkLC4rykv2hg/s0JAMhrxKn+Z9G00O+1zSHtpdDG0fuLBr4I2/Uu9Iaewx6+JJ
 aTK6xMa9aEHIueb+yMafuLTtwPxhaHGZ+rerRl7A6iv5Wwyk0rAQqStY+IUXFXw642WbxhuQQtu
 Ye8U1YR9CzsQC2795Ow==
X-Proofpoint-GUID: EB_PT1j6wE88u3fJv7Cob7hPnuQewdqu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX0FyyIXIxsXzr
 OaMTS85095isKru51aI+eS4JUCAVXeUW8Ld5mgT2ueA0TJBd3dV4WD/Y1cWdQ+KJ8rQ9JdmLJaA
 WVnZCgg2T6gPNLV0QeBP+/eCYL8wyjI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033

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
index f3f97a800a738..a3aa946c24257 100644
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

