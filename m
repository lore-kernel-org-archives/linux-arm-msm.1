Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297DD38886F
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791958546; cv=none; b=ns1kl5vMQ9e8fhGgjGBcYfteT+X4Fd4ZGnyhhV86yUAWN+QVihynWXtvxYBicf/xUdpScBSjHBp2i7uOTHPLEjfxqdYbSbHIavVmmcjo0xRRvGa+R+cOYamVByCPi4wEYNUgoahbUTKgPWT4tdm8Emr5ViUZ5VFzNROnHKpNcAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791958546; c=relaxed/simple;
	bh=MAVOekCHS5n6Q2kXcuSC3PNN37t1MTSzZ9hGE5LmGc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ivSqgvXmt4k1uHmY94GO+ZlpBSPkQ1esulcC4OAmBtXbLgE6Y5rjO9Aj6nbbwnY0sgH+ZGHOcsWJrBD/2pJQAomc2x00HQU1lSjJ5XCnPlYL9XxHuff/vvkZVczv7bJwWB4VYx/x7R2r6iS8Aoa8p72qL+UmPh+yvpUrc2dA7iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ePdjSEtp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hzoZDPkP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ePdjSEtp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hzoZDPkP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E1KTMb3018226
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H8meCWJ8H7If11rY8aq323lYK+Pky/xe8poRUEzVL7Y=; b=ePdjSEtpeDFOBSGt
	1k6xOZCDit0L8b4B+FKCXcKCtSxaXGy4dp6tLpnFsabPNDG3wGM8pOFmPwKyEnuG
	ZxKfkJ4g48XZYrdxOinUdnm67KsmSGO/fDXNmNUwb0EfV2aUtwSOsMCrIL8Vb4kk
	46AgGaQxIcCUNgf+N8+8Q8Us1SlBB0i6+nidNk20qUyQyLwtU3cse2dpSfgcOkmJ
	5b6W2mcM/9OWlwcvmAbEzJfb6MBV+gShx/u3FDWwwV5SZMud8u5xRimy/zUHSDN7
	jODv2pvFDzdAY3kl1IhJf9j6EafY7QsGCfrfJCbj7qkXKKuZXv4yQ1g5hT593MJk
	oejGYg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b2r1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:15:44 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3515266f6eeso1104843eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 23:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791958544; x=1792563344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H8meCWJ8H7If11rY8aq323lYK+Pky/xe8poRUEzVL7Y=;
        b=hzoZDPkPUWj8d96Sk3NmZeKrkiihBevAlBmHPraJHX3kEfYSGxsuqD7hXl6xW5ZQO4
         W/b3d5LiG1v1i4tR00inztA2xXauEqd0QjMFBvhrEpxYao/aQbgAbDbsM+Ko4jghnpUD
         3K9jq3Wyv9speO7qOdR+jxYO1bogqE4Fbsv8ZqW7CMROGXPwp67G76bsZVgLh/EbFCAe
         dyAZ99OaFjWzmF6dRMlMTybimnyameAJ7RslXBjcLX9a8z1N3bxK7KFu+UPogjqVaumP
         15PlQE3qYNqqoohK9sh1AvmabbbJ3DtpH2apKSjQazTAC/9lsSk4AxWUJeklCmiX8vhM
         LCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791958544; x=1792563344;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H8meCWJ8H7If11rY8aq323lYK+Pky/xe8poRUEzVL7Y=;
        b=vdchZaOJQo1V2YeHZhXyJ0iNPLAAxsp8TjqQGvbLQGgyEKBxXk62pJl1Zy2eOnMTrt
         Qcm9MSF/RVY7pk6bBx2+8kJGcact9VTTgzLt34JE7AfPZ1dsVSDcj9becR13uKuYTaMU
         DsemvE1Qh9fByxwlN+kgqHFfmmGNCguv7GAZ8sbEg1SA+6CrMPKphb1gzF1veroFDPpV
         r8U0Ij7jHmg2ckXr3DDKtNKn0zDDBkhIdIdEnD/xS7EyMtTmUOmDU10iHr5kh+/eHqav
         Kq9ZuVswOemwbUBEeb01AUEoje08wn3RzI9YSpznsy0prevNXnhhx3cjA8ZDCRyf06fp
         aC9A==
X-Forwarded-Encrypted: i=1; AKwUvBz//HajEu36BC7unKI2jGiQp3d3BTYTa5ggtjga6X8jU9kBmqBoPti7y3Yo529aAYuYtnm01wY44nBHfixM@vger.kernel.org
X-Gm-Message-State: AFq9FYK22uY60xSt1Y1ErfAz0OkwldH0ctnQGMjw8uPvZwrcgrXXK85R
	DWBHex8Moe23Zc9GE3jg9+2HoPh3+Co5V7nKkS4waGdN9AxWswcJwyGpkUyMg5mm8FqaJvzwEb3
	+99F4HvGBHRh933buocsjAxLWxru+Tbe1PX4QUv9RfiogiFD4svh46mG3E2nZmUz8pMSQ
