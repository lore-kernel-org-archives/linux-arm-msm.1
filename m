Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54CE2989B5
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 16:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871359; cv=none; b=pXji3HAXK0IpRLp9XIIz+NUfVZWihQJqClfTw9/WOWNrsKf4wjvDItbB+0TZO3FlUhDBTX1jYH9OsR+EFTuvbGK5IWaqm9BBBs03EpC3pzr9tZRrAqRbWcJczo3FqZL4zZ3PBRxhfk91upmElelo8HKGFWHZE2WdnWGCqHcYicU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871359; c=relaxed/simple;
	bh=uqVWGQCfo6Yf0kkabKm2EtxgVf2o8pjULxFa3NT5B+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=esGTL34f+gmlM026sx/thX3fzyLRwXJGdmkugCEypYcN5zdatZD+kQRuX9FvAOZ9BckZ1ZrM03D7qyusHkgD0Hh5TJHPXZVOmswH6zpCKvh/3i610dTsHuGEsxiaPLP5lq4pburioPd1tlzbCzLx0XhSwFdrrgsqxo4h3/JFk+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pT4KVaBJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LX5tpIkQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pT4KVaBJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LX5tpIkQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691FsaHi2886354
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 16:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ekpOIEshdfoL/KvLAu8ZlpZV9Rt5VrpqptUJ/oZGIKU=; b=pT4KVaBJ8HaBb2az
	SGM8bpJj3fGjPC+RoGJO9ZV1KyrZoG96lYe0ZxMgP+xAsEFmCbb8nHy94TJOxOSl
	edFLmE+EGHYDKpVs3oCk2yxb/+wCeVEmwnjQGwH6acC7fCSWPkpzYYOItXex0WQL
	ALoc97O0suq1+eDC8831z7TT34nX9oX/6Zw5HkLf3+A9KdXsrcwT18SfYkT2r90x
	4c2u0a4EoSgfH7AnG2THlYM8T8/12ZGLm6gHuSXhKpJlSF74JfAVtEwxk7vpT6Fi
	H3izDBOdHX814bNZa14kDyd8LQZ3T+PlmmFTPlH/IXDhzZqDw1zxQ9iqSUOYJCCZ
	UWA9zw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1sdcghxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 16:15:56 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c9e0f047a6so166668e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 09:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790871356; x=1791476156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ekpOIEshdfoL/KvLAu8ZlpZV9Rt5VrpqptUJ/oZGIKU=;
        b=LX5tpIkQ0YvoGxlnQubxOsMc/9J7GfuT+UUvq8+5NedQHZNROEcRwgnXVLWPOfCPP7
         Kk1wE92LDtQNI079lNOU7gIE4cqoS5f0586dv9TeSs15pkpwCO+J7BnL5wAQISphelAv
         PBOUbe37uHgY136jw4twpdLFKsvreNtaJR/uF3aUAJtWU/v8O1XCd2eY3o/wlvxkQqCn
         vUkJg7hh4jClcbzub9Y6xMdDGf0LsC80JNvcl4qOExILDFlJUKjOaHWWKVusIaV5Af1g
         NiMxOPSHf0TjNYlBELpxJ07M+eZeIp0YBhG5saNTBq2dXfWJCmM3p8QxoshzkFRbsKn2
         gw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790871356; x=1791476156;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekpOIEshdfoL/KvLAu8ZlpZV9Rt5VrpqptUJ/oZGIKU=;
        b=BQoye/azlDa730dHe0TXXqdIxd2khY9hmuk9SRBIM02KjwSod+qILmvLsz5B72uDq8
         iJq1C1Uv/Gcg4deLxSoaUZIeyyWTiZCsnps8n21P0tE1Dp0sxZsRrgYFx52C5mSTh23a
         2VSytPUkmvJXILg4cCiPBiRQT+h5yDJVqKlyTL0iQiDM0YPGryd9iX8vsWQ3bWvkShU5
         60h6/e2FOre9AbwHMOiwsoGSuaOTRGTrk5Mz8TomuwlhyaB5xt/n4d5ih5z4wjaGxRiL
         XUBpXfcdceceAzjnJ/+btp3+TtdHhdCNsdpTJpLVfUafyXeWdGxtaNnwDJrw6lG/9YyH
         ZUbg==
X-Forwarded-Encrypted: i=1; AKwUvBwDuegRSUuf1eGbpHrwz8xHD28AMJtPQH++rkozPNdgOi+Fds/9Il8K3EI04elqoMgQuAmv44INQCy4gASc@vger.kernel.org
X-Gm-Message-State: AFq9FYIXbhAp+GM3JCImTCO/X5mMZ/e81dZ6gpDJy+bI0Bt4D6ULHjFc
	xgIrYuv0AlSWd8Dcn1HwzOovlA/AxbFbgVWQRu0YHS+XIrw2LToR0O+WRVIvxKIre6+sI5Xx38u
	tHn77QZJ0REPr1RrN9h4e/m+1+nxN9qQ4kf87SNBRPXCxsj5PfLAiPbdp/aJqeqHzBipt
