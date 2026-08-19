Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34033C278A
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 06:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787119458; cv=none; b=MA9Y0xMCRSJ1M9+HfwvVBlHu55WBi9ndBaezoI7fMJlRm6lcx7ynRotDK7YBQGmcAQuhWsaUCIQKizwB/hOpyvC16nO9AYK6Nvdim94Za9j0azfOYKEn94D+ReyyO9RspR6CjCb4bQxSnbM/bpqqANBBPHK7f3KTxl2LYaTsbhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787119458; c=relaxed/simple;
	bh=IR/31YtnigtYs7bcMXgDQAxFO0EktcOTHWIkWRKXzeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lsn4xUwSynKCgre0A8Yv8lIWB+AL/nMiR8wFr24luXLwQGGBDbxKcdNokinCY+vFuBAyQLOJC9mASDWtaTgmP+QsVrXD54Xtw65q/lGtDgsBVz3rnwwDO/8lj42vNEpiftK10ARaojk6Fz3hE3QzH7BOBozONEyK8Eiyp1Cu4WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kjj+ivny; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bxPN3HIe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kjj+ivny";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bxPN3HIe"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J5I3um3518416
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 06:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nfGcfanrAxASsFeDEYf+aPFdYJTratLZBBEPs/Mgycc=; b=kjj+ivnymqNL65sf
	RVle+RVZEaImguCo4sYIrn97MCUdYmWtYxYg+li1dok/FT4iHmRWdHoJ7tQdphAc
	ccyb5+bUAQ2V8rG8PjMGBRsiy6/ddRqBkONEL50aKZL3hnZVZ2LrqjsFBf6t6420
	io4E0BSJTyyehd3o5sYLASnT+OajixCYyBOXggXUk6CvSh9DDThgzFj4maMjaESl
	swRLilYw4vbckSa8E0dTJ5oVlWQmVX4AeOwJesRfsESIcC67/mNuQNvF6nF2ZZEn
	0UxqAcxPyj4uv3frjZ6MsWrMRFIEIFbfDfvh9eNzSzJDjAe1XYv8lCgGIGSVB25a
	0HFlHw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfk9m76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 06:04:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e7b87ce77so1699419a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 23:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787119455; x=1787724255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nfGcfanrAxASsFeDEYf+aPFdYJTratLZBBEPs/Mgycc=;
        b=bxPN3HIeAdiWnyjShpPUmxHs6KHlL6Y6zfTAlk07m3Rddf37wox1vib/Q5qYK7LdNu
         5M795062kGOY8PKnffc5pKmFX/BGNji8XO377eIV+PqQ4VehDW5v01rWIfzA0by3aPza
         OCVnFJfboe2iD6q/6PqCweC+paqFcc4FcKYApOIs8pkX3+iEsZhJ94s29MsXrtG/m/g5
         h0OXW+VvwsCdL0+bzuLeSeDq6F9dJWc8RBqLaSJY6i30nAKO2FMsDfvkge9bme7IMmk3
         Q0GOwhTgHTX4zt3wzhGky9NKpM/bpfltw/gaP1j2826uvDcwD9ENO50HagkC3utu8dYL
         Nung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787119455; x=1787724255;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nfGcfanrAxASsFeDEYf+aPFdYJTratLZBBEPs/Mgycc=;
        b=bhEuBMmbuY/3OwyW1MuiDlOiQjKfWjbJZDWA29gZgRvCP6S4fNVMRx6O0KKuZvWxUk
         +R2fKNQQ3q0E8QYmdDayy2uEcQ+ppTzu3GlUA2Gj+uolDpexMkBctwWRd9MN/ja5KU30
         2VrPtACvpjTat4RDsIqh/q5ZIcM/LOgpgObQipFpOBGyymTHD6OF2eRMLNEmZF3qY3rl
         OyHzmrsjZfV5HTWEG09ACacUcyTzT+wm/bkuruo4OqK22WxQWGM+2Ns20Ho5SNh2roYu
         PpHcC0i+zE3/FKJXWcDG3kfdKEchgVxOCFCGH3UnXASL5Kd1p74LkgRwdrRRSwIwUCTg
         OGng==
X-Gm-Message-State: AOJu0YyTzU//bCN2f/wqF7c0OwUYQi0nCV4zn6ZB0FdKYjjeJxMMIfe9
	DzPj61QUKsoj4Ynx078N2DgyJsjFnjzqHW3PaeVQNmlQAS2nY+gT1RR5QucCogJ1twEvd17D2XZ
	+2ev9kY1lG0jyY+fZyGlxPPs9eqUFPGov+ISJaT6KhYikbhNT3/TgEGJFEm5BxbwZtyNB
