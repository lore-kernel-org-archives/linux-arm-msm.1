Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793240638;
	b=wHwO5BUtkxw7mG+z3trGroHiyIO2PPngPy+Tsd1qTbCiQ9j5Kdb1LskCPzhlTaREMqPw
	 FLxSYp+YV475oeJqfTd9C+g0XN+SvcIhpZiAS6S3yjeBM6ndkpjqa2J0kWGbJClY7fhDp
	 H1girI9Ch718b13bB1yakm4lk9e5+yBmSUCOToVwwb4dMOcETCc+Gbl+XhTHGF16B/sxH
	 ZpRbxS+s99O5QlzhCNsXiKK5c+HUf2kPEAnKRXjX7xGnJm/0OopSGKZr8MzWMBbu2EknF
	 FiW21RVBTaU0Sw9b9ViEQSQLWS6mT+SWQ45i0p1ogUypHLLK/KtzStbXbrsPrvh/QHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793240638;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3oGkMQScRX/tXnQ0sOZoQxWWvmtTrIsdcCnCFnpOWw4=;
	b=xO1uh/qBt3piIaCTt6f952yc+5Hl4057L8+hYA0XEUDfTZry75lwk/y6ckhDdrMcbJZY
	 Jm2HuoJn5VySB3Ycl1PurIqurRiIw+WtKZSQ/8O2i1agcYG+uKwPcIQL4p5KPpko117QF
	 MHRZL5F4biXXwG8RPBochL9s2P2G1aW6bf3I+wjSZGIXHJvgTfpkEy1nsjbiVIJKvjU38
	 z9BJM53u2rSeaOP0Bv6q+fF2VlkoL/Qq2V44omcjZp9+gQp68m4w1JcUF91aLt+Ka9qfT
	 uq3xmlBYzC33T1PhSlgrXy9JpPLbb6a4RoWDi2nb0vt/nZXq2ikn+eMl0cKIqFh2lcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="pF29xO/e";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g9L1YRqc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5FB606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 02:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A5FB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pF29xO/e;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g9L1YRqc
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1kEKT2523941
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 02:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3oGkMQScRX/tXnQ0sOZoQxWWvmtTrIsdcCn
	CFnpOWw4=; b=pF29xO/ed88eqibe1Q6JoJwYLr98Bqm7uJz7KkOflvyXwhT7i6p
	EXnDOikekI1AEGIAuab7AVB+4yX0Hof6mGo5hAF2SDcPhOUbpHteuxYTQKGnmgC0
	fUcP/flS00Ay1gWg4oy72q7ZvhU7uRtgNBTK+6bUvn8M5teFf2d4BY8Wf5/47mxf
	nVP5QtVr7rZ7TGVO9nTuuWu9F83pConA7FKbXxSJ/pbhRYA+uaoKj32NfdWZRq+M
	/8tz9ms2zCyQ3+hhZIopagfL1g/kA/eTYHNb8/gvaOL+G1ec571+zQpneQGe9NqM
	PbdqvmchHdnzFcvx/ClYEbRbGOjmEaIelug==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknkp9qqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 02:23:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso2958400eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 19:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793240635; x=1793845435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3oGkMQScRX/tXnQ0sOZoQxWWvmtTrIsdcCnCFnpOWw4=;
        b=g9L1YRqcaD/8gf7UZE8gmidcB1nu7ho52YxnPIUhC4CZ8LummyvwGP0YvOBslBC1AA
         vvjlrZI5wSQ7skeh2ReAiJhdBMMNj9F+LpmkqoCKUSDTRow53Yh8MCFMSqUVQBz9kftI
         i5bbYjszg71QPvkAhZR9UVBgv0X1VqMYRYPPQElEyk2rRTL4ZpTNmn+nWA602NBVrezM
         JPmlF+MVXxg6M/Z0MpwRSvWUAzdz8penrJFThDca0yMUpyS0PM6PjOjOjT3jj0S5f3Fi
         IhM+5DnzIbR1L8Dw+FaJCJbJG24HKrCFF84saqsU9j/6cx8Y7PDRGAfeXgQLcy71QyDC
         XQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793240635; x=1793845435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3oGkMQScRX/tXnQ0sOZoQxWWvmtTrIsdcCnCFnpOWw4=;
        b=THsu60Js6rb8vKTxcr25In+IU6iiGkHf052bTUNAhHgiJxSJZqsiY1/pKu2fJ7Df20
         wHHtmRWcuv2GrvsYEZZFGm5imuHgvUqoZLRLxBi3HWQ/YsT9rqVbFclY9/q/LdMdIMAa
         dN8TWsvTS9YwGoGhBY2hhpVEMK7jrlKS8qCvwJVqgymhziWQwy1JDYHhBqL6iiaM9BQv
         op6Z028UVmPxczvUO52jeDtOIe5xklrEsUGbVYI1Gx4YE5BOkv9K8JNG9++A4gmMTW2W
         wizwkl1yUdtRxR4VocwSYHppSCQ5mU57aRYGb6SY0w8KwULJG/b4MFWGYGrl9KLt0j3K
         Aoag==
