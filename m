Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2101D375AC6
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 15:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786549509; cv=none; b=iEEfSZDWbQG+HcOv8VCCI6ZgoS/Ep0ezOy2NLe/YZjGVNK+01lKpuslbSgRSloSOZ95xlu7zIytlNcKZUsd2OQvkikeqNof6YvBKG7zF4forROx5XMIDMy1pKCps3QD45XOInI8M5RAhq3hAP4OcH7BYUfH+yDNiJELh1g/uH04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786549509; c=relaxed/simple;
	bh=5WsJee6RnG8FDL/km9AY8oElVGx145sSlu07kgjc8jw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pm2h1+LLskEziZPimkSWusyPNcdt2mJZKMif/AQQVqZDFscDUp0YjBiwwpkNT+iHUdpVws1e5rLNzUQMMyxXyrbLXShfSpio2qDEhBT1hPXMLGI+jefqqeJ2i4YoEGjBFbBDlbIUOtvF4iC+8K8j73FmsffRFIWYA2sdm2VCrJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lswnwMII; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ajaiem5Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lswnwMII";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ajaiem5Z"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CDbt8a3194351
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 15:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kQLR4H1Nicj+xSHL9x7Wan7JxfTrbvx2Q5V49rtcMEY=; b=lswnwMIIpg3FLu7d
	AxZTGAhy9V6liPRDkU0u/Jb0s6QlxvPV3QJY1hcCpFEqndv3NNfkrz9ENtkDVOcK
	McTqjwEm2szea+lecKpDWggqH3oMCYlcXtlVINtpLLgEsfwaNviyTjHUK7Jobpbi
	kXzVkqGZcnTISDsVFeCCs7cmiCMWCiC0U4+K19JNnkFi9ttfNimSJwJUTdBxFt9f
	f0MA+DmKQXdA9RquU26rv4715AqEMY6RjVPuQys1OSFZMqx1A9UlwwugvMyV8bu9
	aqpyxRNZKa9ArmMSI0MezpYo7A7f7TiwQ7cIj6Bb7cKGoKvLSf0xrcupdjBkeMKh
	yVuksA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0mnda0pn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 15:45:07 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso1439336a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 08:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786549506; x=1787154306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kQLR4H1Nicj+xSHL9x7Wan7JxfTrbvx2Q5V49rtcMEY=;
        b=ajaiem5ZFfCl+jtoCp/e0QS3j8GE6/FAyI1CymSd+CyWLw62fXSM4kj8Tp2PLrgMgn
         TTVBsDRvYz/Nr3imTb4wpEaBvO/48IggaMzxk1ltpj58mXxhcmmtSki2atiS1I85kIRc
         KekHFTGg6Np4ouEWD1SYZ6oYYIkmfjULOGySzBPcDXz9OU5MpRejexQ1qKrooIM5W8iU
         ZD96kLJYuzYLexsVB4zQaAP+YAKhCa9BRwTDhWS3KlimVVs9hl9u3ggleCqzM9DXO4ar
         ENs8SZaKwndJbtvl8xvvJyOQbg86OKG560m5fcs5gQhrEbOF2P12OvBOk9wVRR2UCPuw
         DcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786549506; x=1787154306;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kQLR4H1Nicj+xSHL9x7Wan7JxfTrbvx2Q5V49rtcMEY=;
        b=EYoEtTnJYAVz/N3M/+DVmv1Q8mN1Y1Il4LQ1boGCm4v7+QglpdeA1p+2rHk+35voCg
         XDzdLQiEzpZ+zYIJS0tj4Vf+1jl4yohn7yOa6wELrRjtSpVZpY0TfxlLMw6qz/k1unyO
         gYzbpvLL9z6srtiA/vWHiP0xj+TIBt+lst//dPNNXclgLEnN1BaKCqG7w0DEOplo0nsW
         ndJOuBPBAbm3i8gWx2eMLIFNJ1oQwilbRs5RBmGb9xEUsU9aXBRCbibf0obFVY1yHxgd
         oK+PO5ayyHgFr1PfYP3rqtCKkaOcnz8NWRv2/Qt70Lb3kfWm0Jp8t8CtjxMyZmuCacxu
         0GIA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/YP+vmfR6I85JkqbE+56gAodAWNnHSuHLtOcKwsXqI5n0aKHt1rECgbyAReq9UH1YIeMELGKiTZyWgy/T@vger.kernel.org
X-Gm-Message-State: AOJu0YxbOynUxmabLy7OBRGPxEa7DCDJnRrZs9pzcd9gs8vBBlo19Fmk
	81zh/6RR33bbyASF4HgHu2hBiqhk3l84Gd70UytU7BE9NkmoI+dA8fLs2AheW09VvNQjHNS5QTd
	XB9DVpVWs5sf1unER1Vi3nuLtayqGsBNsWVH934iXu7lknXWCGGezX4thvf2pgPKen5ho
