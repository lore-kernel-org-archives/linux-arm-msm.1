Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869013;
	b=mgJAdd5C4pILmQe3IMPf//CbosS8gVEKmTzjYgMT1mP3BggtQ0bbm4oB+db5dGHXV0ZR
	 DgkNj4ZOxAGlvi9Jw9K9exo9tE361Lzib/8hJ0cWeCP1rrWYb82mzIYkrfh4PxypvY4Ec
	 Wx7kCJhulGztnVdVNNzig5GbG+NXFRwKYxhwYrdTrVU3kWZ8HaN/5IDCmOJ7NdiosXu+w
	 MLvKi3tZ622xrDgo7smGiypqAbuyScecbyRCBjKw1oY4k9frrD+uUUKGlPy23i2T8tHxc
	 HWCw2hXV9kclzPFCmYh3x4Jd7EwXNhhW2AQxFai5e++KfcLR3OdFVQNjsWIKyRVm0sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869013;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ll5HHjmuNho7sSH/k8QiuGBNexPrd5SRjnX5v1inucM=;
	b=LcI6VxuzxeEacsXfRsNlv0aEt5L5fjTw1UYorl5ij246sA3pne/CkgINt9t5w+01YLZb
	 VriH1zy19KtwcZ0u1T0FZ0/QlNO8s9hqtb+NZ33U7u3G1DmemxEBb1+2v6c8PzDpFIQu4
	 kC3XP3TwVwfoGE0r/c4bMGbThpEMPF+9daSU64INgPxDjZUv5KKeKnL32FchMYSd+riFM
	 tqbYxX/f+iRBbkpZJfyeO0BVaMUDnx4kAqMuMA6tR2+ZqquELND/S2udIB8rHpR3qmcNK
	 Rn75zYEMw6Zs0lCz/RrXm4WVItaPZB4QsJ0NG4f1w7/PCgjHWXboh/wI2l3nhJh/YxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFGku3p3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LXRZPdzS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B643F606A33D
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 08:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B643F606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFGku3p3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LXRZPdzS
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56V2uA2588290
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 08:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ll5HHjmuNho7sSH/k8QiuGBNexPrd5SRjnX5v1inucM=; b=cFGku3p3DX77c7Od
	hScyCf6gq+Ionde83X23nIUfLXVdmqqusgQE6NmZFxrGVZChKwXmWMOt+lCCsaCq
	rS5iVlzBCL3W26ai7m4EjDXwmrdC6MRQBbCIKtsEPQsBO3EfISJ8D8ZQNAicSpZv
	FDxFTLxesGz9rGnMQemaytfY88E8g59ck0Z/Zd5ua/V9DPvMdWlmexmYgA6GH1e8
	Nflk1KAdsKYadeBpXAziTw5UuZAf9cSfa+xtYMR1L+lOyi1gGoKBNPpilmUFXRzu
	2FjUKLJrD25/I/2NqfZnYl3gIl9E6ZIGZpxosFpJHcEz4D6HOtzGyBegQu8/BBrA
	YZDWDA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr89sumky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:56:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so1609232a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 00:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793869011; x=1794473811; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ll5HHjmuNho7sSH/k8QiuGBNexPrd5SRjnX5v1inucM=;
        b=LXRZPdzSBk6hG7METAaIvNcKTRuM52N7KGWPG89CSvwRTS5yOR77KVPvYpPijD20IE
         pUH5Aa0tHufuqs/vajUAa35IseanAJ9aqF9Nt0UZt7j+lG1Vur+Q1MjDeDqqVLmhL9Nb
         Bi0c4j/IDEApNQz3NNuE+FK0CwZwTmCTYl7SQXb4w7iKikjufDFoFIUuBffNP2dLubBf
         K27TEOcyc12Oc67libY8ljhtths3DZWi7Dr4BOWRKQEVb3dEqh5YdcZVcPazAsUQW5O5
         RceICo4057hkN+K5jEYWxDVFOCtiQmzlnWG7+kXrq2grI89W7c5E2ZbyXKfVTu/1LfL5
         lpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869011; x=1794473811;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ll5HHjmuNho7sSH/k8QiuGBNexPrd5SRjnX5v1inucM=;
        b=gSPTQ2jZm95yPuPozESrHl67IJSzDbTYWdILabm1YNvNXh7uKuGWlXTL3yWPp+eEjP
         5UxFodRlEDyLYwLcRr3GDXjXd6lfrdJmnVRh4/zW7z208lVP11sBPqXzLX4sGKd/3LTw
         7VzYci8F+drKN5MEF4dvBnjQslirEw0JPHFuhhgzxUh2YACPYS/ms1Bu6LtJaX6XpARW
         Ad2i5PgkXKn5hae4wDPBV8kHwYQa7ra3WPm1DB1N7pZ7kFZacbqfNoRy8b79Ksg3KWxO
         5omJ5WRq5K/fUP6940q1/Gp3pCs5lxEFyLFtSCbcKpseFUZsyJhWCoFYstoZbnFRondu
         BKRQ==
X-Gm-Message-State: APuU4Z/datoY3omdyIndMRMd7B6h06m+so2RPrCeSLK0FgQNG9PbsHRD
	g6WKyuJVjHN0VQatKdtsN8Ffu7npPS9blcp2IJcX1tsSWZPTy3JV2ye0trLJHBN0Zb3opYbxQqY
	fORGQnY5J2biLobw/bONwjV20hQtYXSazci8AP7dL3zZ4Hft5OIyyG0hhLhAfmP6JhION
