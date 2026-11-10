Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286497;
	b=wWzr8gjAwOAglqfpEuULqHExHIbLNJyqypNk6w351E2an0z3li8AdylnNx50f9eADqUe
	 58kvd3UFnP+gq/m0a99Ow4qHz2sBfrC0/+08f7E9DMISAqE+b9+fbAswoKjSj4TZ42cvR
	 +w7l/9A9J6mKlfdd84hXLDKl0Bxki9kItaZqJuQY2yj5RgYC4OkBudqv8TNguhsknpHlK
	 tf0gV4V6YbKB8HWgRJgGoJP2vO+bRmKKme4OjHss/i0EF6MjEBOQLAm5pjqJhS8AOfNjQ
	 RwszMFIQ9CVW1gjN7PQm8U8dImztSOtEv8Y9cc8Kd+SkFaw69fAdmT/Vxb8fmaYM5Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286497;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fYm7TimCwGGgjfZzxnOZ602ufC4cDb0WBqAEbjVY3Mo=;
	b=SPZg+5Qj3lp6sNAPl+dOl8EHMqS7Zf5WdSLw8bvEAPBOyimrmQuH0qeQJhsMnrE++Mx5
	 pJw/jmSql3aL+wC6roAuBjLyD2mzqzZMMQ5Qb4YzbsTWIzhf0M9q1y8tMuHJLyNmWCI1D
	 BflKXFSD0m9WVbX3cnWD8hkeG2mipif3ssOooOe1MOBLK9PHRBipwCuQuqjYU2YQIRiMt
	 auNmxWxYi0I34jYvKPnYLVaVEZRKCR44Us2/C7XVX1Dz+yloP3eWChxMcAydWWDvPrG4F
	 tZ5UDo5IBN4FEsLBHFBS3/b3ftEQL7Ooh+a69YUTcSIkLiH4n24JbVXwr3+8Civc9/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lxrxQEkW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hGoSvMuG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6AE606A337
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B6AE606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lxrxQEkW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hGoSvMuG
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A3fF2249912
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fYm7TimCwGGgjfZzxnOZ602ufC4cDb0WBqAEbjVY3Mo=; b=lxrxQEkWbMUEZwv5
	e83HHum9MCFcRA22E0fzc6ODfrNKZOSyIyHqSt84YYC29etob9IhfBNqED+Veuzv
	h+LpXik9ine2R1UdYO+VZnbzGxvLRPDt5btZaK4NO7Srs/K2IP68MNN6uyOPWeEm
	rNvrRD//e0ZBCzvSMYyKWZN35JbCSuVBaD8DJjzP7fRRa8GXc9VbBk2STC/YwhnB
	uPKfcz3K/DkamC2jyNZ5VHDNAKdkicXmvCNL0K/oKkUv5Fo791Upl86GHGqpkuLW
	ggHq24aX2Faw+888s6dPM/MPt5Df0j2WVBf1bVT6Md+94H2a8XBn7OJ+sy3phHmj
	zdlZUg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucapbpq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:54:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844cb60so324502385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 20:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286496; x=1794891296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fYm7TimCwGGgjfZzxnOZ602ufC4cDb0WBqAEbjVY3Mo=;
        b=hGoSvMuGquEVXeevy7Cn3kNCMhrFymYGcDcLIeWj5XTrkNjkcb/1wNTLwA7M3nxg4f
         ER2PTHiROsFxhncyzgOqQhvNbrPzf0LAXyr/L5lEUtkU+joXgE0ktfQ516D3K7AM/Wgx
         VD+AkbhHKrVZmY6ZlabmEN83zKYluDkA/26oezCJMdbFjw7wirjHl5c1/Xa3H+3CEdYC
         juGCeYODd0kf5sxWYnfU8taqRrJrmHntaBGBwJmXgD3Ltm7+1czLg92ksLcW4pa6Y+Im
         z2Qg9NJLQQOvejvEkr/ITtE53cTPbQ7nvRrGnDjsrpcazRveGR+uGIRlKuJPX+7SopNh
         /05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286496; x=1794891296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fYm7TimCwGGgjfZzxnOZ602ufC4cDb0WBqAEbjVY3Mo=;
        b=NVZuArSBrARHIRGDa4lYP2ToSQlql7vQnfzcTTu+zM+oDX9nM+B5PZSQu9LSS+JyTQ
         uyxAfuys+ljJAStzbkZUgS95N32PjlrTMpTIKWosWD7XDcGv32kUNG5efCAftwspyE4c
         xD4o+JI4lVDYt9aQZqKglegpEQeb1E2TEtX0mtlnK+ccPg0hzCGJDvMyY2ggUq7naq39
         Cd/qLKa0WlkwJeVV0yLEafV5JqAZVy4lwvYl7HGhJ9jInjOTcDGACsecErwCyiUs/I0w
         QvBHEK2R/yK+G7vsUVOriIZe4hev1sz/bc/d47qCvGNsj6hkDL+IRT+92VL6up4l+f3U
         viYA==
