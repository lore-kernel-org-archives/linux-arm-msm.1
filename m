Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364115;
	b=wEZRJYk22p0nzja2Skv15JH8u3zVGmXOV0CmRpjX+kcULZJXd8VSIiTe9x5rzvfJn/h1
	 qZ1q6CczD7aQftBaYEhyJjf9p5nWaZdnQLOPsJ4AsKXZ+MBGduNeNREd8aCO33q1oARdG
	 wAAlih8Lr5Z8thGbrMbqvNk/mBylvqq6ggV/HSSAGZbl7L0GUUryZFuzQVK0ExQRuWWVu
	 OwglH+EFdTJmR18hp2rEJ27dzIy2O2z1fhFfpWpIoCWiTVTKtO2XnlZYTLewljYbfsldX
	 0nzyk8o3YpApmqSd4Xt2QVqH2ToZEJasQDcodIGoTNZzyf4yoAgX/y8wAMZZ7uCeTdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364115;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5/FrKsGahA+B1P78BToKPUBey5i8SjbBdB9sdPhe2v4=;
	b=LvHWoMSC/Lw4ntiX2mDn7Ynnp1fHYygbE3DkmUKiry74VZwDSYZlIZl5EY0BgHPEUMK4
	 oGXqI+73xeMGBSu2dXWLGeUk2muQzUkhB47PrDZjG8B0khOi0AC1sK4gy8sYgqK5+PoAn
	 kk7EGKJWV5J6npvX3zlaUQSrBYcasADyU7HWNParKreDV3HSaVR+/nTwY/Gh/mwDlQdrU
	 Btno3iETHqWjRQRkrXUBnSnBQyNNEgG56QP/NQKFjceYnIAWZnqEwr4onTifxlUC4xeFG
	 5eG4BDTUaZa7DN9vAhjIFJxlyHPB0MpbTz0kbyDuOd+nZ65S6yRfBuuoHQq05PCRbGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GEz+sCTP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kCWFoFEX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ECB606C561
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35ECB606C561
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GEz+sCTP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kCWFoFEX
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQoBU1248386
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5/FrKsGahA+
	B1P78BToKPUBey5i8SjbBdB9sdPhe2v4=; b=GEz+sCTPHivOPsKKvKHmH6SuIOz
	mdhtugYvSkyJwnAFDn//gejEK4CH7ntTLT5JduxHcVfwJBfebknzWA5lnmRqI88q
	C1Ca7sfle4cm8en9LcQh2xnItMlREgheGy6OZQ/AznxJ8koAFvDWHlJAVznJyMqy
	bf9WYPBZsFSYY1NC1emOesS9shMJYD62YggtH0lgAoyohWl/SG0wfPyWWBAGLB2r
	Q7QM0FZk/lLi3sJRuE0ape1oLMDDYd1ReJ5vnbPd3iEOTO/Ajmwm5bzYvjlbQ87D
	NQucV8WuhC1PrAXLJr/0h4D0NkoUMtv60/9mi3ARhkKyoXTDcOngKc7FqwQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32w03rvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-949b0d3232fso393551985a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 08:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364113; x=1795968913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5/FrKsGahA+B1P78BToKPUBey5i8SjbBdB9sdPhe2v4=;
        b=kCWFoFEXdrTKBq4EFkEvbyDj6Yb8qVySvKzXjxQ5etXaWzItA2EwVdRj2ViYfHrgug
         Iz7Gfvo9M1cD9DQpt1Z92vn1wvd2rF8v+pObdrB0ZHVBQXcq9D87o6ddgWtjoEW2gyrU
         zwdjoXJmAHIIKWHrOqUUeozcIblmamJRAzNONaFy135ICSROJeODzgtHvjZkoDL+jTYX
         CyaFzHiKpI/DmP38hbPJzXMOseWxd7GBeMcVRczEEznIx0RJfFNWv1ZNcoQlvwk31+iO
         dEEVPGBo2mgTOe69XbkAhQYtVpNaVb52+HpgBzxgaD9Sahj9XEtm/oPySFl7Tj0OG0IG
         i5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364113; x=1795968913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5/FrKsGahA+B1P78BToKPUBey5i8SjbBdB9sdPhe2v4=;
        b=nSyBL9r4CSDEZxxbVzkP9TRVWd28JrVpF0vEZP9NzZKefpRsl84jwF69rbXhDZ1JJd
         DdVQhzK5yXleYg/jHaVMpislOAITFMIyaAhvcY27Pb60/JMPHDZ9bGMaSSH/kExfbB9G
         IPMB2jdqZse3KZFh4OOfWPecoXr2b3/+JhqNeBxLUAtn+xIPeTatQhiUxRNfZRpUe9YA
         Ph1LzLTpD7L2iL/w0nG+6ncShqs5Of8dwSHTK49ArH3l9TeflnHkyq9soMZGb6L8OTYT
         rhE84dMEXuuGK4UDt9ITEVDGLUnWQxtF6NC6LDTc9XASzFyHEdoU+67VF95G5RRir5bP
         OB7Q==
