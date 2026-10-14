Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE713CFF6F
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 16:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791994218; cv=none; b=tM+1FaD2vlfMHTMHMRl3XegynWOpuW43CqWDwKmGcPbqQpa4CUaNFDQVUgUayiS9/Yw1CFar0dlwp236/pG6HHkH5Xy00Indf1o9dCHcuRQUizcTHPXeDytV8qijS/c9n8SXGOHxp+iktdmnIgMZtJEPkqsmKjm2BtP506b23qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791994218; c=relaxed/simple;
	bh=d9AZ1icpKYyYzs2G88pYV++7oRZ7y7xW+WF6rTZ94hQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bC276wuOFybxzyZTi6A0FkZAdslEgt7CYZUlNNsgGerF+h07YitMdv8nG1rG/JEOLHC8jI4i0txybJnrpbwywZ02e+9JyIPZ9pO/fNUQ11jlznt23fn0UVSL42XeUfcUDLuiNOmsnIWMq4SpeANzzSg9i3OV+qHvmcun0i9jAMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o1qBldYU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aJ0/26cv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o1qBldYU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aJ0/26cv"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEb05Q905381
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 16:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qj/1rZNvt2LirJIMlx3gBCi7fV2daYoXIXFAvUvD/kw=; b=o1qBldYUgfBT0Wyj
	lXIe2uKqgeyhqOtQPoGW6iuVtRynAPqqzMzlW2wXqn1A0W7AxuOgGZPv8mk7OwfE
	7aNrA0jCQ/E+nM8M/4UbJwO+nkdq61lXxvMRUYKZhz9Trv5vmfmXNMRHoVCJ3PMa
	aw7zV8neGhm4Tiu4ke7TgQLi9dx6LYcvz0U+8GScZEhDInP8fPRh4BxjX8hgI9To
	sk2IiOleoupJzsDZBjNz7IGnZe3KM+oj9MPWpTljbxFTU4W4TM8eCJNyA612FqFe
	M5m/4OWHOQMNIyr2Wj1k8sHwSBsF2PA0kTt5SMGm4jjnZ76pT8VOaq+hFHXSLt+/
	lvokBA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p2fhg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 16:10:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a8af172664so538934a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 09:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791994215; x=1792599015; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qj/1rZNvt2LirJIMlx3gBCi7fV2daYoXIXFAvUvD/kw=;
        b=aJ0/26cv01m92AxYvpERc4rKjvkVyJrb2IMsxvYc77UxPw8+2uXv8hPjj1z8dq+ul1
         qt3SWamSOKrOkjJsViKRAmuQsl4UwdNCjEmE6Ech2UM1s6hyZu8r6V43wQAu+WveFShK
         7UpXcWdQktfDi7IqjOShNKU2dJjgYWUlZmqVNsYkvGlOD2g2StzxgPjrofkbC1qFXztb
         DMWF1reBWi+dB+qS4K0l/RrCU0CEvvZpc4ZRF89NfueDQF1LlHwX0O6jbq/7pUzehvuV
         t80A1sZD19CRFQVMwlwiqDFY+ePRNqq1oLAsIp4ouJj0hWdv2dtET0qPQDF0iOz+CqQG
         eGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791994215; x=1792599015;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qj/1rZNvt2LirJIMlx3gBCi7fV2daYoXIXFAvUvD/kw=;
        b=umQd4XLmhT6rAUoogg4OMmQpFks/WpirNTbFAx/7ZzgaOYQVPDvLlv26xCnGHfcFe6
         xuEr/SSABw9LoNoKYAFMQN81J5va9fRgm0l4P7Dc95q5+IeqQQiagjvTkIn13JnujfkX
         VHLSeaYasjqAzI7YlKXWN6OJ0ira0/etWOdtiDYXrddI6kxWS5CvICK4hAY1P6srFW49
         nT07JJ5yuE3ZNnvNYPjKWt2wJiEmXpoZ9MeI1cKD7K/WS7lWu6gwgNpm7rxbSPG4+of8
         0XorzVf8Eo1jdMiiixk14kiiMQy9lOYIppvm081crduKvkX7rFs/qyLaeOKpAJOzxYnh
         xQMw==
X-Forwarded-Encrypted: i=1; AKwUvBy+PM5HAz5MhwUtXzr5CgC/7r7/e3IrMfod6CF1hmgVfN+Mi4+20urKQcL39M391J9bQH5FnzMsGMFwaoOv@vger.kernel.org
X-Gm-Message-State: AFq9FYLCiHiGfzEXAVQgg0fERT1QbOZHCsPZAsVewoXhexO/3ya3asmY
	hpd8IbFxjPxkduOQ2Kx2iVUfe7JDMytYe/9SowZGzlwL5lEKpQuhYiv3qkdmWYD9Mpj9ZaViERQ
	8yPT3/UUZvyMOVON3ZTcYpsSHn2lZOW5XhOKFOQdyllV5xNbv0yGe/Gx079NjC/UtCblY
X-Gm-Gg: AYBFou1Ga5iP0hwT5Y10EEFtZ4ziexptoYfPCTzTsJboN5LUHQOeCHB8+rMpzzJBDKq
	aQ0poMC4/DynJao31Yy8PPF7OgCogByt8JkYHrBw6z7PFPS1Iz1YIHFnUmTZFgsbzkidegJiMkR
	wL/r20H8Pvp+eoEkTghWcp7UIhZNOzEdEtZjlEOmFv+vpWHqBvYzpkz5fyDG8PQ6Qg+Fe2ioAUu
	9rMqnSKjrtAANqnT9pn/bPkOaa6spK+w9FJ0mpifesnFJA19nTRteo9Ee52R4OceZAfBVx61e0Z
	0utpcsr81TsuWkVWfGT0DJHd8RNVesdVeVNaNTUmB683MEMc4bauenVpSMjCOfXu2J1rDFfJlVA
	a7d/mubDavOXTdIwsEB+Pdd7cPhkV1UxegTSGf0DHwv4=
