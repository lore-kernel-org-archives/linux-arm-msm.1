Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645512;
	b=fx6mSM31sEXbrtgbJ7bNvCRoi0Gaj2AqRkJoR0VP/90eL8b10K8a8ytj3cA0JBIceU+d
	 /GhF6aseUvd5Qktl7Rbv6kCKtl6914U2w5wOBych/ATzC/gP4fdiVZPtK5PMOJPh1vNyx
	 GCqD4mRYePwmu5T8/Bxtes/7/gqdSZZyEqYTQeTjuqddXamJVB9pZzUSYjMhCmEHY5YP6
	 WF5ywws20HJOc2ObGiJtRObK+QbjC9h2d9A8ytz9saoJsx68+2r974ROjZ4SQZarSudFN
	 TVTTFRAmeKPZwnWtWSt3dOVCDGYFrXR25yJakFOkFHw4bUrpHOKWl/DtcFAez1SbsBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645512;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WNOiUjUmcTqUWTHbfySznhr3/MBwOYyLcfmg63ivkF8=;
	b=INbrNlY7G5yS8v01ahlnhhjogirtqB2T1LUFW3b+vMkP7tSlF6UGP3Xsg33XNxtvefrN
	 yxmaXPlzlbbeNrKNH3tv8kpG4LqTVAQLOtPBJYfpKLQ6NPAKp2YAXv5blCOVJgZN7H5So
	 u60CMAPe4rwiEATUJ9agWP5UzJQpDTgwbNQtiSuzyC/7AE3zrCLwl1IUxYYGt1OJMjbvH
	 EnFf/KnkBlYmAK0c05WcqPry6QcgB30lDmWaVagGnBIhTOOBMvEbl7wrHu7rXWXn3gCan
	 ZDMk3GbUff1RVkf4y0AeV2KzvVDbwlhEU7BjBT+VWrB9ad5vk5T3LM2Pq+ngZhXl0nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l7kYbs0O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XZnRuLdj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A6E606A32E
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 08:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1A6E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l7kYbs0O;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XZnRuLdj
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE60v0E2891064
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 08:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WNOiUjUmcTqUWTHbfySznhr3/MBwOYyLcfm
	g63ivkF8=; b=l7kYbs0OKPtJ1adry7/YU+mlEXIUbCAOepo7ud2mCYOIvLhohU3
	9bp5Hn94SZn0+7D7pnTFYONt6duqZAJ8719PeF0jHllQUxCHdKSmdP9YXrMXf5SE
	RXaMQdIaQQLqCFgcToTev7JFOMAoYRAAwAQ+7ukCevHdEenit9PWaOAd0/+BkNvA
	Aoe8qs4EZs+3me8o0rBkIhsYC4j80jpp/xJWfk+xohJsq9iXzGRvxEHI/ZxOk55z
	q6LazgtujyTbGo2/wYfbbSjBTpDPm/hzNnUIWGrep3V28pXKViq+CXi4BOUdSPQz
	fMS5VWMlcTKnp6An+crSjwEFfUcGey/2/SQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx0beg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 08:38:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b8cef34b43so2564953b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 00:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794645509; x=1795250309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WNOiUjUmcTqUWTHbfySznhr3/MBwOYyLcfmg63ivkF8=;
        b=XZnRuLdj0B+5Ah90ToZnqSqL/2upa0xQesXn815meAswLAC2F9L6E89PNPMtXZI5Md
         ZWjN1WcLAxo5N+Sa7LuOeTymdso8L7iyNQN4i8F8aPMZWKDpr+ptkKydxgO0B1tO3/IR
         HJdwem6QU8fIqJZJpOyrXanbAGdpAMpnoUQlnCVpfDtZg4xjDwllAaFl0bpn7rkBF8Ik
         OptyPdo5+XJwyNGa22NLlbkzFr39PLVH1nxzzJJo7Pcr9k7GwiQ9BuuXkPQbJLPJL4lg
         L/nNsBuFLl5ZNe0Kho4p820z+qwUW7uRoS0dHOXXCR8E+Syh3OnGvLP0qsHch9VIRf02
         aPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794645509; x=1795250309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WNOiUjUmcTqUWTHbfySznhr3/MBwOYyLcfmg63ivkF8=;
        b=iJaniq1tlzQkD6E9Ku1AzyaIT3/wVrplyLCl2fQFI6/uJ2fy2uAeEg3zMXSk7NTMAi
         A3YkP3+VmFMLDtc9k8VNCeDEET7Iw/ifY1aW10XvKy/karjPDch86hFEmQwNc2PKxC5Y
         v/S1uUwyMBU384Cn17RHGokP670EykfwolCPhR9z953yukB2ackHQMXKqeXyTj0JGqGt
         zdaDYYz1JBAuhC/ZfUH4/81z0vmoHPR2QemIra/K+HwPyFaRz4h6FwYN+tjog4zDbBDQ
         E9D7eUl9Sy8yBq8DH1pJLb/K50x7ISxlsrnphNp26TaAeRRs0e7J6vhO05UHc9ptavq2
         wf7w==
