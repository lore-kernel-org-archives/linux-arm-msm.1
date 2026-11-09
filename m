Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233187;
	b=pzfISCKtaaTfqyZ7N6vntFgmVU4hRo4UmoJ7FPYM/m9dm4MeaorECt1QHGt3qzKF9E/n
	 fbvyeCuUuREjCKPBSxItLTyZICfH6uxQFUbaFyL9jFVnAx9+VNFklaymMY2OebVxuMEcj
	 VCPaAUb7KONr+TEi0CSe+E/kMvkRMw9tP46LTCz96mVtXxdp64+WHaWmy2CuLAgXBX+gu
	 A/shPFvPj4k6zPRTw27l4LUk/CVZL4CR+s6R3jsFqX95z+hGmz/dEwP74wsJ8/7lWtxsO
	 ujwpiHLLl+scZ33V+OgnIiZ3idwA4aiyrWMBWyZSqYKDYvaG8v5284Nftb1MMeyC6SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233187;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SZO2pxjMIijEZXAP7miXBlorgEdIzoDz/u9J3Nan4lQ=;
	b=2GDCB8MJGoluJUpi/Z9eXvY6VaRCjmWBxV03bmE+QiJqM0eleEE515D4zgWUT2vsl+oJ
	 Tiann+A8cIdtUTPQgLl8QrO1r+DwQMBU2sOiLzfhR++g0UjFNytRL00OQNGltfNCHtFLF
	 s5XYCY70DdtmH5gpuZMmTaRgAsY5i88DEhpbuRBcJdZ6n4VVMLEwLdX4rfwAawnNvzYuq
	 mrIXtLUlfRe0ipv7/soedcZo2CEouHa8iLHQ3SdtlwGAXTYl7WVYik9aE/w1rJmk7R6G9
	 IFIyspCdX1bUeCI1Pw4yHvdvAH22boMG3v8XXjkD7XNhcJ5Ih/LS4toQf+W3SvxXI/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pk+5LGwY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JPdOO1fQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1FB606A321
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 14:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F1FB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pk+5LGwY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JPdOO1fQ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF1m0022484
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 14:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SZO2pxjMIijEZXAP7miXBlorgEdIzoDz/u9J3Nan4lQ=; b=pk+5LGwYMAfOSXFA
	lecrTQTHD6VN3Lmy8W3ERVHogoxBAZJ1A1qTiGq8rGTwbGZHTJOM4gK/hVZMng2d
	/hLXksJJ2FQIwT50rDlyW9JkjHHr4FSthKCkNi0D1VwcshthvB4zcuwz2Fhz/gx+
	e6ca0MF62VNUL2A2gQhezg4RDfbM4YB5VkkEep9oALmlUBbKHlXGSf5oyOAfa3xb
	wPeMyTqKsdm7KX/AjraZ5/LRui/0jHWtnn2CPteSmveQe0+AtdnsrQgWJ8JUeYo2
	55ITnY5cWnOe0EOQVCvtYsTzOkQYIcokK+cIOs/3lo/bI9Gn1OOzFaAWIJRmXESw
	kZHkVw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydgmpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:06:25 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc0e22fe64so27098137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 06:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794233185; x=1794837985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZO2pxjMIijEZXAP7miXBlorgEdIzoDz/u9J3Nan4lQ=;
        b=JPdOO1fQ255VZVDrnKHesNUXl0eflubl9d0pDkGDLqlddilLDRxFRU9aq7FH6kR8rF
         H9DepIE0Kpo2s/8rbWea4e8F28QsdV+lfXm9HeYiVE2d88lNZi29JUBEcGraWhoRYr9A
         zEA3SeSZfhQzbDt5eC/UxKoXNSATL3bUKVLHIwZaG6gLY4YLnxRsY5k+ANLksymrWEoy
         qXEhmog2nmrhoOHknplkVQ2NVVn/2llyFTU/3C/9yaKmrf3+/WIoJ0qAuLHR2lz7ws/Z
         cQREcUZr6mE5F0UOd7YFdd7c6aggvzpmM8UkuDCQEeCF5Z+GMS8PPHA/ca+v7DxzcTyD
         2zXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233185; x=1794837985;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SZO2pxjMIijEZXAP7miXBlorgEdIzoDz/u9J3Nan4lQ=;
        b=h9QCmVjYGE0EGsb5EBvX1TCQ3w8E81NYgD5VgFeVgDBwJ+4XcW35+5U0g/gC3URqU3
         YpSbrndL3ja+VSdvXTYZzqH8r2K5h157qZOef/WlAA530HtenWxrrkTs1u5oKiDQXOY/
         4wUgxsTRSbWAHPVvo5sqFENumeUHSKSkBm9IiIoLu/io0YsTN6gudBB72CDBYQPcojoW
         gSX+U56h3L1KfhT9ZZbK4UOb37gZik3xqTxdM7bwFwYHjz5J21PQi9de81yztC21QgRc
         dDk+2OfebSCLD60xjAuY5AiW4EfpvyQdvWCYXtMYkLa+paed2jJfsXKKU3Zl/jZaBnpa
         4jwA==
