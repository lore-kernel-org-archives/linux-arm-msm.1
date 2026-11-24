Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517865;
	b=4Ws7dgE6NjVRd/PkqUgZfRnP1dILE9/GJs5C5iQOMBvBeOyL6mP0bIzZO/UM2PO7CDPT
	 epU4NJ+en3SvdHoBCHgTKzxnJOlcUOUxJwApu0itVSQH0HktAZZj8y2GjQKLhgURPNSYI
	 knhsiXJTuKRX4JD7ZocA8OC5Up9yqCZ8OlsRkiwj2PjJHVq1tqpU27tAoCI1J9PLfKqvX
	 e0DRxRxQPw98Jar6kiB6hjeiob6AVJbmPoMv7uLfCu7Dtjr5OxC8w8Imc1hfu1zQbLhgM
	 GQ7cTEsK5DgxP/3UGn59O8vlPNWEAvCVhmEgsea5n/yVHQQzuNiAl1PkOz//Ezd9eqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517865;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nloSIy9HSsdxB2tu0WY1d4bUbTGa8qh7KGe6t42jq8E=;
	b=5pRlUjwMrvUBukVW57wvGEcu9PrpMvFIUr3sk3dHktDGLOPt7DDcN5IucDkjNcHAqvzg
	 VHhrhnXdApZAds4fRCJcqQxM1rPvr2/xCG4KEt5SIXeWVG25fCqPw5Zsy7Ueqlv2Oy5Sq
	 7QQRWBdWSBdAXChX6p3Fxpt5x+DKvtUMD9ckp3LIbNulAtRpkZr7lPP5XXo22Rb9XFKpf
	 eZpdNlSMs+ryAJPwoEDofWpWlmARqqbGDDmpLoPDnpleP6BFLm472qwMaMAQ0LB/BCr9s
	 meb5qGSC9JzEmBdV+YL65QBFOJzPCbgPVK2nla4ZqPuqthKfePRO2DzO+efTBI2AMaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PADmS5pV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="conDt/ot";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C68606A336
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56C68606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PADmS5pV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=conDt/ot
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAusH3749660
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nloSIy9HSsdxB2tu0WY1d4bUbTGa8qh7KGe6t42jq8E=; b=PADmS5pVGNonpS2P
	6nvISQVNMQBcj5uKQcuj8IHQCQPjoXJrkK2phnCRO2O+blDDAg6hSS46Y/HcP3ES
	Yavi4faARZn31DJXKyTwNmoxj1/g7VtKP/BHvNjVj54wMB6U204oA+44IDfaPykE
	9X7Kl7bppeaDpHGgI+rUNU348A3MrqflFkiyi/dyZ3gLsltoVyychBwo4tUImsVm
	B3GEyw3FIzdqZkaa3PW9yUvc2JjcasA/17r9O3phhWscxozyJ2gCOFK4vCNJhEOy
	PGhflC5oJtsoC9Fw3Fe54Yf6teXbdF3ED9dFepn2lcRDdrUDCRuKvj5zgzc/WXm8
	2seHZg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvb2bgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:57:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495c71055bso833470585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517863; x=1796122663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nloSIy9HSsdxB2tu0WY1d4bUbTGa8qh7KGe6t42jq8E=;
        b=conDt/otMk5JpAFZw/Wv53qlIwrADH7ZO+4uLHzaTqMHR76ynFSyvIr6pQczQugSR+
         D4aDE2B/8SUo4ITjCMrBHlVWlcAxM0qgYLXUOy/z6r03twh+oH5fATB8nVj+n0HUDhR1
         fO8GF9uadCNNhMWTH7L+QvS4yj6wdbE9pNerIBtMB+Nzo99ynfsfD6Ity7NVaUzGJ2yO
         1eSUSyMT7/0aWwdQXK+zFkJXIBnleXzRJ9/6VGFKx+lsY//5IZahCC6V5DFDTHHA3YBP
         f9Rxg+PJObcqUnnpzwmYYqnMoH6xfQBmCPhj5NmCz7sWMg7TblxYy+/IU4iwGma1Hmnc
         /ZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517863; x=1796122663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nloSIy9HSsdxB2tu0WY1d4bUbTGa8qh7KGe6t42jq8E=;
        b=bzX4MDpDNGF41I/lc5XJCDrIfvtpYNRB9TRywnuq8QvD4q9OV5Z/nSjd3nQgcuRxrH
         WxhL2DAt2iF50dTlxAcyl+tuznS7baqAm2klu/fKW51lKppxPrzTuMxCKaOhjDg+uWYx
         JB3TOlAh2DuC6s/qfs9iJxi3ZMKdvkySy6CzG2Pu5WrrqhxbfmBpSoD+qvCTTlwZ6sKW
         lk+HzLwrJJ3jA5NYO9T8pmIxBLmui+UfGKmLARTHd2B2rT1eHh0wSvxbED41fj5EzQfo
         1Qfcstuc+TMuLVw67jyJEDI+cnrTFdeBULYKtoJIanhjHQyy2Ep/2GDXSzWrVBY8h3Zq
         QKOw==
