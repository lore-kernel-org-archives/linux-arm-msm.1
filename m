Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2831F5476FF
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 14:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988605; cv=none; b=dG4jMkaBSNFcgYCPdcQ0FZCuc0rF8Q3p8ywOhDq+yIdZ5qSMoTf7Nz01YZ5gtOHIhsfgFNHiDSiY+2PeLqPTBJLXSZ0vk8aoTTZxuXPxes+FYB7XYdoqTVi9KNnrUGRhxOFDfLmYyr04DreF4mf2yI/Bhf4AHNOMVPNO4UKRLYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988605; c=relaxed/simple;
	bh=vcKFUlMHhzb4aWhwKFgdD+usZHVbdciqtOJ1LMttT9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i8qadcVQXh7yMyg9dRqy9y4Il5GIkmxognvvJAZIjnSmPXC7l/3LVoSfCHsIhCZo9DP3lbfBwpBTaE78T2Iiq4V83tJx9YVL5RhWUEXk7fBFvCE2exe607NUpCRmsszJ3V3GMuoQy5FYo0ZHaIVq/CMaXZcBkaCO2ClIKY+P0i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MGrn/8JY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AuCZLcgH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MGrn/8JY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AuCZLcgH"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9eBVj3696120
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 14:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IB/8dXjwtfDGBb987xwDsU6P3iiH/jaR6oo/R8A+4R8=; b=MGrn/8JY+3+qM2Gp
	T6czweznP6UkfQEiIZ2PHZWPsTiKPScMY/h53E2AuZVqUsuJOGuqwfL1bMO+1pP9
	YFzowEAcrVf1+p8KfYLhe41CFdR6Ff2wM3daFNRx6dEIQEYDLpqsmQm3eEF5V/lX
	8R3GwYVoe3AopBWl3i7U8DlBhRHL4zPjiwdzwG4J9MC11QmFFFi6hmKBoujoMaBL
	idQcLCjzHKVmHErLw46/7mLBWXvurW0puBpr2S85j0ot7F3ZFONo5wJBx8pHUMlB
	ymTWbND1uofE73G4gm4Unk5Lmy4eWD/oh9XZQz2xFOwLWFhw48VfElZMVGukx6XI
	rUSbaw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha7aeh52n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 14:36:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93dea15d721so48765785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791988602; x=1792593402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IB/8dXjwtfDGBb987xwDsU6P3iiH/jaR6oo/R8A+4R8=;
        b=AuCZLcgHNVp06LHfInZJSRQIWOjhks+TH2Dgau/fYgXC6tRQm4/kHPylTEcEUgbYWq
         IUrqAUB88DkaSZt8IUBONMUHezdbDakMawhiob/UVkIMFUtot4XvMkatJAC8iXmIoLxx
         5zpnCN2JS2MatWql5YHQ05XjjZ5eQ56VMh1O63AW9jUmYsTR31YonFqPeoYkHgsXR1qF
         mPpouvDwRhBkiABsEzV5zhqFe0nK81JafYww3IaVrLtufAKKyCp6vdK+iawtp5ZRQGcK
         gMbU0x9XsGzFtZDLCu5i9I4PVdA1wNB4zHVHaojroEHG7wW+myCzTUe4crkvBcmLSPcB
         4D7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988602; x=1792593402;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IB/8dXjwtfDGBb987xwDsU6P3iiH/jaR6oo/R8A+4R8=;
        b=XqJRSWQmpQGF8Z91tn3Ntcmqey3i6mS+ViZigbHp7Rpq3eO2IdxeFKcKmZGSR1GABY
         xXp+/g04o1P+OenyBWyGjmypFPn2G1q9W42wLnsUi4X4wbqSFGdL3+6vfmK4LZJnEmwJ
         YJXORqAuOy+ic/m2ypXLBZLIC4mfRgmPKQIcd48a/X1IlAeqJiy9DUvgeGwh43S2V6q3
         c4ja4zBqtzh2wOz+PraFh9ixaCGaLlgvl1+DaLYX+8Z3JjBfzSqDSkkpqL8BSVM3N0aI
         eeRFpomOWeLIcHHxTD2qY4JmPvYkOmgRD5MGli7+JxVmnIUQWAnNttu0PnALUAtpHMgp
         j93w==
X-Forwarded-Encrypted: i=1; AKwUvBxtuzagbKTxXS1ioz6ncO9PXwCYGEhIC8cgemtxpIwl46Z5Cc8qsG3TWUuvnT580JWbpEPsPrIVCUXdPyY8@vger.kernel.org
X-Gm-Message-State: AFq9FYLuMV3MBcG6h1Qch+xuii3+BxhlRFkbkvKRDgZ6T+Q9UZ2C5UWL
	IYKi0QgfAX+daNyXoCXS5lNGBp1Zj1w2cCRuZgLriwL+dgn5Ec/OZUF2ZflYkGG6kjMzufXTFl9
	IlIeFNzPQ28Y07zNMY4lND5zNxztjBwo3fS/qP5DGzQUJ+lV1iSm5a+QYJGsQjDyNbE7N
