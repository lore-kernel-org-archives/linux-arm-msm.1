Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CA645D5F5
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 11:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322878; cv=none; b=T8MW5CeRnhSg52+aNBUCCBfWpzhgaLSV4ratf0vqLDMXY7tMKAkiJmVqVAB8IlhAFaO0eKTmGdULX3E6wF+7Bw4dMKCdtpfv0SEK3SlzgZXRvVC9JndpcH+OsD3W4MgU9jzXO+3jMEmbWhNoh2cBdeb0HTszP+nZVRS3WlgELPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322878; c=relaxed/simple;
	bh=0LkBYfAZsJhifD4zPW/pw4O1lnq0kFjI4F2kXScG2Ww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FkM0RzbpZ7Hz9qgHVEYCJQelu4D3k1bzQSjwbb0GlrXgxQeSF6VFyUn0l6CkMips50/2sXRlrZEkOw/imVRiPAVkzkDC1qPcOCVlTVsj+peFhfgyzlhKyN38YxuLbW9VkUyzGU/85r0IipXqInNV+hA+YzdC/tuZsKoWG4/SDMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NeYLVEjh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NGOjVwqs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NeYLVEjh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NGOjVwqs"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7felP1054254
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 11:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0LkBYfAZsJhifD4zPW/pw4O1lnq0kFjI4F2kXScG2Ww=; b=NeYLVEjhcVvjgyC8
	Qw0yx1EgRkr5w7rXfko95cuXAe5ephuRwZkCDm5CZNbpDCgNbpLYU8ac1ayi/emu
	crLVhW3JkVFYOVH1xuRb8EL/3SkMeqtdRp5RZLrBrbKZdL6Lm0V/ocxWZY5sLiaE
	/HcZKarqMwB8i0tbvsh18Q4mXYYlD9JwMFnfosu5akSln6SeQ2TdHS87hOSbzSbN
	nZISupus4n3KpSnTCh6/Y1V728gPEamNNWfsR7rjJt88oW3UBGxGCkQ/B+c5X/yR
	is2p14iTAlVDjGRj0gC1mHqLeyAitRQNcyqj1HAKTZMseXDDDk5HtlqGZpEPuLYu
	7OE9jA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqa301mbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 11:01:15 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb835525b13so1107703a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 04:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785322874; x=1785927674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0LkBYfAZsJhifD4zPW/pw4O1lnq0kFjI4F2kXScG2Ww=;
        b=NGOjVwqsWOdjofBYDeCYBJrsBdBoPJ5+3WXNYqQxIh7vfjgvwR0YdiAurShAxBMh0c
         GSt8fj82xhS722nPBCerCo/lrCaaAWmnaczJ0nIrrpweCEZdnVW+JYwyK8fhW07lmgz8
         V3YL9LgfWxIwy4otYTodHB08H+LzEEp6WVK1tZ70ivnqdt1kw2pDT1qQkgvoopypXvS0
         YH2sEw8vGwbJfckQ2LFs99T+Z1NpuNRzRZQUXyKZDsIY19rhZnyro/8vcy/nuEGiW+vY
         UtcA/lbMaIjqP87xBu4yN3waECEzZPNMFDu3F5l1tI/IAWhu0Ib02JeCspu/yNrbp2li
         DQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785322874; x=1785927674;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0LkBYfAZsJhifD4zPW/pw4O1lnq0kFjI4F2kXScG2Ww=;
        b=a9u6hxLdVMJ8N57tHsLjJ37Fa1e61HVPgZiziJ1UJpD5DcLpvSQicC1KsIAl7GLcSB
         mQ2eKZyWRbaVsu9crHla+Dc6IHTjsLJPU+XjWFj7Z/LP5erOHVLMxMnm0S3P1nAIjNTi
         j1Nr9RiR70dsfdfJIARGvyRWtYaE7b7cL9fLOMs6dSQ49v/jxjSJjmxtOaN1dgMfOsjG
         lpS+IuKMdf+UoTuQNfl5zNJfGE3ZJfiiVUavDz0KOC023Y7lW9BnH0fv/ghD4Sd63UcT
         GXl1nxHJDgi2KCXxEuS1yOnj0fic5qA/wXHb9c/Z2h7gGyFDHLzBU/PR2dpaFS3Ggv0n
         sPMA==
X-Forwarded-Encrypted: i=1; AHgh+RqHl+xJSOq0WyBSx2+Si4clKSdi2VW4xXVbP1ecjFTkv9Ba9G7O0xA/BkmnGl5PJ+CmT/Riud5hxhJRQcLW@vger.kernel.org
X-Gm-Message-State: AOJu0YwnVrPJcNwqAvvScFU9rdoSVjDPePYywk8YzAFDtEVvwYo8mIXK
	w6H7hrCl9EFIK4tY46KRdKBxmDESzMVaqDBqkT9NKVhBW06DQGmvK4ZayQo4228Tcv3iOQkVyUt
	UtdH2xG9k1odKd+zfBHkzMzhR6FeKreRlna5qazwee+rxUqZ6JjIUDlFGizNRt/mHKKj7
