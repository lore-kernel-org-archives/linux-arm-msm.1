Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFF44DF4D5
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159949; cv=none; b=nv3fp6MHc3gt8GyPOBKWQJ6c/NO7gSCeI9xSRR/WsPYWX9SIAtsLoTKOOA0TWU1UGf/Hp43OMaBlB749eKA9SCPpJuqggKIZJZhNJKwy9LtxuH+/PzUEtvJXSWsRppcH18PHB7LKeIYr4H31tN7zMtuZwjqBNcaBQGJIS9xW0lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159949; c=relaxed/simple;
	bh=rgkPiQLDuHZhgT4/G3OtHq/Z5hWpRHeWeCpWLYt4AxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TlUyECxxvn3yPanIluzBe/NXXQv2B1CIZtIysY7NEpAA+c4WkOqMhrbbflOWcZWIHM3aZBoIFfE6B0vkrnZxaVWCbS3zfswqDv73xZ+Dlvxtta39ZT3Z8wj19360+LR77FJGW2TjkvjTzIEBx2VJySl64hClizHLqSNJdrlbgQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QEWhKm/W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fPv/2DRh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QEWhKm/W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fPv/2DRh"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE6Q102494922
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Gg6081YpwKP
	psw+SvH8/3fphksCH2ss8wRm7fjhCQ3c=; b=QEWhKm/W4rSTaCcyhn9nHZdoMpM
	o8jg0ISKYn+3wjWf/GwfkZczX7PGudFZzxhsgyYf6oXRHUu3i4DtzjQEuwFdaxzp
	UpuFP0xXOgmS0726PnL0u+zmF03FMEH339f2bJkU57iqQ0waC4plzemTwvFPZzQ9
	wSo1Z14UPRBGnrN3l45gWksGPK+d6KcVfAzGP5v3kC8QVqOPbSdIPGdImy2ELDOn
	bn93b35qQRFjqZY7YKzeCul4pIpCGZvzJZyQcVzS8ilI0WYXUsNRSZNW3EBGhDFp
	MRN6GcNAqF2dclVyzrkInkc01rOnUIvMSbyqwU7dCXKjEzrWDX23Nrfvjcg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a8ayt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:12:21 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c902e0da2so1268465eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 07:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792159941; x=1792764741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gg6081YpwKPpsw+SvH8/3fphksCH2ss8wRm7fjhCQ3c=;
        b=fPv/2DRhKp0Tn7J+WeMY5dyzp/tsmeGypC206czXwcNUpU0GM4TMvSBJ35cIbcCdMg
         2tSrWBB/LJfOz9UyfB65JgIor2ZuRj33yLYSuQ0gMxYLqjcNZyXv4lret94Fwd7tzcIT
         UcPhVMjAX3Yb7sia2rtFkVHcrbVgpENngrNT8px14S+Tg6M5Upp7YzsSaAIA3wkS/7GC
         UaqiC9qlGnODNB2wgKJ33PG318ukgAi1QYlOvHjITsSDMXzyqt7YW7PGecCiHxrLnRM3
         Lt6WolhyD/Yae/Td5PXS/pW7h7ztU/z7F6xiopQPXi+ixLkixPdyAHiE4JP3KNHxrmPm
         TUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792159941; x=1792764741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gg6081YpwKPpsw+SvH8/3fphksCH2ss8wRm7fjhCQ3c=;
        b=vUsX+3VDM/xBPgpZ1a9wqFhjDnrQq5Pxkis6gFUcR4hJQstfNrp5X8RPVEeWWjgDUa
         nDYODGmmQUuKGJAk5hONGYk8m3hH28X4OYP/AEm2nJtvI3auBDlbMUJZhXgv6c7HnC48
         hmNaoW7NRWcyQQUHpyYj7mBltJHqs8zxcLdgnKufn9nRWi2cZWeiWkjgg2FDIEeO6x+e
         +KVlBzsCUy8ww6C6z3EadVU5GXz0L05QzKHTG8gWvlyCDlWIY1+AtAoEbxVRUOxEBZiU
         7Ekm2ne+f1hUIpHvjfP/eNuJi68DzHyV0XPirtdyhlLBVfy5pUHtZ1qgc5SgQhpiVzwC
         0OJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzTt6/qRQKcN4V3VN2JK/sboK9xQFLYsW2zWonLEuNejHGLY5PlbURCuJM9uXxmktldB6tBpprvrOOo7H6@vger.kernel.org
