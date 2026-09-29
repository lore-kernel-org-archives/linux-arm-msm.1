Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61E751DDFC
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 17:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790702849; cv=none; b=DjjGdMUuEDeeA1BhQrqHKxyGnhhnPk5sg3tHzrIRPI08jz3NgRlrwT9pvAd+N1KLEPWV/2pD5OfdDu1wU2GCPpT8+0xHGnMp9ENpRwLgi52FOBxhn/ghMdYJvBSOjtYgxY7KGC99RJyKyaEBFfl2KI0FkVS0JPSsnFC6hGytBEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790702849; c=relaxed/simple;
	bh=XAr0ib5BIPLtsY2IvBczHBGu8cAfEMxCkyCJpApDgVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OlQUYqAGW7bQyN9Njo/RVNx4TosM+82ZUrw4FBmeB/JBY65YToyU6WJGd5onUHTSmzuRRcAz1lQ+QiM7WuWq7+T3bStYOkaVUzhP5kvm85BXJHGMBASdLdfjEdgGGXSJdoJyvF/TMv/A9idJgQvFY32FCMV0SzfJ2jAxcgTP574=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0PhfIzm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QYm+PbIr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0PhfIzm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QYm+PbIr"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TE5iYX128746
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 17:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u3SUEE7AbKzsNjWqdW9tpkLCiHmZCXAa87H/nM0eXMM=; b=b0PhfIzmOk/QmqOk
	FVyf9GPr4FheKSIazX6ZpB5hFQNl6tKAh5GNR/d/ZVbzld3wLYDvfdGjOyQ3voKI
	XJfEGMIT36vPoGXzXRJFpyFaCryKIreS5dNbSqvqXRR1TsW+odAvrfpYModnZuhA
	dZDb6IvoP4Sc6Fk06dQRWW2Xbp5ITvRx3P4n94xXEaatFET1PQFBtZlq2xEvIpH/
	9XxzPTSFCkSyf4/AWpb1CxgjGQguInWfBvsNK5rYdhbQ5+kBbjEI7kXOh1lQPPzA
	NA6GdmQ7BdgKVKd9JLAKEPxGFoYWVT/utozk0x0IY+o1HAP93KM7G4qSUQdprqbB
	z1KXMg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0eswgxwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 17:27:27 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso3015827a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 10:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790702846; x=1791307646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u3SUEE7AbKzsNjWqdW9tpkLCiHmZCXAa87H/nM0eXMM=;
        b=QYm+PbIr33DYRmaIm51yyoqJ6mEWuu5C/TUPGsumhBuXi2fphCT5kPcOIFp5ckLBy4
         WTA2adPyJhMt5Ja+rtTo5uqL38zWrqZa4jDmBpqylz3qiN9ZWy42tiFonibrGBZn7oEe
         DIud0/3lP7oEjerqzxoHXXFYh0Ekmcloz8aZKhjfKa1urBg2t3zyegYFo/Tis0w0Gosl
         +yv7/9g8GOUpmmRD9KOKsq5mbdi8ygtqb4ibRsGxVBj1Yega2SJDTRTxIIg12Bn9Ckhe
         QQjxcBy4PL9Dh2gze+e5sjBAerphqD80gv0XTcZSV3Y5VWVRh6ogNXoUSQArnp1Ux2DI
         XvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790702846; x=1791307646;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u3SUEE7AbKzsNjWqdW9tpkLCiHmZCXAa87H/nM0eXMM=;
        b=QvD5jJ3bDA4oGgXrY8JklQVuXfl28oqKvEdGFqUFTDZKf7aiSDLWzBYPyfKVcJzPCD
         xjxaDikfw3hb1XOuZnbHaRoDNOXvJu0QNwWwh7x6phpWWG4LK4uuIlRBtl2ojRaIAXRG
         P1MNtkSKenLwdIPlD5GGnljMiYeE5n82PD3qVN1H2Yh//kvUbtfOJ0ov0PwLOobd2+Fv
         OqFZ8i7jBPUHfFRUAMqu8WPkWz3sFJ4/TG1aSpsHKwS/IiLgvUyMnaJVE4DCTETZTiYa
         6qUeuZ2qDX1YbR1qbPDQWaOooH2XTOG/8wXEYVgWWWvKVm8UytCFAKj/5KBveHaQPNd5
         jY1g==
X-Gm-Message-State: AFuF++kf4Bf6ADEoyPrAeW0bZ0+xR/cFimuEkhbiJIxqhwWTC5zPBujT
	z2EOfwTrgoN4ustkMQi94jN6lj9agPyRZMiyZ7pzD4kwc6CEU6j1EzGW9HMz/QHu8KdzRKsJ3Di
	u7ZLh2y2IritslLC7R5WDY1lzfTKiYvU0IH1pP6zgs6iqj3OUJiQR3bDD/dxgWwPv8nmF
X-Gm-Gg: AYBFou379jJSM/YRL+lDXRaDHfnlEl4WlP9uadHtlFLmFSJnuhS4xsG6KK6tAeF9c01
	m+QAI4MEhVZyLN3kbexcbZupKYIzt5DSRhcP5aormJ+zOifFx9U2hOze7lcbkdkitMfMB1/KtF/
	P5LWFAxEVY7bMU1txXN3/0rLsXXGyiOCT/lldJy+f8DCL3IrdvgOqneAOyo3rDzfGLTUaC/kgkE
	kPQSi6uzR/qmFTlSwhVQWG0PJEYov8y+PWjmlfqEIuMtPMMxEI6f6nc47CVDaSRrJdibV7cmoaD
	+gGlLF2gpSZa9GMH5w4Xot+5BIsCks4XSKJFKdbN8glNTnbqKys+TEUCBVsTdPqcbNMj3S22ru0
	FRrrMAKKD+NlEaLETEVkWSPlGa6MHyALp+T2xH+25w+M=
