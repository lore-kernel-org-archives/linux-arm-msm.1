Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286532;
	b=JTlwlb7SjKWZ23SL7IB6lxbu8N1WsQFNAs58vSB7/0BJeo5qkoniRTX9zHbvikRGfBMQ
	 6dl5aNIQb36y+NbvlIFx4A+MHivi9bEmaBjva1UX4ke6IcXYTrd+4EUMmdfV2cHuYPU4t
	 7wlEqrKPB03+sRHGpAen2d5f6rgSShzzVaJaJBoZ2Nk60WwoYWm5bwNbCh9jM5fnJHWVS
	 f5uPKyBjgeP3E1RqJOXgxGE1NpOIX3WqX2C1QAzvBdWXX3KIKdkUijTcNuXB2F4biQi4W
	 YJNgVOQXAF3fjM9l0yqPXWthdJbSr0b5FZ0Z9wugd7GAEi5PtPaVBCHfVSCW6QsiQtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286532;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4znigap+a+C2TrdqAIG1LBvzWkm9M9ecXvpeFOsy1KQ=;
	b=FVF4AfgryhqnjY3/sxN93VMpGVRXztAB3RnogOHWHCnZziJeMxptiOOvNx4afxDxlyd+
	 zYs7zBgtPtMG1qkvjhPFL4CS/dJ+9iT75nicdPXnLnhcVd2kfMxNvDlqipqYlmDCcZZ37
	 KZW1yy1LLVFWMYQymda6zDQEk2qVWs9Cd+889ZTrNMD4SDlhZWfnLeiWOHHjTn575akRD
	 Oh5iwISwvH6LyG+xQvKE5z3CDh/di403NgqAc3XLNV9lSB0z53OLcPi64MRlQFKd92sxk
	 pTzaFUDmiivB8dVRjUaXbie3l3DWomWojhVDAs+Trjme/Xqhls3H1pPY4otcHA7axrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EUAPswNr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b0kj3J4L;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE64606A338
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CE64606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EUAPswNr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b0kj3J4L
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4ACfm1768228
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4znigap+a+C2TrdqAIG1LBvzWkm9M9ecXvpeFOsy1KQ=; b=EUAPswNrY/FqCzhk
	opTIYtUWnW/pSG4BsgZrfINQHYfFU3oVJa/6vAAJKnRJcJm9p+kA2RIzFiYUbIH0
	xgCP7uHbnVRDWZfI+9hUKGYz2E7ijUTVE2AI8l6JpJMcPXLr0gHyaVVfzFON3Mp3
	toNyCmEyMSnsyGGrEDXI5J9eO8EtLJmDYffr67KVfT9AQzDHQeWFNIW68d+V5sbB
	y9E/DmOV68EUgJWiElNWTzwFx1rNZcgWBznGOGmLTkSBhPScYk+KHztwopLFfALL
	cEgA/JebMAyOANS7tCxBk7Kql9QS1Mdy8RolZ+EQNdSZsJILt8nPd2MJF5FzXqYf
	Hz0vlA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huucp093q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:55:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f322ef7d3so382615185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 20:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286530; x=1794891330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4znigap+a+C2TrdqAIG1LBvzWkm9M9ecXvpeFOsy1KQ=;
        b=b0kj3J4L292lAwEI+e8hcNfIz9PHGd5YA+vbmqlyo66uolBdDhKQS08NKlZ0uSa5Sm
         6WBNek4W2+Pu1MbGPC952rI/lcgw9t7KS0fOzABil8DKIqzno28wB75pTehv+AI+9tDX
         sVeHf0xSoPYvdP/vLrp1eLLm95KuL0TpX0L2+SJlNHazv+YVwD6fynEdHDzlOJoVSqq/
         j5bnsFQ3KV4z0N88KUDlAZmmDKi1OK+oCRTV20B9U+HE3GgfbzAzQOol9WSmdqHRWeTm
         aG2yj3usLs2A/eUd/RXyOQoGYU/pldRw69XZlcTFbOMddDf5HOm9lE3Psd8jvskctUCb
         m8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286530; x=1794891330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4znigap+a+C2TrdqAIG1LBvzWkm9M9ecXvpeFOsy1KQ=;
        b=W20m2LLs/eNT9be8Zdkm7zWXKuAcsyWmPrPwjsq4RMqssz/cKl/DVovrMgx8HoK29Z
         ejQ3RmzU8SmKkQ8IIGR7JMLEn32O1Leh85QdHWo2jjq7938FSf+yxmy5x3GYjqMWyta8
         hEWf7K4ZPHaPAYm4j1/m1pSfWJ8GAfOWmqC7IyHN8k85t4mrJ+uXaqXLHbJzywulgW/6
         9F/H3nAg+0T52LHiMGtSGPpn+xU6YZfYz77CRHfyI5ayWX8wtxiOT8aB29HH33FEe8is
         /41JRfyTWNLlKAZLRSprWNUsybbRDsU+z8uIGfveeB1hnHehqWXmMuhnnXpUfW2VXBLD
         i/rQ==
