Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794272977;
	b=PaWkXQPBxJqyWPsFupEyfGqziU8zZYz4ynN+SeelY/KVY7cjezsZL4y+YFjt/q88FFi0
	 kGjbSZnspAH4jxwi1AxoMUeXN3JC0fYK5ZjIcqmWzMHYN5DmC0LiR2MeCL36KHUWCFEhW
	 Ps7tg5RoT7DAfL99Z1yrkr4PPfyniMfnUkJSYZToLrGVe0ON3sGvhX3p0VK+ME3HnlDUK
	 RoGdVSgtqQwPcR/D2jsmV+W6nspBJib6Ttm+Fv45SUZfW+UVzNWkuR4grURkyn9+LC8No
	 F+XDw23UKR6UFZniqIrn3F15iaPRd5fYHYyUSSzUfPLxJliGCacyHt0Rw7YVN17bmwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794272977;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n85Xlm/7B1FojUQlZFdWSNmevhZsF19PWyww70IK4II=;
	b=mgioqchgPnnMiXz2srsk4jwf0s/ZataCE7d234sknoyncX3PSZ+rfTZGLcGmn1rQoVf/
	 e6zyxh3ZaQrjuyU1kQhPAjUMNiQi4elvkRsRbu9VFhupWr85F7jzONmKc+2V3/Nigot7k
	 o8uvN7o26zwyVP9rRfYXlnYuKyUYErAtNZez7ju0tATXo9Ct7d7mrunI1c1rllSDIY9ur
	 H1DMGGu0ZRANR7qteV4R6Js4AJLCxyPLUDsFjCZfTdU8TMM7WyxV7vbmg/2ijRCV0Ucxd
	 gAVMqJMCpfypiLAHyoE9Hkn7q6huUDdNu0mVZMoLyWTPbKr+wZWErlHvqZOVjcFaRwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Px7FysZ0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K8SaWOYR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5215606A331
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 01:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5215606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Px7FysZ0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K8SaWOYR
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0ivZk1850064
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 01:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n85Xlm/7B1FojUQlZFdWSNmevhZsF19PWyww70IK4II=; b=Px7FysZ0MEyB1p42
	YwwdorVfIUZwtRGk5wcyOWnl1KQ8OzUWiiOdai/ABaU4EqQB3al+osZ0gWnEgQDK
	wPlgwV2cnhf9m34vPX38E3VtudabuDgtZFGdAqUiqfDz91Y88w2HHlOigXS/1+xr
	6WMBGYsgGkWIgXQ5TUh3OQv3OlxPSX/vRUpISq5YFD/WU+OiSvq41kaErdXas6Q5
	MwX2h380INakGywuEpDJEXpFiFbZTWnhJBa4dNbniLFUhpG6IpFFF7m3duQ66VAI
	euqjjLc1DrFV3AKRZoGmqKijWh0sXFLXknnFe9Bj+xLqiCMOvHHBRz4VzqmUUxgO
	O2sFHQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5twnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 01:09:36 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-89f84753b43so1086240b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 17:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794272975; x=1794877775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n85Xlm/7B1FojUQlZFdWSNmevhZsF19PWyww70IK4II=;
        b=K8SaWOYRM+gMhLfS0i1oMjJLWWb6axIIt/cTLMP9yTvwNHN3sqqAGYl9ZqQj2KKCk6
         r2ZP+7lgjpub3KEhtlE9kK2FT7xIUe30i/5BetJ4RYSPqVdLfRMOgErfsXbm2QKXTBao
         sAqwCyPQhQqkrtl+KDfSW8uyVVgl2MNRYXsonAPHBUSfMZcC0i5I/va4Q/pK8hfcQd1L
         sbdwYfTpqxMDUqxUuUIuRxghOvD38b8s0xWzgNY8GjDONSDMvgNZLTpV2ZG8gi0Jamq+
         fD7ZJJzmuKtkyjYGPqdN4TJyks9exZD07krGIm2tdTv26hJLrxkVVis04wCJBMT+oC/u
         Ojkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794272975; x=1794877775;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n85Xlm/7B1FojUQlZFdWSNmevhZsF19PWyww70IK4II=;
        b=TuYfnkgVBR9Zh4fGhYf4uSaJ89qzhfUBzGS+CterZSW0btxnnVhRc6/c4Dz3GDBefP
         st9h8L6tMIWJNyA5+LAcF1NJbDldi4fb8QTPMymM2MXn9PyUZfjLr5gBFwjAteHJZY5S
         7b17orNFvhmuZkM4Nf3kt3J+0XXMg0rX5FeEmNSH8JKgq9mj47JZoIQ8kMPG0tYFaqif
         0IYWkv0Eg/plZO2UdgtQGUKI9Nmx8winZJM5QipQ2EpbfOBZOcdiVv0SLDg0gpKkZ76r
         QKvDBCR7aaqNl1gstcd6fD9hcXboruBpswo0zPzaw0quEN5gjnt8cqG29XQsOvW5eNCI
         d6jQ==