X-Forwarded-Encrypted: i=1; AL+hErGCVv2Po3lYigxVAYPlQ/fx6M5py1BXF+Ow0CjSswryKvoTFdm+bOXx3g3WeYlgiULJu4wTqdN2yYuLtfNH@vger.kernel.org
X-Gm-Message-State: APuU4Z+oj8mlL4YWiLAD3Ao1I0oQgLZcadUW7NjjA5tb5otNUbU7mLXm
	NirNDMTTQvowsZp5iy16ycW+h09p5qvlAMld4MYSymfAzrHF1T0NznHoIlEWRtY5tphBu/Xyicr
	skSc5obCqy2nPhF9QmfV45DQ8SGuKZaxRHIs4Gtyy5fGcpyXEsjAP6g8K79DKKmBS4n14
X-Gm-Gg: AYBFou1tERN7cxdzAs1vlW5xrW2NEk4guCDIL9ARY4KvI2Xm6ywfwJNekx+A/NkZQoR
	wIlJXTmMLKu5l2nYveYaQar+61TQKhKGT3GrdlLH4/NeJBdthDU+Cs/YyAKA5TL3sqvi+dM/5tn
	vlbJA75bTTXi4S6mX2+nH029pdUR5at6yxw35FSOOpDtfI5Yuk6xt3F/rbbRLH0MMHKX6k+Nnm0
	F+OIQQWqzJFzeFtrUTa/emcqHfMF2zajZTqO9G7UdGfvRGM2pS17URgNlejdXdK3jyh4SmFgLND
	rcPWdsb3y9pfcOSHG+ZUZ7FV9feaANFtu6usowYs0m9lSYvgPdrU/rYd4966PBO+9vbIHZ2iX1Z
	5dChEDuLCL2AW0um4fZpN1IgL4VB/jQFX83YnHWoMqV9UvmZqXkjyLT0FF+wmnxuSHVt4aj6Scn
	RVz/ZIZW5lRPhp+H4Ysoz/TMJUIFEHSSopo3yt
X-Received: by 2002:a05:6a00:94c2:b0:8a0:7ba9:939c with SMTP id d2e1a72fcca58-8beb5fa7a5dmr4741524b3a.11.1794645509479;
        Sat, 14 Nov 2026 00:38:29 -0800 (PST)
X-Received: by 2002:a05:6a00:94c2:b0:8a0:7ba9:939c with SMTP id d2e1a72fcca58-8beb5fa7a5dmr4741509b3a.11.1794645508973;
        Sat, 14 Nov 2026 00:38:28 -0800 (PST)
