Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775620;
	b=Q89HBV9NjLb+rVM3GNyTn1WUzxNG0/Tg5Bn82ahVadB8gdA+ciHEGa5OxAXdbiLzH2p/
	 s+X66EQeAMp1L5nUidsO10Ga8H2Z618HUoxXUAuBlgdXImPFwKV6wg89/FhaWJanpe1E1
	 jWyUF43JvcTFyHhOKSuNVUTFaV6i5KitmKXoD40Xv3mn4AP9/fxjkikk1NdYLcbEmsDmK
	 pZ4lM2QvxcbVeznA+9xkzy47+UFVycPp3F6Zqydq7jgY4VOQfBXFKlq2UsmTiBcXzTo/2
	 vAhRvEEkGg/wOZU4EazWye+g3IGmd3y2oNeyTSAkokqzk/4pbCNbM4MaCIvRZXTASOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775620;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=azg3XSvMykpTDhpzyYQMK0xeWLWeWs6SeZBLuvOTxGc=;
	b=NY1fZH/B/BESFMTcZz4xWu3pWLQsjqpyf2yFZ3UxdIqq8PgQv/vhHK5wppXOP9dp4uY0
	 7FUWo80KXNVkpjYs8wKui4p4JDPc4iPwaSJokdHeeJvYJJ7/Hby3eXPlsapiwte3t8MAp
	 SruOB9YIO4hf4Itibgvoxr1/1LSDEtOlNBLUvfi4j8Ia662fnK51q15/dv2bzH1sxAvxM
	 Dd2jY1Ri+tyQgAJk5+iTU5zTKTPxr3rdtcKE8wKnt0o7srx1karIxoDr9qby4wUiqsskO
	 akmzdbMJkYdskGjFZ2QAo2XBygAlZy5zQKH74y1f+YgYIisfxA5viBMleqBC+L420XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lh1J3H32;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YVJhbyZX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D23E606A339
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D23E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lh1J3H32;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YVJhbyZX
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE67au3019010
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=azg3XSvMykp
	TDhpzyYQMK0xeWLWeWs6SeZBLuvOTxGc=; b=lh1J3H3233uDUfWpmdbmM52osDB
	lgKjpeS2cteLoji4ZRksboUTQKKycMhktVCqRUkY74qQ8pVWeUrB7FVfKxLyvIUI
	Hk2mt/QgnOj6wjliwkUi0mb8kNFHJd/EN85aYyFZLz0gQwOloJXdvS3xYX5vRSf1
	pO+NTh78aNXjkjQ3oHILKZIb8uhvwLOqcH8hR1dtLM7zH5rG7tQG601QgwovAu0t
	+AH6MlgjbmhsKvvbXr6UcOrRvKNrr/0vKUoxw9aql00U5T7h27i+7Jv7lQ8hxzIu
	2Unk/a/bxaPflh7gBsBr+P4PRdPEOYxdf+u8tUBNpP/V1YrABBo7+54vkxg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykc557-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:13:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ecdc701a2so150887785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775612; x=1793380412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=azg3XSvMykpTDhpzyYQMK0xeWLWeWs6SeZBLuvOTxGc=;
        b=YVJhbyZXoLA1coUNuoHKBti8dh3bsGg1rxa2kSnkljc6VWA9A1CiNLsnQZQ5mBZ6co
         2hm0K0bQXkvWHtpj6O4l3IZVNuj4IzLYcpbbsHonajgh/fTUqs7JSCcNfcBcl+LQvgDq
         tfw35qVZUgW/OKRcvKvteyJFkJPJDAX3AYowmTB1K0WvK7f1PVgKqTaVbqNsltJSvQ+I
         lfPKyyCXKDRRUc5nSnyyZRNVFZ37CPjbX5uLntrFKYRKjkpr6YjEmr6i6u/r7EhPflTc
         Yjv/pgxVaI2b1uzPZ9ts2LSDZxpAi5q3MCVN90SloIX8ShC0X3H+yVOOIu3I1qn+JnxE
         FUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775612; x=1793380412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=azg3XSvMykpTDhpzyYQMK0xeWLWeWs6SeZBLuvOTxGc=;
        b=nM5D5m9En+NndzBTkKT4pw0QJDmtRpVvCokRD1mPp1ZwQx35BEItdZ58hqIIT4alB7
         KyAwGj0xYRVJhjoBeM8CrStd+Rp6U/9u1sIYrl+ED4lAaJ5V8v9wxPnSThrHeToAMn3o
         A+f1dUeDcqmf+GtMOvFFzKOTrvo85hbK/68jVAA5YczrQx5SFfHkd4opf54tlVbvN8tG
         UaIyf0UhBHCd/ORydwNC1Mpl3ZHThRwA2wH8aaPmPmTLxdoMiRSEYQ7dmHA5Cne0W3dM
         mbcn2w6Hc3IUpyZUkB8Ys5UO1TEYxMK8GgAoZp4/umTrZEjbXI5EgqKbz2+nohKsZu/N
         PXZA==
