Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475918;
	b=poHXqdNqwVx6sYGVxuVZeGKaoRuWhxvl96gpgpq2Xxsa93wRFKOmrJ1j9SIqUinNjNkW
	 pCVanDZ2+sQDQr6BfIEUbf42gkPjTClhSPFZcbmwsViINh9XY/3JOCE6NkRboMafI/gAj
	 WDZUwMsniekNtwDSBgObUa1VaksWcyFGHMW1Mdq/qtsJVJVo1cc+1ynjBMxwLoQavmnIo
	 27z7EhJAFUYRefiutDIeuCj8H12FQf0LYlbJcjfHdcFyZJ/ENlLK42OpIs2y8jGINkdHM
	 caF0EWLj4cDxl9HISIbe+F3WmD6JPcfkOpA318kQAgfuGEP2dqC+Xpb1XRIOnbGnhYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475918;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iCuGPHtHnPRrKGh9BUttafHVJpJBdP30pXA4h8qbWSA=;
	b=rTlXJ1HmsD2qOIXJPBU2+2FqE5uoLXy8qSY0hfrbmIh3uWAEWIhaqyGC5tlOetttkvpL
	 o4QDH7HLn8dfG8f9gnJ+IZ9lhSUH7TUtZxV8nDbS8mzr3j4FQLaJkmuaT/WrQqHUAhAg/
	 Dw/Ie2IYspNy3osV84rHM5trmsRYbE/zguPnPlZap3Pr5sjJD4JxJR0bZJfYp9KyLGrxW
	 0Z2pDpI7X/Tb1f/BcWDJBePQ5neWrdWFVyxuBzDsN05Q9FmplSYvIdX8BqcX1FE1cpa8p
	 hdiBAW8MDMC38fi+/mhuvRMhXZsYby5E2JDrKYtzBqtAwqggSPDLTU1OLGR3O0fMgmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="D7CE/Tbh";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f1vYyHGU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E03606A89C
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66E03606A89C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D7CE/Tbh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f1vYyHGU
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC53iAj3476750
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iCuGPHtHnPRrKGh9BUttafHVJpJBdP30pXA4h8qbWSA=; b=D7CE/TbhTazlPtzH
	NyXnko+sJjN8ZOueSlXJCSYCGpuwEfGMnxBmv9ZMBzD3Lzj6w3fHLna/jJAkLm0S
	9xXZnaLviW/cBwhqRvjNF9udK886qUkyh4iqu1qIcVUP4WDiuyVb6vQRQEN1d7DH
	oFbb1XZV43MnKVCZJB3TY8AI5B8LCUbS3KMZBbsO+d2clOxYOD5l067hzfn/i1D9
	5e7pcXSXmK9LHaAv0McfZ6Rcf/hjjfvjRvp/ZGtCdJ62R1h1Yb65iHoSSS3Y0FYi
	kYpUkgDMWE8n14AMEd0H3ElacOSeLlwexcYonOwwAu9VUfzA6YKmiUSNvaDHqLVT
	Cg6J/Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yugwv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:31:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0f667a666so5694290a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 01:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794475917; x=1795080717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCuGPHtHnPRrKGh9BUttafHVJpJBdP30pXA4h8qbWSA=;
        b=f1vYyHGUXqiLqzGdXK8nuXhwV7obY47U/Usfy+R75vioJBArxC/ZnA5gAn6sZ7+qE7
         ofIl8tmKxtjqiE/FfmCzyEPp5Cl/6rA3Sc2B62Ezi6R0oXJtsNjIUNvIH1lHjI8Z4khn
         0l7HuTgDGGq7fzfM+Zrw6Vg0esdH+60cV+InnZ2Byk9XdzVenKBbJFu/kmuN2hs/tSSH
         GrvRUZga1+OO9ElUYQbJpXZAtSKdR7L1TK6NUyUCdGm8CJKN1163ifqHgauWyVilVq9m
         2VDfk41SDWhS85a+fpiiqdElN5ZdlBKA9qUtiZEf/fR0YNBWUSies/i3gb0NSHxmpC6r
         2ADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794475917; x=1795080717;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iCuGPHtHnPRrKGh9BUttafHVJpJBdP30pXA4h8qbWSA=;
        b=OySI54aJx2I7korIhetbKrWB989XGWwPeNsT14rErK6N90VJbbC6MMJO78St2O2kph
         fr4B83Bf9M/ewkBmWzl+u8xXih7gJVzNoXZNfalKOgqeFeWz+6W/dUdlVPnDNaRXltYS
         u96pGU57H6iJLzv+uRYOrW36XWR6SVT/8cBet/+jHMWAroMYRVe9NussgwWJr4qJ4TU5
         92i0VaY7Yu09yjtuC/1pNpZ/cTr2wnhQzoBDwKqMyT8TVNV6CcCduabyq/jYaFCLMC5t
         FAS8srYFWIGrIOgMvZTkrrGtRJHt3x6Mjg3rHqp9aV+XIQTvx+K819H0scFPP0FHMPek
         A+0Q==
X-Forwarded-Encrypted: i=1; AL+hErEJKjPpWrh8DwocShcsiadPfRK9lM3hpEkcWhqgXnuV+/xptE3EaisHaXThSE9wa7SSbi4YfcCB0J2RgfC4@vger.kernel.org
X-Gm-Message-State: APuU4Z9EvSHwsNYa4buwMoNnMle/aZpsVmo5muX76q/I12pAg+PMQkQD
	Vl2iOYXeeXc4LMN2V1fwV4YEPrJZceaI2peOp5Xc42oizq6KASXHywArJ0ZsKE24KS3xkZuDDDn
	zPeaGx+vVBxBOvUhxUJY2p4+Cf8/NSkjApSQXPS60VVJaEQqaFc8j8Uh1VM884CbtNoD4
