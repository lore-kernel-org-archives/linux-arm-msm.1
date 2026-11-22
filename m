Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364116;
	b=zapluBxxumRaW7mZtRqCW63i7BVpttxlm008CDow9NUymHy5wlm0HQ9dEzHAQluRTU64
	 P/Aw9KSBKVZkigjHuw/dtHzuVtMn3gNOUotCqxSjxFgGanBHv/JG40nC2AGT29CG52dkR
	 nhScf+u6zJsrszoS/CrsvCm1rm6iCxbJO/8bfrue4lKLqiZ8+DzNrxvmKtmyX02Zs/Vcc
	 cZ4Y09ni68cQ543rnkc++ai9x45LbAMHmwzt0SFJZ6fslLmIzbdt+vX6QQZGkCF9AHGIQ
	 9zCadh1GhBA/XwLac5NWeANVbPiEYFfT8XQmKng03kGFRwCerrbhwj0w7zOtZgBmajQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364116;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Xe9mNmGNVrgK7uWOt7PejiC56UqOuv9iVTxY26r7kf8=;
	b=hJnII9Tfa7yVJ6sRtajBsUOv8Lp1ubCXPnQCyC44Mh/Jba3LufqgYiYOLC1ovREkWXMd
	 hGiuPaHVZLMfQ6ifbva2wIYfcwLhR+9JE1MLiwBtigLP+r61g474taRKeQzEn5XEJo7Ov
	 Saaz842NLOjI1SbZ7pQtescbSwE+mTDfC6cXYJsmmo45nMIOcq22pZaOEFRmUeclAsjTx
	 jBm210o4hfvfvA+elNHcLXncB3pWqjeHlevLD6nOKfEVARQnbsDi3+UplfnE5GKaEPPh0
	 lf06Wk4UosRrEjBe+QuZMqMFQI469xprkMasA9ZSPQwv/ty0mNxohq3aebZGUuHCmIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lD2kb50o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PAUmqffo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC32606C561
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FC32606C561
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lD2kb50o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PAUmqffo
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQnKM1248380
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Xe9mNmGNVrg
	K7uWOt7PejiC56UqOuv9iVTxY26r7kf8=; b=lD2kb50o/CmUvZAkZUGmaOPR3zo
	ugh1ulOK+h8IWxdZXdl0ashI6+BSpcTNTwSWI7feOjbpnoP91r1f/o+wsi+CM7mn
	tPDKbNW1DhhAS72Eef6FaXlBgVvLep+oKtABMlfYXQI4WwQPmB4EmryCr5eEtgQD
	zBcsKE347dusT/KJx8ljOHmTL39ZvHMLA3p4Raupu7WkDBUDlCvEQXlEVGNoYk7m
	tSGoiaCprWWD6oQzm48yNbULcM+8p/XUW2bpqnmkWeL7fjVCkiFgqho4mOpyKqPC
	zc//MgbCt8Oc6prp+p9hCaeL71YKZlVIldTRI5N2Wnl0xLaTl3InBqrNDDQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32w03rvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-921286add9fso46578956d6.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 08:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364115; x=1795968915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xe9mNmGNVrgK7uWOt7PejiC56UqOuv9iVTxY26r7kf8=;
        b=PAUmqffozjd6kpMEtcqqtil4WserDjEBG4hsfIbq7RQN8wPEvs2dgCeBZoCQiSoP5U
         KaVw9jlPN6HxMmMVO17AbTxSpb4+mES2gl7pdAA6EzogZhKhJLxHmpLpWcWcoaMmVA2I
         nRulq6tNJoda0RuENDR1HWj7ABkWdHOJprqxXvGtdMYduJrk6livbs+G3GbjOSY8xPE2
         +zux9KallTW8izr9H0wC4zM1Id1AYjgPjfKl0EEFjlMDLNAQSIF+SiSQgKfJ3mZRMtL8
         CUMWuZ/CLRk9UcSE5NuoKw2A6QSVdvua+8zRmwdDAtrLJspvN1LlZaeCajEUtPqj5acn
         3Upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364115; x=1795968915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xe9mNmGNVrgK7uWOt7PejiC56UqOuv9iVTxY26r7kf8=;
        b=0lVxvY516TvF8Y59u+lTwCeFN1ysHWYikV0V7N8qWXpRDR1Er6jw6i1SyvWXFe8Dlx
         ITc/k5D+nFUWp6ohDDZJob9QhHhHUbvzeMLgVnsaagtLheWGpCxV2KxHvrTEmVm6ST13
         AKe5ce+O5yG0TAGgQg7lADzSkpBsTEarCMXHNroVajrovX55svYG6msAyqa64ItNmu1S
         vIIon4qb8GhNkjupk2zvx1eRQ08ZB6/Dzr7h+nES3DKz3rIj5aydjJ8rUJlNlemlyqIa
         TEeHMoxb6kWSaILvE2MhV1opOxtg5LjXZ1k/xlL+8CdpRofQcjlK/SHUgonnNtjCnxHQ
         F5Sg==
