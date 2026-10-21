Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551201;
	b=Bryhd6pcFvSMAebjgtAFrs1mjgO3xthiEu336wUpuPEXz1y2xBcZcV8FFsV/rrA/P5ch
	 adedZrnDdf+kDqo5z6QN6pZM8gAMpvrLMMOs8TO112pCWmnT7R9vms4kPsBU9e4wyu0bi
	 h0e7R2+yFO1GPmx9wD3ks8FzyT37C4wd1awEW97UmdxRQO/eZkRO+rSCpUMwwBHDG7s9/
	 rItWg6bGAmzYJFuiXm2O47CWsjeU44bacWyHWp7ShHy/VPdAwTFo9RnAydY4wQeMLMP5J
	 lMgpNP7wUWKTzvOuN+IpIsAKZJxYIhJOIOVUFd+K7TeCN094XUt9G6258v3wz3aL9xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551201;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=evtR+IpjZNie/CYszb+cjE1e8CH3ljthvc//iWTvEs8=;
	b=C+awL/nEmtBfge7wlm/Va46+FHxDM1/MIuc/HOrt4yly+26NTiG1K86fFI/hO17fRZAm
	 YffHhZdp+34wlDNRYyQoeCM8swICMkNsgeZvoc1NwCCguXdLorbZUwTjkvrTMmKicnXRz
	 v9i2aKm4R+EPc6VwGpQwTF7flwg/eZEeQvXFEjUp4tNDyQE+Jf3ll7MhKOoDu9wh0+RAp
	 9GJu16l/SJiF50bsN8KFFOWU49HfbIOYeyU+eK8O9vg9ss1sE/KlmhF03DOSqVmegNjOF
	 Aimj7H3fa3kjd9WYpR6UK+Ski5jXkmcvkwenmMbNdF1YuinT4XFTGeN7+LUisIuQ+6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NnwgERab;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gmAFiixS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B922606A319
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B922606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NnwgERab;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gmAFiixS
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2Eu822562740
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:53:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=evtR+IpjZNie/CYszb+cjE1e8CH3ljthvc/
	/iWTvEs8=; b=NnwgERabH2KCRpSUw50yLc7hpbcNI2+sR4sUckcjX2tZbnlMFS4
	V6voLz53KN/hyuHNWncvD820qT7adtSfZA/xSpFSmD3D9sYU4630NdVuoqvyQzaX
	dtndGwQdyxXPbDZMCa71sgxl70k8tkRx3/bMor52G35IDlkzoEXtkpFGN1APNP7/
	p48FWOgb2AcSbOGrL+Hwa/PyaNVUul0jOZpPa2MyUZdSIpg5vJaoc1KbLdhdAi38
	eTP0pD4KOWjqxJivBCs1WTwQaMtKAQgk59SHQ/LVPJayq42ncS5xrkknQSwcgIz/
	w8PFPv2Z3jiGdZixq17AbXNoB622bP+vDpw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd21ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:53:20 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-351788121cfso939607eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 19:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792551199; x=1793155999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=evtR+IpjZNie/CYszb+cjE1e8CH3ljthvc//iWTvEs8=;
        b=gmAFiixSGIyzcFFL35JkHC2nWwCWb41i8MUuBpF88knplaxpEB24waHC5UnVtdCHER
         /uDNOTsW6KjmxsJArQt8CCyOz6bNPpHf0sIWUD57FTy+n+1huJZXw78BXju6IfNrvHkx
         Z8I1E6AW+be888gIqE5fp9J+fCnchJXK6As+AB6+AySR0bc6bdYf0O+6wzgWz1DXlNSS
         e2G1chxLSg4sU6SOGJ8wke/XkAmvMncfaXZ+4lMEpIE0xK9Yy1vxK0aAZJjXXmiNAzKa
         X4yvIXD8WdgSqG3b3sLaRFWCmbV5RLm3aroGRdwv/fDhg6Fco8HmAS182Q59QmZxXCIK
         sbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792551199; x=1793155999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=evtR+IpjZNie/CYszb+cjE1e8CH3ljthvc//iWTvEs8=;
        b=lmbTQ7PNAozcHT7k5tNEzkhHy4dCaLncbLGVMRFDhLf4B+ie5hIaiusvSLXk6cYRhX
         tBpW2zyPClnhW68r75h2XD+/G4c+t+8HTSH0UEvmU6g1KBLyZUsVUgS5mekYaqCeJTDT
         pmPlcp+yeWq6t3AJDgJoIEVs5O8Hgm8I1DxJWCXFuzmTBMm20uSDsYfWHBkYUgw0lClB
         O3OijKf4CHCrQp/p9trLf58jKHRi1vaWK+XvAutM0YMbDNPZLwoa2OpfXGZXvYBMPDQM
         BW/IsXGDzyKQT4Rqox08Fiasm4WzXRRJJcnuVCoPGDigB9jE+3tqjqx4i6O10nQR34T3
         wFFg==
