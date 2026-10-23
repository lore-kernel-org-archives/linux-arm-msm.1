Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775902;
	b=Xx6GSKyPboojtuzHczKwmNxzOczAtYApsvSpRRDkyPS8nqJlaIWzOfRKrksC4yJpOcnn
	 SVOWQSPz/uAayp/II6qGZXdXKjR9C0jGMZXrxKOgwmk7cpKXD8sjbo1UJcLWNcLRE/oQ4
	 Wr3LdJLVb3aQ9nfDuBohOLx8CQA4rKwJzQEsJozYfcx/doFrY2jo4KrbwgZoyNdmIXdZK
	 EWqf+UxAiZV4bmiHfyvAL+N1p6TwSVuNUYIGxFwQlorqpM6S8ncQJrAHCQRjvn3jUYCVu
	 8ILbwqmqpSozEYhwZaOX3KL3aWdwMS6s7psKvnuLuR/a+8PyzXb4lWwsuFeWmZBx/qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775902;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IwyToYvHi1Bz1hiwX/Vbh3aizuwmjoh9pZ0oQh56Bzg=;
	b=5GVUvDHkSDc3AfvQxmBx2rBX5ufMKx61+MDDAG3kym6D+nM3q3H2RIPliXFdY+x3TEAt
	 f2fnFPrX4T89+nSI5g3KwsPMLrUHN/0ddpmLcO/AhJfNhG+6LVMqiRYePRt83yGsNj1OL
	 Wo4bKXGywq9oJvNqYUctDlsKufnCR71I7ITKychqbBrCAk6UnDHcOwNLUlcPUf1liHwD9
	 3I+k9rSb4bUSOoecE80hv31VNAIPwOSt8mAq+6HeDX+iU1R1ra9TWEICQ0Zcw5o49oa1Z
	 t936lGd2FwLIwGPHgIWe2VCuU5sTf3ULGonhLeKanBaeWttiaLUt3a+ntjnnMu2W/DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mT1oskss;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AiHNwOuN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC92E606AA32
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC92E606AA32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mT1oskss;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AiHNwOuN
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG3w8Y2931273
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IwyToYvHi1B
	z1hiwX/Vbh3aizuwmjoh9pZ0oQh56Bzg=; b=mT1oskssTjY7dBGpzuiuOrktApn
	bhOZBSmGiZAmLju25udAAhAtKjb2/Sc35c3cRJLQ8DOi5pupSe9RkmcW3iDZuTWP
	KF5Ip2MH2RSWl6IslStlV+B8HDFjWbN52Gw9RFY9CLDOsGdjTX+qSkmDI4sGofzU
	DkBDrbno5csT/wro47uPViLDBUtaWsY0qp7/u7Chm77VbI5Vy8BtdqrGm0XOJutX
	q257b1ojOWmcLkZ7U3ngKVI3oaPOwYfQCh/rJagofXOAfaVVcLuhG+achAcLGD7z
	XZmLsUYiOz3I1f1akBYLy3dtdmfStvu11mC1YVKlElerV4xRJfi6RKUWzaQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas6r8wx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so227213085a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775900; x=1793380700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IwyToYvHi1Bz1hiwX/Vbh3aizuwmjoh9pZ0oQh56Bzg=;
        b=AiHNwOuNOaUC3/bX2eQvupYiaKojtMMQIbzy9lW6svvpPd5CszS1ijqVgQwjWYiRnt
         hj0cHpuYgjAMz4tSePlPTQs4iuPT/iBfsDxu1k/3tgAtaNr5dM40TLSf/B1xOJneGefM
         0E32YKeQ6oyLljAqoZzAw9tX2H1EwYSf9HstNmvrLMn4EIK/Gs4JmHgbg1Z/ULBoHaWG
         tMpc8zWhDnf6UXESKS7e6BW+p8t3FoE1WKGkde0XwE5ts386jHiZI1LqIaw9qNMqE3wC
         CMaoLhW211p2qnr8zeEfuqumLH7qRKE+9YPzLviTsmIqDJRhIXAI5S7Od7ll3pvTUlWd
         CViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775900; x=1793380700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IwyToYvHi1Bz1hiwX/Vbh3aizuwmjoh9pZ0oQh56Bzg=;
        b=j78sfVhKgLSABZUC33lFxqozy7anuByP8G9MpnNOWULVcAkGfDpQARZgJsGDMey60I
         G3O6+D6WzDyVzboAgW7NETwaHdHc7FkK/QFAi/f18HpAM7eqRTaGLoAIgRSftmAY0O/n
         vMBHQ8X8GXzseZf8Wej4w3OdhzYp4PFhKm+/qk3FJ6qit9KKU4GhNyqCLvqogEGzU/54
         VInf5JoE/kzaC8tItXYuYM0OoztKY5dugzL1T04o+ATjyJr2iDYBs5ppR/UAKXhO4RcG
         y7tRK8h1CyPBdNnj47VwXi4rnbSAm6KCs8jPPZijwASdeUYKQ+gKXdNByZ4mvrr32o4z
         i8HA==