X-Forwarded-Encrypted: i=1; AL+hErFIsa0DS3+kDp1uX7/NcAiGeUMixa1M+HBFwfR4qSv+wS7/sfr1j+oiVv+V4aG+16CnPidD8wNPCbcn+Vh0@vger.kernel.org
X-Gm-Message-State: APuU4Z/H/vhbHk8MwgQ2RB+3pTrWvhW2FMUoZFGoaqY/Gm11XXN9EB+U
	Y5IZQiwkHqOhTtzpiSMoldEjFS99qz2qgSZK0Hev3TrMKxIUdBrLiTn/xHrHJDtYbM+NaU4d2jS
	o+S1KdkLEoZ5yFPghcmXzZ00WX50Mc7aUGwRl1P9Ow8goKcoJ3VRk1GNuGFy3Ppar5zf+
X-Gm-Gg: AZFdTZdVQTRqqDxYh2qdktWcLV5fW8CjChsySak3SFw+iiYMzmBUSbTMoZQ3C3lqfjI
	wkZHAtDgtAWIoSYmu0S7d7pMBC1/HnEbv8dLEhJGvGx5M4+ZSed28TX68zTP/jWQpt4cI1NI3Fr
	DqBco8opzqg91nWmkNmGoCc2I1t+A6U/3Pyke8f4BpI/53b8a/3Eb3GPiz+xWZQSJy218MHpav1
	m0/hJOutC7ArwALnMDhNMjzJoEntBIROfPzxNxhFkgs92zTDJOZJ/ZQviU2LeU5y247fZ4q64wo
	/4U5AG0Ax4oTQ1oQlgb9FXJO4IGHbyN4r7lKx1jYlqPsICLL+xldktD0r5VaAqa4KwHfJMPw++z
	XuBOwny2zvoyz7sU1WdATo2TIYBUv5aaK0r+aHtW8U1Frf229OARJhmOFsyO5TJ48
X-Received: by 2002:a05:620a:2844:b0:943:b019:f011 with SMTP id af79cd13be357-949ba9b3e47mr1619400685a.28.1795364114606;
        Sun, 22 Nov 2026 08:15:14 -0800 (PST)
X-Received: by 2002:a05:620a:2844:b0:943:b019:f011 with SMTP id af79cd13be357-949ba9b3e47mr1619396085a.28.1795364114124;
        Sun, 22 Nov 2026 08:15:14 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:13 -0800 (PST)
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
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 16/24] ASoC: qcom: audioreach: add speaker protection mixer controls
Date: Sun, 22 Nov 2026 16:14:29 +0000
Message-ID: <20261122161437.5994-17-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX44NzmtbituY7
 g1XoW6Cz1nEc/2XBhAFnok/YzzYDUqAShB6jrV3I9eu/n/sl65SXR+h/k174RByMvhnNWb9AL/M
 1pZWZD4XBRXryjXdMHiwfxP+7qC5x3vg3A0TnFx7UeWKeeupKoVNatDXFxI1Mry+VN8/rccXA5c
 fpjcnVPXnV6lMqbULAiS5QYw9ly6zOGx2tUuMG4CG3rJDeO+AFyhDJC16YCiwvdvGORcl7cwL5U
 aQ8Mbq3TeTnzj5dDUApMgGm0ypmqKRGAgQ+4oIm6NMNlYTELJn+ZjueYHGC9EwG1pbTdbREAD8G
 /3Sn8Jc5pmFpz6e9kdLy8e/qTq5whBdBk6+yO3Mpb10qDwnlbXJ39QjFXpuKxXSjtppd14io4BK
 vuXjLwaoqxkn6iZb8Ycu/rN3ETeryJSkF75OfkDzrrMRn3N679p/S0C8FE8t6n8w+QdFVypZOx9
 +T3sOwMsq5wGy4g8LmQ==
X-Proofpoint-ORIG-GUID: RgLQstDLMv1km-qh480r2rBvVN1l8fZi
X-Proofpoint-GUID: RgLQstDLMv1km-qh480r2rBvVN1l8fZi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX6DNUm+u3vpaG
 xCKg8ZC/VKcv8y5zyMb+o8+V9wA6U+b561bV00AOWXKoQDT23K9LM98Y5kQSQZdUJBWs5MyPX2C
 XNgEIAX5SoqZlOoO0EF+MGnkZ+RigwY=
X-Authority-Analysis: v=2.4 cv=S+dMU4sP c=1 sm=1 tr=0 ts=6b031513 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=z7hZsS5TAAAA:8 a=U_FWf4IRJOzsE_kR7ycA:9 a=OIgjcC2v60KrkQgK7BGD:22
 a=Qe1wxHrAD-1Q-kOd8w1m:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Add topology mixer controls for the operation mode and the per-speaker
R0/T0 pairs, so userspace can run a calibration and restore its result.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/uapi/sound/snd_ar_tokens.h |  2 +
 sound/soc/qcom/qdsp6/topology.c    | 75 ++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
