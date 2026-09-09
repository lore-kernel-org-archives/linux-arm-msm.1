Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC6446A61C
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 12:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957918; cv=none; b=nxmU9kg9OcX/wqP/gvYEIB9/kgv6OhO86w3/60kehDQcyLQ1iF+jyJiynYCiXKogG/ra2whhSpkKqsNoHlQmkPGigCqj30pPOqtC1ctUry3WVA7AX4dOp+MZFhQN1TyxUeX2SH75b1e1oyPq3QEEAGPICAugPmFl35xzkJWf5Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957918; c=relaxed/simple;
	bh=npdUYq9yMIsLpChnrVFm65H8LEUeDfCG65JUETLKARk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CkZ8n5CQt1f3EyC7izgaSB/7uadMLg8TON3nkDGjk7fcVM0AzdHh840gSuCNFy/XBum9vO/h1uCcJtyq4OxPuUQ6RpsDh5aP1bImoB0P+1fukb7hWfJvtgk/6ArTH2FQRFXPWR4yKEHLv9plGuCpIwoW9CCmHy61/GoHNZsN7Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I2T3YKRQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hv3oAhz4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I2T3YKRQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hv3oAhz4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUOE9600638
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 12:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+LSBWZs6PrdGX4mxuF7FdvAqDUtCMH6i87wA9bo8R6c=; b=I2T3YKRQGUnTtlwm
	hUuW8rktwf0XSD4EZJnWJUJ7mjgwltsq8a+UkhgBCsNhXmzOuIpADyLDiI6vbQwS
	txwFaSMn+ZOVWWtecWe+ebmmGhB8OerNlBYNz4JAVdsyNt/kDX/Cw7CSL+D2zoGF
	pP+uxS2B0p3Gc+pB6kzNd7Mmwn8yT7a+EeNZGLtQrWPhuPo7X9a1UqHjOploYAb4
	bWG2Qd+mMScHqgoqezH7I7S9MShTlvBEXpPZYCYxmLBtatJ2xxS/kz2Aitnef8yj
	sq+gPHcW5Js0rbh51WIn7M5+wbgLTtS/dYdIKq6r2JacWireJ+IMXx48G2iIchQs
	TDOMnQ==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr1yfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 12:45:15 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-45a07949855so8384858fac.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 05:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788957915; x=1789562715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LSBWZs6PrdGX4mxuF7FdvAqDUtCMH6i87wA9bo8R6c=;
        b=Hv3oAhz4ie9QQiog+FSuVIBmZyldp4eLyXWgod1Ce8atdMCEAp2N6qRM+rwEvOt51v
         BExHrVYJ6FcyFy53JSyMlPd87G7I0mOLXP55EPXGyI28G35RuAo8ONBoT+k77KoLHi41
         hNbNrETaPD7HuEXzY/X672c8bG42RfvU3ND7vSTcUcFs26s7I70LoMJrgLzwpdEEttxm
         dYrCyUstEKTqTCxsq5T5C9eS66vF3L0SOFNFozmLwO1JKPncVm1sIwooIlx7Pa9Uytbb
         zIDbUbbqxW6jKM2n/60tCFXvXEzKMDVsfEUX5oZSXVkgrZljh8OgWkSV0veTgOCXEgDe
         iiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957915; x=1789562715;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+LSBWZs6PrdGX4mxuF7FdvAqDUtCMH6i87wA9bo8R6c=;
        b=n4Nv4WrfgnKMe99Q7D10uREl6073V5MhKFKnGUp3h9OqRAKRcYW/adNbzbWa5h8uzo
         ashxx6c9fqAPJD4p2mqKZBDWBHc3PEs+ruQb9Kr/UMjE5x/6YFvj1rm1il10o+vJJUkE
         e1UgyAPEDY5J75oL1HEVMOuGaLMop6IZ090nq3rfu7H3yewG/dPtWUJYA/5NiwowyNIR
         egoYe6i5g2TisiPsi7WvfruJr9VGRB2rNS77fqX9ILPdghN5aWMQRLZDZtABFuXaXOoE
         LhSibb/fu1j5FYdPlZBQFpI3SB0fo3jlcY+TpCBpq4bvLPfsk6+/YO+3MGlMhqMEuss7
         kn3g==
X-Forwarded-Encrypted: i=1; AKwUvBzGufGr3QFzli9Oum6EmrlKih3ld/+gzVzY1K5lw6gIDA3G25RsDVAwfiu9MB0NLcMznMN6pCx9ZZi0fN5r@vger.kernel.org
X-Gm-Message-State: AFuF++nVuus3aofI6CMP3vQ8aTZ2aM1WnOKOPyWoPRJcRW/wcQPO304o
	BAZ8qIdilqg8TfP5khK8xt4+Kmrx1GLKuBTAt4/Uty9869WyOZLhHnCdvb5e3zKyf49rwivP48O
	pNhzNWHoRBvJHF3tmZV9qWa3l4ykOvmtOjkDoec4cFQZYoWjS+QNLaY5NImbcbv/ef7sM
