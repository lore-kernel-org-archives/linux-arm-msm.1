Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B54C3EF0D3
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656043; cv=none; b=HKIvnwsGywgNpNbU6aKPwcGMk9d7VhTch8vO/PTtxgTRtUWIMNOX4VGlXzcXYFZOAfieFeMKu4vjA41nB7yLnSj49VTbc+M5YhoYttdPfMxEm5H6L6huVfn2TSOPtZK8UKrMnglxR117RD2NCrJkJEBSidTY9tJiN1wzGi0CmMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656043; c=relaxed/simple;
	bh=a3Bsk44vAuGWtuVevmFYIZgGPtZYUaHC56fmEPytYS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bfHwd1B7maCX9EgaPXHjuC4iEKP17ulzxwpr5JdD8p6iXe+I23tKcchAzS+9DbWX4VFQ1cylMggICO0fZuo4pzjTta1KEA33Fc37TL3XjwkGhQhsP1ScDHBMpcUsVCbisFQ5dTvJBJZ2XpTh+7nHAx/9FjkblHFNBZTEtDlJzTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QLbhmTcd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fo2/W+8M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QLbhmTcd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fo2/W+8M"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47Har2775004
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MG7hWOfh4QGMHVtzXUSFpYHK8rElTo1Z2L8fJrvwBMs=; b=QLbhmTcdmCaGgkKu
	iztbDsfU7hZOTc+wYD7K1HIQqNmoUvLNY1ULap3Gv/RbNGqQjRBAO2A5PsfnsWrt
	2Xh3oyPq6UqtN+3Ui3l3QdidMwYwm/rXRn45AQvfcRcr+P/Lx2NUJpwb1jJoC8ck
	H4702V6E3664+AesNWUPUu5G4NbYeIpHqwS6+vwQO4CuzjXs01HkrtkvkqRpUoW7
	nDAVmzpVryFaEu8ivx209kktB4IveA9GUwR7RBVDQrxE8ILzGrrI5SlS56fLK/3V
	E2DVN0deSBb0SdIuyOm1BQ+qHG/0383sVDxnAKEtvTo9W3vqn3r30V+77QAxHo3I
	/Blvvw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvw2248g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:27:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91454ecbd2fso61228756d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 21:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656040; x=1791260840; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MG7hWOfh4QGMHVtzXUSFpYHK8rElTo1Z2L8fJrvwBMs=;
        b=Fo2/W+8MGYHij1W+/kX2ygoVGWO/356VwOQROYaXPpHGLdXBLS1QdV8MTtJ7jlfzh+
         f7AoR7O48mFg9nH9HElryD1ko5lr/b/GVQP0Q7JLBSq07p3O13wCAlVeOnHwGHMGNUr7
         ycC+pwYFY1IfUsFuoSWzZn19QNLz//hmzAB+Iy0j0wJfTBt1W67qshe6eeXrYX6ncx1w
         fLHTisVNH5528eUch8cpNg795gSXwaDntTPUl06YtEOqiVnNRJ52LheXCLYkBp+3Bej4
         wpek+hmG5Nf4elohU+D4de4Bp1o3iYwD923gncgsTUxxcIveSqp18saEuhTAvn/eh17v
         zaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656040; x=1791260840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MG7hWOfh4QGMHVtzXUSFpYHK8rElTo1Z2L8fJrvwBMs=;
        b=mfjsA+p8ABbGyawX1yKjWKA3+jqe6bLwjFhScMQxPSNxBOUvpcmqsXStxd3rh/0M4Z
         xfMujEh0x/epw/CsfwF1EZp29zQKHdojlNOB8Xn73qhCs133PjSugZezXVatF8gSwQy6
         tPXreillo4Et9piKChTuA/16vgdEqJpgTrzJQ9saxLC2UFNG8ttyRZbe8+oNYpkOHnw+
         Cwo3S8OGTRvI38xRndcTPOJ8Vq4yUsK8Ou1WTHvL6Q7vJkrqaUqWVuCPflsukQikDNSZ
         eA1P/ZwwfKZKeCggCcPtUkYXk63GizKQ2DLMT5Kz2yeUGtMaKCFGvmT6Twvse8hdniWt
         M7zw==
