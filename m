Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775904;
	b=bJuYHXqgHmqcBBclCbR36QlUGImV5OYQuJMFAaUyhmvnp0MmCHwzbpUbDAO20GRvDkqV
	 yW0XIdxra54FiCoo/+U5xUhaq6qlXXsWPyszMO7o/vJVC1IVpWmpPABL9IBQ5kWXyMztL
	 Ex/gSrfcFxQ+btEieQoH/RvlgdCpl5dXJ9tIVWmcTBqB60q4UX/ElaD0NqPmp+Mx1GAI1
	 6Pc8W6x6xp0IECnxlt/tc6aUZQOmnBBFruPYQmlU0+X12XxhwZVRMpaFG7RpVyG5R5xlw
	 VtObeUCutXAiS36f5NRANhNv9gH+PVnbCueDv8OfGXR6twrSwUOE3JPWMgiKGGvwzvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775904;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M9b4xWrqlE0Kv3+ymwpxhoecVabQr8ouhVupqXjGu1k=;
	b=lZnlhvLNbz2nDczaiu5fjjtR5zyNghDJ99YGP1Jhg54L26dzMODOVSEwvNFnW67zCVL+
	 57M4+Sf5UogFG9lIAASI7ZninMqQ09k8HYmT1XpzQZivc8xnM2xHHnJAAUTNIp3ePYgU7
	 LA7sA5jmKKib1wYPzI0jVS3fClZ0i9Xp0BknsisKv39XaaAD8azrkWJB8lxTLgwOn+Cuc
	 1ZRK/Y8+UK1ryJHgW7Lha/vSh/419KJTssG6nAdFo51HXISet9CFVeAeI0ShwMTs1Bm1J
	 /kyvGFJp22zwF715++DiDXskOjNcVR9NvgPH1j7yNQMlNjHtMhLjiK+to8c3csHLpqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N7asCZYZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aoY4qbfu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EAD60A380B
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4EAD60A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N7asCZYZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aoY4qbfu
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG2vVq3733905
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=M9b4xWrqlE0
	Kv3+ymwpxhoecVabQr8ouhVupqXjGu1k=; b=N7asCZYZQ/M79q0CDhsr6wTFxhv
	5sGz/fRJYD/XXFByGPOAcdh+zXgky2vNSK2rm3lRpd7pYj2ExswyOEA2f8R3C2XK
	+hTA/KAgPw2FJJpGe5yG4wBXWXP36bpn6cWbwiLQdmENul+wLYUoY555IG1nL4Bb
	HKMLAkPXc5Ev9C3UvoN4yjuZHy6jD4T6aR9DpKPT7YOXd8STzrxSHtxiMOvUn2ru
	1cNrs6UU9RXb7rTRMZna+CUlDhWy6A0Zy3+MSBDZ+UxF6nlcnwt8pCHOMT3i0AQ/
	i1vgalvn3sc3Xkc9hbzUyxAyc/xhAz6HJqMXQxXxHD8+FijP1GNpw2bXXuw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgarug9f2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844cb60so203793185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775902; x=1793380702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M9b4xWrqlE0Kv3+ymwpxhoecVabQr8ouhVupqXjGu1k=;
        b=aoY4qbfuWYIAR8W9rBEtMQzfYepdax1UjkB4LVKkV5tzbmhf0kf+H/Uw3vshdnHMXC
         KvhCrG7XyBaDdYOK4z582xswZn7GcU/h+cGUcNVMDTXm8JHFisv9cIZVk7Y+elhzpgGW
         L43SIbkWwz5Sw37NQp3t/figIeyOfCZcxOxn0rLoYCZ5n4x6QcbjRZtNeWtJYIBZrU+9
         zPqabqsfv1wiqiLbKeZtkOqpe3qrOdaTPFoeaQFBKv1mCAquJHLHgZMdziN3pj+bCiC8
         lI8KX642n29RVhDfk7O7fw4CN40kMN8LRZH/LPbyuKaq/+zNTGHnTMn9etno0WY850mk
         qemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775902; x=1793380702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M9b4xWrqlE0Kv3+ymwpxhoecVabQr8ouhVupqXjGu1k=;
        b=XmBY0j92gDT6qb1hJTDwEh4qha6xrHDDonNa8voVLJMtfAjOk4s1yq4wD6DJFsjfap
         yCQzahfGuP6JTG9vJIhCFziP86OHzJjDUC/xIq7he5RQ2yniTuBgvGnPVnTaZqkkLbeH
         bG2T7W9lnYvYRdfGz3FSsrxF0EL3p1l1tjeBcdGp+2V6F7EgQ15VVA2Y7udM1xJ4BE6a
         JUJbfs6y8rwb3HOSTMuHmfHEnn0Sz1ICLg7xEzxyctDHrnLnqmF0j+AkMum2UEpltR7H
         VWyF3sGzdLuvgnM7Afgp4BcyGSyiNUud2p8wJahsSbeGleji2BRca93kFEa2aE6GCV6N
         nKMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTpI+bV8aKOQONzgWU1tX9LYTBzMRbA18gGHf6KiZW0rVX3FNHgBiJ2WRqozwTOChtlcVeX68dD8J/xo6V@vger.kernel.org
