Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB91431A59
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784559886; cv=none; b=LEPM/VVsm/qyttV3ZjS+0j0DV6/BQwoyVgMY2W9BeqRX+yt7c5E+GG/D8boCH5dXunNGfwHoWg6fEpxq4TnmpDkEhqNgn55u4tLrbSLsBe66LrYjMFu/8Z6sgFj37aguO7Rnj9GgpUnPL+8hbh+efPFBQtRb3vT+55LffjAxflE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784559886; c=relaxed/simple;
	bh=oMagsyX+2dR4DN2yvNKHPofyVrpb9t1Cz+dhKF+/ZvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=emJQwuWXCgznaaIQ8vG+9HZ9qZo0VlTyexN3/EveGPRE7AXw7X3LjHF2PbTL3nRnYqGwP9au9kVhuD8W2A7q56FP0jY29/pnwVwYUqTTEmvWSjQ/rvU5sUO+2KQsQrvYkIgq7GaqpMELIZ5J/I1qP47ApdevaIIU91FuYhmgbSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HATFA6Qc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ji8Dd3RB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HATFA6Qc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ji8Dd3RB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDrEJa2582220
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oqrYdxLLIem1IFbnRFUVolmOzfJaw6zfSBftICLCkFM=; b=HATFA6QcVb7tPtV7
	Ol5XMGYd2mMhLmiqN8qM0I3zovGcLPrRg0JRqhye5Qk1Zlvc5c/lZC4TzTWI4Zw1
	KVWkPTI7zg8LmhJy5LOpjLn3mEzgC55cLGVyJ8TrfCBvuAdMsJYZjD476O8Hq5HI
	82BT7yhbD+VKt9sb6i65jBQd1WimYeV83ftebapiDTWjC+3vSQuoS9KbXHqsEqks
	haW+LpAvMcY5EG+Lre+8JsaTzPJsVRE3JBQ48NJWd+MhDoC1k1JwHVyI83Lg3zRH
	vGeb+A66H7G1dr5P0Nw0k2CKBgMDB3Dfampv82uzBZjfI6G+AjI7hGmPliyvHt1H
	h7NMSg==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgs01g5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:04:44 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6a3856a293fso9354147eaf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784559883; x=1785164683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqrYdxLLIem1IFbnRFUVolmOzfJaw6zfSBftICLCkFM=;
        b=ji8Dd3RBFS64sr3pO5UfJplYk9bPyqhfwbNKdvd4pbqdzL2pPQhe8XalenMaJBfks6
         DG/3cBha7+g6BGO0+WEYWRh3gaxBWQbd9/KUfVeYkRmKoO80RZsZjDgODfCrh955PrXa
         VK+J2LPtk9X725EkcnLwmawdF8N+I4HE484uUaAc2rlzeoHGgryAbZEywwx/XGYhEP3m
         K4A5uyT5dUzAlDuMige6t/fgcMnBpEXL0HPBQNXcEHtSPNtZ2X28BmRlVIDhiRohTfgR
         eMXuKwqn8t0XhxZdsCdDM0ffFaRs9knUinU574jqUEZsMqRsMVsZnkZiW7WmvjBh4BXX
         4/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784559883; x=1785164683;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oqrYdxLLIem1IFbnRFUVolmOzfJaw6zfSBftICLCkFM=;
        b=dsszI75E0EQClPNn3KkiTY+6gDX9qW1TkXADdCmH/TV6vNWerjRAalU8tmNehvbL4v
         exHJNruz3IYFwnRsG5v2Y+dvMXBJSxblWG9YJyi+wmRe9rDV3SqiahxYep+GTAE+bdBj
         oLsJfQvJs8gN3kJJfgYSBqOpnvBmSYA46oIEgouz43jCAlTTGcApist1peuWv36oPmv7
         JwJbtHYWVK2aHwNX61COITEHFznQofG/Xk7sK8v0dgzCioiqilG4QXt6+uqJEzkszx4t
         qwzf6eeQrEV5t0tgk5DhALXTB0iQjPBxWCyHn4C9uHc+JBK1PsdnLwVx+l6hKo9r0xMc
         +vZw==
