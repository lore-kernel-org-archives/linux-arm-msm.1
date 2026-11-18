Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794997767;
	b=WgBMPAh95hBloVSB/+4X9hO6HZ3zPwVcBA4cgnW7eDpbf4+uEKaJN+14MADnKMsvESJa
	 3o1qV3FLgDFqMajRfXIDCtYsYCmJnVu2XLacoKYX9AX6cQkyMeBudA9ENU5ofAVOmS8Ha
	 wI21RxsfdkV64ca9VvqttmTJB0hrXMavksTf/Rol0OdL+CB/oRDApebbOFv+RVbhCwGDH
	 lNW5HWIwd8plfoXU3pWZqWuL0ObJlGmBR/+RqLcdVRT6s5ZM17pUOuSTru6l9kYewjNIP
	 sd0h3czDw+eJ+dghVey47/6UQTqjsLlVkLN0pIbuyiTaVyUbyHZ8OOAtZQXrXw07jMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997767;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=F7HShi/pVHNTYdg2FinqmbYKeZfV6jrr8hz1Nm2p0Qw=;
	b=BJeCRgHxEuzd0W3a5CzDMfxqXIOHff3+Zp37PbsPl0CaOCTVEqQb6N073qoaGpfrIAHy
	 a8f8s0vQMkwXWJrYtbFiwcEv3cHDJf700j2mCFnwlJ6ZxYLhtE+GhZybl6qt/SSGyFbs1
	 Zt5GVLM6Dcy4PAQ8DOvjM0DTNKiuEjZYrkQ3J8nM32IvFbsbaaJxLmtST4NPkjCzrot+V
	 UYYB8V1gIh+quXarcSL7/4IedKVaLQrPFympVJEqcRpL6mIDdVDz9wvgA+VD0kkvgLYyF
	 EvHH/udXbN/HYv5msnkSIaC5rKE0uQ7vT3FyhpL9+htz2GKBBFBgDEpjyNPo2J9ERfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D4Nn3l1f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J18DB677;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C5E606A333
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 10:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50C5E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D4Nn3l1f;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J18DB677
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9kIRc4082316
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 10:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F7HShi/pVHNTYdg2FinqmbYKeZfV6jrr8hz1Nm2p0Qw=; b=D4Nn3l1febtFyFRi
	pjY89QCokUB76gdIDWbw/Jlk2J2fk/Lkphk6iJW4JJRmCCtq8eTHfdWy464JwlwC
	s5eclJPHNEJKDxXMGplCyXEQU39bmxmXJSNVBlSa4AVZzm4/PVzI4vHFgqbBfsDK
	rLMg9Zqo9CMqcOxWOMuLeFVokEVcp0JenBm8AEy0nuQODmRZrOfYn/psrGUvZgbz
	ZL/uP+nYACkMN94hCrPb1eaPeqbMcmv5gO7VNgsTnh1WkREz76uVbpaxhSvOeKkd
	gTNyzgDL4qmmqYe9JrGgrPHK2ER5BbLtDG6K/p7H38mWQx3ROy7ajCI9nVh+WmNg
	eks9sQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9jgrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 10:29:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f002ee475cso4027005ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 02:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794997765; x=1795602565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7HShi/pVHNTYdg2FinqmbYKeZfV6jrr8hz1Nm2p0Qw=;
        b=J18DB677osKq2zpxOq6sSxfpANEcR08Tjnl0NrdRgo9kAa2dEz8aHjUrneXm78uz1d
         r0rVORWgAnPIE7/avsfqAqbihLb1ZfFwBtr3GNKBUuOqERwnyd/sWtxy9sJGNQugB7yp
         moOF4o4QC3VBL/qslMIAk4VRwhmvLVjGsKzghsxHqXgX/ATZ6X4IAaoB0LikXfZpisG+
         p4SDN/JuPNneZfy1siQFrDNbvLRtsRD+BV22zHLMNNCpW16Pty+sYnzuuqzlH0qJqkSJ
         JL263jJ38IqlaHk6gkj0eXjUDnSzs/KM/9NWhdmEcWPi7dcZLBSSYSPjIAobGGc7Emd6
         EDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794997765; x=1795602565;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F7HShi/pVHNTYdg2FinqmbYKeZfV6jrr8hz1Nm2p0Qw=;
        b=gnReJ35ZEDf5hQk5ETjY6wfyJkhrx2hxeISIb++vlbPJuK34VGMe6ND3GJ22T0XhHL
         oZjSiaildV/5REubrw0IQMC+BUI7d8b8CaR2k5YRUNg+Oj9qMoJk8+6PpSSZR5mhNKLM
         mTT/T5FBiH+bIYVmFW2Ap+x3UnnJ95IJjoUMG0AvXbCUeZVQ1WWUqgHwqfvl7eYkEwC4
         6V3hyS/LyfUNipmDxR/vEt99R1QzVZ3MERCApTsXnvIY3GZqHeTa99v9k6FtIyb+10aG
         1liG4AtASQnw2VStKc3jTPFt/v+5/o9f3RQ+VZ/oTCgKovvhKGXYZFgxrruwRB3Dz/AP
         ebYQ==
