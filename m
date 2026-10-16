Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9703803D1
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142055; cv=none; b=Ho683w3Gj1xdiWuhxiBhMpTrysVUFLm9dwUe/fTEGRwCAscrbIUsYs+0DB1RnL05CrRoGrNyIHNEJj1QoEbek+44OGPj1UMqsS7mKHyzD/hnl9ArQELaJuK/jR6auk7pviPbpD9/dOzDYWi54gPDL+U6nCgzn/TicisXq9za1Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142055; c=relaxed/simple;
	bh=OJEq2jEr53ZPXKtp/Mi680q8DSbM8duPldM1a9SdK88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gsfnrYcyukO0ZTIH8tE8OQ1seRoPr/iZmqz09jdhLSO9HptrHO6oSf4QvrqsY/HU0PmNyDfduzLKb1UyxrF2RZoDBo5psh3J0kASw6Ned+dIw/FDLIcql2/h8A1ft3aupJs8kUJDpoRGlRoFQOHrrjuaVMy1pFACxBiEMQMDVFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZdOlJQdv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XYvpOr5a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZdOlJQdv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XYvpOr5a"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8m4n7760366
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SrmfRoS479RGoNTAm9ZWMnLNQHWSSZ9Tr8xg5KM9gZ4=; b=ZdOlJQdvAbIjdPSC
	Vy9+CDU/vIr143YD59EQ7OMYrTupZmxkqtPLmQ3L13bVy7NXmseGptjs4b7cXz2F
	10NunXJvNVFeMM3h2ez0N5C282oCn+bW7kooesVDKJB5lqjhSI+E/3VDDrHMDDuO
	o/ZO7U9nO/LMtzOFhqSE9qo3NtA4BR5DBErNiRVzHGgWH/vraMkbkNPYlC0rLedp
	f2MkUKAMOfc7u3B/T3sSdPee0Po+Dq79CwF3U6jLe6k+RSfuqVHWZMhtLfiTQ2ag
	rA3KmCXNqh9o8tgGf6LXBvtVpZwCiMLMPrwPIwE0p1jwuxxo64WciA5imK+DhPEf
	1hXe/w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19tbqw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:14:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-533758f24f4so15963411cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 02:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792142053; x=1792746853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SrmfRoS479RGoNTAm9ZWMnLNQHWSSZ9Tr8xg5KM9gZ4=;
        b=XYvpOr5a1q+omb8/LPqgng6WoFPkoOv6zqlTAHMy3TFOWiKpv2Va/EhpsHRlKUHaWu
         e4sObi4+aGjBxhbp5TlFX4uXTGIK6VnEHktoKL1Nd6fPqJENFo04LMF3hnqR9b8rJfgl
         gI3SBY/bAQzOkhelHWDOYUf6jt85JN0k96NbnxCxL9CstRMCmSBCk8jXb8gghU2dc3gV
         7n8cecWDdOLixbXymCNELQ5+5J/xzl6V0Ol1uwfGfLZI2RQRdzucyPjWPpmqLcMk2eIC
         8C4GVYFqH9osiUP7jdwaRCGDbUbaguCb102RQy7lx2yR3xNe/4RI6lIupj2iS7sJ7R14
         DE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142053; x=1792746853;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SrmfRoS479RGoNTAm9ZWMnLNQHWSSZ9Tr8xg5KM9gZ4=;
        b=fSSNzpa1VGTY8EjyxCgBB2o4K9X8IsBNBn0l/+qoD0DZTNRVRDwzKlbvKzBVxHBMHz
         n8i+TmL1g22WQdAnf0Ho6Buaeaghdxlzl145VzCHFWBEGBXsnwOBHC5dJHa9+Tkr8yyr
         L0nWrYLvPTfU1WID+OX2R5hDC7VU0LPm+zuot2z9on3a4OjmUSI7b8ZhpQj0ROp0LkaS
         kiafMHU6KZL5PozdCMtiIS8v4u3lGFYyp5vN5XwG8sdQqGzsaMTSbqPeBwn0I3YVxnuA
         CtyaWqI64q7enzfcgg4vYOodX7o0LhVvoHRbmJDm3L2Nc7owAkW/jws9aJpNNekzNuXF
         isZg==
X-Forwarded-Encrypted: i=1; AKwUvBz0F23eyumcuXsKiAsZzNMWniZ6eIjzNusZX1JUs3OFt6ikQiEqrW9slkN9xVe5xro4h8yJzKf0n88QPHkW@vger.kernel.org
X-Gm-Message-State: AFq9FYJu1LB6pE1M8qR9e+1tshKujHJY35sRYx9gdvKd9aXltkh9ONrw
	US2f8EKRcvURHyJqCHBLak7DerOYV13xlWH2cgANJs7edqWUHaVGSNa6Yn0Uk7CCeOjFq+5+X62
	l1l6TpDBMf2TFjsN/RrsE+2PERlECZFg5JKmNcaIdB1fWrKxm+v+kS0CFEeB8cOSAvS2PphECgf
	hA
