Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B892F47F2EB
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 17:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785866198; cv=none; b=MZS9+S5MZ/MLxPGa48vDTUHqZeGTITpIhbdCBFNGP+aIQklnNKGieRWUYglfocsqwUT3T9W49akZrAp0WD2OvgoaxG2s7F20r9hOuuroVIItfJfP6HwiDzgz4/YaQnx2BCblDB8MStPKxIu52F680awxBASesE1NqddX2XPS0G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785866198; c=relaxed/simple;
	bh=OuX/C1TtvHCOGmrVIm3mqzAHLgbvc4K8VI0cI+MqO1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C7C+tx++O9etxa9tkoMeCwjpt+/OqxZhfswvQbbKLgXaEj5QSNEbRqwnir+JppU+rYWR35Rx40eYBGEkIVZWH/fKTdNQQztIApRDawSGuVNDxPSiWDjQbSRT++0mxfUfRCRtFFHiJzLOclire2zBoZBYC1eZHjoKlJ6ciNmxA9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=enbAM0/+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SvB3h3Ff; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="enbAM0/+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SvB3h3Ff"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674Gg4xw774825
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 17:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sEllbW2amjEC6Fq2iKDcJ/pEbGG9Dwld0bfe6YT1m6Q=; b=enbAM0/+7KAK62OZ
	GdHZhcpSH+V2gELpiyIYQPBNgso4TYVpWNST7F9GpVdmT4YTLPHXmbOwCaLd6+D5
	cObDTUMxCeqHSFTfQpyEBy3jrYEh0OU4Of0TZvPv/Im/53fENkOa/x2U5+r1j+Xi
	izc6FCltOUY0mzWuS5drVnmgQ7RnWGq2g4lNXNTqS/OV1rs1jz3KdSjLytTI8NaQ
	8/PCGCaJUsMJGdifOxLwOVpQzCDD/IOSYq4M7lGVl6gX4rRS1VmF7g20xVho3YVx
	TymT/LTvNS3DO2vGLmiRDfutwBMTLRDhDpVNyJ6WCD4vYi/5jfFpYprAX1Z6kJ7s
	Pr6Ssw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuku30bf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 17:56:35 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85798977dcso72309a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 10:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785866194; x=1786470994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sEllbW2amjEC6Fq2iKDcJ/pEbGG9Dwld0bfe6YT1m6Q=;
        b=SvB3h3FftsJbWOditUEM4TRb49DIp+Monb7c7O37/GuDV7TaPP2FTY5NDcDgFEFeb3
         lS7onigr+3pi2lys5McgyPS7fHRs0/UlEADHBbNTwLKhaq7DGqapz03OdZyMoNywK4B+
         DbTj6xI4/c1bTWOGC7gHs543Qn7Zv/7HQ93weWphj5wjZ7RSVY3ML96lPeuvaMUesbVD
         kPTmmOzqJN/7uROtpz0HY1ouJ5pmoGUc0ULGg7HUHvEDxsmYuBihyA/XvD2FXnUiddIY
         1LMDAenpYmwAYwYRTevvk26hCr6EjgqayDxzRpVRh+MxfpQt9RjO1ewWVB9hSsMzI4L+
         9A2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785866194; x=1786470994;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sEllbW2amjEC6Fq2iKDcJ/pEbGG9Dwld0bfe6YT1m6Q=;
        b=bv8ecJj8dku+1oX54RPXIM8Sq/wUBv34FIhDkH0HlhTtqFWHRpv5C0RBvNmK1k0ddD
         unKos+eMhQuqomKMFUvroYAwZm6yFQB6fqowROETlYSK1RqdXaHWrQyaY/fBM4/Swo13
         diVuDy5TWOmWVE0kyUc3CySDHS3+yjSUIqjY0GIaUhV8St/BQ1EXbeI5YdWs8eWK9eAJ
         fCkc36Q9l3C5+dJ8g9/roZjbicGMZ/6rKeVUwShZGyB49hum7Jh4FYFYJpneDMLB/uF1
         syjZtJzS0EMv2wZGgLFyvFoVtFo9zyQEjto/sUJKyv2WMmXxfwTK9I6KEKKcn4ZSViC1
         FfPQ==
X-Gm-Message-State: AOJu0YzTZGg3kFeSHnfJRb0GZiNdPymzJcfnj+ePkyGV91WlpqT3M/+U
	CzOkGOaY4Eo1Giw0Yzct3vsZdEXjSJGR1W6wMOQ1MYyIbRyYL3fi1JJBgCBY9l+8Dw6rPwQwVFj
	LswJSjLySdUqsPGa2/ZwToZj0EMBsF7iJAhoKA1QV8H96u+KlRtb1YRmQOGro62VwDvYR