X-Gm-Message-State: AFq9FYI9qvJsF5TsD6b4LwBSn6ZrVdnTIjeQC3luwkdIW8J5q4X7fgKt
	JAIWG6JJk6TdKMO0e3f6mINsrwtBvJa5eOibPzw6W/o+nn919TpE2H1XsLrMBH0nUt1PoZ+g+RR
	cQitBOEzubt3MBJxWF7Ndy4/gnG7dHglh1Mbln+pbXwSq2UvY2YzqVJgvddbFg8ce/HhQ
X-Gm-Gg: AYBFou3yjgAEsvO3LrVPckogg3RPyC/JfkzaoD6qe7Ae1zXLbo/G6HV0yeliPcAImpU
	H5sOHBnBU/d5nWkoMpncU7XePLWBcjuUOVqz2G+UC4qbixVSprjkZCy3fOePGcudkluNY6xkztm
	uneW/fJ33OWwDb65LRX73bENT6sqrgw/jT4TBD3hfoj8fAgEurgWyfZzXqYBARm1k/DYhnqFP2d
	mEqzR0uy3xTpCdKPetHU0TT3dmMT2FzqEv/UhQ5HD6FPNCggH800DRiuZIbo22koWW976LQ3fv/
	RbuM6hxW28Wypp0jJ+61Hfl9ya/KLwy4No80kNOVMjMPaHDKt/sbHEHk1U/CA8rxJ8+4a/sMjT/
	wkFewfP33orNY
X-Received: by 2002:a05:620a:880d:b0:93e:53db:d59e with SMTP id af79cd13be357-93f627233d0mr922233785a.23.1792775901840;
        Fri, 23 Oct 2026 10:18:21 -0700 (PDT)
X-Received: by 2002:a05:620a:880d:b0:93e:53db:d59e with SMTP id af79cd13be357-93f627233d0mr922228285a.23.1792775901279;
        Fri, 23 Oct 2026 10:18:21 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:20 -0700 (PDT)
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
Subject: [RFC PATCH 19/23] ASoC: qcom: audioreach: keep the last VI calibration result until the DSP reports
Date: Fri, 23 Oct 2026 18:14:29 +0100
Message-ID: <20261023171433.820092-20-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXykL0m4j6LNzh
 9B63UCJ3seFopUD1566npRUvq3G7w5R+CQ+ENN/KDAeJMbOpQu8CSu+og/OHo99VbMoYTMCuknJ
 RXzMRZoAloOmW1jiowUIfu7K3Uxtb74=
