Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775883;
	b=IUGIlHEIzPVJFCESypajXoHnX3+sxgMMx4gb61jA7zZazDokac/A8YRfhNmmRaCiPtHK
	 +4yjKkofXEo8guDpM6ICPHAb4YZStlwTNxJjPBNPNT3Mgh1QK3MU9mPg9JbYO+Vhj03ZI
	 nkStrClVBvmeCnH6/kWnBMv20DlHEi6aP3nicCxkLXLScIW0/lJxHKF/lpq36+UDC2jie
	 JC7ne2Ohca0aempHFIGFj3uCbkjHvJjcj+ZobPp07zDA1lgC8vA3tQ2KGtwZ54XLZKcyH
	 1IgW+NoM1OsgRq4ORYPe4O8RJRPZK0WkCXqOYQSDKFKF1tKrhOCvudpQXoj6VWSB36w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775883;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1ZUhJ3mPI+qqMp/uxXmGVfm4VBqcoFVidfP/mpyC9/g=;
	b=RHFjt7YlLBjhblxEo/UWjCE2RGLUtDP1FwbynrUaD/HSU+e0uKs5y7jRgYXHDyF5ELoD
	 rgoIAVeLHhxV+hm9Ul8zpBi46VXb4MoiuXB4COVmL8HEgcpsZZzOVIrzwPrxRsoQeoXYp
	 9EkZR3UKYMvQ3AKR6XCipyxCNGSI4G8NcTDOWVRQdgEixoiWVNJ7NS1+nds1iekNlIPOE
	 MA5x68xPPZRCNJvs6DrV5UMaMTs7dpi/TUJln6Y3FGdNvTsZDM4RGTZe2ttz1TxCTVrKg
	 WLv0OttyGJA9pXqXyjMhk0qpUsOwa7e5Wfc0oxBXHEqND/6otso87dfvAgqtXd0jCuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c62CTsUs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BcrsUttV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5473A606A322
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5473A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c62CTsUs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BcrsUttV
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG6KuP2216025
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1ZUhJ3mPI+q
	qMp/uxXmGVfm4VBqcoFVidfP/mpyC9/g=; b=c62CTsUssSa8Fp/j33dU0ED2La/
	mTsyVSuCrnrnEFbwhccDvSBmF/oNOHeWUcLPuRfJZQ2c+jX4DxeOWAGUOIJgLy7U
	4aqgF7rTQjfmtRV05QahlTGlUjvR8TsJdUroLsOkG+RV+fHMfLHEQr+HE5o1hakh
	Our75TiEMREZtuvB4ChTqvsu5GhoVLpWx/pmzdxEOsktw4ztBVBMzwOVpHYph2wc
	fedH6MNvUxAzls15k3bh6uClWSCFh6QEiKKn8wkZD8mwQTQ6GbprkRore9hOlMii
	kWODllbjgJsV+W4fGRDJY1wr3+ucf2wb7T7ovO9dT+gwh/R5ku7O11p25hw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgatc8943-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:02 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91b875639ceso23829616d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775881; x=1793380681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ZUhJ3mPI+qqMp/uxXmGVfm4VBqcoFVidfP/mpyC9/g=;
        b=BcrsUttV5fxBXNEojwK9oc6Q32nv81Xgv3KZglXDMy5LyWMt9orlS6T3AhAih/O/cl
         QDe37TzKlhXLJcJptQXNBlRFblwkOnFnx7WrO9QSYoAqbvDcl9ZzoYsK1r4p/Y48Ueyk
         wIKslGckScrVWRdNlZh0CMEUlzJOJUgyiEyJdBw+U0jEaD1l7binucFAvWavyjsCxZSq
         0w6Wb4D0lwLxeyhRpe/0QxRJhuND142CWoF6ZywFXCObz7xoxFjQOgciSG1kj8y3L/hj
         kPs7DCHr5RsHpDmo7iDboiG+Dwc4ObGux5HsBSKrvxA2lALDHxYR9wn+iXmkbHu2w0zk
         EjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775881; x=1793380681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ZUhJ3mPI+qqMp/uxXmGVfm4VBqcoFVidfP/mpyC9/g=;
        b=McgcyBOqRHbFsPALtyPDi8Ign9Xsff1U6/HnuLQp0RyiUTyMBHuTv7qHkfnBp78R3D
         uKjSSafBq/OlEzUT/+YPOsEtRPXyyBqcOpWvz+KUM2WvCBmASlCszvhFNiH+uHqyty7o
         ewvp6qkC+On64gGthV/y5/SJ20csJj6FSq/kQypP8f0QVBq6xe5jzlPTISf4QBhrMBH3
         nplknpeIDr4O0+gusYbeYfQCIiNCyHpwjbtDy8u5HK5ORkeARR1h4c4d7A9BX9a0QiqR
         UIFopA7TMZbpohEacsIM+hu4UtDNcWfqVDUskc3F4w51X9OeAcp2kvdCoIyxgcsFpNMm
         gP+w==
