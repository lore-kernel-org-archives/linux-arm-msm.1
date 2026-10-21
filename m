Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578362;
	b=BYk3hmFgjBmI10PlGegVzzNwMekOoBYOjHSjDmn73I7eSmSuecNwC8zjBE7RtCPO+2vy
	 t5XeTXqDz2NsZXYQ/VQ4qURN2gdIwjsXgaqhOrSf3+V0U8uytIShKIHzWSHWhf/raMfku
	 uK1x+qHV6CedXTq0h66YFW9pw75ogf4DsrD13uPLHi8mHtm4ktt9V+6qsabct1NOKOVzs
	 7WeA15lJmWcT1wHiGNP1+5KBbBp3td4R4aaSbsTRiuOKrvUfPIcXeQixZhW1ljRV4So0z
	 bb/POeK1lXE8UeN65kDpAVlPrsN62zmG9Ua0x0osLyFrrViEPd5fNAn2krRyHh42c0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578362;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EOWhiVv4/ocmTJM5+sdl3qxjdlmJ9j7CD+/QzH1dAKk=;
	b=JLjsNYzytIOquoIAkhrNU+vLmvxEkJalXZ/Nfr048lMo+1EeowhTEJop5ihwaB5CN2ye
	 2lJsmqWRreYUtasAX2+SE/X4lOG/s4PGpF4ETJ/lwGwnbKDitbWnohOs/MuW8MN67IFi/
	 66U9WBiVqFIh2+Cw/aaX1ZoXMc7ENyLzBqvJGzs0RUHiFxADbSWE0NvmiH+DAJ1Z+lXZH
	 B0JZpf1pi43iIQDQxvc2g03AlCMdCEHbXSjWHxtqVC/RJQ/EHcmSl912XolhN1nvIuw1I
	 kwU3qmBUrh7gCKimvFs1PoF1gUithJHB6DZh3SMVPK3xiKsI7KORG0e7giUMfqi1Eww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bik8YoFl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ggFU42aL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A59606A319
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87A59606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bik8YoFl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ggFU42aL
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LAJT0P1422103
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EOWhiVv4/ocmTJM5+sdl3qxjdlmJ9j7CD+/
	QzH1dAKk=; b=bik8YoFlOy/6XUIu3N7Ncy1snVNmCBlxPWuZg+YgaMIrbxnIRCJ
	Px3O4k7KKJBF0/HrSJlvvdGLtwUK4zyIvxKZqhMVotoDsAB+bVIwc+OYyS/eZik9
	y//8ljVNRmMogcsLYw6ShiKAxd4/sBdKigp57ZZWTrvLwRas+on3xcPzw7yMquxQ
	IJoIAQiy1i5jYeMFBIznEyMksNLP1Flt4kN5Cb6T8K0acEhShdJwhoZ9F26gSPlK
	UIVD2/WurYV4+6rQbEaDPKdbnDwSHVvv4Pb+MOz4hxuhwRxy00fCR1OB6NSEpoMR
	GV948w/UknOBAjAhSbmuv40B+RiAsvk+ZEQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhug0qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:26:00 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd68bf391e1so358883a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792578360; x=1793183160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EOWhiVv4/ocmTJM5+sdl3qxjdlmJ9j7CD+/QzH1dAKk=;
        b=ggFU42aLM7U6CZwGVFyMGogFmGxCzqaQrTUtYUQnfCLgdFe5bTQxp5atbZj33GNkGt
         AgfLxkH5H/FhMLqjfmr8QOhVXnT3FBg9TX69WU7GEGG6++gduAwmFhj6LQZJyGkvn7y2
         HgMi9i5WWFr1Zppd48lV0k60j6QHP8kz28Ox3QLbpagQ93k436qU1awr+ikFWEg9epB0
         N4Xe7SGuRwXYPpz9mU60nwgcNkZrDlCKexZnbQDRMl3cXpoHcpb4V3SxtZCSXankwm1h
         T8x/PzOZl3tYpfkQIvzPT1Muc28XWkIEAdSflwSAQklo7cNZi9tkMkm5YahYj5iME9U0
         5Jcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578360; x=1793183160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOWhiVv4/ocmTJM5+sdl3qxjdlmJ9j7CD+/QzH1dAKk=;
        b=K1zoKxg/hCdNWGt6yqPSwuTk1ZevTdxsB4pfMkmN+PcSpWS9TQbbowGCMWLG1p3NzK
         hZj6xkJTnyIYz3+Wpcg3+4NNHe/pyRAPoc+U0Bs6rS1Yt5wAFWlJkmfRusNzSirDD3uM
         5g5yidXJc3YgT5xt4zP481wd2eiU8va5WuQNAh+1mFtmOYWf9c2W/kHzavH07UdIHrEH
         b1KC6OKl0kNKwPIBRfX30wcb4QjROwZB3OKznjTISTI+gJ0XsBM7jivljb/tnKoPWQUv
         rnEBHoipmAlPRbHwtvYzx+JOOOP9SSfi2lvm7R294IY0zgRHaDxIC9ANiFXc48OJ3eK7
         Z23Q==
