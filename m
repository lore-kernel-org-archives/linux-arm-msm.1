Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B563806AD
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784635045; cv=none; b=Relti19Rrw4jFqQ2Z1fSoGyjzIcKnee87UsAE74Jk0zrPvAHbTj5AGT0ZNOPiSztXP1Ulup7u2wc6kJF2hoBvIko04jVL/bhKGCoLbPMpmjl6igEv41vDGdLGSNZtYx5GSlpLRVyOKVlSnc24N4QlffKcwf9Fh1bt422ZGH0Ino=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784635045; c=relaxed/simple;
	bh=1jija8OEh1ywAonQwvSdwU16zTNI3SofStphjA8zOO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X673Uzcd5i2ewUU4dhmMINKOh/s8g0K4CLX9NOy85qhMiBwgxtrwOWabymqqcbeN3ktdpn6EU5o1T+mBaPMI7k1DFY/tf8Trft10vHJHGIBS7K0GKpcTz5d1PiCGa3FGXJ1EbfLdfHoBQV6CimlnerjrI25UZHUmifhU/5XB6+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AxEWXsvm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pa18d3kh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AxEWXsvm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pa18d3kh"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARv3c1252152
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5qjUmcggw2BDTIheMS9xNdAXdB5QLoEoMkHyDe70LSo=; b=AxEWXsvmLnem4C1t
	lwyJ1oFsdXoZs+pr9V/XnenoxPka49AiWHKB60eTSwguPTKPDgWCs48vLJJaYlte
	NUwKAeh8LTvZ4LsgfPutKBrV8gO6Pz7FOpWio+113sV8ifJpE6ByVc9Ns+qgXk2X
	l0a3nUkpevNjtHaNfyPmExkoXroVoEiJH+OzePReWoWmfm+ePUU0JzU/TTM8MDzi
	laIclFSU4IeCBPtQ19Qq4CBlevRlQKALv9vlJxioNs9oFNfN8ntucBQVW1u9jVaX
	rb7oQj05ajoTan9+B2M13vdtLiVHfNAN34ffeGvosnDf+aS4we6iuqVzuG6Upmut
	KChK6w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqvccb5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:57:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e661ce1dcso214410685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784635041; x=1785239841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5qjUmcggw2BDTIheMS9xNdAXdB5QLoEoMkHyDe70LSo=;
        b=Pa18d3khmcm43ydtGEGAC50dPYECvHnfiCysSBJwOYG7dAfhjaBNG/34+q+F5QXlpK
         rUedYKxhfb2l+KclVtvAdK6hHkFcstdGpFFnoDuoca7wcT+HPzIq4f6qY92XwOt37myZ
         H/bZJaWimiNNKaGh7auEwqD2PqK/m0cZP7pzTkd35mCSsiBQ7lR1GP2gzasl4eYLRUoS
         iN0qD5lk906MCWs5ismXUZgVPxDI9iIYINTi5iV0rYqwf74GGqxfmJtHJ3sTUePg/xGO
         NrE/M0HFyP6nRQfdk5eXtjAkUWE0bbNnWVwhOaHfZWeINXJbm2n7brkZXvw39HEirWhR
         wMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784635041; x=1785239841;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5qjUmcggw2BDTIheMS9xNdAXdB5QLoEoMkHyDe70LSo=;
        b=BIECzPrHttktKkSBUIrpmoKEv254O0UUURZGSPxSNNdiWxXJPW440PyEcf9oBToOn6
         I/hotXU5iAJyhyMXhR2tEY6gvJsvmr+mRjSyv19b39Y2ONgKwjAcuAEXBDs+KjKjB/8I
         RmXhev1lpGiz9SefVMsGKWfy4884Ii96n7zhDFbefMa/2rB6TLJzmvc6sXBA6wAajRux
         N1YYYYQEkUlwUWowhGld32yZ8tPxO8waZPD4EySuUKUHZxphHA3SUNOThR5MMjw7so9I
         A1MklkYdMGSxQ6Kn6swzi/zvr4/sH3waHtqIFFBiCfw4iLtk4AodKNmED0BIpq22rhDu
         KEfA==
X-Forwarded-Encrypted: i=1; AHgh+RqUBSNCVcHp7C+clcQg8LXWnHXyf5o+85wlNKX2iy0rcpE4w3vR64c2gdo5tM7V6SrTmRtXE4g/O3vifQSh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1zE5TO8iYdNKA4XcyaQyOs94BKpE0gtI+tFKXexgbxNRDxX91
	a7uQHhkakLOSBoVnJxKvDa8HNovz+d1oXZdI0iLti2ZsFABCDtWYiCSvQd+BZpWfwXNb1bIIZ7P
	yPfVhPK7kt5azEPfH315lizgNG1k7QAZpOFQKSsAtU0g/0Kum1vv5oFjDcnaN6+//F/T9
X-Gm-Gg: AfdE7cmPNO9O1lGeDdZXvY69prJIobXM/fsmHTmzqACttqSkwNjkZidP7mVf5o4Kn8l
	/mtGwNqX4Ax02HkO1C1sDp1nJ+NzVGhLzBdzczzMz2vAUWPjfKVEojzxYah1daOYArr1SuCQyal
	hBl/QX6IUVAw3okHVA6R/WYRWiDuR21rurxzEfNIZXxijbgcAPSACLLbxyEb44A3LEc7eagAnKz
	Xwm/fkdxZY7KOjYIZsDe5hr2PSUgaGKQA/G0FFabl0XF19qeO/U8Ld4aBx2UUeIV9ErnHNR22y4
	qzkLn6ReJmCiszC5B0h45r2evqDRpp1T9JhQDFRgw1NRUpIJ7vjyc0DN0TGYxt7wgflrZ9hefvm
	sXvtSM4vsXSv0v2gMUCQlb/+m