X-Gm-Gg: AYBFou1iQiLrrUNzohW4ISUnpn5g0lTy3NaoanaodC47EpaclaTOe+CW2HL528pKN2c
	5fy8wzP/aPuHO33VsE1oeUu5RpBqjnoT5zTD9p5e6YLjOI7Vuzi4+JScqOXKolo9aaYdm7x+Fhe
	cFTbjK57S/BIP5K2i4grEAHLZzkMuGo3lVBFqBXoyIpxX9/Avw0Fsja2YNmbXaTwOTPVxvjvZux
	my54pUaFFitc3IWrYbAPBaQNvtt3wDyo7ec4onJBMb1qX0ULPwmI+/+pdBmoxjlXopY1zqCf3eR
	Wt/sA+TZp1YTb6eIby+LibfkVGOJYOniI0bSBE4ubCFb1IsDMd3CtB5I0ybUkpbnWJdhbTU7DQ2
	TdQU2CeAmc1Y4OuKmnjgylo6n1JcLt7EHJnEoFhazt24wRsnDxOX160otzZHh2FDxprrfoQ1LS8
	cT1KzFlljC4wFKe0NSBOECCSyHpkA1DJqR9LpaH181VQ==
X-Received: by 2002:a17:90b:33c2:b0:3a7:a6bc:9d58 with SMTP id 98e67ed59e1d1-3ae897e076cmr13614239a91.54.1793869011259;
        Thu, 05 Nov 2026 00:56:51 -0800 (PST)
X-Received: by 2002:a17:90b:33c2:b0:3a7:a6bc:9d58 with SMTP id 98e67ed59e1d1-3ae897e076cmr13614209a91.54.1793869010516;
        Thu, 05 Nov 2026 00:56:50 -0800 (PST)
Received: from [10.133.33.106] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31f8804sm2910640a91.17.2026.11.05.00.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:56:50 -0800 (PST)
Message-ID: <f8ba83df-f149-4703-b0ed-a7fd00608cbc@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:56:43 +0800
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
Subject: Re: [PATCH RESEND v7 1/2] dt-bindings: input: Add Qualcomm SPMI PMIC
 haptics
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
References: <20261103-qcom-spmi-haptics-v7-0-418de67ef84a@oss.qualcomm.com>
 <20261103-qcom-spmi-haptics-v7-1-418de67ef84a@oss.qualcomm.com>
 <20261104-myrtle-kelpie-of-chemistry-de43cf@quoll>
 <6964d550-2ddd-463a-a142-9e8f72588803@oss.qualcomm.com>
 <4edbe80d-f1f0-4e85-9973-86da7649e9bf@oss.qualcomm.com>
 <1a83f9a4-73c8-4a13-bd53-2e779f6ade22@kernel.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <1a83f9a4-73c8-4a13-bd53-2e779f6ade22@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QlXaoYI7_B3gcP-9XfvP57x0aHSyqUWI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfXyQhwcgJbhsFP
 nr0Q6hY6mqBKJKWiA3QHBz88CaE3URFEadMNnQ44NdIRJIkU05/r/jCuPF6QAKMnoVcyZacVAQ+
 If6Na+oRXwVtSxiO8lgOVdGEe0UNO+0IqQj7QCfc3L6Ku8Q9G3lb5B5XesnzD/fpRWYtHGPPm8E
 SB8klpbUqRWqAeiQfHttZS1WhGKYzBrGEOKaLrWmSbCFc7BSgD9Mve98kpRwxd1TZKpEFMDY8W5
 7ps4VwGa4hYqIiuZjvGfoNZ5McMNc4+NwsbV+DaOeGsN1VLIJpc2mw9Ryz1B3GiYX6n1jUOPOvf
 40rmpBwDOND5GBb/9bASyY8pAf8wQ/FmCqB8XHLyw+x3afeELzTsgVFgK+SThdS3FDQrRIk7jwA
 8c7xHLxsUOspZYCMeMLzKhajPnxUlziYsZj8MhCnPVz8PZUhPvITSC6DohvrQeZFdJYW0rmXHRQ
 /C/vdQIuCANEOqLEvkQ==
X-Authority-Analysis: v=2.4 cv=N628hG9B c=1 sm=1 tr=0 ts=6aec44d4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=yLkMS7TIAoMVBHN_cM4A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: QlXaoYI7_B3gcP-9XfvP57x0aHSyqUWI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfXwOxKVU68Z+eP
 jxPx+tbYlVmglnQl4Cj4c6Prjxtr3D6wcLAArUBuyGtNPbMhY9MXQM3sUEgUMLcPur7cmiuE4G1
 o53XkIlC9fUUhXnUtpRjA8h0oImERLU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050035



On 11/5/2026 3:27 PM, Krzysztof Kozlowski wrote:
> On 05/11/2026 01:48, Fenglin Wu wrote:
>>
>>
>> On 11/4/2026 4:44 PM, Krzysztof Kozlowski wrote:
>>> On 04/11/2026 09:29, Krzysztof Kozlowski wrote:
>>>> On Tue, Nov 03, 2026 at 08:51:17PM -0800, Fenglin Wu wrote:
>>>>> Add binding document for the haptics module inside Qualcomm PMIC
>>>>> PMIH0108.
>>>>>
>>>>
>>>> Why are you ending this? On what sort of ancient, downstream fork are
>>>
>>> s/ending/sending/
>>>
>>>> you working?
>>>>
>>>>
>>>> NAK
>>> Best regards,
>>> Krzysztof
>>
>> What's the concern on sending them? I don't understand.
> 
> That they are based on 4 months old tree? Or half year old? Or longer?
> Try yourself. Does this apply?
> 
> No. And if you tried to work on recent tree, you would understand why I
> am asking.
> 
Thanks for the info, Krzysztof. I was working on the tip of input@next
in September. I understand now that I should rebase them before resending.


> Best regards,
> Krzysztof