X-Gm-Message-State: APuU4Z+RPj04V3+dO4swGRNuEBgUbAzsSX/nlDqgZGM7EMpUaPO8HKMS
	fJTiSpRXU4k9iJKIDGCDc9if4occuLG/JGtThntSH6Gri9HKvpkFFPtmBB7uCjaKQPWJORjXMXn
	CzB8ujtqmyKYrqA4yjAYdfKUn9z+yjItfXxoSXGDTP2Ju8WoSB4x5oENd0o/7LsGZdEJJ
X-Gm-Gg: AYBFou10E4ihNADXNTrYEldP/7/al+0cM6yT4dJuVZazjB/Ua/QYrGtXyCJIs9esEQC
	fJCGe0tmBNnUQnEQ5Vfmt9YEnmTAh6zH45gdX1z9Rgx0bNuoM1otvHULDW64efrw71Q7SzJDdFG
	nr6zYA1klIaDSs/kyJ2sGcpFbLIlludiArhB1HXyyJJKw1Q8g5xRFVpoBI1Z28nznBFmmb6vxKP
	H4HIzpLw6La0jyzDzl6NuGoL0gNcZngw8U0JNeLzYSeurk6ClFmEv8Qimtxw/DrAkBOeL7C2bBv
	kym0jHgNamb+7fR4AnrA5iU5S0W5OoCYTYI3SnHjKWl6p2wBlNxfu3goSTyQu+Z3zzT1W+p+Jzu
	9UchYjKyknPPRGZl4t8AUy7sbU4OOhUnA+3YSAh/8Uwa5OLNEEDwzBlbY0APRaj+1ylFGnZDd4t
	qXQ1CJBEbKHp2O7iqxYMJp620lMnqsCqj8PeYP
X-Received: by 2002:a05:620a:4043:b0:93e:96e0:25b8 with SMTP id af79cd13be357-9479f331a08mr288348285a.42.1794286530038;
        Mon, 09 Nov 2026 20:55:30 -0800 (PST)
X-Received: by 2002:a05:620a:4043:b0:93e:96e0:25b8 with SMTP id af79cd13be357-9479f331a08mr288346385a.42.1794286529569;
        Mon, 09 Nov 2026 20:55:29 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:55:29 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:32 +0800
