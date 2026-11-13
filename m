Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566703;
	b=Ambv0+Xt4FRvBVyM8SCDpuITNobmDQRkxCSYPn6xn4JGr0MtwKJXoGXesMZVdQRs4iZY
	 uGhHKsA3h9TQiw1itjyMzs0h55qRlnrchfDjivYaR+Y66y/dt8tCGQyeKS3c9jStwQt5v
	 MdI+/oF4v2zXGjMxTBDGXhNEUurAhjMgEp4k24Wy+Lv70PjUE7YOfPqbEn/r09da+oFYU
	 PTNjW3se6OEt+lhEb/fxNId3+zZNf6sM8Dlers/fYXB1uLr+lEQxuKswl6W0y1H6tYTm8
	 e813n/uOsNYNPSlA9n/1ZpX2dSoMVmUHMAU/FRt0JaNYi/UEhgyHnD221ugkGQgtJkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566703;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ljDMRqOHYPM+180KLYBxEZozbfQKzrnp4W89QlCNPN8=;
	b=x/dRLoWKU96pAVg6LBBYMYMR3QN1sm1GKUZOaCBdpym7LoMv8ffKdDPR7J2owaH9swFz
	 IYFR7bMUK7bszd3aCxv0PDVa3+D/qPBosp8fFguduAsdhOz0FVQj2jg+G1HJihzx3QWn5
	 GIUOtzFcK/MRXGaiecQixnV6X/KeuXBN8osQSPXAoshTDyfB82FDS1NkCUTVoyoeGk/Ze
	 N43BZGNonVEcqRvDtxTM2duI/4w0M72xoknHFEvK6EKgJgA9aCAcS8LM6vwBfC1CzezMg
	 m0NffURR9K3TuJCPKXdJ84+qGV9gMPrJsZ9cSZj3H9qeQNfaB39g8775+GepEvyRfiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QLA7Mo6c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fG4j4S70;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6FF606A32E
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 10:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D6FF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QLA7Mo6c;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fG4j4S70
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VJ7w2515649
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 10:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ljDMRqOHYPM+180KLYBxEZozbfQKzrnp4W89QlCNPN8=; b=QLA7Mo6cLIZZjf82
	qk7w1ss19fAqrQxUtYV2M+uEjrZ1uu0mFeG4b43NEscXVF+9pW/XHNwLWpcQS77s
	6dmMqW2NsMZ4g+JTwFcrpCcXNcdpoCNp0b7UvYsu4oSeH3/3J2aOFCZQSZVKxFTR
	TxpthXxc9bCK4PNfTGuX64k6qH9U7q2JLwmdyR5qtdQnfYoNPB96bnJ9IiTY8sjt
	epv2ng2Oew3L1krcTqeUps24WdNz4upXKvskRDifvYEPXr9OYKlXDo294hkCOfws
	uYUpsV+KPrHmtDgus0b/4a8ZTLPFRTgpIV43Qlqz6fIf6fj96mL7yMxei8O4slDn
	ZcXEwg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1bbnjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 10:45:02 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37628596fc9so805728eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 02:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794566702; x=1795171502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ljDMRqOHYPM+180KLYBxEZozbfQKzrnp4W89QlCNPN8=;
        b=fG4j4S701Kq1/hZBqE2+DKp2rEL9Mlw8nTrVVMQCMtSpWkdJPmLjEPKtYHeQ0sSap1
         WIAlFvoXMYY0nS4x4savN3Pz8ajxvRUjRfo/GwxoKVf5uge0dmAx3LLBBXe5BYuHPO7E
         1Gy/t3WdMQoSwgReZWYG2Ol+lV3/fV0JIfqdMjjlrpE2C8PCDgTTiZWy2EcyAElKqh73
         gWd00HbK1yAAxYwYANAjuae292RZWzulssgOrsCoTiW+mkslQx7FGR8YjSAL28+crycG
         lhRxiSzbb5MvnKd3FYN0hiE8OykROMTXWC16KqcidZ9pHrdRGKPGzbiKcYH3YJ6jbCb2
         Ltxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794566702; x=1795171502;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ljDMRqOHYPM+180KLYBxEZozbfQKzrnp4W89QlCNPN8=;
        b=MtO14X9pUeURj5+KAa3fIq+eNbvcCgtXrdcZnkkxmlKGcR7176JdOv2QPWg32B0xO5
         b+4Bkr8zDEa+velNNxuVaavDhJUrmlinfzhENPC3ZuuLCsD9z49fY2QkEl1/UdMUZQok
         zLe2/5jQacMZJdfCHY5iTR7I6vWelHiHk9mq6VNFVdYE9btqsFf3lEIGD9FmxqIGD7CL
         OmE9YnLvmHtM7EaRvA0fMlMcA/5p0ClZFI+jZhNL15nmajgb2IUV+dgVU9Rki5saVy5A
         jByCXWQJPMwLrfAAs1WuJ3B02x7QuC+Ylb3r7WKHBz+wsAdqLqu0aoUwvcDNpWDzuc57
         HIdA==
X-Forwarded-Encrypted: i=1; AL+hErFh4br9uk0vC3Zmr2+VxsSxov3ZOj3Z4oBTb8sb88EoP5D2OZaWNwMtziPr6f1OPT1IcOPctX+y0h39KxT2@vger.kernel.org
X-Gm-Message-State: APuU4Z/yR8e0yd/4MEw7IT1Nd1uEaBX0hOYcD4KglZVIDiMHfsAGRKDm
	mVVQF1e8/C/w0XAEerh+tHFZ6xmHB64RiCHBl67+4gcfwZP3pdyZ/keaWmVwYaLkG/7HFw2Eb3v
	r+U9mQUprc2dEjyw1lAmcoqFfRK0HAmaKhzjQuAKDGsHWcq4TALiKJWnIsyCROTSrcaoH