X-Forwarded-Encrypted: i=1; AKwUvBxoRYjP4x7WB2YyY8fOda5i6UkHYidGkLfk0TcvwA9zyWkmzrVzccQPoid1optICfJ07I8STbhQoOte/EVV@vger.kernel.org
X-Gm-Message-State: AFq9FYKd4bm3voYjc6p/FfmQosIwAg37A2xzTfmbkDbP8Vv6MamkkdU4
	Dt/+kjp+q0KF3nsOhAWG3h6A//lQJv5B+a/QM40uoPRLw+C566i3xVY/TchYNf0xqT9cs8f+00i
	2B96pAAGLLgGHTvuTtdsxg4d9JztA3alNX3qEPAMCOFf3rIGZ3HTatTrKnzAtvtyUZc5m
X-Gm-Gg: AYBFou3NFwtOHFExwGrpTEWfGSkqY4ij8YxTidLNQmYwSpTB3Q7iBreHRGbADhVGBno
	YrsqzfrKbiQqMSZ7HaTXplZKPTqvt0AIsDyLw4tIssx3mBMYJxBbpn+DeHpkMiY454+tIdC6FBe
	mvK3q/YbygjJLbfQ9YQw/O92KK5zmzXsqYZKW0pbQ2wrz5XmRTpxSJjEGXPw6zBXiONSyMVobsc
	3gVXqbapJ1I4sOOdnlZDqw4b4bpTHyjRbQVfMn0K2aMowRzqUzKnrVlqAf3pZr4CeWKtqQmwvq0
	z1ajMBfRrr/dvFlkxxez0q/To3GX0Q+hMn01wBjfGr5n2DwsKVTivB8yjMOx3Il+HZ8JFDBY5qM
	ObRYmtdoRO5kSt87B6dOoGPBEwN4c9lFdJcOOjw==
X-Received: by 2002:a17:902:d4c9:b0:2e9:5059:4477 with SMTP id d9443c01a7336-2ea43e4ecd0mr10804475ad.23.1792578360214;
        Wed, 21 Oct 2026 03:26:00 -0700 (PDT)
X-Received: by 2002:a17:902:d4c9:b0:2e9:5059:4477 with SMTP id d9443c01a7336-2ea43e4ecd0mr10804285ad.23.1792578359720;
        Wed, 21 Oct 2026 03:25:59 -0700 (PDT)
Received: from QCOM-yK68p0sug9.qualcomm.com ([114.103.220.142])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b43b53dsm9605915ad.39.2026.10.21.03.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:25:59 -0700 (PDT)
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Subject: [PATCH] ASoC: qcom: audioreach: support multichannel PCM formats
Date: Wed, 21 Oct 2026 18:25:49 +0800
Message-ID: <20261021102549.411456-1-zhangfei.gao@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad89338 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=6v2YnCli3sSGVZrDHOWw5A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=R2DrIqMIi5XekuKKXfIA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX+eKZKwmVg2Uy
 4f2AVr/yR3HTZKwWb13iwpPJn2WZWDef7gz/KJk0uha5KJXEjSxxv3s2wIrRJjZD5DDPrcNxWNU
 YZZwHbcsD/B3FKUqWNp6Agef0dhHT44=
