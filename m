Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793435030;
	b=G5+yp11mRlBdmdIIqR6a1r+zBenf5lWh6I5PlBEz9Yl/S051FmZswag5+WDUMzJHiwOa
	 YXPSGE64iQRLEttJvFy0iSM12ed54mT2N5Z8dYXslTCm2s45yyiVFh+0dKYKW/k9CwMPw
	 HsazNXAysftiPBpllzhvWBr9/pizeoLAVlEFAkpVzLRpqGtAVD4mHmj4buABnz8QBUjWw
	 vOueYUQE31etp+TmvwctQmU4fNisd30r6tVYGFJUXTAM8OyYwIPhL+ZILMr9aH9EoW4JB
	 HLq4x+8MlNI8+5BLZMRt/6s9Y01yqHy+2T0qEDEauEsaioAExpmU7FL1EKkJUn4tOFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793435030;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QFOpLTe4a0GH6IrBUWG1rlaEM4FZttQUc4FaLGB4FuY=;
	b=B7/WtJgVXiaN1L1nrOPIEk4JroWGlGphKwkZrWIKKmp0cglhREHRMNkzs26l1j9zTKID
	 yQ7l5on3FWfCX7zZnt0CRuuyYYBrmaWNG/qVXJUsBeup0vhgDzD5VwdkVHdOfr9PFXzPP
	 9cFgwEnCSSkIPB9HPR7tEISS9jKfe6hChCD5JrAWa9/nOd8+Tt8kapBbqCVWGGr6XYREr
	 vHeDcHvwXKpAYluZL9HBP6O2cL6AWFfDT/cbsjbC6CNWmSThdq6/Zvo1qcWj0Mdkl/Uhl
	 d0CyT6YJopk+pgaUWH5Lg7uNKpcU21MaErgn1Cs6RcwIqmEfaT+I48EQq9XgEuanvEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jWVWVG+j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EAGPj+uA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A24606A31E
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 08:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43A24606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jWVWVG+j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EAGPj+uA
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4aBVh1168717
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 08:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QFOpLTe4a0GH6IrBUWG1rlaEM4FZttQUc4F
	aLGB4FuY=; b=jWVWVG+jRk7JaZ/tPBpElR7fJTsO3IJ0QcE9wXVq159UaI7Dyq9
	OIpPRJt178AqfnV10bSQ5h914cCA7cPI5Gf6QBl8M0B83dSICQjp075NBsAUAbwu
	RmR9xjU4HmQlUo4DKoBiHsSXTAQqDlEFUCIigfQkxR8xxEqF0AhSuhbWDXCPBr3G
	jk6W43+ZzBCV3Eob8kuRSuQBTAMKSK8nMqmiqtogv4j7sJYEIPRCvUVGN5xcofZA
	89QQGriQY8l8IbHwEm5Pem5qGzD8sPSt3qRCI9P7g6nGXaWNjlZpDV/K1wMbjsY3
	q7wZuP0m+VSHtyCXkb3AWqvHYr6P0wfgKGA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8du8mx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 08:23:49 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3662e7a9299so5765992eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 01:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793435028; x=1794039828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QFOpLTe4a0GH6IrBUWG1rlaEM4FZttQUc4FaLGB4FuY=;
        b=EAGPj+uAtBkGlTE9VjSru5XcqELeettSeimHb9HBNsVJx6EIVBQ6RCoYAMQ3xmVRHG
         2QhpsiDi1EAQpuz533H6s/EmoOnSvXBwdIWgJBgtkvRdq5nHQAfRb6GuoX3QX0I2TEP3
         BXsW9mvF68KAlcbLLaBhqTwMeNWkJqR816PwWoXinMMeUQE0zhBVR7b1Y2dZcqnVVeMU
         Ao01DlGcHd3+s8c/vf/t6MVrL/vmMSiFkbfr+TBlPFD6yVXjLKlOnX48xfNb4UYqGg5e
         aFREgKzX0i4KQtFaq07DdRAoYpSFXKKPxAw6MwkBRkezWqsAY6EMkQvN8WFd61MGl0R8
         iPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793435028; x=1794039828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QFOpLTe4a0GH6IrBUWG1rlaEM4FZttQUc4FaLGB4FuY=;
        b=kAVrCo/aTtp04bIRQm8p3P52c33nNzZ/6YqaWsdXRACqm6sPD6PXrVMDI+hnFFTWv6
         CjIvUjuGY4aOWlae2ZOBeJdgh9xify0p+wEJZqIqQS1ACT0d6kzA4wlAzW5+YQtbEQyY
         +1tOPpxKjpUZiXcZa18EDfHh4Y77AOhkhZPBORvfyzmvT7Sva9GPYm8HR7bPwf1kz9rI
         hmr4s+0uEUDRxT0b9opaJHbTe0fC/yd5lhtwCf6xGQLhh+oJuTfc1zalaN7x+IeJTwwA
         hZomgvIgN9FjNga4iRh1cBXqPJwhutACGLlDffQKaqS4gZ53DX2zhviZPePIEv+il75A
         3duA==
