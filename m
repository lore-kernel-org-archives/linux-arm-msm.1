Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6FA3D25B2
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164315; cv=none; b=DLHvBGN7L56Mrc6ETGJncDFDA/1d4HwAGS0rRuykYkVl7hf1WMq67K+baaQ8ajEJaKZk7+Fby5yWplpHK+r+7Hz6UT7YH7ZBc0O20SAPy3iVJdutgSEBm52406Oe2xLwh/pFXQzMduD9gfRLyxCTcQGo1ULnsC0ULMYhU9YqZjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164315; c=relaxed/simple;
	bh=a3Bsk44vAuGWtuVevmFYIZgGPtZYUaHC56fmEPytYS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CBn7+5gliZGhC6TCK2YUoBg6i5iu7/vebf2uMkxJvqueqUSaDe8Y892x8lqfFPg1nrNF5NUq5AKVaSH6ohX23v/kPOhn3hleBPBr0TECROzxQg7uEmrq0O8wOsbHj3VbYD0PbHroQwEhz4rCJluRpTggRatDkuToj/1fnvmenEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fBZ7MiyA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b5FnS7IH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fBZ7MiyA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b5FnS7IH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xMVg2460317
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MG7hWOfh4QGMHVtzXUSFpYHK8rElTo1Z2L8fJrvwBMs=; b=fBZ7MiyA/wcyQEAH
	cLroINa44aiJ/v5s8hKlUPt8sp+WYUhB9dSe9KajSFDP/1WhPPGE3FoJCVXnqj6Z
	F2B/8O3Cnh1FzUC8tm0b3ysN76gaRbG8Z/JGnoK5Nd50wr1Dkh7ZbuF1BZhnZQ++
	QSR3jkPuDdPIq6QjCLCVVKdSEXxYq2IH8EixUEN8R0QjjPyEq60KQ3QzZfcsUviX
	O2Jle/Iap8q+EO/sMmEUbEy2kggSWoLMbVaM22GsTOMf5ZRsSBZr7UKM/kcHJlE2
	Dmvon3iOWiMjEkQlpa/WRoOg+ECBuADMmhlM5ZqlidTzLap3PsAUojDqLvkYCz9x
	6gmSIQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd556r72f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:18:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e8341cfb4so24942636d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 01:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164313; x=1788769113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MG7hWOfh4QGMHVtzXUSFpYHK8rElTo1Z2L8fJrvwBMs=;
        b=b5FnS7IHLKlW0hSl13RKHJxdJVapcWygDKgWQYdRR/zpscyFL36I9EsAXyLoEaLw1v
         vSB13D2fTQj7ZQit2ldArH/9abdCmCFReUp0wQ1EwAxSiPOs6D+/hMOUQ9ZUngFEqZZB
         USCSuuudGjdoZbNNas/83WEED4YccFtUN/zhDhMGej2JxxoArMMiJBJTAi+SMa4eOgSW
         2xk+u/mnLrmw5EQIFobBYjGGKfVlp2+/Bh7JVCMTJGdSTNMbXwGmu4lUaxLzbznGjPM+
         qnpPJ7oRjNxNJh/4lexcgSwP12nnTCOx35e0R4IAC8T9JnM4pn1T4D3OeqZNmWqShzYc
         FviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164313; x=1788769113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MG7hWOfh4QGMHVtzXUSFpYHK8rElTo1Z2L8fJrvwBMs=;
        b=i9QPTl7nCebPro6kh/xEyCFbNa/o4k3fhuifHz2sJf8pQNxwb4ZFFUSlFxOHinkR2C
         Agnuj5yACLGNrEBBZ6p9ztzvrOQYM2Yu7nrxvvgfZC0sxsWVN41mefHV4cYlQ3ARHdig
         oPgrUHp9BT+q1cI+UgzGu6JmNF0hGApja+8t3fdF9XnFM89/gr2liEU09yw+2nctk/z+
         S6Rn+8po67ySxquUQvWE1jazN6pqPPMItVDPgVIJH2WbQagX1pdGUC11DKrnAHMhYHJU
         pn8+JgGKIQXRSDV3iDlRt6dBZUZuGeCHKanskE7g646vA61EQaP/S7AQigWCpKudCEFG
         1NzA==
X-Gm-Message-State: AFuF++lknXFpLjMvL5TyOjT0I6WL4yPPkdSwj29snFQmuFrlDrNRqu+N
	fUF82mEuTKKjbwa1hRUDiZIcVYFFdl2uYmKybu3sIvYalC3O0WZ2Ynh5vqvfQYY9B5CGpYM+jYB
	e87k6nlOTjLjIeDYiwH+G5lTYkNnK55OZGpDwHPnA6Gwn39AMNzZ1GrTwvv0x4jVFkYf3