X-Forwarded-Encrypted: i=1; AL+hErHcBYKsC1vWHIDl8NFHYeiB7JhT7CJk0ycaJyTQTCA8ghQKum6nAwbBNdkYYyGs4I+AWMpNSPJeCG8lLArx@vger.kernel.org
X-Gm-Message-State: APuU4Z8JJGz5qVff6QdgFGwXhNcB2FztZZueCkqOrTseR6oP8U8FN7eh
	xxaCNKvKCfKwDKZME/f2dVPGZq8kQfIvuBzmeBLLSobJaG/UZtS1Yn6II8ZUUnpCM9tNJevEHRK
	/1sI4uSSSiClqo/mXmRDI1wz6isg2BzRPq4rhTllYpXv6xwULhPx2nf6wI/cIIE4L4QBT
X-Gm-Gg: AZFdTZfRKWzYVHiDIzJ9PKWBvZbS/apVq3COXKzK1lNr0t4/91NPIBjZIhco2M+Ax75
	npLT3WrGLgj/Dym4n4lk4B9PLwPP/6LlB12uLaf0Mqvy2hr+uMGd2b3/NIEPd8PscHB2KcJzdwf
	bSzqhPJtxK+mNlDPhOV+jcD1l8b/11Mic+7xYIuGhCjJNOo4whVXZR4boI8zw+CM4VIs9LLpSMA
	+6eORB9IqboBa8v/nefHj04PaIHdcmooAZ8ZwsH3VXgRsSBtIL98wMjE6iYZuccZAQbHk8cE+XC
	PxUQrh2Gem5H/bbEdL4pYWH1MjXa3ezdacMhdEPjSjXE1YOMMd04y0yd/2hITRBSObTB7uyexuy
	2S/s6uxnG4O/D8ujG9ZGOSaL5CFkYhHyNYkSP20ECmzC+/Lg5LXsJAAc08cSYtBniBUArS97P5f
	UhGAR8yJ249yDjiMJ1Z1F6/6+wv+QAWQ4yKn7/DLELsnluK5EB/+fjxsw4P0DGhQ==
X-Received: by 2002:a17:903:244f:b0:2ed:379:158d with SMTP id d9443c01a7336-2eff73f1eefmr24169845ad.9.1794997764918;
        Wed, 18 Nov 2026 02:29:24 -0800 (PST)
X-Received: by 2002:a17:903:244f:b0:2ed:379:158d with SMTP id d9443c01a7336-2eff73f1eefmr24169625ad.9.1794997764427;
        Wed, 18 Nov 2026 02:29:24 -0800 (PST)
Received: from [10.149.122.146] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6115452sm11186825ad.16.2026.11.18.02.29.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 02:29:23 -0800 (PST)
Message-ID: <cc64e5f0-fb82-41eb-8f26-6dfab7cd0791@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:59:18 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] remoteproc: qcom: pas: Add coredump support for
 secondary processors
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
 <20261015-oob-support-glymur-v2-3-715435f52dd7@oss.qualcomm.com>
 <20261117081011.jcuxog7ixwbfbyce@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20261117081011.jcuxog7ixwbfbyce@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Mv9IXqU-WR8NnU-OqlaLTd6OjjxfMSJ6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0MSBTYWx0ZWRfX+sYOPX7XmMbI
 hYehy8LAPjbmiclkmNNHoO5vGbLInwBn4+SeUh9pRU1J6sM38n/1bZ0YOPtBxQfiXishOnO0AZC
 5hdWZ5gajA4HG1Sh5UK1/pckFQHPm+g=
