Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364108;
	b=CI40u7hR4HYNSVmOZdMDa0fwlSk6EY3wP0g64Tv9mBaMZLOlO1dLr1NKYPV/S61maqPX
	 CZhHMBJA6g3K7OobprVX0yqbuc1C9WE8079gCgxsgl04+Wg6IcixDH3h8d6UrepuORmiw
	 7ZvM2yZdWOTea2TEW/K1MJmZS0V1AAjon2cwsiGIjaez/hzkyIQ9Sy86GTSFbtAd3RyDY
	 18BuOPfrdUC4HZuv5OYK2GA/S0XYWdhZ0lBUhgzYLaRTCPV50anfIq/RuCBspd9DGRj/G
	 TFZWtggTE/dgfUVOtwA3vi4ftNFkxVbDN0j3jMVXRaOXXKCIKptYPtlsV94g+3VMC0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364108;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Wf89pT31Kdh1yExYrq6GyJjLDWu7pImGlA1nLeczhnc=;
	b=Sg/77cBjpJRQ5LTGyUxWg/dzjZQtzDGzIGnW5JAPOawWXc1RV5IkmDZinIWYGpGCPpbB
	 G4g0qBWRwKV7DajQBUUBEi3OpTML9bCQrKJfk2Y606g3dnXjeywu0gj6/ant6zVIZDoHc
	 gPztPkb1ejgEmEBawTObkiqlIrIT6G/6AJa7Rkjw7sY77w1nlmrx92llok9AEstxSEzAS
	 gy/i8bUyelojlghvBh7p8vdHj1X5xyiTa3BQF1/+Q7+qO7tOdoBAdyoPbiJghxzvy793y
	 Y2yt/Cx1Isknc272NvbYD5JRIjcZ9XRRVh7ACKrwn33mrlMqGBv+013IkqGbeRkb7RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jXLNhJ9X;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RkYgT5gU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0228606A6B8
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0228606A6B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jXLNhJ9X;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RkYgT5gU
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQOb9279532
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Wf89pT31Kdh
	1yExYrq6GyJjLDWu7pImGlA1nLeczhnc=; b=jXLNhJ9XTTMEanrAkb0PvlUQN5O
	BUK7LHiMq49usMkD51T4vyW+QWF8hxtmNFUJpJvPcvKLd0Cmo8XwiObZDTg5ZWMo
	ctOYVXi+ecKrgvmzmmBpUHpyXzqM9/c2RHsPQGY2wX1ToQECh2csgz6rIqXWhcHw
	wuDVT/ashxh1IBy/j++9agOB7JYaB9zWrFwPo51K/qIA05jgo2GQ3UX55fdWDn6f
	2uMQ0GiBxG1yrD4px/5/0zV/0iBJCucV74axsx5lx+ocVqPGndF0hpfcaOsze3Dv
	/dJpOc0i65wxuy0zYkt4hak/9yhhbJa/gmkEBNRimG8PNFOk3xworNU4tPg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6ktew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9496ff065bcso365183385a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 08:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364106; x=1795968906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wf89pT31Kdh1yExYrq6GyJjLDWu7pImGlA1nLeczhnc=;
        b=RkYgT5gU71zRO0ubsTKHDUX8PHhLdEEOGingQuljKUujbVn42o+UVR636fpTJAZxsW
         xELHGHBYlaQRcai5feahCR4w4uLqd2ghCqL30+UofPJedB4mqslqbJgvUqTxzElXGSOf
         EFIA27uOTH1vwolFjRW6bdrMZntl1Zh7PTpvWWQUN0kusEJT/x+bCamgLgvJnVfrFU6f
         tgSSeMRjiloXgaBVVE2EoCrX2TE3PJ7S7mN3LfwBq4wIwQeqTK7T6AeJXDiWKBrRspBa
         zWzcoShM+hCZlZvoMpx+qOzdloRI+HypgVN4rKcDiUUvaL4uhpaPjnp9juxfzkjdjdn0
         1pMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364106; x=1795968906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wf89pT31Kdh1yExYrq6GyJjLDWu7pImGlA1nLeczhnc=;
        b=HCkBBoe6U6JDYw0TbG6Vw5cGEOJtZmGCCSievz2jqgdRrg6XIFQvf93hFs58Xlvsz9
         H2bcbT4AKIukv/V4PoDo/8dOc7TQo+MgN2i2Il3EsBe/kxdkwoMz9uLHIDOTf1Zqwctq
         PE/u2FIT4oxVQvX1t+6nOuDEpRqIByPClrUFxRDFo/+oZuDMBkhN1GR9Z4ChibBCPVof
         fX2NN1AuJPZV1JIwWcqbI28aaWPPeOi9ntJO3m8dOlr0wr/vCW/mxzngW1LeLr8rDxYT
         rmOvS3XaChYxlxloRxTKn861VT5CBeY7NQtAw7Hrgk1oTzHRQtq1NoRnjHlvOZZ6Kklj
         rXtw==