X-Forwarded-Encrypted: i=1; AL+hErGfi9ay/XjiCP/sqAW0cAKFfDcbibRJ0MFzst6Mw5No9ZUd/JUy4TwsdQtAW0wsPU+dzx8vef43SqDxEjr9@vger.kernel.org
X-Gm-Message-State: APuU4Z+ls3iH43p4Ha9kZmLVdqLnRGj8afefMLZNa9VHVANHcyIVyuDi
	voCY+YWjFE06dWqQAkmSnH8EZrLQRvH0kPl91/y+6OmOiKHNnBTHEHeyZSmFF+NX1x3zNgy5PLO
	D7WV48ymvR/rGa7IJrLVczzuhggpBwJCHTpcDdkskP7wA9C51m9leZdVAFEczc9UBPGm8
X-Gm-Gg: AZFdTZdomXQeKfOYGbxaW5PKEwG3CbLgH2P61i/jcAhoAAGT4VIMokh4DVOdqzxER+P
	XssAs4io+NC/BcDkwPcneVahDk1LgyVg0vnqauyrXbbgN/BCphVBGOL7KmrkOuw2kHDpCU3BFq6
	T2of5ERFYmaxPDw2BxLwXOwJHzbipid0Z2QetkJQfenyhBGxQd3+0iOkWDGRXOtpUti5Bq8nCrp
	XlUV5vke6nE9GgV42A1Ky9ybPsT5oIESmcYoBO4T1Z8jcp0q+5Rtnp4I7aE3wFTOyB+nUwa7bS1
	q5FDwCzDCoyA9nLFlr/+mDYDG1ATAEHQLMMFtETGgflKPmWBhAp3EvBIZetls08qDLxiRxm1ynF
	c6oeJUNmm0ds0Q2H314YoZR5DCmg+BBaoix46hTF8QABxPPa+j3v01BDh
X-Received: by 2002:a05:620a:6910:b0:93e:d1d0:67f with SMTP id af79cd13be357-949bab34f38mr2526841685a.51.1795517863187;
        Tue, 24 Nov 2026 02:57:43 -0800 (PST)
X-Received: by 2002:a05:620a:6910:b0:93e:d1d0:67f with SMTP id af79cd13be357-949bab34f38mr2526838985a.51.1795517862677;
        Tue, 24 Nov 2026 02:57:42 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm612415085e9.11.2026.11.24.02.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:57:42 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 12:57:24 +0200
