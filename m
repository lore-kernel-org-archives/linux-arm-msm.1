Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793011062;
	b=GCaROHDMm5Z/eEw7v1tv08vVkBBCVA8oVaR6SrDNpHUvEEeHQXWI7zcZk4rBxq030Bxg
	 dahF92JmwLXQc845Nt/WrCKxIl1uCMCMxwvpV5J29aofic4Alsg8VqozlxV/QqGJCm+mo
	 9yv178ILY4Xe0+tM2NGaQho/PIpQDJrs46woyGb9muupE6r9Hp5xMx/w3sLYRd4O+2uIU
	 1HE5cAb6+o4l4PNVaJS0PDhX//VjYnoAH7aoCkAQf1xSyUSgx3XqZAwqY2iTTZQtw2IFJ
	 xp7PYD+Jdm0LMzpPGGEot66SodRF4O+PodD5HCT1TIBlpmWxWUkP2PKL+W1q9kebcoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793011062;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Gqjg8xNmhBbt2RfYvkv54a120ybeK1H1UlJE53Iy9OE=;
	b=Q0/NLByjE9oyr/dHnFaF/TBPHcyzViPbmKbTrk0ojkJSb/al0QcGflBc8r7M9kB77V7x
	 RUQo/DTyN54s0m379X8hhluYdJIyM4nF9NDTUvug333t61ZYgNgZYqcuTLCnYzi5Wg9lj
	 XtM7YyjHT5CUBQgujQUUqVtx+6w8qKCSF9UGMVOrg6FB/5bqq44ui09GDmdI/WmDi2WF7
	 UPnukV9pGoww8ZGIN2uzvU2zSq6PEMjzAAw9ykfQT4ef+c6ZP2wusmZDNLIlDDrRgvtKC
	 1SbBipdshv5CwxQQ8glik1O3dhNs3kJY/lJsEZ/JHuMhHuRrdjtSY0hDHS6AqpIfwgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TpZsGSX6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="bV/RkubC";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7157606A31B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7157606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TpZsGSX6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bV/RkubC
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aU9G1708687
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gqjg8xNmhBbt2RfYvkv54a120ybeK1H1UlJE53Iy9OE=; b=TpZsGSX6x4fCHbKw
	U8ef/568RxKDz0hovaxFvn9IInCc6pKY8/Sn3J7Cbt6yKqZr5KGpuZkWs9oe6j7k
	brO5+mOteKXKVH5HZzNaziob0mdnSna+I/c9Up4HcMbd6mprqlDkbSmUutdRWsP+
	eoa+c5k8kh9tObqrRBGOrjRsw4WJGbLPV4MsPhrjHrhfaDss//ip8gDbQn7ZD72+
	l+QQlPfcVAdnMvjQgAfLhDg7A6URh6DAhD0A+pYAdoljS0JxoEy4D2Wu7xtHHsL+
	cRCQRxsvNGOHaC8b82Ix7/gO/UBHgrG7XrIzmwzmfJPdUoxP39bSBmvh/XnrtdJ4
	32Agig==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjda1sw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:37:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c008df17fso8638626d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 03:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793011060; x=1793615860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gqjg8xNmhBbt2RfYvkv54a120ybeK1H1UlJE53Iy9OE=;
        b=bV/RkubCe5u5u1WJ+dTPiNowpRup6I+sWY3HNW1q0uOOwqYq3ZsF324MDv00xTkCMc
         pg6mFsCA+GtpbLp/MvJu+T4V4N38r0N7fuT0p9K7FdLTGqwt3PYonSMHbxswzTC50EiS
         nDZsos4tKHgzuj/6IjXj2qqA7hP5WKEdzaACWUXDhTHuIgDD447kQjPHuVaWVOIsNo+A
         h4UC0PMXvYoV2RySu/frdlH2YYb3mU9QhIW6e3fhnT8ycFIU26S3PCqEX1G6Q76uTOZV
         AK4n0UGSBIpjsh3hUVbhfsaIM4uEL3fn0To3xXx/O2nG/gAAN/eRRvzwiuuvz79FBSJF
         7y7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793011060; x=1793615860;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gqjg8xNmhBbt2RfYvkv54a120ybeK1H1UlJE53Iy9OE=;
        b=aYmhgY7yyfPMbSz/k7liOWbc7rq5BUKYj+TJ5RiNjV9b1YQeGr3Alcfry+WzjTaR83
         3mXhazDTYXeetojfK4kogJceWmU3PXldqeM1OtIDQhzMgdM3DxcbyDSKmJ2vt2kMRGPr
         jS8e7IlxHpyhmw05FCRUvYfngYu23++ZYELNmjJePaXcdByn3/7ZdxCK5R1sU/kZ2BFU
         MTez8AbT0X99ON/Jkli+Xokw172kza06X13Ch+FXgUsMniBgH7b+EpIiMW/zvwDkLFqi
         GP3Jlg7MBrBoGVEOLqdAsMbn4N2Ucp0XBkWZX53rW4pv/9Ok2sb7Q84+x+iIArB0XOX5
         czww==
X-Forwarded-Encrypted: i=1; AKwUvByAIvNbz3lvxQ+pnyWjV6lKGWysKnX4wbtmF/z/WD2hnBEG/H5YaO2wr0a1CtalwZVVnWDkfUnzKO64GNql@vger.kernel.org
X-Gm-Message-State: AFq9FYKC8WG0S2oI9H/ekiCIxulbeds/dRN/p/xIJK/DMjNt9i7EU3Bm
	PQ6soAM9VYttN6kX9jOk9+HMpUed4sMu81hkNsh8lYbS9VIryc0WvJ/WWKAOAkTV8So7vzceCKH
	cNVg62cvYdYM14kBGPfhdMxWtW7NtTa59HHUB5n5VE0Vi8hVIRnftbY/T+/Mzdco2PEfe
