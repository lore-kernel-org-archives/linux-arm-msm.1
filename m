Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364096;
	b=2R21EyIAX0ifFL6loHYAIiVsb4y9FQHtByv6m1tlYkOFRcNwR0Usa6JTju6m6ZjhVGWt
	 LbONlFDNK3A6whsGTexo6O/7mCqXLb9JcOxv/qGldccHYzNdVwe8j0BEEfAB3woOzGTvc
	 /uUYZbVR39Otpe0Z6RfAEiBvNme84eXul0gJDTkMC+76i3F8IEfHNeuIiKBFukMletRwM
	 o8xV8K8HfVCDuEFAnldxMg7IBeYo4l/mWhrkz2DViMDuH3rR4b0oGJ2WWYEBSnAjMMQii
	 a1mAi7v02P9/zshNpBOFNHg2y21d8BLGjXhuqEXDQ4LvVaIMF30VCLfw0B4eUjhth0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364096;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FZNFp9/0dkTsTM2vE8nJ7VD6L24rajS+fM2LkLOrbGA=;
	b=l9ZZZ0n6Tz09rfPCeMezku2gR/Hdi0x3c2YKh9QHaWF3/w37c0Rth9j6IHWuMmZP/tS4
	 pAhsMt1X1PG+442qKg96FXrLgxXHVGYvoTfKMuMtulMjnXDPbqnJ/Mm9s1r34nXZSdYFt
	 8tHtVptZU1H1qLa63KW4B6d8JLAMlvPPNbCi9DH9MCqY8L6PjGwkiUG/CuJzacevnfiW7
	 J//7aBlBpg18/cxJpuKyWroUSvrFk2yOx4eTeOlkxHZBb2bbCYdWYx85Ri6oDnLSgALiP
	 bx7D5o8foDjw9mMBvawOYGTPYn07HJ7hMzM2rRpbTgxgGpzBVIzKz7/DseVbbNK0r7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EQRtFRUA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QGv1bW25;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED362606A6A3
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED362606A6A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EQRtFRUA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QGv1bW25
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQ8Xl1854206
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FZNFp9/0dkT
	sTM2vE8nJ7VD6L24rajS+fM2LkLOrbGA=; b=EQRtFRUA42GVrHwo0ldgQX4I3GA
	PAZx8Os3MMJfGEcsywP+egPL4DbHxJYUAmZgcDzK7sWLMMPnbJEG542RgH5Tw54z
	NAlON/htb8L4E1TF+hopzK9kjf2wBDjsetwXs7DkRN4KytENZf80qNO6cl0mFC26
	Ohao35go4UajhGtLaPIKj/se7cSCncqrizmjy8agWQqBcCWypUMFvybR355Jl+C+
	xqv9yOUTjGTQQDaEDHZvKz/GXxR15WM+31vlZUHh+mzMkuoNB+Pj8iaXjz/9YM+T
	rMjx9y8Rx4X/i6xltwPZ1HLlqYuvhctKkL4fkMf5pLcrfe7pN+sPHDI+IVA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j30nnv3xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:14:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9493e89d4f9so378485585a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 08:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364094; x=1795968894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FZNFp9/0dkTsTM2vE8nJ7VD6L24rajS+fM2LkLOrbGA=;
        b=QGv1bW25xC33LD76O50/YzWSkmxkQd/HhumnuKIFW67bE+j6l5+v6Qo7jOJc246tAf
         7nYLzkFdI8h2nNwUoThw1wyYziVnHQY56OSkjFBtEWZnb50ALHXOZM8VFxE0vkcm6Ap0
         trCbOjf9rRmL8GlyjvPd6JVeznMXxbrPDIQavEkftn/RHg3N1IWvHqCEz0sfzT1UOrRu
         Sdvlz1KhZImwgjvHmmx2sJx2u+0WKKC2L/QoQDWmW5kYfJgh/dpaHH+LPWIjLe0JrKnI
         jF12kfiDjbRE54kXIrqSbbcZLRTawbslKcf6/7+agYeqfLKcjRBCo+43wpPOJnj5VjM8
         FHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364094; x=1795968894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FZNFp9/0dkTsTM2vE8nJ7VD6L24rajS+fM2LkLOrbGA=;
        b=lSwdoyVgSW5gIDWl9OpOtQbhQcZnsh55Q5YWevM2JypV8/KSbi0b5qpkisFVsERnnJ
         0o27MgQGcMRCQC/2bqV7he+PS3FXo/+zS/t2ayjfHpknRqSBc56+ibRZlQdmcyLuVTGf
         InkNfNDjSrJS4WiuQuLwLRpdyAsdkZ3Lvbc1BivjFfKvMxYkZnPpBYcT0gJwEJVaDxI4
         T3rwHhVyzFwP0GJFhKDCkAZ68dCUTzcgmhNVxhNlt/3dPKrIn6WuXzVMt7dMbOtJJlUl
         QvuWBl4XnnK9goQruHyElCpSif7wsMS+X6zEaxXVyQNRz6Bju9XwPQ0kh/3w6NEQIYvv
         WSfw==
