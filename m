Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA882F7F15
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726400; cv=none; b=ac0633z4nA96HNHOgMibAP2JmYF2igDFE4FUc04CqbOhGOl/lHkRB+dFhDixxpwjsp4c8ToSgoX3Nzw+8iPuqbXeDLRzx1GqEEEVGenxh6ozyUsxQLrfJVxnx7bjVIYHFXD4LINCTAYG98JdJ4QzlE2LfGDDEfqFKytfGJq7AsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726400; c=relaxed/simple;
	bh=ItKb6XO2/XDUSUojUIMmcg3tfa5IbP14FHAxsC8QauM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NOE5fNREVk1LzC4FYxAtXXrj8Uk7hI2VF5MjtHwzHyK8nCSos5Ksszctz25pwEmmnbG9uFXzpFIUJQg4nqlhGCqyfbSpbRhhTnzWBKB/KXlz89q04gMKx/DIelf0AqmPYHU4vEyQIm8UOYKdLrJvzqZ3PKXpueSb9GrVXz4tb7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GYrEFTaV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WgXMGXsz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GYrEFTaV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WgXMGXsz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dRhO860385
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J0Yw7Fx/hFGe8hAKBYaSSc1ucE/f9f698gB4GVeKBZ4=; b=GYrEFTaVKgXlmTVL
	FdIUe/gOgfaQNgoApN9hwMcMyZYpiVb87js0w+jlRw5HZTJt2YA12liBgJ5avDWx
	w6jnDY6sr/HfJ7qG2RRYllo0Zjc139ZmNufJTxmE9A3HhCUmyLtoCv/ub5l6Uw92
	Ym9/7PYxLhrNPNpIQGCgSfOb1dlvJ56MlVo/nX8rsOG36fxRBbgYqhPHUaWZ4aXk
	tr4/8JLjw43i+58RgJfNK2I0fFnPEK4eYzZFAVT3l0xAmZSAvCO6Ean2l4R2LbGV
	heOvq67fpXSaHWc5nqD9HFOsgh2pdtMuX0juKA8vFnMB7I0F4f7cedysaUBjulgC
	ei4tLQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2hv871w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:13:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a1b824e84so108526585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 03:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789726392; x=1790331192; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0Yw7Fx/hFGe8hAKBYaSSc1ucE/f9f698gB4GVeKBZ4=;
        b=WgXMGXszMxAJJh1swuEiRTG0s7XYuCQOzBWDsNxFuJli+nlMVpR27eOQgKMSo/xCjd
         6IOs4Awn5b2PfTKVDvYdmnjGFZHU9+sXuig8uSMCjO/rWqFAKOMylR4eOCEV6dwHZfI6
         zekWWzQrafGATtl397T9YvvsGQC1VtRow/vMjHRxaiJBmZBNSghrYB0u0mWMjchyKgIK
         d89fXBsaLTW516AD+7A2wwv3KFabLLhzTB4eCh9OnLxxNaIH2FTJ7eNV7cjITAj/WlpC
         fkwliMpsQk9iS0U+yjb+SvOph3aEs3Hu/RXArtTSKcr/Eawwdm9KhoJN9H0/0nyWVjGd
         1Nuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789726392; x=1790331192;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J0Yw7Fx/hFGe8hAKBYaSSc1ucE/f9f698gB4GVeKBZ4=;
        b=QABt7xT5afkP4OnlKCOgijvNxGeSXR7HMOnLKnCCssIHA1ytR5wiTMHGAFJf82I4zl
         9c4Tusric2/wX2kJSVEzZq+FlgLEd3JIkPRQ7DI4zMO42/t155yBGW28JEr4Gp6RTF8/
         UxzFoqOmMoZhnkxhV3gBBNksCkOZ7KrE9Wjej6pLBfQwIKpZ5aGeTGV00s2cTqI+/2L2
         1vactIUDQXN1DqunW9tfGl3hE5jscJDparIpuKJrBW6p46ub/6eAdh5AtybneVLyKPy+
         nprznrptDAG94wSngNZ+Hk/lIHJleOZD85QJSkgsxry6uNOaiKQpHNZkiH4ljv3PadK2
         vtGQ==
X-Forwarded-Encrypted: i=1; AKwUvBww2VoISAnNlzu/gM0bmQx21VeAREUowGwJ/4wktKHizOuJTYrKcXHqT1VNdAmA+i0aldHW5Wkby+FXU1nZ@vger.kernel.org
X-Gm-Message-State: AFuF++mAbWmUJQ7UEKm2rUEzpbW0Wxra/w0Wbh8u/M1nhtpzJ2VhdFCC
	nvL13R8ID3CQhGJNQY+8RHXkSVeN+LRjRM6TkmL6buREE711IOwMscqD3zCwc52FrTLgo/X1uSL
	CloQW91djIoxACHQjLN/pMRv2Ee0FloLSX6IA+zrtf7bHZgHKtVxoYIVXSIQ3xdV9A8ZN
X-Gm-Gg: AYBFou0ebyUwnPW+y/h9vqoqoLL8E+JmJqzYacujYBnOPmuXnXog7NgokzdjwvqQ2Lb
	/WVBfOS1Mae6h2DIcxfzjIfz1GSn2Y8PudtB0e9e8qjnmvJ0Ac2v3dDvk6rg6a22YHivNvCXSeR
	adwlOJ5iDiyluy3iUS9po3R7DYHjGmyUafyEI7xFG3WaKzXYqhNYNPDLFvFUTX9K92El9vGmlzt
	DilliMt6ap9b7W6O+9fBEs5uviIPeqXLURAmwz0QVKvdW1dgaV4bKeKXA/trKB+7hzxZYvJPomY
	RLu+o476k9BEkJlKujtqrGg6aAOtW+VUxuszuvHh5XdPNGJg4A7tle6OCQP+jyOyrp/1KhB5cBz
	H+W4VjdJgWkqBHJsbJLCvwo7llOAnrl20PJQCZupBtDfBY3CGdgpUXRcW+WkgMFc=