X-Gm-Gg: AR+sD10g1Qy1lVJSC1lBdDZD9BsS4XF8Yg+5YR7ehEifAYsOoPDg2J9cAb+5dHhv7cw
	4KicQoWB5BEsXIHrAuqIvD4hiEhSOUGqIi/QC6XEaUva3wgU/cThWSJb4hnZD9j7xqKmjQMKw9D
	hEfhXKB8/lwXzZwnZXGRZPq2aqbsXc6YyXkGkrLCaUfCQfSGIEEJz4Q5pv78OvmQAgyfwAbonVP
	QxTfdXWUqFJwEOo4vMzD0pwzwEzqDs+AHHi/QftlKdXsRj2rJ3z7i26XhdkEUlfudaXixG53Gfk
	O2ddMt7qNoR2DwsUtzHmB/zLnpI2hdrCUkIDSu5NtbulFRZeeDf+ct2j/fCfLPnG4AaUzNy/45V
	QycGvqkyZ1L8HyTPkD1mpQu3PCp00vwrU5TROrNq8kL7khwxqAWnqImUHy6v3kFY=
X-Received: by 2002:a05:620a:2308:20b0:932:df7e:b31d with SMTP id af79cd13be357-939137d104fmr2188033285a.12.1788164312660;
        Mon, 31 Aug 2026 01:18:32 -0700 (PDT)
X-Received: by 2002:a05:620a:2308:20b0:932:df7e:b31d with SMTP id af79cd13be357-939137d104fmr2188029585a.12.1788164312069;
        Mon, 31 Aug 2026 01:18:32 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:18:31 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:28 +0800
Subject: [PATCH v6 11/29] drm/msm/dp: always program MST_FIFO_CONSTANT_FILL
 for MST use cases
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-11-c91d35d6fb9e@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=2539;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=mtZ1HCvBc/lbpNSY8CTLdvHlrW0O7SuiIwZF96PT1pI=;
 b=STO9GwinFhcQSFq0MNtOu3KI0vWHHsIUt8A6GJA77uEm9psDlpyVubXkRIn8eJJRV4AXy9qsO
 N1ponTqrGlKCr5PxDrTcgo4WEZlcrnwjV0nY/Jl41/oCdspYwXbBZWF
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX/6TU1ATpRE9n
 lHpIrSkV3gYsTeuKGL8JO0MSKbyZe4qAr5vQlXNXM+kPGp3GOTTwUsqvMGUKXMc2r2pA6jaVMO7
 sU5imOw4SKrxLFtO545WZt+BQrajlbQ=
X-Authority-Analysis: v=2.4 cv=O7sJeh9W c=1 sm=1 tr=0 ts=6a9538d9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=_o_Q1azn2oY438DeJ5EA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: bCe1QPogJJxn5xZcCl6ELQIKpJOG8c3M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX/DBbZvJaOZPx
 A9btgu/rGKK8c2RkFojst2+4p7M4zdKUrfQ37E4NTT0rE0fh40rbK2+pVO65VoYhkpswDf8ZDme
 wOaAOPCxjNhmTFiXeGCaekkpToO1VnP/YOaZIuhsrUnRbeHMZPg6c3dLizNlsOqdf4iGWLKcrf6
 f7nhNuk0ga04n9eaBIFezw+712q0J++NQRifg/aUz0scmGoOgMHHXnixyNt65X4uSs8RSlRP7lp
 NmlLofEIsloFoVavDCbsHUrblZxOT5+mwcz5Vy7VwC/NzCwhlb3glVaM4B3Pg6Uew4YFOUcsVN0
 PtSgvMoiTtpnQe35aO2OuC5j7AT3/AuYYo3w6Gjh00pDq0nWydUieWRtyHwBhFyHNFlOM805vbr
 SKXGV8yaTyVbPRoKaTBJ8K+LN0kuS+2UTmfdfhpRE82PgpxaOp4Z2NiEuXgrvLixFawniIr2u4y
 ZHTTWymFRbViDpU+SMA==
X-Proofpoint-GUID: bCe1QPogJJxn5xZcCl6ELQIKpJOG8c3M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

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
index 77506e840883..9a0c9737e6d0 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -584,6 +584,8 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 	msm_dp_ctrl_config_misc1_misc0(ctrl, panel);
 
 	msm_dp_panel_timing_cfg(panel, ctrl->msm_dp_ctrl.wide_bus_en);
+
+	msm_dp_panel_mst_async_fifo(panel, ctrl->mst_active);
 }
 
 /*
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index d3468b73fdc3..bc7bad5ca3b1 100644
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
index dc046fec24fc..04938b9d2091 100644
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

