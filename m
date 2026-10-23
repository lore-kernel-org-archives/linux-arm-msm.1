Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775901;
	b=ROzaYvvzumCOhEmQH2dTjxnwf+Y+d4NiviJhIucdUeFTbcAJIeHs9GBZtwRDBAr36yR+
	 tlkhO7RwZ5DJ5Dqs9s/mumQnCPz4VhZneUCpfM9XGn+84nTq53CS3ed4J8TwgRMst9KRn
	 7PHHyr45H/WBRF0uek9b1M48U+tYBo9rwkr5bpjKM4piN0I2aSrxze+LSL98Pg9hMn+xe
	 CgyFPLTjSL7tJAwsQgp8CH/9notdrfNxfDVnHHMdsPWV+6GQRneZUq0BNUa0/XLTQ/1ok
	 4vhmwawI6WaU+EoiiEK9V0Alo99xYU3g08csyCZ8CRKCw52Gzi6bSVNFSykhAkBm+dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775901;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aiE25iL3B+65SjWf+5TW4LHVEE7rNgWhZPR7uU9yH0k=;
	b=tHl4Hj3b+jz8Rhdm9Fv200kgoVkwN2baZt8KuM/KVVBwBSg/8q/Pv5gpV3D8YvT+OZpd
	 Lj85TuVXCfeaIERMfAYwD5YMAjcKnn/jPD4tx4qPBnE8bVaEUVIBXKUDbVCQQEBUSlADK
	 ML+ZjKV/TEnQMYPD4JvdSZggmB1E0sCkJ41bW3xWotXqbZSI43bu8xiBhdoFDctuQGa9p
	 zYus324x9bdH5VbRjRDoBiGU7MGdS1zbS0dIg7DQv9mq9pxE1eiGmal3c763Mx5P1At1S
	 JkLfAjQ3Yv6+58mATioX16e8nuEgLg2cCF8Chp5+IQuvp57u6X3r5YP+fgpd4Kj3O5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NaBmXa2s;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P8bl43yd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB484606AA11
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB484606AA11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NaBmXa2s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P8bl43yd
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6DvB2462566
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aiE25iL3B+6
	5SjWf+5TW4LHVEE7rNgWhZPR7uU9yH0k=; b=NaBmXa2s4ch+qTy97qX3AVx1sOv
	UynuJEo5HimTfOWQUOfQ8TT4CVy4qrU7zsf+GRvXhTyoVbB95mgNqhgPgQPPctI/
	zX/S3ZDpJoKbjBHIzjOt1xo1g9PIHoTrS4vyRQy81rHwZFKrhUQvWoxLkXhrIfm7
	/fFLLVkO2nwzSxFs0xHPOsX7H8NVSP2f1AWUN/ByVJ90pQccShkuM+qIeQ2nfXWV
	ACE33ZNSodwqn+U8CjB4a/VWYmPzlMrQmAu4fCtAG67yItFiNjLIEz8xS/u29H/I
	n+O9xCSoWTfJxPEhjWT/Hu8RZMmZ8TP0fSp2Y1/0k86PRi78CzbX2IXbZzw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtvskf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so323686485a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775899; x=1793380699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aiE25iL3B+65SjWf+5TW4LHVEE7rNgWhZPR7uU9yH0k=;
        b=P8bl43yd8bl5isBmb8macYT/up9BbnXv8DOrQp5MVwSeNxZQjz9w5/O/tOPZLo8FsC
         bT5yKeFGP3gpxFj+ZLa0CoNXNeCwMEG272JsAgcJBHm1OT3m7Qva7+P8xa5L3JdUgvLm
         XW6+/rbdykCkSepNbRBWPrzCLG0gp9hg5Xp8272aK1wGO7G+niSyNuwu/FeHvfO9pITT
         /chwqWgywlW1ZzzktjhdKclUv3vmt79AqAmbw0xOpqaZwjRwQRGRfX0+4VEhdG5lOn1o
         hHbrRP57SGwpGcEoeepzOl1GlUuaBhl6BYG1WR77A6TJZuGVGiCgGF1HIzevoMYX1PiR
         Tg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775899; x=1793380699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aiE25iL3B+65SjWf+5TW4LHVEE7rNgWhZPR7uU9yH0k=;
        b=YSWkFwjWnk60AeWLOrhFkM2/ekjlry8rrNZc16A8dlYn3vuKvRkTQ/NCQm+TITz1gS
         ASGuvw/nLZT8q3hiK+phw/J2kdviRmwP0Er8Ipq0iAPVcs+/kj5+nlPm0EyrFYPlKBP1
         lvLxz5IUsqZQj3wllzvq7Nppi1wycwBSjyYLpjM8jDXHvHsa3Mpv98N/an9WFcS4305t
         6iyMeucmDD8/ulgYmkbXogFydZgxEhWLDvdkA8vhHjkhOcgCVg+zTSYBymAimcAR3rq2
         mT2bPqC99z6fNUdcHZQ2OnuoBa7fOI/98iq8s4fimtGyskrVIqrmCK6xjaMDdqd4tFwi
         K4sg==