X-Forwarded-Encrypted: i=1; AKwUvBxqJZH30wbDH7Py53+PPswgrMiKDRJWF4N/Nw0rT9NMpzNqQFv4rH9CLvIe//c7m3T8FruPKoj/0649gzVe@vger.kernel.org
X-Gm-Message-State: AFq9FYJ61AS5DtTtHugGe6P7U7NNq/H5m4rngmgwYymOU+z3MUHvVkZr
	VErTrNoN8XAB7GnQh6KeeiUpWFD3p1KafSUjZdlXBWIMRfBM4zP0Mkx8Bo8ChCIt2DXsRYj87EA
	uAW+DOeOutq8z3IPK7XFFBWnVr6HW3DBPDXu16d+tPsTGA3wN6501F0Gmd/pfkHrArn2O
X-Gm-Gg: AYBFou0qP1MQLXvVcxNpQDY73rw5vF5i6xTcpkIAtG4Ji9zybkX01JhgU54+81ERSzs
	uYs0M+pixGTGddBK8gxItiQKVGTiLWMXJ+SqmRGY+r5EdoyYcJuocCLXm+S2UeS77ARx8rFoYj0
	UFmxM+0w/4tsg+H+KsQrmXEEbHOqzhZhXWnIBfEcV2/+AnUMhxLiV9y7SR2gcs+LtdNe/Qgn66M
	lC+pK+VrETMOWj+Q6D+/GWGJ8l1wcWbqnWJ4txWsUKou85IPDQg0xcKuSutUhl1lLHMzFabMKyZ
	ujmLv0eAltO3GJeQTpCuV7Ipj51t1qNW5DfPkAmeFgPOoc00SuBI6G6j+tYxYH3EeTCdWEGJIv0
	cB7wE9+5yTDGU
X-Received: by 2002:a05:620a:3704:b0:93f:8f9:7a83 with SMTP id af79cd13be357-93f627dabaemr1009222685a.43.1792775900219;
        Fri, 23 Oct 2026 10:18:20 -0700 (PDT)
X-Received: by 2002:a05:620a:3704:b0:93f:8f9:7a83 with SMTP id af79cd13be357-93f627dabaemr1009217285a.43.1792775899700;
        Fri, 23 Oct 2026 10:18:19 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:18 -0700 (PDT)
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
Subject: [RFC PATCH 18/23] ASoC: qcom: audioreach: add speaker protection calibration state control
Date: Fri, 23 Oct 2026 18:14:28 +0100
Message-ID: <20261023171433.820092-19-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX2cAhZ87c4hUI
 9g0PC9Syc+QLm8tX0ZuFTqHaJUJ8R9hrbigHJhzE2c7UJoxu30lTE6AJZsEoqSf3ezDvFDYwy2z
 QVMkquh3Az6lPWTk93vRpmcqWE7ijzj3hDlOLg/rl5AP9ZD7p0mwZ8NZosjlgAlTWnz5t4q0AOp
 reuA91SEbmhqF1AGAkeuPATySCnUtSddNKMFkiO+d4JV4v6n+Q+/+3MlJNRMFtEJRAPPBXmbm2q
 RPIcxUaHHccanlowBqNPCMysDpT8kEGhFEKZBEJGJ/lJkSmUf/yvu88kgJ0D0XzX8hJHQs7tmZ3
 cbZAo6ADvIgGVxXbd+eO1dA+Ufa+HdoxLsWAOLhTnrpd1HAjenmCopd2w5X4N/pRveF4i6gBkyW
 AgppzBBXVPTtJndvaIKVfRuu5Cl5m9LfFrTsdLt4/yNNEq45tZbIXndavH4a/IgwynH+/rkQqHS
 StPf57pD63j3uXxY0Mw==
