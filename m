Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89A341D22A
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040032; cv=none; b=T1RvpsvGJmL54ZbRQ3dxLcuOSrH8kGhA/cwXmDOvl3YuUZLaO+1uT2uvak06KRNQMAapbLj9Xrlto7n6G09lXJVWF+h/7/5zLCRh/szdTDUzsBW+qGHcmsOTI5qaYBTA8WvbHwf7MFaVVsK+yNltHC8Y0PKloQPw7N7RIhbqqS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040032; c=relaxed/simple;
	bh=VVzeC9aSS7EbC4BDJCc55WZs27Oj2r6qa77M5GVXJ+s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ii/wPWHCceQdbBypcefoQfRsovqB+hhJU18M8RJgZEMfXxC2t1i3Pf9ZeCRHYgFeEyUg+wKNaNgyWQTMciNJAxmEaqJTrySzgQbOuROd5Gl7WZDr9vE+5P3MLAek0arYGketBNfz5kJdRfkwawwgEmCCXrTkFYy5qJ/o4XUBGv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dAdQYCC4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MnU2PR5e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dAdQYCC4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MnU2PR5e"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I7iwrJ689922
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jqXg/ZeJLcmznmPK72iIjNUSnrPmed0SSB5eff7oArE=; b=dAdQYCC4BGtD8Fij
	v8GEMlCGDqa+hmF/yht37SCxoV3BwJ4JKllbVUiyPXecQf2XyaS+3Doc2BecfLIi
	WrD2ynukMZsy1+h2Oz4Y2qcZZlH5uNw8tiCi1tjg0YQw7VenY/61o+Qaj47vQvlo
	YQloesozKDWfqs41/GxsbPlVkZYVDuNFdXy0Qp+ehwwBhdklWG4sDfYjiuzoq1Hs
	9kqwL7UFAOuAnE+UXXGtoINACCrEP5fMwK/sqo65erOsAhOo1xrunfTInrPIN3CG
	/8aLTcsVwccx6oi2O8ln6UeNyEs5HrW2eNaGXmeSqOr+Bx0oTL6NM3K3hxOf5npe
	svpDZg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g48q0tm1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:00:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfa55c9430so45002105ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 01:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787040029; x=1787644829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jqXg/ZeJLcmznmPK72iIjNUSnrPmed0SSB5eff7oArE=;
        b=MnU2PR5eZpQk064g6OVutfMgOvWsiCnT6jgbEops4iKlJ7WXmSIXZK/5+H2nMfMbph
         ESmjJ48n9X+fflnn3kDnVA1xXu2nCYGJg3XndpCQ+B/ixvg4Ty8y/vQhpjG/hEq9A4GH
         DQVmOQzXrWO/Ng6hth+Lu9kHv1uRKP+c7ao8rHiDsatUZkJiJKMS/qaxsYoW1OSOizcR
         G1WDoTVAsPv126zhQYeFV81RBNj7fmB8AkWqsOSQkvwW+fRHgxRgNnd1fbXlcGSwlJvv
         wDChd+PldBzJtCIlaGRy1sHmFamonh5RuYdNh1gT8BVwj8EKbmKvu+WnfCtddc+r3sJQ
         Pjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040029; x=1787644829;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jqXg/ZeJLcmznmPK72iIjNUSnrPmed0SSB5eff7oArE=;
        b=DSmX0zHzpIr0u20EnPQ67J3SsQ/kJDRcrm9KnVosiCQvEc9XI6KjvL1QM8AoczxAQQ
         kk/k7Ap3ZZodHPnEnDOV73yxckaj/4bWdvj7ndv3TIfqITj5ZHlD36gaOuPNkiR8UftB
         cpYWdNV/E1YoYgAeLcMkWBeFh6c4TMaHX4NIyDPkT1wrzLThH27gFdEDcDUh9kzeLXI7
         n+DTwSjUYcOAUcGXOTBXjc/XMnjYIAE7py6E/p92P7xSk6xvfIZsfD1xCByI2KO4hrS3
         mfUSuCEVzFfeRLaVPVuOq5VI5N4jv+hyQ9M/+bXr2h7DH3wSi+oLZrWHXwyE1aOuAyNy
         l4kg==
