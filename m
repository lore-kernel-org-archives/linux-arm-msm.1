Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112D33B05AA
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 08:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151352; cv=none; b=t0rs4PVVZJJCySBtIXWo3+Bzn1UTHlju0pldEcN6NYfTIQTw9t1rfvqWoKU6davwAx1sB0KiGSlc4wCkr0a3+msFK8Xhi5zjqjTloZvAdkTfTJkAhYGDgDYIjq866v3uUa9iBuqMmd3K5bBOz5Xb2ZJEXH1tYBnw/2SeYSuPiwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151352; c=relaxed/simple;
	bh=Arm8zT+/JUhQkGb7yad6BvTCVvWlZBkot9k6kvbpgZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jAxxsKRkEOCEZdIcCmSA/MndDGn8UQcMdDRpcO34I4R/NZPWKJfKgVkE2yIDDtf2I5JOKZy3lijhZpdX8uLT0qqR+E3krmivETomkxVM9/L6KbPxJbEY1zvdUY8ktJNXluIiogsklSNyIkeGJBUEWhGn2UX0r3Tb/rb9GakFOvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GCx6575p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fOtjS6Ag; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GCx6575p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fOtjS6Ag"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N79ZPJ2819193
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 08:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EgqVn5JCTg0Wh+1+T3L2Kw7No/Apzuy2f2xoTJEufq0=; b=GCx6575puVozFU4f
	I5EKrRfK8kuUJkac1Vm+uvx2r0babcdryEhpN/h583+8jtloZDVr5te0hA732sBb
	UTsTnPEJtRYTnQmeOXJ8NQpRTifYxznjKrQCDRPZRZFcPyIb2xxwj2vK6fuM7waM
	Jq0SL1xSS9PbACfMVS3C2v34oIN3QNjps/GbMIa5j9+Kz3VA3IYPN5UZaqWEeFMo
	Yoi7LXXWUoO1TLgEnk+FKwGskzbJjVEMTqIFibsw+Y188LtsQltZALvthNo15r0Y
	/E6Hq4ZBohHi/xRGfHbqp0DCsCUa+kFZOKdREKa6SbujOQmenMQ6wb0NoYi1ZqTA
	VWNpAQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n0x1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 08:15:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9393ac4961fso96068585a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 01:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790151349; x=1790756149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EgqVn5JCTg0Wh+1+T3L2Kw7No/Apzuy2f2xoTJEufq0=;
        b=fOtjS6AgXEougG2a279yT9PqetxT1JkHH6iELjC0MDPLmoC+b09InBaIeKVIwnCCpR
         r/m+MgaHoeSHR5TImSWtCNAXFcSwuFdB8N0JxXzc2bXfQt6m19ugdSgwX1VwaOAXpDkE
         KvTGbR6552VsvqovQYuNUslIE3i+fY9ScjzuxWIoHrB1hOLfI4jY1W04NNF6Urr3gscp
         n0JFHrViDgtnsrKP1Opd6lp3qvy5xcEPXzKmhpvDaU2xcHzrV1nrDcMnhaPoyhbIIT7f
         r0IRYZnr4+5FeNrJcWD1+QB7AKfCBAa1Mk65ltz2DgcXMBN5OEzc/wXxz6UrN3ALGY8Z
         TykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790151349; x=1790756149;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EgqVn5JCTg0Wh+1+T3L2Kw7No/Apzuy2f2xoTJEufq0=;
        b=Yv9RVhV8sJVUIfoEFBJ2TDV7adJjwi6NqW18/Qk7TSzRhEYU8F3/iPPq8+JUs3DLYb
         E0JCWF4uW29NWCPN9U1K+vDN9yVi5mkiOM+s4c/5mFM0W7fMJMPwDy6EuQ5EcaDbTQua
         fPHUSkyCDqjsMpVarrNG0FoapUGdxD8OhlVJPbF5Vr9W/I/nTFfgWnem0q8+E8Zxxx5E
         jPZZk387JhzzV4YXxNBSyysU36G934vskaIB7gOOARLddisBVVX0e8sawM++QY03TzQm
         wqS6/TNNdjsYbDq7i4+rCPgqOu8xgsGKnsTqH8otmVmfofzDaDjFCd5TByhA99Ame37E
         H9NA==
X-Forwarded-Encrypted: i=1; AKwUvByCDe5ndqs12S8PVWhoMGpj5pYp0Kyvap/3ngMSgdt5k0kCS+yN4f78R63baelWQqlJUO4MeIlaeZ8al/UJ@vger.kernel.org
X-Gm-Message-State: AFuF++mwC4E+8qzSm/R36WnH6CKIOlOuRmt4dT50oZ+WjwI20Ju2HBZc
	v8zimoPkJDdFgpp2qNtAdvUSNBcC5Zo425lJCoFmfgEBDLV3EbhouVR4d39QUKR7AHJtgkq5VDb
	wxZxzzBs7JfDmAgk25Mo8xhzdyFlvkhUZIA2gr8pEGzkZfyOlKmSDpcjcwQsQ4Si0Skfh