X-Gm-Message-State: APuU4Z+9+Z/sQwC0LpzKbjy68PdIc4prFLVjpdpATYHBhMwm+fsfmH3R
	5zII1u+47GqPkWQWrLuKext1o0bzxTX5um3Bdpe7s+ZdQchsFjouE0Az+BO6Xer3s7vGEo+eDFj
	uC5033wjhC84eaUQTAgZdbzfAHQKITXJdNHJU5Tv4Rq/TugbKjTgPkSobf0CGsUqIiNvh
X-Gm-Gg: AYBFou0Ht91iXOUiVBuYFf2KwvsYOZudpEXS2z2zwfmQyQmbzd0lAsnayHs2+7RtWZz
	ZOrw8B4GWWKm7GLPXpTCuR+xDU2zsCKr1xuVOUiAJrvCjh/qgBVOhTVa/b9441Xe/a/ZvyY+y4T
	WurX0/pTEc9afoZcj4oWqSxag4LtpxlkFzi12eqvTZlG66eI+o/uzkccxy5mxigBbP3FTEdFjrX
	L5X+55Uu4Bk9CAu8mvgnakKWaNMJ+XL5aZJIyee8lUHa2L8yMbVLD59gjZwVmx3L0IYfPTIgls0
	OzIIMK75s9gncnTVy1Yce9Wa0zvKn9JIGcYo1f6ngL0LBK1xZUSRYtvogB5oEKhhWNbDgtQZTdj
	aBMRgjjrQTq3wbgXJkiIaABhRS3GH+RAFmWd0NC7mk4ZgYnhrDDBgFk3HFAsWH88VRrhOPCbDmj
	4m1lHUs/yWron/qWj0r6mAkt7CKU5uWnq+nGck
X-Received: by 2002:a05:620a:8386:b0:939:2b7c:34d1 with SMTP id af79cd13be357-9479f465011mr241868585a.15.1794286495905;
        Mon, 09 Nov 2026 20:54:55 -0800 (PST)
X-Received: by 2002:a05:620a:8386:b0:939:2b7c:34d1 with SMTP id af79cd13be357-9479f465011mr241866085a.15.1794286495432;
        Mon, 09 Nov 2026 20:54:55 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:54:55 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:25 +0800
Subject: [PATCH v8 04/29] drm/msm/dp: no need to update tu calculation for
 mst
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
Message-Id: <20261110-msm-dp-mst-v8-4-d040fb33db5f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=1017;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=B9iC9f11P3UYhJG6GuGSgLAVw76YLRk1a4MmxuGI4sk=;
 b=psDEnqwU6EoGLJN91XM63kS7wCtg9ipDg0kiJSTV6L2ym7K+3qRBc7chEobbAYpAfiAmTLqH6
 fd/3dHbv3UZBNX/aGuCR+RPmOoRE5isNlIFkDQHGcko/lfMzJU58Qjb
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX/zNcqEnq4U2q
 aRd3Y6bPbVWGkgYfTrJkZ8oa+6T4oVD8YyMY54CV3hvGw/Ke/LnMHfdFydq2n6U+AESlIhMmpFQ
 jdpE3ywmc/HdVUd2KEOzOchsLq0/SRztTxcccChVfug/Ia3tZgoUr6+Vu0Zo7JPkjJZVz8+1+PR
 giuatPLgfXfiYjcyPAMouxgvIn1F6TAFo0iWrC2LtkjZ4pGCRD0m7PjuqeR8Bl3/1qhebMmXrZG
 0y+sxHPJyyyJR+tHwpNM3JmdoI/Ps5lWtI3NnEMwnJhpK05Mh/07f/vRRHi71fXbwEgXJndQYf1
 KehdbrcBdSTsl+jd0ywDGM/JphtNxnuLXcrejfjKIfA0g5WAAPSJGcobV87Pt9QH/9FwJeoz1Om
 yE4Ej+gYmhJSFhC0ukhdqjqvy3zrMQFQ8U4BNc/LhAO1ESVuzrs//nRL5ec0yTk18yMViQmwFgl
 626gLJUk7LjKs0YEK+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX7jxcgkIHac5t
 P+i/rCpxz3QLRuSFNdYbK3DKKVGzEfTb08kmsPajl7kHG+14yVfibOnm46zHFz7mLbJY/fLYup7
 y9x8mh6N5S3IN4TCff2FcuoN3etdqVs=
X-Proofpoint-ORIG-GUID: Lg4LwTR9vO--KvFLfP6sOnZaSx8eCS7t
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af2a3a0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Hn_uEZNTG89lqFF_qI8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Lg4LwTR9vO--KvFLfP6sOnZaSx8eCS7t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100019

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

DP stream is transmitted in transfer units only for SST
case, there is no need to calculate and program TU parameters
for MST case. Skip the TU programming for MST cases.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index b6ff3d8caa2b..a7cd3c87cd7e 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2712,7 +2712,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_panel_clear_dsc_dto(panel);
 
-	msm_dp_ctrl_setup_tr_unit(ctrl, panel);
+	if (!ctrl->mst_mode)
+		msm_dp_ctrl_setup_tr_unit(ctrl, panel);
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 

-- 
2.43.0