X-Gm-Gg: AR+sD10TkoPcycyHgIk6wiagoTlKyli/CGWovnTzrbwE18TJt0jyh6vg6jM03W1CGNo
	WffiziT0z41o7WW+8Odns2hSwk83dugxlL+NFhig40lpIySwj9hOE7XIrbU2dX07qE7WB7cpxVT
	kLhfavthSxtvAWzri2pXxxKF1ZQTlnqMoU2/t1RWOZiD4/Rlou5OQ5Xt1RjXifIfD+ZM7dk3Hj6
	kKsWnGXnkzY7yTx1jEDgkImQBNHgthH8LM+tI4N577tNgdW+y8bHi791kchKVIc4JBNp0V6L45J
	yXAseaH8oOjwCCpvVygri8xkVBL9D1KAYeHXVtAf+m4MZFgPkbGq0/wCNnt7uEkUREvXjDRFOh5
	umC55ouW3Gw9OUAddFChBtlhHzS9K/aAcoPc=
X-Received: by 2002:a17:90b:1b0d:b0:38f:7f60:ba35 with SMTP id 98e67ed59e1d1-3930123788cmr6180034a91.5.1786549506268;
        Wed, 12 Aug 2026 08:45:06 -0700 (PDT)
X-Received: by 2002:a17:90b:1b0d:b0:38f:7f60:ba35 with SMTP id 98e67ed59e1d1-3930123788cmr6179918a91.5.1786549505589;
        Wed, 12 Aug 2026 08:45:05 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.139.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3c08163sm11160525eec.7.2026.08.12.08.44.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 08:45:05 -0700 (PDT)
Message-ID: <1a7c222a-617b-4dfd-a551-2c00115747a9@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 21:14:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/22] arm64: dts: qcom: hamoa: Reserve low IOVA range for
 Iris
To: Rob Herring <robh@kernel.org>, Bryan O'Donoghue <bod@kernel.org>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
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
 <20260807162405.GA896590-robh@kernel.org>
 <c3hVumMy_QnRbUmbFTSWGjkfG7lPjGFEcZfPsZeGQ57nWKkhlBL3wgmcDcAgT9cNb8Ju3qZ_sSKgHk8vmow0xQ==@protonmail.internalid>
 <6ee7f32e-eb6c-e264-6f0d-541555f8fd62@oss.qualcomm.com>
 <56b3dfcf-b1ad-4192-8199-06c80cc5d124@kernel.org>
 <CAL_JsqLGOz7Fh=AsM+g84=Uko10YXU4QN1buApD3CJMkOmsebA@mail.gmail.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <CAL_JsqLGOz7Fh=AsM+g84=Uko10YXU4QN1buApD3CJMkOmsebA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEyOCBTYWx0ZWRfX7UMYeyU7icdH
 dL1R5uIhDrL8eNN40aVgyPJP4BQA1tgtaqbh806hvxPDWBkyW0bGiS0anlUFxc41GLpgPlHOOzJ
 Dbqhtpn33mMPz6l9dMVmCweMoKoMRd4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEyOCBTYWx0ZWRfX/F9bJp2w/Q1O
 R3w9LX5mbsTyLrK37Ki8wrwOr65S4vIrQA1U2O1UMfuKGQ9j9/Ig7o6IFd4Hfy4eIhrqxqYOb8g
 CIkIP2M0L0P54X0C4AQjNQiCQF4ImdAC57IzeF3VObxlPGQClW1EVMsR7kZcnCPOOvAqU8TRfYM
 3b7XmZBmlubyd95rQhbH57Tes6EJEb9xOERM2s02dlIvT7flBP2bfcK5uxTMN7mrSZ1O+BZL499
 Dqh3CKkWUy2gO2jYhGFVveVVTRwip/hH7VcoyCnJf6DXQBzjOCg0PmhaRE/4NGTC3cd0wNIBQGm
 LJpYPJuVdAxJk3CwOVrOF8/Ew+YqGv+Dzx7IfWtCYNwvHpRxpg7zzUxaFtazTCl+CKVmwpoflhc
 fft2hVo/LHmuQ/TCgKGXidf75EGwfl0EZ0uQNlm9+2SoeU5aiCzhh6zAblZvhZeHYLC2s0AvgtM
 uXiOOa0WxeOmzXoEqSQ==
X-Proofpoint-GUID: GOZNLJ5iqdjRWL-0MZNeyoBzpA7Q-b1g
X-Authority-Analysis: v=2.4 cv=C87ZDwP+ c=1 sm=1 tr=0 ts=6a7c9503 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=vZaankvBGbqXg3MvYcFdyQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=NEAV23lmAAAA:8 a=YG64nluAAAAA:20 a=VwQbUJbxAAAA:8 a=t9ty7G3lAAAA:8
 a=EUspDBNiAAAA:8 a=JoBr3x7BRt4YSxSGyWwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=CsAS6f0m0zARWR-uHzm3:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: GOZNLJ5iqdjRWL-0MZNeyoBzpA7Q-b1g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120128