X-Forwarded-Encrypted: i=1; AL+hErGlgcWPNrDUBiB30ACZMg05NF8QUe7F6Bxx5uQ31KWsEXchNym/k7k0XvoesZR0uZU8W+UFJ7e+qbjdRCbE@vger.kernel.org
X-Gm-Message-State: APuU4Z9V7LEwMxtl3elE5BCjOqaIKDe9fZIh2Wpp0KzJrVjpTkDtAW0W
	IzinJ960mXiz3EGQ2w1m45WjlUomogB8mF0rgI3IlqOzPBY8310RIHPPZmI5QdOvhhs1iiEK2kv
	Gkk/StWLI955dF3jCnY5O/086wsgFtKMXNv7Py9RKMX1/l9zrl2wNy6cKFCCMUmILVP5R
X-Gm-Gg: AZFdTZf1lb3mx0qtQVZW0qkK2HE26Xgbe2ugcd2DV7FbeBFZpJJQYkwgtWQ4B95QPls
	Oyikf2fteamXl1F84vB7Mms9mkW3DpO/fGpKtfhDOk2YB+gmeAjPugMigufnFnRGM3BITdiruFQ
	WXN4AIr4bRahukyuRnWmsAB6sdffnKKhILz6v4vigUaYSuOocB/WOjqv3O172ef5FmAmFp3Swkl
	2o+u6Au5T5unsXeMrOIol1onpfCCcs7471iXdi1b0aZabMv7EvLBlylzXOMEnhvqN1ZHABZ3fmL
	nRYqgs2rSVi96OpYlTgNLNPm7zSURsAfkjjRglwHGpT2n2+DmA9hEOcXTpBwED7UlJuyVsp7/Dy
	IJ/gP9s3fpiHB7OagqK9eV5tEv9gArLhYHj7YGvvGtziJaFehaAAdvUe/Cu8GgEp6
X-Received: by 2002:a05:620a:468d:b0:93e:d051:8f19 with SMTP id af79cd13be357-949ba9b3950mr1536479185a.40.1795364105744;
        Sun, 22 Nov 2026 08:15:05 -0800 (PST)
X-Received: by 2002:a05:620a:468d:b0:93e:d051:8f19 with SMTP id af79cd13be357-949ba9b3950mr1536472185a.40.1795364105176;
        Sun, 22 Nov 2026 08:15:05 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:04 -0800 (PST)
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
Subject: [PATCH v2 10/24] ASoC: qcom: audioreach: run VI module in calibration mode with per-speaker events
Date: Sun, 22 Nov 2026 16:14:23 +0000
Message-ID: <20261122161437.5994-11-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: 0lwIFIcIHfIoPb2nP8cdRR2x8up4Ibao
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX3+pLFktBaYbe
 7rSqVZm/ZFgdzaBKvi7uzwi9m+GK1gYZVvgnZmacSe0kc0takeB22+xStS2Q6//s0AdQVT1cYCM
 KZ+YO7pwMfZ0mN/rFDhGaNQRqndx7rw=
X-Proofpoint-ORIG-GUID: 0lwIFIcIHfIoPb2nP8cdRR2x8up4Ibao
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXwDm6e0/uQVwo
 trOShS7RaPt1F9oyfSNdW11SuwquyZz4hY181Na2QcnYrr5ilAVx22DcaDubig971XZIX4BNsqS
 62F6UH5CBFpdz3Sj/gtmcuB0vCkM7E+A7K8qruz9zUzUdAN19lLn7iUvt28L6QCpShm4Cn/qHhT
 6rP8GpE8vlFQE2JCHgvV8UXYF2oVainyKgnTt1E98o4mQTE59jSOZODxMQwek1VPwFGRBPVC+U1
 thyqDj/FMj/bDAHB7ZCQkzrsnyf7IVEm8O3EuxwH/jSOGgvT8fcd6OthZi2nC3DzwFPu9jNbSq6
 InHRMNSDjD69gZdBDQSlfm3sNGRibIiO22D9IPF/ohXWrtZBqt+lgHIobOE4qrTihxnMdgoSVi5
 UVp8T4lcGUo7TipOQuyGTWwe6BQJARK1aqY8kujBmbJgwc65qknEGxlF8qeiY8A1tzXd2z7oUAl
 g9oRnlppF6ckH6W+XOg==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b03150a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=5EnwkQkph5nfVeabW8IA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Put the speaker protection and VI modules in calibration mode, number