X-Forwarded-Encrypted: i=1; AHgh+Rpu9xoUdyxT39CWSQuo4j/gD+Kr3UwUDRI9KFED+mKGaTmUCgc/hnEwsSvMAmRQmDwLd6Uz4izC0nqCasUg@vger.kernel.org
X-Gm-Message-State: AOJu0YyQoHq4UGWsur3Tv2CHNVQXy9JCn3wAuMqqPX1BG/oCarae/0C2
	bURkInS9N7e64XwtG0FCFFgWMnCEf4h2QKPhN8NLtAbu6Pbr+4+oh/BiivP8CAHLBSZCJHY7TsO
	d+neXY/iYY9DEAfdlKMsHHjY40D7bwXEcph4TYnFbQWxk/fcOPyyO3GtxlciPWh1fiOx0
X-Gm-Gg: AfdE7clde2F+Ci3vJEGMTwA5yEIQauOkOybcYHscxwIqQLI6znRZCLoZsteFkigXVbj
	7Hia+15+P4+XgecKCF6E9fkQcYtaNyhAnWujzHK+DOi+KukXmNVBqzumeSHT6Gl1oIGb2zly+rQ
	F7qnNgwLDXpTBlixBLvfSqadP9HYWs1r8/O1D7eY66YKXeimj+6hEFzbWi9pC8UyV1uFPx068RQ
	rBjtf6NEpoLmwzyKjT7nh8W1RTvCg8cAszhsM5lJpmU3iF1Oqrj4EoOhcwIMHCavgr+mYqRjcl4
	bGb404jDD+daUvu9s9y0HUuyJ6kOB5yjH+GzPVKbrUqHJSWKfgOYvJLGFDlGNgWVvfogn+uPjIS
	3xLpHo8hkIJnyulVpZikhX1TU8t1rWofkXKWxWpR5O32Q06GyicqnO66XWJwsy3+i0n1R8oiHjR
	KXu/Sf7EEefEVCopE9RLwSx8/SCvJm
X-Received: by 2002:a05:6820:2917:b0:6a1:43bc:d0b3 with SMTP id 006d021491bc7-6a536804679mr7525258eaf.27.1784559883425;
        Mon, 20 Jul 2026 08:04:43 -0700 (PDT)
X-Received: by 2002:a05:6820:2917:b0:6a1:43bc:d0b3 with SMTP id 006d021491bc7-6a536804679mr7525241eaf.27.1784559882951;
        Mon, 20 Jul 2026 08:04:42 -0700 (PDT)
Received: from [10.190.201.105] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7edaf99b337sm7924913a34.21.2026.07.20.08.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 08:04:42 -0700 (PDT)
Message-ID: <782d626c-2545-4719-9833-efbc9ba82871@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 20:34:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: qcom: Add Kalambo SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
 <20260718-b4-kalambo-crd-v1-2-a1069b5a2757@oss.qualcomm.com>
 <581659e3-9168-42b2-b715-943808d9ae2f@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <581659e3-9168-42b2-b715-943808d9ae2f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2NyBTYWx0ZWRfX/pkei1hg+KB9
 FcqoGZZCPa8h5241Hj/3da2al8Y80jiGvTjRfXukO3XtQhXDgmDw7na9E1QRTrSp2JsYKxI8uAy
 loLDp5PyH8pO4ZQpKadHhRTwwtxuiEQ=