X-Received: by 2002:a05:6a21:398f:b0:3dd:85aa:d26a with SMTP id adf61e73a8af0-3de0e7f02e6mr14024791637.34.1790702846568;
        Tue, 29 Sep 2026 10:27:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:398f:b0:3dd:85aa:d26a with SMTP id adf61e73a8af0-3de0e7f02e6mr14024769637.34.1790702846060;
        Tue, 29 Sep 2026 10:27:26 -0700 (PDT)
Received: from [192.168.1.3] ([122.164.83.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8868c9d62afsm280619b3a.44.2026.09.29.10.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 10:27:25 -0700 (PDT)
Message-ID: <b77e8d79-fc90-4bf8-835e-23e84198a008@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 22:57:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 00/11] Add a few minor enhancements to the
 Qualcomm IPQ GCC drivers.
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, stable@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
 <179065171028.2673486.10540547681271836423.b4-ty@b4>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <179065171028.2673486.10540547681271836423.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2OSBTYWx0ZWRfX08fOcodCwx9p
 xc/yApGDBWqnN1qWE2OCNI1GYvzDJoXfMd48JdXiYzNwDrFZxmI9IUmlCD/+5ELzRg9cJkKWff8
 4UEA0iS93eNJcJSgViTJJHeA09nNxJ7zvas2gPf3bnpRUaV06LRmfDu0hzmUpThKiSfZIkTdl1D
 M9NFnxU4dJlZ3B8SJPxJNrO9tAgL2oAUJ/Zfl7ajgvQFeeAy2m754hoBwzmVBkdCClwjg+IPTZ8
 F11lUgCGSG8DUDiWKMYVuuwB/xTnCBNbFO/o2hBsFasxQJiXGaTBCnVhnpc2X9LCgsTzVV2E23f
 y0K3xE+x5CZEnv/dVpofDrNwNRQYQyqKzq38ekJYVfpHemVkoc4wkBgVOuYuiNU90tg2begxxqz
 GDFqSqzOgWMljicBUq28p1aA3jeqrTrMHOv8iQEmMn9NFOX6BZPkNoRfreH+lRgZ4Ls2880O+9P
 q/UokvYAIAj7gmbUmLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2OSBTYWx0ZWRfXyyZVqKB1isM0
 TYy1JxMUh2bQ35ctR0h8h6Co6MexxDu8mc+Py7XXhsq0niMf6OF1hvkMxNlLIpmYjWaV1x25I3T
 L3MT6fTQoWXH7mhAQQ6FLlQGUP6xU9w=
X-Authority-Analysis: v=2.4 cv=LaWpeTfi c=1 sm=1 tr=0 ts=6abbf4ff cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=1HAn/k65X8NeSyO5TsuCIQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=NSf5Sc59ZZly-qZ_PXUA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: ZeyyLhqUraEUdetPiXMk0t3sYlecGdUa
X-Proofpoint-ORIG-GUID: ZeyyLhqUraEUdetPiXMk0t3sYlecGdUa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290069


On 9/29/2026 8:44 AM, Bjorn Andersson wrote:
> On Mon, 21 Sep 2026 11:49:33 +0530, Kathiravan Thirumoorthy wrote:
>> This series adds USB, NSS, and clock-related updates for several
>> Qualcomm IPQ SoCs, including:
>>
>>    - Configure the USB UTMI reference clock to 24 MHz on IPQ5018,
>>      IPQ5210, and IPQ5332 to fix USB enumeration issues.
>>    - Wire the USB3 PHY PIPE clocks to GCC on IPQ5424 and IPQ9574.
>>    - Add NSS MEMNOC clocks and corresponding clock and ICC IDs for
>>      IPQ5424.
>>    - Connect the IPQ5424 PPE clock to GCC and document the required
>>      clock input ordering.
>>    - Add UNIPHY XPCS reset definitions required for NSS support on
>>      IPQ5210.
>>    - Fix IPA-related typos in the IPQ5424 APSS clock driver.
>>
>> [...]
> Applied, thanks!
>
> [01/11] clk: qcom: ipq5018: add 24MHz rate for USB UTMI clock
>          commit: 0fe2995196a5973e226f506c9ec705f0dccec82f
> [02/11] clk: qcom: ipq5332: add 24MHz rate for USB UTMI clock
>          commit: 33e6a4864ddc4824f8a9505a97232b7879eb5528
> [03/11] clk: qcom: ipq5210: add 24MHz rate for USB UTMI clock
>          commit: 0336b65aef4721edbc01073dffdf9bc12673f0e5
> [04/11] arm64: dts: qcom: ipq9574: Wire up USB3 PHY PIPE clock to GCC
>          commit: 117d8d40be1ded4f35f3252efa83607a7134d5e0

Thanks Bjorn. Patch 10/11 and 11/11 are independent of the IPQ5424 
dt-binding discussion. Since those patches are not bug fixes, added into 
the last part of the series. Can you pick those patches as well for v7.4?

>
> Best regards,
