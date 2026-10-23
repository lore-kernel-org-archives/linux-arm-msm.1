Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797950;
	b=OFY14G/yG5KpnVall8ZgP7pp40zUi4Z7gmjOef1PdysGQ74NitpeVIrdAThL3wT6TRaw
	 gCA9QAJHD8lQPpUPRxjwigbkuVYk2hFOgJf3FRsSmKWnG9aRJyGVxyA1KWTl5ZVAqVFB6
	 NI9ifItowOzPPOmZEt1zh884GpWSXVB5W/OxYDTaLlpPw2zA7bpm+/6ucqKalB2gjnTbo
	 qv6+DDess3clFhLMXs/F7JbXv+Q5TE01dYwEbWdhn1G+V7pRAEB0yWIjwSNFZdLSyeQcN
	 trsSPsBzt5yTrwggaDX9Sf48GAIx5xmHVOiuhma+qU54bwGLUI6epLb6pW3QfhJ6qbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797950;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/LAeqwoWtFqbSPLKUF9sSDQ0qIlLUHbHNTMbGdBh9Qk=;
	b=sZVR3faMamGKEzoW+aIKhGRWQs1BzAkEPeNgGyQLe33rfDQMZ3rt2uE3rnWIB6OvOBT7
	 73A1jS6tmhVk3nZWPVa913PcL/X76klO9GKNOh0qZuTRa3ushg7ImA6h+3rCtMQOqng8n
	 PVwYmnhUDHgnzlw11N4O8B+5QD6yeMLXRIvMOlYbtM97AK/MjcaiQoSLEXLyQSCIZb9Go
	 T5D1nIqmKfRI6mgPTZsZmuUZxowb9FXsNeVpYOpkHodg15xXBmuWvTFxkgBBeV46yu0OH
	 hHFGpDyH6fp439rRFuPIBKr3bFtOvBg1+Rx7ngTpw9Cz22/Ly9/zCxXA1SETxFCVyRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V04Pfiox;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QmMziVDt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B98606A338
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97B98606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V04Pfiox;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QmMziVDt
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLv7MX3683559
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/LAeqwoWtFqbSPLKUF9sSDQ0qIlLUHbHNTMbGdBh9Qk=; b=V04Pfioxj8k1fKUp
	3sRi1STuH2LOJKE0oJTK0b48wW4ANxZZPIeIUYRte8SJF8OgqhQjQUG1H15O2o1D
	aLw7fdZCC8zSU16YInqe+hvs0SUW6MDR48XFimzHJxKJHrn45Ts65XdWJWHIm5IV
	uatWLTqBmw1B4bNOyfZv4ZwLFHA1XAlfhk9xnypAzIkyloHa8aPx7RR/0gAh0xdB
	A8wsnzTX+dSAo4oy4ZEfoKsXR4DUzzl7dH+vY97kwLiz6qN3fYorfcIuC5B9fNTt
	Qd+0RercA9t2lmgSj7nzueYSjuToeQIulmzoCU3gd4tWGO+jOzRg0UL+luHQ8iZ0
	X+CDAA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas6sbm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:25:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb6391e89so302985185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 16:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797948; x=1793402748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/LAeqwoWtFqbSPLKUF9sSDQ0qIlLUHbHNTMbGdBh9Qk=;
        b=QmMziVDt+UG1wBVIHgeDdX9yq5bzgCFlownClZdjxYsWi+LKn12rpkvOpFk72kXVt4
         Djb6WAmMz/7hpA41V5VsAaS7lV7Ono8ORBS4j+n13aBegzwDUfNmbCkGloyMTchIu0o/
         0dQrD6fhlYi/kq7QfvIp9A4KdjgX6K1zCjzmJ5I/J2xJAH6S26B4ixvnOjjmsHokDIfQ
         1NfJN3JfF4amUjTvGgzrTuQz5HLBYINPdV2g8V4trvthZST2QdmmOrcddeFFG09zMR64
         /bs2bljwk88sLQOsI9JDsTNQBvSeB5q+nXqAD3KwpEZIkh7MwfJ3wOXxaMCF7KxNqXuz
         TiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797948; x=1793402748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/LAeqwoWtFqbSPLKUF9sSDQ0qIlLUHbHNTMbGdBh9Qk=;
        b=zav6gQVeI1iKq6muMidJ/kFjTw1OynK8cZCE3MGZ/D7XX+hPqcBJkbL2ifPiqO95qD
         ZwPwgqh8g+zycyOXf+TiKN8YF3OK+PGbsLRzzM33lFABGzaNmvuoJABXDmhdNH2+TPKg
         kNBbrU1MmG0eJZRPCZStKiEofXo9ZC7t0MqSLAJ93VrHKRBuHfXSndrysDZYjWVG7lJz
         2PNZ/N17dMFRxey24EZ9gCkyG+bHM6LmqeAFS8R4IDzViT/+cWuscY7P0DTMmVvNkQ/c
         FB4WG0aPpyI8d+LzwYjz74g1xKt/xcmgo9hQ3z6aZtbA3McQbd/QA0nPqpKPdqeLJ06V
         1x4w==