X-Gm-Gg: AYBFou2bFvR6BVGpS/lSQjTvrYBft09aDmj8bkc/zoBrcd2EB15RZosvcQ1kv61aGfe
	wA4B2ThhnqFPI/CAb9Dbgz2mg/ComHDalacr7t3npbUYOQ0VaY9Wg5ROOllwmroVs2Eo2tt+CJP
	kXlEDk4QoN2f77HpNCisOWVdfw6Ns1ZEvw2ehBSxLmWMJ4JhkdoZBHFXJ0qeqb40O+LiEap5uZH
	WplJL/98qHyjzn7IonnZHeMkXvsvlry2cLhH6LKLa/WdSM1t3vmK5XS3ls6z+aj3w7exNVYEoPZ
	QCVoZ5eFd4Ojzf+eRmsGum0+C5RW7N9gcIghXOtkpDmotcHm66vhImK6YP2QOEp6egQ94PFesrh
	NSKL5kjXuQGvNhRM1QGC1Dw==
X-Received: by 2002:a05:622a:507:b0:532:d67e:bc2e with SMTP id d75a77b69052e-5359f0634femr420037481cf.0.1792142052842;
        Fri, 16 Oct 2026 02:14:12 -0700 (PDT)
X-Received: by 2002:a05:622a:507:b0:532:d67e:bc2e with SMTP id d75a77b69052e-5359f0634femr420037111cf.0.1792142052249;
        Fri, 16 Oct 2026 02:14:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c1282sm53264266b.63.2026.10.16.02.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:14:10 -0700 (PDT)
Message-ID: <4244177c-2ce0-48b2-9a0b-d63f1c420f9a@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:14:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/3] dt-bindings: power: sequencing: qcom-wcn:
 document wakeup-source
To: Linghui Wu <linghui.wu@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
 <20261015041241.2186521-1-linghui.wu@oss.qualcomm.com>
 <20261015041241.2186521-2-linghui.wu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015041241.2186521-2-linghui.wu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VKwFwlSnkcRttXvKGnMOZ9Jlvlmtk53r
X-Proofpoint-ORIG-GUID: VKwFwlSnkcRttXvKGnMOZ9Jlvlmtk53r
X-Authority-Analysis: v=2.4 cv=NqZE4MdJ c=1 sm=1 tr=0 ts=6ad1eae5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=R5NHEjnr-bMx3tpQEQMA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfXzvAyE8QuWs42
 eZCOV4CT0S4287CqXhpdW738DPqCC8xW2zs/j88bmrr6JFOvkq0S9OKbDAjstH67CQfpt8UYr1P
 GOx4GNWyfBa3sPle4+9NN7acv/XCWaO8GistEM0kzjX+/R6Wd6DbwFiP5MPOyUyo+KtXvW21Uc/
 ecxY8vSrL4ZjlNQpzpBuA5rfhM3mHtgJii4Mhwecp1QzWCT2xThOI8buUBcWN0qKeXTAOF15XMw
 hqbFa0Sj2CCRFyqwrIL/sY5Y0KVF2Fk39/WDnbBYZqgOLBiwsfFbycDi0calqZfHbMBZ+zLKS6f
 z0MTCT+Bh7emMcsyIqvxpSCpQyuL11Vx4nolfA9zsFWaFc3rDiGqcnzpzH9dUj9ipRwbMreL63j
 f2GTl8n0CVUsTjr11AOtNmV9DyLZtHCdCBf1Mrnh/0IaZe9vaNml1k2Deq9AfZUOuYyOXv6o8lP
 oyKB66zywy1uTOV/6dQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX5zR806my8mbL
 uyDVGuAAciIyi0oY1pdA/uyEUeuh6HkIKVKoGBU0Qt3sfbqrwED7OJEk2CJwKtTe21MPkTxWFLp
 qKhYkmO0z7yS/S4ua/ch119esuO+JBw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160036

On 10/15/26 6:12 AM, Linghui Wu wrote:
> The SW_CTRL GPIO can be used as a wake signal on platforms where the WCN
> device must wake the application processor.

"must"?

> 
> Document wakeup-source and require the existing swctrl-gpios property
> when it is present.

It's a little strange that the property lands on the power sequencer
and not on the WLAN node itself - although presumably it makes some
sense given the latter may be dynamically discovered in the general
case

Konrad