Received: from ap-kernel-sh04-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a818asm1957623b3a.17.2026.11.14.00.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:38:28 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] ASoC: soc-core: reset rtd->num_components after allocation
Date: Sat, 14 Nov 2026 16:38:06 +0800
Message-ID: <20261114083806.905386-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAzNCBTYWx0ZWRfXw+QHoyJYrfaF
 1D/N1g4CMFLbKqRoxvZ4ngzdodrfbXWN4rVgy/aiIZyV6VaNtfvrJ/tYVvLfZSZl/gEvg2H6IKE
 hEDyljucU6p3yz6XS1EsrW7zocQ/Vl6Zr6imjdj6jNNsOCtRT3mZ+vy/3d8KCpvEvpN5yXE+S7S
 ebhG+ewRxtSP/MyyWmJ7mfgPqA+HEVPNh1Ld7aRaOsljarCOldOkHzCb7eXvbVKqWMSeLnw3cvA
 YniohJWtIeCYWSzzKrWidqgsR7KFJ3ax9S7Tqlz0wTtgj+8zrh2x0MyJ+G7/ioHE4C16A/4QjOj
 s1+SJQ1SwI9l1XdWrOYul2qeov+ZAyq/8wHMk9BcSARAtkhZcYAAtMqUkkfhBq6Yot74Bbz4n6E
 SGlrOynKD0B7bcQie9toxdbd0K7fn1S82kVFo9fEJon6jtV6wsvwOpqXHlgZsGlVhyzjRETsPJR
 THVL5IjYtIK05Oqd5LQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAzNCBTYWx0ZWRfX5iYLl4AtzEzO
 /pvbbkawOe/huyu0WXmvQNRekgDigjZTdbwWsI/n6jmJwV3+Vv6KqjiGyNHpBAR4MsdYOkEZg3Z
 ERxujq+pUPagRDe3Hl5kI+sJDFj5npY=
X-Proofpoint-ORIG-GUID: JyjXqRFvRmWfwjvLR3U8qMdFEUXlBTCS
X-Proofpoint-GUID: JyjXqRFvRmWfwjvLR3U8qMdFEUXlBTCS
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6af81e06 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=WB67ehynkFPZg5LeWPYA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140034

Since commit 4dd10fbbeb9c ("treewide: Convert devm_kmalloc() family to
the devm_kmalloc_obj() family"), the rtd is allocated with
devm_kzalloc_flex(). On compilers supporting __builtin_counted_by_ref()
(GCC >= 15, Clang >= 19), __alloc_flex() initializes the __counted_by()
counter of the flexible array to the allocated count. As components[]
is annotated with __counted_by(num_components), rtd->num_components now
starts at num_cpus + num_codecs + num_platforms instead of 0.

snd_soc_rtd_add_component() however fills components[] incrementally,
assuming num_components starts from 0. With the counter pre-set, the
real components are stored past the first N slots, leaving
components[0..N-1] NULL. for_each_rtd_components() stops at the first
NULL entry, so no DAI link component is ever probed on the card.

On Qualcomm Nord RRD board, this shows up as the sound card failing to
bind, as neither the q6apm topology nor the codec widgets get created:

  snd-sc8280xp sound: ASoC: Failed to add route VOUT1(*) -> LineOut INL

The same kernel built with GCC 14 works fine, as __flex_counter() is a
no-op there.

Reset num_components to 0 right after allocation, so that the array is
filled from index 0 regardless of the compiler.

Fixes: 4dd10fbbeb9c ("treewide: Convert devm_kmalloc() family to the devm_kmalloc_obj() family")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 sound/soc/soc-core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 470c233d97c8..5aab81547157 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -368,6 +368,12 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 		return NULL;
 	}
 
+	/*
+	 * devm_kzalloc_flex() may initialize num_components to the allocated
+	 * count, but components[] is filled incrementally by
+	 * snd_soc_rtd_add_component(), so start from zero.
+	 */
+	rtd->num_components = 0;
 	rtd->dev = dev;
 	INIT_LIST_HEAD(&rtd->list);
 	for_each_pcm_streams(stream) {
-- 
2.43.0