X-Authority-Analysis: v=2.4 cv=DK0acCNb c=1 sm=1 tr=0 ts=6adb96dc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=kkz25WANwqfBvfs1KZUA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: HgP_BkjRdXTcxFWAcXALD4IX5VkgG5zP
X-Proofpoint-ORIG-GUID: HgP_BkjRdXTcxFWAcXALD4IX5VkgG5zP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX3roxxhvXc/xn
 Ev+fooM+eDGZUYyj/LtDv2JSZGAKdZCC/PDSDdG8OpGd09LSUWVAaQFgrRW5evwr7agAsroWT9+
 NGMJ3wg67LpBsFs9fkyEAyyr3jeBTek=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

Add a read-only "Speaker Protection Calibration State" control with
each speaker's last calibration state, so userspace can follow a run.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 51 +++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h |  2 ++
 sound/soc/qcom/qdsp6/q6apm.c      | 15 ++++++++-
 sound/soc/qcom/qdsp6/topology.c   | 18 +++++++++++
 4 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index f05033cc3f7d..3eba0a9a0372 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -21,6 +21,7 @@ enum sp_vi_cali_state {
 	SP_VI_CALI_RUNNING,	/* Events arriving, none decisive yet */
 	SP_VI_CALI_FAILED,	/* Run finished, no usable R0 */
 	SP_VI_CALI_SUCCESS,	/* Run finished, @r0_cali_q24 valid */
+	SP_VI_CALI_ABORTED,	/* Graph stopped before the run finished */
 };
 
 struct sp_vi_r0_result {
@@ -28,6 +29,8 @@ struct sp_vi_r0_result {
 	u32 num_ch;
 	s32 r0_cali_q24[MAX_SP_VI_SPEAKERS];
 	u32 seen_states[MAX_SP_VI_SPEAKERS];
+	/* Last calibration state per speaker (enum vi_calibration_state) */
+	u32 last_state[MAX_SP_VI_SPEAKERS];
 };
 
 static struct sp_vi_r0_result sp_vi_r0;
@@ -1616,6 +1619,21 @@ int audioreach_get_sp_vi_t0(long *vals, unsigned int count)
 }
 EXPORT_SYMBOL_GPL(audioreach_get_sp_vi_t0);
 
