Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584780;
	b=rjfOcP4ewH/RlkKc4lOzA1KvxXwFGMjcHjSvAG3Xn2f7fYd49hiqboDPi1ag1o64jusv
	 bBR6m1SvSpY4Ku2Op29dpoV15qjxmX6BM/WgpAc06DmQcRlejOkikTC95MkAv6z6zfub8
	 c8+A3D/jz8lDSf9WWQ2ZSkeO19UYzIYXWDAixclD7wjXO6+4Dg3FRTU9bZBW0kL8lm7s5
	 V8SgGFyY9vMgdHSS5C9eBaySFdc6f/3bousAgh4YhK+WxLVFJVAloeYhMlYebhqUnie92
	 hc1jLjn6HUukBmOb+/LUVynMTP0pK6EmEAmhwJ+VO8SZD85/4O3fnoI9/vIbWXMd1RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584780;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aXcvh625bjwiF0YJvjLteYVFkzEmw/+Lbr5Sgxf40Ag=;
	b=CSZOQnjTLpZzHkTfllpSPzqa2DioVpk3PCC+pawih91Pfh4Ac4tli4kp/tBvJEvEAYbm
	 /iHqmjB/OQMirsNkfekdiF5zINB/+eRaPzio31flwBRyijuE1dlIP+ONgDuM6u73HqTiz
	 4C2As/Cd/AOQYmigDZhMqe0D3v5S4mNICjIJbsJQXTVILNjd1PG8cfbDMvCjwktfRF0tY
	 qir8jt+vv6xbw0TBsbo7NRGgSgxduNkcOBGl2+DfzADyQIQxfRb9GBx4lc+7OcWcbRS8v
	 fmsV+8Fi+hm65uJQA12zq6BygSJ5r1KmmRTQXwx4bybeAglvBgbLLeyBnt1S9Y8r63A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=punrYVcr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hm6JMokM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD251606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD251606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=punrYVcr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hm6JMokM
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgB5E325180
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aXcvh625bjwiF0YJvjLteYVFkzEmw/+Lbr5Sgxf40Ag=; b=punrYVcrXe+hI5F+
	u73h3hYEP5tY0mkcm9+Z0emKtuJvzIxuDJeTjVSpSaN3AofayUURPQYCABs0LwqZ
	GvZjU1wXn/tAABVsInW1QCpwEoJCkh9hCgi7pKhACAVsj/S0Ppf3EFvZzWt/gUhK
	V1gX7copJ93B1cH89r9gFJFbO82qaomtkHtHKlcGc+BVweLEmFWyMyVV6mO9BWN2
	rE2g9zFeXzcjshkcA0XNqjwlDNUE56wU8A07F/Wm16Nt0AiORY5NhdPpQwb8pv0J
	1jSf4tgtFjsVKtIqUhgg3ZaJBVnVSQ+TwLpMdOpHAQaG8Lh7SMmxuNtS+7l5/hl2
	eocV2A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v3uw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:12:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93edac5877bso20569685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792584778; x=1793189578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aXcvh625bjwiF0YJvjLteYVFkzEmw/+Lbr5Sgxf40Ag=;
        b=hm6JMokMcqzxGTQFbBzcgzN11Dg+hCUwFDwABZq2AzbouoiC12Rb/Mh+yguETZAJvL
         x2tFahukUzv1u2P99YXVhmOtl1bde72Dc5uE9cEfwuAd+1/ehk8J/0GeBMNZ0FoCezbf
         +L0jkfNr5nhPIzCEPdBOUxkJdr7B/+5GiDriX0YYSeKSoSM+HeCmErAmh3uxXRTtINdQ
         roL5FfMk00ioBgIJoXYvqOI3pnQVG7li2l+qIF/9+n3A0TCB3ZzgdN/D7/hIxoqCNJNd
         pqYwtYlrjO3blFxHGaaBz6JtWdo90vYmJGZ+7UuGhuc0WUOgkqnCRVJMFl3kIqUzTQRV
         QDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792584778; x=1793189578;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aXcvh625bjwiF0YJvjLteYVFkzEmw/+Lbr5Sgxf40Ag=;
        b=wsuyl64vXmF0cq6WNqpK1aAvxuOTjQCY/HJ2YnyDFBINEJG+M+ebUUoVSJbN2BvTke
         UWai89UIS2abgQzQ4f1CTh/OlbXPUv0Kzut2R+NQKu1/KVf2NCVWDoXmqO28B+D+f/nD
         a99lEEwjX5R3ppv089DUhc0ibHmdGL5733qQVC0ZJDKrum1sKqRQ/b8uyhLhWfjqtBaj
         EYGyPHJXRqdgrOdOyRI48xdXWshRwuO3eyOvazTNq8gvjqeXrDJ4CAGBXxDgrXkNhbfs
         HQxFyR8O8Yy7yviUJxwRl2frah3uxrbFufNI4S+Z1RuktUFGdy2iXz78HDMoKdlWDvqn
         FVOQ==
