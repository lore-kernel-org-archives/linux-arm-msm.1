Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893063E49F7
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 10:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785926845; cv=none; b=IOv7Xj5lLdwaO40YUgWsQT6J8m6nkXEVnNvf2jb5z6CxIjzyaneKmTv1J0uYWj5sgEvPp5nyYWLGIfHqGXwAqpQWWT1MBwG9JFVBLc/0KkUqk9n3M0O/iaPThW0RC/lnoAtpTmZTOfvVIWZqcg6MqajXuD7CC4PKwBx6heAgAss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785926845; c=relaxed/simple;
	bh=uRNyXz3UWPZ9rXTyVqBEU1sjGXfpOGxULryAgGmxECI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LozrUcxapQX1sa7wtBXebG1N02C19ooghZDJO2zTsUn+ANyV+eSyySaYWTtDeHbsEcqXFTeBktHLKdBkR1K9v1DRIHftGD0cSOm0v5z5ELMqLT9OQk4J9zB0BBETrz/uNmTnxfcAtunxjKiqc279kGFtDgkp4T6F5OjryUfKBQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VA3BqxKi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VA2lRW41; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VA3BqxKi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VA2lRW41"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dHMu2128972
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Aug 2026 10:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o5aTDHPkSlm/IBdTwZ9yGUMNn9+nrr9o1NxOD+9vbWA=; b=VA3BqxKikmKPasp2
	M/t/8sEydH8FRLPuZfTdlERMXbnGkIyQgO5tAAMvO/7j6MEB5qFe0qBnk0RLQnLY
	t5FTDQImxizHGEThgVRSz3LqHX+VfO8+jObsMS7QqUJ999QGqzIacQ+f36NtRw3S
	ePRPznDmvL1r1YJNQZzpgtdDQwhHr0t+WVgcAA4sdwil4d1HKjvx00HXp4d6DtLC
	IUyIx4XzbEu30oUz5YqsrTRfBWEg3vJsJEoEg3a0CJGZeEKwmjtL6TOeBjAhlJus
	vXaDS2t723JqzM2ToUY7aevTUR3kmpWqOrHX2bu9cXUG0mVg7DukUGrfxYsnoVm/
	6wzfIw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv1qg8jt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 10:47:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so1358121a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 03:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785926843; x=1786531643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o5aTDHPkSlm/IBdTwZ9yGUMNn9+nrr9o1NxOD+9vbWA=;
        b=VA2lRW41MAnK4tmp+G0FxJZbw5tSgPd/WLv+Js7sOfoTiMFcFUcMPZFuyYCjK9WCUu
         XoC6NycDtnD0a5s9kpiSI9iPwqofSNcY9vMnCH6TLgG31ILczitjNhPldetZyRLEWrBT
         Yhp1o6thCawAdWQWxpU/JecI5IFACwkLu1zcadOKYdQvlS1cAEP2yc6BkTvX0tEjxDIi
         TdF464aMW6ae4WqajvfvslINn06Pbp4bQt9vIGY1ZFXlDS7/9WRiuSlb1O5btvFAzzyA
         LhINbuio5L1LmkiVtLkZCM8Gj9wcqMCYUsZW5Beq+8q3fwm4wY3ucmydg87ra0wlCSVL
         SW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785926843; x=1786531643;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o5aTDHPkSlm/IBdTwZ9yGUMNn9+nrr9o1NxOD+9vbWA=;
        b=ca/YRYA/KH8wCO7M5JXXxnT2EIaIZK+apX4Q/T7cJa6IIAkvC7Psye7U7Rm5OaDb7m
         5XKn0M/pvmv5esoqLrP5YDaiDRXtMnMnGza+kTpVU5QVY6JIgs7P9zh8oVVfh2u5ZXEb
         sLXre9HHpjX/bOO90ofbwii4sDZNIikkQYuzRjvKaQXcD+8EVChAhoNFixvpm7qo2Kw1
         Wui4fIQNjGcdFP9PhbAIvf7SYPuUf5xB/lcidnM8IJahpLTqF0FHkWChKSIBO1ZnVMlr
         yCBsnUas1vM6dEWlPR+ddJcJBMfDi2Dei7FYRHYH/kTAgfptvayHPozb60WGVBFm/uSW
         GXPw==
X-Gm-Message-State: AOJu0YwvdKsrDy4oHk6MawhJ6q9adlzQHdbqAqTGIFEUqjD14Rr2PXfq
	jZJixX7CweG643e/0W7yUG06L4TKCoPyDkGTxDHkipOwTtUpwPX86w4pDcfJhs3MkiPq06u0beM
	6bQCLUwpwJZYYiVZ9E0JELNYfvbGwh7nk7ruleVcfQoaL8BeRlfMMtHzpohDhx1p/E5lu