X-Forwarded-Encrypted: i=1; AKwUvByFj2ADo642t18EZTGQEeT/ADqfYjm0YaWlup7Vvfk1U12yShdLKERwD+k9766syiMDO7nBJvahk3DVXEEe@vger.kernel.org
X-Gm-Message-State: AFq9FYKoIR9Ob3X+28Hd5F1rVj53xYEy4rMohzzrd28qvyB1x6Y2niFY
	Hbl0n2gx3WcefHgxB9K1G+ZwrDiw+uhTj+8N5dvzmzrwT25QYPC3cF1L5z3wlMvxQI40YoSSvCO
	szhkhwqfKc4d7rz04hgIWPWfSlGziEKB7L19FpQdZSfWQFw93mbbW8PZLXYKq0O3aa/eq
X-Gm-Gg: AYBFou0eFWxHkUTh3PkJ1BLZ+ZGoKogz8znwWoIJeOAJzkz4/IrPYmi82EAxGkj8gdQ
	eP0wq7mwrWMAR9ZTN6Kc06eQBNbMxI8TbZ33Mbfdp6DA8/WEbaiOSHqyV7OyfgTgI5GpBH+wbD4
	dpt2TSszdc+I+4cShwM+n1LrvIre5x1JrLxO7vn1Ge5kPZ9BdMN0NkIjcAtjRtt2tuW+r5NNpqL
	17gi6plAUaHAgxTtAsZFn0UyvqZlebwIfLez34Gk2n8IoIbp+kJjii4ntlfWjqLFfd7BW6vRCkb
	yNqTLh8KRy1YyuzGDdr/mOxppSVK+1aPqToolIHv+8kWzLggoS6HBsQAHmCtcFTaEO+dwC+7xfR
	AseOyNy5zLydr
X-Received: by 2002:a05:620a:2b46:b0:93f:34c9:925f with SMTP id af79cd13be357-93f6f79bcaemr486350585a.17.1792775881475;
        Fri, 23 Oct 2026 10:18:01 -0700 (PDT)
X-Received: by 2002:a05:620a:2b46:b0:93f:34c9:925f with SMTP id af79cd13be357-93f6f79bcaemr486346185a.17.1792775880931;
        Fri, 23 Oct 2026 10:18:00 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:00 -0700 (PDT)
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
Subject: [RFC PATCH 08/23] ASoC: qcom: audioreach: run VI module in calibration mode with per-speaker events
Date: Fri, 23 Oct 2026 18:14:18 +0100
Message-ID: <20261023171433.820092-9-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX3UHU1n46HPt3
 KKhSF3fo5n9TNNMT4h4UeLWQMYQlDVZiS8IlgBxT7aej8RjfmDuJ0Hv8ghuKq2ueAwyAw/ZMoel
 i8/FyP3vAAy1SHB2lmrfkWeZkjPdqVlpTc/BrIRIbc1OV/Ur3Z5Y7iODadUTtNVZ6vwIVetutbU
 s0Ho0JyUvDl2OYsQe1xhqpK01y/xLn1xYgiuay7vu9I8qf4yTIY2iPdA3xH3hz/DwMBOAZerV1g
 AEfogSLkSpA9qXMkfm1AjRUMUSi8uA3/7xi1jk0GaFAGalOeJG76o7AlTpQfExlyyqfettdyCiN
 /mTdJ7QqA+mcdPmFwTsnyKBLRMSZYh8hlG9qc26LhN6yqgGCX8J4LRHpzsZdj/RnPu6MZv0iHE6
 OpjnDJFr7mKAfXqRLdbJKYrOirErinoAPigojiKPXJo30xhHgqA6nkbGmffFe028A1rf3H5i6jE
 co36MTUvhoamCd6oNIA==