+/* Latest calibration state per speaker, 0 before any event */
+int audioreach_get_sp_vi_cal_state(long *vals, unsigned int count)
+{
+	unsigned int i;
+
+	guard(mutex)(&sp_vi_r0_lock);
+
+	count = min(count, MAX_SP_VI_SPEAKERS);
+	for (i = 0; i < count; i++)
+		vals[i] = sp_vi_r0.last_state[i];
+
+	return count;
+}
+EXPORT_SYMBOL_GPL(audioreach_get_sp_vi_cal_state);
+
 int audioreach_set_sp_vi_r0t0(struct device *dev, const long *vals, unsigned int count)
 {
 	struct sp_vi_r0t0_cfg new = {};
@@ -1695,6 +1713,8 @@ void audioreach_vi_calibration_event(struct device *dev,
 	for (i = 0; i < num_ch; i++) {
 		u32 state = cali->cali_param[i].state;
 
+		sp_vi_r0.last_state[i] = state;
+
 		if (sp_vi_cali_state_is_failure(state))
 			success = false;
 		else if (!sp_vi_cali_state_is_terminal(state))
@@ -1753,6 +1773,37 @@ void audioreach_vi_calibration_event(struct device *dev,
 	dev_info(dev, "VI calibration complete: %s\n", success ? "success" : "failed");
 }
 
+/* A run cut short never reports a final state, close it out */
+void audioreach_vi_calibration_abort(struct device *dev)
+{
+	unsigned int i;
+
+	guard(mutex)(&sp_vi_r0_lock);
+
+	if (sp_vi_r0.state != SP_VI_CALI_RUNNING)
+		return;
+
+	sp_vi_r0.state = SP_VI_CALI_ABORTED;
+
+	for (i = 0; i < MAX_SP_VI_SPEAKERS; i++) {
+		u32 state = sp_vi_r0.last_state[i];
+
+		/* Slot never reported: not part of this run */
+		if (!sp_vi_r0.seen_states[i])
+			continue;
+
+		if (sp_vi_cali_state_is_terminal(state))
+			continue;
+
+		dev_info(dev, "VI calibration channel %u: aborted while %s\n",
+			 i, sp_vi_cali_state_name(state));
+		sp_vi_r0.last_state[i] = VI_CALIBRATION_STATE_INACTIVE;
+	}
+
+	dev_info(dev, "VI calibration aborted: graph stopped before the DSP finished\n");
+}
+EXPORT_SYMBOL_GPL(audioreach_vi_calibration_abort);
+
 static int audioreach_speaker_protection(struct q6apm_graph *graph,
 					 const struct audioreach_module *module)
 {
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 7345b6d15f58..6a08f52b7786 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -1141,10 +1141,12 @@ int audioreach_set_sp_vi_r0t0(struct device *dev, const long *vals, unsigned int
 int audioreach_sp_register_speaker_map(struct thermal_zone_device * const *tzs,
 				       unsigned int num);
 int audioreach_get_sp_vi_t0(long *vals, unsigned int count);
+int audioreach_get_sp_vi_cal_state(long *vals, unsigned int count);
 int audioreach_add_sp_telemetry_controls(struct snd_soc_component *component);
 void audioreach_vi_calibration_event(struct device *dev,
 				     const struct event_id_vi_per_spkr_calibration *cali,
 				     u32 num_ch);
+void audioreach_vi_calibration_abort(struct device *dev);
 int audioreach_compr_set_param(struct q6apm_graph *graph,
 			       const struct audioreach_module_config *mcfg);
 int audioreach_setup_push_pull(struct q6apm_graph *graph, phys_addr_t bphys,
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index a4502741d87f..41daa02febf4 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -813,10 +813,19 @@ struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
 }
 EXPORT_SYMBOL_GPL(q6apm_graph_open);
 
+static void q6apm_graph_abort_vi_calibration(struct q6apm_graph *graph)
+{
+	if (q6apm_find_module_by_mid(graph, MODULE_ID_SPEAKER_PROTECTION_VI))
+		audioreach_vi_calibration_abort(graph->dev);
+}
+
 int q6apm_graph_close(struct q6apm_graph *graph)
 {
 	struct audioreach_graph *ar_graph = graph->ar_graph;
 
+	/* Covers a graph closed without ever being started, e.g. on prepare failure */
+	q6apm_graph_abort_vi_calibration(graph);
+
 	graph->ar_graph = NULL;
 	kref_put(&ar_graph->refcount, q6apm_put_audioreach_graph);
 	gpr_free_port(graph->port);
@@ -852,6 +861,7 @@ EXPORT_SYMBOL_GPL(q6apm_graph_start);
 int q6apm_graph_stop(struct q6apm_graph *graph)
 {
 	struct audioreach_graph *ar_graph = graph->ar_graph;
+	int ret;
 
 	if (ar_graph->start_count == 0)
 		return 0;
@@ -859,7 +869,10 @@ int q6apm_graph_stop(struct q6apm_graph *graph)
 	if (--ar_graph->start_count > 0)
 		return 0;
 
-	return audioreach_graph_mgmt_cmd(ar_graph, APM_CMD_GRAPH_STOP);
+	ret = audioreach_graph_mgmt_cmd(ar_graph, APM_CMD_GRAPH_STOP);
+	q6apm_graph_abort_vi_calibration(graph);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(q6apm_graph_stop);
 
diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 8bc681a633d8..75381d9a1435 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1551,6 +1551,15 @@ static int audioreach_get_sp_t0(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int audioreach_get_sp_cal_state(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	audioreach_get_sp_vi_cal_state(ucontrol->value.integer.value,
+				       MAX_SP_VI_SPEAKERS);
+
+	return 0;
+}
+
 static const struct snd_kcontrol_new audioreach_sp_telemetry_controls[] = {
 	{
 		.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,
@@ -1560,6 +1569,15 @@ static const struct snd_kcontrol_new audioreach_sp_telemetry_controls[] = {
 		.info	= audioreach_info_sp_t0,
 		.get	= audioreach_get_sp_t0,
 	},
+	{
+		.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name	= "Speaker Protection Calibration State",
+		.access	= SNDRV_CTL_ELEM_ACCESS_READ |
+			  SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		/* Last calibration state per speaker (enum vi_calibration_state) */
+		.info	= audioreach_info_sp_t0,
+		.get	= audioreach_get_sp_cal_state,
+	},
 };
 
 /* Kept apart from the topology SP controls, so FEs have them without it */
-- 
2.47.3