X-Gm-Message-State: AFq9FYJzZiOQ3myWlNdew3K+k5AXouufUJhBrIy16T7Q/fcuoVrJB4ef
	aqSimmg+YNzmtQ3wV0tbcUHO/LSiP+IbmFxW1dCpvx31aqaeQyi+yhAq6IcK+6R3vmzWnVt2n/W
	me8dHdylmcFcj21Yc1C1MFvvZ80bgD7WOqkgYjMSeIPFDwxV8DKCW4x2qqAMoQOBXz6+2
X-Gm-Gg: AYBFou3qkeiLDKLw1KRR+y7xUq+W2vcWbr0RVM/e7C9mytt32Bo1SYrtIR9bA/oeyYF
	73LD0LkNsA99DGBFfQnvvRq1v3wAFCkrDlP6j1VAZURNGwhjiqGWBfEp2sY1588YjNWW0KWWO82
	jfU5XL6PyUm4tlGYKeqWkL3yFf+DVXRmhmfdj2fgO+4XO+y0me/k7Rxo+hYxH8i6kkhISa1EpI9
	9oQe1f+PnhPuelNgcTuEzwlwElvte0R8biXYaynbBcn/l5POZuKOpquy02Fg1fTI1HQPlDfCWkd
	UPDy7SiHAEn0ExtMrk0l83g/9aeTgngy/zcqSVPoE8EqlbHy2DQpwV0u49yUXPmx+0ZH5QZvFX5
	FUCU4VBzcEch1h8cRKKe+J+ZMJGXdCpF6M1W4EftPjAkztPuTUm1yOsLjPu8LQf8=
X-Received: by 2002:ad4:5aa9:0:b0:917:8c52:f52a with SMTP id 6a1803df08f44-9178c52f5d2mr6396956d6.34.1790656040535;
        Mon, 28 Sep 2026 21:27:20 -0700 (PDT)
X-Received: by 2002:ad4:5aa9:0:b0:917:8c52:f52a with SMTP id 6a1803df08f44-9178c52f5d2mr6396646d6.34.1790656040054;
        Mon, 28 Sep 2026 21:27:20 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:27:19 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:35 +0800
Subject: [PATCH v7 11/35] drm/msm/dp: always program MST_FIFO_CONSTANT_FILL
 for MST use cases
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-11-4b81473185e7@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=2539;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=mtZ1HCvBc/lbpNSY8CTLdvHlrW0O7SuiIwZF96PT1pI=;
 b=8BjdvXk6h/sGDH/HoBzjSHm8Nyp8E8d3ShDrhW8Z0VK6qNXbE/gCZvvIW/gvpJK2hj3sCQ4HA
 qBP1z+6216GAmpsK1+tZ64vLB8yX70o9OQUzu9UmUmgKi4azG1zZnpl
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=N6i8hG9B c=1 sm=1 tr=0 ts=6abb3e29 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=_o_Q1azn2oY438DeJ5EA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: xwGkd1x5XbDjlnaxzvtV373cQtSsxpQf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfXzAlccPWCmClK
 eWBQFpcVMbb4fwXP9ZwYkAr7DuYPej6swx8FJfmRuYUKg3Y47TssAyFZC/ffY5WT8tonNR2AwJn
 atJ9R8R0iEFNuaU5FzRX1Dl/GNnvEVygs3PhBlL8+S5YqDX4tdTUq3O7azuh9XTWEikr8ifS4u6
 6fHqmqBMcb7aaJucf1RRBt+OwzQNhbgIB5fH4qsBzmFVsjudcRv+HHW1pg00g4OxPwzreWlUNDv
 JkgBdOOdDjLyYGqgMbVHbCc7q8D6adUSQobChh3/574fVvbfrRziK4iW8uwmshcIeDGj7E8bR6c
 2ytH1rQWK1HK//zRWMiV/hrBLOreQeIg6pVhuCr9qk2Kuo+fah3flNTfwtv8qDabElmLNKLHS6n
 C9l1sWKxopTQInxT8GnB2C9F1GhNTJfTzacNLALd6J3BzbxeKIcrqagCmWYcjmpwwUBJ2FtAEDf
 4qFQhHI0i1+dqTciHBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX825yWLXndnH5
 DHRw0MWtd7A+Cj52pEvZnW2wH6z56Ujpoveb807JPOw2v+8JFwGWnpEtSYWoanFXUEhE3tbpwAL
 Bi5zgg2IvsJfxxxAyAC8qQabdJN7NgU=
X-Proofpoint-GUID: xwGkd1x5XbDjlnaxzvtV373cQtSsxpQf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017

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

