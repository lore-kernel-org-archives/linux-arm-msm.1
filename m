Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076681;
	b=NMaXsbtV9Pc+WuLyf5FYExIfUb9KW/lSrTImJYdzmvK1YS8VHleXXLg+cBszLyvq59VV
	 J6L/b+pkDDukQhi0zTTNIMTJi7gCxrVtnWAJsDYaQQSNV7d/EUl/IdiSe8OtDFWrrtsiy
	 5ErMTj90PLyIdlUNZ17E2Owxrp33w9bbN1dQMOSQkorxyBYtHis/em9aLv1yqtK0S7mXe
	 jnq9WIdHe5tNcjVZu7MAYpmSfDluDZRm7kZnnv6wu7VI6ALJWXBVDsw4kOz0i7XMA0DzX
	 16lnGVNWBGzaxdhll0zTQxuc91DUh9R/6pL3uNafulMVD3Oc4uRpbOPx24sP5EcJKwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076681;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZH8g5O7xKZ8B/5uGCTIRgFSOntIBxLOYrFe+k+/F1Kg=;
	b=aH19OxE2z3yxCaMQmWJ2tPVqddY6d/EuRGkH26WljWjQzFaiN4+bypXTUW9by6oMxR73
	 9V1tOGMoq7O32Z83raLUHGPVPsKiA+LeRszL+LM0DSKIEA7Wv0VagwftD4Rakc3N3ufh1
	 umbmM6E9YikJh7zeqBHZRVSObJkXxFtmvYrMp6qZJOAH7d9tduhewFjjsN8qy8cke325P
	 jXDqrxmx8agekqiJ2Nhx1/CSuI6MaJocK+alvCLe9Jt7LUcf7nECZhmFL0JtRXyxVySwK
	 /MNhGKYhMsFLGC/JUsjhyLZXa+MsOJDaZfpm9sevK0SfXQwXRfvVNcpfOcaBQng20xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PQhDaIx3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b85vQg2M;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9CC606A330
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C9CC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PQhDaIx3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b85vQg2M
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6wGqj1534880
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZH8g5O7xKZ8B/5uGCTIRgFSOntIBxLOYrFe+k+/F1Kg=; b=PQhDaIx34f5igQzz
	fb/racrc4Kj1eUdohsR4x//9ypXftx+cPyuy3Q3O2Ov9rs1iERD7/+W+0kySR16n
	2NondoLpQq/n1PZIWt4GaM4Lqw5mBBzsxczIjIHjgVkQOavxFIBkNMogR4izdYfr
	AEd8uRsO7nYBZCMh7h+xigFdMIImxhh3bzm3sIKpBMnlKLjHvrT0/dBHqORwpjsp
	nfxxkpLZQ6q1ruDxlb4WSCfcPzCmqEjHyc8tvL6Hmt79lR/+1OeQ6tsBOkRkV78g
	I8je17vf0jl3LM/QsiIQo4hpVcACXj4a9wSv9JdSbjbLfmsTyzdP3tVPZIMHqp+f
	eVxa8w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dpcc5fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:24:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so519654285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 00:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076680; x=1795681480; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZH8g5O7xKZ8B/5uGCTIRgFSOntIBxLOYrFe+k+/F1Kg=;
        b=b85vQg2M4nQmlMi5eQHK7V/Mp4Fo8i7vn4XCjXTjtHywvV6g7LGMMVGRuGd+U5z9uw
         +Mub2pdlJPMsp/LnNejgNaC9nHYxStNsgRSxr109dFvWaTIt/smMmGe47XGrX7zhBgp0
         1MiHSEbA6q5hOsPBd7IMcmWXh0ulCoPqa/tO1ZoXKGKR3fHy+dfKN599cXkW/Vzmq9/o
         0v7G8Ex3tbVbMjiRqf2Uf5wlFTdZqL+WzYcInIi2SfbjQ0wvHm0G73ngLCH8j9PdmvBW
         PZfvhMfKRrx0tSWEy0FHMsNYRaUfAAdvjciViMXoHWfOXG3O98Ywin5DNh9k5h6qI0f6
         bdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076680; x=1795681480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZH8g5O7xKZ8B/5uGCTIRgFSOntIBxLOYrFe+k+/F1Kg=;
        b=Z9UXkS7F70QE95gwH3ki8vwd3VPBxZ9usSGAHbFMkd7EUEL2PZxY5leUEndonYJYFH
         uLfk0NhaI392re3Ni2k+hnuvy3VQVwIY/ZJjVlvCyCyjUHBcPoGbj254EDhka1XmnXNB
         YdC0X0iOPlM7ZZcHb21s82tIMiOYFemMxBpEJbhgXaAk4oH+ARrF0v5WVuQWyV3/8uXU
         E1oDpfL+CPbN5bOGG7aJk141+V7suaaYLkaNvb3J7yI6nSCcI0Dnl9/ex5cty/s1MglA
         TCFoq6H0PrDX/Z0QQBQPcE+D1BybXQVYXkvqmkAC5eLBncAjdj8K44RcCzjcAZTnMVsz
         EqSA==