X-Gm-Message-State: AFq9FYKxB/8n6/7FDCfsgNBnmkfiYOpU7Dt1cIDb4K1OLdl1ubWoVCXG
	pDJqR/RP43P2HOAXNdeilxWvIkcUNL3BsF7C0nWZ+Ww37upiLbpOUO/PVzvzGkvLIlNaZQhyZWe
	q+TUJPUbnP4bHor2jSEc9zGL+isFgRePuMsLANzy9NKn/8Jbe/ZOObsnY+/QYkJ7RkTTx
X-Gm-Gg: AYBFou0wyirnnr+QCcXA6M+iVvlJPSe2BQMBe57RESF1CTB+aZWE69rCMBKlDztdF8X
	BqhmGbVdnafjeW6Y8Py2ZIZhwTIirWmv9VlJt3mdv25IsAJIFVeXdxgmF7OXFsaO65iej88KUWW
	05UnQbSftb6rN5wKSJ2tDjcbPFaY7JiOKStOinketXgl/5mTrlA9Gt1vKfdc+5bM+2KqedBpkn7
	20QuczwLq0xQ9dmyUvdyrvF+7WDmwT9nbY7v4mR4JQsQ6wGDwtJQbSz9PauECe24QLZIGDQG7nr
	iygQ693PIv7bC1eZ/WjMHIjwMgTfzMPldpZaUMz9EqCySYa35rsAgE6kYfyIZoL7bHhivo/XPcK
	4cgzQe72SfBdySnAnRHxq23EHX6qQwXLSfY2XsuAtRc12y0rtNmkZOfieDoTFT1YMbxRli/z3rh
	GPgmnxc7+5aUXf
X-Received: by 2002:a05:620a:8399:b0:93f:2ab9:729e with SMTP id af79cd13be357-940ef9151f3mr89905385a.21.1792797947853;
        Fri, 23 Oct 2026 16:25:47 -0700 (PDT)
X-Received: by 2002:a05:620a:8399:b0:93f:2ab9:729e with SMTP id af79cd13be357-940ef9151f3mr89900785a.21.1792797947330;
        Fri, 23 Oct 2026 16:25:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9ea71sm60217e87.81.2026.10.23.16.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:25:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:25:25 +0300
