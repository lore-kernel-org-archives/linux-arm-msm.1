Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793211539;
	b=iG97/EkbcwQDnROodJFTyz8abdVh9sI0jS6frdAC8DMpKOsNFmGT/6X062DgrKdSL7gF
	 JW1J/B1gKFFZKoCniiOzJsuTJm2qRQQkYmOGhe+hrSxah3p2RDRHwN3NKIhQsAXx/m8W7
	 +G/V8bD+yavNdQbQw5dw4PE/62tHUWPq19uBDRXtBvfhGwLflODpfEIm5BGuzXVLh72i6
	 1UqBGpR6fAvFafLB4P9NNNtJ6iMjgiwerHjCijeJ38w/w0We6YWZzJV7/AbpZHAtytBZ3
	 bjRRi6NKjaI7N4M+hxBxzp2Uk1qBM9xheRQ6dGF2LkYFwg3IcG7dimtJrx9kmlvcpIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793211539;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2UlnfjAbRNJJM1s06B3PfnT7wYrAZbMHSeL83sIth3Q=;
	b=OF1jSrg6as37aVLRyoWK1+f1+dhqLXUKt3gI3NIQiK+JjEaUrtFCHfkgcnxgaiYhSxhP
	 K9JCJNn7nmX6hLbZ0S588Y2X1H0FNCqN8KCh5Hy6zVUswAWZzLs9s3HKWK7paS0Am1XoC
	 HE1CD3hp4RXPWD0m0EGz2sIslDLxjEimuNxV22JhniGxf3yUuxGW4BkHRAh+Slrxr6mKy
	 lL4hbPEUIUT0KFzljezM3AW4eczfPzsavJ4nGOTWYN1nfpv9ObcafPJ6V6/THKa47Gw46
	 xv1I+781jVeVCjcBjHtaZ64xsxkZu4r889/f3RsXSUSJ39/ZPyeRJk0DD1wXZLc2o1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XOQcgXV9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AYzzFGJy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA50606A33C
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 18:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BA50606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XOQcgXV9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AYzzFGJy
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFB6st2070802
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 18:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2UlnfjAbRNJJM1s06B3PfnT7wYrAZbMHSeL83sIth3Q=; b=XOQcgXV9Lj+oXRyn
	kwPCaHCeR0liIWmvAYjNH2tIdi3QlrLgwReaySAZ7kdCuADVmSQuoFTqTlO9Qpyi
	N8yV/UprUjvm11+IvtVi697FkkwxwPJdjQH4pHEFlDR9LpYcVgXi2hDDcpqpcAUf
	T8EzuWP5ddi3RRoRftoSo+LrxqCLB//+hoICVg00EE4rGZcVfOA08qHtVRXvlHhq
	w7mPHbxGjQNPZqFHw8ywbBlgUdZ5HPHQaa83mUA99X6TO3XFGhM9rn0uyCSYIyiq
	jLvvbeoMcuaWWb0pecbYS+ZYQML6m4d9R0vx36qVfynK1UCO5mQGkzK1rA/DQ2zz
	pSMiJA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7kp4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 18:18:58 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-147be78cd56so3777669c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 11:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793211533; x=1793816333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2UlnfjAbRNJJM1s06B3PfnT7wYrAZbMHSeL83sIth3Q=;
        b=AYzzFGJyTJaO3zFMqfft9JLO0zGOcA5y8gSYrjVhNwh6IL1jvJ1nDO0pgDYmKHFOkh
         DrzVeQlLVuDnyYatq7SQTu1djJafJ05Mw0t/U/Zr+plY47msRZutdNe4AwZ3PytwzE8X
         3Nmz5Kn+6DXXgI/e0Q/zvig+FG0pRRSdcepGr0vqgkCPAweHAs5sijr3EilflRRkqhUc
         lt1/cyg+fC6/mu+BKC0paWNuo9zxsfSa1z38BYDJGHd2PfL9mIMPgEvhkMHmDKZzr9/q
         e5qBpz1UmD1HjU2XkrP+EmaZYSche/TpH7WuTvNLLv3nB9W8tFLdFsMx5gm2bTg2ibyC
         stOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793211533; x=1793816333;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2UlnfjAbRNJJM1s06B3PfnT7wYrAZbMHSeL83sIth3Q=;
        b=owk30B6shdkMynYgSSlCddY4OOsjCfcUSLI1QQiAbrjGciTSVp5Q+7azoX5ZBsXhgQ
         ufdVJbDZyZBFnBf+jd3wt8R8eKy5fs9X1Ff6Opvyr5zI/l1dKL9holfIRzCYs9p4Atrx
         RVWIFa/O2cYMCZy1D8X6vAdvvm0IWV09uBW1u+5aF38N5zDa4QBZudYcz7CplG3Y6m5a
         ExJCyPXn7oQ3usIgt8QdS/GQ+ule2pysyZdzcbLLnnkOAWiUNzW0fjytV0zyrKGXCsxk
         sDZXXC4LyNY67EX/tdZAJKBIM5z4FPPKmwDEstgL6n+rbsXum7OiNfFKYgZgolt5PQzI
         /BPg==
X-Gm-Message-State: AFq9FYLgb1PR65whxB0Adv0CLQkoI87u4/+wiOrsnqAiq9KwDbAj/POG
	ate6DBnYJcCnyLD+3/melKi+6iBI0SeUf6zyQViqA4D+ghafruCIF0pb4JLbXk7xKHfYjcQ/ido
	uMQlQxnhzlqSsyXrUAMnjkeMtsjrU7ZmEa7CDnG+WxJLkmmakm4Ruwg8Ipyp+ftqeAGHD