X-Proofpoint-ORIG-GUID: U-FgS0Y7Qqbp02L8Xb-co2BAQRSKPvhM
X-Authority-Analysis: v=2.4 cv=DMS/JSNb c=1 sm=1 tr=0 ts=6a5e390c cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=1TCdPgPjFHuVKpGW9psA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-GUID: U-FgS0Y7Qqbp02L8Xb-co2BAQRSKPvhM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2NyBTYWx0ZWRfX81AgQTQv8peJ
 1OZBy59Y1YW+c8u3JYpFKoXu+iG97GK/GUyLFtooAOo8Ql36IFQ2jrfAxUnPuAbUjgZHm0BCjQM
 z4vVNObjOq5pA4CFW+gp8iaLGCANhW4561+qcyh+7qZI/A1yGdknaTDJWj7IrODMoWyc8jqsFnc
 /ZE1UlB1LeFiZ61xycV9/ysFeipcNRWyjKVCDlIaePyLgey1eI4wJTqWk1j6/mrkxuEkDXxqIaH
 Hygfo8Qxl5bQsYYGWTimcywji++cuErMs3m/WwhfDJj8FH9XQaAZEln6QngfqQLg0CIVla1vzkf
 u+pjlhCx/41dIYiF3cgh7QXYCv6zyUe8P4F8WYlQ/v/J8krtrSDk5MTVwyD0NfHb8+YURGdpLis
 ijsdGZVT5C2aBN/pcPJl7Ne/NOGr+oIkkYtClIK7NsnxOkaWONWdMVNYRv/nfSgoePerfZzCFX6
 I2n/frBgloJGfBny6Lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200167


Hi Konrad,

Thanks a lot for the review and for catching these
> On 7/18/26 2:06 PM, Gopikrishna Garmidi wrote:
>> Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
>> with CPU cluster 0 removed, leaving it with just cluster 1. As a result,
>> the PDP mailbox and SCP low-priority register windows are updated to
>> match the reduced CPU complex. Everything else should work as-is.
>>
>> Add a label to the Glymur cluster0 cpu-map node to allow its removal on
>> derived SoCs.
>>
>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/glymur.dtsi  |  2 +-
>>   arch/arm64/boot/dts/qcom/kalambo.dtsi | 29 +++++++++++++++++++++++++++++
>>   2 files changed, 30 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index 55d91c696a3a..f2feef362be5 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -275,7 +275,7 @@ cpu17: cpu@20500 {
>>   		};
>>   
>>   		cpu-map {
>> -			cluster0 {
>> +			cpu_map_cluster0: cluster0 {
> 
> I doubt the code that parses this will be happy about not
> being able to start from 'cluster0'
> 

Good catch, you're right. parse_cluster() in 
drivers/base/arch_topology.c walks "cluster%d" starting at 0 and bails 
out on the first missing index, so deleting cluster0 and leaving only 
cluster1 means the topology never gets parsed at all.

For v2 I'll delete both cluster0 and cluster1 and re-add the surviving 
cores as cluster0 in the Kalambo SoC file, so the scan starts at 
cluster0 as expected:
   /delete-node/ &cpu_map_cluster0;
   /delete-node/ &cpu_map_cluster1;

   &{/cpus/cpu-map} {
         cluster0 {
                 core0 {
                         cpu = <&cpu6>;
                 };
                 ...
                 core5 {
                         cpu = <&cpu11>;
                 };
         };
   };

Does this look right to you, or would you prefer re-pointing cluster0's 
cores in place rather than delete + re-add?

> 
> [...]
> 
>> +&pdp0_mbox {
>> +	reg = <0 0x17610000 0 0x8000>, <0 0x1a980000 0 0x8000>;
>> +};
> 
> Are you sure about this change?

Yes — confirmed against the SoC memory map. The Tx window is the 
NCC0/NCC1 mailbox instance; dropping the former cluster0 moves the Tx 
base from NCC0 (0x19980000) to NCC1 (0x1a980000), while reg[0] (Rx) is 
shared and unchanged. I'll note this in the commit message.

>> +&cpu_scp_lpri1 {
>> +	reg = <0x180 0x60>;
>> +};
> 
> This is specific to old firmware, at least it was on Glymur, I believe..

Right, the size was bumped permanently on the firmware side, so this
override isn't needed anymore. I'll drop it in v2.

> Konrad

