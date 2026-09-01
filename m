Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB2437AA91
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 06:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244909; cv=none; b=Vyjg26PfERH1gIXot86O1YwIObrJCkerF3A5OIQ577jtzTzgd9KRwXYrlI/P8vOcVTMzB+9jYhXda6Tf6l1uU/oVYLmBjwECi3Ybg0N+oSHi8FKosH26s7Y/ldUHFXIewFsm6UISsVld9lFJrWSDs4UrJHi5s2jlyGMDSwhIGFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244909; c=relaxed/simple;
	bh=yv25dNvbmF2jovmXJltSt/bO04w7YhADkudbSxNFdrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HVB1Kgn+JFFVeTZh6dRRaCbrBIJL1R76280r0u868DLFrIr/RN5K5hMnFwUi00h0HEPSZ3gtIWLBi/+DSDgd7kxV2tlQf5qdp0Q+xBqQ/hfiz/f+KAlRpjM/7VfX9SB5EAgDHv6W2ymCfiv8Z7FxgSkZmg+0CGSW7RyHx4Dykc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BzZnW15Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y+3ItXHH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzZnW15Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y+3ItXHH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6810o1Z5500014
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 06:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mBmtNPoEtLv53P7QYpUKrlSYDCg6uvRG+fRo+D5U/VY=; b=BzZnW15YPjfK1/GK
	txgN0NKCskhKY0G9d2fA6dL54E9CMiOouIRoPsTdB69JsYDzpyFnF7f2wCL4Lf9X
	H027rHofqsmnTRILUTq2XQVynnQiTEwluH1hQT+xX1/1o5Sbf6iKl/B3dvP4jf0u
	5aSUeoC7YJgBrG2swSAQWaaUdvtIf+XxzUntRuigB7D7mqMBqZXQ69DphM4l+IWI
	yvNcnAhqucROg3zEuUj1eVSvFCsxsUw8pqM35PBEPo9qeqFAG8uWBxS7bzh6Z3av
	dbGPrFMAePuvRveV2sY9eZQUEtkYhd5wGJdTI3sKgksl093WjFP0HXK7WdiPs+ZD
	64mSaw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdjtx1nku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 06:41:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so7615725a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 23:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788244907; x=1788849707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mBmtNPoEtLv53P7QYpUKrlSYDCg6uvRG+fRo+D5U/VY=;
        b=Y+3ItXHHu78H+jWhsOOwiOpzEvrMzpE+ATtl8W9VztbDAV4In9tT7EXJ7aiyVv+bZB
         TUAlt77RomZ+w5/15AZev2BCVtDBULv8ySFvTuZZnI6LJTXL/y+4BZ5PVxIETTOrCWjv
         pBfCMzeV10LiNUvFbVLyr7li1XqQjOUkwtp4j5DSk2bZlw3UScCJ/TYqLuo5fANFS2Qv
         9voo93vWYzxVzWiSWqDylNx/x26h4KJUgz24kuS3QN5DedQzPlwpYqyYgwYSSuNQia1h
         j+ilfPV1LBGcSM6RgUGEUBklFcaWfKDFfpvjmLluS1goG9WLT9MgD+bctvl9LUXS0WFg
         KTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788244907; x=1788849707;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBmtNPoEtLv53P7QYpUKrlSYDCg6uvRG+fRo+D5U/VY=;
        b=qHpU3Ve8Bg8fGMSfert9GwF0q8K7Z7raKom0heJLF6uZf1yqcfQ66070q9mOlqAtb2
         Ksj4ChdDPYWe3gjiD0dCeQlbC//jdAucYJt8qbvqnApj7Wr5pu/rE71yptwp3rPzEVa0
         J+rprmnUNMzC1a+STmhlaF/9OYNIBAwzpLcP5RDHsp9SJsdRbwkS/Zt33gYbIsAMstmB
         teed3PdnvnHM6HzTQ6di16/5RvKri5NZoUFmjfpv/uZ/rFs5uafM4TEMqNKKHWAUL8QQ
         70AN1pXtqKUS04srcmKAXi4wyUI2z62RGAXp2fp3NUgCZ//E4besWigfVBoIhK/bTnkI
         pdBw==
X-Forwarded-Encrypted: i=1; AKwUvBwe/LzCGB2tv5XDdHs8GaLtY09Ky2cru4ZyXaxXNJBw3e0CIks2KrTa4Twr2/gU739DDMV9aZZ6I6keH+5F@vger.kernel.org
X-Gm-Message-State: AFuF++mv5KL7EM5dw6YhQYvNp+zl1h/C6yNQoE0kXlp5/majlPaqhwQm
	7k5sOZjgyWWyJYdA0Pk7xNJOsbq2Zgry2iCtuJx9NaN9kVNE4p3mc+iDZxx5ychufyzTzqS1FkY
	9bFf96lVsjTZTAwVjLC3ptr/45ccqqamL6zmXUx2aiRtLI49kNTSfWN+8VGgZpMl9+o+g
