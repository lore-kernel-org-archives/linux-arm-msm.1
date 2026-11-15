Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776649;
	b=f2H5R0zuvB0d5VrFwR3IkXm+c4S8MlDoN4pznPXr/opW7zsYu9b0ka0lj1Jc4RfSQxzU
	 Rdh8b3UOkoyi3cNZ7JWpOW0uzMJVaz6zu4+4h0RbQsnit567sKM4pesueaak+XZVc8WVM
	 Pnf8A5T5TF+q6qMvLfdPz/yl+GES5QmjXhNOlfshS4e9TVb5v6yRMePtWBYUxCHy5/wME
	 XFPrwmcanWASX9IQWVbOWVJExB1yZp/JZMgMTeDm60n5tbl3GCC92jHy/9BKXqiV3K5iB
	 t00DOT2cM+qVM0L9IamecaluSx7PyZlpL/b9Z7frkZiQbLScmfLFxNmFTrGtlkAoJUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776649;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xF0N7wIrKZN0ZDKjgQRiE04//Cg2OzQF29jjEwloBSQ=;
	b=EPCFFiBlJE0xw2A/p1F4Gm/VAdO4hKaDgZFaUNsImvrIcHPU1CAeNObsKMx4hmeGjuse
	 5XE/aBd9EsYReEKJEyKd2hqNnDvtYmNt2CsrpPTpMvYXc0DsQPekaJRB0dmVJHFzs39ci
	 T/Nj8sg5hvNmw1eBegQinXKNt2phdW4HublihTPUT68+9wd7zOJVnjeUPrlpLOyOxO9jA
	 52F3YXRD2wwyLtCgsvkiKnznQylpNVfGKRpG6CPqXv8k+c21IvmyJnIkBKnkhn96oCtZi
	 XDIAIn6LoiU/3MK0ewnne99EoO9F7q9C2wX9zAAgM0bq5qbYtthx/A7wBWb+7RmMqKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nZ78Q9ba;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MXARMSj/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D074606A329
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 21:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D074606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nZ78Q9ba;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MXARMSj/
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFITh3c2944172
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 21:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xF0N7wIrKZN0ZDKjgQRiE04//Cg2OzQF29jjEwloBSQ=; b=nZ78Q9basjtzbufb
	bsGuc5p9DB0g1PCj+faIJPTKWjoMfCYXmUiPHibTlP4jWRRRbiTTM3ubyUQaiKuQ
	ygGtlWFw5d9Z9zSmkTB/6WrZ7B4QM8cUdq6ECTiyasT57LQ9Rn//EliSQ9b3XqB2
	3kylkqLUMLEOca+6q5ypWJoTC/enUbrZ3qpS4OyVxqvD3xCh3WUqBsZicI6KuZRM
	0ELDEvMNwzP/VjZbChoQcwZI57Ov3ctC8DC6r7a+yiV5AAf+9qYXUjVirIrRFJrq
	J73jJRDWNUJ1+5JtpJnL3hUsQQ0noyljMJ7R89a7wannUyX2m/C1mQJ/A3qUJtQJ
	eu+zxg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhkwbqkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 21:04:08 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99e0b2d9ba4so966709241.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 13:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794776647; x=1795381447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xF0N7wIrKZN0ZDKjgQRiE04//Cg2OzQF29jjEwloBSQ=;
        b=MXARMSj/UQW1iD14BO3VGCZEZbg2RKbFpYl5uOVBayL92sueDW2Gbjj04+HOnpWK+V
         kj0p6rhUHC9XWZ6ktOyvB61Fb78qvOWg1T2UDAWFA60Yu+wKIjP4Yby6dCDLp4g94OaU
         WeR/NcSP6drn0brwqH0AUyhWsURVFdRMZA475jIj4qpVnGp+dcswko0RuQ+gQwVg+rJZ
         uQtuazvQwS1RjWKDOiMdRzxIqlrVUDw5W9m/QcQKp+HrEqV7pIkSYJ64kL7oizuDN8l0
         pua14L0/BAhNXG6J4Mi5OcNxQc7O10vbCad5AMbLmbtcOvalYveMygL4JanJDR7tjvKl
         i30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776647; x=1795381447;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xF0N7wIrKZN0ZDKjgQRiE04//Cg2OzQF29jjEwloBSQ=;
        b=rqHdzF0kCQTXMHJTJg29V9DFRmloRfZXQ+pca/08lZ9ptyGcP+imqtVCghqFObxlos
         fa6LRawPAV++Fmur2kUokUDRr+4r/gH8KEGCL/ugOUElbY4ghCmkMwLoyuDaDKQD2sQk
         IRvPUocUX/5Daj/bf8xXJjoTv2BLXwx+BK2BQvI7sDZ+5oLHJwrhH+2UeNxBDuD32xWX
         LRTKsP58XW9ugxrU/5EyFNfJoUbF9QmO+we9586zn8hVPnsGHB0WNG88qeXPuIEq4qus
         4rLuOiZqNRG4IvR5OykODbFG17rdbj2tfN4i1s2/B6RswapzGbRFXDCODSdE+5EOL2Mk
         5ZRg==
