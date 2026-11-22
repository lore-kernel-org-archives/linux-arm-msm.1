Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364122;
	b=VDKvHGbcybmSstyYfxTYCmduSDObuXI/QcwsH3DKc1xT0OM3Ot4LxnOrtQX9Uo/FiZF3
	 g3TxbRXy7rCSTTj0E0rLMYnoJZbsFXz3PYoZLh4bJzhJftZUe73la4bkQCkdxocaTmDLU
	 R/29lQHKj+mPvZyvizhVJezPfcc3bEhhRaN4NdxX5evNvQovGfEgB8h6ynnZtz0Fpeo+a
	 yHg6+aBySgigSujicpBSb8Dj84nHlh1B2gmvqtvxNFYWmE2nmElAfMc+8ZcgaXjxJqa1L
	 acZZNXWrxslThAEfjTIqzUupwTGaUqOYse0OPEv1FCDlBSnxOWwgHKgUnM67n+AFizA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364122;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=F+L21FTarZ4H2hYqr5kYcDkq6L8oSj+Gr70Hhv90lJ8=;
	b=Bz731b3FSFWxR6tGfIddHnYWWAlYM8rSkdsRy6DPAjQ4FDU0SiYlmmOF3isr6whPkg8y
	 1gIOP80CkkOaHZn+XWSQhvTcY8OPLMTW03nb+TokQ6ssjwnppmOhfT/j8D2jUe87n84iw
	 7C3yf9OvgRtMyG5BNLH0rriRXGUsZRqCvI7v4+xOVb8hnAqREBB9V/ar8jtO1FSrhnqL4
	 eN1Owf6BNKBRySwegXJN7Cbz+YApBzc3waAn4bdIIhtz8UvSds5frUcbN0u2rwtOdb5YS
	 r3NmwarUrqlADk7FCtLKkZdfN1YtydrTHUIlqkYD4+QNPVftRMB3E/OwTomeGZKlq8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nIWiu5jn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cEn2d3hd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F3960A2635
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46F3960A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nIWiu5jn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cEn2d3hd
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQTqp3495937
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F+L21FTarZ4
	H2hYqr5kYcDkq6L8oSj+Gr70Hhv90lJ8=; b=nIWiu5jnqjksjhUVuUFsrWtdGlq
	q9tndseb415/879kOFcl4c7fPcfX1oLdjgDngrt+C+PmDi7bT87L7NCAEBMMO8Lg
	8bV4aXBbe/gqUNKrKU4+Yd0mSb90IIeP85kJTIcAxrxiR59YjcbAzm8IF3peTQlq
	4o/Ou/6m81wrqJ5hHAzCkdlG9M0Q9erZgHKijEOkE8LpqQi0QAVBg1r0i3Btc8/k
	o7rkNZssunMDsoO1Am1j3NyUb5or0CXDmzuJ15mbT9yKv9cAZRxj3G/smGqr27ag
	x/wzXce/sAMPCXxx+y1wR10mvo4Lx+7dGCR+JQs445h1JZx10H8e6LbyjyA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32mgbtxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-948d83322f6so427938185a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 08:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364120; x=1795968920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+L21FTarZ4H2hYqr5kYcDkq6L8oSj+Gr70Hhv90lJ8=;
        b=cEn2d3hdgReyHYJtd1B+bfco8bVl/fBbBEkAT4hyDyVWYKFUBzKgXduZn8p04sRVjy
         VkQ3thomj2R/1/6tgWdnvRrgdwJBVQaTd9VehOPIMRoE9Em+jkwW6XfAtLpzBXQ/Ozr+
         XUVTdY8YcSJCa8EfVkypNb1pW+J8bf0ih7c8oJvv4tI2OS7rHEtFFBF9hUulkFKmGcGv
         269rc/ULINBmGKKXFlnL1UcO9/FZhCpCca1RZKu97Uez8afmkBmNveklI3VyjetxRVr+
         rdGrH4JK9reAX0U2CK6TwLoeHNiJvsZ75PK5qmirVk/tfert5GfeJs/bHQrtXAg8Irnj
         o2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364120; x=1795968920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F+L21FTarZ4H2hYqr5kYcDkq6L8oSj+Gr70Hhv90lJ8=;
        b=ZW7R7FjPmfeywYjcoqsCBF3CxhitVtBJljEiDWaYwxH7PX7nSrFUt3uMqAVycEJYC1
         IWoBq23yZXgBOjYVk199aY1zWB7cZkgFKO4H6d+lgEPPMXlS48MPO01SxnSwjF0Qo07j
         T3x+M121aNCheVkt9JKNqXvfeiOFGFLjQ1WCLQSxX4yLNpdREVSg2Hez8Jg0Kj+4pf2x
         Wf9HR5RePMnxgPBQUsyDhvGO2WEe6dODw5cLflvKwzaIH/3S6P4y4CK0BafejA3fWN8l
         M0+T3iih+pTxhi/WMepmzX+fUQhnlAfMraLBCOn9tQcmb4btH0dDUN55cwh5pge2hhOX
         z/mQ==