X-Gm-Gg: AYBFou2vrhKQ/jnENMbjkiJh2NIcBM7HfJUBNiFwfLD6D10WXkKVsbrUhGoXmfNpRos
	ZuszWV77DajDdComqlCFTOH+jxEUIBjSbJJd/KwZMNuco380QcLcKCGYHmYg08TuLis/T2aWdU+
	jEkG12XTr09UyI9HSXUFOop6B8Tc+6VNcz0teRUMZ4LE7PzwA8EfluUatTK8PorUBRHog4+fD2j
	RedE6O6vdb3SrIEtfwrguWiWIb4bTj3TgnezBG+K44FpUO8NqkqF0Yzg5W6ob14ku8ZRME+Xx2g
	QNCz6aUu5b4159wIFfENYYE7dI+diF/6NWHingIX6oYIa+k1dPQH8nqnmAyEcaQlzjdaLUpML3C
	jd4LTPRtaW9uQndkU3fnsux8U73KkvZOVeCvYq/6696+6neU=
X-Received: by 2002:a05:620a:438c:b0:939:2d77:d6a8 with SMTP id af79cd13be357-93c251af1b4mr282501885a.34.1790151349407;
        Wed, 23 Sep 2026 01:15:49 -0700 (PDT)
X-Received: by 2002:a05:620a:438c:b0:939:2d77:d6a8 with SMTP id af79cd13be357-93c251af1b4mr282499685a.34.1790151348996;
        Wed, 23 Sep 2026 01:15:48 -0700 (PDT)
Received: from [172.20.10.5] (82-132-216-202.dab.02.net. [82.132.216.202])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fe0c3731fsm42528615e9.2.2026.09.23.01.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 01:15:48 -0700 (PDT)
Message-ID: <8b62c6b1-3055-4787-87f3-1ea990f8b546@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 09:15:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] ASoC: SDCA: allow building without ACPI
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260918131914.681588-2-srinivas.kandagatla@oss.qualcomm.com>
 <arKDa69Aggoo32CE@sirena.co.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <arKDa69Aggoo32CE@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzMiBTYWx0ZWRfX3PqDSbH8XGNS
 FAFzylGmO7QfdHrje/oO46RX+BLhwVatSAiOx0hpgHdvA2BTQ0OCe5BNdRBfBSdXWJzXLrw0PmY
 zs1qNQ84BuApyRCNxg+01i63M11X3H4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzMiBTYWx0ZWRfX5rPZoe8q3Uv+
 DizD+adbvNKPf/D6FQHse/RgFOZ+mM99s7aiczsQNKe6JjJuw4CFNUdjtU8j3Rjmdx2fPOIkIxh
 LVX0/n2kElAliaP/V8YdCnC9BoVCghiTP+eTiRxz48NcFdx4ZTQ5dHJ58AB+ZyuRVUPZZ8+TElW
 BZ/dVyzk6c9AWJ/Mf8kO8Mk3YE3SWG6qiwHyrHp5irFzD58cjrEKJ6Eg/tsdpwaTy6av5MQ9viw
 vA6EJftheygt0ugjn/z5CRBQgF24fatsL4ej8jyoKdLjSOdFsNDM5LRT2xmALCjhtDjYRLqTfh6
 S0pvAxpd1NAtoXyyP7PeRGaxJgKnQn0fp6qcdpQsjREArWczKfhLN6f9OuXAwJvKZliwK0eyRHU
 Aw9oIPmjm1PuMTCNwMF41cgCkghbJxkPIYHWOdf3Cd1RcfzPhWrgGT3+odiQFGqYOtCfiUkUStl
 /3zdsZkl/eNBGM2H+Zg==
X-Proofpoint-ORIG-GUID: _kXvLmLJmreb_a2CZh-SVg-QIl3m4A9Q
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab38ab6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=GdRps4uEH5l7/IE9oLSJdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=vW_vOncweQm3iN5ZsRUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: _kXvLmLJmreb_a2CZh-SVg-QIl3m4A9Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230032

On 9/22/26 2:32 PM, Mark Brown wrote:
> On Fri, Sep 18, 2026 at 02:19:06PM +0100, Srinivas Kandagatla wrote:
>> The SDCA class driver is useful on non-ACPI platforms where the
>> topology is supplied statically via sdca_class_hw_ops.get_function_data.
> 
>>  config SND_SOC_SDCA
>>  	tristate "SDCA core support"
>> -	depends on ACPI
>>  	select AUXILIARY_BUS
>>  	help
>>  	  This option enables support for the MIPI SoundWire Device
>> -	  Class for Audio (SDCA).
>> +	  Class for Audio (SDCA).  The ACPI/DisCo topology parser is
>> +	  only built when CONFIG_ACPI is enabled; on non-ACPI platforms
>> +	  (e.g. ARM/DT) codec drivers supply the SDCA function data
>> +	  via sdca_class_hw_ops.populate_function.
> 
>   $ git grep sdca_class_hw_ops
I will remove this sentence in next version.

--srini
>   $

