Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794712867;
	b=BYRsnZvXnxsIpHLG+PfS5W3MAB4m1ayTyv7mDhvZfbtmHVPApRUrNvu8DcNos/VHViKc
	 PcYmZMOxWzDmV7ejyaK1hbY0eiH7dWDAF5/i9itLMz+Cbe51fmhmE7J076O87kQgb055r
	 ZC6k/eVZykLBq/jCGTg544SeDbwy9mkPSRxYoyVCJ+NLZmlzYCAIk+c6vmAOnegWGqgd/
	 5dgD2lL/4qgVnNNZqR/rT8hx3vVMZVreCa30AsRT0m3A24gBf0yC4oBWXEUNKwPDNcUyN
	 zp8FP/010klwLMOjXii/kYoTzWClFxVG/9HQqZPi3QCullPBMMeHO07oDORoXLu9UGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794712867;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iNBfBA9zirQU8vE2N4UQfu33IQyHSAKzuSpzOZqoDXE=;
	b=L8glHV5jbanfI9dTdUQw1lWTWpZMkuNk/HgAmoRbsNYyiJNNOlsLGBFU9PvWXhcxMelB
	 TvXBqS1lsZQ6faR6If+uomJlroteGZ7DCgw19eESeL091U2P3GgjamCrSWspVSPBtkuWC
	 oSIh5mDLdUXUaPgFMY3b5BCxQnyB+eqjZouBv3V/Ma082lAKiQ1GVUj7yt/Qv+6hRQf+R
	 AMcFoTXmk1Y7OgCGAGiIuBHbHlRWIYvNdrVJ/qvANf1PVUnitARUcfc/9mG84SdG75dd8
	 3prcIH4fhfqLBGr8ICCbyTusCa3MRIvcFd6mQVD6V0M8NpjJt5iA5okl/ohsggyRjWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TZGiqkMm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aagYIyVj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09045606A327
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 03:21:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09045606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TZGiqkMm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aagYIyVj
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF0wBMk1488015
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 03:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iNBfBA9zirQU8vE2N4UQfu33IQyHSAKzuSp
	zOZqoDXE=; b=TZGiqkMmHeGm4yVAh4UduXar2iwqTnsWa3pMjlOyaAc6awINfja
	aoX6R6itDGStu4vGIePEUd2bNdmXJdebKvgZ0CBcLi6vkedBaR79iq7s3s5jux7G
	6MmX5OEeMQASrtk4JsjL1n1m811Grw+DHonv0VL+tGBinfN/fj/N9x7qLZE/jEiB
	XZhEV7FuJBol4fiPAQCYV5jMkIdO5HWUBNUTfVhWyMwAOH56f52eHCMXRwkZFr89
	o5G8KxAM6i4KnK5mTv8Xaijjp1R9zMWM5NvTQ6gO44Fc6C+VXosv8yTISoy9No+l
	OGd+KU/1ISXwSa17rBsInbFiAoHZWyM5Y3w==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqj7uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 03:21:00 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a5005fd0f8so2700106c88.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 19:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794712859; x=1795317659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iNBfBA9zirQU8vE2N4UQfu33IQyHSAKzuSpzOZqoDXE=;
        b=aagYIyVjyJLc0oDXsoXVUAnrcNsPPLdm1AMM3JLcX74sHr3MyUZPvazc4sNeFMnObZ
         jQ3p0LKVzs3FT882ObGz+kTRl6PvzdqrB9wuTc7IqyMHiOe9poC6H1QCtIGwIjuvTV53
         NZmOnmbO3xp8O7eixttg13Al95Qb5ZLaA4nA0yEzIDv6sRXdVNGNX29TeDmMvEHRG101
         j1YIuvu0R6NYkhLbgXC+mIHAJkYwc4GjDxTKL2Ya5/5+g/NhSdDFpNNskg6Zma+OKeNJ
         xaxiTjfNxmF30b8/1JrqFGxn1L0GOe9Zhpv7uzAHvgBPm4T4BhJXrDg0t+N5BPOIKiTN
         D09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794712859; x=1795317659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNBfBA9zirQU8vE2N4UQfu33IQyHSAKzuSpzOZqoDXE=;
        b=okhRf07UR0sI489gJclsOIXT4ZNhKBNYN8XX0aNgdbcUiC8igE1sjejDmzdva4M4T+
         NiwxmheIqXswZeK8jEbiFFL0PQTZ7hn0ayBj+xkzEugikaQHNSTv4+f5w6OnINOyUTAX
         TENzmjjG7b3PocJv/Y+xD3Z5rrowMimIFAat6mm16AqhE/qbp3xpWOgRjQ3YO6Jy+bQf
         Yi4IYG3Lepl+dalgC9kzhSuFxQDOkVomovv2BaLadVpzeRsawbLALCQtvqX9tqur7yGn
         +e3BsgpSx9mFwYnh/AoSdSSmsSzoTIORhplIjNR0quBbjM0ooNVmy8PcvzMCOsXsm5nz
         syXw==