X-Gm-Gg: AR+sD10xrPVPkWEasNZEcbCZES+0LLlxAVrcRRGPA4/niAjey0eIu+MajsBvKvFSuAR
	ocRe+8a2WK4To3ZxMkG+BeQ5UdsbulreT87ZBRArjMnzf0q04jPcKKPxRJ3/1b1MDezhDJelJOm
	v0jEzSAedk/qUDbi9EYA5KcJADLtEGaVkUuv5mvGRVUqalYwV3C5B47v4YYxe9/QMDdTI1k52qI
	F9YUjNRwDh9AxUfieHLCKMyleGaUMCTADK8ELILFSmFf6BT1s5wuQKhpL1cLJ5/NgFgTzIxFDkc
	06c+nJ8Awext6lPKPpLI3WbHnRpYQsHgTR7F7qu50Lj2FWdyiEMM7vfo+DOMmUYRCaVtjQSta/7
	3ZQJdABbfeq7BOPU5kiVZGOP4qg==
X-Received: by 2002:a05:6a21:a38c:b0:3bf:a681:a262 with SMTP id adf61e73a8af0-3cb8603af5dmr461192637.38.1785866194519;
        Tue, 04 Aug 2026 10:56:34 -0700 (PDT)
X-Received: by 2002:a05:6a21:a38c:b0:3bf:a681:a262 with SMTP id adf61e73a8af0-3cb8603af5dmr461155637.38.1785866194119;
        Tue, 04 Aug 2026 10:56:34 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.27.1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673be99sm12915825eec.15.2026.08.04.10.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 10:56:33 -0700 (PDT)
Message-ID: <89e7b084-2afa-4841-85ec-51707a6defc8@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 23:26:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: Add Graphics clock controller support on
 Qualcomm Maili SoC
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260801-maili_gpucc-v1-0-9d8c37bded69@oss.qualcomm.com>
 <20260801-maili_gpucc-v1-2-9d8c37bded69@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260801-maili_gpucc-v1-2-9d8c37bded69@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wBJz2aK--IvX1yziChu7jz5xSB0qVL0b
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NSBTYWx0ZWRfX6idLlS7IvbZ1
 ZJcyynUTtXBi27t4gAKDpKrih26UGmjFC2ta6s2ZZqw7ASqAwU5Wc+zUiPgUkZPSIFLbgykckZE
 GvMXOBYI8NMFYI5cD7xZR8dx4ghi6yU=
X-Proofpoint-ORIG-GUID: wBJz2aK--IvX1yziChu7jz5xSB0qVL0b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NSBTYWx0ZWRfX4fkSqY6eRS4q
 8IkONQ86dt/23nEiy+K+olCdlhzaqFrNVdRM06XggwX/p+2Lf/LqcmXhyIvE2dClNKh8jRryXe7
 Yo+FtEfzuBTB3R6ItYnWLpReYldmqlpsOscWjWllxgRQdAx57vfFwFsooiErgdbw7ZFVb134GW7
 GJ2EW882WfvPUIEDg4KtAX+UyXqB1aTYrKQgesH7956XOtbrWJF2PxNLxUEwYGuEMAvALJOz+F1
 UbiN96Zg4HXPPjxcRc5hcwL7+0auIARhkm4BahRb4Ifs/u8bN9s8zyvvxDvF/xFpCgeyp1h51wg
 JO7sP9ZBHS5k3tclbfyXWNogJ95RcHA0xOl4JL9uauR0AgyIbdE70q0FeJhzevnxROo1aYEfQQM
 KYKLI4TlvV0HvneLYOM/lNfSFvLz2YCrF/WeR8Ky7O61+Ph7cSHZ/6xzWmh2dkOlCOahnDrAZQC
 23mTjtP8yjTyXIyyc4w==
X-Authority-Analysis: v=2.4 cv=X/hi7mTe c=1 sm=1 tr=0 ts=6a7227d3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=oJgQA1a84MxBYcMfCYBOLQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=fCNx6FN-KcjCUQZW59UA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040145



On 8/1/2026 12:42 AM, Jagadeesh Kona wrote:
> Maili gpucc is a derivative of Hawi gpucc with pll0 configuration change.
> Hence, reuse the Hawi graphics clock controller and extend it for Qualcomm
> Maili SoC.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gpucc-hawi.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

