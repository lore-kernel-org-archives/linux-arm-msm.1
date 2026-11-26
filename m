Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795694270;
	b=4Mhp2sRTAB5LDUNJU24pzaehPsUZIZba8V6/gg19enEAfnMWPnj0R8Du+Y4JRNCUsslY
	 Oh8n3IUgta7tnPrX3xW7OgDwcMSxtAqTxiO7zzSlNmtcGmN+OyRPNOf0Qd+f6F4VcN9S1
	 CiyHnZwQ+XD4QTQD5otOq+DYn+byLe2FCjfFcD2HKnL2E/6im6FRiICFShEfdbzuzbjjH
	 VqklZPjdGas/2NEnF99iYquvcGsWEN1A7qIA0FbTsS9W4e4eM0sRic4RQYrsj01YxgErY
	 qk0PN4LXhZH3zGjv72aNwD3k8Ry6w936ZQO8Ridjh9lvIoS73jtTil7G6kbvHlcYjrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795694270;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=65dy4D0vQNHIbdge304u38ErnayG6vQ30Zwna7XuBUQ=;
	b=pclMcOFqHJ7+usIebU2CNhru7aKsQLZ+Wgvoje9EE8RN3ePEdHXgscjGNBmHXtKeUp5T
	 UyZ/1vEoREI/K/qL/i33EnCAW+vzVo1C+1PRaAMRXlPL/GFJHS3haEDMp8Frx6i8+2aTL
	 ctqYz6suM7MJqNTZxpsW/FWawIiaUS5YzEp4XpAGQWdta3CY7q4b/y6JB7s+wdQOqMBO6
	 +UlVSD0A9U0HMpou1PiIw3TvJzKMHXpzoVDg2tsqBaT99S15OawkXQ4tdBK0gbD7MTznp
	 P8v5iFhcXVjU8SBZANV9+wdxOnDvaCUJfVcba2iOtblgnK80RnB1wkI1Z5jDfWRNesg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nyvRP8ge;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iic6fVjz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0761D606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0761D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nyvRP8ge;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iic6fVjz
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVVrN1275416
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=65dy4D0vQNHIbdge304u38ErnayG6vQ30Zw
	na7XuBUQ=; b=nyvRP8gebq9rZDDl6lMUCXRjn7xtnLImqZS7S46xS184uJ34S6W
	yhuJBM6VUIqQN1eMSgkD1ZnfU2/WACDXtnljCG7g/Xq5WS/4dRZSVw0X42bXTad3
	8CS/zk2BEXh04LdNhlgFibJfB+PD2I8zhTNPMdCTUtl+jUy0x2+89qxisqyiKg8w
	ACt/HlNJ2vMd5SxCADq10i+nON957z1PGQEVukJah7SknYhkDBVZd0JrloCQDR8h
	9Nm48rnmtmcvMPRdjan3mzn28uydyCZNz5O4Ecafty9ycvXpIMnV128Dl+JvKbjK
	T++LEdoSnneJGyuXR+28JfE18aRVgCkopkg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7s53k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:57:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9496ff065bcso935437985a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 03:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795694268; x=1796299068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=65dy4D0vQNHIbdge304u38ErnayG6vQ30Zwna7XuBUQ=;
        b=Iic6fVjzhvM3ddDCXJLYb8bNhYXnFFM238MzCPfga1Pjbx9U59JE/M8x89E8br5pEv
         2vtM0gJKyUGl2qYOeOzffO5DZPaWZ97rPIpShZ4vKqJ8kIaWvYFIk27SYyuWhQRh05sd
         sA1kxzD9EbViA3qt5h5jOGpiagglF1VT1iCd2oNPmMCU7eqebz1oURFSjRxEM/xHyGaJ
         H01fMSDMgIngan+Zoj7FiAyDyNBrZ0XUj3p/+cL5juPbYAmAIsP1dXS5pdg6iNgt3jSJ
         JedHIMb8lE+ezH6wlSkEYhYwwfnfN4L9fRTgr/Qfqk22BVAqwiXxWSjWmYUqFt2xwrTD
         pxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795694268; x=1796299068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=65dy4D0vQNHIbdge304u38ErnayG6vQ30Zwna7XuBUQ=;
        b=X2A2Ro2AJWOhZpl2siCjtAEn6uDBorZ0ewSxP513UXZUlylV6+00NwOksxglHEiTuM
         2Vr2scElKWM5NsPgGOhTilG0g5ujnJi5vOOecJiyHg8oNh5q3jvMabiXHOS36Kwk+bXg
         au2i9rdhGhQPWQPpco/xosIQaMhi0WrupgyF3Ig+s3nk4NunQvfQ5cTuI+xeDspK1Da2
         vhi5fhGJxZMkMXIm2VhjUfiHNGBogpaPnkR7b6w9tIrwYC2uyxYtBeU28EsYlHEnNa2i
         pmq7PGRU3yQn7FTAhQnLZHgPE4bKKePR1OnsaYel6PZdyvxdC72wfL8jMmXJzjtBMRDi
         hRoA==
