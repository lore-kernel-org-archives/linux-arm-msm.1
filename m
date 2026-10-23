Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775623;
	b=v0EiN/5b/DAT+QKUexSE804qbOm0DRxvYYEW15t4Ag+2bCHJy39d+E5TNyxrF7oKGAsw
	 gwoj4BW5+ViQgFNp+VuAI9gkX7aZ6GLXeoxoGgAmceijcZmhocx5qd7SvW9eBgnOJSKDN
	 jzpjfxUjHV1hZDcchA39m0oWG5wW3ad3eQS1Q0jx20xccINryYvkRuqWiTAsSAQn5GOhJ
	 H5JbwvS+OAnYTdRH2dEMlWDcuwnn7O6zxepvtY5S4KO2QdEzSpHRroIfNwpwd5HqfOLlO
	 vJDrL/yiwKltk//aDnirm4ZOKCX9AkfEblrlmKp3C7G6HXUa1OL8Ddp29tS0Y2eNupg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775623;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CUrQmn/iwVmB5LtqJVz7lG2XrRhl26j7ewBang1CM10=;
	b=LMFSbX34yAaqg/h7CfZvXwRaY7luCTO3499b8ww+dGnsqNsn9eub220qqRud3goOsuZB
	 OYPDcOWxpsXxphvdHlMUai1QhqhcE9NkHjZcH6Dd9a1gkmVxLCRd6qFq2VgfCXeyUrW0C
	 +346CyGhEMilofSybSL1+5oKY0+G2JGWoxXwMWvc5bRK/9oFP0dqPVkf7XRxCmjbqcy1/
	 3LdUq2EKj2U+sRRMykb9J9uDgn4gItCJQUSZ7/+36LXERe4KrvpbFKzmMebC1pvtr0hQP
	 WOUgv7dGfPFY//pqfYE2Frlbj2dHZl/aQrFYB7YdhxK31QXfB7TegmhOM+mZWjzRXYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PQy3lzNN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WdhkaLIb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD78606A324
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCD78606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PQy3lzNN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WdhkaLIb
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5spj4072734
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CUrQmn/iwVm
	B5LtqJVz7lG2XrRhl26j7ewBang1CM10=; b=PQy3lzNNYhVdY1PYLfvnG7ooPAz
	CQqsiVkuSvXDBLsI7btGce8Lo+Fvys02bFRioBMXzZ1GaMe/Gd/32L9AAKyC6e4g
	Z1Zl1srJd7iNdCK17MF70h0u3XFsJNu9uOgLQ7D+/kTZHfi5LZsmNPk/Yf8KEb0e
	7Sd2YwUbueX5d+6Jh8QtUczhyDCUwzkKAjQWrVAZ9arigq7Er7bOhhbwDwAVGZQx
	K2wGtyrh15gN3ryXeTbBF/ddU4BsBCTEPBVZEVy6qF6eOqIu5XBTjGJWFKTTwfHb
	T6WM6JOFN4Ot+f84SA7XQQQ7zuZfk9tU3Ez1Hfb2fWzwG2++hgs6+zoaBvw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw14vw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:13:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf7856ffso242550085a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775621; x=1793380421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUrQmn/iwVmB5LtqJVz7lG2XrRhl26j7ewBang1CM10=;
        b=WdhkaLIb3JiTSpgrhVaOA6zM6k3Pm2bVairPnuYOoMPJb0V+jl0EbFX0c9TO6FSmsf
         n7V62zx9comt+aqf66Jq5ncuKyElhOlXP2sdl/ey+Q0dh/w4jKhn0fNquZvOzGlqgX6U
         QTh6Xp14BahzCz9O2SozLbZmyN9Q2HnkLDV1VzTI6JhbB/+LC28G2TWBCBSi0Y3+qQSa
         GKabtKsgixczIYjnf36uxAAwbUeFfm4w9G4vfMoE6Od0/dPALqrUtXqRAauPS24nmPrr
         dd+at30UbyexZhQ8Cp+E8hK4OG0Ivvd6E3CGBuBG5gWkfZAvwf6pw0hkWGp7hPkcVVHL
         nCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775621; x=1793380421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CUrQmn/iwVmB5LtqJVz7lG2XrRhl26j7ewBang1CM10=;
        b=wgjMLc9Ey+0GcMgQa6uzkotlK2PQ1dWom+R5m30EiTTXpLlBy7rPjg84yTmf441tzQ
         9Db0KRLN6jZknzJXE7q3TZXJLYcKv7qJkwJpyISkAAn2gFjWZlE3aujfvuxsZyCRqYJB
         agpSFypv7GSdrgionaUIyGyxvue3ucmOeMqJiZwCJBJ2SjCHRdScl/nsJLHr6ax/Z4Sm
         /GmB1EuX3bxwSelEWxBeB5FZD1AmaxjTnB83vHyBaPAdR8sWOXQ0klry3jfM/LxIT0tf
         kH+ODuhuSJ8rlDBLt4C63qDIPBwbsbyd0o9kBiCSuiyhkncd0S1FYdglOVScz8k03zMy
         5qdw==
