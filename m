Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94E64A5EA8
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963850; cv=none; b=hHFDlS5ny0PHQuQScyPL8knw2UNsKbf+fjM7FLJb4ZckC6gbhdVQ+SrUf0eo5E+BFrJNMgD+WkpIhd3Ct2RqgUuEFK2tm8gziM6QWmbk2fnOkFyyK4kG88AGHJu8YmkAC1k5TYO9f38dccXK3dOtMc/v53M67543wIAfXGsMg74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963850; c=relaxed/simple;
	bh=R3DH/W8/F1I1fomUgkc5UfikhrAkhPlZqLDVrdjbMIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tjO8dfGNmrzhmP0oYc9gSu0kXVkn4vqRV1R9WZKRbuzpqYsRXkFYhLFU7Bk+A1AqhVEE8+Ur9wp1MtYu5e1sVsUUrUz3oh6FlPsfjK7z8ghZCeZGg1+cIpshN0iCyI+hIMM8lsf5kUUdK8gCV9cwsntnoE4OjYDKtHuaz8L0lmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lhcs8SBC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P7oDsdnA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lhcs8SBC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P7oDsdnA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E663CI3365337
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BTOjT4OUOzapuo6XNz1VJi2V1U4HM1++DKOVSU+njqk=; b=Lhcs8SBC/Z8xXDm8
	wb0Mku3t1BE/Vmb+aq3adm51ngjgKzsIBNnwfILHQkXdYMwiBV6198agU4EhpK2c
	LGbJPafhSczm4HnJp+jHGC8Jhm7ZDsOVyHSqBHszolA1I+eFSZyJ1YbzeLHUq6lJ
	3L7ouQuBy3UOp7wSfXRGkQuY7DL4o61npICoB3p4V8zhc9dcqYZK0e9Xu7imZQO6
	tmF6unthzf+Cgarn90hAQPsg0ef8Ej2zGk2gmZXbwuOUullkdG2o9PWi1/sQJMo5
	y6Uhj4pSKPukdsFyCbq7XaFjq5U1K1IHSZZ4e8O4n/SkJVh3cu4vBTop7Fy7UE8E
	1iq2dQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4620cta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:43:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd60e4e8bc3so2301196a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 00:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791963835; x=1792568635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTOjT4OUOzapuo6XNz1VJi2V1U4HM1++DKOVSU+njqk=;
        b=P7oDsdnA1vpe8FiGcIotHirs9bnzJhQrwZpt6ApfNHSIiHwSHye/U5KVIcRDDwN1Pp
         yLDZhe1S5+5/Vx3yxE80YtCo2cWmFncKsavHgdJv2v93FjdTQRlVMWkQJ9Z6VFD0LWEn
         ENzGc0aePHXVer1N56LEZyWdBAeaDdRPG3OuFs/AVc0QBWYHdpF/SW7Zfzmmn83ST5v1
         TZL2/64L6Vb76W70lzzdzUApUCg0tYXAldr4N9N3/APVd46UGl6RX0Qyq8ijijspN3wF
         nkShJH0S4SPEG4/Qbg4ev06rDS+3NmiVe9Dmr3OX9zHnb8HUR7qSebBh/reI5DCHc7lW
         ZBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963835; x=1792568635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTOjT4OUOzapuo6XNz1VJi2V1U4HM1++DKOVSU+njqk=;
        b=kN8/31Dc9AdUIPfi1XBHdYUJZw6han03PXNCz4MN81xCh6Nl5aCockiYZO2dZD5sPu
         ZvKKLV1sgu5BXubqhEUIogmi/rb5m9r3xGjjF2aXOS2hjhpuqY0IplLuLdFb2JD7lOm3
         y8uLw4cEN/fvTj1ohpNcaKiJYmlz/esQw3a6e6utmYQizsYHSKThDdATFmk3R/29qi8W
         LuSK1Rnh6I9yV+3I5ieqykrYpW2clG989ZdEYnb8GcGZwtl7wy9bVJR+t03o/8wFyAl9
         hYVxVxYUYzaKXQtQdzy5JexXE1JGzweNvTY8TxI4P4owJluWAZj4gc+km1nTTbBDSsTR
         T1MA==