X-Gm-Gg: AYBFou1ohHCWl0cVjTkNmruf0RLFg29+GqTqJD0B/pcCNLWOdZI3TJMw5P2Nyz5leP/
	wIDYR0EHlaLRCeKeWmZv1JE3EZYQWWZU1FPAcGTqXr0SesN5kG0jEpHTdyuAfJk+INMP3+1cgJI
	fqe3ARiNS7mY9sazDiBmIg3aswz3d7OKMd5ImhcY+dQBKVwIt86XCjup6up0bNVO+gTOmVS8iQk
	tb58f7mPlq9jZVoNCBBXoo+aYCoI1yBvoBPIiCYwB7uJpFCqISaUuYO44dTJSDxRZgvDbtP9epK
	T3Ne9sPkIORBu32bdIQfxuZI2zs/AM9aDGr4ht8MgOb8a2ar9m3Hdt6fmBHqXtMHUj7Gz58sDrf
	mIGXv/VBHnTaQJS5rEn1DyOnd5IANESEO7b3GN7C2hg0F2HRHq34IuldKPFdDCnTfIw==
X-Received: by 2002:a17:90a:dfd0:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-396d0fccf78mr50804735a91.13.1788244906845;
        Mon, 31 Aug 2026 23:41:46 -0700 (PDT)
X-Received: by 2002:a17:90a:dfd0:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-396d0fccf78mr50804616a91.13.1788244906377;
        Mon, 31 Aug 2026 23:41:46 -0700 (PDT)
Received: from [10.133.33.152] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d29af238sm6427732a91.1.2026.08.31.23.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 23:41:45 -0700 (PDT)
Message-ID: <f7bf3408-6d07-4933-9610-d0719d429ffe@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 14:41:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa: Add PSCI SYSTEM_RESET2 types
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com
References: <20260226054113.4156874-1-xin.liu@oss.qualcomm.com>
 <abqrLY8mLiAGugPK@baldur>
From: Xin Liu <xin.liu@oss.qualcomm.com>
In-Reply-To: <abqrLY8mLiAGugPK@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K78S2SWI c=1 sm=1 tr=0 ts=6a9673ab cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=msPNAV2qm2yT9iC0_akA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA1OCBTYWx0ZWRfXwnz2YzEi1/d1
 I4Yvi1iAUGsj4viF3HZDo5Way8Szz36HPP2JwzVbVkrCVlyvymS5w4kwPn89MbG6aQZ0IBFCEva
 dtcNWd90i8GaxPWhJjgmch838zxBOGs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA1OCBTYWx0ZWRfX8fqoV+O5WuJP
 1IDN84ZR5Ngc3ETqdk+yMWaj3LrINiyDS2j90wK5r/SK81W14yEkvz0lEh/zvQ/r4uo29HUK2ZQ
 NoqA1fpBzYtTGK2y4R6eVjCeHc9lWjPMysj3ZLTqobjvgCZmcLCrWshs51graUwauAWuNHFBzHj
 BxjrYvz2z18Qv2u6gc4KedrZdSl9cMFhUFOiybqiXactTFjv50lMsw4hye3BWOiFM3LIpcfYMwG
 8iods0Zpg9+eLISnqgo06Hnk2FxWyz1l62UYqIAkhXCZnvsw/Dsf4Y9+RUrW4LGg15t0WUiAqn9
 gYiUKpCY82mAtaUXtoZ1y0nlKZDPNLx6igswbdHSm3JDZY+3jRTxnB/OT3oh+2pXE6OkyLXRsij
 OK71xWwsrxU6u9lE7O6KbDEW0JSZV87fI2qhCu5Yy5T0/gTOY29XmorIKli+jDapQ7hNIcrUIcW
 lNDefulGdG18pL2/x4w==
X-Proofpoint-GUID: n50phoIpophBh5dULgligBOjOquWo1px
X-Proofpoint-ORIG-GUID: n50phoIpophBh5dULgligBOjOquWo1px
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010058


On 3/18/2026 9:42 PM, Bjorn Andersson wrote:
> On Wed, Feb 25, 2026 at 09:41:13PM -0800, Xin Liu wrote:
>> Add support for SYSTEM_RESET2 vendor-specific resets as
>> reboot-modes in the psci node.  Describe the resets: "bootloader"
>> will cause device to reboot and stop in the bootloader's fastboot
>> mode.  "edl" will cause device to reboot into "emergency download
>> mode", which permits loading images via the Firehose protocol.
>>
>> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> How did you test this? I tried to apply this, but I'm getting 52 counts
> of:
>
> xyz.dtb: psci (arm,psci-1.0) 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
>
> Am I doing something wrong?
>
> Regards,
> Bjorn

Hi Bjorn,

Thanks for testing!

The warning is expected without the companion binding patch. This DTS 
change depends on:
change-id: 20250709-arm-psci-system_reset2-vendor-reboots-46c80044afcf
from Shivendra Pratap's series, which adds reboot-mode as a valid
child node in Documentation/devicetree/bindings/arm/psci.yaml.

Without that patch applied, the schema enforces additionalProperties:
false with no reboot-mode pattern, causing the check failures you see.


Regards,
Xin


>> ---
>> Changes in v2:
>> - Fix mode-bootloader and mode-edl reset_type
>> - Link to v1 : https://lore.kernel.org/all/20260209042700.1186392-1-xin.liu@oss.qualcomm.com/
>>
>>   arch/arm64/boot/dts/qcom/hamoa.dtsi | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> index db65c392e618..a1bd8c3e4061 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> @@ -450,6 +450,11 @@ system_pd: power-domain-system {
>>   			#power-domain-cells = <0>;
>>   			/* TODO: system-wide idle states */
>>   		};
>> +
>> +		reboot-mode {
>> +			mode-bootloader = <0x80010001 0x2>;
>> +			mode-edl = <0x80000000 0x1>;
>> +		};
>>   	};
>>   
>>   	reserved-memory {
>> -- 
>> 2.43.0
>>
