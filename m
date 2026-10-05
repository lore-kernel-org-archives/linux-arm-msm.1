Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9629C41F7D4
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 09:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191211; cv=none; b=A/aHFLaisolmFQPbzk11xaTTxkYC9Pgvrd9u1XyIPF78B2KCeFx2zCfgUP8PjU+Of2TMBuAJGo/kLd6lYpUJK+xp+WOqLweP7s0fg8WxlZKROSFl4R7XbA65p2PNRSWQKoDISHY2fXNGLUWxfCKtwgWkPEkDl1MjRwDOZFaSXiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191211; c=relaxed/simple;
	bh=4h6kpbjLFRnTGCOP6FLTdm/2YUwHP5uJ7+u4N1dhcA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TQUb41Szsj2U/tCRxdtPaISoACebiCGaS7suFN7IJ+8+PDIAkdMuNyzmTsZdMB1gtRWyumPN5/Zg0mXsZe7zDMe6ygPJFCvwABLf9FvcQolz48QmF/iMyp3jfVBq0so55gNP3MZyofHY3qMD8FCdMlMj2KnBP9+UFDn401/Y5Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fGu82ZD/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZnuMxzf0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fGu82ZD/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZnuMxzf0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xbnR873841
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 09:06:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kNA9wVjQ7WyzPMpGzB4L8YXM0jvLodaFmlvxSYaCxEc=; b=fGu82ZD/CUdFlJbd
	II6not+0F1l79vXmLvb3uqOIbMlvAftxdUhnIhGCihdyxiymy9PYqXoISG6MWNzR
	LXAb1R2FlT2r4XI800pITORzxwvbfrUcp//semwCyG20/Ob4mmrVCQyP01twsqvl
	2i8s/WlU4TfNs0rqMy0TQY0jK87TfVTUA3P/q/qBzHiw4NuJG1yR2fXQI52ej3QX
	Z8jLVJgjWIlSyB5apg5Erwr1mfcwHpOaamTFo3itjhobmSSjv3mOT8ygu6mde4KP
	VWuWdhtWAD+RC+ZzFDZQP2DBoxl8Pcit3yDMQhif+Jep2U+GXT3B4fRpW6HbkMHf
	gcgASw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h41gn94s5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 09:06:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ccca9481fb6so792773a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 02:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791191209; x=1791796009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kNA9wVjQ7WyzPMpGzB4L8YXM0jvLodaFmlvxSYaCxEc=;
        b=ZnuMxzf00o6TEN+gHlkStfg+joP/UXmk3zWIyegzp4zJJVJxOpGUbV88n1vhBS077p
         pNJudIHuRT9eNXIlpGzRt6lD9bqu8KpcLHOFZU+lUM12cLq9v+0Y4sewxs8Hz4ZQm/4g
         WNf1wi5tlJok1ZjlDgG6gZ6YRPsWOJsbhpoD68mNWM1israqFtLI+GKTPhADq/6FMIzw
         CgByYrEcyKGpb0Q61QLwaaKfLsLAAHPCJbkggXH4OyhOYWUb7Z3Wp5uj3k8rUg4SuJhM
         QrF5q+UstkVi8L37bEIFj9zBl8jQuFy7OIIYwDeLQnq1rTKPcYrwaxwHQtmC2e8qRwks
         z3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791191209; x=1791796009;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kNA9wVjQ7WyzPMpGzB4L8YXM0jvLodaFmlvxSYaCxEc=;
        b=xvZV1/j7I9ERpMJrd5KOF1U7saRuKrTfO9g+QbFInaO6YgTTnqGJHLA14PISvjluwf
         A98yOCu8gpJ+w/0ZC8PjDyw3zPHD5tk+FD8sxVCUI2fVdnQoUpjufttHMBB7PBbAu0VQ
         RFlyK2lsM5PzcGcIK4xOPG44ixedSmpPMIBAD9T0+jDdxss7hc6PiE9m6AtZRI4czV15
         E7LPrqmG1EGrDRmHNLk3L3SefCs4ERCNk8UqOVwCTR8qXa+YnJXELpFyB9yjhbqm8qLR
         On6XZFfKXlR0Uk3Spnn8E2HgkvFzI4boxQmxoRV4WJBGqBeAT9Rd5u2TCi5+OovLDk0N
         Bxrg==
X-Forwarded-Encrypted: i=1; AKwUvBwvywvHSog3Bt69ZwYpx6QRr3M8/VPJsZfEsqN1bLc2BdVkoL+kmxh3+0qKaxM9zYQvfJQlZqx0QWl6kqP8@vger.kernel.org
X-Gm-Message-State: AFuF++nE4w/g/VpDWwS3jspT6ogiPSXxuUqER/gE4uSCbAjks27w0Tby
	9NUABwxIJqe8jb+xcOXwB7C8OzO7LluhrunKxb7qKZIOC0aW7Li1g2W8068YSDnX+BpPAqYaSsy
	hyVwPnpatm/fE6k4McnAkfJsvtvqsV5aZLU1zhhLNby+BpFPpkOcCKlwPyjuzkxzwdW6U