X-Forwarded-Encrypted: i=1; AKwUvBxseF3tDWob+vkRFYntAuIkrlsEtQwS1uwI/Il3qHu5ZWy/k3BHOGpWA2/6a/HSdDKKlhOYmwGpK7nrfLPA@vger.kernel.org
X-Gm-Message-State: AFq9FYI96YZxkhYOiMDRNVm8vFhJxIQLQ+CNS0CTyrppNgXDMXsctqre
	U9EJj1c71B02X5JbioUy0imzstItrm8jfr1BGVItDfce4fl20o98x832i/pbXosbIzgvh5E5ntH
	rCYLHEC9HY2YRNVI3hEWCx3ITVSpPfFG4OgHKlW8VPHPYKHAWXXimUMwOmpSlJ5Kc/XZL
X-Gm-Gg: AYBFou360rgTbogU512gDRFnoYGNRAUSxiWKJ+RlYDm5lI8kIAq/Q86FmVvniGnyoE8
	V36Rq8EiFzhepUXjfAYKAzIP4PvU1IOAfHcpnv1c+zX1ZYzR/uDtPVtJY2Yr0ntTli0xnPDApHH
	O1IxN6O2qABEvo75us9eF9gBkXxw2FElRqxZiEGea2zeZaw12hzLwC3tVsOePfaPd51RxoVNwB6
	84jdHhjKHIItv+Ls5Uzc9laW0XbjhqzViQ09Pnmw5YRfi5BpmGE5DoRq+dT0YxO7EB32T6VJgsn
	IUlvbpO4jCEC+e4DcgieGvVsdd1EYL7WiGpBbwD4/7hr1gwZZfrIL45EhRLNXxqOKJgtdcS/+6W
	w6ufWS1S96FXV
X-Received: by 2002:a05:620a:4707:b0:93c:c405:3215 with SMTP id af79cd13be357-93f6f966388mr536169485a.44.1792775898664;
        Fri, 23 Oct 2026 10:18:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4707:b0:93c:c405:3215 with SMTP id af79cd13be357-93f6f966388mr536163785a.44.1792775898114;
        Fri, 23 Oct 2026 10:18:18 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:17 -0700 (PDT)
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
Subject: [RFC PATCH 17/23] ASoC: qcom: audioreach: add live speaker temperature (T0) readback
Date: Fri, 23 Oct 2026 18:14:27 +0100
Message-ID: <20261023171433.820092-18-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb96db cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=jt9GbcDmORiCJNAdx5sA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: y5tZTfW6iHzyNqOEznJfLwmOO_0Rku2P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX878CqV1In+ID
 38tjZxWQ9uiXebgRIhsj95/ZtFppCs/4dMMqOxLP4BGTzq770Tx56VQFzI43wZzlTVUIFCVImwU
 hI6qV6Hdq7CMih4VtYTt4fE2XJ2whHzoq3hfpKWKYUqNEz09TVYnqcczeJOsEVOYI0lDEfffl6P
 BOCN/cUtz7Dg/aNoREsQPBkM6ZUo9SdWvMZersI7/qHIsnwRPtfRJjPPB3DwSgp0stlrwLRwKJe
 syvUZcdro+uczNunsDvGH9x2RH9j6LmysymEvsXu0qiTnHZXiXb5VX712nTY+kWpfDf8JLhMqOf
 Fy16ziP/uftK5ztb26PsKc8CB1wViT7knphfOYx4YyKn2qFWOpSAYNpY4Ao6tQyFbyIYKSgfxQJ
 xIvaP4oB5mqb3eQgIQqI7sApDripHMarOc7wnK3zJltjKB6byRQQMF/UzFOTKqr+qiSaBX8hesU
 S18UtJmEOXhK9G7slSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX/fM8y+Fnp/XU
 FG24IWySamSZf/av3PNpzctUSsUhQ0Jifn1yUbNfNVWcUsaehjM9x+tnViPw5Ww7Ns+UWZDkQRf
 gvqMVygh1rV33LfL2i46SV9Bg4QT11k=
