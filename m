Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6022D4C33F1
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 16:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789576228; cv=none; b=fbBliJVcjrp3xGwEfIUjirvrdy7hwNlcfsY83qTBc66JBRk0ZA5S4F3dzD2M9qEhk/RJmlt+eWc1SQozIicvTX4pBlzMP3MT0grHZ7t5ynseP0BR6YJWlIEVV/rGHiG1IxlO2SGIb7qG4Kp/IZ2EzsrkvgtnXoWUxAoB7fEHtVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789576228; c=relaxed/simple;
	bh=+pr8JXwf3lEotRxrEPi58W6+E6MbOpFpvM9BWeVIpSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L2BvU7XjkoKPJhJ+5UzdBrwSq4FJ+LWhbGkX3k80L2q3DamBeBkEUSYb/RhFNGFlSe0j2QmOboj+arhyuMiFSkBV0GGSZaXCb7vGkZj7Aoknmmj6ydChiE3ToMWFDZS2f4H4FYXIBwfbvGhIKqLmLuAlsyvA4KAdtxsIoLkOzac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XORSXwVQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GSmpgUhw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XORSXwVQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GSmpgUhw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFeQXc3107625
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 16:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8KIwxPL/45rQhr/QJUaYxW+ZzJC928+zNT9ZvAHA5jo=; b=XORSXwVQRu2XVaOH
	jwDzmACkl1VXbgZX5jjrOfWd9Dl9OhDZjiuNcjdZd9YrOVXoauXDy7/0/n13ZAWT
	cbWVYrHnUEL8s0WzS5+7eCwnsMK7MuQtgsxHhkl/nD89EfQnTIyQ/ZqZy0TC+ZeU
	XoKkCBMKoIdD4AMcxWejVx/6YTqcJRi56/H/2SjB1czUoLuJbdXwQ3ggW+IEYdvK
	YoQoSYMpN00vq3Q72+HuLgHSsQkS6nBf3bEAcZAhPscdT++iLOrnT419b58xd0X7
	dqVYnNAgytMRFW8L7dFInG7M8ofHNK+oqCqGoVvutabF4l1CWxXk1oD0AN2WCZ3U
	4ZHWtQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquw2rw66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 16:30:24 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7a04805f8f1so672082137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789576219; x=1790181019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8KIwxPL/45rQhr/QJUaYxW+ZzJC928+zNT9ZvAHA5jo=;
        b=GSmpgUhwK4eq3k48tTDwYQ1+iRHGheZzMz1pcsNVo2+dvChBMEKxSfTZfzC+PMSFbt
         NLqeLuJ1WKfoJghAcV8Poja6Z0awJAuzTfhbjgFKn6+e3pfJ+YiCAmjGVdMVOBUT6z8T
         0oymC0jj5xpTeRRo6qJVJ7WKvYjyfNbZbH3K7AzQ+ghbj5jm/DCiT20RVaN6H+dy3SU5
         O3lU0CGPhQ974C9bfc3DiK6LSSlqtLnRcdhLXMZTC6njHBbgPBQR31uBwM/SuAt18ArZ
         yboFriTMlrcAdX0rtXpf+kbp2ZKMiadrjkUM68xr6lzQjdtuDs3lRBq6qvwVuk6KgmGc
         O5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789576219; x=1790181019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8KIwxPL/45rQhr/QJUaYxW+ZzJC928+zNT9ZvAHA5jo=;
        b=RC02jNnSatF0ObV/5AIEzdzW8k0hlxkJ3dPxAJPZ6hxeNy+MvIHtSsEteAiDTg4CAt
         SCWplRs+Eh89cI+XLBMxBShHJ3ZvNOtx8WdrV/qqGuKQzlxGIAi/QSjGytiR6hozOz2s
         mB5T5wM74d+YTT+9+7HumGsmZtvpxYQu4Um9S6aqsNepFHU0L9mHQDYjzeePljq1LT24
         YF5jwNaRa0hd8DcW6j0AN5mDXHXCInWAGiq8C8MQzTTQoEPn/La0gzwqvVxzsm1JFJbZ
         mqxCb7TEeaLFFZg77IzXhmKKzH7AMJJW+0OFS4a89FrNiXJudN6fcq28x3giE3LMXCkA
         OQ7w==
X-Forwarded-Encrypted: i=1; AKwUvBz2BfHS0khH+1DcrPYEdJSN8ZYjGDllSP+bFdFrxA65Jk542XdGpdi5bQKkr5LDU5Y6qpxjElceDa188yuQ@vger.kernel.org
X-Gm-Message-State: AFuF++m/uMR72fsFn/tj5ZZov9gL8CUezz8BxKqOZtG/k4GswFz9fHYC
	2mDdlGbH+YbfnMJUfwkXu43Zk64b6gxTOh35dxVK8rKAst7I0OPyvh2ffFB2I/G6eHHaFNUq/zM
	6tOmLctdE68LNGjylgiMLaV2QRZVgW7kuNbSkbaJfE2fMQNol0iDJ5UroVi/HO2Wco5Hc