X-Forwarded-Encrypted: i=1; AL+hErHnleJXv8oWaAaLH1SX1VSvrw2pTTC8LXa3KkfcYto12vejxoZwuaXqZnJtNFJ0FIoAA4eSSmvDghSM9VNL@vger.kernel.org
X-Gm-Message-State: APuU4Z/LEIO788daIwoqBEf4guMB70gzMYerqHRb+TiAVOchhndNKjt+
	mNkAg4yhFMv55ch1cLjJajKS37ujuFJ/0tc6rYBnYLubQT5SDiy24Fiag6gl2RzgN3RmxFqGjob
	wy6q6MLFIpTTBjffqIy5n3T4ykD2vCLoZ+4+UEb0TMAFHJtKOincIKHYDqG8iZn/dUTU0
X-Gm-Gg: AZFdTZddugG9ElKlQ709f6INO5wHerCSykynLmJ5W0cX1QESWfF4fOjeJNgAoEcgN8O
	qNgSw3fqD8Q4eXJj17p8C4b1Bg7pek/T/ZuEBNyQes9igAXaGv2S2qlnWh3gJg0yNYvY62OONfW
	Dh3acDYtHlnK1/X0coVIy6YdbJpD+hiqPScFqV7DOZiO4Tj3riMZTg1wHlPTgvVgUjjrdzylpz8
	9ihIWBFYGaSBJ0NGy48pa2jYkOoY+gbpvKbFdQXLm3FFiCofgbdNt1Tzchzx+Cmb7lcwupMirwu
	JIUbzwuDZbowBOh+y7imqOWvCiihUp8IujSINeB/+MPkjVyEfJiN1kvbD0SvR+iwY9I4yLz/fDR
	daHbP2G0f11bgGJiQpSLsSD/MKxDL6PNojIU588WETUE0vA5wWVWht1dKru6B0idN
X-Received: by 2002:a05:620a:270d:b0:949:3ea1:3021 with SMTP id af79cd13be357-949bab6d711mr1536106885a.68.1795364113145;
        Sun, 22 Nov 2026 08:15:13 -0800 (PST)
X-Received: by 2002:a05:620a:270d:b0:949:3ea1:3021 with SMTP id af79cd13be357-949bab6d711mr1536098385a.68.1795364112666;
        Sun, 22 Nov 2026 08:15:12 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:11 -0800 (PST)
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
Subject: [PATCH v2 15/24] ASoC: qcom: audioreach: send static cfg blobs to speaker protection modules
Date: Sun, 22 Nov 2026 16:14:28 +0000
Message-ID: <20261122161437.5994-16-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX4mps6s0yL6ih
 GaPkbwH7Ic3B8FRzTKRp3IFiaUD6QyO+lxyJpLHdmuYX0UgvLLBKq2V6Bv5gwqk71pg7E9l4YRX
 HJFanJ/sAAzo8voW+HEZDEEm/+UtZj4T5jYwZeMK/zIb7i3MEQQMjMhrjIpvk7u9q+jf4UdPMWy
 HzgnGpi1XGp/XS1IMEnsPcw8dTj50iUPcN+vOz12CmZAza2L5+gy9qp+4pvqy9aQIaSOOB36dJv
 gBti63eiEhtouBOU6eVjuae06Hv+fOVZ2XfRTO5f+NGpZs2rzpnxhYPTLyRtXTbeVxC5NJc1SNM
 7tovqjdMkZf608sHKHgkpUfcJiEkpOvnYChYlmM2ZvkW6Unjg4oKdodlgeWSNoDL8AjcL+WLBsd
 sOfJqMB7RAhYpGuBL+6JzV0gHUb8cVM9UW1+hnbDRUVk27/Eghx++4etKjNwv0F7EH+p7HWSaJM
 T1K0lapeFrlnVCfe0Yg==