X-Gm-Gg: AYBFou3kTaYqAOq/DA5ajucAG5bDY3Y4LotWQuYyxD8zxbK7LHiGAk7FLyWcBLhge6F
	twYFq8Jle1vmQhZ2a1JYThFg7eobGUnAMY1SGDSPrCoMtyGK1eO4jpnz/WRKz6sGrfau3dhy/Wp
	kd5LjeGnU7gUn5t+YOGgAxshGWM1Q7kA70DA33xhUPKLkk/IePgWWe50S0WgG49DDaShtrSVnPy
	r96pJWsu5I0iISlyz5y0g6oFXKtw4TmLTlie360dAwuUHyQ9WJkdWwZXH24R77hs4Ao20L+ZT0s
	dZAhWUwT83Ln2Y1my/LDwOwTBC5HKU5t57hXNHgXVNSRgZi9Ai3u57ldrKw024FbTCWzTEQaOkx
	dC1S/XiuxVu+lVVLRRJ1U0isPQ3FHsugN
X-Received: by 2002:a05:6a20:94c9:b0:3dd:a197:cf1b with SMTP id adf61e73a8af0-3e0bd44e649mr10349812637.63.1791191209199;
        Mon, 05 Oct 2026 02:06:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:94c9:b0:3dd:a197:cf1b with SMTP id adf61e73a8af0-3e0bd44e649mr10349777637.63.1791191208766;
        Mon, 05 Oct 2026 02:06:48 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6e5930a1sm481861a12.32.2026.10.05.02.06.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 02:06:48 -0700 (PDT)
Message-ID: <f274cae3-e7b2-4976-87c1-b4e5d7607487@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 14:36:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-geni: release runtime PM reference when
 set_rate fails
To: Rahul Pon <theflyingrahul@gmail.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260930111641.1134-1-theflyingrahul@gmail.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260930111641.1134-1-theflyingrahul@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PZzJMcEOSNCUhEghAn6GZIWjs35UTQpd
X-Proofpoint-GUID: PZzJMcEOSNCUhEghAn6GZIWjs35UTQpd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzNiBTYWx0ZWRfX4N84nQx2tHqh
 +aarVHIgZ/G9sZE+MBvtD1c1Ibcpf8M28kxvtvvqIh/MA+hndZPArIO7yGf0HqR0IQ5rH+XhT7t
 XWnJ6IRdZ2/tuYsu4FqVY9PxYlvDt4YEbM1AL3gOBl+yU4UiKaA69SXqpzL1ilneJfJfnzyLqJr
 fP2NFSea4IJPyBW3WphhdrPTGd6E0U3i/mxEk1hWuZNhxqfKjwaW1Fx6VAkvCu6iD2d8oVPriFM
 749zbJ3m6KnzbVQCxLEsD+Gm70tKNeCXHr0qFzurWr43FQ5V0VGCFlLFGkHMoKvtroXBZSnP3/U
 phdFTjSwE8e2DcjzNWsTcHIz5/PD80gz4FiMlxbqmVLkQNowU6qQpdR7/zjPx5DmULDgxqzJKVb
 IpyajKtwUs09o1gQCsL9laK/4vB4BFcfmiYNRWY/qV/YbwlWKBFS+nYNv3uPebvw3vZUeZVsCBO
 qI2PMrCFpSYiKTHyL1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzNiBTYWx0ZWRfX5xec+Iv9HhlV
 ULVW++3FRZKmxdPMUwp7Fi+DoJoFy4Ae6jJiWfxudTMk4TK00ZC75r1GHtTQQ97ZIo3HHOuo+FD
 N7/0BLwIDnfkwcZZBropywXVBSkdxjE=
X-Authority-Analysis: v=2.4 cv=P9WvFSAu c=1 sm=1 tr=0 ts=6ac368a9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=M1oNvLFnHOu12HvPULkA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050036



On 9/30/2026 4:46 PM, Rahul Pon wrote:
> geni_i2c_xfer() takes a runtime-PM reference with pm_runtime_get_sync()
> and then returns directly if the set_rate() callback fails, leaking the
> reference and keeping the controller resumed for good. Route that error
> through the existing cleanup path, which drops the reference and resets
> the transfer state.
> 
> Found by code review; compile-tested with arm64 defconfig plus ACPI and
> W=1.
> 
> Fixes: 10e74f4c5046 ("i2c: qcom-geni: Enable I2C on SA8255p Qualcomm platforms")
> Assisted-by: LLM
> Signed-off-by: Rahul Pon <theflyingrahul@gmail.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
