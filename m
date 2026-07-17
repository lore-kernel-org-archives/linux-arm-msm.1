Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6B134DCE0
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 03:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784260118; cv=none; b=kKXkkldupMmlFScY5eiUm19+ARQa7Iaclh9K8/fTSPxcilRoSgYusG84oKYdvX94PNfeqget6OvVWn8RhKVvJEOLC0PbWkFdf1VO+npShMZQEmgvYk8b0zqeiZ8jyQzmdS/VbiM2nUmzninG8szaH/deLH/7fMf00TBay575o+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784260118; c=relaxed/simple;
	bh=Sa3wk56MV2g/ndnDgfSJgHE84Rp9SbiopO4rIgP3Ijc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P/y8+hY9HMLqpsSW3MLB4/W7oE9SSLcldqCntztFSieM1bdGBBerBfz9Y811TBKJe4zH4awpe1ecVmu4om6EXjox8vPCwWSnM8XOibHB7SXZhw+By0PoLrkdhXXV3tEVAbdap2LNh6pZZjmMpPPRUkaLG+dTtxy7uKj0iXSB4Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jqmxyi0B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g6eDH9QD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jqmxyi0B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g6eDH9QD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33lmA469389
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 03:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sa3wk56MV2g/ndnDgfSJgHE84Rp9SbiopO4rIgP3Ijc=; b=Jqmxyi0BoBIbO7SH
	m4Ze+Co4+zLo2mX7ah0CABGEPhAjxVMyzc71vmcub7tF7atTvUJkSB44okuHQQcP
	awn8Iz15DQw4Sj9zMck6wwsJ/Gek6PjVqht7DBltNUJgKWUVQsgDIba344ThT8db
	eu54JqhePGGKoamLY+e8C3vKaEfleJx2mbpS0+vxcmxDGPTqLtRxYgSOSz7C7RH7
	30SGP307HrIG7NGIEcwgV5LKq3apqmMKpcG9lse66cO4HO++QSeAGKUrKo8qb1ms
	arGsRtJvB1OEUvCm7Oz2SbzSxhP8uAm+myA6oV+RBwNrxoY1eA9iaR6m7gh3ojY1
	1BWKCg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff2f2tb20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 03:48:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso6051849a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784260114; x=1784864914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sa3wk56MV2g/ndnDgfSJgHE84Rp9SbiopO4rIgP3Ijc=;
        b=g6eDH9QDP1QGbOadxYNxryuYZKcaMd7QR3/VccOyX5cLUT8WuVNJ72vCPFz6uIwkoE
         abOEBNZ5iHT6UtwZVqIIJ2qGiay6B+ThbBDtXadbRRxU8+AAV9cyT70JkMbPvHvcMM9/
         ynJArGapXbLd6++wBTAhBjk6vh2CyAtAr1zGQ9vGmZQOLv/38BIy6T33JGYmpBckeySw
         ew0TXCjgS6jsGpPk/pxInA7XdfL5bQAUrVA5yJXP4pCOYc3iQkynlVq+XTU6SO4KRCjQ
         B3MNCqK/ztZdjKxzj+r1j/ewfYGF+VvpDZGWittBxZd13q9d8ft5AfaXKm9idlSGlQre
         ordA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784260114; x=1784864914;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sa3wk56MV2g/ndnDgfSJgHE84Rp9SbiopO4rIgP3Ijc=;
        b=GtQGSi6elEx4UJjGOrgQoMSB+Br1QSMMedEFG2tnLJejSrl3Nbd9d2dmxv+LskSV+J
         fFhoH9YLXiC3feMRv14IG8THEHocS9X6sGtUZJ2ziM9uBKxHwxfnHjRxsdioSHJkjLm6
         orpVJfJmIViRWyFjo8eUe81p4s+n3s94A00Tv9ImfBoEQRUxzpKFKE/lqBK9l50Cxgen
         b+NuRmD/hB+u1T2nvm8H3xJx9bhnRqO9a4f0gq3NRlCMQeJLawTk9FGHewJuCiFKdgZe
         uFhiCx5AGYNye/iQbmFKG7FE9oejNety5hRCH6+wKg07I48G0seunCK7GG58+lrWeGGL
         glQQ==
X-Forwarded-Encrypted: i=1; AHgh+RomRZgZe1ujNe4iYr0Ud0bdRblDc6U4esrBz9lILne4EwvdtY++hhIurOdILtXawLKg7Ew8HBx/Ws2ShA9A@vger.kernel.org
X-Gm-Message-State: AOJu0YxAJ1o68L9rNp/w+k79BpuebBHZeQ1dN+olih4B3Mkn5LWjOheP
	dmDnH9E/GdC3AXNjqTVnBIUd/e/OOWOaMKokpocCh2THbrkT6z5qx15u6BiTSK5gWh8li8EKDNp
	UOAXn7jXn7kqduzSr4N8FD1aHaEJhSgjZHF737xNEBWq4RApo8ZkxmB2Ds+Wn8KtnPgKb
