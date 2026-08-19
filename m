Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17103CC7EB
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 06:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787119497; cv=none; b=TmPZj+5nlMwnO0c0dWf+mYnEaZ0+ctUlTCoh4HchR6D0QTRlwcC8HmJLlfV2TxYi3GnjUXpiahsKQyJBnmGPzhHUeIEpY7b7eeilHxZkohCJes1w9KANq5TGZJGG/vqHpSGgPI1i1jxyg26tyTJ6LDFJMBTJ4TpxQCza8A/f9ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787119497; c=relaxed/simple;
	bh=apEfSzleh6zDP2MHvJsIoWS2iWfXWvwk8X2SVA8SWy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rQJW6fhhUdBcZCmnfaJoDFZMBtSacQMqQsqlIocUpJ3KXlwyMxD/hM3E1IWzcQTt1n/045rq1PYCXzsoebVb/+TvyftPONtMlp+PCNuW83c+tSppGEVYIdgQPtDoGtLAJSwWTzAgkH5BEl0i+oxiYuwSCgiBO7ZUnB4tfsbbthA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U7u0nOL9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Stgnah5w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7u0nOL9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Stgnah5w"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J5I5IT3067093
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 06:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	apEfSzleh6zDP2MHvJsIoWS2iWfXWvwk8X2SVA8SWy4=; b=U7u0nOL9d5M9l64v
	c3zwvdQs83XfMqH3BtbVoeXRmPuQvDa1cRtiKpsYMLvUjpOTWhvCHZmKqy4O8YFr
	tUu9nmxADZMj5Z7qfeJge79S4J1cpljKld3yNRNmd9+Q5VzvBk3N9/RkgPN/JSBl
	IQsM4vl/2Dqu4u8zEJUmgYwN9aykvdHZ+k6MeNZD+E8dTj1BgcUh61Objw4GhVhI
	05w1QmwX/SCM7ndzse4gmLBUxyF9iXeJgKiXpspKjd/A487hSEc5KcUDLR8gQYuy
	w5W6wuxeRFUN8pveDXIqrd53/WWKrOshcJvk5NP0ggR+G1FGdi/ZzAdb22ExihOT
	Tb1vxw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm9k8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 06:04:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d54187d8b0so14648975ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 23:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787119494; x=1787724294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=apEfSzleh6zDP2MHvJsIoWS2iWfXWvwk8X2SVA8SWy4=;
        b=Stgnah5wVhpY3A6cYJ6YyobY/aeFTt7Vy+LTr2t8RcY3+hEUAIcwRXUIl7GV3oVzps
         TBq94/rqdBd/lu6DoCOX2Kvpg4FTCF59xT6HwDyrLYR9r2Z/q4j1XPDIbPyApcmBxe0w
         a2HjYAq13v1d8Sr0JW94uQtJdvQTgNqxTePTtN3RIPSqkzQyODPa1D5bpeGZcMIKqp6l
         2mTEW/EPSKQfx8kkRy+E3KeygauhSh/KkMf2wV7zDKYM8LcaF8rnL1YPfbB52LynNnT5
         wjkqXGchZvDF2YEvOzrXgy7FUhJtRJZLy5OCDuzhhco8+fPP0EVq/hFW+tqoVhNQDeSO
         flzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787119494; x=1787724294;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=apEfSzleh6zDP2MHvJsIoWS2iWfXWvwk8X2SVA8SWy4=;
        b=BJxp1BBt65j5tc6l6BUGN9rnq9sfBOdx3u+n/xnn4p/7wIr1hdrR6J3skUe/xyrp2U
         0A6ZB7ItCL+WmAzQ5TeWZqNsS0RXkdbj/fGWtFBuqjRYvTEIAno/ZVp/yJuu9+oJYg2r
         jHRKD+nFRml0JKRFctRbQDM8mhjjzgDuhgirefmjkcaGRng5BwIwUaimTgnbKJRigO3x
         bFa1HGf0yb1X5/JmBr0lsu52Ba/gBWOOYERy8jQ/X6LSEo0Hxc9m1MMJylYgkHUuRyQs
         9FlSvl1brwHZ28mLKfBkkATtp85ayY0SFGP/B1V9NTgZF/Ya/5ryuVpyHdpLXX+XrINE
         2exQ==
X-Gm-Message-State: AOJu0YyJb4jlYt5MZXwb9IA22h7Iyy3HK6C4gHCk0s7LsiKSOo54jaII
	DdS1cl5YInGiC+fcaxjoZJZDHSm/MJN0WM5Cvexl5P1FEyf9Eb42CPGW1gdRppZpvaoMN8C9l3V
	6QgNvP5VjxzZagWb4TgLbBHbEXxLgUhrMmFpWkOa344C82LijtKZI88VwuSLQwSK3fS0+