X-Forwarded-Encrypted: i=1; AL+hErFpAzakfFygsAwg2ftCyM599iJK7lacAkOpy29nQqE6LKPgXiBkQbOZ3Xz72DUJ70oWA+xd9BUeLb8HVxMF@vger.kernel.org
X-Gm-Message-State: APuU4Z9KUUhsy4XGFScS5QcNPjD0NP2hY9+xdhNWHsjyEpYVFD8y+HSN
	Y5sNq7fkusaujbqI3OGDSk1XGGqZZYMhK0Z3Dz/d7Un6XdS2dQ3Ay0eh/vkyuvZzzee6xwhsU01
	ZhIJvbITutgkaXuRPqBjFRvXA2lIbBciWfXUaAcuGmoc7Jx+hfnxUIuMvMohgXfUpd9vv
X-Gm-Gg: AZFdTZdpQWRv26vYTCs2NIBkk4dA67izVdAofk1E+1aGp9SdfbKAs90HhhuJP2z/pue
	iH+tuBrlXlPjkBvHULdngmhgpjRM3rikCb0v5IZla4s6lSNzqH6tdRvR797Y4sU8eevYEBSJExt
	ojLYy+wIzBW5RpQmYA36BXPPEbF+kD1athHf2j40VIagkxOuCospchJ87a3KKK1u6Yac3QxaImK
	ToiVYsF/8sPLSGkrR83zwsZvqfjaiDOd3zBK+rKXW2oQ1N9sM0fpIJf8I0S6IglJO1/JYR3cKnp
	AVMbRcwrnzjiMyZma1z6JuI1MwJBEZYxtOsowOvmYaQgypKvBKaP/L0UGIUKn7LySNWdgmuo+jj
	EnGdyUa1wwq+EU61CZP9F4hXGBhLRAlJcs8/FqZPMAWw4KWiW9AcFXyzRW+V6/Nnk
X-Received: by 2002:a05:620a:2949:b0:949:673f:72ca with SMTP id af79cd13be357-949ba9b4a76mr3628844885a.42.1795694268211;
        Thu, 26 Nov 2026 03:57:48 -0800 (PST)
X-Received: by 2002:a05:620a:2949:b0:949:673f:72ca with SMTP id af79cd13be357-949ba9b4a76mr3628841585a.42.1795694267654;
        Thu, 26 Nov 2026 03:57:47 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm39533135f8f.10.2026.11.26.03.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:57:46 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Michael McAllister <me@michaelmcallister.org>,
        Riccardo Mereu <r.mereu@arduino.cc>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ASoC: qcom: qdsp6: fix 24-bit PCM on QDSP6 ADSPs
Date: Thu, 26 Nov 2026 11:57:36 +0000
Message-ID: <20261126115738.1765949-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NiBTYWx0ZWRfX85CkuR8ye0Go
 LXxgB7VzCRhkZLJBWx6zOMDyl9j8q7P+yMzG3VJjPmZrSSTyD5HgvqNQr4c70vX8cIr9KV9UA5F
 t2eQofVGimJ1+8FCXTI6IcX3Z/5k/tA=
