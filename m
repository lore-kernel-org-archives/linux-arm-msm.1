Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B65E4E2F30
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 12:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791979799; cv=none; b=Z+IgNTxwtiDMai1bW8ZVK7op4rUweAglU3TQwnTdx8S4fyUgg16Hq2DCnWQFd9gTNugO8UlPAFBTv57o1feAsUrv7DLfIbDbUAObZKPDjzS2kjg0Bz+YlsY3ysUsKD2eP7kzQnlckyu/8cUMhGU1FVYtg5GCsARUirZ+rnan9Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791979799; c=relaxed/simple;
	bh=XqXYi6i5weM3CECcTlhKwAMVjyjTUzcxZkU/xTOwNdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HdyOSy2Vhe/Q6ZUlpDfsersijW5CPimJ5tRoaizgXQrt2ezEXXDad7Mh21husM4IzKmX9sYdTqMIUoanLEp/AE9HUYMzixJLW7p07KjmnW9aapjXk7UtwClD8wr36k4jVjKcnatqi4I3666Ix9TjyM9WYUQszsOq+HTZMw9/yAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KrZIx90i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NRcnBAwU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KrZIx90i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NRcnBAwU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBG4Jw3366064
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 12:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cKe/cXeBwiU+47rxyqBvKFaQLQS2FC5SS1uRMC3gpUA=; b=KrZIx90is89wzscO
	37l80+9vWDnpqO29ftNSCGN4L3wg3L1iIQn9kjlwfhYSbK4zh9SUW9+bHLaN/9qN
	YQB77GhruIq5Z3+4OHxuA7VHQjArdhHAXYe3UcX6wQEdaFntzEEtU+UsUqFstAfr
	XbZrkM0fYcyUuswfU1YBBlEGFWMEvQk9YaMCfvlMs2XY5CFQRBnzMoyApNjj9Vq2
	c0HZ3gTwTuzdqxJjLsAQRG+F1V2rDRL9nlu/2v4jv7nSU3jvun+DRrbyvWiYRzki
	ppJOFYtPSu9MJ+XZXZdhJ/v7bYJxFC9Su+7GtwREdZYVh+Ey0EAqz+a4FidPESZE
	Z3KGbQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4621fd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 12:09:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e818ca61bfso9192955ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 05:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791979794; x=1792584594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKe/cXeBwiU+47rxyqBvKFaQLQS2FC5SS1uRMC3gpUA=;
        b=NRcnBAwUOit5VZu6RQMYjX82uA+ouINbVB+Qv7TSZwGqbw9W9hDUcszgklvtk+eFOT
         0lKXV5yYzpskx6LYSqiJPSidv8h6W/pTQFyjnUk2cj4HkTv/N7EQGZbyNfBnU9TgFs0A
         zwUmZ/xqfg4D2N7WrAuygFVw0IyO4DfxsyDhKcnxPcekHm6/Xkw7Pmx1Gq/iJ2JRQRcX
         9rZ5DYsgxZHJuu5ADL1LVKgd6KiD1WUwDCezq+EAAyPa5BDgnNNvagjDY8W8Hhkd7PPO
         UV/fS1vvRcwR5Ig/x6bNIVp2FVs43UjX8HNrdkbHr52Di3bNJw8EicPPRP3h53yXp1SL
         jkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791979794; x=1792584594;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cKe/cXeBwiU+47rxyqBvKFaQLQS2FC5SS1uRMC3gpUA=;
        b=gy075HCxMj+NiANX9p/Cw9Do89nhcey8ytd/NE9qDpg42Jr7qnxzNcbiTFZmme0NV8
         DvgLuRveUCTHROB+/IVAzfJICm2Dhyek2q82tsV+87+XF+p6IfgZYKex165LBnVys3yY
         c5Aq3VMtPA5aGFOAM1oamsFXuGXpH0giFYmWRXLscL0Zltdvk3vxELvYorXIOzsi0oVz
         BHHmII+o6h6yYyfj7dm1RDMaEjZlHF903IMyNlAswbJd53ewQZ8g4QC726g8IGH6umY2
         Bsi13yxrUrSzwz2XAZFtlTT6fDy5GE5CeUK1bVymHHnBhjs9Nni6GyaN920uv4lMg+Eu
         oq4w==
X-Gm-Message-State: AFq9FYKVoEaita3O9BQHv707lIVYrgI/1jG/CqKcHU6Slo1piEanFuIe
	jZJO136gIl1joPtvmTy3V3bfRQ/Qp/c1bowHHfobx6S2kkw9bQq/LExJHjEywUey7cMFifRjJMI
	ja1yGGcwvc8M+B8mVUc0Uyh3foRR1lVD1uN6yHN04VuVEcMp7s1yZJrB1hVMQ64GU4PUW