X-Forwarded-Encrypted: i=1; AKwUvByIBJIDYNFxkQs9WYyUZ91utNcbxM6yofo6HUt1W5bqBouL2yMIGh4jZEFKmvxeYQ/dfOGfDBYlrMwbRLbW@vger.kernel.org
X-Gm-Message-State: AFq9FYJFr2jcie4EfY7WYdRcLtnQGRLoiKgOaUVOYxAaAry8zhemqF0y
	ZZ4TkfiJKUPqhOs+SL64xyqsVKPt9Ha+Ht3tMZaMUWhNI5jk6J7T8djFm/DreIIt919GxF95hpo
	KKSu9hvJ03CN4dStCmEtVzt0bWtNsCMowI32/H0AoIk97rslna0cWo5EDcHEJUymBlwwf
X-Gm-Gg: AYBFou3sh2QOr6KKdpczkU8Y0jT9nur8XHODDS9o+SyBB7A5eZfmLrTs5y19HwF3TH4
	vjSjJfZE0BBRuqPIE3E4lYZQfAe7bt1DxGP5YB5j2TlCckv+f6z8FWeuGj9w0+q0WErY2cOC//9
	mG3QERimn+5QU92Ssw1m9WNkCMwZ6zuEf/f/929kw5DYq02QPTLF9Kqq1BCtgeB2+EHbk3DmZmt
	7y9V5iTCgx/+QozxUWbqI9OemEIVcu9dysE6xAZX7cUXOgwqCekvv2yXM5EoXer8GNj6R42yOoE
	aV9cdRvHr8td6PczCeEKIRct/iKurhHjjnhzR5+oimKHySRvMst3femzK4CCpecEHqHsdN1jD4a
	s3FnXYADVD9hGMfq7fSScJPf9FuZxwKaWLoiZNtTZJxHuZWFp7S4gdayiiiLPIcxqAw==
X-Received: by 2002:a05:6a00:414f:b0:87d:e8a0:2389 with SMTP id d2e1a72fcca58-897c6a2ed8emr11225896b3a.21.1791963835209;
        Wed, 14 Oct 2026 00:43:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:414f:b0:87d:e8a0:2389 with SMTP id d2e1a72fcca58-897c6a2ed8emr11225878b3a.21.1791963834667;
        Wed, 14 Oct 2026 00:43:54 -0700 (PDT)
Received: from [10.133.33.181] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804ec645sm756056b3a.43.2026.10.14.00.43.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 00:43:53 -0700 (PDT)
Message-ID: <43e6dcb5-9735-4e1a-87fd-506ee431fa2c@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:43:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 03/11] dt-bindings: net: qcom,ipq9574-ppe: Add
 IPQ5424 PPE support
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
        kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com, quic_pavir@quicinc.com, horms@kernel.org,
        corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com