X-Proofpoint-ORIG-GUID: y5tZTfW6iHzyNqOEznJfLwmOO_0Rku2P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

A calibration needs each speaker's die temperature when R0 is measured,
so that the R0/T0 pair given back to the DSP is consistent.

Let the machine driver register the speakers' thermal zones in VI
channel order with audioreach_sp_register_speaker_map(), and expose
their temperatures in Q6 format as a read-only "Speaker Protection T0"
control. Record T0 with R0 when a calibration completes. A slot that
cannot be read reports 0.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 65 ++++++++++++++++++++++++++++++-
 sound/soc/qcom/qdsp6/audioreach.h |  5 +++
 sound/soc/qcom/qdsp6/q6apm-dai.c  |  7 ++++
 sound/soc/qcom/qdsp6/topology.c   | 41 +++++++++++++++++++
 4 files changed, 116 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index d027c763eb25..f05033cc3f7d 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -5,6 +5,7 @@
 #include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/apr.h>
+#include <linux/thermal.h>
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
 #include <sound/pcm.h>
@@ -41,6 +42,13 @@ struct sp_vi_r0t0_cfg {
 static struct sp_vi_r0t0_cfg sp_vi_r0t0_cfg;
 static DEFINE_MUTEX(sp_vi_r0t0_cfg_lock);
 
+/* Speakers' thermal zones in VI channel order, set by the machine driver */
+static struct {
+	struct thermal_zone_device	*tz[MAX_SP_VI_SPEAKERS];
+	unsigned int			 num;
+} sp_speaker_map;
+static DEFINE_MUTEX(sp_speaker_map_lock);
+
 /* SubGraph Config */
 struct apm_sub_graph_data {
 	struct apm_sub_graph_cfg sub_graph_cfg;
@@ -1564,6 +1572,50 @@ void audioreach_get_sp_vi_r0t0(long *vals, unsigned int count)
 	}
 }
 