X-Gm-Gg: AR+sD11sEYqnqQhRKwfDEZM/Yqz8sskHaHaStu+b32FqYjvDc2yPvHys4VEsxcUEqNe
	VZrxFGotIC84JpcSd6G/GQdWnMH8sUcLtrH8O7ZYf+ifIeD4egJWOTSjpT55/cmXUXc5BjvquGi
	1euZu9jDkdKCn3kyDU7dTK1eFe4eNOKxt3U4M5zF7i18Yct2ZMAfWa9uEuTUFZu+RATDvcdM/jU
	5cODv+oNTtbi0c9ivsg9rSMLnbYFqV1bNfAGmClu2i8wx5JJYs4lP3UcO5xKV8MEkyab/dumPZz
	+CA9GxOqpJ2RBf8uMISUBNYue4jp12tpXFei/rW1cj5NSA6pO76yBbA89bAQ1xaBsWwVUM651r4
	u7w4SdtOklKLlxvrVMHkhC+u3mw2iRKob
X-Received: by 2002:a05:6a20:734c:b0:3b4:8ba9:4d8e with SMTP id adf61e73a8af0-3cb85e6c92emr6221567637.23.1785926843123;
        Wed, 05 Aug 2026 03:47:23 -0700 (PDT)
X-Received: by 2002:a05:6a20:734c:b0:3b4:8ba9:4d8e with SMTP id adf61e73a8af0-3cb85e6c92emr6221525637.23.1785926842707;
        Wed, 05 Aug 2026 03:47:22 -0700 (PDT)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe708bfae6sm1270919a12.20.2026.08.05.03.47.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 03:47:22 -0700 (PDT)
Message-ID: <6166c963-e9e7-4442-ad84-976d389b4663@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 16:17:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: gpucc-glymur: Mark the GPU CX GDSC as
 votable
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
References: <20260801-kaanapali-gpu-voteable-v1-0-fe804d24d2e9@oss.qualcomm.com>
 <20260801-kaanapali-gpu-voteable-v1-1-fe804d24d2e9@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260801-kaanapali-gpu-voteable-v1-1-fe804d24d2e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I+hVgtgg c=1 sm=1 tr=0 ts=6a7314bb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=GvobxVZ8zsqbnvUxSbkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: Y5szCctuXdswVeg5M1cPHSC7jekpILPN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA4NiBTYWx0ZWRfXw31JQpur3sOX
 KPV0UAztlbV4WYP2k0ln+TRDd2jXDbmI/x9FmKACsPNd9mA1CpeU4eagKgG7dgt/TAbCg1Qoalv
 eSwxzwC6+QVm+xjQGlkui6zbtx6FJ3tAQvC4UvgCLCSWsW1MkTUnIjbtxwJ5H3yFm4kgaFsbfDh
 W+gvCvc0fiYdCt/MS4CYkCQ3zaz+nELLQ2OciT+gFcCE7qb883mnDsPdm14FnblRWhU7S7yP2SE
 Vsnn3zduuTgCPQ0sYbCyKi/5RKcdYhhhIBtLCVE5HVnFrc3/AowqWx681W4tNAYDKXSqESg8aQw
 lKIaSiLPP/cILKQ69hJRmvB2PUjywMRbNJ0vSEpS52d0JanWab+oCfkCI8daYK9p8jpGrIAXLLq
 ftL7HLq+eVlDUdTPcuODb50+KkZ97p0Dj3iSDhuKKH0uX5WRd0p9tU5vK/J2XC0sO9kNBnMhJdO
 gpv78Jo6YqLc7JviegA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA4NiBTYWx0ZWRfXxTyhFmcXfDuS
 qvNF02+1IN/mQsjkuTDNp36pa4GoEGOiTRJfaHTkf55TLQQxGbs1Eui6vGKAZ+bQc23t8MYU0mb
 uOn9zNjSatV6JGxBws4jM2W7elWqbcI=
X-Proofpoint-GUID: Y5szCctuXdswVeg5M1cPHSC7jekpILPN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050086



On 8/1/2026 11:01 PM, Taniya Das wrote:
> The GPU CX GDSC on Glymur is a votable power domain and hence should
> not be polled for power-off status during GDSC disable. Also, its
> power-on status should be read from the GDS hardware control register.
> 
> Accommodate this by removing POLL_CFG_GDSCR and adding the VOTABLE
> flag for the GPU CX GDSC, similar to other platforms (e.g. SM8750 and
> Milos).
> 

Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Thanks,
Jagadeesh