X-Forwarded-Encrypted: i=1; AL+hErHrOZMlxp5fXbcNlNHqoM+l6f0vGZ4oV9IrWTnkOHkIb/NjKBFys0ZBYfws5LBIor4d2FezWBAN3XIAAY3m@vger.kernel.org
X-Gm-Message-State: APuU4Z99OZ96vqePkfbsXK24PlTRIoeA8HVl0KIm5eUYW54IFx6KUq6S
	x3cBongEfOVMMy8N4/KfrSVhRyNNajyiam8RtBdqXe1eBjzrOgQWdoabNZDZrLQGMXCue7SfyRI
	FIsJAz+I+6ZV0vgu2wIicq657tc16XmrU7j0dfaeL2vYLzEpbU0fNVOvCtr5B/xpCthNE
X-Gm-Gg: AYBFou3Eiy4KENaalZflKD3REhBRehvm24spzmKLJXOwKriPHVwcs7gaiQqZ7vtZ7ga
	1lzFI5kmyzVMXYgoVVE58AVm6MEVN3OJo9uiL1pHn8xh7GWRqCBEl8cZK6qAI1eYwlOk/UVUDWP
	xBo9RmyHIyVH35+y2GNOLIFa0pHQhB44G2x2c4IZ244m/8S0NmI18Uo3Lwv3cdJvK6wvaVMEKwC
	bRW7x//Pi+F/WHyeJkdysXc4bgJzqXfPCKCAiFMF9LCyCdNN86Hh2wQWEtQKMtpTQmrW2wesz+d
	8Dq2lZ+nZ9bKRu/3wg2Hjq4Iqh0Rpok9pGXq+0kzqU7WiJ4czQ/VjhSmkXjV96ucxJITedBuJFH
	ExEcqP1Xk1wGb2pRMg84zf1epn+OJtiS4SADRfkp1PT7qeq9zvy4ZVEIjI1dx9P6FjCoHHA==
X-Received: by 2002:a05:6102:6116:10b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d2db29ef38mr947728137.3.1794233184608;
        Mon, 09 Nov 2026 06:06:24 -0800 (PST)
X-Received: by 2002:a05:6102:6116:10b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d2db29ef38mr947543137.3.1794233183505;
        Mon, 09 Nov 2026 06:06:23 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721c8a9cbsm1525983a12.0.2026.11.09.06.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:06:22 -0800 (PST)
Message-ID: <825fbfbe-a9a0-43e2-bb54-f9e38ce779f4@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:06:18 +0100
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
Subject: Re: [PATCH RFC 02/16] clk: Acquire resources for clock transitions
To: Jerome Brunet <jbrunet@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
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
 <20261014-topic-qc_clk_dvfs-v1-2-3041b788e9f7@oss.qualcomm.com>
 <179275170360.4070168.11650113664838519061.b4-review@b4>
 <f0ca2bd4-851e-473d-bf21-678cf964f854@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f0ca2bd4-851e-473d-bf21-678cf964f854@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfX38ZQ/VyAUDBV
 dnPczFnKN5S9E0wuBzMRZPtbywJ9igU0twMksf4KX/XtvzJ/yPrHNRChAVTaLHQ86L/OTqMiVXQ
 g0CXdiBV6UcQpQxao1NlfDUt4nL7eSM=