X-Received: by 2002:a05:620a:27d3:b0:939:710:536c with SMTP id af79cd13be357-93bdc8c8c09mr231185085a.43.1789726392492;
        Fri, 18 Sep 2026 03:13:12 -0700 (PDT)
X-Received: by 2002:a05:620a:27d3:b0:939:710:536c with SMTP id af79cd13be357-93bdc8c8c09mr231182085a.43.1789726392001;
        Fri, 18 Sep 2026 03:13:12 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:82ae:cd75:d970:e66f? ([2a05:6e02:1041:c10:82ae:cd75:d970:e66f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7b7a6d9sm36299205e9.2.2026.09.18.03.13.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:13:11 -0700 (PDT)
Message-ID: <3f51bf6c-5318-4e32-a1ca-3ce8cf8c4ceb@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:13:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Frank.Li@kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <2104f437-e960-4e55-b0e1-2b37126e8c2f@oss.qualcomm.com>
 <82a72918-7bc7-4e2c-892c-0dcdd6dd5548@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <82a72918-7bc7-4e2c-892c-0dcdd6dd5548@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MSBTYWx0ZWRfX1fgjWi/wuZLb
 PdI9+uELR3mhpr5uYd3lWUAdl2nrQhYAqkG/yEuV8W82TGtDHxWTHyqw4YqfwTa6/XGoHL/j+FL
 scxXHMZ/kq8s1j+rg/34xZZ3tUz0JqQ=
X-Authority-Analysis: v=2.4 cv=IOWXmQvG c=1 sm=1 tr=0 ts=6aad0eb9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=OcJ0dzw6xdPU1XpcOr0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MSBTYWx0ZWRfX4zuIHNiBDKe0
 UfvvTG+qWYhrH5agsokZDVYM1tdLtqHYN7ZyzjYdBghD2ZaTpaw2zxrAdtdnuR/YOAGPzIg/f8H
 SPTYaRk3V8F0DXC3EQZx1gDOoFxIOwcH1fJniDz97kQz1mH9rbfQK82Q2CBGNHNKDPB2HScpcgo
 fOD8O7hfAizR0NcYcsCPpsTJmfIFR6jBX78/Cw0zThc/hzyw48sNltp801CWhjVa/FZLr/j8Q4c
 1fMZo9Fkr9C7Rn1C3iax/lsoe2NJ8tZY50R9gF4X8Y5qoTpkedub7PvIl5jrIPFzr9fEJL7aloT
 s7nq/d1d3tbErckHGTSZNheWkOxEWq3IE1pEMmgfVuIWukO9yf4ZtTimgC769pGLM3zUWfPpTCf
 6pfGxCnH0liX5vgi5XXQHOsljfX5j20b4rFSiIT8p6ZOkDi+NIaiqbjmt198Z+/sG+7Z8EuBkvd
 AKVfGtBQEUgyT6ggUFA==
X-Proofpoint-ORIG-GUID: MQQZLaRQcnrlZMYSM1Y-3CwA7xLQm1f5
X-Proofpoint-GUID: MQQZLaRQcnrlZMYSM1Y-3CwA7xLQm1f5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180141

On 9/18/26 12:02, Hans de Goede wrote:
> Hi Daniel,
> 
> On 18-Sep-26 11:53, Daniel Lezcano wrote:
>>
>> Hi Hans,
>>
>> thanks for taking care of that
>>
>>
>> On 9/18/26 11:29, Hans de Goede wrote:
>>> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>>
>>> SCMI client drivers already describe their bus match data with
>>> MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
>>> SCMI device tables. As a result, SCMI modules do not get generated module
>>> aliases from their id tables.
>>>
>>> Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
>>> visible to modpost, add the corresponding generated offsets and teach
>>> file2alias to emit scmi:<protocol>:<name> aliases.
>>>
>>> Use the same stable alias format for SCMI device uevents and sysfs
>>> modaliases. The previous string included the instance-specific device
>>> name, which is not useful for matching modules.
>>>
>>> Assisted-by: Codex:GPT-5.5
>>> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>> ---
>>

[ ... ]

>>>    #include <linux/bitfield.h>
>>> +#include <linux/device-id/scmi.h>
>>>    #include <linux/device.h>
>>>    #include <linux/notifier.h>
>>>    #include <linux/types.h>
>>> @@ -951,11 +952,6 @@ struct scmi_device {
>>>      #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
>>>    -struct scmi_device_id {
>>> -    u8 protocol_id;
>>> -    const char *name;
>>> -};
>>> -
>>
>> What is the reason of converting the char * to a fixed array? That limits the name and may result in truncation and potentially name collision, no ?
> 
> Because of how modpost works to generate modaliases inside the .ko
> any string buffers in device_id structs need to have a fixed length.
> 
> So the truncation / name collision issue pretty much applies to all
> foo_device_id structs in the kernel. People should now to make sure
> that any strings used will fit inside the fixed string. And I would
> expect the compiler to warn for overly long strings.
Ok, thanks for the clarification
