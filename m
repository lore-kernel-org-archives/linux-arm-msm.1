Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A603FA5E9
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656149; cv=none; b=Np8C1QfUuVNPjuxAzzqPkt+DOysn7Z500CaQYQ3Qo4ERpGIBH8ydlpDOiKCPx6frnRFTy7Q4e9LX5zS2Ka7L1/whCtZ2kt+Y7rb0ptxGzt/5qooKAWGcFwhkUWzj2+OAfAEUjrVF+CoMvb2UK7UPMQnxTdAm1RGGi37wwgimPRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656149; c=relaxed/simple;
	bh=5HoDkLOV8SkieCOs56wkyW3/fJOyikG28UiNJ6xOq3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iklvfL00c9RPTuD4hnCVPgx4Jc+sk3PIP6y1AHeZ5sP9Pl0Jl0PFFBAftQTJVNUE3II5tXLZF7qKLUUbc+8TnnqnL0s81C+EBpRNzazwgzhTmPOiCyWOgGI28Dzk7ka2T+wMlL1Ssu7tagIwRkVaGyCNpgFth75kTALtXdL26/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JU+EqN1c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EwsK3xNU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JU+EqN1c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EwsK3xNU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47QS72991001
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fvTWaqBB1PUL3a3elu81DZH8VrrhsuqglzEs765KJ4c=; b=JU+EqN1c9XfY0r1J
	1juZ6nVgiqH6ImcN/KyX0Qw3+zDg7CrmVGwn5cxevs5mst8XbuTapmhpQ6Kd0MwK
	gbd9MSeWOn5lhCZ4PrsmuKsAoDCm/v6OwBx0BlvTBtRvJMpaqBF/S5wId2oQvZLv
	sQs1adNIQ95GsMMGUGTx4ZQrXJK51NOjzmwuF+7DPqDKiuQUxHwDO54pCsvQAz0O
	KuhrecpFicepW+3umeLNNSGPYn8kdtxJyIPYMqea3aNxb6eDZ2XA3rVxfF5Jsk7R
	yceZfaDOUL0kbQ/wnVC64aSmgfsgJVEMmoCi8APEM3uLT5toS2GJF7FnpmsSn10x
	mZKiBA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvwna40t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:29:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9143cb073b9so68854306d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 21:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656146; x=1791260946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvTWaqBB1PUL3a3elu81DZH8VrrhsuqglzEs765KJ4c=;
        b=EwsK3xNUQZF8ofXvPiqb2QNJxALK8lvmIcpMOBKR+ifL1XZAhRKOmdf/fzFnaj19mW
         Zj1X6gVJzvBWfHkI/MkGaDQisR5wuP90t1lEURNNVDaSd31PWnhe929FeoxqoI1Ycu2x
         P0gQRzEvRBNjjT9DGnbIeOUMbl0F1N/CcrQGVJBU2RmBmHs25BomvwRRMf96fl9SaB3k
         0ATa+MK+69VdEgKk6KNlmdJBZ+rKGsKZXJOiPlgNtJ3ibJQRYHNkKOmVQuVLcj/iSCcr
         KgAjo64xmxYvpIJNU6vL4H/obKjVtDUsO8QIlp9bZBj5Aw13kkEWEcj8aamUJ6uYq7aA
         UiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656146; x=1791260946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fvTWaqBB1PUL3a3elu81DZH8VrrhsuqglzEs765KJ4c=;
        b=OxniDfIzgD9Y4NCPnOytpzGl67J9qgM38nuBusRa4SC/V3NIf7Jrgu7kPGRSuqC6kQ
         RKP2+p5zEcCPX6rkaqT3RA/jujnqKyLWC3JANlVqL+oC2sw++yMI+R2r7wZhAVqDu/72
         JCe83Jh0pcCn5IDKzTvhbnbg8vuk/tt5f5SKTkeMTlXxbRTsketeOiCTtNqY0cMvgDPk
         gLkRHMVZJ+k8a8nXxb4kzsseTE/fcfYzH7RS0b+Ib07rACiwJUuBDelMF1SeWrVrdmS6
         M8QaUN4R7FU2TXPR+p5rJcBEetpe4wxVL0Lcqwo9yxcMIxa4XAoOq/qHKO8SL+Gs+D2j
         6l5A==
X-Gm-Message-State: AFuF++lkR671qUeR/kNV0EE/eI/Yx89CjpsA9aRtSQMMSOmo9jCQIV2y
	TX7xqoskdLrX0CAnlpMr5dwugYB5rJe/DE0kBdFDxXADHcrYrqAjm2hH5bl8gmbto1ccuw6gflS
	TyPLrFbVhFJN2MeY2T7Zhoa0ryDIm6vKqiibvsIQPe3i2yHfIcUa9IBqqIi0fg4Deb285
