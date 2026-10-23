Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775896;
	b=gBDBV8zor8jQgpMt4HXTXxj4DuJ8EF7k4293VxVkiv356N0K+3OtZW77EB/JHovjMBna
	 ScX/UBGS9XXjikxYvNuHTrdaKdglgxTnBeAcqtiK2JdjvPb/I2jKxe+NTI/zqJRd4tZ8g
	 pLHHLE0sGT/UENAggVW1XZoupRvwgoo3OhKxqHXx51+blHWQghLOBggNrdW48y4cojyNe
	 r3PGbdjOdXLIjamaQX1VyLHCkp8nYGeyNcJZXMN387mxLEtkic7ERkmKoy0KYZAApVcqW
	 XKcfZ9x0ReFgRF277DTovA1uV2nlCLXD/IkkysWABVt2MgduRDc5wtXIe/KAP5I17DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775896;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=U+BHFh2JR5H1czrBSRnQE+UUSBqRmAYSBtaatxRecFY=;
	b=TnlwColvDy2oIBLeUdlMmlY8Ph8LmTYAMXBme/cOadcVoI6eQiAYizQNLzqZOPkWfPC6
	 5dqJSyuORjW35j1Nxt99K+CI2Ktq+5KuAjpFJVExhUt/iAbuZk+KKiz6dkdFv4M6PJbvp
	 CdRRbNsIqAwzlV+eQDHQ+P+c+n19pIDews/t5qasEC8/3wnGt45D5ec+JRTCzUChgt2dP
	 7IxNGayk1a0GGCRs/tKZ4yggUzPMUnz479vNtFDtt4QhnFy2STT5NQgqUQ7XnsFKsFha2
	 OR8LOkE9aY32wyRxjrkaHodAaX1VW4Kr3aUqlFJ8QctqPfGaslMDvxdvh8iKc2WbsTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="o/NHi7bw";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JAJhD95N;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554C0606A957
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 554C0606A957
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o/NHi7bw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JAJhD95N
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5sqI4072734
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=U+BHFh2JR5H
	1czrBSRnQE+UUSBqRmAYSBtaatxRecFY=; b=o/NHi7bwzHaUe0zx+U5i1aJzUbk
	n1FftPGLzrrQVKvHI6ZVfl9YPuLD2ka3yB5oegvIeLmF0RNOkDyoWYuXfSCS+Bn1
	FyH7+3rSnw38pzaskxoZqgIFGkkitbOhKLsY3kt+oqDfEWLYaayJ+KQ8TzdUj80g
	VeU8GaORhFGG6XttX2cSEagqinBCIgUFAWp+tXQerlen3kSKcTGTI2Jg/FzlveVe
	OS8/PlNhJfTzeJQsKoK8yX8J85lKm4okhodWfLS6vhzyKFSt1F/dSKPvkMNgAZaf
	iChj2cGz+hQfv8f19rNOPEdGwVgRpMdBnzSzjBXdVUuzcX5C7SwEF+8fExw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw15fw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f3969a2a7so188024185a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775894; x=1793380694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U+BHFh2JR5H1czrBSRnQE+UUSBqRmAYSBtaatxRecFY=;
        b=JAJhD95NUHJsRhjgowg6T5MQ/LGaDz8JgBjC5wyTrwLwm63R6Fj6Dr7/m4XbrJaTNW
         i/1oP3GnLmFrP/ZzOgQeBVLW3I7mRdRk1ZJ/iTE6/9McWKYYStd3DbV+xj+9hN1fw0M9
         pD49B4ODwZ4r3XIGdXo/DeHkecQaO+O6O8aL/iFpQQfyRLM5s4wzxedJaOmXrA9VZIxx
         liEzJ+7BYtzw81zkMkWJ3UQkog4PR8la1wfRvcGCMwF5IGb6UO6eqz3S04MFgumCcO+5
         iqJRQBam9YX6hbo3UvejAUNt00hsFbC3HZS3Oxzy9tIFsJah+L8PllLpbhlss4sqWduM
         bjjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775894; x=1793380694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U+BHFh2JR5H1czrBSRnQE+UUSBqRmAYSBtaatxRecFY=;
        b=hSOLiq4PUIsQVtMYwdXK5VCzl1+QGhGZPVQ2NAItDPDlIrZvRoR0kYKDSgqSG+6Hpw
         dODRmq7MEBXMd4Xrhs9NofSlzFNe+dOOM0UBJuuOTVDuSXKvBtTe2cNIl6cQYSgiyeQR
         Vrk0CVzhL+83H9R0Q0dxoUomVoEIORINxfABrAtL3SMUfREBV9HUeHhafOXpWDxz7PXr
         FlbITwsHtHJI4VfyuCpxxGwbY4izrGHpKOD7ot8UPu+9pIkiLotto7fZxW7226q3k/K1
         AvLivlKfoJDV1N4iO6ZtixhLFZXEeu1TZJUpJDHLQmeYLDLwaY9eGGnuEV4vOxSabK8r
         dcqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdUrCOSMNtKu60RAqq2s0JocWXIxqmLVT7yYqSvYmggCcTAB4VmlsdzU7PBpZPLfvoKshKF59fVjx/RTn4@vger.kernel.org