X-Gm-Gg: AYBFou1k/KXSLrMoXEDGJ9/+6M6HYSyaVYuohO/pM640R/6LC/datmZTwIpkhWy7hAt
	HPGRpcyGtidDwSKQj8+fCrTx5UUMNnhaqWOeIF3A7c9AVHw+JZMv+UoMp2FPOZg/RrBLr6RhAgG
	6hV30SIn/lsX1z9lmEUgswaHgKdIQef0/1i4bH7AaM0G1iR0cyrZmNvvsaB1c84rnT2Y8F5t8VB
	y6FIh2Qcsciuq+OXUMjBgo7+uywV2J9lFU+K2TiuKWLBhTAM6gb2Y1G6tjCRZCqgLp5c4W9bAq6
	kp1OiPEqzYySfTbgR/sRPG+n6bqAOAZA6Qp37ndbn5xi8tJtALx5b+hyk5DPgbKu9ZTyjbyTESS
	jqbjyd7a7wl/mHvyBxDfEDA==
X-Received: by 2002:a05:620a:4e84:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-940ef9710femr1130934685a.6.1793011060039;
        Mon, 26 Oct 2026 03:37:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4e84:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-940ef9710femr1130929785a.6.1793011059540;
        Mon, 26 Oct 2026 03:37:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4459924bdsm3389733a12.37.2026.10.26.03.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:37:38 -0700 (PDT)
Message-ID: <7b95f254-ccb0-4ce3-9b35-c605cacdf74f@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:37:34 +0100
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
Subject: Re: [PATCH RFC 03/13] drm/msm: look for lpac from dts
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
 <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
 <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
 <54cb37bb-aaa5-4c5d-a563-acca4822dd35@oss.qualcomm.com>
 <t5gu6ciwmxdb2jghc44gtixdsbedkgy4yzke5sgawjrr2h362u@ahvhh3yfe6lx>
 <wtun2cfukyzxlsfiz2izsejd33k4jpapwqa3uqih5drcsrkff5@e6llkke5dayw>
 <1f6db59c-b7a9-41a1-8022-6713365fa09e@gmail.com>
 <fcb86c33-1893-47bb-80eb-20acd65f3805@oss.qualcomm.com>
 <o2zmplbtmoueumw3iqejfsdmucp5f66woa5hmw3vodbe66reab@syn2ashugzyg>
 <7d35f41a-c72b-4743-b8a4-0ba715be6756@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7d35f41a-c72b-4743-b8a4-0ba715be6756@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7ipiB_6c_QHlAVqVUryIMh4W9A2GzbJs
X-Proofpoint-GUID: 7ipiB_6c_QHlAVqVUryIMh4W9A2GzbJs
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf2d75 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=vYu95guM48VmnKZvmccA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MiBTYWx0ZWRfX1F9yYhgo5lf0
 AH9jcFo0dxSyazDwc+Up9QoL5FmWXsyJXOKbWZUp8WUukMWLruxr11GgkGBaI4MjlMyGfuMUu+v
 B6zbvU4ylSopm0jEBXaBJBBoLvXAIZY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MiBTYWx0ZWRfX6YbfDOE6XqwL
 kuguJ7TlRJEj/DvWe4Ti8LKlb9m3w76g/EzbBs1NJ9skcA27wFo1p3oxRkFXU7m/tzdg6F1GOwf
 loDUunTIuO8dHohJwLS5+STlaGn2xb0Ka7s9+8ZPqOWmudDdVxGoN7tSs7CTc1u1TGXjfqrz/7X
 c3wGtRGraH8gRqzTSc1eguINMAVypJHBV0P6nCC/bvtvHlpA0YH49YNxIX1qQS9WBWHp9K2z/7b
 oNrl+eDWnqIF3TalJuAkJUQl2MqH70zrSYF3ahrhYszuBhLS7NxtA1YYFPfektCzqOEjfPUA8I3
 88mtMbCTmY1ZTVTWLBOEUhKNsHYfCCbluM6PXtjseRwgkjcAU97N8IHdL6g7QVwqBK7y7qjI8Wc
 rhLAt16mlFfGb4ex500ttydoiLCC9S/YsoeQXtdNi9T3qZ69Umv1F7UCZB/snCfDXgYrDy0ibht
 HZhkAVFp4Jx6t7+7Mww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260042

On 10/24/26 4:57 PM, Anna Maniscalco wrote:
> On 10/24/26 1:36 AM, Dmitry Baryshkov wrote:
>> On Fri, Oct 23, 2026 at 03:16:27AM +0530, Akhil P Oommen wrote:

[...]

>>>> One thing sashiko is pointing out is that new dt should work with hold kernel so, in general moving sid1 from there would break it since old kernels don't know how to handle them separately.
>> The rule is the opposite: new kernels must continue to work with the old
>> DTs. If the new DT breaks with the older kernel, just specify it in the
>> cover letter so that Bjorn doesn't merge DT changes before the driver
>> changes find the way into his tree.
> Ah ok thanks for clarifying that.
>>
>>> + Bjorn/Konrad
>>>
>>> Not sure how strict is the requirement for compatibility with older kernel version. An
>>> option in your case could be just do an override in the board dts file of the
>>> Steam Frame.
>> Anyway, would it be a problem? Does GPU normally use SID 1? Or is it
>> only used by the LPAC?
> It is a problem because, even if nothing touches the LPAC ring, it's firmware
> will still initialize and that will cause page faults if sid1 isn't setup.

We're slowly coming to terms with the fact that all of our multimedia
iommu setup was terribly wrong all the time. Venus/Iris recently had
a flurry of breaking changes. We have to follow suit.

Konrad
