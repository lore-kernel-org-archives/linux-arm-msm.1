Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0594B4156E2
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 11:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784200346; cv=none; b=Z4pGNtAsbuYdg2ejroKVSqErofpD8iFuU/O7t+Th7WbpGXlyRH+T3kmPlTbKpAgxRxs48HPsmRk2fQ97WwMgFNKEQgjSAIlY6SfzeeAvj3+V/TgJQI5UEdJbXp4wr6+o0LacMMyd4TkEsWaDjRp8oM6OKDyUvYCYcJHosIqlHGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784200346; c=relaxed/simple;
	bh=yzH3rj1qE1iSUDcLNaIAmbiWve6bqP2OJ+u3kW2gTLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fbdrpNTt3EQZrFaso3xquhGx71b6tyV/qpjCukD/MeClWsK3tY+r5tsw2ldT6e5jq2Dvu5kUTX5iNIUwcYjy2fFl7v1l5ePJBMrUwSPEDWAtK8s2GQlwKCXk7lZpwNiF2NjCMzWMYgWh7PUJnLO7FMG7mACSS/mUpXuJsDvVjQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lXs5bHMJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LcbAR4Ys; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lXs5bHMJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LcbAR4Ys"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G9rer62362043
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 11:12:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhRDmVLt+j+++2qCqj2WWEzcP52HQCdEmO997P4JbPo=; b=lXs5bHMJOg36IFTw
	YHeHq0C1sRqamoqaV9r98QJULx1ZLHC3GM2/avlZ6k0pAmyz0y4rqRY8SeQzprIY
	Mm+SK0oh+jPzsuH20YT7DRxT4JjLAr3i+WCWrQpc2vxBpOMOdy0GWwF2mHrKxKhF
	rmVL+qLbdFb8AhwxOLjQSYbm5bSPL+4kp/l3/rklj2i98pFu1BaENR+oebUccaDa
	vBGnMmdCt8k7uLUsMGJA3lCdijiuHM5d/HW632TxxvW9TvAkYk7v/88DqYdWDiId
	FHVqIG6jYR+7AW4qQj9DZ5AqGjgIhFQJh1R+KpKTipc+Cp1kO3nRgVkw/1JtyJdv
	b7nisA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feefqkg3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 11:12:21 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8482fd61e83so12361940b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 04:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784200341; x=1784805141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhRDmVLt+j+++2qCqj2WWEzcP52HQCdEmO997P4JbPo=;
        b=LcbAR4YsIFGB2ZF/Ma6ir4k1P/ITidnyiGZblwsCG1DZ2HmJ9s9R9p1ghEHQFyBjoJ
         OneaZehxJui+/UD3+GryrBXvCefzq4SEHMy05QR4k2ueQgWimX7YUgTT/H/Cna4jNcpn
         ONBHj2nC6Qi/zwi+B4eYVubM/8Q6sjjOQjcYHwB8RK1O76uW0Quut+RIloajO3+47gZU
         I/0ODK+yjAC+Z9yeCGC6UIB9yLOo0YDP+eaQMmTJwkYhL5IOetytp8rVyHLznaMUGHOK
         5tY7vmTnB/xyfkygaqbCxliBkMQiDaMkfv/9ti8Xq/jaxWNmDx80Kvwe3MaJzNMzzZvr
         c7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784200341; x=1784805141;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhRDmVLt+j+++2qCqj2WWEzcP52HQCdEmO997P4JbPo=;
        b=kz5LfFJ8N7zOQcXMeRS0hsOO7rNy8VBfnmcPiMMCeowSrNbP7Min/XQRifjO0q2JeZ
         towGUWVuZq5DTt9ujTaxVZ5RwNICc+pOC53glm4jMvrgbOmQMnvHGg0C+omoCvMCgDFj
         LvpUnXl8xgN1YGZghCPB/VIjEh/trLX/UCwiJZmceyOSraaHWcjvi5ZC//yhQazxZu5N
         0yC5alPES49RgQ45wVpVRaqi0Cu11KhVkHBLjBmV8yPJOP5hmujau8Y6MkOc15HbwbYy
         nMdIOumpbzZRb9QeT1rpCfpvBdU+SoajXamq/vW1GY2921t6KEI+jIV++vKR6RJ6IPYO
         U/Kg==
X-Forwarded-Encrypted: i=1; AHgh+RqN4CONpEdQu3MJGSLCV7N1Ow0tD9yynFMKR3K+mvT8jg/6buiKj2k4ihkAu0L9KXLD0goAPjI0RZP9Dweo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3z+0cvw+skhLm0a9+p+ugVKWq8xivGuJ1JDth7s7CwGtYUM8z
	z9hOjzgTLMm7OZIeeG7SFgozpoC4VQQLCokFSmjN/8zs5lLQ2n5l+W9u+qbETUa5LxXxghz2H+T
	I9MWAy58SOehfZDtSSUtobQWvj7czFfUTevNkh9NhV1ac7wqn1J3kbPwhpJC4epgsGDFw