X-Forwarded-Encrypted: i=1; AKwUvBwDW5qzXSxyId+U97xKrd+7m8DSz2caPwPdXqyOVx6QIQVgQpY8qPrAxMN6thnkhj6SrikcOM8F2TRvaX8a@vger.kernel.org
X-Gm-Message-State: AFq9FYLFB+49VSdBr7XR6F2TeUbO3nnxfFIX+a2LMVxTqNePBHovS31U
	tfXdOS9XeOyuC8CCs3uIEoQg0D5wgY+KRlq7D6SJpVjJTJl8jd/vJlT3ocrHtHAhpER/rgWH41t
	Qq8teWFWs3TbAxQm8xc4lRxW3+iMjEaJ+TocTH3jJeAEWldJG/kmehgOrmvOpy72GWGKd
X-Gm-Gg: AYBFou2wy4MT39l7vxomwmNQW8GynnigrWwdDNut/O3zYOrXX0v0FcY2nBUpv4l/Dh6
	/RYpBd9Mzbuj3Xg6i/0kEWVqTd0ySak19fTaxFh8H704k0VfXOeP/W7urK8WtdfMNSCi0hEslkr
	5yjRa8USNp+IAVqQ3M1p+Vq4nJN7Favvn7ADooP/OTFlYlpkZGoyoVVnQVMpOWZ8cvZbEV2rlIW
	RGAAgGDenwKlI7C+O64YJj4S1cqhuk1GwYyqVfZ6eKq2SwXJf63uYhu+95aptWrR/UtDFOiW3e0
	68h5/Zqou1Cmwr8C+nrf15+izH5zcjWxQYh2u8kXXMGg9MpUEvTOp69ywv9SI6QaOvq4nkOcu+N
	hatAOgCEAJyJC3LjoSh+IFAV3i5BDPslQd9oLeCparJ91ezQvLela++gEPQMFayLIJRZRCCH/xy
	oqwg2EHi8Dsieaki/Y4kNkkvJsN1JH/SWY
X-Received: by 2002:a05:693c:87d0:20b0:36a:18a:e00f with SMTP id 5a478bee46e88-36a42406487mr7309436eec.34.1793435027990;
        Sat, 31 Oct 2026 01:23:47 -0700 (PDT)
X-Received: by 2002:a05:693c:87d0:20b0:36a:18a:e00f with SMTP id 5a478bee46e88-36a42406487mr7309415eec.34.1793435027529;
        Sat, 31 Oct 2026 01:23:47 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6eabbsm15329884eec.24.2026.10.31.01.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 01:23:47 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3] ASoC: qcom: sc8280xp: Derive TDM channels from DT mask