X-Gm-Gg: AR+sD12N4sIz3A2nJfVOTFqo2NV7bJySaNMuy9jczsSC9TGMTZnyvwKd+9xro2gcPKG
	9489GsPYJDFl4f0xV3t97X9UAQWSWsAh+OiWsqA+ZFsxI0z5rl7sx0+/E0myGnx8BIIYo/pAqmu
	vIae+jxfGAWDsttLqHZz/SQb77x8LO4LFH9PrR+sZyHiW/EnEDG+xh5iC3EdtxJaYqNM1ZRO9hQ
	Y+osd50sXo4AkbCoOTXdWWALe0YbMqGt7x7hk6T3146YttV83FjuEIQN8IpOPHL/p2PyxZ7VZas
	ZjgDWOfGp6++oQ+LKmI7r4f6PYlogT9WgSChLBoXf+aTKt2Pt05Xx3mlqqLzl0eRxBBrhR0bjQi
	KOcjYG+ISzwOMiID3bhxHwT8AZkkqNKIvRbk=
X-Received: by 2002:a17:903:2d0:b0:2ca:4f33:e86f with SMTP id d9443c01a7336-2d60197a2b9mr45806615ad.12.1787119494089;
        Tue, 18 Aug 2026 23:04:54 -0700 (PDT)
X-Received: by 2002:a17:903:2d0:b0:2ca:4f33:e86f with SMTP id d9443c01a7336-2d60197a2b9mr45805885ad.12.1787119493580;
        Tue, 18 Aug 2026 23:04:53 -0700 (PDT)
Received: from [192.168.0.104] ([49.204.17.188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e8dd30sm21530735ad.55.2026.08.18.23.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 23:04:52 -0700 (PDT)
Message-ID: <b62651f3-270f-4eaa-aad3-c71021d57f40@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 11:34:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] Add initial Maili SoC support
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yijie Yang <yijie.yang@oss.qualcomm.com>
References: <20260819054203.61385-1-prasad.kumpatla@oss.qualcomm.com>
 <aed5dcc4-8e7c-4f1c-96e1-9b423c053480@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <aed5dcc4-8e7c-4f1c-96e1-9b423c053480@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA0MyBTYWx0ZWRfX6RANLygOMP01
 gjIlC9vGXGqAUJ2sdxgKaMehgVQUxDM63Q2KuM+PP8SwgBGlo+y2UyCfku7ZQvA7kClVLmD6qLh
 TT4y1UM1U1OOGSanejqQ3ScChEHrfr2SRWG9J5Se10bLJeo6UtmlVTfb0NGw2UAAtLt73/uN7B+
 7kjrxWaYg4d3wo2k10Dq6pkXrc4NCHTWr9CiJii67b2ANzWhH98aA2SeGZRcZrf3sHiuzg9ZlIH
 +f11kjzLb4j3LGh044OFySk8adRsuxJqhp4gFEtYFPk3Op10K1hdrraZYUUbvcbcIStqnq8cykR
 lOEulHO0mExUB8V3T11HkkVninIkstQBrGc8Vyp0VtPAX83NgwEOoC6coxy6x1evBgFhizNe0vl
 WkBc5fIo+dLw9cIIuChQzPLgabMVNz7k8DKY494hRMY4B7dye7yZBzxWTx1/1HxLrm6sC99ar0U
 zql42IhjKR5V1vOWaIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA0MyBTYWx0ZWRfX5ciSnff+9unZ
 uahtj5tf6ostPAEger2BoEsUH/3PXJbxGlzNh8YDeZJnqwprrHdTJrREQ6UP3nlW1g/WY8BXMEs
 DbwlNgJRtG8IffbDhgYwdYoAI42AioA=
X-Proofpoint-GUID: Nlr-Exbke3WOHJnONN8IDdj2N0XPoQBp
X-Proofpoint-ORIG-GUID: Nlr-Exbke3WOHJnONN8IDdj2N0XPoQBp
X-Authority-Analysis: v=2.4 cv=J+SaKgnS c=1 sm=1 tr=0 ts=6a854786 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=/JTPBhwEQko7YaD0RKblyA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=6ALM1Nk-Pr6TOcMOiy4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190043


On 8/19/2026 11:24 AM, Jingyi Wang wrote:
> I think it could be better to have a more specific title like
> "Add support for Qualcomm Maili pd-mapper?"

Sure, will Update.

Thanks,
Prasad

>
> Thanks,
> Jingyi
>
> On 8/19/2026 1:42 PM, Prasad Kumpatla wrote:
>> This series introduces the Maili SoC compatible string in the DT
>> bindings and adds the corresponding pd-mapper support required for the
>> platform.
>>
>> Prasad Kumpatla (1):
>>    soc: qcom: pd-mapper: Add support for Maili SoC
>>
>> Yijie Yang (1):
>>    dt-bindings: arm: qcom: Add Maili SoC compatible
>>
>>   Documentation/devicetree/bindings/arm/qcom.yaml | 3 +++
>>   drivers/soc/qcom/qcom_pd_mapper.c               | 1 +
>>   2 files changed, 4 insertions(+)
>>
>