X-Received: by 2002:a05:620a:371c:b0:92e:6485:f640 with SMTP id af79cd13be357-930e7051f8emr232653185a.4.1784635040933;
        Tue, 21 Jul 2026 04:57:20 -0700 (PDT)
X-Received: by 2002:a05:620a:371c:b0:92e:6485:f640 with SMTP id af79cd13be357-930e7051f8emr232650685a.4.1784635040424;
        Tue, 21 Jul 2026 04:57:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6fff537csm5702136a12.25.2026.07.21.04.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 04:57:19 -0700 (PDT)
Message-ID: <4fc9743d-3d9e-4130-9ffb-b64318a8373a@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 13:57:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: qcom,bam-dmux: Add
 qcom,shikra-bam-dmux compatible
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Stephan Gerhold <stephan@gerhold.net>,
        Andrew Lunn
 <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com>
 <20260714-qcom-bam-dmux-vmid-ext-v1-1-3f29da7cca76@oss.qualcomm.com>
 <alXhHH0mGvFeUMd7@linaro.org>
 <3a32a44d-4044-4270-beec-565171ad4bff@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3a32a44d-4044-4270-beec-565171ad4bff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEyNiBTYWx0ZWRfXxW9SHaLyuZwF
 KiDFAm7UHgb6A7GbVXS6RNf2FTA5bnzVD0x0ZPe3DsPeJWmjKz95rOcnwOwNn8L8RS4RraPs4kp
 ZUDfk3ybZxYu7/eE/p7fV/Uak1mOQr8=
X-Proofpoint-GUID: ZEukr8WEAtInmyuqx0qjJ-nhjrrBMiCl
X-Authority-Analysis: v=2.4 cv=OMYXGyaB c=1 sm=1 tr=0 ts=6a5f5ea1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=TTPXGskHRsZgtGffa1EA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ZEukr8WEAtInmyuqx0qjJ-nhjrrBMiCl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEyNiBTYWx0ZWRfX5qm0yWVX2IjT
 e4BdUcrQALmva59bvzNc+kFehwrf0d7ubILmrjLbqDe0xS/w81vKYrA9yyK4DIrrAnjk1TgTfv8
 6mHzKgsFzzobiCqP7afbx4CDnGObPRdXmTh8lUoc1T3Psv0VmiGinN6Ju4XTJatMse6Tce5mkxt
 FZjueDNL3fYPhP3CwVcTH1ZWENX4gr3gjiEthO5q3X78IeTP9mJXXIU4M7EIjLNjjvik7qa4IUW
 ZZjCLUfc55ZRJSjYG0CiqcIntINJSeIjS/t8G+yZlZUXwwSTG/5upX2r7qMQiawh9Hmaer/8Mph
 F8yCD8K3khgPT1Q2bjXlWTBh4+6YW2/svwQQbRgW/ulf6IRdAQ/eIMjOXgTkbf+w+q2D358HxHV
 wWvk7yQP4VQ88aeRpOyRbOIKgYDcQ0S90qKAtFbzdndBBo5lDNMCsO0rLP9WVmU0tzzE1GMjKqj
 V9/nabai9GZXD+/lfzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210126

On 7/14/26 4:03 PM, Vishnu Santhosh wrote:
> 
> On 14-07-2026 12:41 pm, Stephan Gerhold wrote:
>> On Tue, Jul 14, 2026 at 11:02:31AM +0530, Vishnu Santhosh wrote:
>>> On platforms where the modem DMAs into the BAM-DMUX RX data buffers and
>>> the XPU enforces per-region access control, each individually
>>> DMA-mapped RX buffer consumes an XPU resource group. With only ~16
>>> groups available, the per-buffer mappings exhaust the table and inbound
>>> transfers fault.
>>>
>>> Add qcom,shikra-bam-dmux as an additional compatible for the Shikra SoC,
>>> paired with the generic qcom,bam-dmux fallback, so the driver can match
>>> on it via its of_device_id table.
>>>
>>> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>>> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>> IMHO (the DT maintainers might disagree) this is not a different
>> BAM DMUX hardware block on Shikra, just a different firmware
>> configuration. I'm sure the existing SoCs also have those XPU blocks,
>> they just don't make use of it.
>>
>> Personally, I would rather describe this with an optional "qcom,vmid"
>> property similar to your bam-dma patch, allowed for all SoCs.
>>
>> Thanks,
>> Stephan
> 
> Thanks Stephan. Adding Konrad (Cc), since this compatible-string /
> match-data approach was his suggestion on an earlier revision of this
> series send for internal review, specifically because BAM-DMUX is a
> singleton per SoC.
> 
> Konrad, given Stephan's point, would you still prefer the
> compatible-string / match-data approach, or does the optional
> qcom,vmid property (matching the bam-dma series) make more sense here?
> 
> Happy to go either way once you've both aligned.

This all depends on whether the DT maintainers grant you the right to
introduce a new property and in this case I very much doubt that

Konrad
