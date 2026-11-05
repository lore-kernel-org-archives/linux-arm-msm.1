Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894572;
	b=QxgQLjfkecufJs0QfJuUIYCfwWbK/onQnfhbXIBqZBFYTNwET7ljMzLath0kgrCaNmtp
	 SaDtG4oO4bxeDX0tF+Qy189WLJfa0suvgSDlLfYx4NTppAc+C9rG9jEe44MyQXIZgXydm
	 m0p8SllixTwCuEpxrFyDxsR2KY5K+TX61lk6OyJFNf5ln0c03RoSrlZmSyD6XCSSS8eCY
	 v4JeedjrVahIAbd1ID0kxhBejDQEXg2CKnNsG3D+BR9CoNwSKKehn5QYqCqhAY9i8IJtB
	 A1O7ZnxrgsqA8GAtQbxEBkHCHOnq3o6bUSzCNhElhTsSwkQolqIEViansdAf7EiMiHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894572;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=34g+gM68eFDTDCVBvHfun3apqlRNOTVBacuR7uGRASI=;
	b=vppTlha+Bmkvmjva/DcBlcat9J35yg8Wtk12KHL0BzlmoBKA9ay0HZCLDJblw6tl61+X
	 roc68PNt2GH3t0v+Y5U4zM/8YYhUCkUT3mSCYLGY/x2gCErVfa8ShH9TFv4G0AjNcN4NM
	 RXqmsIjvYCNjeK96doDUDeru20a9lnsiqEOy81cDXWw8t9WxcewB8qrlYTKirrfC4jwkH
	 SHGODWu3Y047uL0+z1ZZiomPxCfKLGeJrtGHpAGUbDkimlwSrPD7MBCUZfjet/7yMidQI
	 x/35k1ZPGXTK4NKlu/Sc7AoMbJYxAbxjZh1qRERaUIldCPLhLgjAAi4GKAbv58KaV9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZyJBQkxp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c2rEgnbs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0246083618
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 16:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B0246083618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZyJBQkxp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c2rEgnbs
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQ34Y1049564
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 16:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	34g+gM68eFDTDCVBvHfun3apqlRNOTVBacuR7uGRASI=; b=ZyJBQkxpsyP7gHjC
	PFpey2bsuaOeurJClX9QcG/h7iR1XaIKYkeyA9e760ktwGPzGLlDENrMRd/3h6Ua
	Oupo19XzwJ8OvAQugvaGDrTcWRukQJfkmywsws2Dtj0BxU+y7QCZmDmizTcD2pOW
	CGSe308g7ZhpfAG5R6RSpEJnPSzqFxfMPxk703NA7cb727y4E/BzEc68ZPzD4anS
	hC5SrTBpjN8LURnxEPfjZ92bq/0RQfugZRJ/2mqXq6Op0WfozuVTjQ+w/scKfVLP
	KEyyAZLgXrOyR6vWKSWwmWM7d15CANx/tFZQYAK+ZWFAUCHqUWKxnMl3m0mwrxV9
	Rs7pWQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrpaahwfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 16:02:49 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eac42e83e0so506422e0c.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793894569; x=1794499369; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=34g+gM68eFDTDCVBvHfun3apqlRNOTVBacuR7uGRASI=;
        b=c2rEgnbsltCVcdoOauiTp69I5Xf1+JIZq1nNcaWVLyI4agU7u06s7Z8AcL12JuQKLC
         3VOBQtBPCOFc9cr3lRGow30CYVLvynTlpEhA+il4eGWdV11DbXteDxz3w9v5rLtPWnsV
         j7FAm0UCftwAViA4O8KonbWycZpK8KQGOiUVWUPa/K7nt1LC7c08uCiY8Fvv/u4NGzu/
         lh1aCKTp7/h4FpabxypigznrUvM5hxH9HP2XmAuo+E+GYJKMekHpSuwEFBLBr2oHeEC8
         AmUZXjmlXBwL1JYJNuZ25Q4HgnE6Puo0nvePrhEnCmMmusZhfuXx8T54m3DVZOQGMFNz
         n9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894569; x=1794499369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=34g+gM68eFDTDCVBvHfun3apqlRNOTVBacuR7uGRASI=;
        b=tBGjMQaMX43Gq1RXN5oN7BmsDVqU+Q2ysFEiWs3zNw17FInkfKdll3PQNqFre6NHre
         Pa6npdQp74YUfhRakgjAgi/3MDT2lqcXO9eWxqd5Oe//7MPJf4EAwhPD8jM/FZVrXnd8
         9aITSmNvAfi59UagPcgPlNtkLCJQCycFf7jUyyFdlxYVH1sWVV/OtVCDr9iKU8Ol8Hte
         QvvTy1FXH9gcHM8YPZ91OIEFrcMCgBQnCE912s6Zo4GJPMJE2bL2CkfX+k82mR1hWlJc
         s36F2+DvMzabVp2BDSWwT2eSKYstUMedF16ZU5xm+4B6ZoYnKZSCSUVIJwgW/W1//x4E
         L5RA==