Date: Sat, 31 Oct 2026 16:23:18 +0800
Message-ID: <20261031082318.1146398-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O6esLx9W c=1 sm=1 tr=0 ts=6ae5a595 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IADkTxCLwKcHhP5_0iUA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: keq5tW2hrR-KbsRTjeClYtWNf-P9Iiry
X-Proofpoint-GUID: keq5tW2hrR-KbsRTjeClYtWNf-P9Iiry
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDAzMyBTYWx0ZWRfX2YpwWyecG/YD
 ZY45P9gJ081nGxquSQ50AqypRsT87qXPPk5enZaD0tMPgwuzZiTo7EnsF+vegZZulgG2TWmXt50
 fbVFMOncN5WkQjufC6QZh+6shlR3Ir8kqDyW/5KdNQ7zC6SLr211KmjVqUg4OoDlhljwk5d0TBl
 HEHMfxXEmGCCTZEdXts97mIpnS8JH4KN+mh1VP+NaIiLOqw2BLai4JmVuTxeQUgmVPw5uJMNJG1
 hGwoxI79lqCLA0keC0RzdnoL/10GoV7jIwXXYPtkG3pHk2F7uktbkiYSL+LOzC4ouzKDJCMXGCQ
 1M2lNDWE3IZ3HuyVBZBO0Y/sD3rEbgcOC8Y/ZynHynOy7Ltpy9FLqHLENQajWSw41zHLbeTIP8J
 hCen8gjlohIX3TAJc1Dvxgtlx2s0+s7R5e2RUiRbRHqQ/Kx7yZJaupVKSxtmubsaUPsH5lLqGcf
 9/S0dlVdsbIsPMsuCBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDAzMyBTYWx0ZWRfX1Rr1YaZc4u8e
 Z/EPvzIoGwDbACPJNKtru7lzpZkahdCctNIgm0a2AFW8tl0mp3Ak1Dg33rabJ58XuC0OSBDFZz8
 dPWgiTYrmGftsvE8HqRp6Z/MBpCvnmQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310033

Derive the backend channel count of TDM DAIs from the cpu DAI TDM
slot mask in the DT, using the same DAI ID ranges and tx/rx mask
selection as q6tdm_set_tdm_slot(), so the channel count always matches
the number of slots programmed into the DSP. Each board then gets the
channel count its dai-link describes, e.g. 4/4 on Nord RRD, 6/4 on
RIDE. Keep the default of two when the link has no TDM slot
description, and fail the fixup on an invalid one.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes for v3:
- Propagate qcom_snd_get_dai_tdm_slots() errors other than -ENOENT
  instead of silently falling back to two channels (Prasad)
- Link to v2: https://lore.kernel.org/all/20261029022340.591372-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Cover all TDM DAIs (PRIMARY..QUINARY and AIF_TDM ranges), matching
  q6tdm_set_tdm_slot(), instead of only AIF_TDM_RX_8/TX_8 (Rafi)
- Link to v1: https://lore.kernel.org/all/20261021025310.2072026-1-shengchao.guo@oss.qualcomm.com/

 sound/soc/qcom/sc8280xp.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 9aae6aadd43d..8cc75a7ad866 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -303,6 +303,26 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	channels->min = 2;
 	channels->max = 2;
 	switch (cpu_dai->id) {
+	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
+	case AIF_TDM_RX_0 ... AIF_TDM_TX_12: {
+		struct qcom_snd_tdm_slot_cfg cpu_cfg, codec_cfg;
+		unsigned int mask;
+		int ret;
+
+		ret = qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg);
+		if (ret == -ENOENT)
+			break;
+		if (ret)
+			return ret;
+
+		/* Same slot mask selection as q6tdm_set_tdm_slot() */
+		mask = (cpu_dai->id & 0x1) ? cpu_cfg.tx_mask : cpu_cfg.rx_mask;
+		if (mask) {
+			channels->min = hweight32(mask);
+			channels->max = channels->min;
+		}
+		break;
+	}
 	case TX_CODEC_DMA_TX_0:
 	case TX_CODEC_DMA_TX_1:
 	case TX_CODEC_DMA_TX_2:
-- 
2.43.0