X-Gm-Message-State: AFq9FYItC8DO56dqEdFvmyaZJKDSrj81WhGVb5LxRBEYroXF8b6SL1oC
	2b4Yi7WgTLq25y/zMfSKUs8q9reH+wQYazVbwS959K6R3ZcM/VGrf0kozZlj7qvxvOOvHDmtKuT
	Qt/0GUXG2Ec6V6dgNB9XkoI4eiiAbsYpF2nIrfSX3WmE4wEV9BrrbpAx/L7hy3LhNwrI7
X-Gm-Gg: AYBFou3xsy8H4Uth5vRrMC8wUvyXBmF7wB6Pqe6LWfdMeUuRZqOVni3Xhtrh+hmZu22
	cFMIEg8NN3uaRyo2auBTK3seAzpoEzDHfWxqsSI7LTkQr/t/DKqQxShVZX0buE0reLaTVY6tMu4
	pDXDoDyr6ybPNzGtIhG0pfE9HQ/XxwC7srXRFOCvfZToQx4ZQcsWphZI+XPQuzuEJvAcL7vXCfu
	qfq3/ByyIl6MRNCuaI9idI8vDa7CTNlBJk6uqL4NJoQO0Hgi0StgQKQZ44s8FLPd4cc+0RErK0y
	9/4fajvnDetcVsXYvLVrAZwydCZTJtI+0kp77/h8Xuq1VKFHvAGpMxqEdCiwOxGCNFEtNySAs6W
	AHy1z6/4/jw0/
X-Received: by 2002:a05:620a:4515:b0:93e:4b3c:19a1 with SMTP id af79cd13be357-93f6f7e9cd4mr552284785a.44.1792775894368;
        Fri, 23 Oct 2026 10:18:14 -0700 (PDT)
X-Received: by 2002:a05:620a:4515:b0:93e:4b3c:19a1 with SMTP id af79cd13be357-93f6f7e9cd4mr552275785a.44.1792775893579;
        Fri, 23 Oct 2026 10:18:13 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:12 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 15/23] ASoC: qcom: audioreach: add speaker protection mixer controls
Date: Fri, 23 Oct 2026 18:14:25 +0100
Message-ID: <20261023171433.820092-16-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: eQBErVuSfSGhDsQ5flGj2A4eruudVxuv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX/7DSwHA6uD2/
 JiLnzIDdMbxc1uG8bFIHBYpwA3WKzpx/46Mb+ZOOUJ9xE9RBuapjro2faBO8vwrKughGgDPWyBM
 d6wAo0dE1xtZTp3aeyvnPLAnaMzzWBo=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adb96d7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=z7hZsS5TAAAA:8 a=9gDSyMU-ReTuyL3ZNT8A:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Qe1wxHrAD-1Q-kOd8w1m:22
X-Proofpoint-GUID: eQBErVuSfSGhDsQ5flGj2A4eruudVxuv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXxyeapv595cN6
 LQHd/VccF5qOGyNIndYv0gk1uEjvju3o8IUGqN4wxK7Lh/rF84my37Sjjcpvhr4sCMsP+DWORpV
 tLRw7ivQJ3Igqb5Tdaw4IVq4vUqPhLj68XNnfnzPVU7RJdLYUopKz6Jv8bxOyVP9/o3gUdIg3c+
 H2WR6TRbiXaddT8NwvGAcUWxSZmh5dw+T5EObv8c2Z3SUo0qvxFP9IWLE4KxLj5TpNieUo5biul
 7cr5TA1WaxF9nmFjcIIJhwiSqpBidk14gZyTZcO1a4rEErQHBWveErXNHOFKaBDSM+T0EzLQIVe
 XFNjmGhfa7sXf31K8YD+Hc7WCW5/fWd8Kq1UNhmYacLseWW3ebvRjz/9rkxAZbBuJdMOAfsIExf
 XjW0qZpEjjlHN6nULrWnfFu0Gcjfn7DYob0o3LGwrlWd8in6vJTc9xhr6MbIJGYbaj+APJYOKQu
 /yuJwS5nzQgFgl97D7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Add topology mixer controls for the operation mode and the per-speaker
R0/T0 pairs, so userspace can run a calibration and restore its result.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/uapi/sound/snd_ar_tokens.h |  2 +
 sound/soc/qcom/qdsp6/topology.c    | 80 ++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+)

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
index 5de7e821e5f4..6316d1ab0675 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1463,6 +1463,73 @@ static int audioreach_put_vol_ctrl_audio_mixer(struct snd_kcontrol *kcontrol,
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
+static int audioreach_put_sp_op_mode(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int mode = ucontrol->value.enumerated.item[0];
+
+	if (mode >= e->items)
+		return -EINVAL;
+
+	if (mode == audioreach_get_sp_operation_mode())
+		return 0;
+
+	audioreach_set_sp_operation_mode(mode);
+
+	return 1;
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
@@ -1503,6 +1570,7 @@ static int audioreach_control_load(struct snd_soc_component *scomp, int index,
 {
 	struct snd_ar_control *scontrol;
 	struct soc_mixer_control *sm;
+	struct soc_enum *se;
 	struct snd_soc_dobj *dobj;
 	int ret = 0;
 
@@ -1522,6 +1590,14 @@ static int audioreach_control_load(struct snd_soc_component *scomp, int index,
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
@@ -1548,6 +1624,10 @@ static const struct snd_soc_tplg_kcontrol_ops audioreach_io_ops[] = {
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
2.47.3