X-Gm-Gg: AYBFou3TdY/2zMGmRkq340iiAgamKGlZXDkHFd5GlEQEMyxBv2ZbovAj2foGWE8En5n
	BqZdDFUvJfqWZta6S3itSVCLhq6dPWdjqZ1L4ZDlZWVPZ0HTWuRwpqoljpiQdgl8oVZLFMbi16K
	KqRF2HoYQtNF0++KnEvNyQqRiqtu5+JNYy4wb1GWSCsoU6YYH6L3io6ldKeXfThtucSsgMsgqOk
	oMzKTf1vsbG+afmOpk6Tzc/Yrzv8xCgRaWAFLW9c7LFHTMufrkKQLtQnj553fZH5ejy4jwJRruJ
	RbgchnRYCY5LaxVCcB7ivOvle/b02k2oP0t/8cGarBqalSKA+X/iO3J2aF/TtvGEUcCH42z3a+l
	rPI9nAdz6rmLM7oAtKPNnvw==
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr1793507485a.2.1791988601705;
        Wed, 14 Oct 2026 07:36:41 -0700 (PDT)
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr1793490485a.2.1791988600134;
        Wed, 14 Oct 2026 07:36:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34feaf06e3sm361049766b.33.2026.10.14.07.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:36:38 -0700 (PDT)
Message-ID: <a8bdf3fc-7da9-4017-b61a-5b4f605ae0a4@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:36:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 11/16] clk: qcom: gdsc: Make GDSC parenting optional
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-11-3041b788e9f7@oss.qualcomm.com>
 <lx5jywz6pnwfcoczp4z6k55qeol3ruqkyfsutngmg6n3xqnynq@6jgoutrnav2f>
 <d82177b4-8e93-4818-bd4d-b4f696396373@oss.qualcomm.com>
 <543k7ybncixqqdzyxhb3mnal4k5ethrsmutrho5yo4vcgxiddt@a5hisvaogznj>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <543k7ybncixqqdzyxhb3mnal4k5ethrsmutrho5yo4vcgxiddt@a5hisvaogznj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iNa9JgZ-iALy-uc8myuHBZcjsmFLfkig
X-Proofpoint-GUID: iNa9JgZ-iALy-uc8myuHBZcjsmFLfkig
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX4V8AzKlAxLwa
 Cj+NgvKGmEa49F9vXs9vs69faLpoEQFK22yz06jmJNf/QN5EGqOpchFapwe67ecgI9m9Q7h46D1
 fnaYudQE7qOm5vGcGli5LeR1QwV4r6I=
X-Authority-Analysis: v=2.4 cv=NctzRGD4 c=1 sm=1 tr=0 ts=6acf937a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=JPrUV6RX21cUErznEBYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX2QyfCsHzR3h1
 QPMbO4F1oSQpwsQnHri0E2A0ecZdycGXNl3N1ECf516PUxGq7y/Ne9i+DUPpWegBwsf42Q8QmLd
 x5BbWuBGsQVhub5SEg/IBgCjlYdhcuyOfYbsW9YAkBKICJ4/AVJLZW+QRrJ6kW0jzdq93QlJ2Rc
 UwY3WS+zIV8tsmZguAyeHQTvZV4dTS2Zh8hvFfduxgWkxCOlFhk25i679UH1aevsvGNm9ePH5hb
 uveKvrHlNfynSfZaDozheNoYmOwbXus5ZaXzKhZCi1WDLDb1pHQ+jj4W6GIgz0Rg6lS9+e8xeXS
 E32XLA6tT8LaZjJWYgmYbs13Xxe8vXZv71mhqt9Y5Z9g5nrtoXZup9rq9js/xbN2BQYAl2kdARl
 YBgNtbn5LE6mFwV0YAvLFZd+9VmiUpvI3ZiSzLoQJl4iM/50+akIzORo4YlUAzRriU94uptdyjT
 Vd/JyqLElehBWDuo30Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140057

On 10/14/26 4:34 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 04:20:54PM +0200, Konrad Dybcio wrote:
>> On 10/14/26 4:17 PM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 14, 2026 at 02:19:11PM +0200, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> Clock controller power-domain attachments currently become parents of all
>>>> top-level GDSCs exported by that controller. This conflates resources
>>>> needed to access or operate the controller with actual power-collapse
>>>> hierarchy.
>>>>
>>>> Allow callers of gdsc_register() to suppress parents inferred from the
>>>> controller device and its attached domain list.
>>>
>>> I think, each GDSC has a parent (in the hardware). If we don't represent
>>> it in practice, we likely need to fix that.
>>
>> The next patch allows setting a precise set of parents instead. Perhaps
>> this commit message could be improved.
> 
> Or the commits needs to be squashed / reverted. I really don't think
> that we should have a parent-less GDSC.

FWIW this commit alone is a NOP.

Konrad