X-Forwarded-Encrypted: i=1; AKwUvBwlL0WmgeUNvPFvRR3EFtjOzJVv8KcxFhtQ3JEtkK3hN4KAv4O526iFL5gM7bKAVJsYygsYQOeMLEGFoC7F@vger.kernel.org
X-Gm-Message-State: AFq9FYI759VyaR8FV4lkFZSmFYbHGiNRnvDn6QIcWADRw/PEwG5N7u5Y
	aVANz+zBr1fuevpf/X9dklj+r62e/KHqLMxV0un92yILWLY13VKiZ4HYvp4TQFjBqEvP8Xl6sz4
	UeYiuAzRLKsOLu+fHijoAgpFQMXf/EKFni0XnrQAqwD+lUif/+3ifcLkyUXqydG5VMMwr
X-Gm-Gg: AYBFou0QPOqDZiTX/V3WUTbdWACIeSav1Cu2xdIBRNf6R5qQzgjZZugbGwP9SbIlFGm
	BQdiyBGKYJm5jOZ4pLGVzf54YqkmktKs+T+sQ4FTjTn/NIGcNBRH+j6HL2rpQhbFddzaIXTmFkq
	P1evbh1JIxc7sNWpI9MOWkIj4yXx+2MjSv66zpQPlDcbfX31zM2q7R+pfN3j2jIJXCrHOrOCiWz
	D/HU0WoopLb1Sm1SDpriUl91ElLiNaJHQMMsoLemvkvCl3J3PIo9i2uQlhGswwumQekeJc1zlkc
	CUJDeuJ6QrMfgPNAT6/RuCs87NrZ7QBTEXweuI7huQYmW+8CRdAnhPj7Tbiy2A+c3SRq441lDPK
	1EDuEB5idBet+
X-Received: by 2002:a05:620a:6011:b0:93f:3646:7a5e with SMTP id af79cd13be357-93f6f9e0c43mr534099485a.64.1792775612080;
        Fri, 23 Oct 2026 10:13:32 -0700 (PDT)
X-Received: by 2002:a05:620a:6011:b0:93f:3646:7a5e with SMTP id af79cd13be357-93f6f9e0c43mr534095485a.64.1792775611626;
        Fri, 23 Oct 2026 10:13:31 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4104b5sm1043841f8f.36.2026.10.23.10.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:13:30 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/7] ASoC: qcom: audioreach: fix module cfg blob size handling
Date: Fri, 23 Oct 2026 18:13:10 +0100
Message-ID: <20261023171316.819857-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX8brQPTf4a8w3
 PgG1bLQMPLgncsngVecdv9BA2BpHOO5A3QKPY3JncZjs8UPLeocYDe/22B8jbgtA33KZV5wc7tu
 3VbP+Q4SUSvUflvbCHa0f55ikKHWJ+rXhoovX1T7+LVmEFsFt1Ji1H7u4oJtqetIDu4A5kdprKb
 xkayxQSCh3pkzfEjmOtSkQLPRtG87hz2B9uJCrdU62Gb/PcaFTAqhxIvlEbi0tP9V3jjmcQO4Ke
 fRNhFX7TOo86RRO+xHvQgM2PHqbNQDV2vDpmo6V8I/hHpE3sNYF5uePda5/pRaTaUtYcXYeX52c
 yXeKzexgmv7bsR0O87UfKjsgbOscUCDMxvRIU0WX5kbMmR8sQkgxUUASuQTHrJMCX+I3xAc7C4n
 A37+WFJg/id7Xn0ufMeuH2erElLxd1ZyHwUKlRanMd7Wbjzjip6Doxq3UEdlcr3C3TJLxqSBhvR
 9JlIzH3b6FeaJZc/UIQ==