X-Forwarded-Encrypted: i=1; AKwUvBwrJTgsk2dmOg/VU1g6Su6coZapeVRn2+dNtXZL3KH51HfxKRR5jFhXCfzRY3D2KkmmuooPliQp80oHwQ/V@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZNP2379jl+xE/ZFSoa1vAgHrh4juGYPfMd+Fv+OEkae3Hh0P9
	FQJnkXoshACGaXXEWjtha7PZWCPH9kdfCsb98qEcrgPuKczZmfp3bOKejz8fecZY5y1nj+RRAtM
	sO0++DMlMbG1QAfX/J9Nvr+6vg0RxHJtO9vgQklvqZ8J+r4r8ALZwr8wt1yF2COd4eO7p
X-Gm-Gg: AYBFou0LwhdDIO5sNJVqIsmYO4HaVRGvcGKDBFXvPwEfOyg01EN9sPASjpWvRPrXgfZ
	pXoB5gJTYI4dgwMlFWjrvZDBIM7LhrwuR95NiKOkeg75cwiPvUcU0eY6jnnEo/MtBU/JeMaHWip
	fIGdqlMq9AIrW4sO7g1pUc9JAzchwUc6ZncKFTxy6IoHD3gOAidmmPHRSpsSCzZ++i+A1AaUmoi
	UrLK2Hdu7+r3GygHn8sLWAPPjXEd9FvenS1RP4fdRWSFpognfK3Kig9qPlZpZSoe370Xskl3apQ
	ufbzQvYCdnqUHPWDdPVsgRXzAc2iyIMTx3s/rOAIJ0aZw4LtRMvNyTMCP/ptvfW2K5ybYSPqv1D
	FcyeE8Xqp1DGOxUv5Csr0xEC4nckp/GPSjvfqvUcx73ka9BbgXQxT8QLKhw==
X-Received: by 2002:a05:6122:3115:b0:5d4:1193:73d3 with SMTP id 71dfb90a1353d-5ec6894bf5emr9727473e0c.14.1793894568676;
        Thu, 05 Nov 2026 08:02:48 -0800 (PST)
X-Received: by 2002:a05:6122:3115:b0:5d4:1193:73d3 with SMTP id 71dfb90a1353d-5ec6894bf5emr9727404e0c.14.1793894568060;
        Thu, 05 Nov 2026 08:02:48 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda20521sm11065672f8f.53.2026.11.05.08.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:02:47 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 18:02:02 +0200
Subject: [PATCH v3 2/3] ASoC: qcom: common: Add SNDRV channel map to Q6
 slot helper
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
Message-Id: <20261105-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v3-2-29e06613115f@oss.qualcomm.com>
References: <20261105-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v3-0-29e06613115f@oss.qualcomm.com>
In-Reply-To: <20261105-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v3-0-29e06613115f@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2144;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=PB2xbFqRgMUG4atgisB8EwU4caRe51qu9rLYrESsFBw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq7KigaTg5w6SITfHlnkVrD4JBkEpgmgeUVldrv
 nmoTg+PxhqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauyooAAKCRAbX0TJAJUV
 VrBFD/40dYtqvjA7O4JctJu2A3E49/7nEjDc/syzyOkQrSTTDNFBY+mADWy/JsdHhaPO7VbRE7c
 oj4zJ6ashWlSVttfnWlMGUwwxTjOhoMhnXG3LgRLmdowYIhWLgMuaalv0IJMdW9jWHlSiYhSnuw
 YpLUQaJkVFYP1xMqgm4lLAUrRN6mLenoTNyAc4zLi7iHxYKhreVuwMa75awHszrSrsy9ri97peh
 JG7UexUHwtO+uBlyxoX7ZuES8XrDsM6I1Oy0Y//Hpg6VkO30a2I3kIdvsbWvjfJl2358+9Q33rk
 V/UJRsXi04LR+HjQ4q5wUOM7AMcDvs5b7vBDB5CxIdsWVc+f5RL5bXaJINGjES4uC9XKY6gTfIF
 RVC+zqS6e88F2fhqVo4MWloZ1K5tLK5A/FInoSkw2Im8m8FzLhOdhk0e5Xt+zMMr7dSFA6xGQ0U
 P56SZJMQx3YY4dyo650goEuhf+SrOLUIqmmVfCxfXat+Nm7Lsgx5aN6bLZyvxkV5qhFnv0CDU2+
 IRN8e7HdW6dNBHHIlFcKCXW5HqCMrJcw9KbarARv+KFhrmt+la6tCi2GhcLCSkitxSKS14ealHb
 gZTj/YTeyN72wOb0uvcrIdw/Kd2lT19P5yRKwbScKA/Uyo7fu8SusqRUpd2iWxN4uJHWcvGA5N2
 pdFcy6s5KE/ziKQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MyBTYWx0ZWRfX7bk37vJCw9+B
 9fFN+pj2i3Qa0657UDT9aqqAFWxJ9i1wZOTMwxD+Kh1ZHRuaiG6Sw2GaXLh8i87RQWqhHBAuC71
 nOlh5Z9vgP0XnKz/2XBBWCuNL8RVWMjmLQFChTp7v7HI/qiPHgtX60GTKKAY4b7WagriNAHVO4m
 hP7WKDp2EM7JfLbnFra90vYny/w4Ms42PfxRLUX02Uc16s/lWSoQf5zxtBNiRgOxOui7TvxnOv9
 zMRrcLP0knCP6bwHuE+qnkNenOpdCrniZ4yYJYYqsljHnZW/xitmi+j9XnRBtD+5nT2bNmfrwYD
 3Nyd9lE5DzmMrbLMRUJJ90baVyeF1mgP+UWwlyxCGFkyu2qyp6N3Vess5uy/i/A9eW7SZuPBIpo
 v9c4diafkRJjvKAu2jsnF6Z33QMjZw==
