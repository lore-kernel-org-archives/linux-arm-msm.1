Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53D03EFFD1
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 09:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786094806; cv=none; b=u45fF9BavHH5iSTIRwxhZGuBgU344Q+1+pKnSMFLc7/Vy50Ewjvz7X+7npEV+1Hz6zCdun5ZOzBM2bzR0dsEvYHtT2eWg3skrB4bLkM60dT+ad6UlkV5Gx7RZn00XipCNTn6MIQVuHcaPXjK97n5LLkYnWp4zSx4duWNeb+ZHvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786094806; c=relaxed/simple;
	bh=VFsF8GW6OAUPTdSzxxBp7CgHm3ZL8kI/TSC0Atb3iQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k8hNk178SbLc+ZkzJtQMXFSJB3Yb//KPHs0VXVUGe4zFA9bS06gknwgR7y0Zeeid74zg65aMsk0QjGYxNoHP4LoeQzLXzQCdUYm9S89+amwUPdP+lSqS/c3vUmPzdZxjy+yMSamUO70/1iuCdCZ2gsDaagbb4mQXSPU+Tf5w7fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S2skUDgr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bxe2pFtd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S2skUDgr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bxe2pFtd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6779EQFT1064656
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 09:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8rwovzJOnEAwNWzoNtTWOBRrGNerjs0hnTnerd919Nk=; b=S2skUDgrNph+1LTh
	8GI174X8v9ZTnvhL8qA48EMcwuFVcH5iYK03jqR3Cm9EOyILsXLV34drzjw6wGJm
	UMlvdxDgqESjxVil9Xy8haG7tVE3Q+dt0/XVm5SSOAoGalz6Cv7QRdQWNV4gVAbO
	W8z/F5oAS7zpfz3kO103d6YWxGVbgEZok6LD+1Iu01PDqRZUQkDwEakXZ9vUSDm9
	AFqWil1/5QlUeH4V74tGIbDV6wQFSf6JDYiwiUf0OGafEZJJO+clkDZ4wcFqoldg
	JqLse0PwnSOkRREKbaXg16aTUP57Ak64Sgja5tAUCxJ7GOQPnatv81tfYfyUOP7N
	aHuL/A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwcjb01jw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 09:26:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5cc1e13f8so3597184a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 02:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786094803; x=1786699603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8rwovzJOnEAwNWzoNtTWOBRrGNerjs0hnTnerd919Nk=;
        b=bxe2pFtdyH81T6Dc1sZDm0kNa2hlPWfQ1uWO8jbD4r+ebYZDwaAamxatGfBuj4n2Fb
         tleANSl6h4/O3wq9J7xpwS+uog4O7qORH+aesH0RfAEjvkeKOoRRdzP54eNi1yXdwJir
         0Bj+NZMcQoiDamJTZOtKdgp93qmrSdfIK2HV5AxwDzMKifBjp5nPWWNJj85zkbRVxoAg
         jTYRfJqOcmZb0phiyjaKckVk+AgP/oXjCVxyDQQvHI7fUxD2B2OQqPokanq94WUc8r/E
         nQ66We6PEQyqcSigagMWEUl16zOZgaqAW6AH2dEv5ov/CJi9gXdL9AToiCeQGtdALlOr
         X/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786094803; x=1786699603;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8rwovzJOnEAwNWzoNtTWOBRrGNerjs0hnTnerd919Nk=;
        b=KZBpHOFsKw78bo/5ETZHkAbXUc3lLFq3AP94ynpe2lm/YaC4uH3YyYNZyDf7t2JI68
         ajvgdb2ZCN+vInJnflksRHIhUGNIPrLPtew2RzN60jlZqUbmPCUygXIsJdq58tArmSZG
         KKcRVK7bH3frrEjVEqdBvMkpcIwPKSeGF+XgEVNasZA7X9q64Spe1OI83qPUuVexCxWf
         A8CeXHWhfSPObqQlgB5lu7cLu/h1b9x6JBWp1uCJAgiEsS67LZtvFVvLaVT1e9JIMrm8
         VHR2xYAQjAYbhRBcONYQHQKxblAXk5OSlietTm0aMS0EBNvG4tJ5oatJWhm5D27yNTa2
         Mzog==