X-Gm-Gg: AYBFou1gx8XWfInbgAZVyzZUuitekGoapJkZ4Rzs1dZl1Okl7YYWrP9UPODQaplAqnI
	fXKW/MlmKIcXG5Ioyac9janGrxQUHC6N3oQh3ZOfTZQoERt+kBR9h7QHWdpgs5maloTcKicxmjB
	+fmkgSn2ZyUUxUcmEuqx3dtkC8H/0MwX5IscqWZkqfacFpiKWEeB3sonqOk0+YpoJwtZojmyngd
	0ZMIukAG4QzR2o3YKOC32enIyCoEz/ioUoSElpsgDyI3xV59t2hoxgghzXW0Rltzg86bJ1TQJe3
	hGSaCOOsZahIyNnWeJPA5C57sqo+wYYNmlpRq8gddUia0gdD8H3n9dNatU/eW89uSCXpMkG8y3m
	YqUYDSzBZvR6cUKSDKlHkCSpMh64=
X-Received: by 2002:a05:6102:5792:b0:7a1:83fe:45e7 with SMTP id ada2fe7eead31-7a183fe6278mr3279004137.8.1789576218547;
        Wed, 16 Sep 2026 09:30:18 -0700 (PDT)
X-Received: by 2002:a05:6102:5792:b0:7a1:83fe:45e7 with SMTP id ada2fe7eead31-7a183fe6278mr3278871137.8.1789576218006;
        Wed, 16 Sep 2026 09:30:18 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fbd2356d1sm3008975e9.6.2026.09.16.09.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 09:30:17 -0700 (PDT)
Message-ID: <cddd5bd4-df99-4332-9bbd-f9dc10874cdb@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 17:30:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] dt-bindings: sound: qcom: add Tambora WCD9378 SDCA
 codec
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260915165652.914893-8-srinivas.kandagatla@oss.qualcomm.com>
 <20260916-imaginary-glossy-stallion-c769b5@quoll>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260916-imaginary-glossy-stallion-c769b5@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIyNSBTYWx0ZWRfXzdE/P3haCAbs
 p4/hdPHdj6byL/vSCDTLX/GHh2C/4uG3SJvOL2fiqkgN/egjUDhzlA/cBK087YyvmHSg7gb+bmJ
 EzS0r/x4qZQONR/GLpt77orabcypaV0=
X-Proofpoint-GUID: UoBgIP4MbIjCwuNIjxI8jdHgbE7QtJ-K
X-Authority-Analysis: v=2.4 cv=N4m8hG9B c=1 sm=1 tr=0 ts=6aaac420 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=HeNI3thZ33BDYE7jO_kA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: UoBgIP4MbIjCwuNIjxI8jdHgbE7QtJ-K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIyNSBTYWx0ZWRfX+pvjCxRMBe/p
 aQM9xQ2hkw2nCY7qN6NEo3B9oxfVoUMDlSzrBVDMxl5Eg+xYeagJJP6mn7Kp6lwp3EWnM/5oMYq
 4mlYtO+Ob1AN08KOIyITp3C3mPkrDpdyHjTpiIkTum1d9BrEPIzKfG67tlEJYNLU4VONjueYIHf
 ZiIsfgMR+O8B5L/k34P5ZUcuK8GCP7RBiyk67nBvvwjaEx9LR5Fdk3BA++w9Swd7dDQvNnYwVB4
 VvFWiAQxe7jkN2bqVa7R43024SXu5ZB48mCNzTth5Q5xscMqBD+mVs5Bb9mQujQqt5GudI5Rq2h
 BUGiBfc3W+ikcIXL2XS+oYLl3cKdPcpgEIcMWWuCC38hcVpM7wzsTcQbYoyB7x3w5gsuUR4hIW9
 xiheSR4d5/j0s6fnVCSvsk7rQwU54qOjcw3UN2S1JK9CsRM7Jqrs4/qlMsyHZoRsk1y0L17XFA6
 FU/CDOpXo3QDJvkRICA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160225

Thanks for the review,
On 9/16/26 7:53 AM, Krzysztof Kozlowski wrote:
> On Tue, Sep 15, 2026 at 05:56:49PM +0100, Srinivas Kandagatla wrote:
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>> new file mode 100644
>> index 000000000000..9a6c309018ed
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>> @@ -0,0 +1,91 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/qcom,wcd9378-sdw.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm WCD9378 (Tambora) SoundWire codec
>> +
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> +
>> +description:
>> +  Qualcomm WCD9378 (Tambora) SoundWire codec in SDCA compute mode.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: qcom,wcd9378c
>> +      - const: sdw20217011000
> 
> As pointed by Rob's bot, this won't work with current soundwire bus
> schema. If it is the same silicon, then usually it does not warrant a
> different compatible, even front compatible. For example same chips are
> used on I2C and SPI buses and the difference is coming from the bus.
> 
I can send update to the bindings but I would prefer the flag that you
suggested.

> Last time I doubted that "compute" and "mobile" modes are a real thing,
> but if you say they are actually different fuse values, then they would
> be real. That could warrant different property, e.g.
> "qcom,sdca-compliant" or "qcom,separate-tx-rx-interfaces".

qcom,sdca-compliant sounds much accurate for this.

> 
> However my points from Jorijn patchset remain - the top level wrapper
> node is a fake construct to solve power sequencing issues and this
> binding should allow fixing that one as well.

There will be no top node at all.
> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  qcom,port-mapping:
>> +    description: |
> 
> You can drop |
> 
sure

--srini
>> +      Each entry maps a slave data port to a master data port.
>> +      Entries are in order starting from slave port 1; slave port 0
>> +      is reserved and not represented.  Compute mode uses 8 entries
>> +      covering DP1..DP8.
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 8
>> +    maxItems: 8
> 
> Best regards,
> Krzysztof
> 