X-Proofpoint-GUID: waUs04JYgaYHCycR2CvVCe0gHk9clF61
X-Proofpoint-ORIG-GUID: waUs04JYgaYHCycR2CvVCe0gHk9clF61
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfX/AEEUfMdCbWm
 o/Q5eeimfOIPrpazeR60QRgQLINOYrkc0PfD12BNsEH8043vuAhmBfS2CH+r2J5hicSeY84s1DT
 /+2ZRHlfdebOKjML8vLJlrYx/op3IQYhuU5oUyt6usJReK00WNd4zl3eP+7dFbluEQvPkhRG64t
 69LVqc+cc8RJOHM8TZ2KxE9tczWrOhgFqoTS2MgyhbyD/waSCc3/ACaFtNx5KaOq8cjEHQYPi77
 06z+DxMbtaAlq788S9ZXZUhUl5L/3nMDbreKxGy2jC3rfYs1yuViMn7igtx30+h3V9B/o9JEzeK
 W21CBqLWiH5EZlwZhdtgSZFLuy8yrM2fZh48djlpC3/u/xs6SB3rElk5wcY4o5QZkO8uIE37smU
 7JKbrxqXUiNEQLwNNnwAi/e3C1Xpaz/WIimhuhm0DC/4SizBX7K5TvL1bNyPFWIX+O6QDH2XK+7
 poe4GGdRPwdGSigKrAA==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af1d361 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=tDZyZ9LLp4Dxownb6IEA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090056

On 10/26/26 2:11 PM, Konrad Dybcio wrote:
> On 10/23/26 12:35 PM, Jerome Brunet wrote:
>>> Preparing a clock protects its current requirements, not the resources
>>> needed while changing its rate or parent. A transition can temporarily
>>> use both parents or access an unprepared clock, and a parent rate change
>>> can cause other clocks to be programmed too. Raising resources one clock
>>> at a time leaves those operations exposed to insufficient power.
>>>
>>> Failures make this worse: hardware may already have changed when the
>>> operation returns an error. A matching cached rate is then not proof
>>> that resource reconciliation finished. Retaining a temporary enable
>>> reference without a corresponding prepare reference also breaks a
>>> consumer's normal disable/unprepare sequence after a failed reparent.
>>>
>>> Make CCF acquire the affected tree's and parent paths' resources before
>>> notifiers or programming, and reconcile them only when the walk stops.
>>> Keep fault recovery independent of rate shortcuts and subsequent
>>> consumer reference-count changes. Require explicit recovery of an
>>> ancestor's uncertain parent selection rather than reporting success
>>> from a descendant request.
>>
>> I don't think all this is necessary to address the problem described
>> here and in the cover letter.
>>
>> IMO a new provider API is the wrong layer. The framework already has
>> the hook a provider needs: the rate change notifiers. What the core
>> should do instead is fix those notifiers, which do have a few issues.
>> You are fixing one in patch 1. Another fix, about setting the parent,
>> was sent recently:
>>
>> https://patchwork.kernel.org/project/linux-clk/patch/20261021-submit-clk-parent-abort-v1-v1-1-2936181822fc@gmail.com/
>>
>> You want to act on some changes before anything is programmed. PRE
>> notifiers are the right tool for this. The user of this change in
>> patch 7 could use them AFAICT: PRE sets a temporary vote, POST settles
>> it, ABORT drops it.
>>
>> Also, what is acquired here follows the requested clock. When an
>> ancestor switches parent, the chain of its new parent is not acquired,
>> although it feeds the whole subtree after the switch.
>>
>> With notifiers, the parent fault state is not needed either. As it is,
>> it blocks every request on or below the clock until the same switch is
>> retried.
>>
>> Could you tell me what you need from this approach that cannot be done
>> with (fixed) notifiers?
> 
> I'm a little worried about the ordering there, since some device
> drivers may also be registering listeners in parallel, so we don't
> get a clean split of what PRE means ("has power for sure " or "may
> not have power")

Do you have any thoughts on this? I'd like to proceed with this
series in one way or another.

Konrad
