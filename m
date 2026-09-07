Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAA8446BF5
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 08:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770320; cv=none; b=diSFi8POp06Ijfo24UGIusaKq7h2bpevuTkSYocSCdpdqouL68WjKUPYHjqHEXU1jtT8hBqcol/9c1w8XFIdbl/Tydp7+pWqo0X3Cu1/ptjc3GW+8bjhvOCXU8kYEu68Iicf1V9zNQS+QN13tvIIOCXCzxu82LbhRLS2S/A2e+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770320; c=relaxed/simple;
	bh=DgNygwjQW1S4gERxv8XXOx2YJrza1CSfHMZkNg6qCgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DXzsL65TOwptqqGgG0+W8OxrgLp9Dp3//c3Qx1oTaPR26GqcxAwu15wGxpFVjs6y43uRFohOEV5kZSeWdKxKvrKlD+W7d4wyMgH9E2nOxHsQS7gjWTcmTC5VOui9qxWHIaU3rOi8d/2SmVvGBwfrl0YMJz/axgsQHair3VfImJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O1BcE7H0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TW+e1maM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O1BcE7H0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TW+e1maM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6878Znsj2879067
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 08:38:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AiIpEIEQZ4E
	IiKlUje19hDPydG7qbYBZVrWugQnhc24=; b=O1BcE7H07hA/E8X4Ke6ZC51W6EL
	JXB9T1CcoEbIS2uQp/76XoB4zlRJJUrNEfCluZnQREdn3Mp/eQZK1nenAFsGFide
	s+gN1NR9QvSojOak4yBNowyeO5ueTqOokjVTmMFyILqu9ZpGegRLG7/heMc+eY7t
	9Soqr8bXRFM0t0wG/Xpjuvxv3I46TbIpxHlgyObieJJpAgvShK64bcDf4O32TSSw
	rxLTqTt5EymSsxmDmOVyqETFFyC5vqvoYmxNf8vadf9hUNGUyzSL2GgUgGd2EgFU
	4TOyYy1/Ygo/lf3UzCEk0dEe2BCkU2PCiGK0bDcTnD5kun0slgVYNzZakTg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsw200dv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 08:38:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5e38fbc5so561654985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 01:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770316; x=1789375116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AiIpEIEQZ4EIiKlUje19hDPydG7qbYBZVrWugQnhc24=;
        b=TW+e1maMacdVNvtM8priGH9abkMQzXcFz2MdO+yTNgg/5xnmYzuHmr8u43kJ835RQe
         mGIlHuf6udtk9JnkZGh8jAPhO1yKc0gGYeLddmddRfmah8fQJTEzG/xGHGumota2E6FB
         byqIW8BNf1DjaNvtMwsgHNgao7FYGpcauTILgCNbGSFHA2xpplDCu4VaowHSU7xXPoKc
         tuBADkspISO1jQIG8muNSLz7oPmgWnii1+Tki4uDrZMXsc6obcTqSGMGaejZcVCFTDeO
         GDday1Te9K8h5eGTEydhNTK6ResOB1fXFUDvd6VvYX4M+SM8AivFQVMEhMguyevo7Ly4
         l+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770316; x=1789375116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AiIpEIEQZ4EIiKlUje19hDPydG7qbYBZVrWugQnhc24=;
        b=GEYWjhe3yhXFy4B20YMzTlX1skexJwkeuDnKUzbAlsQ9+/MhC+/CY6lG+c5aRzEKl0
         //FSAE5uDdTXfI2TouCYz2ur6A7nI5H5QugWl+dVV3IkId/8BoxcDF1joXbQG3zObq7+
         D0keqko7pgydfI+WlOcwIRwrvqlY6DrjwSGdBVFAjVUpvaPd5JDywGh7GCSmsmSOGtfV
         eE5J0JJkb0guaQa7tHecMNMJ8ONeHW3H1upvt3S5LK53MdurmO08/FtWkNZEoYeE+VCQ
         4ujXOAPGawLG++OkxEY0e9cj4NlJjMeY0vvlTe2JVwJIdW9cH8DDYaddwJ+o0lfkhYzg
         vQ8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxdF0D5UrUzOf1tO3wmOpIgd+HyyPhqpWQJD2/WyFZfBBd976MV30R22VaOjYpE20HQHkRAdXK1FXNfJtcF@vger.kernel.org
X-Gm-Message-State: AFuF++mTSAZuJYd69KHxoR/3R+6re9OYsYCz2fw0DkOo2bwD6tnqf9M4
	DfmY48ZryWUC97xsRnh57lqOhLDx5VWWWJfPeE+6iPs663xvxViYp97xv50343k8mq4ZXWQYET/
	YrUC3hCHpx+2AAUbjYZNRg71hUQZARLDMtYQvbyujM/12SRunnUpNUlmvR5+VNm/vhdzf