the V/I channel pairs consecutively (the VI capture packs one pair per
speaker without gaps), and support up to MAX_SP_VI_SPEAKERS (4) speakers
to cover laptops with four WSAs.

Register for EVENT_ID_VI_PER_SPKR_CALIBRATION on the VI module so each
speaker's state and measured resistance are reported on their own, and
dispatch the event from q6apm's graph callback into
audioreach_vi_calibration_event().  The initial handler just logs each
event at debug level; later patches add result caching and a userspace
trigger on top.

The module event registration is scoped to the graph: the DSP releases
it automatically when the graph is closed on stream close, so no explicit
unregister is needed on the driver side.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 86 ++++++++++++++++++++++++-------
 sound/soc/qcom/qdsp6/audioreach.h | 57 ++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6apm.c      | 26 ++++++++++
 3 files changed, 151 insertions(+), 18 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index afa8e0159570..fbb9e3c4b84a 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -1462,6 +1462,18 @@ static int audioreach_gain_set(struct q6apm_graph *graph,
 	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
 
+void audioreach_vi_calibration_event(struct device *dev,
+				     const struct event_id_vi_per_spkr_calibration *cali,
+				     u32 num_ch)
+{
+	unsigned int i;
+
+	/* Raised every frame; keep the per-event log at debug level */
+	for (i = 0; i < num_ch; i++)
+		dev_dbg(dev, "VI calibration channel %u: state %u\n",
+			i, cali->cali_param[i].state);
+}
+
 static int audioreach_speaker_protection(struct q6apm_graph *graph,
 					 const struct audioreach_module *module,
 					 uint32_t operation_mode)
@@ -1470,6 +1482,35 @@ static int audioreach_speaker_protection(struct q6apm_graph *graph,
 					 operation_mode);
 }
 
+static int audioreach_register_events(struct q6apm_graph *graph,
+				      const struct audioreach_module *module)
+{
+	struct apm_module_register_events *payload;
+	struct gpr_pkt *pkt;
+	int rc, payload_size;
+	void *p;
+
+	/* No event config payload, the packet is zeroed on allocation */
+	payload_size = ALIGN(sizeof(struct apm_module_register_events), 8);
+	pkt = audioreach_alloc_cmd_pkt(payload_size, APM_CMD_REGISTER_MODULE_EVENTS,
+				       0, graph->port->id, module->instance_id);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	payload = p;
+	payload->module_instance_id = module->instance_id;
+	payload->event_id = EVENT_ID_VI_PER_SPKR_CALIBRATION;
+	payload->is_register = 1;
+
+	rc = audioreach_graph_send_cmd_sync(graph, pkt, 0);
+
+	kfree(pkt);
+
+	return rc;
+}
+
 static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 					    const struct audioreach_module *module,
 					    const struct audioreach_module_config *mcfg)
@@ -1480,18 +1521,30 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 	struct apm_module_sp_vi_ex_mode_cfg *ex_cfg;
 	int op_sz, cm_sz, ex_sz;
 	struct apm_module_param_data *param_data;
-	int rc, i, payload_size, j;
+	int rc, i, j, payload_size;
 	struct gpr_pkt *pkt;
+	u32 num_speakers;
 	void *p;
 