X-Forwarded-Encrypted: i=1; AL+hErFfJ/kPBflabjwLt2Sty3PfyXp33Wd6tTLicJUJx/wumdG1XvUX8PZPdDoHMI6UTj4BQiZQyAVGRUx/5zF4@vger.kernel.org
X-Gm-Message-State: APuU4Z/e48iuSMrkkeQssCD206i8QytQG1706R/p/6zLbdQVxcP5l4Kk
	OSNAQl1/+4yFJqk0YefE4AuvqBsbi9I9cdhScmDsxNGJD5D9HsCIr1rLDDkGmajfQOkUIRRC2vk
	4jbXpAKGQNChnjU5uVlBfZBCdWY/2uu+B6pavW0MlTCa+g1xcRuo2xFwjTIXIamNsWKDg
X-Gm-Gg: AZFdTZcNBl3RbzHi21gnB0H8UMMK5yDApDdvJPrFFIqXp6JSkmb5oobpBlpmdxhcqpI
	naaBpXXsfkSD7hbMDYPZ7x/B9SH40haRHlabyZiifK8ycn7zNxGFvy2L9j0R6eTSrSpyd2thbAA
	hX4IcIeioUUoCxnsZHDiCiR1/7RMiGBsy6/JOSUlPfpFk0xYp4PvVFYsCe1J0VO1+Jc5FSFQOL5
	sT6ZrEdSb1ma3kONbyPS12n+TBotW8m6V6PCpV9JKb7iy5yU5Y7sCGvcT1DUbv55pY0kTQvC2/N
	ZgjzadVPQZFn+GJRgN0lAeylRszMFVRDi6wVDgY4m4dRcxJ2O2D975z2HTQqr8NOtJ+92lHWAEh
	opqPEPtALrN222kjskC1TJvfEZ3DXLt0DjGN1TYAT6LC8G0yeoK41fRuzGA0ZO5wz
X-Received: by 2002:a05:620a:1330:b0:949:61fc:88a6 with SMTP id af79cd13be357-949ba81a0aamr1463128085a.11.1795364120464;
        Sun, 22 Nov 2026 08:15:20 -0800 (PST)
X-Received: by 2002:a05:620a:1330:b0:949:61fc:88a6 with SMTP id af79cd13be357-949ba81a0aamr1463121985a.11.1795364119939;
        Sun, 22 Nov 2026 08:15:19 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:19 -0800 (PST)
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
Subject: [PATCH v2 20/24] ASoC: qcom: x1e80100: carry WSA VI feedback on the WSA Playback BE link
Date: Sun, 22 Nov 2026 16:14:33 +0000
Message-ID: <20261122161437.5994-21-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX5pckJfJQwpbX
 PKoUoijHExyOvnQn1cbnIfmSuNXxIm71bYx24aCW+lScwoCsSkEUrfhhYg86JG0OlZONzzoFE9B
 9rugXKKoa2hs5uBWZsWPoT6c6b8zpm9sw9wRB7yKsgt4PgKJFlxt7qwt9CpM6Eref1hxczoRy9+
 mnScfnnskmXdTMqbVmquxAbOn1QkKjhv95iT3Pj+uacRRXI2sXT2RyBevMq9IEqMHCoRKUtrWcw
 xtvQB9VNlCkj7gEJobx/KzyCd4GBxfb2tMXFIuyBFqupjukTHmc0yQt2AiyZ1ekjBp2xJqkHsH0
 /HTSw9i0t6g8Hr1FQMSjV6EEfLXVrSQ9NtNDraib+Kko+K97VuKo5R49o0Qj84NoVXX45LT7mtI
 8b7A+6oQ+SrjJz/U0HnlfwBMdLXC9OpAjFQSsl9DDjeSFfKSXe8tdSV0px15GDa50lshIMKmAOC
 bVCe2Y0O8Z1lIJZnNYw==