On 8/10/2026 7:17 PM, Rob Herring wrote:
> On Sat, Aug 8, 2026 at 4:55 AM Bryan O'Donoghue <bod@kernel.org> wrote:
>>
>> On 08/08/2026 05:37, Vishnu Reddy wrote:
>>>
>>> On 8/7/2026 9:54 PM, Rob Herring wrote:
>>>> On Fri, Aug 07, 2026 at 12:03:50PM +0300, Dmitry Baryshkov wrote:
>>>>> On Fri, Aug 07, 2026 at 01:54:48PM +0530, Vikash Garodia wrote:
>>>>>> From: Daniel J Blueman <daniel@quora.org>
>>>>>>
>>>>>> On X1-family hamoa platforms, the Iris VPU reserves IOVA addresses
>>>>>> below 0x25800000 (600MB), primarily for secure non-pixel buffers. DMA
>>>>>> into that range, from any other stream id would triggers unhandled SMMU
>>>>>> page faults that cause spontaneous device reboots. This is readily
>>>>>> reproduced with one or more browser tabs driving multiple concurrent
>>>>>> video decode streams.
>>>>>>
>>>>>> Add a reserved-memory IOVA reservation node covering [0, 0x25800000]
>>>>>> and reference it from the Iris node so the IOMMU layer keeps DMA
>>>>>> allocations above that boundary.
>>>>>>
>>>>>> Link: https://github.com/qualcomm-linux/kernel-topics/issues/1157#issuecomment-4458933574
>>>>>> Fixes: 9065340ac04d ("arm64: dts: qcom: x1e80100: Add IRIS video codec")
>>>>>> Cc: stable@vger.kernel.org
>>>>>> Signed-off-by: Daniel J Blueman <daniel@quora.org>
>>>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>>>> ---
>>>>>>    arch/arm64/boot/dts/qcom/hamoa.dtsi | 13 ++++++++++++-
>>>>>>    1 file changed, 12 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>>>>> index 8a96ea1bdb9c4c409b2af997680d8c13fed0643e..87f424765d513c97b06303bceb75ca9f176d2ace 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>>>>> @@ -666,6 +666,17 @@ smem_mem: smem@ffe00000 {
>>>>>>                     hwlocks = <&tcsr_mutex 3>;
>>>>>>                     no-map;
>>>>>>             };
>>>>>> +
>>>>>> +          /*
>>>>>> +           * The Iris VPU reserves IOVA below 0x25800000 (600MB),
>>>>>> +           * primarily for non-pixel buffers using different Stream IDs.
>>>>>> +           * DMA into that range triggers unhandled SMMU faults and
>>>>>> +           * spontaneous reboots, so reserve it to keep IOMMU
>>>>>> +           * allocations above this boundary.
>>>>>> +           */
>>>>>> +          iris_iova: iris-iova {
>>>>>> +                  iommu-addresses = <&iris 0x0 0x0 0x0 0x25800000>;
>>>>>> +          };
>>>>>>     };
>>>>>>
>>>>>>     qup_opp_table_100mhz: opp-table-qup100mhz {
>>>>>> @@ -5439,7 +5450,7 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>>>>>>                     interconnect-names = "cpu-cfg",
>>>>>>                                          "video-mem";
>>>>>>
>>>>>> -                  memory-region = <&video_mem>;
>>>>>> +                  memory-region = <&video_mem>, <&iris_iova>;
>>>>> I don't like the idea of this series, because it _again_ doesn't tell us
>>>>> the truth about the hardware. This typicall ends up with bigger problems
>>>>> later on, when it starts to affect other bits and pieces.
>>>>>
>>>>> I don't want to NAK it, but I'd strongly ask to reconsider it.
>>>> I think this is an abuse of /reserved-memory. reserved-memory is
>>>> reserved *physical* memory. Reserved IOVA is a property on top of that.
>>>> I'm surprised this passes validation. If it does, I may go fix that.
>>>
>>> As per the reserved-memory.yaml schema document, the iommu-addresses
>>> property for IOVA reservation into /reserved-memory is allowed — it's
>>> documented for IOVA carveout reservations:
>>> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/reserved-memory/reserved-memory.yaml#L56
>> I think that is an entirely reasonable reading of the text
>>
>> Quote:
>>
>> "If no "reg" property is specified, the "iommu-addresses" property
>>    defines carveout regions in the IOVA space for the given device. This
>>    can be useful if a certain memory region should not be mapped through
>>    the IOMMU."
>>
>> Which is exactly what this series does. Excludes a specific IOVA range
>> from being allocated for this device.
> 
> But if "iommu-addresses" is the only property of the reserved memory,
> why put this property in reserved-memory rather than directly in the
> device's node? I'm only questioning where is the right place to
> describe a reserved IOVA.
> 

a single property node vs multi-property node should not be the reason 
to decide the place i believe, rather having them all under 
reserve-memory keeps all reservation at one place instead of scattering 
it all over.

Regards,
Vikash

> Rob