X-Gm-Gg: AYBFou1QNm1Y9iX5CTouHsiT3WtST4BO7olxdjsi9h5qtJFB4gPU/VrSSMKQlUebatK
	QnlEtdQ63e7th+qrqaQ2M35oTyN6X+6KYA6zel9h/42ampKS+TRP2wpWn5R9j3Q1JFX0ChLY+g1
	n6DEshjiJ8Pfh0gi8PyCxfkLaFzTN8FJMMMP712y6m+3X3XeeSiB1SmH9nqgom6ya0hhVhd9Hj7
	2mu9MrfnZEG4f+EzHYYO8cAkKMmj9SuPSpubRfGLZMdy+8kyvZ8xNeE0nvQxs3dA0ORr11/Tcyi
	74mdTtGOR9WV1/m2aSAR8/9Xbq/iuPYQZTLfX6DjtMcBZiTSRo8ZPacZSW8AmrutJL2CfGQSeJN
	R9ZXLvuXSNxocfgJJq64ckoDky7z/1Cpx8jrZqyY=
X-Received: by 2002:a05:6870:334a:b0:475:a1ec:9617 with SMTP id 586e51a60fabf-475a1ec9cdamr20255121fac.25.1788957914922;
        Wed, 09 Sep 2026 05:45:14 -0700 (PDT)
X-Received: by 2002:a05:6870:334a:b0:475:a1ec:9617 with SMTP id 586e51a60fabf-475a1ec9cdamr20255098fac.25.1788957914497;
        Wed, 09 Sep 2026 05:45:14 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47a7585b25esm5186332fac.11.2026.09.09.05.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:45:14 -0700 (PDT)
Message-ID: <56dd264e-d17f-4916-b8bb-bb41af063823@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 18:15:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] ASoC: codec: pcm1681: Enable system clock before
 regmap access
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
 <20260907-nord-asoc-driver-support-v1-3-997d3b20cf43@oss.qualcomm.com>
 <de0a0b99-9213-442c-ac5b-944a0f6bd432@sirena.org.uk>
 <adcac1a5-6d34-4978-8fce-b9b5a0361b76@oss.qualcomm.com>
 <23de3b70-6284-4c2c-938a-b92d76cdc088@sirena.org.uk>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <23de3b70-6284-4c2c-938a-b92d76cdc088@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa154db cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=iCeh-t31pbVi7WQZdrAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0MiBTYWx0ZWRfX3ZugsVUc1S/i
 /7dBCNASEdCSTNPMEtH+BcgfFtJmWsfdvMKbGuGhw59MkhM0g8TYtnFvIr2AtFO7Re2sYkLzKtU
 RQe9zSwCm7ZK6HG6++vu8nUAPnZNVwI37t5QBtO68DnSGzXIPq66ZFUD6KBdRw5sI/49jxfCwUG
 AY2iQ61CfLUuB0/SJWGebrGRiRNhkJMGXj5H3hrz3H9IiE4yMVO10zlftzvGWe46rugZar4C82y
 8/X2v/QXLFnqvRAQne5yYuB5hbSxICJzA8dKAbltfHR6edxU1u2flCL+jxChcFr6hcIKlLqwinM
 gy1ME0cwKib8WNQW5+bCRexTIznUXefMAaIozOwefj+yNkHlgWDom99ww5IJCgFIzV10aqJtboK
 Y6eBcHgDCVt8HSi7Dsshxaqcv1fJ5sGB61wxuU+QngaKZdwZeFKWrC36zTnq8mOxOhSf0SHGp+H
 /uIlsd7Mf9IAXqzhx7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0MiBTYWx0ZWRfX0YbvW8anJnK3
 OhozqsYR8n9jOUbqzQzQcl3WPwzYLfXEYh3x0N3ov5JdNt9oXG/81u4qU+xXhWXxI4mFH+gCAJd
 P6Ll5ae2hIh5bqMtU6IUZ62dHEAFDZE=
X-Proofpoint-ORIG-GUID: RBUXlPh7PxXYr2j_R8lDOE15jF7n4TTe
X-Proofpoint-GUID: RBUXlPh7PxXYr2j_R8lDOE15jF7n4TTe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090142



On 9/9/2026 6:09 PM, Mark Brown wrote:
> On Wed, Sep 09, 2026 at 06:06:41PM +0530, Mohammad Rafi Shaik wrote:
> 
>> Although audio functionality working fine without this delay in my testing,
>> I seem to have overlooked this requirement.
> 
> These sort of sleep after reset requirements often end up getting
> implemented naturally due to other things that are going on and then
> issues crop up later.

yes i agree. The current behavior may be working because the delay is 
being met implicitly during initialization, which is not something we 
should rely on. I'll add an explicit delay based on the datasheet 
requirement to make the initialization sequence robust and avoid future 
regressions.

Best Regards,
Rafi.

