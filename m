Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3B53DDAE6
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789027825; cv=none; b=T0xJ0azBTAD7uHNX8ptttLjHRMBxVMEFEC+Xxd57UVd/yFLPC1ISw32HLfV+I6bKU8zhxOvTyfgN2b0QZRXK/ywVkyqDi3n/93Euc0/FG+6pwLiM5LjB22oDYG6DQ0m7T4PDfqADqiYxTinFjMdHcoUzBOg7cdU0N7caSw10jGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789027825; c=relaxed/simple;
	bh=rW7h0pjx3xQ6ZwumnFP1L2VwCmAWNOwsMjrV4wnRwr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PFntjRdH1ePh7HN2im8PWt6daqHByJsa+zyZeH1X2SB4spDMmz2YkZ6J2Puj1L3gwJTiodH+fkEmeH1jZ6EaLj8ydAsTI0S5mV+vw3fEsm6hiAH8G+Z7hWRansxiBI/eFhm3Gcf1GCqLzn3n/qXWPA2wA7tcCeG1BNx4ueW9xR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W/VXvI5k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZgKe8cq8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W/VXvI5k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZgKe8cq8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5Gs3n810342
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ieSl0yvDlmicXq4UcAFfQwP5Clzxto1Dk2QFC58iXA=; b=W/VXvI5kK2vFS272
	V8si69bAyTI5Btzl+GR3EHvAb2pdZfN6HqiojOJg8AmT/BeCQQwKJbL4ThpQFyx+
	JFEIo2h7iVA1xssnqvcW8c2LrGes08Lum/naSsTvT9AUp84JThpzwSC8TWQOUr3U
	1tHI5rECSoNsGFRXvCTGMqmurJqAn9ncuqHTpDBg8Q6qBQ5LU//aIXRKzY7Wahbr
	e5QvEPrZtDqgyzIrEhSDnYQYhkHWa+NQFjH2GECOFDvdvryiU9/ybFX5qkKX8cY+
	gzar47VwbZ0qTtK7ML1UhU8ibgRoPBUABpu5Sj65CU2aMYsOyDXL5xUUaQo0b0tB
	oZcBrg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydjssj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:10:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db0a41434bso125964395ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 01:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789027823; x=1789632623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ieSl0yvDlmicXq4UcAFfQwP5Clzxto1Dk2QFC58iXA=;
        b=ZgKe8cq8WT9U/Culz/3FWdWbTP9rn8L93EtIY8+uh9fTlIwM1ltoB17VJGGOHK8bm+
         0FoUWmDBba0+Ao/4Pq3rDgMkCUpJJbGGPMiwHpILjts8rsFGASTwgNf+ckcn3ucz+IhD
         UkktzNGFH8OTr/45c9LwLcfgiHvnOgIkwK42pSxRnxy8weBHY1jypUJbWB+6uZkDCizg
         nQQRCRpnthN7907Kq8/AJT76ZLxFpGubcx9QIn+j4ZZbzE1UQdeHRlb9I9WoWW/m+DDd
         zclTz2e32QC11TqleHwPThhmTgqrhi8V+qJc6WsoXME1vfDfBEd8fa3/Na0iVjLVQ7Jj
         1ADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789027823; x=1789632623;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ieSl0yvDlmicXq4UcAFfQwP5Clzxto1Dk2QFC58iXA=;
        b=pW8meZ7n//LFCyfUK5h+dor68Mgwhtbql6e5DjhWidUL7hhVOD6EvpqcaT/qr+JNDg
         jeSIFtlWweHBSmRJIjGBiC+TnzPmdONwlj/O/ONRvcoRrpqv/gJyqiJ3MRkWmwknExnF
         7TZHf182ejsDfPVRoL/6kB/saaxO5qhy8Iay41qs111+Yhwe1cHDTZ6fDs8p2Vprnb7x
         +OaRn4v/O7L/nhbt/dP2NjxGdILkDcwhyuKUNtqixSGKr2/Vl3lgXz0Xbzld292YVMM5
         bW4Aga9NrbmMXyEZEGMLAaJ8/t9csAERBUIQ0MFggFfrNNxJ/Emc3Bn8elhO5MFZZ/0E
         HmGA==
X-Forwarded-Encrypted: i=1; AKwUvBwh8HGsvRA+TNWEQhZdFwGf6BzsB1ZRrqMG1MgXLMpk909x67eUFg5MYxOR8NT/rqGyfJ/iUqr6P3e/gdcK@vger.kernel.org
X-Gm-Message-State: AFuF++mevUekoWK/4TMz85NNT2UUY8BXdskKrPXBUF6jpXpOZ50lXBu0
	LIh2dAWEh8DCuaV1eFjkZHAkN4clfUbaNwPEGtFaEZAKJa7vg40qwrM3jmhjd4LFFTgWzVuwFIM
	/VbuSP8yWJYF4By5uiG0w163X3ur7zmCs7KWUNoL9IP998pgWsehqCltdXBbFEyUKHC9y