X-Proofpoint-ORIG-GUID: QdarsXilAhwJkSomPwAcju0VNJC7YEoz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXwZoSdhRT3n0S
 COCyPUVvVH+HC6lsGwqT2WV8CNhm4m6dTfdUPU+D3HP7LrsOTYxDiGcOvD8sITdXrKY5sQdfTzG
 woPKwzuy4koeNVtkB/axaznpAAA3HI4=
X-Proofpoint-GUID: QdarsXilAhwJkSomPwAcju0VNJC7YEoz
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb95bd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Fq9-307z7DJWB1LruX0A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

audioreach_get_module_priv_data() passes mod_array->size, a byte count,
as the element count of the __le32 data[] flex array. The allocation and
the copy are four times too large, and the memcpy() can read past the end
of the topology firmware buffer. The size is also never checked against
the private data it must lie within, and a zero size makes the loop spin
forever.

Convert the size to a word count, bound the blob by the remaining private
data and reject a zero size. Also check the returned pointer before
storing it in mod->data, as an error pointer there is dereferenced when
the graph is opened.

Fixes: c7ed4c2debfd ("ASoC: qcom: audioreach: add support for static calibration")
Cc: stable@vger.kernel.org
Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index faafbc5c0ad0..612d8f03e6e9 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -312,22 +312,37 @@ audioreach_get_module_priv_data(const struct snd_soc_tplg_private *private)
 
 	for (sz = 0; sz < le32_to_cpu(private->size); ) {
 		const struct snd_soc_tplg_vendor_array *mod_array;
+		u32 array_size;
 
 		mod_array = (struct snd_soc_tplg_vendor_array *)((u8 *)private->array + sz);
+		array_size = le32_to_cpu(mod_array->size);
+
 		if (le32_to_cpu(mod_array->type) == SND_SOC_AR_TPLG_MODULE_CFG_TYPE) {
 			struct audioreach_module_priv_data *pdata;
+			u32 nwords;
+
+			/* size is the byte count of the __le32 data[] */
+			nwords = array_size / sizeof(__le32);
+
+			/* the blob must lie within the private data */
+			if (sizeof(*pdata) + (u64)array_size >
+			    le32_to_cpu(private->size) - sz)
+				return ERR_PTR(-EINVAL);
 
-			pdata = kzalloc_flex(*pdata, data,
-					     le32_to_cpu(mod_array->size));
+			pdata = kzalloc_flex(*pdata, data, nwords);
 			if (!pdata)
 				return ERR_PTR(-ENOMEM);
 
-			memcpy(pdata, ((u8 *)private->data + sz), struct_size(pdata, data,
-						le32_to_cpu(mod_array->size)));
+			memcpy(pdata, ((u8 *)private->data + sz),
+			       struct_size(pdata, data, nwords));
 			return pdata;
 		}
 
-		sz = sz + le32_to_cpu(mod_array->size);
+		/* a zero size would never advance the walk */
+		if (!array_size)
+			return ERR_PTR(-EINVAL);
+
+		sz = sz + array_size;
 	}
 
 	return NULL;
@@ -611,6 +626,12 @@ static int audioreach_widget_load_module_common(struct snd_soc_component *compon
 		return mod ? PTR_ERR(mod) : -ENODEV;
 
 	mod->data = audioreach_get_module_priv_data(&tplg_w->priv);
+	if (IS_ERR(mod->data)) {
+		int rc = PTR_ERR(mod->data);
+
+		mod->data = NULL;
+		return rc;
+	}
 
 	dobj = &w->dobj;
 	dobj->private = mod;
-- 
2.47.3