X-Forwarded-Encrypted: i=1; AKwUvBwWyqxIn818RFtXDZJ5A3OavBb3nphxnxLXhBe+KqRNjmDkAd6zPNHQh2HYV9mnekqlBmUvDEktAngT4xBs@vger.kernel.org
X-Gm-Message-State: AFq9FYKuXFtD4Y6WaYDyXX39DzYQ2uhAWStaDeRWoYul8mVXxj+xOOW7
	QPGuKxzLvzjyWmflqFozOcIn38yxh+k+2s4vr3iSpT3GnNJq2EVqf0sb2e14LnDyub0emRoE4pi
	2Y7Y03L9730qIFXdv5kkSfrfuPrQbI1z20IYszZHih6/sBDrScZXVVT8R1LQyPldNQ091
X-Gm-Gg: AYBFou27Hm8Jh/a2pZgcZceO9tznjhQgGnfbEINpP8fViMqlxq4FtfmweUIqoc6nL9t
	yteSOsIrC9YxCv50y1Fr6eemtdIOCf4edmPcI1bdO9MV2PD1gv98a0h5NCF4MObDOvccPqC+O2N
	k4kOZ6lXjB+LLBG7/megMUge451yqtnbJ5TEL2j3TfGdIPdo4aJfkZtdKkpHPcU3CY4lZNNYeVZ
	b0QT0GlZT3j+33AShVpyndQ6lpiqf6tsIuM24RT4Zc8oVMt1aem6RcYT7kT2IZHGQ7QZ7x0hury
	0+qmU8khJJT7kCgNgg/AeP2SzhKiygP0PHBkbL1CxIWUjrMiqpScjufKWQh7PmYf9xXBAKulAiR
	9xBwgF0gPNsIBQmglFgRdpjvotOGQcuM2EizTuGQbZMGaZrn6ev+wgaBItWaTSMx7mXgPyowNq5
	h3PzbFueVrQXr5snE7fkhUmNHk9bQsPqTf
X-Received: by 2002:a05:7301:29ab:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-36a201b1d5fmr5702502eec.28.1793240635023;
        Wed, 28 Oct 2026 19:23:55 -0700 (PDT)
X-Received: by 2002:a05:7301:29ab:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-36a201b1d5fmr5702459eec.28.1793240634343;
        Wed, 28 Oct 2026 19:23:54 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23951e00sm15112588eec.20.2026.10.28.19.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 19:23:53 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] ASoC: qcom: sc8280xp: Derive TDM channels from DT mask
Date: Thu, 29 Oct 2026 10:23:40 +0800
Message-ID: <20261029022340.591372-1-shengchao.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Ju9kP84C c=1 sm=1 tr=0 ts=6ae2ae3c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0mQFbbcutK90DCAcDowA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: -zZSQxua1OyObZtVNRqp4-DKKutHhGzu
X-Proofpoint-GUID: -zZSQxua1OyObZtVNRqp4-DKKutHhGzu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAwOCBTYWx0ZWRfX/fr43qy3lxYw
 RRT6wM9cJU0h94bAtuNG6OOa2ijscTGAITvKpIrMB4Glaj0KvQquMM83rgf2kJ3gqM8pVk7JiVo
 Zpt7EqbpVqPXMXUglmsNfs/wMukC9B8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAwOCBTYWx0ZWRfXwZBw1nxckzcw
 e6SD4lsruXnnpypIsnMm6Va+eu6E4xjTS6mxBPibJw8U/dilmz+66uvAp5gThE1PfZeTzGGxiCy
 oAtV/McFmEsSP/0JzdmcYPRLs1z4JHzz9LWtPnoKelOn1lcSb7nzaQiUUPGf8X8HuHrZoyXg8ip
 /c8bHRCsSjY2emurY9sZ9GL4cRMj7KHJVOMP1FCPCfV334zrWWTSPi6IECfXDRMrZaUPD3pmAlj
 0CRp6MEMGI2Dbwl2EfFdL848fA665koALHIUiRcktXajdtVNLN/+OPVoKJEsrDi50jDaM0QouIw
 Uo68+vAddRVQ6g2bfS9uULUxwkGSsCa27il6yXPfzGriRgDGk4nniEPZp+igjIrI97VlEwOk1zx
 4hUGiPBs7ECGbi4F3zHfIzebgm1pDq37YNAznocRK27pDULqRUljPR8QSPa9d9314996QSNxMvk
 rKmLtPGdj86CZpJ9buQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290008

Derive the backend channel count of TDM DAIs from the cpu DAI TDM
slot mask in the DT, using the same DAI ID ranges and tx/rx mask
selection as q6tdm_set_tdm_slot(), so the channel count always matches
the number of slots programmed into the DSP. Each board then gets the
channel count its dai-link describes, e.g. 4/4 on Nord RRD, 6/4 on
RIDE. Keep the default of two when the link has no TDM slot
description.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes for v2:
- Cover all TDM DAIs (PRIMARY..QUINARY and AIF_TDM ranges), matching
  q6tdm_set_tdm_slot(), instead of only AIF_TDM_RX_8/TX_8 (Rafi)
- Link to v1: https://lore.kernel.org/all/20261021025310.2072026-1-shengchao.guo@oss.qualcomm.com/

 sound/soc/qcom/sc8280xp.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 9aae6aadd43d..f5b147962afa 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -303,6 +303,22 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	channels->min = 2;
 	channels->max = 2;
 	switch (cpu_dai->id) {
+	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
+	case AIF_TDM_RX_0 ... AIF_TDM_TX_12: {
+		struct qcom_snd_tdm_slot_cfg cpu_cfg, codec_cfg;
+		unsigned int mask;
+
+		if (qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg))
+			break;
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