X-Forwarded-Encrypted: i=1; AL+hErHtWPsvOxnBxExi7cXYrjSed9d4E/OmkF851GRQff6rRshWD9f+GGqfKKlYnjDs3NMNXpsIVff3Eqczv7IG@vger.kernel.org
X-Gm-Message-State: APuU4Z9zk4OOBgjIG1MkhvIWyWcKh2q3Y17wcASTME+t4fG5gh5v8qVt
	CRm+rhtWUHYdQ14miqEZlS3eTzQ+dAo7uVC+JFyakwZUId/8jTy/wYXjwj+28xH3NfspOgjnOyz
	ogS+M8hGpo862RBhWqRovnOczbRIiCtHQfT4PC0Q7y70V3vhpedQFDFgQ0b3BxvXMtiVv
X-Gm-Gg: AYBFou3Z+KPTw5U6ZRJ2kG/Myogpzk7lYxfgWcgTi5wH2E5fH5uqgMOlOzW9/px7Los
	oC00aAp23MK2yfueBFydNqgtIE06E2U8sNDk201yYqsvZUVFHImz0Mkyjk3MzFtXyDNdu2/NIFV
	QxuqgRblaT+iR9V86w+CxWUjmp/wn0g5VmuYDNRDp+aqVxXkQllXn2aQ2NYOKvhDGOojlVyvxaR
	V7clo3y+B/6O+JZgmcg1ms0BnAog637QdMUr2nEuZVKDa6ppKIlHojmSg5j8Qfe8a1XZJma7Jjf
	fie6cc5xRcNoQNGca25B3xI41IIRDnb/6qUUoYbZedNCbQeJca3SPb3FP5x5ced+7TNstYFSR54
	OieGQxUFmX/b5fzDOd1qkum5O4GWNACOymKaGNECpZoWfnGEQXvg+2HlK0KuSk9IjR/O5ZMFrF8
	n+gb2dLN/1sMGU/bxqf+559Ffy3wEaRdkO
X-Received: by 2002:a05:701b:21c3:b0:196:e2d0:129 with SMTP id a92af1059eb24-1b50308b464mr6379937c88.2.1794712859173;
        Sat, 14 Nov 2026 19:20:59 -0800 (PST)
X-Received: by 2002:a05:701b:21c3:b0:196:e2d0:129 with SMTP id a92af1059eb24-1b50308b464mr6379913c88.2.1794712858434;
        Sat, 14 Nov 2026 19:20:58 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm21300791c88.14.2026.11.14.19.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 19:20:58 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohit Sharma <mohit.sharma@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/3] ASoC: qcom: qdsp6: Fix audio after an ADSP restart