X-Gm-Gg: AYBFou0DsudTMny/AFq2kVp8N0kZ+DJ8XNaZ5EupU7j9DKiJamqg0T5C5SsCXhKBp0K
	b4dnRuGcGu8HMx9CIRmjEA9KzLMtDFL8IVQ2tMGIPxmsJ5PTgbN2y4W2j/0KJXL5P5AnJHeAv2t
	V4NFJR0IL6gvxTvEr5B9Dj6IWrU1xBm5j6bWID+aH3J+XwSfycOkT03enia7tlIEyL5Hto2vCo3
	HXXdCQ31TF5cV/HnAhqi+H/HMmXRnfsJqLampgTJEnt/o4zxCNoPATtEKJ+4IMRJ7M94piGz4UZ
	kz2/oG6h7CZ8G62CiEP5ViLes8b2uY8VLv8+VBy4pq2rt0SsXPJswelK96niLQki4uWUAZShfg9
	cVqRFAIT4pxtLaGqOOG7ng3akqFI=
X-Received: by 2002:a05:701b:260c:b0:144:f85a:a188 with SMTP id a92af1059eb24-16a56ab4575mr18163639c88.2.1791958543699;
        Tue, 13 Oct 2026 23:15:43 -0700 (PDT)
X-Received: by 2002:a05:701b:260c:b0:144:f85a:a188 with SMTP id a92af1059eb24-16a56ab4575mr18163555c88.2.1791958542148;
        Tue, 13 Oct 2026 23:15:42 -0700 (PDT)
Received: from [192.168.29.80] ([49.36.81.241])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a32eb7ebsm51565161c88.12.2026.10.13.23.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 23:15:41 -0700 (PDT)
Message-ID: <406a393d-56ec-4143-bdea-2d46c5a4d1bb@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 11:45:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-evk: Add suspend-only power
 collapse state
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
 <20261005-s2idle_state-v1-3-3c402c66f388@oss.qualcomm.com>
 <0afbd549-3e9c-4b06-928d-34b2912754be@oss.qualcomm.com>
Content-Language: en-US
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
In-Reply-To: <0afbd549-3e9c-4b06-928d-34b2912754be@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6acf1e10 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=84Ru73zTo6JNcb5XwS6KEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=AO_i1zjuEiQEncmG7N4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: RI-rIfMxo3ML9wAAD_RvUX9ssbNfC5MA
X-Proofpoint-ORIG-GUID: RI-rIfMxo3ML9wAAD_RvUX9ssbNfC5MA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNCBTYWx0ZWRfX+K0JU3NhJgI1
 Sqnhx5Cb9P4eyVZfor+pdv+dL6Hpni2FKfh2tC3M9ifKIS0N/rybb1o7C47lNIwYkzq1dMjDjfc
 fIgXGXE+dUI/eZLGZ+ipJCWEly5vHMiMLkM/7btWhQiokxvEk6qHIkryQ0QmZRlS6xkVp8rqxns
 fTtv1qkBa00GwwtN4hsizn+FwBj6O2WJL1nAMQOG736PI58ILWTeXtARvebZ93wh8a6NKsDK4oH
 Pq7rrNYfoIC7+dfIYmKmkGpjvvYsSZ8No1C9abqglWwFhlX0GFRLcDMCZ2K72udpRY+c6NXJT8S
 evDV2eARvLOQUSqAwTAmd2EABO7ho3DxXAp2Iv2E4obNrC5FZcqZz/RDUl3xhxyONQD7Uxdt3qQ
 x5KefQQ85m8cK/KDkjB8cJ138VFLh6DvUi2ehTDevj54iI9miUET71RZD9baOQqKEcZlrkzb/V7
 0uHZQJ01Ae2zI3mr/RQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNCBTYWx0ZWRfX7FUPrbuIb7qb
 ++miUdTs8KsnC985t4ZId6mu30AHcRtIENpea2ONDemGkGtkGCh1+76DmpaLoUFS9bHGPfebsd2
 2KiHPJ6+l0KGAbU+o/smtyBsKiRD00M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140024



On 13-10-2026 14:38, Konrad Dybcio wrote:
> On 10/5/26 5:29 PM, Maulik Shah wrote:
>> To achieve SoC low power mode like chip rail power collapse (CxPC),
>> the Monaco EVK board with four PMICs requires coordinated power-down of
>> CPUSS and the Safety Island (SAIL) subsystem. This deepest system power
>> collapse state is reserved for system-wide suspend (s2idle).
>>
>> Add the system_suspend domain idle state, mark it with system-state,
>> and reference it from the system power domain.
>>
>> Assisted-by: Codex:GPT-6
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
>> index 539c9c80a808..b2978be6823d 100644
>> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> Why is this board-specific?
The deepest state is only supported on the Monaco EVK board with four PMICs. The monaco-ac-evk.dts is with two PMICs and do not support the power down of SAIL.
>
>> @@ -80,6 +80,19 @@ m2_e_uart_ep: endpoint@0 {
>>  		};
>>  	};
>>  
>> +	cpus {
>> +		domain-idle-states {
>> +			system_suspend: domain-suspend {
>> +				compatible = "domain-idle-state";
>> +				arm,psci-suspend-param = <0x4200C344>;
> Please keep the hex numbers lowercase
Ack, will update in v2.

Thanks,
Maulik
