Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475981;
	b=Xj8l00NsHOnEyu4lGLOGZVaa+OIlZhH0FLJC/cmYSRj9/hNUr+Lw0nfvoUeLk9+Xbgnv
	 peuXSnu6A1dN9TrEIh7X+im3eBza5sT5NPTef0pEuZCy/CNOS0bwpy6cg45fqMlBB+qCM
	 pzl8G+BjhzDyoVj5F+DvOgI/v4NY5PJG72ZtszbHuWV22toMnwMTshuqPdpvhS7FoNIqB
	 MofrUl8OEspnc9A6Svor0DSHw/xV7M0UlXTBHHeYDXWgxmOsjpMrVbr106jrV0z0Hqe6m
	 B/4yiREfMlpUqZo1aHh5dqHG5nZbop+hnErsMWmvyuYnthH0eAU2vDvATjeBRQsu74A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475981;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Zm4uqjyTBZMLurFKBtWKGU9EMrdGi8yi2J1M7zOknh4=;
	b=GQWJ+zAdOnRTGXUj9V3DgJORCNxL/gsYMStxYZatbhkbwESQ0BCmg7uPapgcnhg38aOA
	 yOeLRTAhSBDxmyVosXFg4D5QEVnckIKCaQ+hbRUUjCL0jsONbc0oismAD/kK7ZRmtjGO9
	 l7O8PVh2RGsmRI/wWkXfyl6vosHfI1orQqQGXggqYtJJ9C1lx0r7X2Kz+FEOmUqsmNVGR
	 jmY3zJg8NKQIu+PTLpjiY18kxUpHP7RLjVOmycr0i2c3GCfHTjTRNNm8ypiKtEFVxQF56
	 9cMa8vZaaDpzkl7ZYgWr7wR7v+/NC4Y7NdPBgnMqXKrDw1oJxjKbFQ0dynJkShL9qfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QNEs1OqV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ky6gW3mE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D94606A335
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19D94606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QNEs1OqV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ky6gW3mE
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7oeYJ2819033
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zm4uqjyTBZMLurFKBtWKGU9EMrdGi8yi2J1M7zOknh4=; b=QNEs1OqVZhxSqcNz
	7CaxEGvyYxcn8sWAwKPUwf3KHCkip2UMa2qvizkBgf9TCcd02mfsD+Th3nFelV5U
	fpr1KlN7ZkMZLeiHNyMKXfISrr4tOzr4oIZfitDPsleBaB+MjTrX7nWMjKl88cgH
	hDNMhMeWDqstOTNs9TykMxIOUmaqApcZYuElS2knDaSr81Cx3eZaV7nif8X+mHnJ
	PJRNDg4on4bnV+KAPwwCW50QG/7grnxxVavXmGET/uForAz8HKBpmqq+ce+2+i4j
	1albDF1n9ctEO0og8+r2joQds1yFStNm4+A7xkdqR0nUe+7CGVvrH9XieFhYI7GZ
	AcMPnw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e18cm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:32:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so3623885a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 01:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794475979; x=1795080779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zm4uqjyTBZMLurFKBtWKGU9EMrdGi8yi2J1M7zOknh4=;
        b=Ky6gW3mEIC1B7T1WO9PFjZObF2eDUuYmhulCnTrvnrNcGCI12pwzH6V6YM3NtkLhkL
         Y04NUvtaMvMyx1rV9sVAJwYzXQ8Sc42CkSHo7PikAH0+8AtG91t28yN0bu/RJKNQaT94
         9rDr6EZsyZV6us/nIfHR1IrqRiffYooY+R6qW3Rs/UzZ8JKqR+GjmBp5qARMgvxtNlQI
         t/qy+W+RJlClfr7kDayTuEvHYWQQZP8I4nPJsu97vvnoxMMHZDPqfXLP56h1sA9G4heU
         RY6K13XfM576WaZdOu5V+F6WSqmlMtd/3U5oYF9KYCqSSLvXLBUjRcQxM+JMdRs11j5H
         zteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794475979; x=1795080779;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zm4uqjyTBZMLurFKBtWKGU9EMrdGi8yi2J1M7zOknh4=;
        b=BEMA1QLLZqB+YKewIJHxdVOmRmuMtrVV/ktb81S3N0iO0OWOPNAgMa/COy49yzVJ6d
         FJaW6MFdQKJxHZWAMsGZ44bhKlgI7FRnIi48eeDELg8HuqSrIt9uGSuX9lLPMtvr7mbx
         JUnuNKou4XnOF43DBZgFhHryZVBLxh1Ln/9ySaLvGXa2uPkNtgLpFPgATEjg5RfdvquV
         TW+e+JrkFvCgcBmdFZBOXG6ZLeGXqkhHTnQ/IUQXJ2VD/ifvQ5MiOBexL39k7ZCXGoG6
         rvOzDJRwbkmQptdQ6itka1DodPe4K+FIdT2dCSMXNvfPVg9FmVTBmpBklwbdL22Jrm23
         dJeg==
X-Forwarded-Encrypted: i=1; AL+hErHjg0nCnlmMA0C78IbjSmm620FN0i9ZU8YRTyX7DTTEtAwAJyxSp5A1IAqLo2N4//SlxuWXEbV/vj4BzfEd@vger.kernel.org
X-Gm-Message-State: APuU4Z9Sx+ZQvHdYOwEihJdFs67vjTV2WrPENB/ktuepfzzHvxzDFjro
	qiYvpmzOpccYEyQ25tOje7IPSKsvLiSrXB0imYRIDKzcC9RAjlJyEzhQeEj1PkskJ8x9gWOKz9D
	Ax0QG+M6ypm3bxHe4fmxffvOHyBg02ORhPQFsTzY+N7tuw+Bdmrd5N7We9Si9HPpGCf6z