X-Forwarded-Encrypted: i=1; AL+hErEAwXl6Hq4iR9gyJ5Vl3/GZQz9QXLdbfHz6oYk3gAqs6fmxETEIqaVyrKQkmsPLW4kGQJBSV9k3W+HJWfes@vger.kernel.org
X-Gm-Message-State: APuU4Z981B2M/7O0Oxnh/rn1luA77csXDPFm9sd2KbhNJXH9AL1rWTdE
	Q+Mz2KIEIy7DKSa5gl/Erbr6JF2hawsN0t6ZVR1VLNPoeyD0+vHDk3vnCfLnuHu0M0rkZ2qkf/v
	9CmvClC3YL5eF6k2T3tU4eg0NiS4zVMjYY7M07AqJuN6vt5Jd/HmymYG0Ys15hMgSxW73
X-Gm-Gg: AYBFou3nxt3goU3NGhy9ZPcoF4JKWxRGzIlKxIVN3194T9uDFGTBLY7PzN3FfFpEA8k
	v23IweUEsuNk5MA+JKVnj3+GLfFig6iwjv0G+hk214/zrEbpBf2zIWSn6fm7dEJWC5b4BkOFgUs
	IAWzEQ2xWY778eR+WQ6G/yF/CCCLe5XfNeIPWpf1gakIrQYUtfavoax/vuhExt7bE5XgA4vhCVY
	xC49qs0AngpcqWtrx44oBeLYp5ZIVUuOuX/G79eLbsALRc75MSiWRZ7AhRoxIW/r9/2R7bBKJK2
	81F5yGkT+MSYvmSQUBRY8ggGHxxlHMgvWYJ50PUlSUo9ojVgVKnED9OY1ZannNgWc+XPjhFadGB
	ecUMdKkuzt23NEYZ+em6O8k7ZSOrEGnQVGHi0/0UYAB++DlB1nR2f3Ap8R66d4pqs4/VLmQ==
X-Received: by 2002:a05:6a00:464e:b0:89f:9ea6:1dd9 with SMTP id d2e1a72fcca58-8ba864bfac4mr1173049b3a.38.1794272975339;
        Mon, 09 Nov 2026 17:09:35 -0800 (PST)
X-Received: by 2002:a05:6a00:464e:b0:89f:9ea6:1dd9 with SMTP id d2e1a72fcca58-8ba864bfac4mr1173013b3a.38.1794272974879;
        Mon, 09 Nov 2026 17:09:34 -0800 (PST)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e25esm246899b3a.37.2026.11.09.17.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 17:09:33 -0800 (PST)
