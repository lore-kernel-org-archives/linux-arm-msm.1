Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076806;
	b=Wrga5AqUtlQc+uDH91ydHhpluohjcPpkf2UZVfJPuKhWROycU0xQ3G6gtN1g6wHvW/S/
	 AyUlNCQCqaoRSJSUnNnIS2jlED4vnksSRXQ40tuilz9yqF0wAIecgl+dJ6F7UT6Ij7CWN
	 7eAaQ7TG+3PueSGoYIF/6ii55XmRBCwYdT3Fg4fwH8cr91XjqHySaX/tMzZDnMnqfsJ5M
	 VHIAqeAC69bTb8Ao5s4Z0IMKKXhrDkiI9ZYfCxY9iybWHcbmE1QV0gc97cLjxNzogmgC9
	 z23x+G/OZbPHSqjmFJ4OfGI8Jf6Yb05p+/R8am4TTYz7l3Ir+a+plQL5aK5e3oggyqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076806;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=F8GWse/FZkpHqoIzSRRy90QZ23uRt1u/gc+qU2cET1c=;
	b=MwkHdqFH/vbNOhPOu8vc0k78P1+Dzw5mzgvUcmm6kHZX+0WCF8NQvve5D3gidHfSW4hW
	 zzRDyuXrHNBu95aH+upRnuk1BpDCg3cj01GzkQ3Hihj2inseDseJYFAsp6Vn+tl5SwNaw
	 4u0lzbrBTNSMIAassIQdNrDvdakAwdgzg2xpEEuNEe2bkEgauL3xMvRHssKUVPq3iqieN
	 6hKbdFMNcrCXFfm7XLEMT5ikipe/YHm7OXjKSFog5SYBYN0TquYGiBhF9k+aLjAc1acLy
	 B2dQQuaVukeNZ3aJRQs3DcGCGq6xJb3kEyfixmKXNA2hNeR9FKs245E4nbMu0YfK/7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FWiV+r3R;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XgBKVTo0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAF3606A330
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAAF3606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FWiV+r3R;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XgBKVTo0
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vWaw330673
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F8GWse/FZkpHqoIzSRRy90QZ23uRt1u/gc+qU2cET1c=; b=FWiV+r3RZtlNKwfT
	1py8YOPAZSkDTk9EwoP6seWbhh9wci4VXLG+Yhql4WMFWgYCqW1RPcs2+/4hkpQE
	0iLmOgP3PMplG1FkwGSRW2GqoHtk5mBAjFHjJ+VUE+CEP2Ez1Vib+yLlrjApeX77
	KLtXo5BeOGbrkyXkhaZkaoP/yWrFPVm/dLvGOUGCiSsmZu3PSm32og8V3u+Erf/o
	9zh7at3qP2y/UJyn0y9TknF4+nTqvy0mbDJIDzSUYvMdbEfd8lNXLORVl2CKeIwz
	ZdUw1/Q9p9ESZUldTslRRf0Lpg6V4P0P5CFd4c0EG0R9l5czLVKe6+GamPLiR1jm
	6vQQAA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fpnkgp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:26:44 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c046843f1so4175466d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 00:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076804; x=1795681604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8GWse/FZkpHqoIzSRRy90QZ23uRt1u/gc+qU2cET1c=;
        b=XgBKVTo0E/d85n5nMEcW0Tg21wqoL44fu2Ve02YbNeQigm4JLzuVoBCLM/V31CWSzp
         ib2N5M+CkbasJ8dtGS51zc8CUsyEqV1VXTJ6Zx0shPqW/hkxlgZzWnA2tjwKZltgQEqH
         OL42tX4gh/CarIQMbwevHSZ5Do0QKywk8/xVLbumgBtt0/1Kx1atnzIiwXE1TYWv3Q+9
         DKNT6X7d2FyyVL0od9n6cXQxPHu7ninb/U9I9JCq8o9i9AcTx2O9dobV2KAS3V5T8GuD
         QHuxYbIYw/reTCcKdvrzNXpsLQpRqG9bx3l4RumHsaApvFGNkPRuO+fF4Fj1jCga/bdG
         AMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076804; x=1795681604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F8GWse/FZkpHqoIzSRRy90QZ23uRt1u/gc+qU2cET1c=;
        b=iZ9Bm6wTD7xImnoyG3eCeE2IdMsHQxeOj9Nlc+XZm32ehJ/bSzXwAEnMbsfHQsNKMl
         EWHTBIHr0zmgC0gOoLakVYxJWTamuPCjDXgA1Kjx3tEasWlviaJ4oM8znpLMM0PK0x3i
         XWjoztniGWNZhrQW0sOECqNtR9b4Xd5lGDHLByCSkla9a/BDF52mirBJaxTmja+Ts+oq
         iNvLxL0czuZlBGWoAOLrtZNKdl4uqNlHeukB+dPawG3gdjjdJzjaTJa5dfvH3m+QyJGq
         MGhgkERY8MLqlEKNu3pE2ZfuG93nJnM1RyJEbg68UV/fLegBOmYTAAj2b1SV1MkbwbFX
         qo9Q==