X-Gm-Gg: AR+sD12FRy0ulNtx2S8peVeHdzHG82E3hm9/Ag+sINTd75TRrK3PbQfE9ZiwLZ0bJRk
	4yg/f5wrQFs6LXzY6dudr8uDD5K1xbiFVzAusBsULX0WnQJL82IQVPGa8fxW9aS9XXFBWRN2Ta6
	oKirBbx4CM0g3ceBb3ikCaKab9D516EToKfshT5tZs138DPSiQNgebTgLxXHFGyd92gGmN379U0
	9u7IiT69r+Ry6OX6FSDhKIxnE4wJiVpE5VKJekrbmhJYAQoF6JPLVwhgISV24lxKCJwoVm7OUJL
	zlX0wLrI58pD5dOrYkaOvBJf8/2ay3zZ3zgIAOhdUEk7uKM9a032c2h6asSnubtUrfX30yaj7a6
	8XkUR/bWziV+4Yo44lg3feEdZBvFnhov9
X-Received: by 2002:a05:6a20:9143:b0:3c4:2fe1:fa28 with SMTP id adf61e73a8af0-3c8ba63c421mr7492074637.71.1785322874340;
        Wed, 29 Jul 2026 04:01:14 -0700 (PDT)
X-Received: by 2002:a05:6a20:9143:b0:3c4:2fe1:fa28 with SMTP id adf61e73a8af0-3c8ba63c421mr7492019637.71.1785322873871;
        Wed, 29 Jul 2026 04:01:13 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504dca6a8sm8990545eec.29.2026.07.29.04.01.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 04:01:13 -0700 (PDT)
Message-ID: <cb344e15-28c1-16de-b871-a39c01d52345@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 16:31:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v10 01/14] dt-bindings: media: qcom,glymur-iris: Add
 glymur video codec
To: Bryan O'Donoghue <bod.linux@nxsw.ie>
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
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
 <20260726-glymur-v10-1-de451559e88b@oss.qualcomm.com>
 <cTyvVlG4njDAALGERZCnJMS54r5ZomPQ6aLejsdTWw3ifNJ3yuz38KU4j9_PrlabOH4e0Oo4XsuftZkODeXPg1ecfCRdlKHTLkw_JWXWnRY=@nxsw.ie>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <cTyvVlG4njDAALGERZCnJMS54r5ZomPQ6aLejsdTWw3ifNJ3yuz38KU4j9_PrlabOH4e0Oo4XsuftZkODeXPg1ecfCRdlKHTLkw_JWXWnRY=@nxsw.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yP22rnpWmr0H0Mzbt2Tehtef0Aoir9qv
X-Authority-Analysis: v=2.4 cv=EME2FVZC c=1 sm=1 tr=0 ts=6a69dd7b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Mf6ET5Z485SzACLcFDwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA5MCBTYWx0ZWRfX8RLjq0xNXWGh
 2Q8nkzwLfAc451Fo6StsXLSeng3YF3POGKyThBcD956oYhSGSf7FVr7sET8L5V8kh/kYdTGusBc
 8oKDUBtAu7dDR9hx6kfHcGpROXxR2gE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA5MCBTYWx0ZWRfX3JefXNKL/+Lb
 COhKuRdcPJPmn27XtuPsrYW7Az12F2G2iMSZxmT4nmmj1WpXTqeOoLFv46BmKvZ2tp620SIgOI7
 G1GsGc+GDYgDZTwh5HVaqzCGY3E/gKpRrFpECI41JAZ7o7nsCVOo5b6Ga+0fpYv3bpMU/6pfTpq
 q2Jzpx+RzgLXqaqQspyKKXbbvBFnwc8JzgVPLrL/nQR3GaBJ9646OtFq4+bWLMSHi5gdB46GI8J
 Qih4qgx/p4/wC6HRDRezN2GvUVrNyxo+BnDCbigfkHMLsZPDowsQHIP75K7o7FSj3lst597rubR
 Z/O/cWX+Y1AyuR6sHGEuZaWXKv3InG4i5ZerwBQCTHGbwxOqaTBlBTF/yh9dbe+Js9xkDSv7pnc
 Xji3XLzlRyQi/l9SKLjcfmpYcT0FTwPwqvqRm7t+CkZXDrvgQbFssWKmwgCSdbkwJxY1PM3V9Af
 927iDcRU1NzYQB5PqGA==
X-Proofpoint-ORIG-GUID: yP22rnpWmr0H0Mzbt2Tehtef0Aoir9qv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290090


On 7/29/2026 3:38 PM, Bryan O'Donoghue wrote:
> On Sunday, 26 July 2026 at 06:50, Vishnu Reddy <busanna.reddy@oss.qualcomm.com> wrote:
>
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
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Krzysztof's RB has been dropped from v9 to v10 here.
>
> Is that purposeful - all of the other patches in this series have the relevant RB's retained.
>
> Using proton mail web thingy so my email may appear weird idk.
>
> Anyway please indicate what is going on with the yaml RB's here.

Krzysztof commented to drop it on v9 as the binding was updated significantly,
so it was removed in v10.

> ---
> bod