Subject: [PATCH v8 11/29] drm/msm/dp: add msm_dp_display_get_panel() to
 initialize DP panel
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
Message-Id: <20261110-msm-dp-mst-v8-11-d040fb33db5f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=3825;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=WcSG5FkGjNalbzWcrp4rU22MtewjiNFIQT7LAviddgU=;
 b=CQW0ge4y7W+gi7bpjyGppXezH87gJkcqHHx9M0FOpkHwRrL7RGlbZ5+5TymeIRA+CGgKKE2wH
 soK+ryFdyTzBw0MHMtuFHfi4UxxrBB50vAGEgbUxdLTzHBSqGlKdkqZ
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: EKZdATdmu3pFXCPOng2zKTke7rKjfz_C
X-Authority-Analysis: v=2.4 cv=U4oHnuru c=1 sm=1 tr=0 ts=6af2a3c3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=kCKOgzAXqFYlHSlaV6AA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX073YsPOWKeX/
 oH4fSQDza9fN6MJuSyg7S4y79uA8Cnvn9kRo1v5QfPLGxvie5/3gRENDWNTKHTm08GRQaTAhQc/
 XaH3JAAH2N+Wl2dwYj4U/hJeFntnZp2XBh7Pf5ZoxNWP/7xeTuuhqR0sgq8JgC4btYpFaUOljR+
 Dma4V2LCubUifG7D61hOtIXdmWn0DUQwJ7aQNqUL2YiupStyOHXAIzFjZlan+wAlKRYz+hX52Rn
 hPG6fmi0kh0C8uwREzI0eReCA8M6ZevKWKWTFMSDMLrrTl0VvnnYOEvttmv2HDstK6aCutSbwc+
 nXbqWoeB0rMoK586MXzXge/CaQ0uMNqjyNedR86kL8mXfRNyeNW5h3RqSfWbvOMRB7zxCpza0Ov
 FuUJXIvSFlgxvMNthKBxnIw6iJEZXs4ICTRjENjOk+Vzh8n38izvGCva8Ejq3sHuznMza/IDC5J
 pw9ZRT+shT9q1DCdQMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX/xksfH4qEXE4
 KYWU7/Z/AP4eLlyXG+zvwsc8lFPcR5UOUDLl2opKfnMTZL/1TdUK8AdVFjmzNYr//bW5AyB5xBK
 mtD6Q58p4n/92fOJJF61xj8ShnAU1mE=
X-Proofpoint-GUID: EKZdATdmu3pFXCPOng2zKTke7rKjfz_C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100019

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add an API msm_dp_display_get_panel() to initialize and return a DP
panel to be used by DP MST module. Since some of the fields of
DP panel are private, dp_display module needs to initialize these
parts and return the panel back.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  9 +++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
 4 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 0b34db3bd5d2..06c370c5ea09 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -3126,6 +3126,15 @@ bool msm_dp_ctrl_stream_clks_on(struct msm_dp_ctrl *msm_dp_ctrl,
 	return ctrl->stream_clks_on[stream_id];
 }
 
+int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	struct msm_dp_ctrl_private *ctrl;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	return ctrl->num_pixel_clks;
+}
+
 struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
 			struct drm_dp_aux *aux,
 			struct phy *phy,
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 9478f127c6d3..8db5f714519d 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -61,6 +61,7 @@ void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
 bool msm_dp_ctrl_stream_clks_on(struct msm_dp_ctrl *dp_ctrl,
 				enum msm_dp_stream_id stream_id);
+int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *dp_ctrl);
 int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
 			     struct msm_dp_panel *panel);
 void msm_dp_ctrl_mst_timeslot_setup(struct msm_dp_ctrl *msm_dp_ctrl,
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6a522cc71a2a..fa027659a079 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -536,6 +536,33 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 	return rc;
 }
 
+struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display,
+					      enum msm_dp_stream_id stream_id)
+{
+	struct msm_dp_display_private *dp;
+	struct msm_dp_panel *dp_panel;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	if (stream_id >= msm_dp_ctrl_get_stream_cnt(dp->ctrl)) {
+		DRM_ERROR("invalid stream_id %d\n", stream_id);
+		return NULL;
+	}
+
+	dp_panel = msm_dp_panel_get(&dp->msm_dp_display.pdev->dev, dp->aux, dp->link,
+				    dp->link_base, dp->mst2link_base, dp->mst3link_base,
+				    dp->pixel_base[stream_id]);
+
+	if (IS_ERR(dp_panel)) {
+		DRM_ERROR("failed to initialize panel\n");
+		return NULL;
+	}
+
+	dp_panel->stream_id = stream_id;
+
+	return dp_panel;
+}
+
 static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
 {
 	msm_dp_audio_put(dp->audio);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index b0b7570cb16c..96be45c3dc92 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -59,4 +59,6 @@ int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
 int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display);
 void msm_dp_display_unprepare(struct msm_dp *dp);
 
+struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display,
+					      enum msm_dp_stream_id stream_id);
 #endif /* _DP_DISPLAY_H_ */

-- 
2.43.0

