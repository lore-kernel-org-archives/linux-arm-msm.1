Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E6C4A0EE7
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 08:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789718551; cv=none; b=Dv41KAntd8b/9RcbPf1ZNuvNeKR6JVdIyA7HErFBWEeTNMNPnjNxmi+A5JgyVYyFCCbxxFPcg/l7HI9AapCN2USJ9J64qb9Lo6bmZeJ/kzP3coQNmNFES8RrZVbip7TV3mbTq/ex7xEIqnvPkhyOEn4DEsvnpom6cyREENCJQvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789718551; c=relaxed/simple;
	bh=H0JBUe/EMO1jDRgyP3JDlGDtcpO2ZiZNH1bkYAtEw5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uTDpMDx8rl8bgKJE+KOy7/+7evA1IK7gyTeXOP8GNAMh6UDLjWD/BgjaQBGHtVxhHMoKgDZ9AWsY6bVxxvgJ4HdM4MsgkAA1CC7FjrozX+6W+fOnuu1WYy70E6XiMg0N7JAodHma8bywih3x6AKIJLG6S0HBzFgrWWifSUn+KSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EulsZUwO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q6+rbisc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EulsZUwO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q6+rbisc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I5xqlX204083
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 08:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yecFht45A3Z4564vTTjcaZ4Yfxl5AMB1C6lm2vKtsvI=; b=EulsZUwOr1HtmugT
	76JcKklLlxafRkkNiGxkvh1QFsZqImpSCTtX5RbOGBnwErhP2+/jaJylUWMQO1zV
	vw3+Qfz7sjeq5KewahfVEVw9X63m7sZSwHE8ULsI9AuQEPigcwut6kEseF3mJops
	4pBYeVIfyr+3Ucw7klbyFp4yQNDI6Kh75M+rXxP33x96nQFebyH5Eqj9XQGFM5pO
	Kwi2bJz4WiMwgRYAOQtniAFUlQ4bUVZ5ozjTThagXEH51uGmdpsD3rJuR9yEhZHh
	eVoTmUACezDeOuIt5UC+GI8A3mXlJZgP2KQL9wfKlXhb++gmMb3zhGJz2AlH6SgW
	N4Sygg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grxp2rp9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 08:02:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53002215979so1239861cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 01:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789718548; x=1790323348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yecFht45A3Z4564vTTjcaZ4Yfxl5AMB1C6lm2vKtsvI=;
        b=Q6+rbiscp9z9VLTZ6/uHLpINecuFm4VQ4P3suDYIF2EUHc9bJsWbMVDqQeS/4uS0aG
         Ei/fQSlytOJhxizp5NZZrvRaY9IzeCrvwJI4rv7Udpy2J5KvOSix/YCS0fwtenczcOMi
         eYK+haC9ea+tjAhq1mw8emKjm4eZ6AdzMgUlp2tV0LzDAEPm0nkjy5ctyrtEj+upylUD
         bmcV2mYwRPvZcxG+93MuJ48ld3htQiBCTbRndDoPsaHe+rjKUcUpPRCjvBuu9uwFJALF
         1V0oG390BhWOxK8uqVKfqdwvK5nh6AYb5vnPsoPRctJFS4Xk/IKBFPGFQbDPZJH2Q+Tu
         FjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789718548; x=1790323348;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yecFht45A3Z4564vTTjcaZ4Yfxl5AMB1C6lm2vKtsvI=;
        b=xb8aoul+456cBUjVnYryDt1sSLuyFMUL7jSke4FG0Q7lejW2lnwcF22h2FYV7PwKzU
         KrD3ncogZwG5a8XYe/7U/ZVDmVLH7vLlhDQsS7mfyv6PCmN/uUj1qNTvRVTeHTOoXcdH
         LQ+oB67ST0Bd9cPQP+htHCd0Yf34kW0ecqdKgjUG15gD74LEu3liO3NQdapFfgW0r62i
         Oz9dSnPg832155BghubqBKaGxxRU1x/8Qga0jhou6j3BRh2ddCi28wO5+PY3yYAi2qwA
         W0h8ROC6v/E/RliWjUPjWgm7uhFuxHP55aRIzWBwtLp7sxB9G0SLxbrFVF4rkt3tQy7I
         H0Qw==
X-Forwarded-Encrypted: i=1; AKwUvBznqZgIg2MqSMQ+AzdW8SZ7zutprCYgP6+NiQLMEVh/wF326KJv4RqQEcN6PWCQ6Y772lWrxLoaQ9Y+8rOp@vger.kernel.org
X-Gm-Message-State: AFuF++kdYKGKMNlgKv5U0f8AP2Ezx/2qqwFspRyF8GRLdZ5xax7Wimyy
	4Uk8c3yxe7Wprvewfm+PdAnwkTgJD467pobIzZJnLJhDBwC67psGTdDMsC5cE0+kSEqkDCN1D7u
	Jb19GeQ3SJGXuaGdY4BIB9PJDzY9mq8i/nEoEWQQPQ+gggMQdXplTc3LjCd6gYwT2ImYM2l5nnH
	te