X-Forwarded-Encrypted: i=1; AHgh+RrUNmYuxlqo+EGdRYiEM+zqhxK6mnSvB0l1gmOHwClyJchFOoOYkR+D1fMm8Q7ohaOvo7DmM94SoJcZGM2+@vger.kernel.org
X-Gm-Message-State: AOJu0YwEpudYZvYRRS2GsGM3wO53/oXgZleywFj0I9o3ubsRfUyxK2Qu
	fwqcpwpnoYn3BMdhrgy6MSMUp1aSbS3ehah5FBb8K6+OzrdktljEzpzMmOGXJhndE3wTCwOaZ6Y
	QuKEvW8m+5T5hImD+pYEByga/WsLzGNdBJao+wtf87ALGAuFXjwRbFkJ6mM6Qs6cZe3qB
X-Gm-Gg: AR+sD10wwJUsNU1TosE62BZUcqO68eCoXELU803Re+5RIwl/4AuaprtPEy9eVkILq1J
	EV3JVfklko3PqOKzpEzbfxbkLu85Elr/uo1L2LCaEminyl5W78xqkfkcHauvUhREVfGK6ensN9g
	pUu1OQoqUyIRGUnNcFznoF632tOZVoh1Dr22JsqOyT8aB/w62iQA39C3h4FV0RKoFiYTVRp5SrK
	bkcaX/KZiE4SeBh9FL8RLfhe0GbN8bVU2kqV0lQ/NZbGcwAX/PmMH1FmKWELtFOvFPQSxmMTvaN
	hYpYLaLlYPMC6T2rpkNtLAC7Js+hvyjxR+9gOsMBrRSRXhvDkLNTYZzHhIOBLUZpPeT7xijUsZe
	gUgCtUvPpLwgv2MZ4eF+ERMvoWFDyI5378zw=
X-Received: by 2002:a17:902:f70a:b0:2ca:1b97:70c5 with SMTP id d9443c01a7336-2d3b0ad2b9dmr376240955ad.4.1787040028313;
        Tue, 18 Aug 2026 01:00:28 -0700 (PDT)
X-Received: by 2002:a17:902:f70a:b0:2ca:1b97:70c5 with SMTP id d9443c01a7336-2d3b0ad2b9dmr376238925ad.4.1787040027720;
        Tue, 18 Aug 2026 01:00:27 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.138.247])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267ca93692sm12687431eec.30.2026.08.18.01.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 01:00:27 -0700 (PDT)
Message-ID: <c339cbff-490e-42fe-a461-042fdd6bfea6@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 13:30:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/22] arm64: dts: qcom: hamoa: Reserve low IOVA range for
 Iris
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
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
 <Gm8h4cjoxHsgA2enLuxEd_3c_3Nq_RVJ9PkosuciOEss5Bw-GbnVoJCzsc5ciseK-L6bnlf9dbkbbh4ui3PSOQ==@protonmail.internalid>
 <CAL_JsqLGOz7Fh=AsM+g84=Uko10YXU4QN1buApD3CJMkOmsebA@mail.gmail.com>
 <e5e2d588-cee0-4105-b34e-34d2718786ee@kernel.org>
 <xbzl4s37jr3uzsd23kvphiguxmq4ngkajju4ifg76kwqrs4xrg@2egp56nwrxgu>
 <0bccfd31-dbbd-4bc7-9d9d-be048ef22b04@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0bccfd31-dbbd-4bc7-9d9d-be048ef22b04@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA1OCBTYWx0ZWRfX5ysprDP2KX+q
 r6PUBqDNw1yRSRpg40v63BO5MS/e/AzniXm7jCk/gNws23hsN1b4Xc0IT3z4NaC48i6bStetYfo
 VDwueqjsLJligUpsIXwQ2dDPwIlmlKU=