X-Gm-Message-State: AFq9FYLofSYHt59qN9nNys1K/mJ6DCDDZqMKcgI/m6esBUtTA6Uqo+p4
	MYw+V2hmIo+7o2CRNcgeNSD1aH15vHqa2I037cNTeAOa4BZxQmoMqWAXYQQvD9ATVnXG+M2+GIe
	ixmD37WujW4Svk00u40E4O2MyOn2LuuwVSYCb9hRlcOEfy3xkF7LUAGVs655jcR/2I39B
X-Gm-Gg: AYBFou1fpAa80SYHSaV1minwan5MS5H41nALMv3bN52AWbsQkWxchFUQA2WrGJStP1s
	KO2cpUjk4Y1V8a+JhnT0YfwAbPtQoHqwqrbNF0fmsPbWl7VysgzaznCUm8pavunUoJhLV+D7EYh
	KZJgzwhQPDQ0TXAtQV7n2R1gJsCqX2FTxiObIGsEY6eSYiWtHVDtDmsFUe4Z/INXdze44wVyq9A
	GZQy0hSbm6Z9uaPZwQYegRdqFg9at9zYHpVVzOSNqRPingeASPhz7hHd8vvQZSOz6IdBYuEHvyU
	9RqBFzysi3dbDFsPGBRvQzZoBtr1l0+jLbkheGDAselNduGyhUDVx8Ibx0SP0ty8Xkin4FVhkcB
	62N0rjim03PcWJ1TzfSa7LC3jVvkakIAP21EB8zXZiPduf4XKzN4lwWntxWw=
X-Received: by 2002:a05:7022:913:b0:14e:61bb:ec3d with SMTP id a92af1059eb24-18511232282mr132410c88.16.1792159939812;
        Fri, 16 Oct 2026 07:12:19 -0700 (PDT)
X-Received: by 2002:a05:7022:913:b0:14e:61bb:ec3d with SMTP id a92af1059eb24-18511232282mr132314c88.16.1792159938892;
        Fri, 16 Oct 2026 07:12:18 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b1722asm6997682c88.1.2026.10.16.07.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:12:18 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/3] ASoC: qcom: q6apm: Unmap DSP buffers before removing the topology
Date: Fri, 16 Oct 2026 22:11:53 +0800
Message-ID: <20261016141153.1346219-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016141153.1346219-1-shengchao.guo@oss.qualcomm.com>
References: <20261016141153.1346219-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX4YcD8ExOhlHK
 fGUtAEnkodSbSB8vrQGP/Mn/8rqRpCIqUjlSpAW/qYneu3utDIbKTeePVOqkYjkvbOxAcM9k3Jm
 xQf7uPYT++hmdGxu4eg93z4qPt0fnLc=
X-Proofpoint-ORIG-GUID: mSj1nwxch5yaOSx-o7n5syubao9jcrba
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad230c5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=pRitcdQJkKt4eD0iFYsA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX+Vv/m1rQxd20
 W52ps/zwT9tFrswYEnMu3GvrTghu9hIUMi7lJjfdkPNLBbTVREwIwbM6xThJD4oOTeBv7XOwX+r
 gPbSCxuBJSlJID5rR1/TsdCmnoGdCRZVA8p4gIICxdKsg4GQLdWA736RNHxQotMgAsstwIAVjVg
 ipRhBMgDCV7nBGdtrdyFhydZIFvLojBWxBxiDl8MeNm6Jw3d2kI868toMzpkW0qvoAVAHndxDsf
 dz0F9F3fn78qdZwagswMk7nffSnoo1GCICfw5ePQ+rFGHTRXETtoUpx6wSO2TL09EJKPSwAoFts
 lSMPVtJVoLByg+H+SchlRrHf61M43cozO6K6W3AUgRUE45KwERJxkeEtLjFnpToavSdh6cd1HYI
 WciFtHs1Hwpolqk1hlhGdZ1InTmdFtWYvqYkwz8WWa7jYKfg+nfzMiMwiYZK4KlXba6myJgZDxm
 04k2yRFDulD4PeEy4kQ==
