Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286555;
	b=QE9fnrX1Y4x7eKWb+We0/Yning76pVbEG1v9KhjDh5JxfZGF3qQQvYuk14ZWUs+bIh3X
	 pPmw22nEbrZ9qCFmF9G+RKXqw9+FU7t11wlgwSVS5BbCAM9u9j8PcCzSeiYll0X6yS162
	 U+nPxyLgLtsX+qiEFZzT07ArojVjYuqzg1HGDnl5sXLr7hb0ubnbzEIg9yHJDLn4kaSi4
	 Q7+E5EzcoAgR55TQLBxOi1/LGs3mPDJvEV97IE7Z4gGvBuF/XqXGAFWY0FTuvgLBTF8za
	 3O8UUB2WPnYqAN9A4INPIdGI8k5F8Sxqp5Z+EQGHYZvCBo+LhSwGenQC1Oa/D9OE/9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286555;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=j4YaO0ZYpT/FRxBM0qcc+7tzTgK+KPS5LT6PmLgtxE8=;
	b=q8QTLE6EWD7Bkc1Rwvr98HMUJ1g2Az2WdcTAw8oEg9M+n8aGV1fwy0FQ96IHtcS3N5Si
	 5CVqRDSue010wf6eCCIeyPp7Cbsbudo57eppGOleArY8elVloLonkFkzRoOkDRpNuI/OO
	 zpUhvyncbqDkyGzCjai2V0uh67oLzFCzwibeFtZVf/nS+mKN+OX8sIekWO+TOozDDo2ns
	 krtP7gOpaD7tDdUezqzV+8UsUtThYrSKIL4dD/EvvmwdmHOoX9TH/pHIV+qCf+30QK9YL
	 qzQ2IDQ9qTc11iyaUKAtt6kni3f+IONHwH6UwM+xRudAJNRYIGEQsBO2IQdQwfDjgHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J1vxiLkK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VM0tbPu7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FF960A260A
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29FF960A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J1vxiLkK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VM0tbPu7
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A8Lp2919627
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:55:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j4YaO0ZYpT/FRxBM0qcc+7tzTgK+KPS5LT6PmLgtxE8=; b=J1vxiLkKB63GZxCA
	+bNgGcQyAHx9r84Oh4YCf5CCHL/V9NoOQUa9xEUjjnl332xs6tTdGU0r3mAqvRaX
	ElprVDRW2Lo0N/ytfWrtKrTqrueOAp5RKiKv2V8cOgDvUDzWGXRxn2ytH5obuFo6
	Xs7Tdv1v2QjP6W31r2C713iQf7oxA/S5TaBqT3n5g24sWXlTDFUOMk5jUNKnoARr
	3xqYgr651HCDRXgfWnnNSluOV8/RaLrpm7IoFn0YikM0gDuxmwRrmumCVTcev/g2
	bkfG+UfCXFa6iWW7mQ3QV/b1ZKtzAVcJiMgAf4xaixAAwEyJuo+ajDQIzXC7DS6Q
	YjXi+Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg1qwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:55:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cbf2fd504so306286285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 20:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286553; x=1794891353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j4YaO0ZYpT/FRxBM0qcc+7tzTgK+KPS5LT6PmLgtxE8=;
        b=VM0tbPu7CH6Q7Bnsrf0ZPxaqkZnQiG/bRfEzguhLdV8kjZAjbPPXuueAhRgakRH5qP
         7bpAj9zB+uaWX+8j6+GV+EI/wRUNom6DH7R66yABwT3R7vMVddfjDjr/+DUKTdSMzhbV
         MhnndLmKTE8vR6zplUrMLxumB0XMXHi37KbqoFgGG0GI87w20qqhlFa/kI/Xzei5cZYb
         IpDzYSvfOaSTDBBriGMw+53it0cPmXWvXzIH9eg127DINqEtqrXVbBwLWUih6n+KOWpn
         CdYqxHP1v1e/xlpUDgKGQ3VA+jSoDtnbtX3/ZCMjp5bjTNxAtUWYXK2lqoKj153meJea
         oHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286553; x=1794891353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j4YaO0ZYpT/FRxBM0qcc+7tzTgK+KPS5LT6PmLgtxE8=;
        b=Ey+bZWL1ANN/qmFeHbR5n5WlJq/xDuw81w9JtGqvIH/3QXCJ1apwTVXflIlwuo/NGL
         drQoBPUg5Ldmar4XG26qIw/tH0AC1mjRlcvvvUKdsT4WP0TIBJtVMSjfEIkgtB/bb7zq
         HVLDVj8olVRU0sWqoEi/Q1B9kD+DKQnNRV+rgA044zPd59L8uRp1ItS5iHoA2IEo4v8c
         PivCRmufLPIm2ZY3v1Pq+VxlSkNu6/UfiV5XNvRmwphPZKN0djHNF7C+Y8YtumQGMOEd
         EkkusVpnVBwowF2QcSOah+5kxpTIPoXohnvkIT1BRbG8muEplnBAEfEVa69ZzV4i6TCP
         k+GA==
