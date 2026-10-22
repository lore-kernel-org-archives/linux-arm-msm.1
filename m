Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792672093;
	b=CMvChMmxPDU1N+4R4be5FqmpGCSGDG1RT8U4XoV91AJSuIafviJGPJzfmKm0iw+W7bep
	 zXi3eGtcF2HpoqXgdQILOPnXKrzp7NFSkwUhyLXXU1nJU4gFMS9/lFP5F6Okn+laz9A9r
	 AzXPKFFuN/KUtoeArIJN7FCSejCRM71ijJGTi4syeEMN3yye8jFl0tokvzCwPUXFl3ThI
	 SCfd3zGs/mpTmI7C0PLWzmQlNolyg/izzbhDPCzS7+3BioQGP5c09A/iZ8s5vtqoVqRSk
	 CxeGAvYYTWZy4mVwneM1/6vhCPxtmjpLAffJ7AqYGcOtqgVHCd8l6Zv4TI4+qrGPEtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792672093;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ffhVe/j6yRlCzr2Q00fG+yNfZLrhxessWH3dfhlXdzY=;
	b=Q+9JlZvKc0hWCkCFjGLcTq5w9Z3s3Qkl56xc37CtXjHufZi5Jw35JgH1ulJYqqods9jd
	 hn3CbwVRgmTmZ2iIpCq1RI4SBcdODlA7Dzurs5VUcUKGGbvBYmG/IPpJZgGxx/b4BSEsv
	 R/l6YakYRevuA3Sbei3Z9+75MHkCUdEySbgCGIq+SnPODOhf/Gx+PZouVY6CrGKduxJ9V
	 oJu36wbQekLDeJt0fibH0LeU4YgFoo3V04kB6vrpFJcZigXXbDCzj5IV16+gUA5sCS7A4
	 D6RFCX7u5qpmBkPWSOhrlG9Uctt2DdLIz1EjU/S2LPAXXBL82dtxUERkSjoCRupNG3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qk7LeKmg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="YDDvB//5";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D990E606A326
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 12:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D990E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qk7LeKmg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YDDvB//5
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MBNvsp019601
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 12:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ffhVe/j6yRlCzr2Q00fG+yNfZLrhxessWH3dfhlXdzY=; b=Qk7LeKmgKfl8ASss
	r/S31nkFb5YhbcmUSm5td/BECe5v1/SgAUKL+3yoqW/lRibA20tcdz8GOCTejfBg
	SJnhc6mDE3oLYQ7nfvuFZ8AOxYLsPwr0r1E38ln8TXP18dG+8EWHGPBJlKfBr3fE
	VcGF4BIJOrqH5FDylxqT4Lq/KDCj1IJpqJhG5yfK7/MIdqpE/fgqBrq9Q/nILTw1
	IzY44rprRytmIoIGq05urfI+V3wtpeFQtS4HFrD3I/HhyzSUlG0u+Vhxnhui2rLv
	qbPfovCQT1cJYHYgXzKW0O4anTJTXMj/jGOLvJ/icvRKkqNw4umV6qAIrYgHlM58
	W+/f+w==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93cb6ej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 12:28:11 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-80a4a17618dso1662065a34.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 05:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792672091; x=1793276891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ffhVe/j6yRlCzr2Q00fG+yNfZLrhxessWH3dfhlXdzY=;
        b=YDDvB//5wUrrsMjA+YOjITn6gFH07RI8ByXRGm5tbEi/x3FTKojCVivuRWJ8C5RsGE
         hpAN++kQIO2OzyiQI61LcvkrklJLzwQhpZe0FPXz+0w977W+VaOzM0xrifW2TDcLrySu
         ntOAlduDV/IVdjKapF8Sr0LDsRgzDICMUTekO0VJsHXE2UjAySxZ6INfhIbHZwZsf/y9
         otgi6zR74w7vRYgkYAy4l2d3R4CCVY9tNUrFutkieB20d0VTUXkEcX85/XMgBYH/YwCi
         7ePqJ+8bn2e1Jp2AVdwBRmo2ZNnqF/m/kfZDxOIoGZ6cgr79hzVrAZCvEoZwSqBKuQnl
         Dt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792672091; x=1793276891;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ffhVe/j6yRlCzr2Q00fG+yNfZLrhxessWH3dfhlXdzY=;
        b=zYFlb62WVUA3Xmkm10fVwYuo6WxeObxHNoN6v0XPWnQvbAwn8NaC869XD+xjjmRLUL
         NJF1YYXKTUmPUOxlkpk9fzReHCLZakXUVKJO3UmvXj7CLAFYQsPLjKI158Z5A0CxJ67l
         DnVjzbCAgwtDB/o00vIhaNGueyOJW8SPwksGb6ZRqy5BvyWVbrDMipbWbBRPRe7Ya5if
         gYU/aBgNgTw2pcv51vJjjJaSvpQ5nhslKHNMr0SkNIIXLvujojWsiXG2jHDbq2Gx0aFs
         FIMTgQC3ajrdyfshTs7fP2kzrKB441VmIZdibQEn4WteFeK5j6iqWA8R96FPQGa/+eF0
         sghA==