X-Proofpoint-GUID: mSj1nwxch5yaOSx-o7n5syubao9jcrba
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160056

Since buffers are mapped once in pcm_new() and unmapped in pcm_free(),
the unmap relies on the graph info still being registered. During card
teardown, however, soc_cleanup_card_resources() removes the components
before it frees the PCM runtimes. q6apm-audio's remove callback unloads
the topology, which frees every audioreach_graph_info, so by the time
q6apm_dai_pcm_free() runs the idr lookup fails and the unmap silently
returns -ENODEV. The DSP keeps the old mapping.

When the card is bound again, for example after unbinding and binding
any codec on it, pcm_new() maps the same buffer once more, the DSP
rejects it and the front-end PCM is not created:

  qcom-apm gprsvc:service:2:1: Error (1) Processing 0x0100100c cmd
  qcom-apm gprsvc:service:2:1: DSP returned error[100100c] 1
  q6apm-dai ...: Audio Start: Buffer Allocation failed rc = -22
  snd-sc8280xp sound: ASoC: can't create pcm MultiMedia1 Playback :-22

Release the circular and position buffer mappings of all graphs in
q6apm_audio_remove() while the graph info still exists. The unmap
helper now takes the q6apm instance directly, since it is called from
the APM component rather than from a q6apm-dai child device.

Fixes: 8ea6e25c8536 ("ASoC: qcom: q6apm: Add support for early buffer mapping on DSP")
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 72ccaea1feb3..bfbcf259002e 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -321,11 +321,10 @@ int q6apm_alloc_fragments(struct q6apm_graph *graph, unsigned int dir, phys_addr
 }
 EXPORT_SYMBOL_GPL(q6apm_alloc_fragments);
 
-static int __q6apm_unmap_memory_fixed_region(struct device *dev, unsigned int graph_id,
+static int __q6apm_unmap_memory_fixed_region(struct q6apm *apm, unsigned int graph_id,
 					     bool is_pos_buf)
 {
 	struct apm_cmd_shared_mem_unmap_regions *cmd;
-	struct q6apm *apm = dev_get_drvdata(dev->parent);
 	struct audioreach_graph_info *info;
 	uint32_t mem_map_handle;
 	uint32_t pos_mask = is_pos_buf ? APM_MMAP_TOKEN_MAP_TYPE_POS_BUF : 0;
@@ -357,13 +356,15 @@ static int __q6apm_unmap_memory_fixed_region(struct device *dev, unsigned int gr
 
 int q6apm_unmap_memory_fixed_region(struct device *dev, unsigned int graph_id)
 {
-	return __q6apm_unmap_memory_fixed_region(dev, graph_id, false);
+	return __q6apm_unmap_memory_fixed_region(dev_get_drvdata(dev->parent),
+						 graph_id, false);
 }
 EXPORT_SYMBOL_GPL(q6apm_unmap_memory_fixed_region);
 
 int q6apm_unmap_pos_buffer(struct device *dev, unsigned int graph_id)
 {
-	return __q6apm_unmap_memory_fixed_region(dev, graph_id, true);
+	return __q6apm_unmap_memory_fixed_region(dev_get_drvdata(dev->parent),
+						 graph_id, true);
 }
 EXPORT_SYMBOL_GPL(q6apm_unmap_pos_buffer);
 
@@ -850,6 +851,21 @@ static int q6apm_audio_probe(struct snd_soc_component *component)
 
 static void q6apm_audio_remove(struct snd_soc_component *component)
 {
+	struct q6apm *apm = dev_get_drvdata(component->dev);
+	struct audioreach_graph_info *info;
+	int id;
+
+	/*
+	 * The card core removes components before freeing the PCMs, so
+	 * q6apm-dai's pcm_free() runs after the topology (and graph_info)
+	 * is gone and can no longer unmap. Release the DSP mappings here,
+	 * otherwise the next pcm_new() fails to map the same buffer again.
+	 */
+	idr_for_each_entry(&apm->graph_info_idr, info, id) {
+		__q6apm_unmap_memory_fixed_region(apm, id, false);
+		__q6apm_unmap_memory_fixed_region(apm, id, true);
+	}
+
 	/* remove topology */
 	snd_soc_tplg_component_remove(component);
 }
-- 
2.43.0