X-Forwarded-Encrypted: i=1; AHgh+RqjU1LQ4HZFWH+Cv8HRe/ie4lBFNEAgI/sXTCsAlFNoCTbPn/owgqLcvSU6aLvI+zQ3Qvxj0h958PVe3TSQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxGnhae2F83a0AfpNGnlzbtrYGGTM8Mmaj9gpbP8/JVSvqeJXkU
	FMy8cqVlNoS0AbNRJbPy5976XV8d546ug44JQ6IamqiwpnZ5bh8vvlnvvh6Sm0sFR1EIf92/TsA
	ePnHnffkHIblf1gzYNzE8I/2ptrofFGQ+GQQmLYG4XS22HlWM0onif/K3LoVpEM6ppv9C
X-Gm-Gg: AR+sD13xrau5+fLhXw2gKjAF5C2V9qGfeu/aXV4SxYyNfUZcKaEmRCFGpZdLiMWBteZ
	VWRINBtx2y1HoopdnJz+nzKW2nRSp2qpMBoGg1DI6qhGLuaTLCw31VHBbhQlMXVDf/XibHnbFm8
	Ge+xf5VTtwvMPdY88Vl/jnVK7DTkXdbndbA6k1NTmUCbwX1KHuc/3v5wjXygkrYbe5zTlL/qJZN
	F9tL/IqJI73ofldQqEbMyTM+24/21GPdmmpMdf9tucM8Ft7Fl1uLuLE6UlhDvt/5VAW7uU1occD
	S3ObjtudbskdDI3wkgR05VpOq7w0ae8GlDKsXAfwarXMUHlYPf0nVfeaXLnmXmUiYFxhagSTAgo
	tw+xYrjeOuodEFo6xEPJ7wPgfHNd8cjktM8A=
X-Received: by 2002:a05:6a20:4309:b0:3c3:954d:278d with SMTP id adf61e73a8af0-3cb85df09e3mr24233954637.9.1786094803210;
        Fri, 07 Aug 2026 02:26:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:4309:b0:3c3:954d:278d with SMTP id adf61e73a8af0-3cb85df09e3mr24233914637.9.1786094802760;
        Fri, 07 Aug 2026 02:26:42 -0700 (PDT)
Received: from [192.168.0.173] ([183.83.142.146])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be8a706fsm5522455eec.8.2026.08.07.02.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 02:26:42 -0700 (PDT)
Message-ID: <27f0b033-e940-4369-aaa0-f08426aac73f@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 14:56:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/22] arm64: dts: qcom: hamoa: Reserve low IOVA range for
 Iris
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Rob Clark
 <robin.clark@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        cros-qcom-dts-watchers@chromium.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Aniket Masule <amasule@codeaurora.org>,
        Malathi Gottam <quic_mgottam@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jonathan Marek
 <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>, stable@vger.kernel.org
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <20260807-iris_iova_600mb_fix-v1-4-3996f67e33f9@oss.qualcomm.com>
 <ruow4uus64krlpy2gvm3g2d6rq5kgmgxnlhstmecil3gw7lhkd@2golvucd473l>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <ruow4uus64krlpy2gvm3g2d6rq5kgmgxnlhstmecil3gw7lhkd@2golvucd473l>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA3MSBTYWx0ZWRfX2ZLIUHI4Xveo
 y8WAMwfTMMfgblqt+uu4iGDJxGQH+hvKeiC/k8TUBn9NJkpA9XRpzcWwcKftd6KeqrZ1JFw2Oul
 1dlDkas2+r7Kk6sBlvKs2h/Zc6G1azu1GTZifcnE5Tw91RwICTmukNoHVPBNfBkp0Fxi8yJBFR8
 /kFivTN8DGS81jMzYL5L/uNlbfzfaQZvJs9Mdk/eG9VxalxKVCFHCy77XekdsSKC6PHDZaYLaHi
 UaS2zfzCn9hEyCup6sb7EPvM554H8pJiSTkOG3lNwyzmuytxVdlGNCFN6wFTAhUmQkG8r6gQVHO
 eyKvLP3aKLdTOAzUhgL/f/wFUS7300uabrhhoNdRjbflLgoJQg+z0yUvRRUYfISYsSVvo6iDPoh
 2sZz0wQUmDI94GYr//E/arUM6wkwWOOJmEHaQjg0UTIgF2kgCsnVAum7QiH6wEZjjiYjqiFeRz7
 a7OtO65FdcohKYkGVIg==