X-Gm-Gg: AYBFou1JosiY4C3hibNvmPd0YSLr0IrxCBXG77n21S2MhLCc2Nr/54tG79gSlOBcHey
	ueosNcPRYd1f31TISUukuV58nq5Nz+r2cY0tVxxrHuNcYFF1oiDni1DBVBHLubwDhGujjxBuPP1
	KST912L1YqtLDqUmxORhheBv0gINejh40sJG03ZDzP681j61FuCpJhQKNlOtF9wTCumI41PYBcu
	qj5qHmkcwWXL3pzIu/W+e1PTppl9m2Z/cdgy/OVAADB3mXSsqYBcmWyCRraUMZmNb82nwSvEOyO
	0s5M6hTLP23c3XmZiFZno6QmuzbXMWJj1lClY/cg+XuRkvROOdgCY00DizPJF53KlR2Xz8FuWX5
	rfabwcvOZhiIuJrpVOqpEYzkCs5D0uQSNgNh0mNZBJrXswYVyLmQNC3BvWO++NXouEeceZKf1nB
	26Iw==
X-Received: by 2002:a05:693c:6293:b0:378:314:4033 with SMTP id 5a478bee46e88-379679e29f2mr1882063eec.32.1794566701674;
        Fri, 13 Nov 2026 02:45:01 -0800 (PST)
X-Received: by 2002:a05:693c:6293:b0:378:314:4033 with SMTP id 5a478bee46e88-379679e29f2mr1882040eec.32.1794566701053;
        Fri, 13 Nov 2026 02:45:01 -0800 (PST)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm6746586eec.5.2026.11.13.02.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 02:45:00 -0800 (PST)
Message-ID: <a476c249-74ed-4b23-bca0-13b8ae5a2888@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:14:53 +0530
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
Subject: Re: [PATCH v2 02/10] dt-bindings: ptp: Document TSCSS hardware on
 Qualcomm QDU1000 SoC
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
 <20261108-tscss-v2-2-d5f575010427@oss.qualcomm.com>
 <20261109-sticky-caiman-of-research-65e9a4@quoll>
 <28202f96-f234-4c7c-be6b-3019e119bb0a@oss.qualcomm.com>
 <c068e21a-6dcc-4080-a35c-8f604646aef8@kernel.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <c068e21a-6dcc-4080-a35c-8f604646aef8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af6ea2e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Z8WexQQaEhEqRXIjmLQA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: BfzZHW-aWnGBfIsGjl_E4TsGiCQQxUyv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MiBTYWx0ZWRfXxje8aCHWxdN+
 Z8N/NSwobdY0A+6o7cJXQpaGgYOzM4ab7OvQfQ+hJ3ZsZUUiIq35/WEr0oWM9SDLjLENI3vJgL/
 BbGRI0O8BgkkG3afwWdRYcFtHpFcn6ONWb+5Voom+T5x0Gsn90ybGFVB/bgKas5u+ZqKAcD19Tr
 kAvN8PLYk9PttS0EOEAfkR0QX7Riq+MB4bNkomSvwGSqqetZ/qq1RU7JLkyHDFt068D+TYt8Ygz
 Z5KyBuikCDjgZvyFVQOhemjGxgQeEVUnn1JTJ3V1ofoxCUsWFCsHhkdDpWz2080pDlZfhzPUwqX
 y9a/XEiujZpnI8TWFInaUQd0rgcxjLFYTWYColwRd04KrkubOGUqsznO7nvdnqDClv08uqDM9IY
 XUb5PvQrOwlC0unp5PNNZpHagnUlzYeQRfEwHkeaXhX0zsxcspgGiL6EzYkAQgvqKUWcgZrf4K4
 S2WcO+NVPbe+InZ0gAg==
X-Proofpoint-ORIG-GUID: BfzZHW-aWnGBfIsGjl_E4TsGiCQQxUyv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MiBTYWx0ZWRfX6HSDPMJzQJTh
 Us7lHcXr308pbSr1N9zHsmkD7z05CMp6W+EeQ+P61EhXZvZPtR23RXwJvghOwsu7+NHpBY+AxV3
 ixeoIwngPBZjTea/FFbfSRfmSFHEc0k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130042



On 13-11-2026 12:35 pm, Krzysztof Kozlowski wrote:
> On 12/11/2026 10:32, Imran Shaik wrote:
>>>> +  The TSC block is a timestamp generator that maintains a running counter used
>>>> +  for system timekeeping, and is functional with just the AHB and counter
>>>> +  clocks.
>>>> +  The ETU block captures TSC timestamps for external hardware events. Each
>>>> +  ETU slice binds a slice number to an external event selector, and
>>>> +  generates its own interrupt when that event is triggered.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: qcom,qdu1000-tscss
>>>
>>> I failed to spot the difference against your binding at patch #1. How do
>>> they differ?
>>>
>>
>> The ETU interrupt wiring between the QDU1000 and SA8775P/QCS8300 is
>> different.
>> The SA8775P/QCS8300 share one summary interrupt across all ETU slices,
>> and the QDU1000 has each slice with its own interrupt line. Due to this,
>> kept them as separate bindings.
>>
>> Can add them into one file with an if/then on compatible if you'd
>> prefer. Please let me know.
> 
> I see, it's fine to keep them separate, but you need common schema to
> define common vendor properties.
> 

Sure, I will introduce a common schema qcom,tscss.yaml with the shared
properties, and take care of overriding SoC specific constraints in per
SoC files.

Thanks,
Imran