X-Proofpoint-GUID: 9Mnv3jht7t0tnh40mD8s3az909WsoQE-
X-Proofpoint-ORIG-GUID: 9Mnv3jht7t0tnh40mD8s3az909WsoQE-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX2E1m0KD81BfN
 6BcNVsL8YVOINTUpIcoHEIqROL5e+cfC90pXpWnfK8A61jNoCsDiDdf/ExyMk2EE6SQz6w9M9ze
 95z/vQfujz2X+A6XYvcneyIs7sDIJ4AyvqwgzT4tJGMZqtXGYBMyaPjntyisSa2Pw8iFnelGsOI
 RAIKgFVN0FF+FgwoD58a9Dp6wxeLTA3httO4msGzo8SdcXWpjPbOZc+8fRYCe0cIiqX0w6H8ZiH
 BZQ4HrdS3OMXyIGKD5XII2eojjX0VDmA+reMMmxc6M6MTEfNGJ3Vg2Jr3B+Chku9a/txbICR42U
 GJaG5NZrIpYBkkFjnPFqBp9/0bdRCLv9XL8g0GxYTSbg7qdb70ma7wQagT1fqV7/QYCzHumoVel
 b78VSlq2zYlLIiKygFygILdcALcx323wk4Zz9aLfxKd+K0fQESJbYEjniirQGREPa/E47RwdBR7
 bU14qGmOjBwAi7GtWyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210040

AudioReach currently rejects PCM streams with more than four channels in
the PCM and shared-memory media format paths.

Extend the default channel map to support PCM streams with up to eight
channels and relax the PCM and shared-memory media format validation
accordingly.

Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 74 ++++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 12 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index d2dc5d37bccf..626cfbca79c8 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -308,20 +308,70 @@ EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
 
 void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels)
 {
-	if (num_channels == 1) {
-		ch_map[0] =  PCM_CHANNEL_FL;
-	} else if (num_channels == 2) {
-		ch_map[0] =  PCM_CHANNEL_FL;
-		ch_map[1] =  PCM_CHANNEL_FR;
-	} else if (num_channels == 4) {
-		ch_map[0] =  PCM_CHANNEL_FL;
-		ch_map[1] =  PCM_CHANNEL_FR;
-		ch_map[2] =  PCM_CHANNEL_LS;
-		ch_map[3] =  PCM_CHANNEL_RS;
+	memset(ch_map, 0, AR_PCM_MAX_NUM_CHANNEL);
+
+	switch (num_channels) {
+	case 1:
+		ch_map[0] = PCM_CHANNEL_FL;
+		break;
+	case 2:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		break;
+	case 3:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		ch_map[2] = PCM_CHANNEL_FC;
+		break;
+	case 4:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		ch_map[2] = PCM_CHANNEL_LS;
+		ch_map[3] = PCM_CHANNEL_RS;
+		break;
+	case 5:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		ch_map[2] = PCM_CHANNEL_FC;
+		ch_map[3] = PCM_CHANNEL_LS;
+		ch_map[4] = PCM_CHANNEL_RS;
+		break;
+	case 6:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		ch_map[2] = PCM_CHANNEL_LFE;
+		ch_map[3] = PCM_CHANNEL_FC;
+		ch_map[4] = PCM_CHANNEL_LS;
+		ch_map[5] = PCM_CHANNEL_RS;
+		break;
+	case 7:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		ch_map[2] = PCM_CHANNEL_LFE;
+		ch_map[3] = PCM_CHANNEL_FC;
+		ch_map[4] = PCM_CHANNEL_LS;
+		ch_map[5] = PCM_CHANNEL_RS;
+		ch_map[6] = PCM_CHANNEL_CS;
+		break;
+	case 8:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		ch_map[2] = PCM_CHANNEL_LFE;
+		ch_map[3] = PCM_CHANNEL_FC;
+		ch_map[4] = PCM_CHANNEL_LS;
+		ch_map[5] = PCM_CHANNEL_RS;
+		ch_map[6] = PCM_CHANNEL_LB;
+		ch_map[7] = PCM_CHANNEL_RB;
+		break;
 	}
 }
 EXPORT_SYMBOL_GPL(audioreach_set_default_channel_mapping);
 
+static bool audioreach_channels_supported(u32 num_channels)
+{
+	return num_channels >= 1 && num_channels <= AR_PCM_MAX_NUM_CHANNEL;
+}
+
 static void apm_populate_container_config(struct apm_container_obj *cfg,
 					  const struct audioreach_container *cont)
 {
@@ -1185,7 +1235,7 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 	int payload_size;
 	int i, j;
 
-	if (num_channels > 4) {
+	if (!audioreach_channels_supported(num_channels)) {
 		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
 		return -EINVAL;
 	}
@@ -1275,7 +1325,7 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 	int i, j;
 	void *p;
 
-	if (num_channels > 4) {
+	if (!audioreach_channels_supported(num_channels)) {
 		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
 		return -EINVAL;
 	}
-- 
2.43.0

