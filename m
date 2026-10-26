Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008144;
	b=CTmJZzEO2UffNYf3QCpIiyhCulzi0Td6i+3ngZ4cmXi9yY9WYVNNKfBu7iwN7ltuS/cs
	 S+bsQILDCF9XucbxpQ4dpMuLdBi8u3c/EqQtJUQRX4560dtTg7YJvo7hPohyH/ln/rDwU
	 C4mWKtm60uvmEgTX7/ACTNUBqxsL73iFBb6OK+UmN1I2mY2A84vNhFenhQ2a62dmP74dT
	 /9Te316qdZV1lLWhOOz7RJKvkoYowBd7EaRvFcBwmphQwT18eBeORBgIsJxSC3RtA5Pwo
	 eNApQw1cFJCcIHeJ6ApBRuMTKGstJkEVrySNd9wA0oebmlvUMg2JfKrySESxigyzs7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008144;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Yo4J66E1A52hv1FpviVs1U4slnxqRGnURqACyQE31qo=;
	b=vBbYxN6+7rYACyeyrJigCyiU3PXZLzZIeojDPzylZfzCr4j8Pd/3fktmT6sZoVT7rCGW
	 LaHMVbuEH1aRyk5k+xpTQLGlcw13YFUMJYD4MEHnFCpV7YNnFkPP5YfZJeWiHn5WXUp+5
	 bW3Y22vKveGwmCcK+5VqPWgyIIsrWnkAIdAPMukby8s2LmoSMiQ+XEWsTqpMJ+rrmfjE5
	 bUOTV3hsXMY4UvEvFhpfKGDfOQbylla7wg+jGl7i1C/V/4WBt060OfFxLi5V9a8QMGWQg
	 cW8WAEam1C/UDxOIUIKp7X/rAuJz/DIAhDFcu5ApF7LzNn4L3WvW0X2K5scqS3niBCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o7PtfVAo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=egoBADJ5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05D7606A322
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D05D7606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o7PtfVAo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=egoBADJ5
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4bKDT2206725
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yo4J66E1A52hv1FpviVs1U4slnxqRGnURqACyQE31qo=; b=o7PtfVAoxAtxieXR
	qRcE9ZdSLenSgiIBM0TRYc2MvEukOTH9Z9A7NiC15tPKoUryXat4v3SuvZObO1MA
	9AQ7gR/UwJkyZmGX/5PatiGk2jL2lYjWri/GDgm7FqSiNVI6DVp+FKNkz4Uab9m7
	Is9ISRdBmQyMwCVHrtF6ctgXt2LW0rq0h5F/yvNJrZ5ZUfW/Elg9cNW7uIhIouPP
	s/A03M6SO660JMWH9rGl6TXjODBfe6B+62xJD3B+UfC3FVfoXXOETml8lfRZufM9
	z3n6CVU2wGlwQvfyoij8mzLrZyIm0ObEH82IcdH1Ugzox2nc3N1K3IcW2RTvt1QH
	FxKY4Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmruns71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:49:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-533758f24f4so3741111cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793008141; x=1793612941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yo4J66E1A52hv1FpviVs1U4slnxqRGnURqACyQE31qo=;
        b=egoBADJ5StUpbkhy6BafSyQxOe3H4jRPiKcC757G/T7izxLvwxXuZ3FLUpjoVBtVz/
         T4KwdNtQqSRCXLO1v4gHy+FB2W513f+Pm1Q917BGQuXfhxsbR5J4pkH9swCD6kps91T9
         t5vU34jv66iQY59qDhUXE4BY58jE7ARbxlPITjDydsqhjfbVEAMuldqKXFxtx3lNr8hM
         wuoYcJFGVmcs7AMjXHtF0bic5YcNHnRsE+/aDgB2ST/Fhmy2Sjkl8nSZ65DRuWH1fWWj
         4IXR+MZchXpZd93klFxnnk/3P6gIs3GPk0+rIpxLo3RqnYgvQvG37uUXZuGH0QqFvMIv
         iQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008141; x=1793612941;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yo4J66E1A52hv1FpviVs1U4slnxqRGnURqACyQE31qo=;
        b=MGnARiZcegFW8mF+tpv3upnXjFjuU56tXO5YYX1//MWVnIaPxnryTrUrets1y71hBa
         aeY/404SiqI6azRGDWqjFNH8gyGqLjIIT6PDvsK18TtmC0jQKp39AfiNFd3UqYhbE3Xs
         iiZoYSD1IhNktAYlFCNwpeoYSdgzKLhh9x3DwHewVvv4o15ahK4UjyQ6dIrAVtzdsh6c
         LeMo+oJ3mkwlXMf0bTgDSArw2kthG4KjlLSfbVD5aoJjlq//UKdaxzYdS4nEVrljj7i+
         vl3WAw2MNItMlIyZsjc9/xpNKSgBetW4ueyrOhVK2zK3tXNzs0hHvwERRLO7fzwtSFvZ
         LXHw==