X-Proofpoint-GUID: vAWuosp5s1HoN1qHRktsHUyWkfkeLe3v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NiBTYWx0ZWRfXwdqsT+sAdbys
 cbg9SiU4Mmtpa/anHCSsxc0wzdBR9Kcd1VlfLZm7Q/ukaw2AI1/DJzSjkQA0VOUpPr6UDbopZSa
 H71AO5NBCwy+3Vhtj7R4oBAqqwU3yvOxPWXSd7juYfOPI0tppzUJbstwCTPaJJB06m/N66QTZgv
 4H0PrPTxX1mKoA96qj3u4Fv2wml1I0Mq3b4aTYD3YXr4w3HOAf26UR7rfxmA83JcEmOz1+N4uwA
 QAu6OO8CsfX5loNWNnpvUdw9P6ky+NjLfPjqlsuc1iT1DWWA9ObYCeMJyh7CeuU6Nr48lighFb+
 UFZnBXUFBtQDlSGGrEn6oOrYshVVcmO0iEFPG+Hpd75WTt2mf9JYwIutMTjkWNEmZNLwDo8X2Dd
 Nr+mot3agW4o8mq+pSD1AddejqBXG4QU13F6q5L+1tjtLc+EncDxZEkSirvbsmWIrz2k5xdw+bg
 Z05qinp56YSS0u22c9w==
X-Proofpoint-ORIG-GUID: vAWuosp5s1HoN1qHRktsHUyWkfkeLe3v
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b081ebc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=JwJ85b4fAAAA:8 a=5u302ktTOndDhYrJvdoA:9 a=PEH46H7Ffwr30OY-TuGO:22
 a=qg2vb7sgHZQYDKbllo_a:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260046

24-bit PCM through q6asm is ~48 dB too quiet in both directions.
q6asm sends ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V2 for every LINEAR_PCM
stream. V2 has no sample_word_size, so the DSP defaults to
word_size = 32 and expects the 24-bit sample MSB-justified, while
ALSA S24_LE is LSB-justified.

Patch 1 switches to V4 or V5 based on ac->q6asm->ainfo.api_version,
plumbs sample_word_size through both playback and capture, and
drops S24_LE from the MultiMedia FE PCM in favour of S24_3LE and
S32_LE. plughw converts legacy S24_LE requests to S24_3LE
transparently; clients opening hw: directly must pick S24_3LE or
S32_LE.

Patch 2 (originally by me, rebased by Riccardo as part of his
Arduino UNO Q DP audio series) adds S24_LE and S32_LE on the MI2S
playback BE DAIs and teaches q6routing about S32_LE.

A different approach was proposed by Michael McAllister and was
developed independently:

  Link: https://lore.kernel.org/179416102230.53258.7301268454500974217.q6asm-pcm-format-v2@michaelmcallister.org/

That series keeps V2 and routes 24-bit through S32_LE + msbits = 24
so plughw repacks every 24-bit source into a 32-bit buffer. This
series carries sample_word_size natively in V4/V5 and advertises
S24_3LE on the FE, preserving the zero-copy packed 24-bit path.

Tested on db845c (SDM845, LT9611 HDMI): S24_3LE, S32_LE and float32
at 48 kHz play at full level through HDMI; S16_LE unaffected. DMIC
capture at S16_LE and S24_3LE verified on target. db845c reports
ASM API version 1, so only the V4 branch has been exercised.

Srinivas Kandagatla (2):
  ASoC: qcom: q6asm: fix 24-bit PCM level via media format V4/V5
  ASoC: qcom: q6dsp: add S24_LE and S32_LE to MI2S playback DAIs

 sound/soc/qcom/qdsp6/q6asm-dai.c         |  26 +++-
 sound/soc/qcom/qdsp6/q6asm.c             | 184 +++++++++++++++++++----
 sound/soc/qcom/qdsp6/q6asm.h             |   6 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c |  19 ++-
 sound/soc/qcom/qdsp6/q6routing.c         |   3 +
 5 files changed, 195 insertions(+), 43 deletions(-)

-- 
2.53.0

