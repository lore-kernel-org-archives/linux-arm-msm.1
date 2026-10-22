Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792664074;
	b=GtmFWHYyCTW5mxn0vLMvgf4RkCeqqhN4QtTYzohak9rdSnMb0npTUnrNHcVFWxsCqhDv
	 3czFvpahz8xinvrv9COrk07mxtJ0NYZp8cO5Q5s6H1i21gENUQQ89OI0hOUUEZrmKkVDd
	 L/m7EXvxVxohM/2pvEdsZzlv7GiWTCt5HBQxRxGyzRTtd0kiQcC9Cq1to5CQ3qyWebuoo
	 dmND4pmqoxwjGqIMky1wHMhVaI7v2pBqU+4lXty4gtQUiO9a7j/aeTmBdHy+OqsPoq2G3
	 AT538BuOJJZ2v7/mTAJo+6x8R09Ib1sZ5kop3KWLynv39xBplYF4Dh5zE1UyxUGUN1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664074;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HUE0GXS7XZN5IUzugzmvSNJ7RHIYozYf5z1Xco3daL0=;
	b=Q0m6PyM0T+aKecCj04pDrSBR7nS1morDxzkTAyUSfu9nF68y3AWchCAJrj5lD6GxgwRz
	 aVJu6HsrmWpAehS2Lj2Yx7Ke1QnJsmUlvdJt/CC+ES+GUpKk51QVihGR5yFmNsjcX0Fi+
	 aWkcF5aJD6P9M24yNUe9F1LQSVpri0x5vzZxRpqe2pAGN7w+bjUfYfAwJcTxGGHSYx4KU
	 AQj1amrWI3qowbGh6mRFItv4XTKhMtjZU4DxdZCaPHrylEW/b48mNc6bFh2yiB52Mynxn
	 6uHXBTpy0zgfE4guhVuECJ+mkiVUgvkQm1QwcMAnaRBPOGv2qCHuT8hx0+XlIgBeF8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z3bA9Cc2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XJ5ctBke;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0C8606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC0C8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z3bA9Cc2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XJ5ctBke
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xmxr317701
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HUE0GXS7XZN5IUzugzmvSNJ7RHIYozYf5z1Xco3daL0=; b=Z3bA9Cc2wmwHfcbQ
	2dXZkTATr0wGHFo6NBXCZxGGDR+EO27hkpzXtAfi2tenSKG7qqXfP0gFmIucLf0h
	MyV0ng3YBN7qFqtcX5HSJkPD4Gkg50I34Zy1kdL2L9x0DFBmYs+7NeWvwptxG3qQ
	yAdqJGbpRKRW/wIKfPUmrzCpsgeCHThUzyZLhf4oUb4ineHgE4IWt4B6Jy0/0G5K
	uhiuMvKSGt6uHG+i3HImzTZd60MTWbpm9kyoBXPRk8XwXLPnnranV9b8SxmAm8C0
	xpbj0Xe+3qsnDXGKJW/8OAkBQKqokJ+TXjOZgDkMuoiNhzS2TdTVNCCAZGG11sW4
	4oSdiw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahxp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:14:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f3960dca5so50416085a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 03:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792664072; x=1793268872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HUE0GXS7XZN5IUzugzmvSNJ7RHIYozYf5z1Xco3daL0=;
        b=XJ5ctBkelRdT6ekouP1PD+Pfo0Zhva2e1J98smrdsPgMl8/p57TsV8Bk377mmmG1EA
         roQyqJSRmv0AMoLZ749cksCX5K1vsFtdvCSR2OgB6MT46wjc210mFoRvFeVbePVbNbn0
         nok4g7/bKiqy/IGwkh2yA8f7yOwS8PGlyjHhW1byO26piiQFea/+VSClwbR6dGvaoh38
         PDvrVLftJaeQv/cxKrcCKMYR40UQN5XDWjojh8q/xT7O9OcJtLC2eB9lN/6ZKNYxh0gp
         w9jkJTWfBUSVIPzUXOj3OlTKU6e0U1Ygd0a1JkQ7Q15qzlMz9/X9ciLvVyT7xkZOZB4x
         SEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792664072; x=1793268872;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HUE0GXS7XZN5IUzugzmvSNJ7RHIYozYf5z1Xco3daL0=;
        b=1MYcB2WBRogMFUKjVSToXlev9IVS4tX+jHHE/7Ju0yffq0SNPHNv7VMYLlyNJ7bCPC
         LOL8/f7LAVsmcKX1+2E5TN1JCEVs3ii2YnorQdqaFeGjenacmyatQ8uSiDfHF3msC483
         fXsKizF1EzXIEbE9vepCabvhWRTK7P4SJxxzzVXiF2qeTrUh0YFEDeYJobHidLlmcL/P
         PseEo/TH14uZ19byUfVy6XCRD2qs45TyRDuDQRUzLO1Vet1lsnV3y5xvvLoPDUCeMMTM
         qKDx9j0nTdb25gRloFoUFp6ltD8vNhGiT2vmRMKo4D76BeJAMRIIEzhK9R0jXsw78eRR
         ZFjA==