Date: Sun, 15 Nov 2026 11:20:24 +0800
Message-ID: <20261115032027.414953-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: ceKWkqpo0XAS7Iyp6LEJivzwbqBu-IWT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDAxMyBTYWx0ZWRfXwGd0v1iQ2DpI
 WFi5X+cTctHhDL2uuc53940zM5yW1p7Zo+60d30ruFLon3PqNNDlcIAnEkLauKjDG2YeGiN+9tj
 8heO7UANK/V7vIOtQGyFp+mNqq0v/BP0QWeTzG7KQFS0vRK8ohWVoA7bqUGTlWxS5PV4uu9eqxg
 dscabX0pVQ/oaZ3c/lTTXE50wl8k4qEfX0VF5QwgzvL3GBiujsxE89bWgiLjPjWUpjVJtYUPdPi
 zPCalux9j6KFJiHU0OePbKdIYtiiEWeVZuy+KwYIJBXuWwvR8q8cCZBxvCTB1G4cLTjM5WAGhZI
 BZjTmPzCZJri6DvcubfYL38UP2ietrNbRdZ2LugP7HV7DRzzL70/saIZlNmfFnA/MjWcrlubUEv
 KLk8yd5TeB2lfGgq5NcgLSV0uBpclFpxu48cQSgpSe1TNFWCkE0oCqaiQCCKjAcYzXMoqG4xPFA
 Jt/4MDrEiA/CtP+nw2Q==
X-Authority-Analysis: v=2.4 cv=TqJzFzXh c=1 sm=1 tr=0 ts=6af9251c cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=G7n33azJLpTFfIg68gsA:9
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: ceKWkqpo0XAS7Iyp6LEJivzwbqBu-IWT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDAxMyBTYWx0ZWRfX8iSo1P5H3dLb
 DrHrmRb4i62s6j+o9DYMpA+zpQlnSFgDb/3xOpYQdqw4j4eyZvD2oEBklmAARggbyBs0+ugHJpC
 wHxbPiqzUzcuJ/Bj/yUBiVPU/YiuLCs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150013

On Qualcomm Nord, audio does not come back after an ADSP restart
(echo stop/start > /sys/class/remoteproc/remoteproc0/state). There are
two separate problems:

 - The sound card takes 5 seconds to come back. The q6apm GPR service
   probes about 0.5 ms after remoteproc reports the DSP up, which is
   too early for SPF. SPF drops the command without replying, and
   apm_probe() waits out the 5 second command timeout before the card
   can bind. If the card binds earlier than that, its shared memory map
   times out and the card fails to come up.

 - Once the card is back, playback fails:

     pcm1681 0-004c: Failed to enable sck: -6

   The q6prm clock controller is a child of the q6prm GPR device, so it
   is unregistered when the DSP stops. Its consumers stay bound, and
   their clk handles are left pointing at clk_nodrv_ops. In addition,
   the DSP forgets every clock request and vote when it stops, so
   clocks that consumers held prepared across the restart are no
   longer running.

Patch 1 polls SPF with a short per-command timeout before q6apm
registers its component.

Patch 2 makes q6dsp-lpass-clocks track prepared clocks, and adds
q6dsp_clock_dsp_down()/q6dsp_clock_dsp_up() so the DSP service driver
can mark them lost and request them again. On its own, it does not
change behaviour.

Patch 3 makes q6prm keep the clock controller device across DSP
restarts, parented to the remoteproc platform device, and calls the
new helpers from its probe and remove functions. No DT or binding
changes are needed.

Shawn Guo (3):
  ASoC: qcom: q6apm: Wait for SPF to be ready before registering
  ASoC: qcom: q6dsp-lpass-clocks: Restore clocks after a DSP restart
  ASoC: qcom: q6prm: Keep the clock controller across DSP restarts

 sound/soc/qcom/Kconfig                    |   1 +
 sound/soc/qcom/qdsp6/q6apm.c              |  50 +++++-
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c | 147 ++++++++++++++---
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.h |   2 +
 sound/soc/qcom/qdsp6/q6prm.c              | 190 ++++++++++++++++++++--
 5 files changed, 350 insertions(+), 40 deletions(-)

-- 
2.43.0