X-Proofpoint-GUID: HeECEZjAHgqWfKBRMDA6FJtKgwJrGCVt
X-Authority-Analysis: v=2.4 cv=Scxi5fRu c=1 sm=1 tr=0 ts=6adb96ca cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=G-aZ52fNQZuqIlxTME0A:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: HeECEZjAHgqWfKBRMDA6FJtKgwJrGCVt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX4XiiX4R7pJib
 WelvW24VxQ/T5pJ3ixClIP+DzbE6tIsgOMmVIxRB5RoFMtLYeY2HGp2xnK6Hm5mBDTFW16CboWD
 Oaw8d2peYUMxAjJTJZp68pqRKu+WM+k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Put the speaker protection and VI modules in calibration mode and
register for EVENT_ID_VI_PER_SPKR_CALIBRATION, so each speaker's state
and measured resistance are reported on their own.

Number the V/I channel pairs consecutively, as the VI capture packs one
pair per speaker without gaps.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 72 +++++++++++++++++++++++--------
 sound/soc/qcom/qdsp6/audioreach.h | 36 ++++++++++++++++
 sound/soc/qcom/qdsp6/q6apm.c      | 55 +++++++++++++++++++++++
 3 files changed, 146 insertions(+), 17 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 9e45634cafbc..75995426b9f6 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -1464,6 +1464,35 @@ static int audioreach_speaker_protection(struct q6apm_graph *graph,
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
@@ -1474,8 +1503,9 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 	struct apm_module_sp_vi_ex_mode_cfg *ex_cfg;
 	int op_sz, cm_sz, ex_sz;
 	struct apm_module_param_data *param_data;
-	int rc, i, payload_size, j;
+	int rc, i, j, payload_size;
 	struct gpr_pkt *pkt;
+	u32 num_speakers;
 	void *p;
 
 	if (num_channels > 2) {
@@ -1483,9 +1513,20 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
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
@@ -1503,8 +1544,9 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 	param_data->param_id = PARAM_ID_SP_VI_OP_MODE_CFG;
 	param_data->param_size = op_sz - APM_MODULE_PARAM_DATA_SIZE;
 
-	op_cfg->cfg.num_channels = num_channels;
-	op_cfg->cfg.operation_mode = PARAM_ID_SP_VI_OP_MODE_NORMAL;
+	/* The DSP calls this field num_speakers for the VI module */
+	op_cfg->cfg.num_channels = num_speakers;
+	op_cfg->cfg.operation_mode = PARAM_ID_SP_VI_OP_MODE_CALIBRATION;
 	p += op_sz;
 
 	cm_cfg = p;
@@ -1514,20 +1556,15 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
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
@@ -1601,7 +1638,7 @@ int audioreach_set_media_format(struct q6apm_graph *graph,
 		break;
 	case MODULE_ID_SPEAKER_PROTECTION:
 		rc = audioreach_speaker_protection(graph, module,
-						   PARAM_ID_SP_OP_MODE_NORMAL);
+						   PARAM_ID_SP_OP_MODE_CALIBRATION);
 		if (!rc)
 			rc = audioreach_module_enable(graph, module, true);
 
@@ -1610,6 +1647,7 @@ int audioreach_set_media_format(struct q6apm_graph *graph,
 		rc = audioreach_speaker_protection_vi(graph, module, cfg);
 		if (!rc)
 			rc = audioreach_module_enable(graph, module, true);
+
 		break;
 	case MODULE_ID_AUDIO_IF_SOURCE:
 	case MODULE_ID_AUDIO_IF_SINK:
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 38b71aefd845..4744d3117010 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -720,6 +720,42 @@ struct param_id_sp_vi_channel_map_cfg {
 	uint32_t channel_mapping[];
 } __packed;
 
+/* VI per-speaker calibration event, raised every frame in calibration mode */
+#define EVENT_ID_VI_PER_SPKR_CALIBRATION	0x08001511
+
+/* Calibration state, as reported by struct vi_per_spkr_calib_param.state */
+#define VI_CALIBRATION_STATE_NORMAL_MODE	0 /* Not in calibration mode */
+#define VI_CALIBRATION_STATE_INACTIVE		1 /* Port not started */
+#define VI_CALIBRATION_STATE_WARM_UP		2 /* Warming up */
+#define VI_CALIBRATION_STATE_IN_PROGRESS	3 /* Calibration running */
+#define VI_CALIBRATION_STATE_SUCCESS		4 /* R0/T0 within range */
+#define VI_CALIBRATION_STATE_FAILED		5 /* R0/T0 out of range */
+#define VI_CALIBRATION_STATE_WAIT_FOR_VI	6 /* Waiting for V/I data */
+#define VI_CALIBRATION_STATE_VI_WAIT_TIMEOUT	7 /* Timed out waiting for V/I */
+#define VI_CALIBRATION_STATE_LOW_VI		8 /* V/I signal level too low */
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
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index bb2f18a64644..0e02cadbc14b 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -560,6 +560,58 @@ int q6apm_get_hw_pointer(struct q6apm_graph *graph, int dir)
 }
 EXPORT_SYMBOL_GPL(q6apm_get_hw_pointer);
 
+/*
+ * Convert a Q24 fixed-point value to its integer part, and to the first three
+ * decimal places of its fractional part.
+ */
+static int q6apm_q24_to_int_frac(int32_t val, int *frac)
+{
+	*frac = (int)(((s64)(val & 0xffffff) * 1000) >> 24);
+
+	return val >> 24;
+}
+
+static void q6apm_vi_calibration_event(struct device *dev,
+				       const struct apm_module_event *event,
+				       int payload_size)
+{
+	const struct event_id_vi_per_spkr_calibration *cali;
+	unsigned int num_ch, i;
+	int r0_int, r0_frac;
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
+	num_ch = min_t(unsigned int, cali->num_ch, num_ch);
+
+	for (i = 0; i < num_ch; i++) {
+		/* Only SUCCESS and FAILED carry a measured R0; both are worth reporting */
+		switch (cali->cali_param[i].state) {
+		case VI_CALIBRATION_STATE_SUCCESS:
+			break;
+		case VI_CALIBRATION_STATE_FAILED:
+			dev_dbg(dev, "VI calibration channel %u failed, R0/T0 out of range\n", i);
+			break;
+		default:
+			dev_dbg(dev, "VI calibration channel %u in state %u\n",
+				i, cali->cali_param[i].state);
+			continue;
+		}
+
+		r0_int = q6apm_q24_to_int_frac(cali->cali_param[i].r0_cali_q24, &r0_frac);
+		/* Raised every frame, so keep it at debug level */
+		dev_dbg(dev, "VI calibration channel %u: R0 %d.%03d ohms\n",
+			i, r0_int, r0_frac);
+	}
+}
+
 static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 {
 	struct data_cmd_rsp_rd_sh_mem_ep_data_buffer_done_v2 *rd_done;
@@ -583,6 +635,9 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 			client_event = APM_CLIENT_EVENT_WATERMARK_EVENT;
 			graph->cb(client_event, hdr->token, data->payload, graph->priv);
 			break;
+		case EVENT_ID_VI_PER_SPKR_CALIBRATION:
+			q6apm_vi_calibration_event(dev, event, data->payload_size);
+			break;
 		}
 
 		break;
-- 
2.47.3