-	if (num_channels > 2) {
+	if (num_channels > MAX_SP_VI_SPEAKERS) {
 		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
 		return -EINVAL;
 	}
 
-	op_sz = APM_SP_VI_OP_MODE_CFG_PSIZE(num_channels);
+	/* One 32-bit V/I word per speaker, so channels == speakers */
+	num_speakers = num_channels;
+	if (!num_speakers) {
+		dev_err(graph->dev, "Error: VI needs at least one channel\n");
+		return -EINVAL;
+	}
+
+	rc = audioreach_register_events(graph, module);
+	if (rc)
+		return rc;
+
+	op_sz = APM_SP_VI_OP_MODE_CFG_PSIZE(num_speakers);
 	/* Channel mapping for Isense and Vsense, thus twice number of speakers. */
-	cm_sz = APM_SP_VI_CH_MAP_CFG_PSIZE(num_channels * 2);
+	cm_sz = APM_SP_VI_CH_MAP_CFG_PSIZE(num_speakers * 2);
 	ex_sz = APM_SP_VI_EX_MODE_CFG_PSIZE;
 
 	payload_size = op_sz + cm_sz + ex_sz;
@@ -1509,8 +1562,9 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 	param_data->param_id = PARAM_ID_SP_VI_OP_MODE_CFG;
 	param_data->param_size = op_sz - APM_MODULE_PARAM_DATA_SIZE;
 
-	op_cfg->cfg.num_channels = num_channels;
-	op_cfg->cfg.operation_mode = PARAM_ID_SP_VI_OP_MODE_NORMAL;
+	/* The DSP calls this field num_speakers for the VI module */
+	op_cfg->cfg.num_channels = num_speakers;
+	op_cfg->cfg.operation_mode = PARAM_ID_SP_VI_OP_MODE_CALIBRATION;
 	p += op_sz;
 
 	cm_cfg = p;
@@ -1520,20 +1574,15 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 	param_data->param_id = PARAM_ID_SP_VI_CHANNEL_MAP_CFG;
 	param_data->param_size = cm_sz - APM_MODULE_PARAM_DATA_SIZE;
 
-	cm_cfg->cfg.num_channels = num_channels * 2;
-	/* Convert the physical mapping to a logical mapping of the channels */
-	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < num_channels; i++) {
+	cm_cfg->cfg.num_channels = num_speakers * 2;
+	/* Number the V/I pairs consecutively, the capture has no gaps */
+	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < num_speakers; i++) {
 		if (!mcfg->channel_map[i])
 			continue;
-		/*
-		 * Map speakers into Vsense and then Isense of each channel.
-		 * E.g. for PCM_CHANNEL_FL and PCM_CHANNEL_FR to:
-		 * [1, 2, 3, 4]
-		 */
-		cm_cfg->cfg.channel_mapping[2 * j] = (mcfg->channel_map[i] - 1) * 2 + 1;
-		cm_cfg->cfg.channel_mapping[2 * j + 1] = (mcfg->channel_map[i] - 1) * 2 + 2;
 
-		++j;
+		cm_cfg->cfg.channel_mapping[2 * j] = 2 * j + 1;
+		cm_cfg->cfg.channel_mapping[2 * j + 1] = 2 * j + 2;
+		j++;
 	}
 
 	p += cm_sz;
@@ -1607,7 +1656,7 @@ int audioreach_set_media_format(struct q6apm_graph *graph,
 		break;
 	case MODULE_ID_SPEAKER_PROTECTION:
 		rc = audioreach_speaker_protection(graph, module,
-						   PARAM_ID_SP_OP_MODE_NORMAL);
+						   PARAM_ID_SP_OP_MODE_CALIBRATION);
 		if (!rc)
 			rc = audioreach_module_enable(graph, module, true);
 