X-Forwarded-Encrypted: i=1; AKwUvBxiCXoboDRag8ixtNlzoradrBjZIJDZqJV152llUtHDUADOm1CjtXbB5EOr+9R4XLpNtD49GcBCzRRndzC0@vger.kernel.org
X-Gm-Message-State: AFq9FYJ13H8tiPc2BXUISzebyY6YwaoDi10Z1CM8HCZ2noNMzxBeQMyr
	kQSUJIES04DgBBzSkWSvR2OIGZAiLlz2eX0hGRCLtwECVV2UvCOlm4S+OcvNBYQA+07n/KhKbuE
	ThKm8RCVjbF4+3lx4GILOo93EHUdzvg0QjyShA1nDllBdx5zV8gjwpY9+MVOP3b6xFoNZ
X-Gm-Gg: AYBFou3rITvVXbU4P2/7QBkiklNhIwpg8gYefxL6cWu6615wYZDOyLldiz9k2ysju1e
	IrC9u/DgveeK5aEbyaO07md/IqiHyKgNROJ2pTtkg8UP+H/xnNV3VquNNoMuT2sd3BAUSVlaAsi
	Dk3BvIRdUCVwISmF0bLKXCroLVNUiddZNNekeOXugXLDUc1+j/ZPVucMZxeMbom7EG3s8Vy78VU
	DV4qjC4q4DrtUlpnxBcZE6tNMN/Zo25eECvlbBoXk9Viz4XqlSUtj3TmUoGqPo1FnQjwcURmPdT
	2UhGEwxGnjb5JuRI+V+R4qm3ejTGQrTzncjhuXwIBtM/vf/dkWjs3EHGhRD6Iq0YsfeMod96bGb
	AG91tAp8l5sFSI9m87Dyrdz0udM/8AOhmRsNIOQcJgX8yCeNBCSvc/xHKZpk=
X-Received: by 2002:a05:701b:205b:10b0:165:4b88:abc2 with SMTP id a92af1059eb24-190a6705badmr874405c88.26.1792551199404;
        Tue, 20 Oct 2026 19:53:19 -0700 (PDT)
X-Received: by 2002:a05:701b:205b:10b0:165:4b88:abc2 with SMTP id a92af1059eb24-190a6705badmr874385c88.26.1792551198861;
        Tue, 20 Oct 2026 19:53:18 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d61csm2553952c88.15.2026.10.20.19.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:53:18 -0700 (PDT)
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
Subject: [PATCH] ASoC: qcom: sc8280xp: Derive TDM channels from DT mask
Date: Wed, 21 Oct 2026 10:53:10 +0800
Message-ID: <20261021025310.2072026-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMSBTYWx0ZWRfXyy7tbLX7/dUb
 QfWxF1yzk6YM3e0ZSoAu/USHlNSn8AF+YLpYIfy+D6z4EvAb9e6Oey1VHX0orQj25C9E60dKRkw
 zljkkOrsMczsLDwl8ob/bprKm+egN8fwzkP8AFXfSps5RHKFcF9wi9tHItL4M6Re+UQu9ORI8Lt
 ldwOK65OemGy4gKikDykGNoOqdhvja6HBLYyjy9ia7IZ2Hv6r721w/Ct5dCq5zZvk8hAagfxTp/
 Rkv3lU1pOypZNnVJb8e9bC1hUQ1loaOFFmzPGpR0N4JEixEOPWdZTXGYeYPblMDqAAb8HwYLPUx
 ygFMZFGkuTaQL28P6eExFr3H2z6PXtyD2Oe3uNFqmUhMfzDOeRlUbiAhhttcKlX//a0xOl9JAi4
 UUfUlsHbk+X3TXSVkZc3bwgKuuqueZNZC6GtcrN5Yc7ryq3j25MIunANxWV+79wugMzG91RBm/t
 ATHMqe66NCVppdwXYEw==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad82920 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ZgtpBRw3GK28A7t1_lEA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: n1c2wl12d-gwjr-ZZRPCSWOklSCQOnvw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMSBTYWx0ZWRfX08/RRlEYFsoj
 cWTdYDPZVWDJkWVGG7KuiAd2G/6Ui0nkY/IuVR05FHUsjYHzqFpSvEVb/JasX/G8pqYjZ0lrtXN
 MKMprQiHtiTpu/edAiSnW/nIoEN16PY=
X-Proofpoint-GUID: n1c2wl12d-gwjr-ZZRPCSWOklSCQOnvw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210011

Derive the AIF_TDM_RX_8 and AIF_TDM_TX_8 backend channel count from
the cpu DAI TDM slot mask in the DT, using the same tx/rx mask
selection as q6tdm_set_tdm_slot(). Each board then gets the channel
count its dai-link describes, e.g. 4/4 on Nord RRD, 6/4 on RIDE.
Keep the default of two when the link has no TDM slot description.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 9aae6aadd43d..f3fb13145b3b 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -303,6 +303,22 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	channels->min = 2;
 	channels->max = 2;
 	switch (cpu_dai->id) {
+	case AIF_TDM_RX_8:
+	case AIF_TDM_TX_8: {
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