X-Forwarded-Encrypted: i=1; AKwUvBxin2NNgfk/d9YA6+V4PLoEDfFUMQ6TXmGvhZsrY51DxjEhJeZBV0FOLtgeDMWUQtUmrjBvxz7n0ri79es/@vger.kernel.org
X-Gm-Message-State: AFq9FYLOskK+WzQdPOl8VBo/mAL7c3y8OZcjBAvHatQc9rhBtG7naU/n
	NulLgRaG2vB/h240XvbI1GNeOApt3xQn6Qa3yBjGF16B1RPSnQH/oMG39mXA/w4Bg//ThD44uJb
	JsgWKx7DdRDE1AD4VCyUtMuQ0n9d9MWp28kGOKdg6dYw0YpFj+FttcgLdoadkSUAK9iWq
X-Gm-Gg: AYBFou2QQasSzLlPj1/x4M1n6kM95pCK55Qbbwvtya0/Ri0O7uWp2t+/4q6L77C/SGt
	4J4SFhIcYFsSSQ/D32NMvUAjndOornIwPZS6Gcjeqx3VNHEjT2PB21jOg7rwM7ZYx21oOtdqzhd
	c5KgsFHWzGR2h0fzWlw/9GmTTr6qdCmAa62a5cOulgtPglSaJ55u43k/XYcuyEQwM6H+7YGbvjX
	AFWGq5uUHkvCxuphkzDs4eBAmg2zCC2/le66FC+4FMiH5UrMkJIlktzI8XplcIFPVT+2NjZK8cW
	65j2X96TrLglhih9PI1mLX2FtHqUBXTU/i7ruEmtuY91w0aZ0T6/hlEGoy4xlVdwMnhL2LUbZe4
	+mHl9ck3js1Zl
X-Received: by 2002:a05:620a:4686:b0:93c:6f0e:8468 with SMTP id af79cd13be357-93f6f7d372emr507964385a.43.1792775621061;
        Fri, 23 Oct 2026 10:13:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4686:b0:93c:6f0e:8468 with SMTP id af79cd13be357-93f6f7d372emr507959285a.43.1792775620577;
        Fri, 23 Oct 2026 10:13:40 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4104b5sm1043841f8f.36.2026.10.23.10.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:13:38 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 5/7] ASoC: codecs: wsa883x: disable runtime PM on unbind
Date: Fri, 23 Oct 2026 18:13:14 +0100
Message-ID: <20261023171316.819857-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: u1_33A7eltTzEftHYvKIWLqxnXOEeZJe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXzjIohuTVNjFq
 KVLgfcALRp7ByV07i3CPOYV8K4tH3unBT3NVq5h9R+MRsycfHVAxYZjEk9nF34E2S+LifN5JcFI
 2mNZQiUO5DeJmOCPUD986kV9nwVPjeE=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adb95c6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=MSACiHdZT0qMT5F2yRoA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: u1_33A7eltTzEftHYvKIWLqxnXOEeZJe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX9YIIvjDjj9c6
 SxwG0C4GXvFRrp2sEc10kpQk8a15RsyDlev8m9/6UX0xJjop4JxaH/yfCvdN2DpnnvNM19dZmKe
 0w0sbrW9PmjzkJRFDGqKnIDcQKZPqO/GNwnaDrpq8763swI9/3VKs1wUSXb5Vug+kHZji0qI75K
 BLStINKmd4gzT9/vU3yyVJxa784HMmu+6/BNaI0MMn2946GXrCG+UDRM+ZIac/tIsRBmCT2avwe
 kMVBWBfr2WGAkoANmZKEncPCfweuwhsT8s7gRQPQy5qjpc64dP/Dn4PEv6WH7CkomTzY7AKcjqg
 KVxgf5X7RdIuz/AHi01xoxctDMp9cNsP9Vp6t4sPfWUX5ui8r+DisOqMpyCufuaITU8+dkdv4yr
 eWrzRABqIGB5kxpoj5OY94rEdK3DpsHQzolAT33GZM/L1OgdAdLXL6p8KZEDprCP3pjm+nJ24yJ
 hfczwBtIUrYW8Js5X6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

Probe enables runtime PM but nothing disables it on unbind, or when
registering the component fails. A pending autosuspend can then run
wsa883x_runtime_suspend() after the devm-managed regmap is freed, and
dereference NULL, as seen on wsa884x.

Use devm_pm_runtime_enable() so runtime PM is disabled before the regmap
is freed.

Fixes: 43b8c7dc85a1 ("ASoC: codecs: add wsa883x amplifier support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wsa883x.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index ccd4404c1644..b09ee3db7ed5 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1669,7 +1669,9 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		goto err;
 
 	ret = devm_snd_soc_register_component(dev,
 					      &wsa883x_component_drv,
-- 
2.47.3