X-Forwarded-Encrypted: i=1; AL+hErFRS2Wpb6J48ZcWDDinLafq6DhNoVB/LHcFsFcW1qcGrof0J/WH0Zwq1Ta1jKy/LY5ezQX+OjnwqfmRgyJC@vger.kernel.org
X-Gm-Message-State: APuU4Z/T0/RbhojC+kfIDK3nhoSyMx9H9Bgm1go8Blmynk7wsJEkn5Xf
	X7+2S5TFwY9NbtbymW3nDYzum4D5bYtb7weXDj6gG2HnNuuaIrPRhe1sT5CMYDGpekj0IuwHrLg
	UeSE8TcQmN4uFVgkfJ8+ulGaVntS8PdYFhssK8slED8zpQEtWI3h8eonkaPtXhJ17kI50
X-Gm-Gg: AZFdTZeE1jfLlDtQ/Em5muiHpT7SxtmjHxMdRRwxKX8mE5xlhaRGgQaw+x+ZfW/12g4
	uuT/wB4AwQVRwe9KC54tZuZyevMsT+9ZpFhWo+pFdCRQRa5SIl/KLwvH+NCCU6CBwRdzkDiZkPO
	r61OjcIM/Jg0YNFiBFLEaFx3rYrXVI3gNwpIo3ITa07YcU3x5oBIGS7s77jePyq4fzsBwcvgKIP
	pEdyP0A2MZJ0/QGWzczrC+haNvBvv29qxIfmoaEYEQUsYoyXRT33g2ixG3qR2D/O9k+F2/H0pMC
	q/bRKuzf4oCJ0bH2U4L+4FQpWwNp1ww5gn0P/mG0SgP5JOOFvUVotDupJCgN/7AJF8Dlbdp0ga2
	l7wYdgkyKVjkvE5Cx1iHCIyETeUWGSzSbKCzQsUk44TJe1i0VNfggwCByp7iJefQE
X-Received: by 2002:a05:620a:4607:b0:949:7acd:3c31 with SMTP id af79cd13be357-949ba6b3d57mr1412220685a.0.1795364094336;
        Sun, 22 Nov 2026 08:14:54 -0800 (PST)
X-Received: by 2002:a05:620a:4607:b0:949:7acd:3c31 with SMTP id af79cd13be357-949ba6b3d57mr1412216185a.0.1795364093887;
        Sun, 22 Nov 2026 08:14:53 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:14:53 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 03/24] ASoC: soc-dai: export snd_soc_dai_stream_valid
Date: Sun, 22 Nov 2026 16:14:16 +0000
Message-ID: <20261122161437.5994-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX3VAt4oXzQGJM
 8Z3CHl3k1SUkFniVyYA72BKPLHlnJDwy/JUdzbeeGrIju2ZJ4YqEIBMloK0wy/5jW5Pn71lXKXG
 78YLeJgvC1r3kEI0vH+xHyf+HD7DA4FMl5w4sC42JkBPmwnKJ5G6gnvm/EeS8SW5/bo5VXuaycS
 +0GCofgcScW7GT1EahnaSern0jwm2Zggdx6KfbHYDDbC8pBNPzwmxMd1A0lPj0zsuQkiqrU/LCF
 zo+Y5a/usOTC0clEGQiRxDsJ+E/Ae9zHphlSLCdT8IeMbk/qtkX9JJw+gKRu+VqEuW0hosYezLm
 ZXSJ5lMiRdoJ2jk9sfvyirkTlhMGxGWRyKjciDy7P3uzcXT8+XfaMJB9z76V7MynvwGFucGQRmD
 8HuMmax16mziy1b6GVf26q5M7M3iKzhbpffuxFTXzjt2jEL1Xm++N2u+maNsn3eyGHOmDzDO8Tn
 sX05ArULcJWZ84PPYGA==
X-Proofpoint-ORIG-GUID: _s9MDPvnfij2gmyc2bEA5ooeCKYAzFhN
X-Authority-Analysis: v=2.4 cv=LITz05W9 c=1 sm=1 tr=0 ts=6b0314fe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=cE0UM4t--Vybx2cbpv4A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXzLRWU6e7lrVE
 UW/HCjlw3M4Any0T4Mq4xZu3NBpVS2iTeKmf4CCGG693HDCXOM5wXQ/86a9vqpaQ5ImM86OBx4s
 ejw1qxZT0P9RSl/zvd6aGteWWWpB62M=
X-Proofpoint-GUID: _s9MDPvnfij2gmyc2bEA5ooeCKYAzFhN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

Modular users outside soc-core need this helper to filter DAIs by
direction (e.g. the qcom SoundWire machine driver, which iterates
codec DAIs on a multi_direction_codecs BE link to handle each
direction's stream runtime). Export it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/soc-dai.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 9e34f34eac3d..5d6385b02719 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -706,6 +706,7 @@ bool snd_soc_dai_stream_valid(const struct snd_soc_dai *dai, int dir)
 	/* If the codec specifies any channels at all, it supports the stream */
 	return stream->channels_min;
 }
+EXPORT_SYMBOL_GPL(snd_soc_dai_stream_valid);
 
 void snd_soc_dai_active_update(struct snd_soc_dai *dai, int stream, int action)
 {
-- 
2.53.0