X-Forwarded-Encrypted: i=1; AKwUvByIvQKvWjh6TKN8snk54oQaZ0XUnhK9jl3AvW+d/Um0Zr0D8eC+jo+G26fpVdjr3Rbq4bx/MpksZGlJC3u0@vger.kernel.org
X-Gm-Message-State: AFq9FYKy9piPc0w8qCZbOG0qRCWSR99kL0gyv/x8VaPce6bS1kmuaayh
	KEX2RwYVHG0DGMDmCLNLObd2ABV+FNtoaEOdGAEDOVRujT/ceX0f6hxkeoeDAjjWjn+S5xTv8N5
	sBRWRghUCJk4Smhq571jH2yqDXenS1/2fFUckQexTSBmAgoGSbOrnyNU3B/JQ/Sr3HOaq
X-Gm-Gg: AYBFou2aOaSyBfNYSu/sQeuY0ZnT2qdEw0LnJhmGCLuw67VuOgyPCM4F1c+YAJxqgKL
	KAmErd+nlfo9DD9Wf+dHPNSqnJK39NF6UBWiOw9QEzxb4jM823sSPZ0TwfU15S4EY2tVEy+O0Lg
	T3ZROrOzhvdlhjwDLn/6pbpPd0S1sExMCpHkzOMHFyFj8qfgOcxCHuhgg4KmMXCMBI3tGv2OxHm
	m2JbwxGo6fxdh+ig+zBsz8w30kjqGdQElged12xQbThUl1TnVVCTBQqnsIYLkpG0yTWAeeN0Ktm
	qYLuhCBlYbwBbtMjlSlf2/vGFRtFuCjR/pZ6QzbMcIvrHZ4VDD1P532VC/+SExort6ApZgBsBM5
	+BdlARjAQUafGpNIoMJkQ5A==
X-Received: by 2002:a05:620a:800c:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f57dbbb66mr435410185a.0.1792584777681;
        Wed, 21 Oct 2026 05:12:57 -0700 (PDT)
X-Received: by 2002:a05:620a:800c:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f57dbbb66mr435406285a.0.1792584777265;
        Wed, 21 Oct 2026 05:12:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b402f2be12sm819079a12.2.2026.10.21.05.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:12:56 -0700 (PDT)
Message-ID: <70c9b4de-6403-46ba-a125-9e792d4f63c8@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:12:52 +0200
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
Subject: Re: [PATCH] drm/msm/adreno: Leave the GPU RSC awake for system
 poweroff
To: Michael Burch <me@michaelburch.net>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: Shivam Rawat <shivrawa@qti.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20261003193518.13811-1-me@michaelburch.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261003193518.13811-1-me@michaelburch.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX51xOLFo75IXw
 B/yVyZfHrtzUrLSGijr43+CxWoY0Inb3soTb2yrIA3EpcTUM6YM9v4MLD66KFi9+A/PJ+rDuVh7
 4VL6U9yTeHMdlFh/RcwiQ2uV4mZNIXU=
X-Proofpoint-ORIG-GUID: R9UbTZoyy8563t0dWV1ags0a7eXkQqiK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX9HrcG4C4lBD7
 RVnK51FDpRzBk05CzQqR8RWgONb2UWKIF31W3oGPTuoWauytn8vaMKj5rSqP/9R6UrtO/I6sUcI
 lYpk7ix0tNCpIVuixXMbEA/J5h8jAloD1XzRXk8P2QDxTIuiCLiOU0eaHkWqpKgOLKmvt9N2DJP
 lxPNrIOj2OeQPpJfJxPknq3KPtg3teaLKxNv+wxfE12+2oQS/JQLJ27W5d7Lsq9aCsPNX2nCcy6
 se8VntJG49bI1us1evKyfe4PKTx6qGjnePh4ZI9gZFawei51aBCYvmtJ7FM74XG9IK1CmEq3MwA
 PY3Y6lZM/vlyD5WrLLStQPNKlxUcce0m3jc2ulCeyDXuRnH8DhIBq5CDsCAHFFozMc9ery9jySp
 +Ex2/T4CAJ3TFTrV2I6gbPsPTE7yhaLPLhQ3HmkBb+N6nWyu0V2/GSZudcAfY09Dqwxop0I9dV9
 jLvu6OkuzKQll+ZbrNQ==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad8ac4a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=OZ7Xlw-yAAAA:8 a=jfroN63_7_ZKNpzpi8AA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=qwMvOfr3u-Fs83Rmfh-C:22
X-Proofpoint-GUID: R9UbTZoyy8563t0dWV1ags0a7eXkQqiK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210048

On 10/3/26 9:35 PM, Michael Burch wrote:
> On X1E80100 (Dell XPS 13 9345), commit d9108bfdb746 ("drm/msm/a6xx: Fix
> stale rpmh votes after suspend") appears to turn poweroff into a reboot.
> It seems to happen when the GPU RSC/PDC is asleep at system off, i.e.
> when the GPU was idle before shutdown. Keeping the GPU awake until
> shutdown avoids it.
> 
> Resume the GPU in adreno_shutdown() and skip the RSC sleep in the final
> stop. Suspend and runtime suspend are unchanged.
> 
> Tested on X1E80100 only: poweroff and reboot on AC and battery, and
> deep suspend still drops the GPU votes.
> 
> Fixes: d9108bfdb746 ("drm/msm/a6xx: Fix stale rpmh votes after suspend")
> Signed-off-by: Michael Burch <me@michaelburch.net>
> ---

This is odd - did you test it precisely with and without this patch
and no other changes?

Konrad