X-Received: by 2002:a17:90a:bc8:b0:3a8:545a:9e87 with SMTP id 98e67ed59e1d1-3ab3a747e4dmr8849403a91.15.1791994215114;
        Wed, 14 Oct 2026 09:10:15 -0700 (PDT)
X-Received: by 2002:a17:90a:bc8:b0:3a8:545a:9e87 with SMTP id 98e67ed59e1d1-3ab3a747e4dmr8849367a91.15.1791994213975;
        Wed, 14 Oct 2026 09:10:13 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.80.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd635c9792esm49825a12.22.2026.10.14.09.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 09:10:13 -0700 (PDT)
Message-ID: <35bebc3a-8172-4c55-94a5-18c4047f7090@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 21:40:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/11] arm64: dts: qcom: ipq5210: Add ICE support to
 SDHCI
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-6-77bd3d68d850@oss.qualcomm.com>
 <a7f04052-37d1-452c-8755-013e6e16414b@oss.qualcomm.com>
 <as8NHH4j2SBkDYnC@hu-varada-blr.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <as8NHH4j2SBkDYnC@hu-varada-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NCBTYWx0ZWRfX+6NOPVSZdXVS
 Aa8fyLt3E5nq5Cc5OAwqYrgAVnVAIV8WFu/NRF7mQjyQJrPvorx3aaLMgAudeuiEj8OzKQK1Lu/
 p4BtodzPBajyo8Ii7nBHNm6lS6IMJDM=
X-Proofpoint-ORIG-GUID: e5Wv_OI8woSFXddaJ47Nqf2jDsjnEQLZ
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6acfa968 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=vSQal4Cqo5fxyC+YxRTyzw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IlWm7PwFmQ6qje7k7KsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NCBTYWx0ZWRfX0VvIIJgObYnm
 ryEXPalGV6gRm8Ov6X/1+s63k4UrUCTYq3+9JTiqWyJb83cdJ+LAV8S7uR8xRuCIala28A3zk9B
 71Ts/52DV/FskW2Ougf1O81FtOw0qJPlRZ6IM41pzWbdRxCyPq4SXCPmxFbeosYhNmWlV1Q1eSu
 tlhgZjceVVUah+Br1CNyYW8zJqQkGTGPHm2qjT+/c0LY2TfDCG7MJ3cY/h/e9tgG5vcwZI8BjuP
 QuYzeSSFtmYUxdiM49gUrF0EIzrJFlRk1AoF9i9H55XW53HT+9Lz03UsVGiydJluLyZZ9qEVN/x
 GR32WiCv4SUJt68TtnC+l4q8dT8xemHmrzxhX2hv80HzjGciCguCe+hTKDgFmRoyIFuGw6JSFiU
 a92dkp8fBks6JOsPlsYh7aRGDAbbueqn01kZY+58TitcGlaZ8N1Ac7dI+Nn3uyjUI/kH736tR5u
 jfbcnIMDd/zi3IN0rZg==
X-Proofpoint-GUID: e5Wv_OI8woSFXddaJ47Nqf2jDsjnEQLZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140064


On 10/14/2026 10:33 AM, Varadarajan Narayanan wrote:
> On Tue, Oct 13, 2026 at 04:43:36PM +0200, Konrad Dybcio wrote:
>> On 10/12/26 9:23 AM, Varadarajan Narayanan wrote:
>>> Describe the SDHCI ICE register region and clock, and enable CQE support
>>> for the IPQ5210 SDHCI controller.
>>>
>>> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/ipq5210.dtsi | 15 +++++++++++----
>>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
>>> index d28d68a10958..c14b42c22616 100644
>>> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
>>> @@ -416,9 +416,11 @@ uart1: serial@1a84000 {
>>>   		sdhc: mmc@7804000 {
>>>   			compatible = "qcom,ipq5210-sdhci", "qcom,sdhci-msm-v5";
>>>   			reg = <0x0 0x07804000 0x0 0x1000>,
>>> -			      <0x0 0x07805000 0x0 0x1000>;
>>> +			      <0x0 0x07805000 0x0 0x1000>,
>>> +			      <0x0 0x07808000 0x0 0x2000>;
>>>   			reg-names = "hc",
>>> -				    "cqhci";
>>> +				    "cqhci",
>>> +				    "ice";
>> This should be a separate node, like on other SoCs to allow things
>> like frequency scaling
> Not sure I understand the comment correctly. I checked agatti, sdm630,
> sdm670, sm6350, talos DT files and they have added the ICE region similar
> to this.
>
> Can you please suggest an example, will follow that.

Kodiak [1], Monaco [2] has a separate ICE node. For the frequency 
scaling / OPP support, series is still under review [3].

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/kodiak.dtsi#n1085

[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/monaco.dtsi#n4883

[3] 
https://lore.kernel.org/linux-arm-msm/as9ksJKk55wYuoOS@hu-arakshit-hyd.qualcomm.com/T/#mf3a36cd811e7933bfa184366aa77b3f335c5a3ad

Konrad, I hope you are referring the same.

>
> Thanks
> Varada
>
