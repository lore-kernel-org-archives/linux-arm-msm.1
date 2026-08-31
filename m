Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA5B3F1ABB
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164416; cv=none; b=Ddn/BHWWcrfK4qWVmyJn8Jynxar76CDvT93sR3KV3lWiCJijIUPHV/B1LjDAw0SdafZPambdMDo6/UMVo+x8JpUA7xukXXiiZW+u4WnjYJKJsSfCHwmA3iVPrGGfB5/eFC0LJoZ/zMJYdaxr/8HhFlZc3KcSknFSmqk9J1YOvqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164416; c=relaxed/simple;
	bh=JnaNlH0Fbk6AgAHQMZ5A3xTfTA+9VjQZ/fVSomodQWI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CUkzYLMoVwsw0OYpGiJt1YSBSmzpWNRnQX+mWHPJxrKw+zDgxwLwyOyF3tDy07GSiRxpi52SJxs/VstZigV9eDFAVc+UBhS6eecdxYIXa8z8ADnnRhz68W22PKyo+gRlGXxiXr5MrpMj7QNhztZM1oFMjasTpJLGWEI0d+WhWhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pMzXF9Gm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZyGGeVSp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pMzXF9Gm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZyGGeVSp"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xjK62419580
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:20:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5meTGQRfLkmoxesHwymgB3zPNdHgZ1238p0DYKLFKD0=; b=pMzXF9GmyYoSImuZ
	cvr/mPl2X0wtsLq4P4Zm0RUXyVUA6hcXBiG/9d4w5A3aL68qiCqz5Ax1VLp0BzrK
	az+sYgF5cbvrPqrJNNI9T7BLRMzBQFXY7JFY88LVed8RTcT0wH09YKohw5mVUBGA
	H1K84PczBlEnr9SEj9FzCamMPnV9V5c18Bkr/kz9bh4rHFJINx4Sos/g8UfzYlPE
	goyg2EW9la1OisG5XO3RPzKtdB1VMzjSzx5TWqdjbV3q7wRLgnpX73bfHXtBqkHV
	Fr5qdwJOf6NJ2M4+ZRUMy2sbGiwj26VZxntK1fP6QaVGrUYoeI2QLYvm7NdTgt8v
	hPB0Lg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqt6nca6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:20:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939062ecda9so382526185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 01:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164413; x=1788769213; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5meTGQRfLkmoxesHwymgB3zPNdHgZ1238p0DYKLFKD0=;
        b=ZyGGeVSp4S8kicdKup4CRanNidu+Kt0RtDCjllLiNHVR/XQgD51C3nlWTFTRcck/4G
         iNXkXpGfWblBYi8JXcuzRYtbe+Ry0/u5CRg1n8lWVHq5Q+5MGzPdYsgRSKdAnzDlGKmS
         5sS8YbdKSquy9aRbPXXkvc0wws8/hpLjmkEke6qsrEqP/JsnAkNY3lyGF5KfA5CPdI7H
         uKs+3Pw6vgfAZ3Gv9untAP8n2+u/MCOW3+lvF/QGKP8eQBYkz+ejJ5/utKWURq/Fx7B+
         rd9A/0AizWPH0ia5pGLMriHSH6HKIJuopKEeRUfFWbREYNKtY06CLtFXVCLzh3ZnTxwE
         kujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164413; x=1788769213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5meTGQRfLkmoxesHwymgB3zPNdHgZ1238p0DYKLFKD0=;
        b=ZvTnFc9BL/oWDsh4cJIoDSajHNyDimvDSoJAXMZYFsTVY2vyJwQAGPLO/aiWXs5FYk
         GH705CHopb7hT6KCkuPPGNCMZ0CaLXzEtU7vFilcpiGy8NeE9ScveEyYVo/d8EO3rN0C
         TfAaPPLWgEfjqmK7DYjyLY3v2Qy0DrhodQkHzigmdGywz2NH+4lkcm6yWhsefbGhUGnF
         UlstL2yYhbsn9JrMazGJwf2Buk5lbX3ePCtRjx5XpIhDtvCQu0huLXf3p06nNGncY2RU
         2H4bhQj0bV4a1/BjxYCi3+iFuc/qkNjzpd/5wvbjQgZZ3YbqFHKHhmbzIQ1urxdlqqEN
         1sIg==
X-Gm-Message-State: AFuF++kLwoPR4bdiDwgHuNftLEClibE5TWJhUidQcfV96eVa/cQNOk1a
	q/vy2HKMNZhgvUKLYz6XkAzG/9QwIC7ZU/X7ndfwBZkEq7UNZ74+QpbdPdpeUftQPWIjFwmZoW6
	8X0v+Sj/oWs5PxCzSui1YFV+I5DZgv4vBVYP/vUf2RWYqp0ACNA/UmLwmJ9YWeeStlYM6