X-Gm-Message-State: APuU4Z8uTu4xSkcQMzpepmdjakjtX0+3j9coPJmgM2Yvd7DrnJlucCDl
	18L5Pj/KjtPhgGbmN+Kn34nGm/rvNGWKIpLw3xpdoQPQ5zPCludWxK20/UkfsDMuGlufYSAFpk6
	RkAbEQJcTXErN9ufYm6W7JDfdCzjnEsNOGAx49DiNdbbfwzSVc36e3yOUYU6GSV00J9Vb
X-Gm-Gg: AYBFou2FwnNkkaiux8NDuSewVeQ+tg1Yv8H7ikUjOOebqPtnnlGAhCsc2J8aiAT6jEU
	9n/+Pn9VHSeNXP+qoRL211YLYFjtu+fJVVAp8Cpmeco6x5Kdr7KkUO5DllLc4v+bs56W3gEd5Da
	mj/85YScRyjMrrpPDfs65iU0NyPtwuE489mi31JW09uBNiEfWcn1bwg71G/yuTlEuc32n+vrbuv
	6woc7h2vqrlGmYeBhqAdHfroc24QySEtY4cckbNH9BrNlx31TWgVDEYi2mYMsM74QhZbCbQOZb3
	RXbfQ8bYNTrl9+d4R6PBNzxKPrLiiLoesIUWnwN3VHamZfyByOgPESyK23xErI9d12mCpzQ2efl
	0/aoARWhBbsh5mtdhg7QD04398m5+ia57aWFV5aFlhb8ltqd82Ot8O0Npc6tM4NobOE8Nbgyyig
	HgPscggI7KfZVGdaB3P0YGr8LnCwI8j6xAkPNv
X-Received: by 2002:a05:620a:1d0e:b0:93f:34c9:9248 with SMTP id af79cd13be357-9499971d885mr862086185a.22.1795076803851;
        Thu, 19 Nov 2026 00:26:43 -0800 (PST)
X-Received: by 2002:a05:620a:1d0e:b0:93f:34c9:9248 with SMTP id af79cd13be357-9499971d885mr862083585a.22.1795076803407;
        Thu, 19 Nov 2026 00:26:43 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:26:43 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:28 +0800
Subject: [PATCH v9 26/29] drm/msm/dp: wake threaded handler for HPD IRQs
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
Message-Id: <20261119-msm-dp-mst-v9-26-ca61be4edfc3@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=3017;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=1XWb8mR9FYw/3EXAUOxkw/H8bP728zpMqkwMJ+1kf7E=;
 b=5Le6Ow7xDjp7G1d+34n2dhDxOimAVUJpPTRb+B7nB643hXwWmX1xNESzkxoim+Af4c/zSgvct
 O27nfarjCEMCTfn5Y2SI9LsyEWTBTnrKBPfNUtkUhN90d0gNTgbDjgE
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: wNgNgCVuovHtDAcpPVL6SggcTbHe4xtp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX3idfx5e4g4oP
 4vdCUiMWLl+L3aEZV8dlDSuQ8Ji8d1BYdWz4sMwJ54eguMXsjaQ1NZ88o6g7cnjDZQgDXqvGfAQ
 IYrmc5tB99dx+SFvo44zHFQR3joP9mO1mu1R7mxAjT2UH8rzN/i2jdDfgPcMRcgKR5jL4orxugV
 klq62cXpn06oQ1DzVMpLx1ozPhLXrw6R8p7GfPqnIGL0yEKcuA4Xa3LhacQAZh7QCAliWirMAA3
 fZFnQ8eLqCFY0VKSvcx43z8jelqz1W69AxqssIw99kML+6oKK/8ug216BPg1Bp4i9DTT2ULcCpU
 EPM4faerJ5vI3o2SZA8QrLbyMmXSezbrj/U5xs0H+LQXGYJITPqIlft33ZxYD+sLus9XxBziBET
 gY3AYCjZ5Ot7jiZQTPGn32x7K+608VnGcq8hsrZMc7QEudO1ersQx2yaWEZ7bbquZcTCipEA1Hn
 BcakBUFFmyvogXPWMjQ==