X-Proofpoint-ORIG-GUID: Mv9IXqU-WR8NnU-OqlaLTd6OjjxfMSJ6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0MSBTYWx0ZWRfXwboeU96bce3R
 jVroB5LvQ9FSMsv6DlD938WeMV/eI24Os+YWuFjgFIrSqi560VsFzJeYqojpEdTU4NkCmNTvtpt
 viHx+723Do3p21TrndUPN+tC3n+/sRmy3iuUZT9alyO5gR5RNaI2ylgogmvqpMbzEfanIto6Dcl
 +xdIxtjHRhiCmqJoGT3a5SNwjkmxb2PgUJuGNMQfSapJAxgmCVuHCiT9iImZzgSQyl1iTBUbg5L
 lIgJNen19O+n6XFJjJqNCGJNSOf6jdcCqfzjcto/tp5Odf8+eJRkx9tVYHlgewEeV7VYsqEM0bc
 oM9YqMXwAuel4P8KqCrU2UYknYbOsEVvVaSK/CFjp4SS6AdVLu+Fmsc7l3JDX5jZ8SIPs1XJ2Ns
 2LeCRUANIqJt2wxKMYLiIajY+fn/okaiw2iKrQ1y678OxnmXTVIoeGRvqVWTrXgc1pE0wHp2RLI
 T4ulg9snS0E6Fqw7Sgw==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afd7e05 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=xb-HvuPonZpJoasvX4gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180041