+int audioreach_sp_register_speaker_map(struct thermal_zone_device * const *tzs,
+				       unsigned int num)
+{
+	unsigned int i;
+
+	if (num > MAX_SP_VI_SPEAKERS)
+		return -EINVAL;
+
+	guard(mutex)(&sp_speaker_map_lock);
+
+	for (i = 0; i < num; i++)
+		sp_speaker_map.tz[i] = tzs[i];
+	for (; i < MAX_SP_VI_SPEAKERS; i++)
+		sp_speaker_map.tz[i] = NULL;
+	sp_speaker_map.num = num;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(audioreach_sp_register_speaker_map);
+
+/* Read each speaker's T0 in Q6 (degC * 64), 0 if its zone cannot be read */
+int audioreach_get_sp_vi_t0(long *vals, unsigned int count)
+{
+	unsigned int i, n;
+
+	guard(mutex)(&sp_speaker_map_lock);
+
+	n = min(count, sp_speaker_map.num);
+	for (i = 0; i < n; i++) {
+		int mdeg;
+
+		if (sp_speaker_map.tz[i] &&
+		    !thermal_zone_get_temp(sp_speaker_map.tz[i], &mdeg))
+			vals[i] = ((s64)mdeg * 64) / 1000;
+		else
+			vals[i] = 0;
+	}
+	for (; i < count; i++)
+		vals[i] = 0;
+
+	return n;
+}
+EXPORT_SYMBOL_GPL(audioreach_get_sp_vi_t0);
+
 int audioreach_set_sp_vi_r0t0(struct device *dev, const long *vals, unsigned int count)
 {
 	struct sp_vi_r0t0_cfg new = {};
@@ -1629,6 +1681,7 @@ void audioreach_vi_calibration_event(struct device *dev,
 				     const struct event_id_vi_per_spkr_calibration *cali,
 				     u32 num_ch)
 {
+	long t0_live[MAX_SP_VI_SPEAKERS];
 	bool decisive = true;
 	bool success = true;
 	unsigned int i;
@@ -1681,12 +1734,20 @@ void audioreach_vi_calibration_event(struct device *dev,
 			 i, r0_int, r0_frac, sp_vi_r0.r0_cali_q24[i]);
 	}
 
-	/* Only a run where every speaker succeeded gives a usable R0/T0 set */
+	/*
+	 * Only a run where every speaker succeeded gives a usable R0/T0 set.
+	 * The DSP reports only R0, so pair it with the speakers' last T0
+	 * reading; a zone that cannot be read gives T0 = 0.
+	 */
 	if (success) {
+		audioreach_get_sp_vi_t0(t0_live, num_ch);
+
 		guard(mutex)(&sp_vi_r0t0_cfg_lock);
 		sp_vi_r0t0_cfg.num_ch = num_ch;
-		for (i = 0; i < num_ch; i++)
+		for (i = 0; i < num_ch; i++) {
 			sp_vi_r0t0_cfg.r0_cali_q24[i] = cali->cali_param[i].r0_cali_q24;
+			sp_vi_r0t0_cfg.t0_cali_q6[i] = (s16)t0_live[i];
+		}
 	}
 
 	dev_info(dev, "VI calibration complete: %s\n", success ? "success" : "failed");
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 67a9d3c66fd4..7345b6d15f58 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -8,6 +8,7 @@
 #include <sound/soc.h>
 struct q6apm;
 struct q6apm_graph;
+struct thermal_zone_device;
 
 /* Module IDs */
 #define MODULE_ID_WR_SHARED_MEM_EP	0x07001000
@@ -1137,6 +1138,10 @@ u32 audioreach_get_sp_operation_mode(void);
 void audioreach_set_sp_operation_mode(u32 mode);
 void audioreach_get_sp_vi_r0t0(long *vals, unsigned int count);
 int audioreach_set_sp_vi_r0t0(struct device *dev, const long *vals, unsigned int count);
+int audioreach_sp_register_speaker_map(struct thermal_zone_device * const *tzs,
+				       unsigned int num);
+int audioreach_get_sp_vi_t0(long *vals, unsigned int count);
+int audioreach_add_sp_telemetry_controls(struct snd_soc_component *component);
 void audioreach_vi_calibration_event(struct device *dev,
 				     const struct event_id_vi_per_spkr_calibration *cali,
 				     u32 num_ch);
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 9002acf0e0cd..19c91d0bede4 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -20,6 +20,7 @@
 #include <sound/soc-dapm.h>
 #include <asm/div64.h>
 #include <asm/dma.h>
+#include "audioreach.h"
 #include "q6apm.h"
 
 #define DRV_NAME "q6apm-dai"
@@ -1173,8 +1174,14 @@ static const struct snd_compress_ops q6apm_dai_compress_ops = {
 	.copy		= q6apm_compr_copy,
 };
 
+static int q6apm_dai_component_probe(struct snd_soc_component *component)
+{
+	return audioreach_add_sp_telemetry_controls(component);
+}
+
 static const struct snd_soc_component_driver q6apm_fe_dai_component = {
 	.name		= DRV_NAME,
+	.probe		= q6apm_dai_component_probe,
 	.open		= q6apm_dai_open,
 	.close		= q6apm_dai_close,
 	.prepare	= q6apm_dai_prepare,
diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 6316d1ab0675..8bc681a633d8 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1530,6 +1530,47 @@ static int audioreach_put_sp_r0t0(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
+/* Live T0 per speaker in Q6 (degC * 64), 0 if it cannot be read */
+static int audioreach_info_sp_t0(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = MAX_SP_VI_SPEAKERS;
+	uinfo->value.integer.min = S32_MIN;
+	uinfo->value.integer.max = S32_MAX;
+
+	return 0;
+}
+
+static int audioreach_get_sp_t0(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	audioreach_get_sp_vi_t0(ucontrol->value.integer.value,
+				MAX_SP_VI_SPEAKERS);
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new audioreach_sp_telemetry_controls[] = {
+	{
+		.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name	= "Speaker Protection T0",
+		.access	= SNDRV_CTL_ELEM_ACCESS_READ |
+			  SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		.info	= audioreach_info_sp_t0,
+		.get	= audioreach_get_sp_t0,
+	},
+};
+
+/* Kept apart from the topology SP controls, so FEs have them without it */
+int audioreach_add_sp_telemetry_controls(struct snd_soc_component *component)
+{
+	return snd_soc_add_component_controls(component,
+					      audioreach_sp_telemetry_controls,
+					      ARRAY_SIZE(audioreach_sp_telemetry_controls));
+}
+EXPORT_SYMBOL_GPL(audioreach_add_sp_telemetry_controls);
+
 static int audioreach_control_load_mix(struct snd_soc_component *scomp,
 				       struct snd_ar_control *scontrol,
 				       struct snd_kcontrol_new *kc,
-- 
2.47.3