X-Gm-Gg: AYBFou0mGVlB9I8qM8fAQRi1QDhzZdMPO2V25wTn/nt4iqeFMwf6AGkjXwele8LKh5W
	QonEjvNZZg/vGqMn6nAyTNkvlxudONrYx3RjGrupJCYVLCyUmnw6BjTgof12vjEvH7ED9ZA+VEk
	V13WVMQBUWU5SSdtW9s8GqQL4OctjqkqfzQZYdKc4OSrffgTHtXLuVP7w5g1g5ySVaip0RzygfV
	5BYXLPPX5/xuqPgA+E2yDjrbefB2f1I5mwNW4+qu2nga8JoMNHTbOu/Y4DlExRZlUw1k1AuF9QC
	Uih7Wj1hQq/yLGeD1hRoxtpvgJMu2jPKFAk6ryNaEjfQsb+G8JHe9FTwcsnnWD++EvT9XU2jlFf
	XEuobwjHEY5UqXr6JWmNNrA==
X-Received: by 2002:a05:6214:e8d:b0:912:16fd:b389 with SMTP id 6a1803df08f44-912570aade9mr19737446d6.5.1789718548084;
        Fri, 18 Sep 2026 01:02:28 -0700 (PDT)
X-Received: by 2002:a05:6214:e8d:b0:912:16fd:b389 with SMTP id 6a1803df08f44-912570aade9mr19736916d6.5.1789718547676;
        Fri, 18 Sep 2026 01:02:27 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa5975d070sm505624a12.23.2026.09.18.01.02.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 01:02:26 -0700 (PDT)
Message-ID: <be0e4cf6-f16e-4dbb-a5e4-85760c20f37d@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 10:02:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] power: supply: qcom_smbx: Remove const from desc
 allocation type
To: Kees Cook <kees@kernel.org>, Casey Connolly <casey.connolly@linaro.org>
Cc: Kees Cook <kees+treewide@kernel.org>, Sebastian Reichel <sre@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20260917211309.i.765-kees@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917211309.i.765-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEwOSBTYWx0ZWRfXxwkQNiaP8W5B
 tSRZhU8kZPqYic3tF6rjuGKDu0jXsTQprvLNh5+N+8GHaO+nnvXVN410rzM+Zm6oF6kJOrR3QDf
 NEKR8it+oROM55qQyA4Px+e2ehklJGU=
X-Proofpoint-GUID: Sat_Uh2xX9j5xzvBpkhwSvI6DAbpdklE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEwOSBTYWx0ZWRfXx/k+NTnsrYoE
 U2Cpfft2t4Sjk3DYdMzXnrIOWk8p/Lo8k1Lt1P6a2iTW5pVFr2DqWTrgcqWQzvMWfgCq6IYsoo9
 vtTIm9bUbmPPoPhRcKYuNDhezy6N95PGYndnfVSUKuBQ5bYCCV6ArvI4nV/71YnMP+OtexZBC4e
 pjjHunH3CKwF4vAG5AIBl+ZehNkrVIS1XSkPE4TGz4yLgdsh4QGWDdVtfWuYcrNlH4HXbaTfRkC
 stkd352K5fNHMTJGHu478ZCBH/vjV9ia4KDJxpuww5TlcBRhg65Ngnz1IfPCN5Its/yb9izuMEf
 zUCPyJCFs4fEtKEfOTf5vXXcX1KxRdzpL9abOlnqeZgA/XGZTJM5nzwB1PdBDAjXE4CAG2xxPU0
 mfyM/wcBDkRH3kLGLswBPuAYObxwnAoa0kIMW1UVgm/NVkefwKdzZp295tIm2tz8BdSRLlmNMaY
 HzA7iRWsk9Uz0H2Tk8g==
X-Proofpoint-ORIG-GUID: Sat_Uh2xX9j5xzvBpkhwSvI6DAbpdklE
X-Authority-Analysis: v=2.4 cv=cNF1IVeN c=1 sm=1 tr=0 ts=6aacf014 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SE4sDywN97dQNR5h7vgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180109

On 9/17/26 11:13 PM, Kees Cook wrote:
> From: Kees Cook <kees+treewide@kernel.org>
> 
> In preparation for making the devm_kmalloc family of allocators type
> aware, we need to make sure that the returned type from the allocation
> matches the type of the variable being assigned. (Before, the allocator
> would always return "void *", which can be implicitly cast to any
> pointer type.)
> 
> The assigned type is "struct power_supply_desc *", but the converted
> allocation type would be "const struct power_supply_desc *", as the size
> was taken from "smb_psy_desc", which is a
> "static const struct power_supply_desc". As there is no general way to
> remove const qualifiers, take the size from the assignment target
> instead. No change in allocation size results.
> 
> Build tested ARCH=x86_64 allmodconfig with GCC 16.2.0:
> drivers/power/supply/qcom_smbx.o
> 
> Assisted-by: LLM coccinelle
> Signed-off-by: Kees Cook <kees+treewide@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