X-Gm-Gg: AR+sD1248URZsVWf12LDwMdsqI83pwUwiWilboFs4p8S0eUoUZ/Av7F3vAy9PgniidC
	8xLs69u7FGq+ui0vK9tEFV4WMDOH4OF33vV9odZRg+Wet8OGEvb+h2rgFpx7t9PyMuf1YlSW5jU
	NWY9EhMwkC1Bwd82raTEWchT9AV/tNK6WHQldTQ1QBP0uMwNhOtIYCXvnbimUjGMvci9/xcHwCD
	ZhUK48jqcfnROrGJzfWl9AItObBb1a0Q8xHR8H0oe9FPbnOtTU3ti3+1p9jhWNw6ds4h1Ma9aqW
	9zNM4xwu4ZovsrwQOwC8XFHyYN9usuv4Nr6mq8BMU/OZy+uBXOlk7kxpLWvpXM/V3d/pdIc3jOo
	SeZuzq5oDBbUqiyQ0fmJfINTspxvgjtLvhFo=
X-Received: by 2002:a17:90b:510a:b0:381:792d:f993 with SMTP id 98e67ed59e1d1-395810df1b5mr4732623a91.17.1787119454735;
        Tue, 18 Aug 2026 23:04:14 -0700 (PDT)
X-Received: by 2002:a17:90b:510a:b0:381:792d:f993 with SMTP id 98e67ed59e1d1-395810df1b5mr4732553a91.17.1787119454332;
        Tue, 18 Aug 2026 23:04:14 -0700 (PDT)
Received: from [192.168.0.104] ([49.204.17.188])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f96cd4asm1431789a91.3.2026.08.18.23.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 23:04:13 -0700 (PDT)
Message-ID: <ede4e5c9-595a-4412-9b20-16b99f337537@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 11:34:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: qcom: Add Maili SoC compatible
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yijie Yang <yijie.yang@oss.qualcomm.com>
References: <20260819054203.61385-1-prasad.kumpatla@oss.qualcomm.com>
 <20260819054203.61385-2-prasad.kumpatla@oss.qualcomm.com>
 <0b5a7518-ebb8-4e3a-b6db-c053c2edaa42@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <0b5a7518-ebb8-4e3a-b6db-c053c2edaa42@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YXsWrFPIQQPKXWNm43cGpN3vhn9AYZQ0
X-Proofpoint-ORIG-GUID: YXsWrFPIQQPKXWNm43cGpN3vhn9AYZQ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA0MyBTYWx0ZWRfX9gMcA2eub4u8
 501nY8D0gQSXyKM+d8dea0QDEcGGLObj0Tepva2SBSc4GOF930ewPrys8eN0TTKFSetan0jOXyW
 AnAcBlUS4x2v1kBrG0LYVR2KKYTBU/Ws7kCBGWNa/OiPMEnjxHowPSOHaH4ZHZ7t1UlYsxS7qqS
 CNC2G0JjyS6lBFd9yQrB2DZ2zXkx6ZuSOeBtXg5hS1Pkz2TJ4FgZuT0XbRk+OjzAH1TcY1Eqm1A
 27H+oVpe+KWzoiZNQShM444I1RX4BCh057v45vDXIDHZ+InrRSnNepFHpsMbpl7ltkx9sCEdP4v
 vsaguInXhkbhApeV52h66F7RCZlitCV0YL85CdM2CeJnzEUwJ/39AEaoRM4VRQl5yzTpT8mRXqv
 WfB1ROQqdaCSmryArtBtTmmWqabf4oJgne1NXdfJLgpzYMlp9+Glt97ffgduTWlMRUgACsV0CL4
 MbiMv9j6Qs3ORw2yyNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA0MyBTYWx0ZWRfXzrB3Bp7aYwfj
 3E2Drhy7KsdgjhH/+D2v51Uwe94XzJjcopAis0GbGdSIkBij1uhX4ghOzrMUvTooti8W1ynqxyR
 vNjsGM/IPmY5/qSM1Ze9s84xVOck1S8=
X-Authority-Analysis: v=2.4 cv=fvfsol4f c=1 sm=1 tr=0 ts=6a85475f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=/JTPBhwEQko7YaD0RKblyA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3TlOhtAxTlW9CNtfbbYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190043


On 8/19/2026 11:20 AM, Jingyi Wang wrote:
>
>
> On 8/19/2026 1:42 PM, Prasad Kumpatla wrote:
>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>
>> Add the qcom,maili SoC compatible string to the QCOM SoC bindings.
>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>
> your SOB is missing

Ack, will update in v2.

Thanks,
Prasad

>
> Thanks,
> Jingyi
>
>> Documentation/devicetree/bindings/arm/qcom.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml 
>> b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index ff8a35df7862..00d9a493fe76 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -175,6 +175,9 @@ properties:
>>                 - qcom,kaanapali-qrd
>>             - const: qcom,kaanapali
>>   +      - items:
>> +          - const: qcom,maili
>> +
>>         - items:
>>             - enum:
>>                 - qcom,mahua-crd
>