X-Gm-Gg: AfdE7ckPTJK7ueaLSwzlo3JZSoYVp+dEiD+I7XOKp/9G+cZxNHM5qFEBH5/hPthrOqL
	YWO4vMO8qXsmpY2s78j5W65i6C5FltHJCFyTnv9HRmWY4em0yLSvcyV8f5mKmbO+0oS/iIZEEy2
	rISaxGilHhWOd1MYeJ0dCPQEpR28DSXhi0EAJi9YbVcGgGpKQaBh4cso9Hk+TRBG3TYWygWfQV1
	LQRD3zKbzfYwPXOvVAAffIa8exwc02RDxjwE+kLDQUQqeLMU5fpWQKWtXd7gy0ip62TyWvDQCvN
	CBn3aLLU8X4OtkGSkwS/ayfvCd/YQgc9sa24zuzlGxK4MNqc00/fZNKofIzbc9Qm9/rjOEyhSoS
	8rKwm8/VD0lg23LIA+STiwN6S+vM=
X-Received: by 2002:a05:6a00:301a:b0:847:968d:b101 with SMTP id d2e1a72fcca58-84a51442e0cmr10682703b3a.21.1784200340759;
        Thu, 16 Jul 2026 04:12:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:301a:b0:847:968d:b101 with SMTP id d2e1a72fcca58-84a51442e0cmr10682655b3a.21.1784200340258;
        Thu, 16 Jul 2026 04:12:20 -0700 (PDT)
Received: from [10.217.216.90] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f23a5f3sm4578248b3a.5.2026.07.16.04.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 04:12:19 -0700 (PDT)
Message-ID: <316fd37b-9936-4bca-8521-9a11ee65cbd6@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 16:42:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom: glymur-gcc: Add missing
 CX power domain
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
 <20260715-glymur-fix-gcc-cx-scaling-v3-1-72eb5adad156@oss.qualcomm.com>
 <4b543abe-2482-4381-b41e-623cdf5be9a2@oss.qualcomm.com>
 <olkjcrfq5t32gvqgpcqiuyp5jhf72f4piowz6osxhain77f7bc@ggwuk4nz2ak2>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <olkjcrfq5t32gvqgpcqiuyp5jhf72f4piowz6osxhain77f7bc@ggwuk4nz2ak2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=APNfGQ4N c=1 sm=1 tr=0 ts=6a58bc95 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1U0sEZR_6ltlo9pre54A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDExNSBTYWx0ZWRfX0+iuovLEw+0P
 M0SrYt34yjitk7g3Kyo4uGA6xpt73KzNk8QMqxBOk3Pe0FyfUc8w0bINT2oiQNZ/NMbtmql3dmi
 SMVL+CYgVcLl2jkyCQVAG57idfTQzvQ=
X-Proofpoint-ORIG-GUID: -2v5J1l9rQZmcXNF3CAj-5mnsOkSNmLf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDExNSBTYWx0ZWRfX2bB7u2j8ROXp
 3kqnP2PjpOdI005oRg0c0jm20wqq8B6NCuMsKLLeNUur/frWhwkYnrtz+C74Ek8jR8z2jdrpJur
 dC01p7z4codj9w55WYSjOAwHGjR/PKRFb2rd+zNYspSLNXyFebv+GzQI7mHDTJGiriivApsrshu
 linjjJ6FohERD17oX0kObGB/2AM58jLce98Y4HwinqkCnnhBU7vXD+XWVhpX/2ItcpIntEHOt8K
 LiyZsIvAzdR97EgPKyvvRy5K3Sno1iY1/wAI5OeatxIdIcKERKjHzqwjjE0cFvCIwLT9m8mxma6
 tHIclmFKx1VFRB9RcSv8RuZuFni6z5peFQdPHBC5R0+TQDjyVb+51ZOWOZ8IX0S0hAHNc9E4AvI
 z0lTeKnJ3gVFn/DPjcTHshclw5PP0RF7LCeb7rmGp5mrkRGH3scRV4D1ZuZ49b3YMLfBWRv7jus
 SUCfsKPqG0AG2QuLghA==
X-Proofpoint-GUID: -2v5J1l9rQZmcXNF3CAj-5mnsOkSNmLf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160115



On 7/16/2026 12:52 PM, Abel Vesa wrote:
> On 26-07-16 10:13:48, Taniya Das wrote:
>>
>>
>> On 7/15/2026 6:59 PM, Abel Vesa wrote:
>>> The GDSCs provided by the Glymur GCC are supplied by the RPMh CX power
>>> domain. Model that parent domain in the GCC binding so the provider can
>>> describe the dependency in devicetree.
>>>
>>> Add a single CX power-domain entry to the binding and make it required,
>>> matching the hardware description needed by the GCC node.
>>>
>>> Fixes: ee2d967030fe ("dt-bindings: clock: qcom: document the Glymur Global Clock Controller")
>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> ---
>>>  Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>
>>
>> Abel, I feel we should add the 'required-opps' as well which will ensure
>> the clock controllers minimum voltage requirement.
> 
> But it was agreed in v1 that we should not add the required-opps. So we
> dropped it in v2.
> 

Okay, sorry, may be I missed that comment.


> Can you give more details to why you think it is needed ?

My reasoning is that if a clock controller requires a rail, it is
preferable to explicitly specify the required operating level rather
than rely on system/client vote. This makes the dependency
self-contained and easier to reason about. Clients that require a higher
operating level than the clock controller's minimum requirement remain
free to vote for a higher level as needed.


-- 
Thanks,
Taniya Das

