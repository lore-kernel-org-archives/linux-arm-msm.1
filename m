Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE58619AD90
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 00:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784248265; cv=none; b=mOenKQMeY+QHL5Hr1AiRUVBoyvR578j+RZw1K+tjZopJVFMIETSqCkza1SYazwiP6vTvLV8eXJcAJ4NkVnQEd1PQ6Cjj5TyMtoB4WzsP+RyODQ8FuMpcDAeJCZh7sAvY2egOn2ZECxBMwwzA74N9e5fzuQN9qtMrHW1LAXRA8Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784248265; c=relaxed/simple;
	bh=ytJd3IGSAL1N+rwcJpzr/vFDhEwruTPMalUoBQnrxXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aZUarYw+DbACTZ0g2JCghOWqZ1LyyUEJ3J27bezMvIRkaE5/Fy1KhW9VUxnb7wIBoTeTv5t47r3Jn5yQLatJ1kYlv0RbSOoKAfdBbyvvgOZI7z2Le+ek0S9Linr79bRKTKRtIUYwAWAFNbuZhYtF5rY2QV2YUvXFU+/sVyXKP+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XVyJOzoP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Miey3vxU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XVyJOzoP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Miey3vxU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GNIZRi010471
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 00:31:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KLhv4uLuj2a0CwkzFlguBw7pHPr92MMB0a10TBLdZz0=; b=XVyJOzoPVLGEGKHk
	0Z58+V3wLWE/gQjodIn+fi2m248drcXqjWT+pAqorhGvlYVBAcMhwQJMQ9pBIcwp
	/EG4KBCaFgdOAJoK21OMH3VHUsMadLsMvTQhRp4u8AFkxpm/ETUnc6RgPm0X+a1a
	0jg8lBMZ3i0mb8iwSY1xPN3vLxTJubyEdtSDRQiJLhR0j5uKu8VWAzam2EMtIdfE
	NonB3MX7vZwb65PD60WwlaRJe7KEfkhH4VVFJfbe6woGqcuvfTgNvemdaMA3LsWT
	Hpl9w85km2Dx3l1ow87/iVr9Fcs5FCUQLlJRMivDZwk64F71Cj/6ZFvof4hZwsSA
	sntTjA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feuex3vy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 00:31:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so11058572a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784248262; x=1784853062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KLhv4uLuj2a0CwkzFlguBw7pHPr92MMB0a10TBLdZz0=;
        b=Miey3vxUv6zQ6J0Haibc7hKwD68G8G9VLkpGEj0ilooVTAmx8slIP4ykQGVslskxEP
         Vefp5xkfp0PTs7HBGln6WwvnXjSG+WJaX45Kzn3V6/Z0MPf971Hg3yHFJKJb8Er24qlz
         X1ridboB0+pG7umPK1rvjAw5NzIG+EX82PEK1qeHzJzH4jhpkZl3jsfwwqzPzk914EA/
         /7oYdC2lLvYE6/Tj181997DGJ/9alojpdjR/h2CxB2CLN7PH4xVSBnPyt0WY+IzlbBhe
         DgZcbr7rh3Is75g2kCHHjOB3s+1+9jSy2v7jI4r/XFRhflL/Jv3/iHP6U8le5Epf/JLj
         Nbsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784248262; x=1784853062;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KLhv4uLuj2a0CwkzFlguBw7pHPr92MMB0a10TBLdZz0=;
        b=rfYHDiKDwAnjoHRSoEDG2h6tcs48H9XO4mmiZpv+F/CFHs3onHjZE2und5HtA6w2zy
         isnzFrJCIMJLcXGQGMhT0RZBW/+6cMNSm9NM7tEIf6AoefjkzLU5oQd2J2NZL4gnQ7Tr
         1dkTxZJv1gvXPsJ8SkWMaHw5+DXn3uq6gFLP/Vc1h39KQs8lffIEEcg5eVRb53cZdlki
         0ePdQSb1US1yz13UH/qka7k9kjoCWIlCsiZeDjqNM3OxsTMjpF5K/+7VUZodbefmldf6
         SuocbrzIAV+t0eAFdQMg24ClTP1yZdwzte1cSt1ABBHspFAyw6660W4NMy36tYXoVLFS
         m0Ag==
X-Gm-Message-State: AOJu0YySDXRoCcS0b+okJLIKvwx9jJpKXq7yTbOcEgZ9ENH5xq+I5ntQ
	+XiEM89sBe30doGaeeSBYjKHUEHqV8PqhVp5c40D30fH1kB/kex6nbYfazooAfoUVMeQ0r3FWrV
	GkeB4gW/GobHjq57pdQxYdO8vG9M+MB6Rb6BUjGU55u/B0lrnGHtrv9de5JNhK2NYwvSs