X-Forwarded-Encrypted: i=1; AL+hErHjSFuP9qU2OPcr/b9/1dmfK64mdccetHIle1HIs9axwBjDnFIUCA3EMHMCKxCdpjHnvoRqGb4CGh/S8Ow7@vger.kernel.org
X-Gm-Message-State: APuU4Z/w0HzVDHXRR//oC4aFd9IRxujegqsBn5q34zyFaUrl3PNOpAQb
	mRl3iKwNJL8SyXMi/C2s7sx3NyjwzFy5YcjAG+vnkQZRm35rTYrvFeCkkKyiT6LgFYEtF4B11nx
	6u6hlcVNqm2wWV1vIdLfASFs3Do+1cgk9L+EuRiGtiG8G+nTOO0/rDNpWL1wf3l4oAqQjpa7cnI
	46ZOc=
X-Gm-Gg: AYBFou16iuP35/+a6GX294o/ojXMJPXjb4qz9lAfKrUXBQKhy8reBCGNfingrwI3z93
	gxxqrifaOnNoW73e2i/bbxHy2Bd+gS63PIgsveFiElzbglbkDII+k/pXIKhDlisiRjP4fQ9WW+l
	uGGSQd1mP1gz12PGun363whpAa9VcE8WCiN+MoB5EM5aos1sAULLwDKu35n50w6zxCObzilLp0J
	yFsUorhe+4Oeai/97ctJ6I6+DuKg26ZkhfcQbsrgbSarN7hov1+y2JkftJp0eB6yTLNfGxrrPtZ
	GCIYgmDYjcelVTiqv4+xQ/dvlGrzIhzinCsWx0s9CotCKn/drizudXSb21F0XhYsEegiWcRrepc
	0ASsaeU9HBDEIGXjW0WsgAJ0zRU50VITAcljC5QKk/T5rVq8TVHrcligcdk3wBw6+/8NntBWU8x
	Eu
X-Received: by 2002:a05:6102:a4e:b0:7cc:2086:34c9 with SMTP id ada2fe7eead31-7d64d43bcc7mr3103476137.2.1794776647544;
        Sun, 15 Nov 2026 13:04:07 -0800 (PST)
X-Received: by 2002:a05:6102:a4e:b0:7cc:2086:34c9 with SMTP id ada2fe7eead31-7d64d43bcc7mr3103456137.2.1794776647090;
        Sun, 15 Nov 2026 13:04:07 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb65ce005bsm156345935e9.14.2026.11.15.13.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:04:06 -0800 (PST)
Message-ID: <43da6a90-3a5d-4a2d-b2ff-7f007faf7abe@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:04:04 +0000
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
Subject: Re: [RFC PATCH 08/23] ASoC: qcom: audioreach: run VI module in
 calibration mode with per-speaker events
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-9-srinivas.kandagatla@oss.qualcomm.com>
 <179476416982.140154.6938504071664790577.b4-review@b4>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <179476416982.140154.6938504071664790577.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfXyuLMQOsHEcPQ
 czqj8T22ohub2H3rutaYMstMj/bFlLW2loI45SxU58lFhpBGBf83oLqobCtBwutx9ej0rP6rGm+
 CGsQIufmiyCVxT9NCUyEP9czjfcCiGrDCkUs1VgGwbk+bSpMKnuFkltbsuIrHs/yNeHnzJVJNTH
 +9cEXimFW9JKcB4ZoLqPyKxz9ZtLkquuEYFTc+YVPx9yS2uNiLlYDlSYbZO8jqFxwMeKxVUxczG
 8Q74pz2oYjtSfAs4U7d83qjrWc9/O2TYHfMgYp/1Hfgy/txFFtRZcWhaMQzGj/GaUJ7FELMZ6ZC
 KmchHaTdYDXzmzdSCBMiRuCLQKwcuFib42/B8ksy7VLA7+3Z3tz5NKX+jtp3adrGwD28AQMU/7o
 OffISU3CgYLdwfIhd+x9zSAEhnhErLnbb2a5b0aEi9n5PlbJee3sls12bSV8rBHynR4zVHVXO8d
 uX6lPcV6b43zpiIWbUg==
X-Authority-Analysis: v=2.4 cv=YPYKWhGx c=1 sm=1 tr=0 ts=6afa1e48 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=tHvR0g-A6sjxE3NzUXEA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: gPHAqgPz4R8z7gYImbDjNaI3o5Kr_F1V
X-Proofpoint-ORIG-GUID: gPHAqgPz4R8z7gYImbDjNaI3o5Kr_F1V
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX/FcTZPTNSb31
 pr+6FrN30JQKsj3UQxGoXgfBDxPYmNfBFnerrOJnqTogDAR7dnclt9oxe+GTtjJs/B5uORhaRRe
 mgpefEyc/wUs3VlcBuAGUjrdLlFn4NM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150083

On 11/15/26 5:36 PM, Mark Brown wrote:
>> Put the speaker protection and VI modules in calibration mode and
>> register for EVENT_ID_VI_PER_SPKR_CALIBRATION, so each speaker's state
>> and measured resistance are reported on their own.
>>
>> Number the V/I channel pairs consecutively, as the VI capture packs one
>> pair per speaker without gaps.
> 
>> @@ -1483,9 +1513,20 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
>>  		return -EINVAL;
>>  	}
>>  
>> -	op_sz = APM_SP_VI_OP_MODE_CFG_PSIZE(num_channels);
>> +	/* One 32-bit V/I word per speaker, so channels == speakers */
>> +	num_speakers = num_channels;
>> +	if (!num_speakers) {
>> +		dev_err(graph->dev, "Error: VI needs at least one channel\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	rc = audioreach_register_events(graph, module);
> 
> What unregisters these registrations, or does it just not matter that we
> do this a bunch?
These events get automatically removed after the graph gets closed which
is on every stream close.

--srini
> 