X-Proofpoint-GUID: x2AoR3VDHYdkgFDZzWZekX6jttV2sAU3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MyBTYWx0ZWRfXygWCfOcSBA+O
 PlxjOYXQ9AW84BojQCE/q4Tw/51NIg7nVxozY4kxiDeMaHHq3Evu+QtaxSDSML9/BL5L2N94LZf
 6kwLz3ewenU6kEPnyj4iOUD0hPhT414=
X-Proofpoint-ORIG-GUID: x2AoR3VDHYdkgFDZzWZekX6jttV2sAU3
X-Authority-Analysis: v=2.4 cv=WOXqzXsR c=1 sm=1 tr=0 ts=6aeca8a9 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vP20N_l1vn5n2xwiar8A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2611050063

Add a small helper that converts ALSA channel map positions to the Q6 PCM
channel identifiers used by Qualcomm machine drivers.

The mapping is useful beyond a single machine driver when exposing
writable channel-map controls.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 sound/soc/qcom/common.c | 30 ++++++++++++++++++++++++++++++
 sound/soc/qcom/common.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 83b745f617a8..29b2df21b765 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -6,7 +6,9 @@
 #include <linux/module.h>
 #include <sound/jack.h>
 #include <linux/input-event-codes.h>
+#include <sound/pcm.h>
 #include "common.h"
+#include "qdsp6/q6dsp-common.h"
 
 #define NAME_SIZE	32
 
@@ -327,6 +329,34 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 }
 EXPORT_SYMBOL_GPL(qcom_snd_parse_of);
 
+int qcom_snd_chmap_to_q6(unsigned int pos)
+{
+	switch (pos) {
+	case SNDRV_CHMAP_FL:
+		return PCM_CHANNEL_FL;
+	case SNDRV_CHMAP_FR:
+		return PCM_CHANNEL_FR;
+	case SNDRV_CHMAP_MONO:
+	case SNDRV_CHMAP_FC:
+		return PCM_CHANNEL_FC;
+	case SNDRV_CHMAP_LFE:
+		return PCM_CHANNEL_LFE;
+	case SNDRV_CHMAP_RL:
+		return PCM_CHANNEL_LB;
+	case SNDRV_CHMAP_RR:
+		return PCM_CHANNEL_RB;
+	case SNDRV_CHMAP_SL:
+		return PCM_CHANNEL_LS;
+	case SNDRV_CHMAP_SR:
+		return PCM_CHANNEL_RS;
+	case SNDRV_CHMAP_RC:
+		return PCM_CHANNEL_CS;
+	default:
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL_GPL(qcom_snd_chmap_to_q6);
+
 static struct snd_soc_jack_pin qcom_headset_jack_pins[] = {
 	/* Headset */
 	{
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index 37b185a4968f..2b1d30230d77 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -31,6 +31,7 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup);
 int qcom_snd_dp_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			   struct snd_soc_jack *dp_jack, int id);
+int qcom_snd_chmap_to_q6(unsigned int pos);
 
 
 #endif

-- 
2.54.0