X-Gm-Gg: AYBFou0YbWjh1hHQ5HzHuvO2bJC6NeGJsttH774hkRxlaq4vyPb8rAmZ28/OoBe6LOQ
	hxmszmxmapzYs09WK5w/HwyXhLDBPa6lbZeh0Fh2EJ7KQY0EsraPRBMp/Gr3AA2PKZIU0T9PB8S
	3b9lJPwf8EDmz1ooDPFnLeV42xeKK8dl21q+Xd1pQZmt/HgQwqXGerGI7MLTEPHok0jabsWIRFY
	SMU4S008yAOmJ6oCnV06JmIwA1xdNEtc3/DMAlLsyKVYof+ChvLE18/+66Q3/iN9+YklNsrLRA9
	7rOBZpzZktPEKKpcVvjcbSrka437YIIa+KwOWweGcqCY6QBPL+5JUS24+wbRMuWiIKx2wm3Hlux
	jzx7o0hai+AaVXeyH97iqoKKQeZEhE7Nze6Dklmh5aaWcikUiDSkrJ3LF8MobOD0=
X-Received: by 2002:a05:6214:f2a:b0:915:4229:17a3 with SMTP id 6a1803df08f44-915422924a5mr124915666d6.25.1790656146418;
        Mon, 28 Sep 2026 21:29:06 -0700 (PDT)
X-Received: by 2002:a05:6214:f2a:b0:915:4229:17a3 with SMTP id 6a1803df08f44-915422924a5mr124915496d6.25.1790656145969;
        Mon, 28 Sep 2026 21:29:05 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:29:05 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:58 +0800
Subject: [PATCH v7 34/35] drm/msm/dp: order IRQ HPD handling with plug
 state changes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-34-4b81473185e7@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=1741;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=5HoDkLOV8SkieCOs56wkyW3/fJOyikG28UiNJ6xOq3s=;
 b=X5hZ0+OuSpBi7vR5rueL5+opW/dz2eAd+1WNy1z7PZWcpNAWiBghYD2OAf4MvD4N1UMNM1RVr
 CzBODr1vmXKDHHs2ovFFQHr+p1qRkd4UjzrQmks+015qqWB6lAvjk4h
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: ngSbY5X68b1-EU-KuYeZB_LrqpfaDTDv
X-Authority-Analysis: v=2.4 cv=W42txhWk c=1 sm=1 tr=0 ts=6abb3e93 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=BVs8Im_gJ9IRW4vRDg0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfXwAn9IAvVWoxp
 TZ/LFsUR61pBPxH0HUSqpLbOvvdK2pUNWgcKd3rIFay2iw3zeObH7V2DxLyfOedwFZrccqm64P7
 9Z+0Z8MD3x5wUenfEDVowxYwNb/LiQnrl/yFj2Uoi/Xz0cDIqP1JqEBPzZtULN3Bg2uB+pXmoQy
 j5+Qrz5QRSlNfTN99zjTZgHAIqH7ALmhWyyxwJhMYCQVq5oKl8BfDoRkHT4Qi3H3S0IaOzuRfu0
 vOh82o9Nr+uc4ZYnqLTd1KMf/Wv75+vr5krcRDZTFHdo6IY6t7JfvSCjc8MX644v6LaiHmeTqRP
 xfFDMlqMrsw8f1Xr+p7DKih8qkzyNDfc2Wd722Xwnr/S5SMdIFf1aTgl32PtN3JvL9hujeBOkgi
 YgOWlpG0G9cyPog/tOCyQpp3SH3PWsMxEIlh9eYfys96nS4M4q9iiBPxWUGk0PAA4POkUVP2v37
 tMOZ058QWCbatOA8sFQ==
X-Proofpoint-GUID: ngSbY5X68b1-EU-KuYeZB_LrqpfaDTDv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX/WjirXlDxBdU
 krVfG55m1ww9Yunh9LLRmnfFBZQ9p7FczVYduJfyyvOgU/bPkuLlEoZwszNdI/U9tGLc4y/4IZh
 3TH8EqQtMzq0rfMaBpjLo/kT+GkVStI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017

IRQ HPD can be reported with a plug or unplug event.

For plug + IRQ HPD, initialize the link through the plug path before
handling the IRQ. This ensures that the link and MST state are ready for
IRQ processing.

For unplug + IRQ HPD, ignore the IRQ because the link is being torn
down and the IRQ may be stale.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ed0b93e3bd08..94446bcf9448 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1129,7 +1129,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
 		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
 				      connector_status_connected);
 
-	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
+	/* Do not access a link torn down by an unplug latched after an IRQ. */
+	if ((hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) &&
+	    (!(hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK) ||
+	     (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)))
 		drm_bridge_hpd_notify_extra(dp->msm_dp_display.bridge,
 					    connector_status_connected,
 					    DRM_CONNECTOR_DP_IRQ_HPD);
@@ -1818,6 +1821,9 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 	if (status == connector_status_connected) {
 		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
 		    event == DRM_CONNECTOR_DP_IRQ_HPD) {
+			if (!dp->plugged)
+				msm_dp_hpd_plug_handle(dp);
+
 			msm_dp_irq_hpd_handle(dp);
 		} else if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
 			msm_dp_hpd_unplug_handle(dp);

-- 
2.43.0