X-Gm-Gg: AR+sD11fjJSkyMKChNJUYiWGQ5AXJXin3hX75AbCslOPzBKBorAml/jRuPdlblHWOlD
	mB1V8ZrYHduTmYgEE6KH3If2ttHpuMfjD8D7oNAUUnOO6yCrw23n2wSCe14lQMCPdnut9MqX6d9
	NfdofYrAWIDe7RE69iPCmR3+1/s/JEf5VweaDJUoQKHycRMGOhPKlsXtCePJgqa9mg8PTmR5CG1
	g7AGpnuOI50qdKQpXgXsXeEOVd0uFLJu5zIE1GP50am6WGmPB1/AKGCT1c6/+BOzvqgsUugjklo
	Va+EUhdyn9TlbDai5Ym01JLFBGEuKXKGuYsntyAe1SlBqiAKBZBz9dcJmxs5iI+l7t08iNqHiYE
	yQB6QQS7B8SwLouOrK+5Osm0oaDQBckJStGyLSsc7xLOAoqeiu//DiDzN5nOicoM=
X-Received: by 2002:a05:620a:31a3:b0:939:70d:c454 with SMTP id af79cd13be357-93942b23847mr127710385a.23.1788164413103;
        Mon, 31 Aug 2026 01:20:13 -0700 (PDT)
X-Received: by 2002:a05:620a:31a3:b0:939:70d:c454 with SMTP id af79cd13be357-93942b23847mr127707385a.23.1788164412706;
        Mon, 31 Aug 2026 01:20:12 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:20:12 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:46 +0800
Subject: [PATCH v6 29/29] drm/msm/dp: mark the SST connector disconnected
 when MST is enabled
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-29-c91d35d6fb9e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=1197;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=JnaNlH0Fbk6AgAHQMZ5A3xTfTA+9VjQZ/fVSomodQWI=;
 b=J9YDz4tmwpF2ajXWoB2k267qD9qlr4g1jmtUrDs/9cH/UAmGr5x9l1EQFiVH5Qp/TWMttKC70
 8Ahed/E2IqQD2LAHoRSPDhQJmVpbtKnl+38TdGc0oachX+ye4FTkRtV
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: Id3Yc3vWuV3OQiKRRL0S5li1LwjLfca9
X-Proofpoint-GUID: Id3Yc3vWuV3OQiKRRL0S5li1LwjLfca9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfXx8n/CaFVBCtB
 27ZQg8yoE92B5DTKwWcFbkyR0QTT+dgGtSwKWWgvLl0v+SoMNDw5qqkLVJ5VGQNsaLRlNy85Izm
 3O74D/0qyDVWngNMzvrbbzvP/YfTnCB6m12Ja2uh/YpKtiGVHi7XG/V6KSNVgqDZ3wJRORcjYyc
 FHouV1mJF4yRHpK06ODTG0AdM3xpOE7TprXMb+l224G0rcGS8GQepsAcCfgu8IzekaqOr1q+3e/
 ap1YNDq1NAl2EAz9R7X/h6EcEW2ScgJbL+DulBI18OY+X7tAqUSYoTAtmSX2fQviLZLmJZ3O4Cf
 PZL6KNrhOwT8w4SIOE6EyB8mFWbPaINgRKfns1mylecWJZq5TgBnQKYMpB0xc50nz1L2PaGQ6rr
 mm9MaKqUwyF1VDe1nTHUrZ55CwEP1slw+m3IjxaA96v9VeBeYUSsYW2l575BIODeptQ39A8zJhA
 z+w4u6qmJs9LChthuSg==
X-Authority-Analysis: v=2.4 cv=S8/pBosP c=1 sm=1 tr=0 ts=6a95393d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VuhzylXr5gTqft-DN9kA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfXyjEWvelLsocQ
 9up7Jq2RPl5ExsSZVc3QCgXDwWxh9T+/lCir+vTP3MblRpBrx5cxfMbRSDreAUQmV9SkohHjxNx
 p8KWlnDF1fUzG9VW2AuyyNWNeHz9IAo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

When MST becomes active, the initial HPD plug notification updates the
SST connector state to connected.

However, the subsequent SST connector detect path reports disconnected
while MST is enabled. This connected -> disconnected transition is then
observed by the polling logic and may result in an unnecessary hotplug
event.

Set the SST connector state to disconnected immediately after MST is
initialized so that the detect path does not introduce a transient
state change.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d2b2c7141db0..d207ec3ca8bf 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -290,6 +290,10 @@ static void msm_dp_display_mst_enable(struct msm_dp_display_private *dp)
 	}
 
 	msm_dp->mst_active = true;
+
+	scoped_guard(mutex, &msm_dp->connector->dev->mode_config.mutex)
+		msm_dp->connector->status = connector_status_disconnected;
+
 	msm_dp_mst_display_set_mgr_state(msm_dp, true);
 }
 

-- 
2.43.0

