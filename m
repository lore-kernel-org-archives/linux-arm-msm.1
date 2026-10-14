Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A2454147A
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 15:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791993327; cv=none; b=g2pjco+Cq099e6EaVAF25fY1z1bmESRNjDWPPvSuKkC6MjY67Ct70jdufv61FG5RRXEozTJFWecLD3YBjq1DQUof4o9sgVIssunRkYFyybxgdv8fTHcs/3NrCCz/tzmwtGW1VH62xtgsraLM9e+Mz8cP72R8HYX+rfET41xbHQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791993327; c=relaxed/simple;
	bh=rwH+vdceSleIqKUqXbgH5DPfQMmo2ZUh+NLZ6kh6qGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UjhAKl8kcXa3fCmnjicSSMWL8ZfJ+dDldO4ICbznwRHgo1lp3NdbChTxACxgT+js3rzZy8JYW3dO/Q0K3/BVh4eL44OorCXGpbJkFIxVL8mxt5D7yxX9QnvDNP2RU4+43yNIGulBdw9S/XJm3DkSlmbBQyf+2le70JUG2xgaAdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fAFqYUt/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ICB/71Mc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fAFqYUt/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ICB/71Mc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEb0f9905401
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 15:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uPGeQth9uCLH66RWzaLiHg+7uRpJJUsd52ttuniNAo8=; b=fAFqYUt/JfYFnAtx
	Dkyqbrl4NrsTFgK+R19kuW5T55w5V2dZGOyWE8H0AyWAXq0xKxBRWjfScFXaxPZx
	V1rDcu3SuwYk3uwTMnGRvkBObFV4+F55eLklmceCz1vl/jVHWZSYinmm5n4Bt1iB
	+GJQIvDtBNcsz2SORcG71Uny0zJ0h7Aou7xi0TfbTa/EILYRibFc5a2cSP/iqrXl
	p/3Erq7UM1FnJjUQbePIxHrwAYJAhh4hIP33zxd9QBaDUUPt2eAEUiXEBrrH4GZW
	LbrbzvUXcG0mthMAtkeUamSvboWHwm4pfziwxG1lhWezp8PR9ajgcglwrRqrqBXl
	p1bAGw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p2d1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 15:55:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab1e771632so4412848a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791993324; x=1792598124; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uPGeQth9uCLH66RWzaLiHg+7uRpJJUsd52ttuniNAo8=;
        b=ICB/71McWjWcK8kOt/dxVbSevNIN71/Pwu4XOkpDuERpmZafnLkYhP2jpFeqGzS/yw
         dAHrxSYtiEMp6YP9B6otRtE3pBYS2LoqER7HbNkvxTXGIGZ3DlH7ZC5kJK46Vme/FyyD
         kzLOE05DCIBbmaBVdevodgUfadELs9d3xkrYOZa+yUs1smVsIvW8SqionvTKnb4g/TOD
         Xzo93HEUB3H/9n5PI5ASy6e8r2yL1ifMqZv0S3buEWnieIGbDBmWs91WamRavx2TKycs
         l9UANWFkM66zlwKIiUq9W+hmPpnZtc72RjaX/iVZY8r0ZF2ihCBDc86UlZlJzCeZlW/u
         0auw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791993324; x=1792598124;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uPGeQth9uCLH66RWzaLiHg+7uRpJJUsd52ttuniNAo8=;
        b=vjttwuBgRoRupitClCjjHbgLvC/aoYTvVPqO5WiSFhorP4F9ddMWlZxqW0lx7Gft/j
         lfswURi+XW7OoTfK+27wivqvecLJuCUo47+5Re3t+g85tEevWWpUyHyeOxCFklUVl72h
         NEW3sqWg5eQypV8y7d2zJaJoamoKbPqGRrMMgkj5taC2I15Ejf8hYJCR4I30hv8GPz9u
         31TDzhm3xestgMjt3Q5TaU2ImKSkqfnwm1UBitz/JI0hEDL8/pXKxmtT7TIirKDc6sVf
         w+zXsBsIvJX7jfJ8mqs7OXPvK092onewBoRB7GRz3S7WZJJjARSPGyCi4t02D18SvNG+
         Q2dw==
X-Gm-Message-State: AFq9FYIlHHpMElhQDdMBiEHiLcx/p1e+ptLhu5a5wox7kEgyD3Lth3Qd
	Vu21BUvhBmVS1wh/bSbfIUxNGovJC3o9RI2NVbLzMLtMRZ4xO8bBk0nnetP3hw70y3mjPzfoLQg
	08Ic5CWC232qXbAqFES1vIguo9cCDqaX4HDMC2C7zNwxx4FhHOakn8Lrudwkv/wdbY/ChNSQjae
	/X