X-Authority-Analysis: v=2.4 cv=VuITxe2n c=1 sm=1 tr=0 ts=6a84111d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nRfyoPPwyR/Y6OrExC/i1g==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=YG64nluAAAAA:20 a=sXFCB3fPxomcnR8swvoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: osxaxQlB88bXTipzMs_g-UIG8nH5OHyN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA1OCBTYWx0ZWRfX78C94GJ/s62i
 xZ1QVgNWcFr0D20RsTuQEuCfZI9dH4/zGwthgPuxod9qZ+vkOT+DOumvxUugU6Q+803YcF+PCBN
 WvUJ6ouuqxO3TIgg6SNeS7DfCUBpDvPwcuAAzZ2rfwitj7Iu+PJkdfHpoR7UWrhWKtVYrN3Xw1F
 VS8mtpYElMFLemtUKE/F4vabYeYjug4VrAyDiSDtEtLIj2TSazk3n2yAaWru+71q8UmTZEz+Mt7
 D2xBl+YKmwy9bix/H0Q6C0UxqMxMecHuQmXR4j/C1anFPqaHDlSUvh0zPamM0qB9b+q++u9mM3C
 UW3UKkTa5CRs7q+3A8EavP06WbpZ/q/Jo4SWG1gXxivLHN80DFGWlHYtm5qfclfA/yuUkj5m/Hh
 hV4MkWV0nxEhVyhnVLZrTkkL4CvOoMwZY2YFagfUH7W/rG1X49N3uC94aJsazVAq59XnMlXJrxb
 TUaAlILCsTYTGXSnS+g==
X-Proofpoint-ORIG-GUID: osxaxQlB88bXTipzMs_g-UIG8nH5OHyN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180058


On 8/18/2026 1:21 PM, Vikash Garodia wrote:
> 
> On 8/18/2026 11:53 AM, Dmitry Baryshkov wrote:
>> On Mon, Aug 17, 2026 at 10:54:47AM +0100, Bryan O'Donoghue wrote:
>>> On 10/08/2026 14:47, Rob Herring wrote:
>>>>>> As per the reserved-memory.yaml schema document, the iommu-addresses
>>>>>> property for IOVA reservation into /reserved-memory is allowed — it's
>>>>>> documented for IOVA carveout reservations:
>>>>>> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/
>>>>>> schemas/reserved-memory/reserved-memory.yaml#L56
>>>>> I think that is an entirely reasonable reading of the text
>>>>>
>>>>> Quote:
>>>>>
>>>>> "If no "reg" property is specified, the "iommu-addresses" property
>>>>>     defines carveout regions in the IOVA space for the given 
>>>>> device. This
>>>>>     can be useful if a certain memory region should not be mapped 
>>>>> through
>>>>>     the IOMMU."
>>>>>
>>>>> Which is exactly what this series does. Excludes a specific IOVA range
>>>>> from being allocated for this device.
>>>> But if "iommu-addresses" is the only property of the reserved memory,
>>>> why put this property in reserved-memory rather than directly in the
>>>> device's node? I'm only questioning where is the right place to
>>>> describe a reserved IOVA.
>>>>
>>>> Rob
>>>
>>> Back from the eclipse, sorry for the delayed response.
>>>
>>> Ah I get you.
>>>
>>> Yes.
>>>
>>> I take your point. This is a property of the node itself; the IOVA < 
>>> 600MB
>>> only matters _if_ the venus or iris nodes are enabled - otherwise an 
>>> IOVA <
>>> 600MB is perfectly fine.
>>>
>>> So it follows its a property specific to this node not specific to the
>>> overall system.
>>>
>>> Yep, I agree - its a device/node property, not a top-level property.
>>
>> :-)
>>
>> FWIW, I think it's a proper way to describe it too.
>>
> 
>  From my readings, a node defined under reserved-memory can have other 
> properties like "reg" alongwith "iommu-addresses". Are we saying when 
> *only* "iommu-addresses" is there, then move to the device and when 
> other property is there, then move to individual device ?

sorry, typo. Pls read the last few words as ".., then keep under 
reserve-memory ?"

> 
> Again the device may have the "reg" property already, in such case, 
> moving the iommu-addresses + reg in corresponding device might not be 
> feasible.
> 
> Regards,
> Vikash