X-Authority-Analysis: v=2.4 cv=QsBuG1yd c=1 sm=1 tr=0 ts=6a75a4d4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=eVbXwf39F0J6/s7D6zfB/A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=t9ty7G3lAAAA:8
 a=EUspDBNiAAAA:8 a=dYNi2H2z9aghnXgkDTgA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA3MSBTYWx0ZWRfX+1NxN0HFKkwu
 GgngxpnkKD2f2teGs0GxEmSye06OUEUscShff1pN8feEoDVFd71+IqX4egHr0cGzZNy0ikWGWIb
 dm5B4rOIXR66vIZTYB4tFf8WcifO9O0=
X-Proofpoint-ORIG-GUID: 4cvGLYJGOqqhp-XL0NmNEJEllHZBO9Ft
X-Proofpoint-GUID: 4cvGLYJGOqqhp-XL0NmNEJEllHZBO9Ft
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070071


On 8/7/2026 2:33 PM, Dmitry Baryshkov wrote:
> On Fri, Aug 07, 2026 at 01:54:48PM +0530, Vikash Garodia wrote:
>> From: Daniel J Blueman <daniel@quora.org>
>>
>> On X1-family hamoa platforms, the Iris VPU reserves IOVA addresses
>> below 0x25800000 (600MB), primarily for secure non-pixel buffers. DMA
>> into that range, from any other stream id would triggers unhandled SMMU
>> page faults that cause spontaneous device reboots. This is readily
>> reproduced with one or more browser tabs driving multiple concurrent
>> video decode streams.
>>
>> Add a reserved-memory IOVA reservation node covering [0, 0x25800000]
>> and reference it from the Iris node so the IOMMU layer keeps DMA
>> allocations above that boundary.
>>
>> Link: https://github.com/qualcomm-linux/kernel-topics/issues/1157#issuecomment-4458933574
>> Fixes: 9065340ac04d ("arm64: dts: qcom: x1e80100: Add IRIS video codec")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Daniel J Blueman <daniel@quora.org>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/hamoa.dtsi | 13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> index 8a96ea1bdb9c4c409b2af997680d8c13fed0643e..87f424765d513c97b06303bceb75ca9f176d2ace 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> @@ -666,6 +666,17 @@ smem_mem: smem@ffe00000 {
>>   			hwlocks = <&tcsr_mutex 3>;
>>   			no-map;
>>   		};
>> +
>> +		/*
>> +		 * The Iris VPU reserves IOVA below 0x25800000 (600MB),
>> +		 * primarily for non-pixel buffers using different Stream IDs.
>> +		 * DMA into that range triggers unhandled SMMU faults and
>> +		 * spontaneous reboots, so reserve it to keep IOMMU
>> +		 * allocations above this boundary.
>> +		 */
>> +		iris_iova: iris-iova {
>> +			iommu-addresses = <&iris 0x0 0x0 0x0 0x25800000>;
>> +		};
>>   	};
>>   
>>   	qup_opp_table_100mhz: opp-table-qup100mhz {
>> @@ -5439,7 +5450,7 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>>   			interconnect-names = "cpu-cfg",
>>   					     "video-mem";
>>   
>> -			memory-region = <&video_mem>;
>> +			memory-region = <&video_mem>, <&iris_iova>;
> 
> I don't like the idea of this series, because it _again_ doesn't tell us
> the truth about the hardware. This typicall ends up with bigger problems

honestly...thats all the info i have about the vpu hardware that it 
restricts non pixel to DMA from the 0-600MB range. The same i have been 
trying for a year now

https://lore.kernel.org/all/20250627-video_cb-v3-1-51e18c0ffbce@quicinc.com/

> later on, when it starts to affect other bits and pieces.
> 
> I don't want to NAK it, but I'd strongly ask to reconsider it.
> 
>>   
>>   			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>>   			reset-names = "bus";
>>
>> -- 
>> 2.34.1
>>
> 