X-Proofpoint-ORIG-GUID: wNgNgCVuovHtDAcpPVL6SggcTbHe4xtp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX3bSaZg3l8TIw
 Gym+ze9/pTzLbwZxFKIExPfynM3nJDCDZBFB0cptbB0Ih7s4WGpGPUW2v3XOiQ1wgL0LLpK4Mj3
 Slwud2302P05PHOnY8njnmUB9C0nAMM=
X-Authority-Analysis: v=2.4 cv=PJ6aavqC c=1 sm=1 tr=0 ts=6afeb2c4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rr3H4PImTD0NAioKu5AA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190033

The primary IRQ handler latches HPD status for the threaded handler
before servicing DP controller interrupts.

When an HPD interrupt was pending, the handler set its return value to
IRQ_WAKE_THREAD and then ORed it with msm_dp_ctrl_isr()'s return value.
If the controller ISR returned IRQ_HANDLED, the primary handler returned
IRQ_HANDLED | IRQ_WAKE_THREAD instead.

The IRQ core wakes an action's thread only when its primary handler
returns IRQ_WAKE_THREAD exactly. In that case, the HPD status was latched
for the threaded handler, but the handler itself was not woken.

Return IRQ_WAKE_THREAD directly whenever an unmasked HPD interrupt is
pending, after servicing controller interrupts in hardirq context, while
retaining the existing IRQ_HANDLED fallback for non-HPD interrupts.

Also report STATUS2 interrupts as handled. msm_dp_ctrl_get_interrupt()
acknowledges every pending STATUS2 source, including sources that need no
additional action, so they must not be reported as IRQ_NONE.

Fixes: 5043357e75ba ("drm/msm/dp: rework HPD handling")
Cc: stable@vger.kernel.org # v7.2+
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 3 +++
 drivers/gpu/drm/msm/dp/dp_display.c | 7 ++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 8012c3d47711..bf3f1b35abdd 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -3021,6 +3021,9 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
 	}
 
 	isr = msm_dp_ctrl_get_interrupt(ctrl);
+	/* All status2 sources are ACKed by msm_dp_ctrl_get_interrupt(). */
+	if (isr & DP_INTERRUPT_STATUS2)
+		ret = IRQ_HANDLED;
 
 	if (isr & DP_CTRL_INTR_READY_FOR_VIDEO) {
 		drm_dbg_dp(ctrl->drm_dev, "dp_video_ready\n");
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6f1f9dd3660d..ad8c30a8ea79 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1091,23 +1091,24 @@ static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 	u32 hpd_isr_status;
 	unsigned long flags;
 	irqreturn_t ret = IRQ_HANDLED;
+	bool hpd_irq_pending;
 
 	hpd_isr_status = msm_dp_aux_get_hpd_intr_status(dp->aux);
+	hpd_irq_pending = hpd_isr_status & DP_DP_HPD_INT_MASK;
 
-	if (hpd_isr_status & 0x0F) {
+	if (hpd_irq_pending) {
 		drm_dbg_dp(dp->drm_dev, "type=%d isr=0x%x\n",
 			dp->msm_dp_display.connector_type, hpd_isr_status);
 
 		spin_lock_irqsave(&dp->irq_thread_lock, flags);
 		dp->hpd_isr_status |= hpd_isr_status;
-		ret = IRQ_WAKE_THREAD;
 		spin_unlock_irqrestore(&dp->irq_thread_lock, flags);
 	}
 
 	/* DP controller isr */
 	ret |= msm_dp_ctrl_isr(dp->ctrl, dp->panel);
 
-	return ret;
+	return hpd_irq_pending ? IRQ_WAKE_THREAD : ret;
 }
 
 static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)

-- 
2.43.0

