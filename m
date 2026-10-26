Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008394;
	b=cSlcq9iNov9NYvJoq8QtQzSvwl61kpTh6DBuW2tfy7LcpoVA9XYQGGeUxJfdM0bznJpO
	 JVCHV3EikQlhfijgqeYLI2Bh2fcFmXAdMwLO7FM3RL+MfBRrh9w7fw6Qa2L6YyTWA1R+q
	 BqjT1koZtl5BYafZrGzHAX904dBZGN3hbATJ2SromEwdaigZ8NjF2OdWIfIVTvrm66dcU
	 GI/PmLP5WZkb4USfnSRI/np3KmRuYxGS8/mL/K3fs/hcaNyvGW7RLEn8PrspC7/BMsmrZ
	 Hcm4QViqOYj70a0Ac6tt3mFtVvvWo1c8OowCZIcD7G6iPI2RX0ghCKNH3/O1lT3ubnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008394;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bYy/Jwyeow/fBLZ5IOY3qekzGxtgJZYPejsTaPKV4sQ=;
	b=J1aiRJun3Vh4uh66HaDKLY5DQVThMLa3dmC7+07UpMaNbWdtreDYpKCSMIgcn/3MuMJ/
	 d4EZD/tUxluy39CkIlpFKzco6z9PvygD6dM57Ix5+0yvpAi8HgKBFfRN4xao0nGJykChu
	 lieurBfxWEtNMqyZsA+HVdvVgtGWlP2PH9YsIgSfu+BZAXX8+pRXE8h2jlIgirNv/M0CK
	 6LbpVqzaw4xsQeuHfqtjO3RNtniwegk0/tiYFbHQTYrWWgZ2ifJaQ+ysvIaGm+oBhHqG0
	 YqJrkzIIO/LWXoOrXLy8zI1VoTlORuKLiYY3Jn+aPi2oVgR08S7up4Rm5X30ovUp+9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JPV8hxT0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=drL4hGM0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCF4606A31B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECCF4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JPV8hxT0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=drL4hGM0
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b4Lv2255440
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bYy/Jwyeow/fBLZ5IOY3qekzGxtgJZYPejsTaPKV4sQ=; b=JPV8hxT075qsg3T6
	mEcxbfzWO/F+1sHvbdS1G5qtSnMINA9fKtU8iq0N4eX3VManpvgZnx28/OYHsPKj
	0nWtMhPFg9FZDl56IzqTpIhLJI+suaIMFsJTfgyKMoSNkceArzFrt4rkp6DQ7nzR
	hWngJCzomXAwMUOZ1sf09waCCAMS/TnD5lw7+DYp+8X53Sw9s1xyXKIW+WZhRfs+
	xveOSkrSw5FhyipIoD5ksk9iNWegn8G2JnPAH9onQ6PsR5z9XZnmvKaGt5hkt90o
	YXfdculLyMcNh1bPkAGA7A/EMpNfbC88TYpbujRGi/F7XqoXiOIT1Z7MJ0vumpBG
	zxxciA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3nrt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:53:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93df7a9466bso28357485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793008387; x=1793613187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bYy/Jwyeow/fBLZ5IOY3qekzGxtgJZYPejsTaPKV4sQ=;
        b=drL4hGM0+AATbwNTS6Yy4e2F0ActdezJgOYWnit9LaNjxp7DaUBKcHo1k5RRLI0I2P
         xVAO7SwPCoJ5//uVMD3OraXrKsvmliQN1ocQi0bFHMiMc9nK1ZPsQBjeIhQRJiZuZtd6
         zCAcIO9Y+7P8dizmTr4xmuHQ7zBFNE5YZiSdOs2DkBoLIz2jIOpCptzbIJyvNN4oB2mN
         TUN1zEb9j5JLGHQMWbvzt9d2Di2yOoA7CZI+qnoLaH2BL1uSUZcsivm2j3JOh0nQrGiy
         g8lEZVBCsqWqshpG+G8NVQRZcNs2kfrrzmiNrMPZcgYUzR4ZCgv8hgg9d5ucnrp89Sq/
         zmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008387; x=1793613187;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bYy/Jwyeow/fBLZ5IOY3qekzGxtgJZYPejsTaPKV4sQ=;
        b=f/yupEt+u1fGEPoa2XK9PUG3olpC7UzlzQoOIE6eK7Mjf8wDhogc1u6xmS+R7ha+LW
         Sz3Dw2Ej0fCepBJdt8lyoZ5PAL+6brTe7h3O1tP1ashayRbZGvYeHT9VMsWYLCGpgv3/
         cf98FxhLU7g5x4lY4G/EqFr+GsgsjotHLQKnbA+PKor5lA1A8TGmyGmvNIGS7ZGtFoWJ
         uHIihX779aiH9vlKpBnu2Szs1rkTU4Z4YvnpNqEh+vVZkfHu3EVQfjNRCGDMfwIyGhSP
         uknhayMzBu6vo/2nFUiuxo46+EcOEp8hT1xEcSq3pn0TguP+Y5cbFK34IMFN4TsneJOL
         q7nQ==