X-Gm-Gg: AYBFou35IghWSWkAop2FYCUKCBVaTaN9P9mBWHrmS5FtSH0utOH7UuQc0lqkLujIfTJ
	AbvKuBVM7uhdp2ju0Zbj94DZK65FthUSHIta5DQ0Ac04MAlojFYzzIFXz18gsfOU5mubc/PVfW5
	gsz3ygk5Qmpw2234DLvz4f0yiDT29piVyybK1igJ6/5pWCM2fnk7ejv13TTES+8QhwgmKBMNb31
	x487CSWP6PmiYCmivk/nuNS1NpOoqGXsU5g7YvFjSizqVQG3wTos2GBAEbTmGvJRg1/X5+ZKll0
	owcqs3cFCcmFmlYSrVEZ2fZbLGVxuiCKIdzxiS1zdgN8ZglI9TeCN5PGUnXw1FHuubvX29ibkMo
	sSVYNS08OYrQxNw==
X-Received: by 2002:a05:620a:5642:b0:939:34c6:a333 with SMTP id af79cd13be357-939804a4609mr1838515385a.40.1788770315559;
        Mon, 07 Sep 2026 01:38:35 -0700 (PDT)
X-Received: by 2002:a05:620a:5642:b0:939:34c6:a333 with SMTP id af79cd13be357-939804a4609mr1838512185a.40.1788770315103;
        Mon, 07 Sep 2026 01:38:35 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm30852179f8f.25.2026.09.07.01.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:38:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 06/11] ASoC: SDCA: class_function: xlate sound-dai cell by entity index
Date: Mon,  7 Sep 2026 09:37:20 +0100
Message-ID: <20260907083727.733705-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ln0701W1pKwYHKvu09fhPynMhvpALMET
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MiBTYWx0ZWRfX0d+JazMubH99
 IF3aG4QbHcA6eQntkudh2rNp5nfXcqilb5iE0ylGvYN8G5HLmdSmEMKQLm4bx8t/cOHIAE4Sf/a
 ZrWnoTImpew7FWgPj5uaduFCbkh9Wsc=
X-Authority-Analysis: v=2.4 cv=eKwjSnp1 c=1 sm=1 tr=0 ts=6a9e780c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=D7LRd5SpCY7MsyqoJ6wA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MiBTYWx0ZWRfXy9ryqj3GG/jQ
 q+zvSyuVe9Q6/S74k7hP5DDCKuzDlTqxynPnnNn/6agzSJrEcecOwQA4CG1lnURO0h0Dh/1TNiI
 UPm4ifhAru34vOI6rCEiXTKYe/FdfcruFcj7Rzm2yxBar5WP7w42Y9quFsock0swdUazWhgT9GE
 oy+P8em9XkAVKE9AYHvtiVncMK1MULimesMQwx3k31PMGwYVOaJpF+6E2KNsbUscixiZM05oAnS
 Wq/hXgyrgXP2bPVxBHDJcHWbychvdWOKQVoyGuIQYDUVcHoAMu/WrpbxN/2RA7khRuW6wFeDr1n
 AZo8v+ua05DXzpvZG5LzXL0SGYeI7ZAbB9bz8qWCADW8hqKPbDvnUif7VOvuOcbE5QndPq73TUG
 prHMBc1JOKikmmX9msa+FvjKc7eEfudIxKoMzv7j+gk3Nx1kYbR9zXhyPFOVHvgItCtUvuwJY6v
 uMWB+CCjzyihksG8d+w==
X-Proofpoint-GUID: ln0701W1pKwYHKvu09fhPynMhvpALMET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070092

sdca_asoc_populate_dais() sets each DAI id from the SDCA Function's
entity array index.  ASoC's default of_xlate_dai_name treats the
phandle cell as a positional index into the DAI list, so on a Function
with non-DAI entries between dataport entities a sound-dai phandle
resolves to the wrong DAI.

Register a custom of_xlate_dai_name that walks the entity array and
returns the dataport entity whose array index matches the cell value.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_class_function.c | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 8bca88865a4d..ab043e23878e 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -216,9 +216,43 @@ static int class_function_set_jack(struct snd_soc_component *component,
 	return sdca_jack_set_jack(core->irq_info, jack);
 }
 
+/*
+ * DT phandle cell is the SDCA entity index (matches dais[].id), not the
+ * positional DAI index the default xlate assumes.
+ */
+static int class_function_of_xlate_dai_name(struct snd_soc_component *component,
+					    const struct of_phandle_args *args,
+					    const char **dai_name)
+{
+	struct class_function_drv *drv = snd_soc_component_get_drvdata(component);
+	struct sdca_function_data *function = drv->function;
+	struct sdca_entity *entity;
+	u32 target;
+
+	if (args->args_count != 1)
+		return -EINVAL;
+
+	target = args->args[0];
+	if (target >= function->num_entities)
+		goto err;
+
+	entity = &function->entities[target];
+	if ((entity->type != SDCA_ENTITY_TYPE_IT &&
+	     entity->type != SDCA_ENTITY_TYPE_OT) || !entity->iot.is_dataport)
+		goto err;
+
+	*dai_name = entity->label;
+	return 0;
+err:
+	dev_err(component->dev, "xlate: no dataport entity at index %u (num_entities=%d)\n",
+		target, function->num_entities);
+	return -EINVAL;
+}
+
 static const struct snd_soc_component_driver class_function_component_drv = {
 	.fixup_controls		= class_function_component_fixup_controls,
 	.remove			= class_function_component_remove,
+	.of_xlate_dai_name	= class_function_of_xlate_dai_name,
 	.endianness		= 1,
 };
 
-- 
2.53.0