X-Gm-Message-State: APuU4Z+ustrjnq8b0UBZemT6YeTXNGEi+cXEXD4l4j89mem01m+QiopB
	kXxW8SNKqbW2x6uxu5ZdrWsj9GyD3081k+2ksQyUNha+05l4wHm8OXPdP6QwIuFPLqqEQnUiekK
	9/UFsynz1GQ4Q0u5xVIyA//idbD7CViSps7Y1gR4qSC7W1Ma5avQGc/byvLkmsQsNqhCN
X-Gm-Gg: AYBFou3b2FqRRNzwdfq6qmtE3lylsL0kky8/pmh1W+80g2HsS+sPyL5iQO81XRc+JnB
	VY+CDvJqUHH7d5zQjNskM5xEI7CVLxblsm0TL25WCB6zaIZZeUApOl9xlMtnJmhlKe3t/EQHrZD
	CJcm9Vw3yATql7mM2RgUYnwU0wPz3ELxgRtTp78gHitD+mZ/7iNKiknW3ureX7rRS0c90qsnK9f
	yIZ0ZgQzWpj7HyzC6QrCcamBYimyIzILFCalZ41awIzpxg8hDNlR+mXTBE7/eWFqfH6k7U/A8zz
	mTREOBMlp8f6Gf918/qVFqtO9gih06t73dcfE20cJ8nEKvz9EIooXXqgh8cMrdmqVQ7Fb8fWiWX
	4LUCdJRrPHFs6v681g+sOHdJ1G2VQYzHi1wG+1fmEhV6DiadST6iEZ5GDCMn7t6yzyUS19MJ3hK
	iCbTRC3FMoglBCAD5cXQoWnHBZe5AwT2QJEIUs
X-Received: by 2002:a05:620a:199b:b0:93e:bcbf:4ad with SMTP id af79cd13be357-949995b3038mr899388985a.33.1795076679655;
        Thu, 19 Nov 2026 00:24:39 -0800 (PST)
X-Received: by 2002:a05:620a:199b:b0:93e:bcbf:4ad with SMTP id af79cd13be357-949995b3038mr899386085a.33.1795076679178;
        Thu, 19 Nov 2026 00:24:39 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:24:38 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:04 +0800
Subject: [PATCH v9 02/29] drm/msm/dp: add support to send ACT packets for
 MST
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
Message-Id: <20261119-msm-dp-mst-v9-2-ca61be4edfc3@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=7052;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=54CLADPkO1fN9/Xb9//dtv4gcTRKYDDXr98jRbYT/UY=;
 b=dvdCGqSL4JZFf/15f9H0YK8YhldT1R8jO1ne+Jsnl2+I+Hog3BfOeIlGhMPwGL2MpakJsBqIy
 p8kWVSJm661DekOtyK/HTwPPDSDlkBpNN1BSceuyVLawoFOGHYd34B1
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=YJ0KWhGx c=1 sm=1 tr=0 ts=6afeb248 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=F2S7ry5v5sxRTjZyeP4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX9/SvXC+GHjoa
 shbtJhEtJTWa7IxA9wNIj2tdrZqVwWR1+BkIVg6U/eZgJU+s3jo6hFMyf6p9l/+6y4pl1TpmQfz
 O2iMJGupwgTGDgYTUrmlYDW4YHdohCzSlaZUtkk+jGl0tjZqbEFtmarMffNDo8HODgNJOjNUDic
 v2TiLocVnq1MRFEOV5v2qeTi7X5JXx+tj4zxa5qWAnLLBdddDM3uM4KX7sdHVdNGnVZVdAHd6f6
 sV8ZiD/LmVvhedRyLyigCaxfh2EuCChVA6A+9Mji9oi+hZcbNBwVZhw5RlGb0dhf//lNRzZgC7Q
 58Fa9Ohgh8bAjyjgPQRPhCPzJISARx+Ko8llS87BswgfT07wwRcQECnwAH7ph59/enJj9bY6brm
 mb3Rmo227BjRv6ymYLc/96ZnZMP76ucnRhFg8zQlS9yP0cPJAgbRGb5WnMAP5FZB44V7qi5uOeV
 lDueQgIcexGmL1G0RQQ==
X-Proofpoint-ORIG-GUID: M7IVcwqZcG7_OEnhxjxnTYjbyz3DUqY0
X-Proofpoint-GUID: M7IVcwqZcG7_OEnhxjxnTYjbyz3DUqY0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfXznVoI/d04nyv
 TN9D+QLRYyuDIMgKnQPqW2kkjbfdofCyxi+Iydw1LStN0BmFs9T0KZXRAWYU13s0FbWMh9+lT7N
 j0mGNQII1lw3n1dKNmg+cpPOmfv/NGI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190033

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Whenever virtual channel slot allocation changes, the DP
source must send the action control trigger sequence to notify
the sink about the same. This would be applicable during the
start and stop of the pixel stream. Add the infrastructure
to be able to send ACT packets for the DP controller when
operating in MST mode.