X-Forwarded-Encrypted: i=1; AKwUvBzx0mzB/wexDWM1a5gKWqF/FbjHY/TTVkLg3TotgCnOc0VCUQpu4yD8a55OTjtSwbkx9yceMMkEvQbwMiiN@vger.kernel.org
X-Gm-Message-State: AFq9FYIre2DbhvIh6NS0t3p1DbgOEzR4V/Tn2TEebLuDOHtlantk3PfB
	NS9mOcVAipaxStk9/I/87C9rKtwpAbvtd2Bvxsh6eF470i9C1IW2LVqYkEDNeqRQUCS4/ADNkXa
	roA5pB25TfZKHS/hVt3Izpwp7baYWyMGwuSBTdn1IMwncvpXdSlc7ErkTU3q2MyKWTDjz
X-Gm-Gg: AYBFou17pDx/TnDGufJIBIIquGYJ/FzkJ9BjOAVQyyWQxdPl+M8DpPxMcz6m84wc4Bw
	sgwzCsK3EeEOVu5CNZOp+MXC3csuofI6oNgeVC7DhWir7Ff9lJeWdEiqfBaiSNDRKz48+PXPKb/
	poQmx39gzy7ZMzL8rNYEYkeDkTZ0bK3XCYgjzsFsBugh/HlGjIAnheFQfeUxD387ZzjdU0MR7Sw
	8sdr99Rx8eBtMVWF/xWuEFNBdphskKXs3EHO1FcMBPnd3sexbz26bC/f9wrkCOao1DODrb4OA3R
	mFVS2VL0lq/wHKOzed5aX9+tn5oB/r/VxteRelq1Xye7hgj6lh3dwOBtVujuNiPT18HF2Zzgz7G
	mXKRHlGsysxrkKnb6GvCcwICFXZjQbxw3
X-Received: by 2002:a05:6830:6f88:b0:7f9:555:1def with SMTP id 46e09a7af769-84e30c31e32mr1258626a34.11.1792672091188;
        Thu, 22 Oct 2026 05:28:11 -0700 (PDT)
X-Received: by 2002:a05:6830:6f88:b0:7f9:555:1def with SMTP id 46e09a7af769-84e30c31e32mr1258609a34.11.1792672090792;
        Thu, 22 Oct 2026 05:28:10 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84cbcdd9d82sm4892517a34.10.2026.10.22.05.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 05:28:10 -0700 (PDT)
Message-ID: <d6a3a783-c6ec-4f93-83ee-ce30848917d0@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 17:58:00 +0530
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
Subject: Re: [PATCH v3 6/8] i2c: qcom-geni: Vote for SE clock rate using OPP
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-0-5da1096243c9@oss.qualcomm.com>
 <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-6-5da1096243c9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-6-5da1096243c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0OSBTYWx0ZWRfX3m/9g+LqbgjT
 dkHLaFlVoo02a0UJB793pMTJVkNgZG6b0eu3/+cr8jT+/ijqOxvrfhGK4qzpz4W6Us3sfF+UvOa
 +TDh9lwu6+cia6KWrqaIaFBCmH0Wvl0=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ada015b cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=gi_f2RLh3HdMVU9WvNgA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: gr_jw18LLb9rlAzmATc6PkS_ljoCqwxB
X-Proofpoint-ORIG-GUID: gr_jw18LLb9rlAzmATc6PkS_ljoCqwxB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0OSBTYWx0ZWRfX/kYOJ6F4yvz5
 J4fZWyad5/ITHs5LwgJhL/0Va+D1WHTWczpO0PHHOWQ2vFh57WSkw6xUt3wPO4TOPphDRM40xXa
 xT+p7z9OOrC3UC7BohedYJn2rnRVOOAIZC4xoFT4RUblnWkj79rAyEFHoTaHLCNsCve5RKmkpK9
 fDNTSMiLPt8Ip+auyzYKBkVkArQhu6WHWSdwQDXl82BG+fcmy303aV8edPo7Vm0BElMYtBz7jQT
 U3mY67U0a2v7WJut6x/4Gi5QxNTTGrPtTl8bSZWpvepKR3fDnIJuRAELhmtzO3DZP1Wwc7kDb1m
 hLAIBZheg2LCnIHmsJYmLSJykl3TpSoeD80dbfOS+T04OmbRwdKCHD9jYygRCHdZdtQuGaQhxh3
 /iGvgamtGTUB+PEXACvGO0K50w4EHiqtEFqj4ViO47roJ5dMTkhKCYbGJRgfN79gzE1f+/yVzxq
 DlLVoyPL9O363c92VKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220049



On 10/15/2026 6:28 PM, Praveen Talari wrote:
> The GENI I2C driver selects a source clock based on the requested bus
> frequency and programs the corresponding clock selector. However, it
> does not request the selected source clock rate when OPP-based clock
> scaling is used.
> 
> Store the matched source clock frequency and vote for it through
> dev_pm_opp_set_rate() before programming the clock selector. Also remove
> and restore the vote during runtime suspend and resume.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