X-Gm-Gg: AYBFou3+qUwwtvcmFbYfy5/gZZNZ8MySHH4eqgH32A3sbBnvP5n1s44NDeJs+f6DTxU
	WMvW9uVrLZVrQxdhPsOwUnbxg40ljktTtSyHHVYkIfaO61ZoYsThssyXkK1Iy2yVMqNsA8zLHiJ
	tgDm7jajDjNulCu0Q+mLXQ8ICm7CB0ShYU3b4PRCQhqVTAqDyNsh8q4H+o/Flv1tOjaMoEShE5N
	7Y2Am5r3ZdHY4VebPdI2irqeAhbysKo0nUDu4ZUNrZfGCWTejW/aP6cRF0+sYKJYToWPsCdVWrU
	6B652ZMVSc/wvqiR3qOkz87DWD/++UnLMp/gz23B7PA4vq+cF+W3PRA1LdwfCe9WBY8Cn+8l/Nl
	IU4ElQSYQNfWEKnoznN5rAN9j+SIn6rLKl9H7
X-Received: by 2002:a17:903:b0d:b0:2e8:9820:80cf with SMTP id d9443c01a7336-2e898208342mr98953165ad.58.1791979794019;
        Wed, 14 Oct 2026 05:09:54 -0700 (PDT)
X-Received: by 2002:a17:903:b0d:b0:2e8:9820:80cf with SMTP id d9443c01a7336-2e898208342mr98952775ad.58.1791979793537;
        Wed, 14 Oct 2026 05:09:53 -0700 (PDT)
Received: from [10.217.240.130] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841a02f85sm68385425ad.10.2026.10.14.05.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 05:09:53 -0700 (PDT)
Message-ID: <a121c425-7046-4a08-b746-908d5a3ef3d7@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 17:39:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: qcom: Add Talos Lyra EVK board
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
 <20261012-talos-lyra-evk-v2-v2-1-dcc9316ebb59@oss.qualcomm.com>
 <1cb252eb-a7d9-4eac-8d28-8d7781ea430d@kernel.org>
 <2c93f85d-a6f0-420a-9b7d-cd72a7963ab8@oss.qualcomm.com>
 <ca132d7b-a0d5-44f2-8b98-24570a88c9ce@kernel.org>
Content-Language: en-US
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
In-Reply-To: <ca132d7b-a0d5-44f2-8b98-24570a88c9ce@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nh0iNrrRYEr0NxGJrJvAPuFqAYOEwekx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0OCBTYWx0ZWRfX+q619Q1uuQng
 X3QVIPDsDJcWf9OuvoXDQbUO4hkWy1MkK6WucZbo/UbEt3ZJ5lfhuXkuw++H8rUmZebDMSsmuuL
 SMBniqZELN2b7iT1awn6wRfswwqzG/pq4CuqbfA1lMXLNhGOe4Ep/d08mnp2Rkja2MlHiFcvaUL
 x/UE3INMUUlH+DWV5sBdZm2nHEYLUsT2uowc0CLm/TgOFp2yPct/pWzj1KE1pdftvrs79SHpyzS
 /MFDgV+q46hHktPWuoe3tx4pLMqtFmhG6GMFcYLXvXHDCAZhanHQFyumUDBZgLgDAN36dgcupn9
 5Mn5kPegDKq7HTzjR9oq5Q3nTms0WhrHlaQ0ruvBm0SPpew6nSzlPylPXV95/YPvottxart8SMA
 8XKKLY7T2hKvfjudlhMCBzdEhhzOwnXpaFVLuQP12TK/NsBXP0t7cUTJMOTjMQGa6Wgjk+0knrm
 410uOGb4doF4GA6bjTw==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acf7113 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-yIWcSpDq7JthD1KhtsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0OCBTYWx0ZWRfX4Jd53/k8Eiwx
 k01SQc0XmH+irey/gDki5o8pGWkaQdbk26yGZl5Hd+5Eg0oXN29GhZqA4drKMTUWhji+sRurCYm
 WSDdRTBItli57Xil+H07fVlXmqlr4Rs=
X-Proofpoint-GUID: nh0iNrrRYEr0NxGJrJvAPuFqAYOEwekx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140048

Hi Krzysztof,

On 13-10-2026 15:04, Krzysztof Kozlowski wrote:
> On 13/10/2026 11:32, Ruchira Revdekar wrote:
>> Hi Krzysztof,
>>
>> On 12-10-2026 16:54, Krzysztof Kozlowski wrote:
>>> On 12/10/2026 08:16, Ruchira Revdekar wrote:
>>>> From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
>>>>
>>>> Add the qcom,talos-lyra-evk compatible string for the Talos Lyra EVK
>>>> board, which pairs the Talos Lyra EVK SoM with a common carrier board.
>>>>
>>>> Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
>>>
>>> No, this did not happen.
>>>
>>> Please do not add inapplicable/fake tags.
>>>
>>>
>>> Best regards,
>>> Krzysztof
>>
>> Apologies. The tag was added based on internal validation but Nirmesh
>> had not yet formally posted it to the mailing list at the time of
>> submission. That was a mistake on our part.
>>
>> Nirmesh has since replied to this thread with his formal Tested-by:
>>
>> Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
>>
>> will include it correctly in v3. The same applies to the identical
>> tag in patch 2.
> 
> Again, this did not happen, otherwise explain me how did you execute
> this code on the device during your "formal validation".
> 

You are right — a YAML schema change cannot be executed on hardware. I will
 drop the Tested-by from the dt-bindings patch in v3.

Thanks for the review.

Best regards,
Ruchira