X-Gm-Gg: AYBFou2/GgSwLXE+5f5IEF1z1BZaUcHpLcgrBAjyIAHr5q2A2afGe+AIoZDBPYhYpqf
	fPtDBeL8DzGE1p8PiLJGy/1X0Q7VEUDo2SURFksfUIh9z6HyX5lbwaTrZ0GHXP7uPHgOthLN8so
	W/emMfqYeKCSgpZkMj6AhjBz//GBDApyzYO3FK+YU8JOPC1eIj0RjAenwKndn37E669ZDs3s7cf
	HCNcQ02FfMXL/J+Z2bvgJqm9gbrtmTRX0DXActwuXhenccbfjdvw3elnhl9j3/HeQzlPBJk59aS
	ESTIGGh6dcoD2uc09KiWAruuWcomg3MEqb62sH0914U6woKGPKnUBnXOZNDEcUJG4HM1SJHi8fg
	Gahamms7cnucaYqsumEtYdA==
X-Received: by 2002:a05:6102:5ccb:b0:7b4:d43b:43d2 with SMTP id ada2fe7eead31-7be729aee46mr1101002137.3.1790871356122;
        Thu, 01 Oct 2026 09:15:56 -0700 (PDT)
X-Received: by 2002:a05:6102:5ccb:b0:7b4:d43b:43d2 with SMTP id ada2fe7eead31-7be729aee46mr1100978137.3.1790871355621;
        Thu, 01 Oct 2026 09:15:55 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d80d5csm183510866b.51.2026.10.01.09.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 09:15:54 -0700 (PDT)
Message-ID: <66d48e1f-7bab-42f3-84db-ce794f2a2a89@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 18:15:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-ipq5018: mark 'gpll0_main' clock as
 critical
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Stanislaw Pal <kuncy7@gmail.com>, Mieczyslaw Nalewaj <namiltd@yahoo.com>,
        Jie Luo <jie.luo@oss.qualcomm.com>, Georg Seema <georgseema@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260918-ipq5018-mark-gpll0_main-critical-v1-1-fbe8f27a0106@gmail.com>
 <e16cf23c-82aa-465b-81b2-6240f4a0f4d9@oss.qualcomm.com>
 <f2ccd6b6-e5a2-4d36-a12c-124638c31280@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f2ccd6b6-e5a2-4d36-a12c-124638c31280@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xoK8-KCClcYiDU5L5eZfpl2bE9fCrfiY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2NCBTYWx0ZWRfXxlaz0h0Y7lMU
 rtPAeKNVMWwlLfz/zBlbNyt5Vz1UkBMo29wXONxNrFJhK53mnaSTM3wzRWVsVfDKclvslfkUKx7
 P5OSq0agi3nZLjBHVOhblTncRfN2RhU=
X-Proofpoint-GUID: xoK8-KCClcYiDU5L5eZfpl2bE9fCrfiY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2NCBTYWx0ZWRfX4i+9YOqhAZr4
 qXInueu/0GVgfsetOJbwpuPqrhtb/p5D2v9/1iPcyNzxdt4ZpzWKDk9ZHZdoJa0rVr+B8YLGVns
 tzTrVomz/pu+TjgcXcNg3upwWyr81O/pXZVEiZGJmBCNGhyvG9Drr5qG2zsc+VoMhbDZZKoaVAr
 eWHrwwaglTJ4S6MjvIycTVGy7lxRT6K+ehIC32ZRi/P2GtBUsGwxrCp5qssoawizRG1leMY4EJC
 1ODyDkbg2Yj5rrWFIrVN2SLAAm/IwM7bmtOyG5vW3MRvTII6YgmfDVBbZk/BoUkUFHCHYWgQ0kB
 gw5a4Ito7mrDGTzx4L3a1UzUAMcTK1eVd+ygrhoXx1ih1T+FW0ObrzgEl1eFCCAtjoNYbDrrIvC
 FtuDhEOkQK5UOsqFLawPu9onYhLpfYemgT0zRn5oLnq0eL0DXGaaANOuC8V057nXHscV3v3bjvE
 MGam5o11PwhqyzkytYg==
X-Authority-Analysis: v=2.4 cv=D87SufRj c=1 sm=1 tr=0 ts=6abe873c cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=qLDurSU9-_G6tQfgrAEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010064

On 9/24/26 1:33 PM, Gabor Juhos wrote:
> Hi Konrad,
> 
> 2026. 09. 23. 15:32 keltezéssel, Konrad Dybcio írta:
>> On 9/18/26 11:27 AM, Gabor Juhos wrote:
>>> On IPQ5018, the APCS core clock feeds the CPUs. It can use
>>> different clocks as its parent, but during system boot it
>>> utilizes GPLL0.

[...]

>> At a glance, we have the CPUs consuming
>> &apcs_glb APCS_ALIAS0_CORE_CLK
>>
>> which takes XO/GPLL0/A53PLL as parents.
>>
>> GPLL0 is a child of GPLL0_MAIN, so this should never be gated in
>> practice. devlink and probe deferrals should make sure you always
>> get a valid clock handle for the cpufreq driver..
> 
> Yes, the cpufreq driver gets a valid clock handle. However the hang happens
> early, when the 'apcs_alias0_core' clock is not registered yet. So CCF does not
> know that the clock (hence the CPU) is a consumer of GPLL0.

So is that the late_initcall kicking in early, disabling unused
clocks, or is there some other logic that ends up disabling the
GPLL?

Konrad
