Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20A53DAAA3
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887429; cv=none; b=OP0V3nSqo7Fctcx9izBaZ7Cf5Ct+FQEjKE/x9g3jctgQur93AJR0jO/6ZF9fVGVSO+IyWn17jQniRZtaBiQ82/JjAnekiIynMGqEzQKU/UiixuWuI1udfetHPrE7WiSnZhhef24tFTmynEL6qM02HoxJcwhRaEEe8HsmwueYTCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887429; c=relaxed/simple;
	bh=rvno8wd7jIFL+izZKRCFp1lPzwOg8SuwP7osdX6UAjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tn1S+GI/Un8QtO837NeyR1b2yCOLIKt8zUKPBwPMwf9IqbzEgGredlWzKz8tiffd1d21AkAMvh8NZb96A7ZcSLt0qraeY0zTZBKQ5z3iIoO1QC+z6xzU1k9/G0ORy5SChoLSfjhnl+dlilpPJ2zsoiMX+ceSKa8F1QNBpPQOWPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nMM+x7Pe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R212f0Z+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nMM+x7Pe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R212f0Z+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O9MGVU2754981
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u/I25kvrhW/lOQjcfnoyjW5dmk57g1obJPOlNaDgkuI=; b=nMM+x7Pe9xUneoxq
	2osQ8FiWSOvihYZMin4BjJ3ydjqHeePs7JmERcqsKtsC1xV3U7JIVnZAK9aqpWFj
	7MiVDlXpRjYELBf8L6nUZibfYDrZo2LsKjNaMw+hYG4xWUDJ+wekjcCJeDz6Jw2T
	zPeJCyTtjvocaxIDp1fSaBN5gyiW5M8eyirKEB03HFb/NPXeuD+vfyZ1Snc9eT+t
	WcuAXutTbFSbs6KSRPqVUgR927d4XXSr81bWbRyjZzbJ6Hs0R/jt+OzdxW1VqNvj
	ma6741iP5RA+W4PddjQeUvbkUrdbHvTkA9uUZr968/JxorxYmDwP5IK6ZBK8pOXH
	H4lXKg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5byr51f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:03:46 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84c4cd31b51so1664314b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 03:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887425; x=1785492225; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/I25kvrhW/lOQjcfnoyjW5dmk57g1obJPOlNaDgkuI=;
        b=R212f0Z+rPZnOJuXTTAnX6z1FgdKdXTCrH2/yac++gac/NtD8F2txd4yCbtmgNk1QG
         lusRLU7nBxAsvbwPml0yVEhm7e3C+ooSAzSJ8GEt03Z8ZsaViRrck10HL/XrnsZm6qoY
         7z9/V4+j02i5Qb+sDijmCUxtlB2to52qVQN8TqRvWY9z3S0K92XWBv7ELomRNxaKfUJU
         RDbLB/57kCbcTaZfR5otRCkxOtObsdXWr/ONgj+8dJgk5qMEofnhPPwmMmX0ESii8Z+T
         4YGYsQBKkLeiK0Mwb8s8pAE8kgwjkDZtb8OmtpmKIIuf53WVv/3TLNxFetMOahQfVbfQ
         iXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887425; x=1785492225;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u/I25kvrhW/lOQjcfnoyjW5dmk57g1obJPOlNaDgkuI=;
        b=rFJK3urTwwCY+DJRNP6dEHFuSjNxmVgyD4UthwjdA01oE/KsMiOhFYk9vB/n5nKTLc
         maDxtmMQLaAC7IN94QO57RHLivPwgpPzMMr3CDbhby/0qM9qPGTz6onSIRojDpJgnlVF
         QQQ50zb0O9ZT1ECt9GfY1sC4WLadmSE/9Al2R3cODDqJo8qsodeS9PH3Z7YPekAT4S5b
         fi/hgblkS2DFi44yq52wdgqfxUgY5UWlXrEc2T2K3NErRIKBrLjL0CBm8Z9hK2YXLqj1
         i0zmTZjlmhYgmDLHADO6CZza4tBE8uwyH6+N2bU1P7JQ2zR0qK147lUaCglPKjibyJYh
         oqjA==
X-Forwarded-Encrypted: i=1; AHgh+RrrTZKTXnZgtJ58p1ktvDsqK+hav/gjWBeZaGqFd7xHaWzlQCDaij/moh1xUChRIM4RZz7WHTujkqpFORym@vger.kernel.org
X-Gm-Message-State: AOJu0YzNYGmyZlbdyupEi3TZ1jvm6ELkLQvHKM6EWv9t6WYSOVyAh5uY
	/S6Iyzpk7Mc2rxMaqQDcP8INnLVro5TDWzB3FNPP1XKkY7mxDXbsGXNPK1cuU1kzKTMWoyWeMKg
	zKDs6UEc6Ta25lilC3Qn8nYfy0C+neyxhprW6C2Xskzm633QTNW4mpWZGc7MvgqcESo8V