References: <20261011-qcom_ipq5424_ppe-v2-3-8c7b057e2c43@oss.qualcomm.com>
 <179181021174.434549.3754588049756407155@kernel.org>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <179181021174.434549.3754588049756407155@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: t3lsw51D9pj_sDiGfY3kKsC9l71cQqgH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzMCBTYWx0ZWRfX408QqD+gyYy9
 w8WYj5NVA2SuP2kSwjIJ8FqKU6toUu4F+F8c8Uhk94S2zzBWJ7xAzdOMKCFL5kDoPF0Y1jmaK32
 ZT92VF2wPrcwoC9DHgy+cMpEyaogvZVQwc4/1MYfNXKuWRHUIgUfVQe51lULkG8OqrswvzeoQps
 NWAYUZskT7Yohw3JyrAmGzKSoD+K1/ZJ50uyi5amjqmDnjx9Lniervisz+yp78GePIEHdU9gBJF
 +f1yGGSWNqp4x8qVVPyhSALTfXcvA7/LCfJ8iNaagpWzc9GhRdcxzoLEwPng1FHFj9qW1PdOYo1
 VHawrdK1KCnwk4CGBVbogyQkc7F8vEXdp9onxkAYKUfxYSGllMQk0rx2uKaCIVScp9MOHD0KwEU
 wHCpFw6KaOH6rV/L+IIaPMSyEEpJ9xK0wT0hA5bO1L48r1ogD4oLcelSCc5cApnzXfSgpDPM6o5
 /KmN2oM0tXSKwBX0JeQ==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acf32bc cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EH141z8j1nZSuVZU4S0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzMCBTYWx0ZWRfX+xswLNYmakk6
 9IAosrIbucyBTo0CMkjmGgmabC490UfLDYIOAubLbi5O9bSARpnoOk7a4UPzUyDUl0o2KuA6avf
 WoxzxsDoJBIqme0vx2LF4w3f7dGlxzU=
X-Proofpoint-GUID: t3lsw51D9pj_sDiGfY3kKsC9l71cQqgH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140030



On 10/12/2026 9:03 PM, netdev-bot+sashiko@kernel.org wrote:
>> @@ -182,7 +179,7 @@ properties:
>>  
>>    ethernet-ports:
>>      patternProperties:
>> -      "^ethernet-port@[1-6]+$":
>> +      "^ethernet-port@[0-9a-f]+$":
>>          type: object
>>          unevaluatedProperties: false
>>          $ref: ethernet-switch-port.yaml#
> [Severity: High]
> 
> The commit message says:
> 
>   Also match all Ethernet port nodes, so that ports out of the supported
>   range are rejected by the reg limits instead of being left unchecked.
> 
> Does this pattern match all the port nodes the schema accepts? The
> referenced ethernet-switch.yaml accepts both spellings for the container
> and for its children:
> 
> Documentation/devicetree/bindings/net/ethernet-switch.yaml:
> patternProperties:
>   '^(ethernet-)?ports$':
>     type: object
>     unevaluatedProperties: false
>     ...
>     patternProperties:
>       '^(ethernet-)?port@[0-9a-f]+$':
>         type: object
>         description: Ethernet switch ports
> ...
> oneOf:
>   - required:
>       - ports
>   - required:
>       - ethernet-ports
> 
> Take a qcom,ipq5424-ppe node with this child:
> 
>   ethernet-ports {
>       port@5 {
>           reg = <5>;
>       };
>   };
> 
> The port@5 child seems to match only the generic "type: object" pattern
> in ethernet-switch.yaml. That means it counts as evaluated and passes
> unevaluatedProperties: false.
> 
> None of the PPE port checks would run on it:
> - the reg minimum and maximum
> - the IPQ5424 "maximum: 3" limit
> - the required clocks and resets
> - the ethernet-switch-port.yaml reference
> 
> A "ports { port@N { ... }; };" container would skip all of the PPE port
> checks in the same way.
> 
> The new IPQ5424 conditional in allOf uses the same
> "^ethernet-port@[0-9a-f]+$" pattern, and only under ethernet-ports, so it
> has the same gap. Later patches in the series don't seem to change these
> patterns.
> 
> Could both this pattern and the IPQ5424 conditional use
> '^(ethernet-)?ports$' and '^(ethernet-)?port@[0-9a-f]+$', as qca8k.yaml,
> mt7530.yaml and lan966x-switch.yaml do?
> 
> [ ... ]

The PPE ports are Ethernet ports, so this binding uses only the
"ethernet-ports" / "ethernet-port@N" names, as required in the earlier
review of this binding. The PPE port checks, including the IPQ5424
"maximum: 3" limit, are meant for these nodes.