X-Gm-Gg: AYBFou0PsGVPytmI8sdV/7+QYp85709dVt1C7kwE4mG+rChkDBN2e5x3OJdtSinm5nn
	ZaV1HkMQVbPKFxNvZKYT37IZw7YBaOXl8UtmQtM3Xenh/wJ0jO4DSfpXSSbMD+R/crnskxjRPrz
	oiioPp7mRlJF8z8x6IMQ7vaww0fCQ5FtCjbi+QzwEv50lJaXK0ZjkEbMedXDk/laQTEkyrUmeJg
	HaflFeqNWHR/pkpb4nQuRPSw38cvm4LbpCA51JIqNS4ZF3iPzCmVjg16Os33N9k8wJRCd77HqBg
	gel+iGIsR9hK+fkWdEcjits4IQ0KN0NJny98IpnKUuJli8YVMwEaBgEst5VLcVQ11XBu9mYG7cq
	PIbscaZgLEkYP/an2SP5UPMc/3D4YBHCQ2LaLvpNzy8LJx2yXbZ7YBGeg4BQXIeL6taARLby3Fz
	o0
X-Received: by 2002:a17:90b:4c49:b0:3ac:9c37:9418 with SMTP id 98e67ed59e1d1-3b182e6f54fmr4910351a91.19.1794475916849;
        Thu, 12 Nov 2026 01:31:56 -0800 (PST)
X-Received: by 2002:a17:90b:4c49:b0:3ac:9c37:9418 with SMTP id 98e67ed59e1d1-3b182e6f54fmr4910327a91.19.1794475916412;
        Thu, 12 Nov 2026 01:31:56 -0800 (PST)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c9d7c1sm3869051a91.17.2026.11.12.01.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:31:56 -0800 (PST)
Message-ID: <f2b119c7-ba01-46fd-96c4-10b918f98d53@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:01:32 +0530
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
Subject: Re: [PATCH v2 01/10] dt-bindings: ptp: Document the TSCSS on Qualcomm
 SA8775P and QCS8300 SoCs
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
 <20261108-tscss-v2-1-d5f575010427@oss.qualcomm.com>
 <20261109-qualified-pristine-newt-ba1c0c@quoll>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20261109-qualified-pristine-newt-ba1c0c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: B7CfWiTZy6niVkJq8HU9ZV_Xb-tVdqL0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNyBTYWx0ZWRfX//R6PTmwsIjn
 Gv7HJuko0h5TvSpPeQ4t3W5ry1NzAJNx3mILDEgY6ru+LS3E3i4o3NzKUheRzVjdhiD/iFUPFkG
 8a0tnzgAQx5Ze8jEdS5BUrkMA3piFlU=
X-Proofpoint-ORIG-GUID: B7CfWiTZy6niVkJq8HU9ZV_Xb-tVdqL0
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af5878d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=-_rbqcG8Jwc29zszMZcA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNyBTYWx0ZWRfX2T3ng8yR/8X8
 zbUc0Jyp0PSIgY3IyXRFHALiNlOlUp09mlFjTsjnYBp4FO4gNExOVNlIFeQar+EwRAcNCqLZlU5
 t3vGfmcqD9/zKuILSdU8Xu4uCEpaeK4gBgNFAvD42kYU/GB17ozm7gGAqss/+GgjYDai0Klq+rR
 ohiDN+LIIWo0lPc4G1tXit3eG1M2LVVQQHmLa520k8c0Eod2V6SAGKYelbUiLowmzTokTXfOzLV
 VnoeN7DhjQi9JTedx+5r6B7galS5Y7ibdS5c1d59E3I3cadlW5bzRFvgvx5k7SdLi9kC5pFJmKL
 u7MlCG/ogWSxpolh/4raSok0WbbSTYI0bHe63SOiJyF3fSM4QLiHYswPiUHOpMp2ZtXR2gIgAcw
 c+yeMUR3q1s+4r0l+nnVOrE6W+or7GaTBT671rboCq1phC5iK6ZPebWPPOkOJ9aid0J4Cs/x9ad
 QKlL4n76VpqP7w1vXog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120037



On 09-11-2026 06:18 pm, Krzysztof Kozlowski wrote:
> On Sun, Nov 08, 2026 at 06:48:22PM +0530, Imran Shaik wrote:
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: qcom,sa8775p-tscss
>> +      - items:
>> +          - const: qcom,qcs8300-tscss
>> +          - const: qcom,sa8775p-tscss
>> +
>> +  reg:
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  reg-names:
>> +    minItems: 1
>> +    items:
>> +      - const: tsc
>> +      - const: etu
> 
> ...
> 
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - clock-names
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        reg-names:
>> +          contains:
>> +            const: etu
> 
> Reason for same devices with different address space details should be
> provided somewhere, preferrably in description. Assuming in the first
> place, that this stays because how two devices can be basically
> identical (same compatible) if they have different programming
> interface?
> 

TSCSS is a single hardware device, split into two sub-blocks - TSC and
ETU, each with its own register address. Every SoC with this compatible
has both blocks in hardware.

What changes is whether the vendor/board actually wires up the ETU's
external event. The ETU block captures a timestamp from the TSC block
when an external event fires one of the ETU slices, which are driven
through board-level GPIO/IRQs. If a board doesn't wire any slice,
there's nothing in the ETU region for Linux to use.

So interrupts/pinctrl/qcom,etu-* only matter once a slice is actually
connected. Because of this, only the tsc reg space is described in the
DTS patches today.

Instead, I'll use the "qcom,etu-slice" property to drive the required
constraints, and add reg/reg-names support in DTS by default for both
TSC and ETU, and update the description with the above details in the
next series. I hope that works.

Thanks,
Imran