X-Gm-Gg: AfdE7cnBkPxNj1DX8XjyMPQpWHliFvRlgDdCMW9D9DA/fAOk8Qtlyf4mi98TekwsQN2
	7cxbRw4BHeSNWD/vi0sarMT8AmxVWIrbHGERluk+PyQuTyyK2DYG/3evIGM0JVx5kV1ojfjoGv0
	8qzokDLe7NSfRu/9w2d41g0s5WoM4V6D3EypLQ8rvMNBVh8przA1UG/QDLSKEat7P7aq9yERhI2
	7FxgkSj3k/s46FVoufeKmFpKHwYKp09cQxD/ILumkIYUCWX9L1UR3ZfVHsmZpwt8TqqBpDSmCKR
	yICfgXuw7KdgIHT4+sQ8HlYvhu8LxGMdNE57NZ2yyFGUE4cLjhWNcgl+S6NXzeYjh32DZFYk1dS
	TM2ylJWSOUJVtP7h+wp/pqn1foaF/lMsEVbcaMH2q4AUKHv6kupy8D2GK6nc47gnvo/pd
X-Received: by 2002:a05:6a20:cc0b:b0:3a3:a9c4:3d60 with SMTP id adf61e73a8af0-3c3ad7ac045mr262470637.27.1784248261594;
        Thu, 16 Jul 2026 17:31:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:cc0b:b0:3a3:a9c4:3d60 with SMTP id adf61e73a8af0-3c3ad7ac045mr262407637.27.1784248260974;
        Thu, 16 Jul 2026 17:31:00 -0700 (PDT)
Received: from [192.168.1.7] ([122.177.244.170])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb519de26a5sm37551a12.22.2026.07.16.17.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 17:31:00 -0700 (PDT)
Message-ID: <3763d264-e958-4a2a-ad7b-204e6af37655@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 06:00:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Enable USB controllers on Shikra
 IQS platform
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com>
 <20260716-shikra-usb-dt-v3-v3-4-13f73a0571bb@oss.qualcomm.com>
 <606db992-446c-4601-805a-d86d0fb74110@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <606db992-446c-4601-805a-d86d0fb74110@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JeeMa0KV c=1 sm=1 tr=0 ts=6a5977c6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=HtVcTGqVJrL9f/+MTxaKuA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KWuMA8URoD_tUPs-JecA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 4lS_LJWUg08D03s5O74b-7H2ytXC7-FB
X-Proofpoint-GUID: 4lS_LJWUg08D03s5O74b-7H2ytXC7-FB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAwMyBTYWx0ZWRfXyrxFlNiNenA4
 v7HdnPP0AmQSuDul+NsZ4/3aYVRVnGgWD7Mq88qy7bGgDv4zgbYIFd4PPdushOHCYO/dEJxEq7E
 2KW7CP6Bt/cymMCW+tCqa+eaPGQz4/4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAwMyBTYWx0ZWRfX6OkQTayZiSbh
 V+7rGfMu2AHiNWWR9Fh9HWMcpVtI6Mn+O8rVnqeSm2B2GfQqOZnwUiin9TW4xU1RDIacTXFCRie
 yaSBO/aJme2dUOnBQy4c7RavbqUa/tZEIPDEh92wgdZtqisHVtsIXCZ8NcB5Kn+NjR8LyAt9vDm
 dLq/qoItjaTlTYA6TLm8M85JMqi+pLimVtS+nMqEBbiEEomYHVEuMXBickVo8hCJ+cmXYHKZrtA
 F04ZUSzfSE179zdGBq3hJTl56vmgcFa5WNjdaQpJtp7KOjs7a8TJ9jiRcVh3i04KLDQoCkfL90R
 C6KBNi0GZlTXmMUqRaH30my/iN8hEuL8YYaDqgGbHwRoxYgVYDY60gevnAkNmnqTOiKYurSXLVn
 3AYMjdo5YOSmM0MAINjXqlwx2fkdX26zs3TYPlyJu39MXF2HCslURyc2ppXxXhUT8uoynIyfGCc
 26Opw1lt0Nc1U3iNAvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_08,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170003



On 7/16/2026 11:10 PM, Konrad Dybcio wrote:
> On 7/16/26 6:29 PM, Krishna Kurapati wrote:
>> Enable both usb controllers in device mode on Shikra IQS platform.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 35 +++++++++++++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
>> index 3003a47bd759..2d4e34ec3b82 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
>> @@ -38,3 +38,38 @@ &sdhc_1 {
>>   
>>   	status = "okay";
>>   };
>> +
>> +&usb_1 {
>> +	dr_mode = "peripheral";
> 
> Why does this one have to be peripheral if the other boards are otg?
> 

Actually I missed adding dr_mode as peripheral for other boards. I put 
in commit message that I want them to work in device mode but missed 
adding dr_mode property. Since the default behavior is peripheral mode, 
i saw no functional issue while testing. Shall I send v2 with either 
removing dr mode here in iqs or adding it in cqs/cqm ?

> [...]
> 
>> +&usb_2 {
>> +	dr_mode = "peripheral";
>> +
>> +	status = "okay";
> 
> And why do the other boards lack the secondary USB?
As mentioned in cover letter, on pure upstream build, I validated both 
controllers on iqs platform and only primary controller on cqs/cqm 
platform on a remote access setup.

Regards,
Krishna,