X-Gm-Gg: AYBFou3GPi1Fb9fr1l4aU8uyqzyY6A6t1sdIDFOMt7jwbsxS1k4zyPJZkF2Fq0EfDan
	lbhhghav61pd0ncA2HSn1nHiHDaDdRTkId43m0ENs6tiFeXEPPw/6UeWtM63A0emtLxpLvmfEPp
	wELuZ3kksuuEbEwvhF54HaP7WmTcZXP+tcvF4RmaqejPC2vfi1QQRpsZKNbfpMhig9bauIwk1zT
	K1/r/hhlMk/W2b4sPQSX+jyLK5tg95j8jTld3AkzJLOjj+/snW1ibUqfMsHqFgeR461NL5tN9+z
	vOjUFETsW/52x4qVoWG3IoOwceUhrV5EIYXbnESm1vwYUHk3aVg5jLfiytMHdKbHUgjZDNtFrMk
	rvOfnmNJvVCzClwk+AIwldurN0Ks=
X-Received: by 2002:a17:90b:3fc3:b0:39a:e002:f192 with SMTP id 98e67ed59e1d1-39d70b57638mr8669796a91.22.1789027822772;
        Thu, 10 Sep 2026 01:10:22 -0700 (PDT)
X-Received: by 2002:a17:90b:3fc3:b0:39a:e002:f192 with SMTP id 98e67ed59e1d1-39d70b57638mr8669709a91.22.1789027822306;
        Thu, 10 Sep 2026 01:10:22 -0700 (PDT)
Received: from [10.217.217.79] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33b95282a73sm2145880eec.31.2026.09.10.01.10.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 01:10:21 -0700 (PDT)
Message-ID: <3dbb0310-c2d3-4b81-9197-8c275242eb47@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 13:40:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] clk: qcom: clk-alpha-pll: support a 28-bit ALPHA_VAL
 width
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
 <20260907-nords_dprx-v1-1-d472af3f01b1@oss.qualcomm.com>
 <aqEbvx0Q8X33XE-O@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <aqEbvx0Q8X33XE-O@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4OCBTYWx0ZWRfXxmgCqb8eQA60
 JwWnuxYYR2uDs81Tk16NgP0Hb0NThIqK2bL4AcC4Gav5gzBZx5M5uFqhm7Q7oan0OB4w0RvyswC
 Pnjq//7c+HYYwqL9+ff4h1wN3f49Y0Q=
X-Authority-Analysis: v=2.4 cv=UJNIjyfy c=1 sm=1 tr=0 ts=6aa265ef cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=p7gtr9YVPtY6mnSyxn4A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: _LEAnpagYVscQGdd_nPV6K6JAa09Yl_e
X-Proofpoint-ORIG-GUID: _LEAnpagYVscQGdd_nPV6K6JAa09Yl_e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4OCBTYWx0ZWRfX4own/Me04mKg
 lNq4HXDxb5rfGJYRCkeU9a6i3ZiNBxDNFmUY0knycLPe/bN2Z6f6Sm6yPOyAL7iK7V374nT5FMF
 JJ6Qx87N35idcNrctAL0cwLRxSKXH364CMtLtNDr8RhSkg/V8QADe8aY1HIEmz53SFGDsYakPpa
 +hPx7PaamFACQJab4Kl9Xg0mZfnKjQfzaBaGlxzUchw2IC1q0Xg4DFvP+pqvNq4jv4sOZzp7I0d
 leK089e8QCOwzeq/niEX1uC5jE4+lQfVpLqZc5n94Qim41K4DhprDmWDAxWcu974vLScVaEXT0L
 d55QuHmSPkr9q5yVZ2FweR1o9TvyuypQg6YkrKj8M0l+huSImtbF5WysrGwK9zkAUq5Ve5b/FQJ
 G99FnbNHkzabWCqgTs2eH5+P9ogHX9NopLXuY+9cENo7UPC8bOstSp4DtYhiaAycT8phdqZCpCQ
 CVpQ5c7Qj/Uz1R57eLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100088



On 9/9/2026 2:11 PM, Shawn Guo wrote:
>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
>> index 60173b076cc5f16bb55343a1d1136eb07f3c050f..981f973da02f379832fdc0cded3f2b4cae5879e4 100644
>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>> @@ -382,8 +382,9 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
>>  #define ZONDA_PLL_FREQ_LOCK_DET	BIT(29)
>>  
>>  #define pll_alpha_width(p)					\
>> -		((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
>> -				 ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WIDTH)
>> +		((p)->alpha_width ? (p)->alpha_width :		\
>> +		 ((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
>> +				 ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WIDTH))
> The inner ternary kept its original indentation, so the two continuation
> lines are now misaligned relative to the new outer ternary. Worth
> re-wrapping.
> 

I will re-wrap.

>>  
>>  #define pll_has_64bit_config(p)	((PLL_CONFIG_CTL_U(p) - PLL_CONFIG_CTL(p)) == 4)
>>  
>> @@ -2290,7 +2291,7 @@ static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>>  	if (ret < 0)
>>  		return ret;
>>  
>> -	if (a & PLL_ALPHA_MSB)
> PLL_ALPHA_MSB becomes dead code then.
> 
Yes, I can remove the macro.


-- 
Thanks,
Taniya Das