X-Gm-Gg: AfdE7clqB360J6FRtE2maPV/qrbd7Yuq0aHq4sI/M1ETzegn0jfX9Uyr8yODKUhESND
	XgqQHGtPCvYduRt54Obdkif+Z20GpFBwraN1cbxMVcei3kjI56eWAVhfXK5nihohLuGxElY4DYN
	w3cv9HNfuBn4UO7SXStdKY8dIHN13KdoFOiccpMl2MiyNmS0qnr0LNNimN2q/wLBpIGoZGphu00
	7EEyHKjfvQiGh9dZ67/E+t7PMscbOQyRQsm8htFCV+/bJXB6weM/sQaXdLd53Oaj8RlSRln5fSo
	/b4CD6PnLBM2iFU5U6PW97xRBEdraKHd7eacaglFZ2HsBmg8Qeegv7e1av62cJr2hNEwuMI8Mib
	LZUSGOSY+XimSgGxKc/KernWnbgsnC9yR
X-Received: by 2002:a17:90b:4c48:b0:387:df8f:1402 with SMTP id 98e67ed59e1d1-38e4b57e9aamr785468a91.35.1784260114123;
        Thu, 16 Jul 2026 20:48:34 -0700 (PDT)
X-Received: by 2002:a17:90b:4c48:b0:387:df8f:1402 with SMTP id 98e67ed59e1d1-38e4b57e9aamr785438a91.35.1784260113651;
        Thu, 16 Jul 2026 20:48:33 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm1547122eec.11.2026.07.16.20.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 20:48:32 -0700 (PDT)
Message-ID: <8ebd304d-b03d-a8cd-2bf5-a45763780098@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 09:18:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 01/14] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-1-8cf2cbe12a07@oss.qualcomm.com>
 <20260716-soft-dexterous-adder-badb49@quoll>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260716-soft-dexterous-adder-badb49@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QYKqdqa1u8bK3QvZbJ5csaqaukWSSVL7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAzMiBTYWx0ZWRfXwJ/MoLjBd0Mx
 9332YUIlcyvzbamPxOsMthtmkN1satHYHAF0iU/DPoTTD0zVze3Ia2BKZ7b7zIFKxNeQwj+KNhN
 rz5uVI6V2psG916+k0+G/n46xBUeXME=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAzMiBTYWx0ZWRfX0O+utxpTVJqg
 Svw4u1YMIhxIABqymw4kDXmKsLogTJJqMqSfHFpz4q6MLnh8rdALEu1tVOxCEU55zfHTo9oLBSl
 FZRNcrZhNLFEI9Ur27dhSz6A6eidLY1IGZBkeHmt1mzQxPbpJsNlFU38NBc1VwM77yRbVIHtt4C
 4yzmdetZOrw2NkLPEB+Cek8+X2p7FfGp1KRptC4EvUFKXg1DMYtCizOSxXPx0LC/0akKTjG4lxN
 J5Rvesd2pn1Ix02zsML6Q9W9gseaKnUzX+A/y4t0L0tyAacBgikUth1skY3FlSEoO7xR7suzd6q
 b6GxenQuL6iArSGj4ZoAEwsWcx7BkEuL2SpxYUHOTeizlr7RUg9k7AcFtLMe1CsQZRphD6Kq1a3
 /sNEB335mHrQXD0G6AwcpjIueip8PNAo9mjREpawdkHGm6ZywVog0UmFsH8uGWfr+9luyITiM1U
 F5uJvLHpK9+ej9tStqw==
X-Authority-Analysis: v=2.4 cv=NcTWEWD4 c=1 sm=1 tr=0 ts=6a59a613 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Mf6ET5Z485SzACLcFDwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: QYKqdqa1u8bK3QvZbJ5csaqaukWSSVL7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170032


On 7/16/2026 1:10 PM, Krzysztof Kozlowski wrote:
> On Wed, Jul 15, 2026 at 07:39:55PM +0530, Vishnu Reddy wrote:
>> Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
>> is a new generation of video IP that introduces a dual-core architecture.
>> The second core brings its own power domain, clocks, and reset lines,
>> requiring additional power domains and clocks in the power sequence.
>> The current maxItems constraints for clocks and power-domains in the
>> common venus schema were sized for platforms available at the time of
>> authoring. The glymur platform introduces a dual core architecture
>> that requires more clocks and power domains, exceeding these limits.
>> Raise maxItems for clocks, clock-names, power-domains and
>> power-domain-names to accommodate the glymur platform.
>> The glymur platform-specific schema have fixed constraints for these
>> properties, so the common schema only acts as an upper bound.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> You must drop the tag, you changed the binding significantly without any
> doubts.

Ack

> Best regards,
> Krzysztof
>
