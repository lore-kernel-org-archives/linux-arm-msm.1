Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260024A4F1E
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 16:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791824045; cv=none; b=FR8VFd0FmXFyVzKnvqvfkyHwPC4nU9/7mURSJ9QfQUJFovp2V1VzptZdgOaSnUvsWwNYp9btcbXn+9CbOp9TrBPsTTI4sT5hz7PhYxPt7cU8aVwXY/rTa3Caw9sdNmKiSkZ5Uc9PwMKpFcRiDWeIkoGJjZEoqUvDdX9xmwQLKQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791824045; c=relaxed/simple;
	bh=MBZlHXmk37tR5BT3xXEOjrgo/bHRwWaQK1AS7dscABU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Au0kwRiOd4340v8vfk+ik3+W4A7Qe16b6hwvm1/0dEOmjoePLKLx8N4/MsEK9Gu+aj/6KXdZKrgCZ3cGQ4R2TEieAhRbJgg6XnOvfvDpZeiiFfbBw+tbtPLNlBjCYctQIN96pIO+MsV3iQo9PgRWIjbPQKAF1fY1sI5tN3GgDtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pIvCpBSh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Utv2V9R4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pIvCpBSh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Utv2V9R4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFerDs3272301
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 16:54:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4AckRZKhrIfVKIkA99O7IMf96v0rYfiQrck1GyiIbas=; b=pIvCpBShCD+MhrCT
	LahX8GWl+Ogwdu1PhX9brdO3bWoKRbm/QmqwZXv5l3cw50rOzeAeMLrI82hQfGyF
	cadnwuI/whfPfe/6TM964zA30QZmxhxUW3d6NM1wArAfjy0WTvMkQq6ikz0HG4Ke
	tBPPX0+DfAox7nArJ6adgWlbuDsLrebMnk4Y4GQNe2B+7Ks5YgrHjeYsY/WCqRUz
	k32/08I1lxvfU0hpLXncrNLkmaxgpwj0owUbnr+fZO29VGwzu7daVQ04dsSUo4ft
	7XlOAIxtl4yEvqBzepnRDTFGYKSbCRWEXvWnCOTyq+BS81vTYHNyubTF5vgI2zYy
	zETIoA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wffht4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 16:54:02 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3592749a017so1732488eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791824042; x=1792428842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4AckRZKhrIfVKIkA99O7IMf96v0rYfiQrck1GyiIbas=;
        b=Utv2V9R4wBygEdiF1+LBcHo5RAZsXMf73BvNyxPzF0v8D26Gj6YOhguD6E7tnXhQkb
         gMxD+x4eTU+12h6vSsYsc9TnjvNglFN8Ge+LIFRmQ8e88mCOylKHOTtwYt3gHHlopR5C
         xXCamAiLnNYq2PpZsoyJn1fjPXPmf4Wv4Vg7ceFgkfN/DlKiAnQyxmwPfnfQ8dn94Sri
         WxQEbrZVWeekU4PBWQaDUQQu5GF6vmp4d0MNQldOgGNxCz8QH1Cgr72UYX1ImoyFrg44
         LdafeWb5bpdyYw/hSNT2Y9jsngLgQUqdcSBu7jbTAoERi7E42LANNtlasUaTjbxjsVe5
         3thA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791824042; x=1792428842;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4AckRZKhrIfVKIkA99O7IMf96v0rYfiQrck1GyiIbas=;
        b=z1yCu+sTB5jjshRH0ai7W+IOlZkPLvdoFnWgd4q/WqgwEHm6RElhndPy6Qd6bRgFu3
         YcwA1t2prUv0kZvgeTufRZrGe/0kk8prnDqnrA/xRES6Uzw4w7L6TBMGTBogB7ULoupC
         HzvRDlT0CwRxqM8pPo5GUw+yFlAH+eSN4/FgHUizLGpW7QpieehEEcHP3RVNJ3GhVsH5
         /pmM3z4VOc8wbGLHuUsVAAdImLAiZ8Mv3rI5FlF6hXoJ8dTqJ7PRpxjiSvhWOiKEiZGZ
         ICAbQJoE+uTMTsPVLjwd2xZAdLQpV5Yd3hJG6v1P4WlXPv0vOiPBjwA7o0OjxHlnA9TQ
         BEcQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6gRlfICZRG+6lk1T7+t4OHLvUgfN0Q5EC2U+ot4tR/n3IvVwwBqFmp1RFFFWVioROLMl3Vc6FW68EihhH@vger.kernel.org
X-Gm-Message-State: AFq9FYKYkCKNt4IOVdqigeOR1bpTQE2WVpthFRSUDuMc3+oNjwNfieDJ
	bnPjmC+QGIku9OELjEvWu0JlOwwlechFql04QEwMHU1LBqKFACD2P5xrHUtYZudz0D305Pa06hS
	MCu8eEb2rec61lADieLo2fsfXmZr7w/6p0D7WQ6NVfbwD5xiqkHBCWgxdXBFnHm4T7IVU
X-Gm-Gg: AYBFou0wOfg/lssZ4Z6HbJNblKDX2b9X5lPbCW+hjAV6MibZsjY2nlKJC++j6vfxRrz
	/IXPhl3TqTzgg/KiVxHO3hBpTNF2ENl4qirfkbglSLY3nOwesbDW5CTGDCnHsrXMD425j1iZafE
	D4Eel6nV2UT34ytgzstfvgaq8Z74ZJJR9ehHH4sPZPygA3d9BUZzWhy8aGqoJTov7Oo4mysUiR/
	oYeSqhepykI+nzBOXTZ4j0KyhOKRIfXbpC7LgwAFxNbbfu+Cte1UxIuIK5SzhhWEKvFNZ3lP+/C
	bCm1arm5nmC/Sr4vk9kN4AjxU1bhKvRm0s5aWSaORl8D/cjU0bY7IQVG8bCbgJnPk5Z8f7OeYrV
	iiLQ+v7tcz9YGvxhHJMEhBT2o9ryl910mpDKXOteyKRxZcso6x2SiB5tCXA==