Add REG_DP_MST_ACT, the ACT trigger register used by this sequence.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 50 +++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 +++-
 drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |  1 +
 5 files changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 32d4d5743eb36..1b4aaaca0ad99 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -142,6 +142,7 @@ struct msm_dp_ctrl_private {
 	bool core_clks_on;
 	bool link_clks_on;
 	bool stream_clks_on[DP_STREAM_MAX];
+	bool mst_mode;
 };
 
 static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
@@ -244,6 +245,37 @@ static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
 	return err;
 }
 
+int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
+			     struct msm_dp_panel *panel)
+{
+	struct msm_dp_ctrl_private *ctrl;
+	const struct drm_display_mode *mode;
+	u32 frame_time_ms;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	if (!ctrl->mst_mode)
+		return 0;
+
+	mode = &panel->msm_dp_mode.drm_mode;
+	frame_time_ms = DIV_ROUND_UP_ULL((u64)mode->htotal * mode->vtotal,
+					 mode->clock) + 1;
+
+	msm_dp_write_link(ctrl, REG_DP_MST_ACT, 0x1);
+	/* make sure ACT signal is performed */
+	wmb();
+
+	msleep(frame_time_ms);
+
+	/* Hardware clears this bit after sending 4 ACT headers */
+	if (msm_dp_read_link(ctrl, REG_DP_MST_ACT)) {
+		drm_dbg_dp(ctrl->drm_dev, "MST ACT trigger complete failed\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
@@ -2623,7 +2655,8 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
 	return ret;
 }
 
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel)
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel,
+			  bool mst_active)
 {
 	int ret = 0;
 	bool mainlink_ready = false;
@@ -2635,6 +2668,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
+	ctrl->mst_mode = mst_active;
+
 	pixel_rate = panel->msm_dp_mode.drm_mode.clock;
 
 	if (msm_dp_ctrl->wide_bus_en || panel->msm_dp_mode.out_fmt_is_yuv_420)
@@ -2666,15 +2701,23 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
+	ret = msm_dp_ctrl_mst_send_act(msm_dp_ctrl, panel);
+	if (ret)
+		goto err_pclk;
+
 	ret = msm_dp_ctrl_wait4video_ready(ctrl);
 	if (ret)
-		return ret;
+		goto err_pclk;
 
 	mainlink_ready = msm_dp_ctrl_mainlink_ready(ctrl);
 	drm_dbg_dp(ctrl->drm_dev,
 		"mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
 
 	return ret;
+
+err_pclk:
+	msm_dp_ctrl_off_pixel_clk(msm_dp_ctrl, panel->stream_id);
+	return ret;
 }
 
 void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl)
@@ -2703,6 +2746,8 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl, panel);
 
+	ctrl->mst_mode = false;
+
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
 	phy_power_off(phy);
@@ -2882,6 +2927,7 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 	ctrl->link_base = link_base;
 	ctrl->mst2link_base = mst2link_base;
 	ctrl->mst3link_base = mst3link_base;
+	ctrl->mst_mode = false;
 
 	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 80d9258501b49..41a69447001cd 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -18,7 +18,8 @@ struct phy;
 
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
 			struct msm_dp_panel *panel);
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel);
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel,
+			  bool mst_active);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
 				  struct msm_dp_panel *panel,
 				  bool force_link_train);
@@ -59,4 +60,6 @@ void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
 bool msm_dp_ctrl_stream_clks_on(struct msm_dp_ctrl *dp_ctrl,
 				enum msm_dp_stream_id stream_id);
+int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
+			     struct msm_dp_panel *panel);
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ed899fcc91891..4862d0b42f290 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -679,7 +679,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp,
 		return 0;
 	}
 
-	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, msm_dp_display->mst_active);
 	if (!rc)
 		msm_dp_display->power_on = true;
 
@@ -1525,6 +1525,7 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
 		return;
 
 	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
+	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl, msm_dp_display->panel);
 }
 
 static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 83117e7619f31..472429d092009 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -19,6 +19,7 @@ struct msm_dp {
 	struct drm_bridge *bridge;
 	bool audio_enabled;
 	bool power_on;
+	bool mst_active;
 	unsigned int connector_type;
 	bool is_edp;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 265da58e064cc..9263e61c794c8 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -330,6 +330,7 @@
 #define MMSS_DP1_SDP_CFG3			(0x000004e8)
 #define REG_DP_DP0_RG				(0x000004f8)
 #define REG_DP_DP1_RG				(0x000004fc)
+#define REG_DP_MST_ACT				(0x00000500)
 
 #define MMSS_DP_BIST_ENABLE			(0x00000000)
 #define DP_BIST_ENABLE_DPBIST_EN		(0x00000001)

-- 
2.43.0