X-Gm-Gg: AYBFou1iblP2hfkmZhXzgN3lPcGUdswlFsUIT/oNkjvqwBLMYHNOtR79XYIWGe5BnNw
	fkBkMZ0basDAOkVX6YzYeZdPulqGjPMpto2BWVczmq9AYnmN8Z83MP3tkgT3qufFCSZfsSlQNRc
	y+13RCImGPxLQs7suhXGzCPzm/pWJaCTrzLt5i7J7xE1oU97NXzbr3/7tUUs+mfVQgG4PADcWuU
	Vo7FP2C+54SrBqO6eXA5FI4dvPZCgtGfs4wdWDwzeVQcpZMwK6/AN7qjU8dUPXg2V0//GBXltBr
	sXdGpFUExDuTiBwFIahoBdQbbcnCCpNEai2OowNEopPj+SFj2cLADV84gOc44jQql833eYQ0d4Y
	ICIppMAlXrAIwy75TrZoZgF1Rc2fpi1N3JhsknvT8K+XDrll78LB/Trsxl/7lAYf8D68zzOY=
X-Received: by 2002:a05:701b:4247:20b0:163:8b44:902c with SMTP id a92af1059eb24-1a6cced1a1amr4594465c88.17.1793211532342;
        Wed, 28 Oct 2026 11:18:52 -0700 (PDT)
X-Received: by 2002:a05:701b:4247:20b0:163:8b44:902c with SMTP id a92af1059eb24-1a6cced1a1amr4594422c88.17.1793211531646;
        Wed, 28 Oct 2026 11:18:51 -0700 (PDT)
Received: from [10.206.103.99] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75f7fb28csm9112551c88.18.2026.10.28.11.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 11:18:50 -0700 (PDT)
Message-ID: <687c4153-4a78-4ac6-ba88-1f3f818a84e9@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 23:48:43 +0530
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
Subject: Re: [PATCH RFT 0/5] drm/msm: Attach a driver to GMU
To: Akisaira <akisaira@outlook.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20260513-gmu-sync-state-fix-v1-0-6e33e6aa9b4f@oss.qualcomm.com>
 <TY4PR01MB140065214AE2B04B2A7D9235BA66F2@TY4PR01MB14006.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <TY4PR01MB140065214AE2B04B2A7D9235BA66F2@TY4PR01MB14006.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3MiBTYWx0ZWRfX5JNQp2Zfh7xx
 lPKYpjyanwm7DQSRjhOSsZzEMdKTfHHqrnc6r6yI6BS1WxfJUlXoXYnKil/trt1GSWGNXTdBKmu
 cdrR6jJvyd3tO+y6fCKrj5532s+XI80=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae23c92 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=UqCG9HQmAAAA:8 a=ALlH8rN3-6IN5QnqSCAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: d9QBkD7RDWbpohnZcf975LQ6WbK6gKYp
X-Proofpoint-ORIG-GUID: d9QBkD7RDWbpohnZcf975LQ6WbK6gKYp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3MiBTYWx0ZWRfX5as9ckWG57D/
 zZtcm2YsHToKrC17+2uOnKl0EpbAqDtFYI24u57lRy7LgNhRRLDDC1SQ7IEwBBKYfgOFeJE437m
 XkEXTv4WpMATA1LWGW6UXard2b2c0yPEwNIr/1tB35nlhvx/4wDNdPu9fi5RiH2+G6ukyh7+Lbb
 Attfphlez5A4+/Dmsfr30dQ4yoEeR7RHQS8g371cKgzEQpLi08e9jVdAOltTL4hqhKe4rMxnjs8
 vSuBoph1HfEZsRK84dsiLLiw+Aa5pXuzkixqAWr1y4XrLhlHIYKHIiqhp3Q1w2zJ3fOfUpPvkOV
 r/Q4q5pJv45Pw8bLXOoxekTC+JaFL19EE44DkYLmLpit1A+0qnU4JbyvFFAHSquuMfRo+sOI4pW
 uRt22wGFTPZ/GnLOU/619wYbam/N61ui66iZ+27JrSfcyb24b/B/BDA17lVGHUuCAbf/eMxEIxS
 rxCNpHmLczJrBeb/4Gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280072



On 10/28/2026 11:23 PM, Akisaira wrote:
> On Wed, May 13, 2026 at 02:22:55AM +0530, Akhil P Oommen wrote:
>> With the introduction of sync_state in the genpd framework, any consumer
>> device of GCC and GPUCC which is not bound to a driver will result in
>> bootup warnings like below:
> 
> Tested on SC8280XP (Huawei MateBook E Go, gaokun3, Adreno 690) running
> Android, on top of v7.2.9. Patch 5 needed a small fixup there:
> a6xx_gpu_init() declares the GMU node with __free(device_node), so the
> explicit of_node_put(node) at the end goes away.
> 
> Without the series, GCC and GPUCC report
> 
>   gcc-sc8280xp 100000.clock-controller: sync_state() pending due to 3d6a000.gmu
>   gpu_cc-sc8280xp 3d90000.clock-controller: sync_state() pending due to 3d6a000.gmu
> 
> and six unused GDSCs (ufs_phy, ufs_card and the four
> hlos1_vote_mmnoc_mmu_tbu_* ones) stay on unless
> fw_devlink.sync_state=timeout is given.
> 
> With the series, 3d6a000.gmu binds to adreno_gmu, both sync_states
> complete without the timeout, and the six GDSCs are off. The GPU works
> (ANGLE on Turnip), GPU and GMU runtime suspend when idle, and a game
> session followed by five s2idle cycles gave no GPU or GMU errors.
> 
> Tested-by: Akisaira <akisaira@outlook.com> # sc8280xp-huawei-gaokun3

Thanks. I am testing the rev2 with some updates. Will post it soon.

-Akhil.
> 
> Thanks!