X-Received: by 2002:a05:693c:839a:20b0:35a:e354:643f with SMTP id 5a478bee46e88-35ae35465e1mr4121557eec.4.1791824041679;
        Mon, 12 Oct 2026 09:54:01 -0700 (PDT)
X-Received: by 2002:a05:693c:839a:20b0:35a:e354:643f with SMTP id 5a478bee46e88-35ae35465e1mr4121519eec.4.1791824041002;
        Mon, 12 Oct 2026 09:54:01 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb68e56sm32044009eec.29.2026.10.12.09.53.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 09:54:00 -0700 (PDT)
Message-ID: <ef08eb14-0732-4c75-9f69-2173cba91b65@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 09:53:58 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] dt-bindings: wireless: ieee80211: Add
 disable-rfkill property
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: jerome.debretagne@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        ath12k@lists.infradead.org, Dale Whinham <daleyo@gmail.com>
References: <20251220-surface-sp11-for-next-v5-0-16065bef8ef3@gmail.com>
 <M7kfFb5fz-WB43U_xCUwgxpmBJ4TNdp4jE6yFu6HmemIcDx5tXO6H4xnW_pEQz6DMkKm-3POdB9hIdB092zhGQ==@protonmail.internalid>
 <20251220-surface-sp11-for-next-v5-2-16065bef8ef3@gmail.com>
 <e0e9e690-c56e-4b56-90f9-2af46a7feaf3@nxsw.ie>
 <20251220-fervent-mamba-of-sunshine-f680a8@quoll>
 <571681d6-67f3-47fe-9a42-dce5aca13c99@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <571681d6-67f3-47fe-9a42-dce5aca13c99@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2NyBTYWx0ZWRfX1LU/B0h4/SJJ
 LEvnTGdu3S5f1hP/LzqkpdVG7aPCe3wkERdMz2V2QHadq3gKTK9XTXQy3Mc0t9aSKZVuDoN/Unn
 ojCbPhm7u5u4vw0QIHVTdOtPZIv5uDTamF1qxy07oVxJRw4n0agIxwVUWjyQrnYMd9mWRMpEfky
 2p3YTbpGoKkgL+mopIW8Vz0MidFj3aas1uat75hl110yoVf73skd6GnoJET88B5R6RL5HNqmTyK
 55NdHY1UEpQDSY49NYF7tlF+JeiP+EYFHkJGHy638Ag4bfW8XHyJAOH8EZwkYdt9eyka5AXhObt
 CYagCrKMMD+3xBy7fxJ0FqxWg/H/35mC3jJPgy+O00wtdpRaXBsQ/8Mstk71AuyALYyno93dYCa
 63eBGX+Q1YD6g5ga4vCRDSvc3z8DapFMnjNvXEA+tStwIa7F8y8JNrTZj/JQCb/VCbOt05hghKW
 YqUHsDYFheDCnOlSTnQ==
X-Proofpoint-GUID: B9rev7FJRHauhaZCJSEGtx-w33tWKtof
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2NyBTYWx0ZWRfXxBZjjxKxTfEn
 +Dawc3bGQfBkT87qlecWn5EJjzm/HF80BfWB4weMh8gug+II4XBe7u1nSC/3OAniBefAmPm9WzA
 UZ6mI0qK5Fa4+U+cN8WVAsgPNajLfJc=
X-Authority-Analysis: v=2.4 cv=ZcWIpcVA c=1 sm=1 tr=0 ts=6acd10aa cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=IdRum9UsuwhjULrUfLMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: B9rev7FJRHauhaZCJSEGtx-w33tWKtof
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120067

On 10/12/2026 9:38 AM, Konrad Dybcio wrote:
> On 12/20/25 10:12 AM, Krzysztof Kozlowski wrote:
>> On Sat, Dec 20, 2025 at 06:04:00AM +0000, Bryan O'Donoghue wrote:
>>> On 20/12/2025 00:21, Jérôme de Bretagne via B4 Relay wrote:
>>>> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>>>
>>>> For some devices, Wi-Fi is entirely hard blocked by default making
>>>> the Wi-Fi radio unusable, except if rfkill is disabled as expected
>>>> on those models.
> 
> [...]
> 
>>> Is this really a hardware description though ?
>>>
>>> Its really more of a logical/functional description. It tells the runtime
>>> what todo, not what the hardware is.
>>>
>>> You could also have a list of quirks in ath12k for this or have a user-space
>>> utility look for the appropriate platform device string name and disable
>>> rfkill.
>>>
>>> I think this logic belongs in drivers/net/wireless/ath/ath12k/ triggering on
>>> a compat string.
>>
>> This is good point. Either this could be deducible from the compatible
>> or this should actually describe the hardware and whatever is there
>> wired/configured, not what OS should do.
> 
> Sorry for digging up an old thread. The board-compatible change is now
> I think merged into ath12k, but I'm not sure I like that, as now every
> OS consuming this DT has to carry a table of board compatibles (hence
> needing updates _every single time_ we want to support a new device),
> instead of being able to convey the quirk through the property
> 
> Perhaps we could revisit this approach?
> 
> Konrad

I share this concern although I hope the number of platforms is minimal.
It does seem strange that something supported by ACPI is not directly
supported by DT.

/jeff