On 11/17/2026 1:40 PM, Mukesh Ojha wrote:
> On Thu, Oct 15, 2026 at 11:25:51AM +0530, Anvesh Jain P wrote:
>> Add coredump support for PAS remoteproc instances with a secondary
>> processor by registering fixed dump segments for both primary and
>> secondary carveouts at probe time and mapping them during collection.
>> The attached-state path is for debug dump collection and does not
>> provide operational device recovery.
>>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  drivers/remoteproc/qcom_q6v5_pas.c | 102 +++++++++++++++++++++++++++++++++----
>>  1 file changed, 91 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index 0bce2f0d5b4a..374cafd04b62 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -117,6 +117,7 @@ struct qcom_pas {
>>  	phys_addr_t region_assign_phys[MAX_ASSIGN_COUNT];
>>  
>>  	void __iomem *mem_region;
>> +	void __iomem *secondary_mem_region;
>>  
>>  	size_t mem_size;
>>  	size_t dtb_mem_size;
>> @@ -162,6 +163,28 @@ static void qcom_pas_segment_dump(struct rproc *rproc,
>>  	memcpy_fromio(dest, pas->mem_region + total_offset, size);
>>  }
>>  
>> +static bool qcom_pas_has_secondary(const struct qcom_pas *pas)
>> +{
>> +	return pas->secondary_pas_id && pas->secondary_dtb_pas_id;
>> +}
>> +
>> +static int qcom_pas_register_dump_segments(struct rproc *rproc,
>> +					   struct qcom_pas *pas)
>> +{
>> +	int ret;
>> +
>> +	ret = rproc_coredump_add_segment(rproc, pas->mem_phys, pas->mem_size);
>> +	if (ret)
>> +		return ret;
> 
> Why qcom_register_dump_segments() already does this ? why need to
> add entire region ? please modify qcom_register_dump_segments()
> according to your need.
>

Ack, I will remove the whole-carveout segment and use
qcom_register_dump_segments() for the firmware segments.

>> +
>> +	ret = rproc_coredump_add_segment(rproc, pas->secondary_mem_phys,
>> +					 pas->secondary_mem_size);
>> +	if (ret)
>> +		rproc_coredump_cleanup(rproc);
>> +
>> +	return ret;
>> +}
>> +
>>  static void qcom_pas_minidump(struct rproc *rproc)
>>  {
>>  	struct qcom_pas *pas = rproc->priv;
>> @@ -577,16 +600,38 @@ static int qcom_pas_stop(struct rproc *rproc)
>>  static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
>>  {
>>  	struct qcom_pas *pas = rproc->priv;
>> -	int offset;
>> +	phys_addr_t base;
>> +	void __iomem *region;
>> +
>> +	if (da >= pas->mem_reloc && len <= pas->mem_size &&
>> +	    da - pas->mem_reloc <= pas->mem_size - len) {
>> +		base = pas->mem_reloc;
>> +		region = pas->mem_region;
>> +	} else if (da >= pas->mem_phys && len <= pas->mem_size &&
>> +		   da - pas->mem_phys <= pas->mem_size - len) {
>> +		base = pas->mem_phys;
>> +		region = pas->mem_region;
>> +	} else if (da >= pas->secondary_mem_reloc &&
>> +		   len <= pas->secondary_mem_size &&
>> +		   da - pas->secondary_mem_reloc <= pas->secondary_mem_size - len) {
>> +		base = pas->secondary_mem_reloc;
>> +		region = pas->secondary_mem_region;
>> +	} else if (da >= pas->secondary_mem_phys &&
>> +		   len <= pas->secondary_mem_size &&
>> +		   da - pas->secondary_mem_phys <= pas->secondary_mem_size - len) {
>> +		base = pas->secondary_mem_phys;
>> +		region = pas->secondary_mem_region;
>> +	} else {
>> +		return NULL;
>> +	}
>>  
>> -	offset = da - pas->mem_reloc;
>> -	if (offset < 0 || offset + len > pas->mem_size)
>> +	if (!region)
>>  		return NULL;
>>  
>>  	if (is_iomem)
>>  		*is_iomem = true;
>>  
>> -	return (__force void *)pas->mem_region + offset;
>> +	return (__force void *)region + (da - base);
>>  }
>>  
>>  static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *fw)
>> @@ -598,10 +643,21 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
>>  	size_t table_sz;
>>  	int ret;
>>  
>> -	ret = qcom_register_dump_segments(rproc, fw);
>> -	if (ret) {
>> -		dev_err(pas->dev, "Error in registering dump segments\n");
>> -		return ret;
>> +	if (qcom_pas_has_secondary(pas)) {
>> +		if (list_empty(&rproc->dump_segments)) {
>> +			ret = qcom_pas_register_dump_segments(rproc, pas);
>> +			if (ret) {
>> +				dev_err(pas->dev,
>> +					"failed to register dump segments: %d\n", ret);
>> +				return ret;
>> +			}
>> +		}
>> +	} else {
>> +		ret = qcom_register_dump_segments(rproc, fw);
>> +		if (ret) {
>> +			dev_err(pas->dev, "Error in registering dump segments\n");
>> +			return ret;
>> +		}
>>  	}
>>  
>>  	if (!rproc->has_iommu)
>> @@ -716,13 +772,21 @@ static void qcom_pas_coredump(struct rproc *rproc)
>>  {
>>  	struct qcom_pas *pas = rproc->priv;
>>  
>> -	pas->mem_region = qcom_pas_ctx_map(pas->pas_ctx);
>> +	if (!pas->mem_region)
>> +		pas->mem_region = qcom_pas_ctx_map(pas->pas_ctx);
>>  	if (!pas->mem_region)
>>  		return;
>>  
>> +	if (qcom_pas_has_secondary(pas) && !pas->secondary_mem_region) {
>> +		pas->secondary_mem_region =
>> +			qcom_pas_ctx_map(pas->secondary_pas_ctx);
>> +		if (!pas->secondary_mem_region) {
>> +			dev_err(pas->dev, "unable to map secondary memory for coredump\n");
>> +			return;
>> +		}
>> +	}
>> +
>>  	rproc_coredump(rproc);
>> -	iounmap(pas->mem_region);
> 
> There was a region it was unmapped once done to avoid speculative fetch access.. we can't keep
> it mapped all the time..
>
>

Ack, I’ll unmap the PAS region after coredump collection.

>> -	pas->mem_region = NULL;
>>  }
>>  
>>  static const struct rproc_ops qcom_pas_ops = {
>> @@ -1133,6 +1197,12 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>  	if (desc->early_boot)
>>  		pas->rproc->state = RPROC_DETACHED;
>>  
>> +	if (qcom_pas_has_secondary(pas)) {
>> +		ret = qcom_pas_register_dump_segments(rproc, pas);
>> +		if (ret)
>> +			goto remove_ssr_sysmon;
>> +	}
> 
> For early boot, we don't even have support for the primary image
> itself for the first crash as we did not load for its first boot
> up. So, this is new and you don't have check why do we need it in
> probe whether it is early booted subsystem or loaded by linux
> Also, not sure if it is right to dump entire memory region.
>


Ack, I will remove probe-time registration and add only firmware-derived
dump segments when the firmware is available.

>> +
>>  	ret = rproc_add(rproc);
>>  	if (ret)
>>  		goto remove_ssr_sysmon;
>> @@ -1144,6 +1214,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>  	return 0;
>>  
>>  remove_ssr_sysmon:
>> +	rproc_coredump_cleanup(rproc);
>>  	qcom_remove_ssr_subdev(rproc, &pas->ssr_subdev);
>>  	qcom_remove_sysmon_subdev(pas->sysmon);
>>  deinit_remove_pdm_smd_glink:
>> @@ -1169,6 +1240,15 @@ static void qcom_pas_remove(struct platform_device *pdev)
>>  		of_platform_device_destroy(&pas->bam_dmux->dev, NULL);
>>  
>>  	rproc_del(pas->rproc);
>> +	rproc_coredump_cleanup(pas->rproc);
>> +	if (pas->secondary_mem_region) {
>> +		iounmap(pas->secondary_mem_region);
>> +		pas->secondary_mem_region = NULL;
>> +	}
>> +	if (pas->mem_region) {
>> +		iounmap(pas->mem_region);
>> +		pas->mem_region = NULL;
>> +	}
>>  
>>  	qcom_q6v5_deinit(&pas->q6v5);
>>  	qcom_pas_unassign_memory_region(pas);
>>
>> -- 
>> 2.34.1
>>
> 

-- 
Best Regards,
Anvesh