X-Authority-Analysis: v=2.4 cv=OM+yTiaB c=1 sm=1 tr=0 ts=6b031519 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=XkUP1P5AsvUOVAuvPJUA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX97g0d0riR3lF
 /xWAcYusYgIK4pRDYMpX63AC1h7PYLxhDKWMpMpjx43oMYv4OcdJ6nEeR9kif4T1sWtdkKQKuUO
 UqDnjq4sioe3tW+i/WnA9IJRQuTQiMc=
X-Proofpoint-GUID: ON5y5mBuFH1aZ6rWMQgPPdyDKYA0abmM
X-Proofpoint-ORIG-GUID: ON5y5mBuFH1aZ6rWMQgPPdyDKYA0abmM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220064

Speaker protection needs the WSA V/I sense capture running whenever the
speakers play.

Set multi_direction_codecs on the WSA Playback link so it can carry the
VI codec DAIs, with a params fixup for their 8 kHz, 32-bit format. The
core's capture stream events for such links power the VI widgets.
Nothing changes until the DT adds the VI DAIs to the link.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/x1e80100.c | 50 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index c927672eaede..3262fa39ceb9 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -6,6 +6,7 @@
 #include <linux/platform_device.h>
 #include <linux/soundwire/sdw.h>
 #include <sound/pcm.h>
+#include <sound/pcm_params.h>
 #include <sound/jack.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
@@ -85,6 +86,28 @@ static void x1e80100_snd_exit(struct snd_soc_pcm_runtime *rtd)
 	data->jack_setup = false;
 }
 
+/* VI codec DAIs on the WSA playback link run at 8 kHz, 2 ch, S32_LE */
+static int x1e80100_wsa_vi_params_fixup(struct snd_soc_pcm_runtime *rtd,
+					struct snd_pcm_hw_params *params,
+					int stream)
+{
+	struct snd_interval *rate =
+		hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
+	struct snd_interval *channels =
+		hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
+	struct snd_mask *fmt =
+		hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+
+	if (stream != SNDRV_PCM_STREAM_CAPTURE)
+		return 0;
+
+	rate->min = rate->max = 8000;
+	channels->min = channels->max = 2;
+	snd_mask_none(fmt);
+	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
+	return 0;
+}
+
 static int x1e80100_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				     struct snd_pcm_hw_params *params)
 {
@@ -181,6 +204,20 @@ static const struct snd_soc_ops x1e80100_be_ops = {
 	.prepare = x1e80100_snd_prepare,
 };
 
+/* True if any codec DAI on this link has a capture stream (i.e. VI feedback). */
+static bool x1e80100_link_has_vi_codec(struct snd_soc_dai_link *link)
+{
+	int i;
+
+	for (i = 0; i < link->num_codecs; i++) {
+		const char *name = link->codecs[i].dai_name;
+
+		if (name && !strcmp(name, "VI"))
+			return true;
+	}
+	return false;
+}
+
 static void x1e80100_add_be_ops(struct snd_soc_card *card)
 {
 	struct snd_soc_dai_link *link;
@@ -193,6 +230,19 @@ static void x1e80100_add_be_ops(struct snd_soc_card *card)
 			link->be_hw_params_fixup = x1e80100_be_hw_params_fixup;
 			link->ops = &x1e80100_be_ops;
 		}
+
+		/*
+		 * The WSA playback link also carries the VI codec DAIs when
+		 * the DT wires them in. Only advertise multi_direction_codecs
+		 * then, so stock setups without VI feedback do not pay the
+		 * extra TX startup/prepare path.
+		 */
+		if (link->id == WSA_CODEC_DMA_RX_0 &&
+		    x1e80100_link_has_vi_codec(link)) {
+			link->multi_direction_codecs = 1;
+			link->multi_direction_params_fixup =
+				x1e80100_wsa_vi_params_fixup;
+		}
 	}
 }
 
-- 
2.53.0