X-Gm-Gg: AYBFou3Ho8FQAZRPzYHlRMCa5eUWq7QQVeDW5P9qNdSYd71z4AdZxZvmulauqh5sWoM
	PKwd6ksOFnztkTkeqrz9XcjngOsuZLnImB65cJz0w6NsQHdwlFpZs2ho3hu5UxHnvypnxZBEIdU
	OZZwG33ReGTvYg3b6QQ1gslDWCazf5CvEy7XbAni+oy36uhUAITob0X2CDfJpmqIDoeXfRaotdM
	0EohE8g6nTYXSaJ8nT5ijcMWSn5KVl6uC4h337/9ftb04balC2Ou/pTgA+3UVMMtaPN6g6NJ2Bx
	lX2l87kEsEzzhM+QWsNbibQEKUA9FDhhknyNK9HWjy8ldws+b1ZPixYeJnEUwDpDIwMzb36CpPX
	bIeL8OXwUPPwN0/tsaAt85rIYVziJr7C2loGPDfoxxMkMkh3EI2vzIf8MxRWt1T1E9VStuJgNs+
	Q9
X-Received: by 2002:a17:90b:2250:b0:3ac:bc3d:6fe8 with SMTP id 98e67ed59e1d1-3b182f57e28mr5448973a91.34.1794475978600;
        Thu, 12 Nov 2026 01:32:58 -0800 (PST)
X-Received: by 2002:a17:90b:2250:b0:3ac:bc3d:6fe8 with SMTP id 98e67ed59e1d1-3b182f57e28mr5448935a91.34.1794475978124;
        Thu, 12 Nov 2026 01:32:58 -0800 (PST)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d916c0sm31396185ad.41.2026.11.12.01.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:32:57 -0800 (PST)
Message-ID: <1b1c69fd-580c-4104-969b-ba09693ec6d7@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:02:51 +0530
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
Subject: Re: [PATCH v2 03/10] dt-bindings: ptp: Document TSCSS hardware on
 Qualcomm Nord and Shikra SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
 <20261108-tscss-v2-3-d5f575010427@oss.qualcomm.com>
 <20261109-statuesque-polecat-from-lemuria-1b8ade@quoll>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20261109-statuesque-polecat-from-lemuria-1b8ade@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNyBTYWx0ZWRfX0vW9K3hFUYVY
 cFhvjIlktr9mmKs0SmvmADxd1/SjuTbm6urNhVHCSD1TMfVp4iDJPqvWn/XnsTmL/tZamz3brq8
 QZ+wHeuk3L6ZCzGD9n/1mmaGII6AuC8MCw93bdpIf3vOuHGet7DpIIlSqXrxLTMiDwWn1PebJ3C
 RZPvWrqfek9syEnuql5+t+APKqDDUCNrGRihJ+8Qs6+eylmuVwYxmXNpvs5isyfK3GdY4vw4w5b
 RhybB5xvKpqcXwmW+Yf7b2Rt0GhbywSxXqV/wDHTtC81vG11PfmX22k01Fb1F56ZAaBWFmH8u8J
 AH1MiB1Hiaxo5tvGNua0L4clEc0oUHp1jYwydqs40H4q6SC5osoi7kly0IKmhHUSyWZOf/ARd+q
 Qa9qT+AaQ/frrJkpkohirrIVDn0qaPSKX6HTZ8qI5t1XyQCDfKxlro16v/IZChErbU0AAlflg75
 4GxRGI1P8mMr07D4uhw==
X-Proofpoint-GUID: sx6XOwwvF_bgGuuGZ0yxHrPEy5aKDUdm
X-Proofpoint-ORIG-GUID: sx6XOwwvF_bgGuuGZ0yxHrPEy5aKDUdm
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af587cb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=8x6Hp9lnLVyU3yzMCIwA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNyBTYWx0ZWRfX9QZms1Et4K7n
 domBQYdOCYbEIPjofcBgcLK5k/tfNuaWyVM9qsgE/FlO9Qf/mEpQMT35m12UXH5GjM4IYWW4qel
 8ZP9HL1Z/rgtH7OdyMB0KL9Snc8AWws=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120037



On 09-11-2026 06:21 pm, Krzysztof Kozlowski wrote:
> On Sun, Nov 08, 2026 at 06:48:24PM +0530, Imran Shaik wrote:
>> +  interrupt-names:
>> +    items:
>> +      - const: etu_summary
>> +
>> +  pinctrl-names:
>> +    minItems: 1
>> +    maxItems: 32
> 
> So here there is difference, that justifies different binding file.
> 
>> +    items:
>> +      pattern: "^slice[0-9]+$"
>> +
>> +  qcom,etu-slice:
>> +    description:
>> +      ETU slice number for each entry in pinctrl-<n>, pinctrl-names and
>> +      qcom,etu-event-sel.
>> +    minItems: 1
>> +    maxItems: 32
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +
>> +  qcom,etu-event-sel:
> 
> Anyway, you need common schema defining qcom,etu-slice and
> qcom,etu-event-sel properties. Maybe also pinctrl-names and other common
> properties. The individual device schemas should only override/narrow
> constraints
> 

Sure, I will introduce a common schema qcom,tscss.yaml with the shared 
properties. Per-SoC files will take care of overriding their own 
constraints.

Thanks,
Imran

> 
>> +    description:
>> +      External event selection value for each ETU slice listed in
>> +      qcom,etu-slice.
> 
> Best regards,
> Krzysztof
> 