X-Gm-Gg: AYBFou14Tu/B2swYEJLaMb71Ex6sqaD+Cz2hJYioO2GVshg4XKNB78HdzvcN//3cM8P
	uxq1SHWTm4x75iIceppTg6HOUw6Jl4SzXNNDfKuVZD624jQE9XC/XDrqqi1i9svt8Atk4+oLiWT
	9DJ3wdO8TGnIcidIjRiYj2dG43SZQ72Xn+LisZLkHVFcKJ7VX7CPtPa6PfAh3egquIBWzrVVBMn
	FvhMDVGoFjtc58VL1B638ZXbPUYtyPcUEv/Urbb2AKyai97maPtQHOt0iXGf6UUuJDpyQc80mhk
	pahFMBBqIjvbVeOHyig3YqjLW/do6qn4wPFTUS9C4Io+bIlkYb54/HQ4xQsyulmKymcP7U0UuTj
	fJEqSVJH42WaQOtyuDumkPoX6x0DhmbYJV2cGdcB7v/4=
X-Received: by 2002:a17:90a:e70c:b0:3ab:1a5:cd2 with SMTP id 98e67ed59e1d1-3ab3ac9b310mr9010758a91.35.1791993323653;
        Wed, 14 Oct 2026 08:55:23 -0700 (PDT)
X-Received: by 2002:a17:90a:e70c:b0:3ab:1a5:cd2 with SMTP id 98e67ed59e1d1-3ab3ac9b310mr9010695a91.35.1791993321018;
        Wed, 14 Oct 2026 08:55:21 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.80.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9307d287sm172932a91.1.2026.10.14.08.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 08:55:18 -0700 (PDT)
Message-ID: <0d5980c5-57fc-43ab-bcf4-f72f9e36318e@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 21:25:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/11] arm64: dts: qcom: ipq5210: Introduce RDP504
 common DT file
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-2-77bd3d68d850@oss.qualcomm.com>
 <5cfe6767-9097-4005-a78c-3066a2aef1f7@oss.qualcomm.com>
 <3fff91c4-b831-410f-a151-847ea407acb2@oss.qualcomm.com>
 <78480c25-6d83-4e70-a9f6-826760046cda@oss.qualcomm.com>
 <77b5681e-21e7-4a93-ab35-15554f7637c8@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <77b5681e-21e7-4a93-ab35-15554f7637c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfX3ML9Sw3n6ZlM
 j+8lNz7jDJDdTudFP1WKRh1Vf6Z59vzztJbcn+xb90ltzUYD3bCqWvRb5TZc/S74zQ6r0N0/e1R
 U5p3FzgpCG7wnSzkrSecn3t/PFsq4J4=
X-Proofpoint-ORIG-GUID: x89M8ifdmQjeifQQEmRgrX7_WVQeBgp3
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6acfa5ec cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=vSQal4Cqo5fxyC+YxRTyzw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=vn1o8rcWqlrXRnvXbFcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfXwrt0sVt/Blt7
 e/2/PQQfIx4sAVP8JYjSQ951AO4IuV1tvWi5HaXN2GGhAz4PGDBmg0GYbia0Bnu1OPU3gQ6m88a
 a1oJFImQsdPgM/vfOAfT7FLpQMV178BfId0AWxkLL61bg0HHD+0VrmKjan1kWQqoHRnxKbEXzRD
 E/nlzYwuMNG6fUSnvPU+R282Ki59sKBtHfrYEQWAu+yqATp62BFRMZt8WhDnsoFTS4AhMDdqY1B
 S1CBBZ6IrTI3O5naVxFYgUGbzOX4DJkOfrOWbDfjevByzYVkrmScsk/2w5x0r9FQblRE0v94IgB
 SF0Fdx6CXwkBlHqA1+9+Kwy9uy5mb5v8spYKlzRa1FJczT1FEj9Ps/qIrh4J9wUE6Euu7GxdveL
 HeOXbCQfioNY9xsLx4zYsxZvBeOmuS0/GuOkni07hA0QjvoTvLwB9dj8xoznO9T4mqKI0HATdS4
 5PYf/FA87gvX4j23JOw==
X-Proofpoint-GUID: x89M8ifdmQjeifQQEmRgrX7_WVQeBgp3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140063


On 10/13/2026 9:19 PM, Konrad Dybcio wrote:
> On 10/13/26 5:16 PM, Kathiravan Thirumoorthy wrote:
>> On 10/13/2026 8:11 PM, Konrad Dybcio wrote:
>>> On 10/13/26 3:14 PM, Kathiravan Thirumoorthy wrote:
>>>> On 10/12/2026 12:53 PM, Varadarajan Narayanan wrote:
>>>>> RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
>>>>> share the GPIOs. The board has to be reworked to change from EMMC
>>>>> to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
>>>>> and include it in variant specific DTS file.
>>>>>
>>>>> Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
>>>>> and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.
>>>>>
>>>>> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
>>>>> ---
>>>>>     .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 209 +++++++++++++++++++++
>>>>>     arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  66 +------
>>>>>     2 files changed, 211 insertions(+), 64 deletions(-)
>>>> [...]
>>>>
>>>>> +
>>>>> +&qpic_bam {
>>>>> +    status = "okay";
>>>>> +};
>>>> NAND is the only consumer of this BAM. Should we move it to NAND DTS?
>>> Can we enable it by default? (i.e. is there any reason not to?)
>> I don't see any reason for not enabling this by default . Since nand is the only consumer of the BAM DMA, we enable both nodes together to keep the unneeded devices in disabled state.
> The first sentence says "we can", the second says "we can't"

Looking at the other SoC DTS files, BAM node is enabled by default. So I 
don't have any concerns on enabling this node by default.

>
> Konrad