X-Proofpoint-GUID: glLvOmYhE0qCcGYtFJomt2aa6ZXIy2k4
X-Authority-Analysis: v=2.4 cv=SK7Xx+vH c=1 sm=1 tr=0 ts=6adb96de cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=IK27QhZfs67nWGHMqAUA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: glLvOmYhE0qCcGYtFJomt2aa6ZXIy2k4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXwFwcoFXlwCJG
 UQZJebtXzRnbDv1h/7XBNUHw0PBBEm/gPSKvIOUSVSas0CSJ2oD8PKqkiVraP6yob0yhxqXceY+
 b40bn+UNAO0F4Kr7l5w1rPT2krEMT2Nj2yc0kZOwgwESZI8xNBqsdh8CPk9o3eN/irCiK50ioxy
 VzaKvyWaMjaQjdqzkAZC/jeTNW9z5a90m8dFhDrmuiwT9Gel2dIFfBUAO1XVX+5UShT6k5aD4qY
 RUD/pGtABDBM+l9XMZkC7QZcBRp3K9Q4QjyAVGfKqFVjzwgt3z+Kb9yoLUJRhpfEZp3Jsx+2LPl
 6Zg7uHBmbXeekgxRaWxhe+Abbbp/+nQOaKDotcgQv+2+4tQvPpqSQgjyvyFeNe5jItRo1AefAA+
 j5u3BIBAKjwkXJcq4qrXlt9Ow/DFXYf5q5G2py3poOXiHQkLcjhkk8R/t9HP3uM1DoV/O2RyTIB
 f4GrONCl7OfZlMWQL1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

Preparing a VI graph in calibration mode cleared the previous result
straight away. A graph prepared and stopped before the DSP reports, for
example by a sound server probing the PCM after a calibration, wiped a
successful result.

Only mark the run pending when arming, and drop the previous result
when the first event of the new run arrives.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 3eba0a9a0372..e996be54c42e 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -25,6 +25,8 @@ enum sp_vi_cali_state {
 };
 
 struct sp_vi_r0_result {
+	/* Set when a calibration run is armed, cleared when it ends */
+	bool armed;
 	enum sp_vi_cali_state state;
 	u32 num_ch;
 	s32 r0_cali_q24[MAX_SP_VI_SPEAKERS];
@@ -1707,9 +1709,16 @@ void audioreach_vi_calibration_event(struct device *dev,
 
 	guard(mutex)(&sp_vi_r0_lock);
 
-	if (sp_vi_r0.state != SP_VI_CALI_RUNNING)
+	if (!sp_vi_r0.armed)
 		return;
 
+	/* First event of this run: drop the previous result */
+	if (!memchr_inv(sp_vi_r0.seen_states, 0, sizeof(sp_vi_r0.seen_states))) {
+		sp_vi_r0.state = SP_VI_CALI_RUNNING;
+		sp_vi_r0.num_ch = 0;
+		memset(sp_vi_r0.r0_cali_q24, 0, sizeof(sp_vi_r0.r0_cali_q24));
+	}
+
 	for (i = 0; i < num_ch; i++) {
 		u32 state = cali->cali_param[i].state;
 
@@ -1731,6 +1740,7 @@ void audioreach_vi_calibration_event(struct device *dev,
 	if (!decisive)
 		return;
 
+	sp_vi_r0.armed = false;
 	sp_vi_r0.state = success ? SP_VI_CALI_SUCCESS : SP_VI_CALI_FAILED;
 	sp_vi_r0.num_ch = num_ch;
 
@@ -1780,7 +1790,13 @@ void audioreach_vi_calibration_abort(struct device *dev)
 
 	guard(mutex)(&sp_vi_r0_lock);
 
-	if (sp_vi_r0.state != SP_VI_CALI_RUNNING)
+	if (!sp_vi_r0.armed)
+		return;
+
+	sp_vi_r0.armed = false;
+
+	/* The DSP never reported on this run: keep the previous result */
+	if (!memchr_inv(sp_vi_r0.seen_states, 0, sizeof(sp_vi_r0.seen_states)))
 		return;
 
 	sp_vi_r0.state = SP_VI_CALI_ABORTED;
@@ -1844,9 +1860,8 @@ static void audioreach_arm_vi_calibration(void)
 {
 	guard(mutex)(&sp_vi_r0_lock);
 
-	sp_vi_r0 = (struct sp_vi_r0_result){
-		.state = SP_VI_CALI_RUNNING,
-	};
+	sp_vi_r0.armed = true;
+	memset(sp_vi_r0.seen_states, 0, sizeof(sp_vi_r0.seen_states));
 }
 
 static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
-- 
2.47.3