X-Gm-Message-State: AFq9FYImaZVDBRTCjsXroEhAxaJQ4s9ffd9wOQpGkAEG8zMuLWfzc7pk
	VymSQJqjUKeMKiLJYQB66D9rYaUluET+PufWeR0W+JecKPW/Mp5+mXdK4+w+Tcw4c0dtmooXA8U
	M8WPqnsWjMsp6Uc7NFPgbhGfhAVx8+UyixZ3hSGi3CErqmBo5CEnWiSZ3gPuAw5CX5l7v
X-Gm-Gg: AYBFou3V/bj5XDyencroYOKuAJdYwKYpp1QTvk0aRj5U3LR2EPUT3DTT26d9hj05OwZ
	Mw+H7/S2KxuxBSmS6DeGAgdMdNdY2Z+/dUdvBYG5NExWU19YDvlVEvdOpr7F5o+2nEEqHCAnmow
	EAYONrTHyCdfBI9tUIYU4/6WWYaof0jZkr/GZndi1QwvGcs6MNu5x1Bvqqr3X4jUDqfI/ThlEjE
	cODotW7UxAohWJVRxJ9Bi5e4QoK2iVMLKA65grPjishtOd4bxbSjzQ12WbSOBxlIeTzO5BOibJV
	jZ9+krh3il5lHv0StR9KZP6VRsCDx5XOYBkAxoZjCCHxtVUIavlvngnFYe+/FDxQia09jp7e/2r
	r8CWLzFiEgqzlCLWjj1RWQQ==
X-Received: by 2002:a05:620a:26e4:b0:93e:6d87:4f69 with SMTP id af79cd13be357-940ef8ec03dmr1010420685a.3.1793008387089;
        Mon, 26 Oct 2026 02:53:07 -0700 (PDT)
X-Received: by 2002:a05:620a:26e4:b0:93e:6d87:4f69 with SMTP id af79cd13be357-940ef8ec03dmr1010419485a.3.1793008386690;
        Mon, 26 Oct 2026 02:53:06 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e89e6sm304007766b.20.2026.10.26.02.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:53:05 -0700 (PDT)
Message-ID: <13053ef9-0301-4db1-a9d5-1cdd845866bb@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:53:02 +0100
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
Subject: Re: [PATCH 5/8] drm/msm: Fix sched_prio inversion within a ring
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
 <20261024-assorted-fixes-oct-v1-5-2977f974ddb7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-assorted-fixes-oct-v1-5-2977f974ddb7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4EU5qWklnnDCEidj6ZlcqY3Zq2fHiT0-
X-Proofpoint-ORIG-GUID: 4EU5qWklnnDCEidj6ZlcqY3Zq2fHiT0-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfXw/l5MHBuK60j
 qhXIBK9AhnBSf0n519YXzxywvpEVPcbZAa0FI4IWkZD4ExECCqmJ16RpsSZ9WI+aFWoyR1UBeR7
 K4chW1zl/7upFLqER2589/8kJP0JDJI=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adf2304 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TPaDMEC0OJE0i2k_fPcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX7KrztRfz5Bc4
 1iOqwazzIO4iRrF9vPkJmyaWShmKS/OLONV/ZoKurN/bEiIF7sCTpHkhgCBLQLpkqtE7Bct9hWc
 u7aYP9uJR+QF41ZUdD7OJMvjcdkHRXs3WrnibGtVhu7e2fK2jEVkRZHkv1d2lNmh17JmvxPA8yl
 1gQORz/y0jIETTdnhUjxD6A+1ul07tScz+LAtu+iwU+DdABDhAuzYFsxjmEvQU68qNVxORzgWjg
 QEHhk7RwkPRxroiJxLOb8burkORENZaXEBFQ9UJxkPydAybZ1WkonHTABJ7gU7QEuGX51lHP6oi
 e4P6cV/a3X615TJ6PfqOdNkKsAh1P7/GgalQGZ8J3WGSEzbo4KnYX4mcGrW+JDY7QBtPvedx8MW
 zLTQU0k4dTsVibCNMp2AJxcl3hZDXfzxIvAk1VN488ovD3Dr7Kfudo2ki8/i8UGuAbRBBRJQxda
 Zr9atcMTlUIYpct+j0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260039

On 10/24/26 12:30 PM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Commit 38f922a563aa ("drm/sched: Reverse run-queue priority enumeration")
> reversed the values of each sched priority. But it didn't update
> msm_gpu_convert_priority() to match the new order. This results in
> incorrect sched priorities within a ring.
> 
> To fix this, remove the inversion logic and add an offset of
> DRM_SCHED_PRIORITY_HIGH to keep the range within [HIGH..LOW], reserving
> KERNEL for internal submissions.
> 
> Fixes: 38f922a563aa ("drm/sched: Reverse run-queue priority enumeration")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