X-Gm-Message-State: APuU4Z97+VnXRzXQYvK1T/Hbj7lOU0kBww5PtSc+P3wrP+6WgR5GV8ZT
	LaBUIK4yDzGTlfvo/qCcFMQohpb/0r7g1cQguzE9e12BssB+GE5IlrKxp2ntLgqGq37v7Difmo/
	NFwhiwKQCgds+NV2UWKLFivHyVoIN/t9t/EMprWQIuH9e/ACXDzCZIHP7ENg/HWnfHiXO
X-Gm-Gg: AYBFou2gWj3RZwvXAjk7GCFM1NupAx+E4ZYPiXfJMby4kuSCrhv2gViyAG03NsmwOP+
	TmYg0lj+22lYlM6ZqWo3YR7n1M8uHAdRU0WwW9kr14R0mNiUsOdMgYFpocjg5hQw3SQ3S5JFehu
	lTh2SoKyFtjh3pp3D+5G3aehpu/dOQCz1IZSeKACAYZmKMKBV0TKsyihX5cV2v6DGa3iI2mn6M5
	9XwD7CrPL+obv8U8x4XBH4XOQQdRS+ZdM3dMzU5KznNIakxcZyUuP29MPd9L60OBe0IyEcx+4yH
	BqICJBF0kaxvv3C4XUYTEqij8dIi2gvpXGbGp97LLK4x4gL8kqIQqf32iNwlHuZtYISwDvESusu
	qs5xRrTgX80X4lGawkNMTpojI+h/EVcfDIfHD9ijy8SqaBXfRYS7bOCG4O3jJjqFdWCb3JMQ9/W
	zTaB5fHf+kzIG52oi5oMr7t5MAopxKB+Tqrdnw
X-Received: by 2002:a05:620a:4692:b0:93f:2a95:a503 with SMTP id af79cd13be357-9479f3e3a74mr250381485a.67.1794286553550;
        Mon, 09 Nov 2026 20:55:53 -0800 (PST)
X-Received: by 2002:a05:620a:4692:b0:93f:2a95:a503 with SMTP id af79cd13be357-9479f3e3a74mr250379585a.67.1794286553104;
        Mon, 09 Nov 2026 20:55:53 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:55:52 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:37 +0800
Subject: [PATCH v8 16/29] drm/msm/dpu: add per-stream MST encoders
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
Message-Id: <20261110-msm-dp-mst-v8-16-d040fb33db5f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=5908;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=y5jRzeNla1e8Iwt1s5LRc06RYsVeZV4O7u84IZgL2qk=;
 b=OMiZVYKrorqRLdXt0pB2BcKW+8Rfcnq1n5wPUzOTOnM+aq6+4uuxSnfetnEni0UVjZ5X5PpPq
 35lD1huP+QXDC2Kb6P3jggv2OVad2pJKwAsqN9aaUVc9WB5sfqv9W6E
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX0tO/XCfx84pP
 DOmAANeJbDkOL8mjZdK7UdSD/I2BCcsGEWXPHf3KegSwZ8ERnm1SIooVF9+Z3SlklIc62VsnjRA
 JaApcdMOVMJV6tsuNwihciFPjP0cEO6CSVjuxG/jA/16h7b13Bdw5SzKJGNCs4iesEpJ0r9DlPD
 6Y2sABupD2sBAoozutJTrQAXJB1qvdN4qcf6A9dumMVUjWDmXvsElQihm4Hf68fE+mKqftyhiQu
 5EF/7DeRl/tYgsNtFj68ehzZG/qQ+SDasiQZc/lffTTb6hcDN5WRJwW4965G5haunV28jXZDe/M
 GRLJZF5oe7e8DUpCa4IftlJ9brQNSIVKv72XTYyNFh5VIsW6eDz7S7VzazWXWSXyYG7UH/rhMwE
 zbnT8iz6A6z0zIfotmJTWJGQywuWOJURoCyLU0spbL8gWOBHTi9xRpMwPbXCzZqWK0ockq2+ggJ
 zQVLEE27vzbQz0pRCqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX+p+SdtC++yaR
 4d9AMKu1PhR8ByZ1zMdXTu7rxfSZtEMV7DfZOtlVSyEX7sRghH31NCs2DbUg7AK+wvFEI+UeTTv
 oh78Bg/42EpZdysy68edwi7PpSPFPE0=
X-Proofpoint-GUID: HCOyVkULr4yXXRS3XoHx-LRdtzbOVIBE
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af2a3da cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=aoVTMipVTiCx4Xnk7jUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: HCOyVkULr4yXXRS3XoHx-LRdtzbOVIBE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100019

Unlike SST, where a DP controller is represented by a single encoder,
MST requires an encoder instance for each stream.