index 7ab8e11ca5c2..db62dc7f9c8a 100644
--- a/include/uapi/sound/snd_ar_tokens.h
+++ b/include/uapi/sound/snd_ar_tokens.h
@@ -57,6 +57,8 @@ enum ar_event_types {
  */
 #define SND_SOC_AR_TPLG_FE_BE_GRAPH_CTL_MIX	256
 #define SND_SOC_AR_TPLG_VOL_CTL			257
+#define SND_SOC_AR_TPLG_SP_OP_MODE_CTL		258
+#define SND_SOC_AR_TPLG_SP_R0T0_CTL		259
 
 /*
  * %AR_TKN_U32_SUB_GRAPH_INSTANCE_ID:		Sub Graph Instance Id
diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 5dd7f2c51d5c..c07a27bdd3a2 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1465,6 +1465,68 @@ static int audioreach_put_vol_ctrl_audio_mixer(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
+static int audioreach_get_sp_op_mode(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	ucontrol->value.enumerated.item[0] = audioreach_get_sp_operation_mode();
+
+	return 0;
+}
+
+/*
+ * "Speaker Protection Operation Mode" is read-only status.  Enter
+ * Calibration via the "Speaker Protection Calibrate" trigger instead,
+ * so a stale alsactl state file cannot flip the DSP into Calibration
+ * and nothing can leave the system stuck there.
+ */
+static int audioreach_put_sp_op_mode(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	return -EACCES;
+}
+
+/* One R0/T0 pair per speaker, written as a whole set */
+#define AR_SP_R0T0_CTL_COUNT	(MAX_SP_VI_SPEAKERS * 2)
+
+static int audioreach_info_sp_r0t0(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = AR_SP_R0T0_CTL_COUNT;
+	uinfo->value.integer.min = S32_MIN;
+	uinfo->value.integer.max = S32_MAX;
+
+	return 0;
+}
+
+static int audioreach_get_sp_r0t0(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	audioreach_get_sp_vi_r0t0(ucontrol->value.integer.value,
+				  AR_SP_R0T0_CTL_COUNT);
+
+	return 0;
+}
+
+static int audioreach_put_sp_r0t0(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *scomp = snd_kcontrol_chip(kcontrol);
+	long cur[AR_SP_R0T0_CTL_COUNT];
+	int ret;
+
+	audioreach_get_sp_vi_r0t0(cur, AR_SP_R0T0_CTL_COUNT);
+	if (!memcmp(cur, ucontrol->value.integer.value, sizeof(cur)))
+		return 0;
+
+	ret = audioreach_set_sp_vi_r0t0(scomp->dev, ucontrol->value.integer.value,
+					AR_SP_R0T0_CTL_COUNT);
+	if (ret < 0)
+		return ret;
+
+	return 1;
+}
+
 static int audioreach_control_load_mix(struct snd_soc_component *scomp,
 				       struct snd_ar_control *scontrol,
 				       struct snd_kcontrol_new *kc,
@@ -1505,6 +1567,7 @@ static int audioreach_control_load(struct snd_soc_component *scomp, int index,
 {
 	struct snd_ar_control *scontrol;
 	struct soc_mixer_control *sm;
+	struct soc_enum *se;
 	struct snd_soc_dobj *dobj;
 	int ret = 0;
 
@@ -1524,6 +1587,14 @@ static int audioreach_control_load(struct snd_soc_component *scomp, int index,
 		sm = (struct soc_mixer_control *)kc->private_value;
 		dobj = &sm->dobj;
 		break;
+	case SND_SOC_AR_TPLG_SP_R0T0_CTL:
+		sm = (struct soc_mixer_control *)kc->private_value;
+		dobj = &sm->dobj;
+		break;
+	case SND_SOC_AR_TPLG_SP_OP_MODE_CTL:
+		se = (struct soc_enum *)kc->private_value;
+		dobj = &se->dobj;
+		break;
 	default:
 		dev_warn(scomp->dev, "control type not supported %d:%d:%d\n",
 			 hdr->ops.get, hdr->ops.put, hdr->ops.info);
@@ -1550,6 +1621,10 @@ static const struct snd_soc_tplg_kcontrol_ops audioreach_io_ops[] = {
 		audioreach_put_audio_mixer, snd_soc_info_volsw},
 	{SND_SOC_AR_TPLG_VOL_CTL, audioreach_get_vol_ctrl_audio_mixer,
 		audioreach_put_vol_ctrl_audio_mixer, snd_soc_info_volsw},
+	{SND_SOC_AR_TPLG_SP_OP_MODE_CTL, audioreach_get_sp_op_mode,
+		audioreach_put_sp_op_mode, snd_soc_info_enum_double},
+	{SND_SOC_AR_TPLG_SP_R0T0_CTL, audioreach_get_sp_r0t0,
+		audioreach_put_sp_r0t0, audioreach_info_sp_r0t0},
 };
 
 static const struct snd_soc_tplg_ops audioreach_tplg_ops = {
-- 
2.53.0