X-Proofpoint-ORIG-GUID: Z-xPqRqsxXDYkGFSyiTqLTBQmBUtGfU8
X-Proofpoint-GUID: Z-xPqRqsxXDYkGFSyiTqLTBQmBUtGfU8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX014dxWgNt3Sf
 +YAe7ZsiEXns24ETQvVZ2SSThM6CyjS0/GprY228khBv+3iyUOSDP8UVikHWcwt6uwPPLSjru7z
 0CTzd5UbiwT0kVx98HS5jKCauP92vls=
X-Authority-Analysis: v=2.4 cv=S+dMU4sP c=1 sm=1 tr=0 ts=6b031511 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=OAJap1ZGhMVArrtS6vMA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The speaker protection modules need tuning parameters from the topology
cfg blob, which is never sent to the DSP.

Send it once the module is configured, in small SET_CFG commands split
on parameter boundaries, with each payload padded to 8 bytes as the DSP
expects. Every record is checked against the end of the blob, and a
malformed blob is rejected. A blob not laid out as parameter records is
sent whole.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 139 ++++++++++++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 070100627809..436d33ea568e 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -1949,6 +1949,141 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 	return rc;
 }
 
+/* Keep each SET_CFG small; a larger single parameter is sent on its own */
+#define AR_SP_CFG_MAX_CHUNK_BYTES	512
+
+static int audioreach_speaker_protection_send_chunk(struct q6apm_graph *graph,
+						    const char *tag,
+						    const void *data, int size,
+						    int chunk_idx)
+{
+	int rc;
+
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	memcpy((void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE, data, size);
+
+	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
+	if (rc)
+		dev_err(graph->dev, "%s cfg blob: chunk %d (%d bytes) failed: %d\n",
+			tag, chunk_idx, size, rc);
+	else
+		dev_dbg(graph->dev, "%s cfg blob: chunk %d (%d bytes) sent\n",
+			tag, chunk_idx, size);
+
+	return rc;
+}
+
+/*
+ * Walk the parameter records of a cfg blob. Each starts with the module's
+ * instance id and a param_size, followed by its payload and optional zero
+ * padding; a parameter smaller than a word may come without a payload word.
+ * Each record is checked against the end of the blob. With @dst, the records
+ * are copied there with their payload padded to 8 bytes, as the DSP expects.
+ * Returns the packed size, or -EINVAL if the blob is malformed.
+ */
+static int audioreach_sp_cfg_walk(const u32 *word, u32 num_words, u32 iid,
+				  u32 first, u32 *next, u8 *dst, u32 max_bytes)
+{
+	u32 pos = first, bytes = 0;
+
+	while (pos < num_words) {
+		u32 param_size, payload_words, avail, rec_bytes;
+
+		if (word[pos] != iid || num_words - pos < 4)
+			return -EINVAL;
+
+		param_size = word[pos + 2];
+		avail = (num_words - pos - 4) * sizeof(u32);
+		if (param_size < sizeof(u32) && avail && word[pos + 4] == iid) {
+			payload_words = 0;
+		} else {
+			if (param_size > avail)
+				return -EINVAL;
+			payload_words = DIV_ROUND_UP(param_size, sizeof(u32));
+		}
+
+		rec_bytes = APM_MODULE_PARAM_DATA_SIZE + ALIGN(param_size, 8);
+		if (bytes && bytes + rec_bytes > max_bytes)
+			break;
+
+		if (dst) {
+			memcpy(dst + bytes, &word[pos], APM_MODULE_PARAM_DATA_SIZE);
+			memset(dst + bytes + APM_MODULE_PARAM_DATA_SIZE, 0,
+			       rec_bytes - APM_MODULE_PARAM_DATA_SIZE);
+			memcpy(dst + bytes + APM_MODULE_PARAM_DATA_SIZE, &word[pos + 4],
+			       min(param_size, payload_words * (u32)sizeof(u32)));
+		}
+		bytes += rec_bytes;
+
+		pos += 4 + payload_words;
+		while (pos < num_words && !word[pos])
+			pos++;
+	}
+
+	if (next)
+		*next = pos;
+	return bytes;
+}
+
+static int audioreach_speaker_protection_send_static_cfg(struct q6apm_graph *graph,
+							 const struct audioreach_module *module,
+							 const char *tag)
+{
+	u32 size, num_words, pos = 0;
+	const u32 *word;
+	int total, rc = 0, chunk = 0;
+
+	if (!module->data || !module->data->size)
+		return 0;
+
+	size = le32_to_cpu(module->data->size);
+	word = (const u32 *)module->data->data;
+	num_words = size / sizeof(u32);
+
+	/* Not laid out as parameter records, so send it as the topology built it */
+	if (size % sizeof(u32) || !num_words || word[0] != module->instance_id)
+		return audioreach_speaker_protection_send_chunk(graph, tag, word, size, 0);
+
+	total = audioreach_sp_cfg_walk(word, num_words, module->instance_id, 0,
+				       NULL, NULL, U32_MAX);
+	if (total < 0) {
+		dev_err(graph->dev, "%s cfg blob is malformed\n", tag);
+		return total;
+	}
+
+	u8 *packed __free(kfree) = kmalloc(total, GFP_KERNEL);
+	if (!packed)
+		return -ENOMEM;
+
+	while (pos < num_words && !rc) {
+		int bytes = audioreach_sp_cfg_walk(word, num_words, module->instance_id,
+						   pos, &pos, packed,
+						   AR_SP_CFG_MAX_CHUNK_BYTES);
+		if (bytes <= 0)
+			return bytes ? bytes : -EINVAL;
+
+		rc = audioreach_speaker_protection_send_chunk(graph, tag, packed, bytes,
+							      chunk++);
+	}
+
+	return rc;
+}
+
+static int audioreach_speaker_protection_static_cfg(struct q6apm_graph *graph,
+						    const struct audioreach_module *module)
+{
+	return audioreach_speaker_protection_send_static_cfg(graph, module, "SP");
+}
+
+static int audioreach_speaker_protection_vi_static_cfg(struct q6apm_graph *graph,
+						       const struct audioreach_module *module)
+{
+	return audioreach_speaker_protection_send_static_cfg(graph, module, "VI");
+}
+
 int audioreach_set_media_format(struct q6apm_graph *graph,
 				const struct audioreach_module *module,
 				const struct audioreach_module_config *cfg)
@@ -2002,12 +2137,16 @@ int audioreach_set_media_format(struct q6apm_graph *graph,
 		break;
 	case MODULE_ID_SPEAKER_PROTECTION:
 		rc = audioreach_speaker_protection(graph, module);
+		if (!rc)
+			rc = audioreach_speaker_protection_static_cfg(graph, module);
 		if (!rc)
 			rc = audioreach_module_enable(graph, module, true);
 
 		break;
 	case MODULE_ID_SPEAKER_PROTECTION_VI:
 		rc = audioreach_speaker_protection_vi(graph, module, cfg);
+		if (!rc)
+			rc = audioreach_speaker_protection_vi_static_cfg(graph, module);
 		if (!rc)
 			rc = audioreach_module_enable(graph, module, true);
 
-- 
2.53.0