X-Gm-Gg: AR+sD10Y/fKCRw80PquxfrDLtjGLGHNnStYY+jliYO7ZgkI+2bQGN8yx+2BykZbXHYa
	BZK3JVaRlzHBSiajEAd7w+iedyGumMlgrPWRdvBRutu4ikJ7sOFeR4ZTsmEXC/WWyBsMPr8dCe3
	D30pFRhcSRM042GMjjuJhoVeKTkkwfMhaqT8+WXW05ZCLYdrDdYSrlTaNiQvknrGNmXIoaMbrRS
	HPx4R/9BC7aaLsqC0Z1lAg5pQ63n/3R25XjLX9GGByfLjebup2ketLi7Tiq+8tJSj3JoZmSwbe2
	qRZK+asSzYV0mxnxwrvCGyAa4fAYJvdc7TUa+/uubwQ8wRf9zAHl7h/B9+Wh9RVy/lDYMDPY+Cu
	9mGgpl/WTb67PcpXS2+5HSFsWmwi6
X-Received: by 2002:a05:6a00:4f8e:b0:848:536f:4236 with SMTP id d2e1a72fcca58-84e2e87750amr6754039b3a.22.1784887425568;
        Fri, 24 Jul 2026 03:03:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f8e:b0:848:536f:4236 with SMTP id d2e1a72fcca58-84e2e87750amr6754011b3a.22.1784887425152;
        Fri, 24 Jul 2026 03:03:45 -0700 (PDT)
Received: from [10.217.217.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17237704sm4435633b3a.2.2026.07.24.03.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 03:03:44 -0700 (PDT)
Message-ID: <d34ff329-984e-4ced-b87f-f57863ff5d18@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 15:33:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] clk: qcom: gcc-hawi: Add support for global clock
 controller on Maili
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
 <20260713-maili_initial_clock-v2-4-79548f0bb58f@oss.qualcomm.com>
 <bd067052-ea72-41f4-a665-2f54242d12a6@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <bd067052-ea72-41f4-a665-2f54242d12a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UeikTDTrAVIKIzXm1r_5owut9kjKDj__
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MSBTYWx0ZWRfX2fG1XIm+ZfwT
 k9wQEpe/UL7TExLMpteeS1FFQZgUQykxSDZkLO/bTA8H/7iplSXLQnsY/BhGXPboBdkvlj7ENR7
 A2gAKUe9u/QzxLDw8i1YpXHHwOo/BZQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MSBTYWx0ZWRfXxVDdeQ6lly8M
 wvOSjg4NstKhoYdWnriqkvk5xCt0qRWrx74LYNQCVnpJxVNyyeCUYcbR4ASvmfQpOuuxQNYeRzp
 CgOO+MNUFyhRoOGTYrb3Ee8Y0+fZ1IRa1TH8V/EvA66lFGAgFQoMCWLxBrQYJVIJZ3rfgNEyAOC
 uZWQLtWzZNuOOy4pDemrLCUS69sj1Jy+v9gZiKPEwykJ34iotSCc2XnHNn1Qdm+fxAkJKzoGzjI
 C+URFstcU2vRlKQ27GBX1B+13BgH3EEEjqRrGVWfeIhVJJrYTHdf7HlYWvKiPmKLxI6/mIQx37M
 dw8+0N7/c2cf4XL5XyHKaKxJbpWHuRb5owUY/9F+KSMAPBvnvCJ6R5COy699bHKxkkcSPTt8MGF
 iEPdAAXTEy+CAO5MES5Qh7qWALhk8kuFmllOL8pjmSJS8Fe0FahFBshZVjtLnhG3CkQiYgRjaaa
 BmLeSKw4ouVE9QH3/8w==
X-Proofpoint-GUID: UeikTDTrAVIKIzXm1r_5owut9kjKDj__
X-Authority-Analysis: v=2.4 cv=GMA41ONK c=1 sm=1 tr=0 ts=6a633882 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=ieeZjMSIhZrtWKQ3Hg8A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240091



On 7/17/2026 3:41 PM, Konrad Dybcio wrote:
> This is unnecessary/wrong, as desc->num_clks validates the index in
> qcom_cc_clk_hw_get().
> 
> Without this, we'd get an -EINVAL, with this we get a silent nullptr

Konrad, I'll update the comment to clarify the rationale behind this
requirement.

/* Maili has more clocks than Hawi. Ensure the array is appropriately
sized and assign the additional clocks in .probe() */

-- 
Thanks,
Taniya Das