X-Forwarded-Encrypted: i=1; AKwUvByzkmTU5hBRcPsY+hQv0Jkzh61WxTGgD83Zdh9PtDPas9y7w7PN/aYhN+1tDXGjkz9XmjESoA+8bhB1vU0Y@vger.kernel.org
X-Gm-Message-State: AFq9FYL24CesZAd+Wzi/90ETUnnw+JNZmw6VT4Obo+qJUhDvPeaXsG+O
	J0nT5DPJvafXvH0xPiyey9K6cqLCK1T0oMcMd4Xm+VOdguCnwSXn70Dqk9ecVjFgCjrOzUgKhVs
	b6nrUxCs8wTdJg7Los5AqomJp5shH+qG496pvw/pxMYrhan6mww4173qzs1dUFWONK7gB
X-Gm-Gg: AYBFou38DZjggMu4fY3/WcEpy/BWn9odjQwlj7wcqCi687D00V2m8S8x0aJJ3VamWBp
	oDXha/8WYne/zWVrLJvprs8xLI76x6wAgamOSbHnKGLJGq1VSq47mGdLASPPNoy7xVFfZBZeMAd
	EcGg/wx/agkTDJkbeZGHc9itwO9zEsVqeJX7O1YWz9nihuzPQqc8R7eFcsgkfEtANh9tX372v3a
	v/QdM4PY8K5zholCnRYLqoq6gmiJG3ItOX8VInyC276WwxVxZJvSaMNW2wxf/9rKC092P+26tqi
	f50RafmqeETbU3db5iqXWDxVW6mqysKwvhUdgItrUNpHv39QWSmsx7xPS8o6tZctk4kZmb0Aqcc
	df7JVPQPz9piAttgZhmvLLQ==
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr1137722585a.6.1792664072324;
        Thu, 22 Oct 2026 03:14:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr1137717885a.6.1792664071871;
        Thu, 22 Oct 2026 03:14:31 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5dd548sm89397066b.65.2026.10.22.03.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 03:14:30 -0700 (PDT)
Message-ID: <e0becea2-c5a1-46d4-932e-50517311fb96@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 12:14:17 +0200
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
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: msm8917: Use a shallower cluster
 state to fix unresponsive idle
To: Reza Kurniawan <imkyufie@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
 <20261022-psci-fix-v3-3-9ce2133c5659@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-psci-fix-v3-3-9ce2133c5659@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfXzmwqO/yGMbNV
 oZroVLC/WuGeVfPQ+cljIcniJMwzPLJH69RfZ25wB77UKvzV6rENZdKsb1rUD0YaopyxoqP6ruc
 7PDmtls+pKBqrXEUc0Mq8AFgzrRV9buUAihy+6sNBkLloYvT5cRHnRSApO6gpOnHMCq7zqo+rHA
 bGXtP11YCTfl+KhweAUAU893nMsZQacMWOtHcipc6WkBzvv4XoY/DPaGnWIFkNXMpNaTMXw5oxm
 cOvlQo22GH2aVbgzv8t5cKkq3cWxJcXC0LaE++1e0xKS4ZzDoqCXsjekhXYOlqXVqKV1MXRGlJL
 zPIY6FPD+WO2nRWU0zNLdeHdNfYkq/7hSMt/JjB9qPZPN/pHH4kIyXdIgidXOCxIvAYN0CtgZWp
 7T1qE8QfIMBpbFKKKqk85wPuXgY+pq1I7RpMNT1upwoFd3NpksU0Kwm4U5gZzXJHEJmmscNO4ek
 Xrbf9oE0fRi2OPUq56A==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ad9e209 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VTptWAqQFsUFMNnqaZMA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 5UiZTbrYSQWeay-JBaWwCQkYQfmWuZPj
X-Proofpoint-GUID: 5UiZTbrYSQWeay-JBaWwCQkYQfmWuZPj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfXyG2F1YUUaxkY
 Pn78TV3MtFr9BjuR1WLv3Q3z4OXWDMWn6nvJoJj9d5JzVpJZCprI9gOavZcv8w/vdKagwAFCTsf
 NJBo8wFd8TVtKOTRlY/F50qSgI+yhDM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220040

On 10/22/26 11:41 AM, Reza Kurniawan wrote:
> MSM8917 is a single cluster SoC, so powering down the cluster means
> powering down the whole system. This causes two problems:
> 
> 1. The system becomes unresponsive, even to common interrupts. Waking it
>    requires an interrupt from the MPM (MSM Power Manager) or scheduling
>    the MPM to wake the system later. Linux currently has no way of doing
>    the latter, so the cluster may never resume operation.
> 
> 2. Entering power collapse blanks the screen. When the state is entered
>    and exited repeatedly, this shows up as visible flicker.
> 
> Even if MPM scheduling were implemented, the second problem would remain
> and it wouldn't fix the system being unresponsive at idle.
> 
> Replace the idle state with PSCI mode 4 (dubbed GDHS downstream), which
> is less aggressive and can wake up from conventional interrupt sources.
> 
> Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> ---


https://lore.kernel.org/lkml/20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com/

and

https://lore.kernel.org/lkml/20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com/

are in flight, you may want to integrate/test them locally!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