Subject: [PATCH v4 3/4] ASoC: qcom: common: Add SNDRV channel map to Q6
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
Message-Id: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-3-1197ac8eacd2@oss.qualcomm.com>
References: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-0-1197ac8eacd2@oss.qualcomm.com>
In-Reply-To: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-0-1197ac8eacd2@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2144;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ayAkvqvWWjXrTXzEXpTjRN6OIpuoodqIjuPUhdOs2jk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBrBW2et6NyceBZC0SKzQ2lYIgo+wv69cNxtyBl1
 t5CSC/KOqiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCawVtngAKCRAbX0TJAJUV
 VpJxD/9mZsgQfJP4wsxWHq+zCG9GJJHOPxcXFLGE/6pmQLSvOncUz0n1S1azU6NuFHaISSQXN+k
 VOdwd7x3V9LLqrVh9DOwKAUA7Xn7h71mkpvQq5w8fviQgz5GOhpCcjct6lXSRvLybd2RRp8Pmpo
 0xgRkgbMDCQJNTGWdg3qrXO/C8LcN/RHetzQQcYqGIztGrkg0b5aDcHGjjxRS37cR4H8APcDvP+
 Y0LlbAHRCmXMLqzoNNrbjzXrSpXSQRFWdaKDoYTl73xTdSURc1XtPzoBZnyuJ/H90pTUfbknxX5
 moxKhalYsmINilbSTkW7aqHk/fD3ei2lnByc78cvYwcFJHhkL+7H5TZDwsX+bZzek7dvfqD9eHE
 LDw//v2UuXORDpa/xKcDeShUI2wHBmKSvDAgR8AyY5FLBCKpWIrP3MJkDfagm3S+s0WPdQn1eAb
 d5NMTVjGwyYZIiIdKPkciDWDc5li1OP0o6bNgDNjFAF9+S/fxRpkCXsw76lCRIjMh0Sf3Cnd8nE
 Jb2hJ9aqHLJ0/1+AR6QCyARZsIX1D413Qdjxygo+1riUVl+MMeAfXgzeGJuBij2QblcVyUQ75GF
 jhJ5YoRVDNOR1K0UCNwjt2AFZwPgVrz/0top3QCrrzCp54YdjU8rqkVQlwCpRFBKu33fLepTIln
 MMa4jWV+uvXZDyA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6b056da8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=vP20N_l1vn5n2xwiar8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: orLv1PWTVthKzw6Vn5CevA95ss4HJhO9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX5p4T/gHIGetw
 NA6pon6R3ZjCBR8tEfvC9dg15eC7BoUPMPzx/3uTOyGaeGBdICXpViTBFwOU0i4BemAJNChS/g5
 90GrFsDCycmu1yJD+KFw7d4BpJtgiZM=
X-Proofpoint-GUID: orLv1PWTVthKzw6Vn5CevA95ss4HJhO9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX92S6AJ63kGEI
 b5qpZ2DNtEqvDyh4aW7ietw56lviprkLapxUwXZ/tF4jhjChygg3dmyqiAm2BH1FzqqtTfVELPw
 kfnydbVAsOmMseNgaDkTKQyKBudsECJmO9MS8sVOQp8TW6rNhpxbgYh/p6n/1f05M3BHIYoi7X6
 rM4mOeBDyLUs3h6lcKnb/AXkhyu7gAukq+mNzOzPAPCci/ewpghdWLe2Qi2pQIkZmIWuWhVuNgH
 VTYti0pmIuGY7FjJdMGGN3fRyzAopMhwDDtfQoxFwgQTw4OUmuKxRvoj2gS1gN+9DG2PzRlbkE/
 Wgilimf9mJzuPmg287XkaseSIsxTpWTD6j2fG5NEYG4Zt51UZjXc8ODnOE4EQUp5bX1N0OuqB5s
 dv9orDqIHwuMZvIP/ilF8zFOGy181uN7y+e/NGNr01/jGA4GFqe5ZAkxSco3lKuwRI+22X3GDL8
 z+ZCTadz1NAw5NOvnuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

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
index af5cacddf67d..695350d2812b 100644
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