@@ -1616,6 +1665,7 @@ int audioreach_set_media_format(struct q6apm_graph *graph,
 		rc = audioreach_speaker_protection_vi(graph, module, cfg);
 		if (!rc)
 			rc = audioreach_module_enable(graph, module, true);
+
 		break;
 	case MODULE_ID_AUDIO_IF_SOURCE:
 	case MODULE_ID_AUDIO_IF_SINK:
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 0ea035fa630c..9d9449062b83 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -696,6 +696,8 @@ struct param_id_sp_op_mode {
 
 /* Speaker Protection VI */
 
+#define MAX_SP_VI_SPEAKERS			4
+
 #define PARAM_ID_SP_VI_OP_MODE_CFG		0x080011f4
 #define PARAM_ID_SP_VI_OP_MODE_NORMAL		0
 #define PARAM_ID_SP_VI_OP_MODE_CALIBRATION	1
@@ -720,6 +722,58 @@ struct param_id_sp_vi_channel_map_cfg {
 	uint32_t channel_mapping[];
 } __packed;
 
+/* VI per-speaker calibration event, raised every frame in calibration mode */
+#define EVENT_ID_VI_PER_SPKR_CALIBRATION	0x08001511
+
+/**
+ * enum vi_calibration_state - Calibration state of one speaker
+ * @VI_CALIBRATION_STATE_INCORRECT_OP_MODE: Not in calibration operation mode
+ * @VI_CALIBRATION_STATE_INACTIVE: Port not started
+ * @VI_CALIBRATION_STATE_WARMUP: Warming up
+ * @VI_CALIBRATION_STATE_INPROGRESS: Calibration running
+ * @VI_CALIBRATION_STATE_SUCCESS: R0/T0 within range
+ * @VI_CALIBRATION_STATE_FAILED: R0/T0 out of range
+ * @VI_CALIBRATION_STATE_WAIT_FOR_VI: Waiting for the V/I level to rise
+ * @VI_CALIBRATION_STATE_VI_WAIT_TIMED_OUT: Gave up waiting for the V/I level
+ * @VI_CALIBRATION_STATE_LOW_VI: V/I level fell below the threshold mid-run
+ *
+ * Reported by struct vi_per_spkr_calib_param.state. The DSP chooses these
+ * values, so they are fixed and must not be renumbered.
+ */
+enum vi_calibration_state {
+	VI_CALIBRATION_STATE_INCORRECT_OP_MODE	= 0,
+	VI_CALIBRATION_STATE_INACTIVE		= 1,
+	VI_CALIBRATION_STATE_WARMUP		= 2,
+	VI_CALIBRATION_STATE_INPROGRESS		= 3,
+	VI_CALIBRATION_STATE_SUCCESS		= 4,
+	VI_CALIBRATION_STATE_FAILED		= 5,
+	VI_CALIBRATION_STATE_WAIT_FOR_VI	= 6,
+	VI_CALIBRATION_STATE_VI_WAIT_TIMED_OUT	= 7,
+	VI_CALIBRATION_STATE_LOW_VI		= 8,
+};
+
+/**
+ * struct vi_per_spkr_calib_param - Per-speaker calibration result
+ * @state: Calibration state of this speaker.
+ * @r0_cali_q24: Measured DC resistance in ohms, Q24. Filled in regardless of
+ *		 @state, so it is meaningful for both VI_CALIBRATION_STATE_SUCCESS
+ *		 and VI_CALIBRATION_STATE_FAILED.
+ */
+struct vi_per_spkr_calib_param {
+	uint32_t state;
+	int32_t r0_cali_q24;
+} __packed;
+
+/**
+ * struct event_id_vi_per_spkr_calibration - Per-speaker VI calibration result
+ * @num_ch: Number of speakers the result covers.
+ * @cali_param: Per-speaker calibration state and measured resistance.
+ */
+struct event_id_vi_per_spkr_calibration {
+	uint32_t num_ch;
+	struct vi_per_spkr_calib_param cali_param[];
+} __packed;
+
 #define PARAM_ID_SAL_OUTPUT_CFG			0x08001016
 struct param_id_sal_output_config {
 	uint32_t bits_per_sample;
@@ -1060,6 +1114,9 @@ int audioreach_gain_set_vol_ctrl(struct q6apm *apm,
 int audioreach_send_u32_param(struct q6apm_graph *graph,
 			      const struct audioreach_module *module,
 			      uint32_t param_id, uint32_t param_val);
+void audioreach_vi_calibration_event(struct device *dev,
+				     const struct event_id_vi_per_spkr_calibration *cali,
+				     u32 num_ch);
 int audioreach_compr_set_param(struct q6apm_graph *graph,
 			       const struct audioreach_module_config *mcfg);
 int audioreach_setup_push_pull(struct q6apm_graph *graph, phys_addr_t bphys,
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 968fb7898aa4..c410e2f6e6a3 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -562,6 +562,29 @@ int q6apm_get_hw_pointer(struct q6apm_graph *graph, int dir)
 }
 EXPORT_SYMBOL_GPL(q6apm_get_hw_pointer);
 
+static void q6apm_vi_calibration_event(struct device *dev,
+				       const struct apm_module_event *event,
+				       int payload_size)
+{
+	const struct event_id_vi_per_spkr_calibration *cali;
+	u32 num_ch;
+
+	if (payload_size < 0 || payload_size < (int)(sizeof(*event) + sizeof(*cali))) {
+		dev_err(dev, "VI calibration event truncated (%d bytes)\n",
+			payload_size);
+		return;
+	}
+
+	cali = (const struct event_id_vi_per_spkr_calibration *)(event + 1);
+
+	/* Bound the array by the received payload, not by num_ch alone */
+	num_ch = (payload_size - sizeof(*event) - sizeof(*cali)) / sizeof(cali->cali_param[0]);
+	num_ch = min_t(u32, cali->num_ch, num_ch);
+	num_ch = min_t(u32, num_ch, MAX_SP_VI_SPEAKERS);
+
+	audioreach_vi_calibration_event(dev, cali, num_ch);
+}
+
 static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 {
 	struct data_cmd_rsp_rd_sh_mem_ep_data_buffer_done_v2 *rd_done;
@@ -585,6 +608,9 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 			client_event = APM_CLIENT_EVENT_WATERMARK_EVENT;
 			graph->cb(client_event, hdr->token, data->payload, graph->priv);
 			break;
+		case EVENT_ID_VI_PER_SPKR_CALIBRATION:
+			q6apm_vi_calibration_event(dev, event, data->payload_size);
+			break;
 		}
 
 		break;
-- 
2.53.0