X-Gm-Message-State: AFq9FYIlX4RcJ0f5ApF1WJcp4SUB33Q+3z19HdDRqwpJGp5DACv1gl4w
	JUhbsEPftDJAbagwG9RjlkpxvdK+Gh99NFFl3pwYkmSg/Pc5COH93v3INjrY1RYOxvxHVbqfwe1
	0qtUBOOdK1IFsuo416Ez6nqFITkFAiTtm51N/w73zB308y9wLaTgL8dY4wE2DI9LS9hkp
X-Gm-Gg: AYBFou0HrNFUvDgRsh6xUMaZyOlqZLoSeazolFer8YpzgZvH8cpcsQsSIU0H6K4SJZc
	f9Kdp/a/gK43IlS9lEzxgcKkcZG2aHTjEfNZiP6wUnu/ITCZM4m6edlqbyeua5aBRrIIR0wmBsO
	s5ijGGMKRmifaxTAa2GEZCv/TdQkpr/sm/rmmSEkl3rg/dhxQ1oPVTgCo8WNQUzG2Ex9GYjjKpg
	VZiYI/V94eGLi80PZ/TmQNUWKeoZ5gn7eUBiJFWd3lqN5B061iDAOw6IgGME+o866WPSquTCzvM
	6q20cu0aDEKTqB4DA6gh2DmsDAFRAlt6EJeyqvQTFaBnsb3R3WUVFRI4olbdcQeenxe5b1TrDQj
	iLlJtK8d38P+7Dth+NQIZUg==
X-Received: by 2002:a05:620a:8a87:b0:93e:571e:94f0 with SMTP id af79cd13be357-940ef8f51fdmr891898585a.3.1793008141097;
        Mon, 26 Oct 2026 02:49:01 -0700 (PDT)
X-Received: by 2002:a05:620a:8a87:b0:93e:571e:94f0 with SMTP id af79cd13be357-940ef8f51fdmr891896285a.3.1793008140702;
        Mon, 26 Oct 2026 02:49:00 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4459924bdsm3349750a12.37.2026.10.26.02.48.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:48:59 -0700 (PDT)
Message-ID: <4fa0a55e-4446-43e5-aec4-beb6108b9686@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:48:55 +0100
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
Subject: Re: [PATCH 4/8] drm/msm/devfreq: Record idle_time at GPU idle onset
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <ltuikov89@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>, stable@vger.kernel.org
References: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
 <20261024-assorted-fixes-oct-v1-4-2977f974ddb7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-assorted-fixes-oct-v1-4-2977f974ddb7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX3F1Byz+csRTP
 CVSFVIQ0xVDMsy+BZXeudJW8iw2fM6YwZ2IjmvIdCOPb8VEumz0XR+Rl7FMn5aE5uuN9mlB2YmJ
 CiNoH5vau/ozRAl1Zh1X7zo1VlfZ8vWW5fmXgwo3EiKVmmTOG7WLdQuqgDx0sK9k2apd9Mic0Xr
 kuCjfVRpLxTaKvtrfgRUJgbvjF8lyJvowF5n8n/9VmYaXaym/mVeqHH42c/6IXlUS2qF5sHKQZe
 TuzLXJuG9Qf9UwwW1/Ugei4Fw4F2LvoCLMfsobo4fnrXtDK46gM06efvc+6YL4MxpE8JL28sS6R
 DvyDt0WtGBvb0QJvXe3hpWRXOQ4mv8XXFwOe6GidB8/76KfF68dfUP2sr6L7yUFKRzudJVBS6dv
 OOppGfUg5jfeb+SPofhGVG6lJIov7yRHZytWRLffkw8a0PBoBt22dw3wG0uvNK38RYSDwy1WoeU
 YzwJmebrI7NQv7xwgwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX5P05buHtjjAA
 kgrt2G3UmTeuHXU+X/26SEVTRiUoummbZNw6Vmy5gD4OmRh3qRFh9fSCtQnUMGZGK45TIxEzW5U
 88CnexrSFbzgrRXKAKzpbF5qWWmWfLk=
X-Proofpoint-ORIG-GUID: N9ml_yASsnaYOpeRHwz0twVXgDmX5Fvg
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6adf220d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TPaDMEC0OJE0i2k_fPcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: N9ml_yASsnaYOpeRHwz0twVXgDmX5Fvg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260038

On 10/24/26 12:30 PM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Setting df->idle_time in msm_devfreq_idle_work() means a cancelled
> idle_work leaves a stale timestamp, causing idle_time to accumulate
> across idle cycles and potentially trigger a spurious devfreq boost.
> 
> Move the assignment to msm_devfreq_idle() so the timestamp always
> reflects the actual GPU idle onset.
> 
> Fixes: 658f4c829688 ("drm/msm/devfreq: Add 1ms delay before clamping freq")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