Create one DRM encoder per MST stream, associate it with a stream ID,
and initialize it with MST-specific encoder helper callbacks.

This establishes the per-stream encoder infrastructure required for DP
MST support.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 23 ++++++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 15 +++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.c         | 20 ++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h         |  2 ++
 drivers/gpu/drm/msm/msm_drv.h               |  9 +++++++++
 5 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index a8dcc8c684eb..802cb62fc010 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2742,6 +2742,24 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 	.atomic_enable = dpu_encoder_virt_atomic_enable,
 };
 
+static void dpu_encoder_mst_atomic_enable(struct drm_encoder *enc,
+				      struct drm_atomic_commit *state)
+{
+	dpu_encoder_virt_atomic_enable(enc, state);
+}
+
+static void dpu_encoder_mst_atomic_disable(struct drm_encoder *enc,
+				       struct drm_atomic_commit *state)
+{
+	dpu_encoder_virt_atomic_disable(enc, state);
+}
+
+static const struct drm_encoder_helper_funcs dpu_mst_encoder_helper_funcs = {
+	.atomic_mode_set = dpu_encoder_virt_atomic_mode_set,
+	.atomic_enable   = dpu_encoder_mst_atomic_enable,
+	.atomic_disable  = dpu_encoder_mst_atomic_disable,
+};
+
 static const struct drm_encoder_funcs dpu_encoder_funcs = {
 	.debugfs_init = dpu_encoder_debugfs_init,
 };
@@ -2767,7 +2785,10 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 	if (IS_ERR(dpu_enc))
 		return ERR_CAST(dpu_enc);
 
-	drm_encoder_helper_add(&dpu_enc->base, &dpu_encoder_helper_funcs);
+	if (drm_enc_mode == DRM_MODE_ENCODER_DPMST)
+		drm_encoder_helper_add(&dpu_enc->base, &dpu_mst_encoder_helper_funcs);
+	else
+		drm_encoder_helper_add(&dpu_enc->base, &dpu_encoder_helper_funcs);
 
 	spin_lock_init(&dpu_enc->enc_spinlock);
 	dpu_enc->enabled = false;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 3c3203ca32c7..92691d39dcb2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -688,6 +688,21 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 				return rc;
 			}
 		}
+
+		for (int stream_id = 0; stream_cnt > 1 && stream_id < stream_cnt; stream_id++) {
+			info.stream_id = stream_id;
+			encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
+			if (IS_ERR(encoder)) {
+				DPU_ERROR("encoder init failed for dp mst display\n");
+				return PTR_ERR(encoder);
+			}
+
+			rc = msm_dp_mst_attach_encoder(priv->kms->dp[i], stream_id, encoder);
+			if (rc) {
+				DPU_ERROR("dp_mst attach_encoder failed, rc = %d\n", rc);
+				return rc;
+			}
+		}
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index a2900ff3b0ab..ef5fb70863b8 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -147,6 +147,26 @@ static int msm_dp_mst_encoder_stream_id(struct msm_dp_mst *mst,
 	return -1;
 }
 
+int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
+			      struct drm_encoder *encoder)
+{
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	struct msm_dp_panel *dp_panel;
+
+	dp_panel = msm_dp_display_get_panel(dp_display, stream_id);
+	if (!dp_panel) {
+		drm_err(dp_display->drm_dev,
+			"[MST] failed to allocate panel for stream %d\n", stream_id);
+		return -ENOMEM;
+	}
+
+	mst->mst_encoders[stream_id].enc = encoder;
+	mst->mst_encoders[stream_id].stream_id = stream_id;
+	mst->mst_encoders[stream_id].dp_panel = dp_panel;
+
+	return 0;
+}
+
 static struct drm_encoder *
 msm_dp_mst_atomic_best_encoder(struct drm_connector *connector, struct drm_atomic_commit *state)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
index 7f35e7524cfd..3cbd2a674675 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -9,5 +9,7 @@
 
 int msm_dp_mst_mgr_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
 void msm_dp_mst_mgr_destroy(struct msm_dp *dp_display);
+int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
+			      struct drm_encoder *encoder);
 
 #endif /* _DP_MST_DRM_H_ */
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 31ab50f620bc..cc665888ce7f 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -360,6 +360,8 @@ bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
 int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
 int msm_dp_mst_register(struct msm_dp *dp_display);
 void msm_dp_mst_unregister(struct msm_dp *dp_display);
+int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
+			      struct drm_encoder *encoder);
 
 #else
 static inline int __init msm_dp_register(void)
@@ -406,6 +408,13 @@ static inline void msm_dp_mst_unregister(struct msm_dp *dp_display)
 {
 }
 
+static inline int msm_dp_mst_attach_encoder(struct msm_dp *dp_display,
+					    unsigned int stream_id,
+					    struct drm_encoder *encoder)
+{
+	return -EINVAL;
+}
+
 #endif
 
 #ifdef CONFIG_DRM_MSM_MDP4

-- 
2.43.0