Message-ID: <eaef1b2c-687c-4dbb-a50f-a40ef1c72f8e@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 09:09:25 +0800
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
Subject: Re: [PATCH v6 0/5] Fix traceNoC probe issue on multiple QCOM
 platforms
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
 <42b832c0-5cbd-452f-a9f3-50355a008533@oss.qualcomm.com>
 <dc798bed-85b4-4d47-87c3-f0e0f156ed0a@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <dc798bed-85b4-4d47-87c3-f0e0f156ed0a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNCBTYWx0ZWRfX2AtOpnHCqRBc
 HNA3MuX3wSNEPJQMuLW5yvx5QYy6QPImpn/S53if8jFIXwpmu1QDU6sT0IbtYUpXEmW6k3BsxwM
 UENjwk6vBkbw80PYWtiwBmWgMoGaACw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNCBTYWx0ZWRfXyBzTaMHcVZA3
 sMoEf+dXShq+McuccZi2+5rrL+H5c08v+J9/6UjUxQG5t5D8yhF5wSbfy3ih6aCJWbil5LBUZdy
 AQ4W6eR5BR6DaxoduIl2be3xpIIMc+BqbT2jbZK+hDOqiBdRSqBpR+BOc04wl6PC52wQQPqv4rw
 kzBrJLa6LhOGAlJpg9Bhd8Vc4ew2aUlYG+xo+AFxJWV9DygOVFA/vbpBUfi4WZ7UOAcnjMy6VeE
 KmSuaf/lJumpf70bxHn4DzgqE84CZYPbmCvSwW0KT5X0Ma6tIzxyCRf40hclJEhYyjtBOYhU9Mb
 OP3pWLDNhXLD5b2l7qdrL19f2C6EhoYSPhMdkOpH+wuhbu6QiuRr0Zp2/HArAZI/BKgTPR705lM
 d9M4ktITSlJor16d6tsQvBM8ah8IS42xc2YGbHXwq3lUvo0ibOxNw7lQTIhAdgqS1WtXQtAKLYq
 O521e3HBFTWO+YAALKQ==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af26ed0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=MgS9wdN22aEW9VH1XIcA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: XeQ3xvYvks3J7PyzcrNY30zkM5-jOmaK
X-Proofpoint-GUID: XeQ3xvYvks3J7PyzcrNY30zkM5-jOmaK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100004



On 11/9/2026 6:46 PM, Suzuki K Poulose wrote:
> On 09/11/2026 01:25, Jie Gan wrote:
>>
>>
>> On 7/10/2026 10:38 AM, Jie Gan wrote:
>>> The CoreSight TNOC (Trace Network-On-Chip) binding so far only 
>>> allowed the
>>> two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
>>> forces the device onto the AMBA bus, where the driver must read the
>>> peripheral ID from the device registers during probe. On several QCOM
>>> platforms this AMBA peripheral-ID probing fails, so the traceNoC device
>>> never probes and its trace path is unavailable.
>>>
>>> This series drops the "arm,primecell" entry and turns 
>>> "qcom,coresight- tnoc"
>>> into a standalone platform compatible. Without "arm,primecell" the 
>>> device
>>> is created on the platform bus and probes through the platform driver by
>>> compatible string, bypassing the AMBA peripheral-ID read while 
>>> remaining a
>>> fully functional Aggregator TNOC that allocates a system trace ID 
>>> (ATID).
>>>
>>> The series is organized as: binding first, then the driver support 
>>> for the
>>> platform-bus compatible, followed by the per-platform DT fixes that 
>>> switch
>>> the affected nodes over to it.
>>>
>>> - Patch 1 (dt-bindings) drops "arm,primecell" and makes
>>> "qcom,coresight-tnoc" a single standalone compatible, and updates the
>>> example node accordingly.
>>> - Patch 2 (driver) adds "qcom,coresight-tnoc" to the platform driver's
>>> match table and renames the itnoc-specific names to generic tnoc names,
>>> since the platform driver now serves both the Interconnect and 
>>> Aggregator
>>> TNOC. It also restricts the ATID-unsupported handling to
>>> "qcom,coresight-itnoc" only, so the Aggregator TNOC on the platform 
>>> bus is
>>> no longer wrongly covered and correctly allocates a trace ID.
>>> - Patches 3-4 (kaanapali, sm8750) drop the "arm,primecell" entry on the
>>> traceNoC nodes and use the standalone "qcom,coresight-tnoc" compatible,
>>> fixing the probe failure on those platforms.
>>> - Patch 5 (glymur) switches the node from "qcom,coresight-itnoc" to
>>> "qcom,coresight-tnoc". This node is actually an Aggregator TNOC (its
>>> tn_ag_* endpoints show aggregation), so it should expose a system trace
>>> ID rather than being treated as an Interconnect TNOC.
>>>
>>
>> Gentle ping.
> 
> Apologies for missing this. Please could you resend it based on v7.4-rc,
> as this doesn't apply cleanly on coresight/next

Sure, will send v7 to rebase the patch series.

Thanks,
Jie

> 
> Cheers
> Suzuki
> 