Subject: [PATCH v5 04/10] drm/msm/mdp5: flush the interface before starting
 the timing engine
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
Message-Id: <20261024-fd-kms-fix-smmu-v5-4-a5b0b284aead@oss.qualcomm.com>
References: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2262;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GGiCoTigCncSjQExhHlehqh6DW7zeUi0eG81bX9nqSY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+zoUiRvfbDYHpV9LE67/Lgl87snKY7KSX6Cp
 ajd5M075uSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvs6AAKCRCLPIo+Aiko
 1a+JB/kBim54MBDcPnKmvY81X/osZL4jlanUdIktJbxgIkba2Vk3PY9z3SSU3Hd18WdYdQwd8VY
 9OQFLrAax4lr1myST8pKoBiO6huDgp32IrYfp5qKvntvPUfWVQt7nYlzI71CNKQWP//90NVh7Eb
 0Fb4lVIo0JifNZvYqT3plCdK4FQSEVU2Gav1NIktwUQho59AjB2ggqO6eC6lMg9eqF2kYSmyVUR
 8SCq+f4h7ObU4XDM1oKmND+40wHZQ3P6EpVLCgLhqERQ9q985vMjWL+sHPZWQgya0x2iBRLHtF5
 0QEoZFIjBviXpozUHh/6xtL8+StpIjL+fXEsOBfc/6p8ckMp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX0gBwgjLwi4CN
 QbUsqUcwIZgA0EU7oOBmHSKMCEDitbRxoCcY1r9kVDb7zzFuNiiidCi3U5rC/8qUEvAm+zjZlOX
 xttU0Q9hOSOMDNgbr2m1o0NDE3yf2UP4fT2uLrdBoMng45J3MNW95tQoSWolCCye07fjIUjCGsV
 POfC66YVKGOiWEfNiBWAWPePD+4R4lDYb0VOf7D6AYHMv+VsavtrvvC65fvXm9Oq9ueDCEy0UZb
 6KOgA8E/2DRgEGyx+kxshVEYwQXNyZwb/QgXOOWdvY4lHRCT+fW/E2+Qlz7iqerDh2iN3iWJ/RA
 ZC4yHcrBd2jyQtPEHHOfD1qChKX3rJcCE8bk4ABtlcIsmE8y3pUIGMRNO+57L6aQDKduwrVfVRf
 C/TUL1FV5/PkRTQq+XsSi2xbhn95Sql43IaLpuDIrtFaz+oHT3EKVTx4zla+RnQiKBSKCC9/Qah
 YxmC12sLRiE2fj8IXMw==
X-Authority-Analysis: v=2.4 cv=DK0acCNb c=1 sm=1 tr=0 ts=6adbecfc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=H8EOZ7U-Vh7qnyOv3DwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: yI9WEE1AO7MRPaC0okmR7pXVaBy_C1g4
X-Proofpoint-ORIG-GUID: yI9WEE1AO7MRPaC0okmR7pXVaBy_C1g4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX5uFKrkfFOROO
 iSx2FHafnT+3tfRzqtels7CS09dGl9UiL7jnAwS7eP2+bizMeZ2lVluyzTwrgDLK87dQyD91JFj
 tHZ9ik6xaaz+xu0RfcxzBemWHVCVVfY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

Disabling a CRTC and then enabling it again can produce an SMMU fault on
MSM8996 as soon as the timing engine restarts, e.g. when fbcon takes over
after kms_atomic:

  arm-smmu d00000.iommu: Unhandled context fault: fsr=0x402, iova=0x01fa6e00

The faulting address is inside the framebuffer that was scanned out
before the disable, which has been released since. The pipes keep that
address latched (CURRENT_SRC0_ADDR still points to the released buffer)
because the plane removal flushed after the timing engine stopped never
takes effect. On the next enable the pipes are programmed and flushed
before the encoder is enabled, but that flush doesn't include the
interface: the encoder enables the timing engine first and only then
flushes the INTF. The first frame is fetched with the latched pipe
configuration, from the released buffer.

Flush the interface before enabling the timing engine, the order used by
both the DPU driver and the downstream mdss driver. With the INTF flush
pending, the whole pending flush takes effect when the timing engine
starts and the first frame is fetched with the new configuration.

Fixes: 06c0dd96bfbb ("drm/msm: add mdp5/apq8x74")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
index eaba3b2d73b5..e9eb1db92775 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
@@ -164,10 +164,11 @@ static void mdp5_vid_encoder_enable(struct drm_encoder *encoder)
 	if (WARN_ON(mdp5_encoder->enabled))
 		return;
 
+	/* the pipes fetch the first frame with stale addresses otherwise */
+	mdp5_ctl_commit(ctl, pipeline, mdp_ctl_flush_mask_encoder(intf), true);
 	spin_lock_irqsave(&mdp5_encoder->intf_lock, flags);
 	mdp5_write(mdp5_kms, REG_MDP5_INTF_TIMING_ENGINE_EN(intfn), 1);
 	spin_unlock_irqrestore(&mdp5_encoder->intf_lock, flags);
-	mdp5_ctl_commit(ctl, pipeline, mdp_ctl_flush_mask_encoder(intf), true);
 
 	mdp5_ctl_set_encoder_state(ctl, pipeline, true);
 

-- 
2.47.3

