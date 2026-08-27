Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8032948EBF6
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 16:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849090; cv=none; b=UqgXb4mBZ/psSlKD+ksW3BsGhVJy2Twh10UyUlUbKYOJ5N340T/U5xjzkid4GBtC4RFoCM6xoga7bw1xvz6q2Zl19IPYgKRm5/y8/2Rb/41d68mSYWCzrUfvqTUNByAj27ORtFLIS8pC4P32zDjkX4wJqZfewNk9FSeNuAnYlQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849090; c=relaxed/simple;
	bh=LIWudmjBuuTC7oQDej8L1/vHU4MkvFeRxy+wdt0a58A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EtVH8qJN7BVNuUuSjdJ8Iqc3ysf6cw2HqvU+HG7xcii0MuoFI+M6IHWTRefXsjTqTSrXxzJumKsWzKhIbhjdIx/TeOKiJSydilcRQFfQdfRV6MiMG9++n/zKnV7pVNJ6CUUiKxEBremuWWikEwhQX+NPB5IPOGvPQ8gxHPACgEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kZInGT3E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z6nHE+6Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kZInGT3E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z6nHE+6Y"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbg9u3829417
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 16:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CaEEc2AwRgBYqxtCo+TjIv+MSn3HdYNx2K80+kYCoZE=; b=kZInGT3ECVzaq4wJ
	7GaKlLA5q37fgPbHoGzEu4Mzmt4ATXsuzcwsi8TES9wCtD0j1eBYIgcivZQEoZpp
	Ve2iKcWNtUEzg7InLKOjjDMCuxN5NHN4JcoAC18N88LJ9tYPljPqmcw6WcHjt2nB
	smvuMotesHkm38LDuub+IxbwDW37/PGIMn3WagVIytlAxv1uhytou1C1H/fUyxm8
	xb9CBeZHGfoZO7QpG5vxwhhpLJkDreDDgvWTRZ+U8+XPw1bsIMbyaiPs5lDJHL5l
	V3yEw9B/+2eqDvrkcY9RorKG7jV5Q3OTioMJGsFgedg62K5FQGcDe21P54hKrznC
	822rRg==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4game7s9yw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 16:44:47 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-43cd2d12617so219681fac.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 09:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787849087; x=1788453887; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CaEEc2AwRgBYqxtCo+TjIv+MSn3HdYNx2K80+kYCoZE=;
        b=Z6nHE+6YWOlHBfJZMuLMCGsxeBwSVzNnDNU6BoV7VPEg+vvJ9zFMdFRxvx75cslKa+
         jLkz790Xc8pglkfiaTDtJZAxIpI6deV22AHtaCTnWISk0EjThyDIUkGQcW9mfokIdEBp
         U6JJdUD0mcwRYltgnV7nptD7RfGFBlxjbza3wHFstfQLXQL6nnYajYHtWisNSIfDbK92
         GOiJsa0QKjANFoo4WAW9V2vmD05WqT7so9HuPQT6s6wIKPs4rDBkLPyHsKQZB0Td9k7c
         ykXfDGu1zp/W6tBOW4teFo5KBeam3oRCUfN5lEj0wDKwFlXydA/1xLz79CwaDucDILCQ
         ZY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849087; x=1788453887;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CaEEc2AwRgBYqxtCo+TjIv+MSn3HdYNx2K80+kYCoZE=;
        b=dynQWHfrWmkMlDAHi+uzz34dG3d3mwFdF2rde4QN2rarCCG3oyK1HholcihMV6BQUs
         NNX8lAkpEkHHxg01WCzAyvfKCQLnA5aQ23frHQmEXUU7SLbteLMCUb4HXIhcRYR4CDMg
         1dt+QAZ4D0A6XCjJmxjl1qAQ6enNjG/HTpNvZU8153hcSRb/Gw+0mZCfGE1LLHjFbSvb
         WdPIKpGBCQFqpE5TMKhl+7zcpHHKr2Z0ghgES0Xm8eXAE98wo+hAPAdKQOzRpQUnhgsM
         MYPHeqGuXZ8DaUhuVFLJIYaa7u51bBClCM53d1eNGQ76zN1juN8Pr8n1mz/SBfTLt+Hb
         Hv8Q==
X-Forwarded-Encrypted: i=1; AHgh+RopvJn4sLEXzZx+xrxKG2QuEv39kBZIKVCxctDfeapeGiTnptk0TXXPFWueGSKPssx20s1amqxxa9rsjw63@vger.kernel.org
X-Gm-Message-State: AFuF++nPBntZm8UOOkkFdwz658qLaXbN3AiH9xYWS0Lu/79X6coOT5rO
	8UiRptJolfBADNkmw9X8g5Iuz11bm9bHgmopTBLT0ZcfRlvBFOLyG1a4R+ch88ZSV6GkI6NlkwJ
	dqYDRb8rvufLESpADCQKKCbStfLhB6+IGpf5JWQwXckXSlq6CjbQfgglLZSFcfd7hELEy
X-Gm-Gg: AR+sD13jKEjZKT4CGnf8VYcgi54oD/FGpyn0FCtmFwOyZrAeJSC8k0pZHEq1doWBqU3
	zls7QlSrJz2jqQxBDCu8ryDdcaAQHcmCl0eXtCdb8xnoPmxAQ7PlST/KIy60NtmjfHLwpTMK4ms
	8fBb/vdPBUtx0MXlPlicw5pk53/yXN2Y6/HEpYpWOhcI79CrYkXoj1yxY0M7LMUOmXdcpi4xwl9
	7sLADqGV0vl5NmGzPdYUhSmmaxFS+Ei9rf0KpFFjRD3xnAvWtgRy5dq0DYoUgrA+/G4pzr20nzz
	IGWCtCViKXKN3E78OakJ73fdVW1wumRd1MJYVqaffu9eEGG1m7SgqrHUd8qENt/AmOaDxTWuyDg
	SGEh2fb9Y8eyy4wwH4r/oNBPqS/1QZ1M=
X-Received: by 2002:a05:6820:83da:20b0:6b1:95fb:81e with SMTP id 006d021491bc7-6b1a049cb22mr12410519eaf.22.1787849086998;
        Thu, 27 Aug 2026 09:44:46 -0700 (PDT)
X-Received: by 2002:a05:6820:83da:20b0:6b1:95fb:81e with SMTP id 006d021491bc7-6b1a049cb22mr12410471eaf.22.1787849086580;
        Thu, 27 Aug 2026 09:44:46 -0700 (PDT)
Received: from [192.168.1.6] ([122.171.23.69])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a253d6e7sm5112145eaf.7.2026.08.27.09.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 09:44:46 -0700 (PDT)
Message-ID: <67819cd4-013f-411f-8f5a-77df0e3a88df@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:14:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/15] interconnect: qcom: Add Kuno interconnect
 provider driver
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-7-196e2b306368@oss.qualcomm.com>
 <mhjq6szchgrgoegi7jrzmeumlhdjr2njkh5jdyjb3cjb4pd2hb@qjvx34fyo5au>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <mhjq6szchgrgoegi7jrzmeumlhdjr2njkh5jdyjb3cjb4pd2hb@qjvx34fyo5au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MSBTYWx0ZWRfXyhL5DSmQgbJS
 bWuhz/R4U2Lm0YdW1TUH+m1nkV3O4h7EkP62cp5uyFBNQWf16e6wI647Hv+2jbX57Zkfgnk8NyM
 pn8p2fcI/5DCbrj4mSkMt2eT0UVCm8D4Ip4fkZ4zmQX4L84v5UxII+8tWXezp2tifqZKyHDtrZ4
 RIjjVFuMgtd8sWcBHev0G92BxoqYa+oo4y4IZoZtFaGWYeqthGato5fHNuWwQAyugvE7LY9ph9j
 pIj2Kbloa8LOk9gL/WFBs8/e3mgrDAKbCPn5bfwZDf+agW+I77cR9qkKH4NSwqYjEnZw3LkznRH
 DwJ19fE5cVIhrq99P4zNoOBLZfxmZzwv4kUG6IH3uOfehV8hc8zJBGiEHFVi7A6FsQbUG6FqMw5
 mRcv9bHk73k7UHL/odPnbEMXUcd643NG9Z4H4sBpHBOblMLLRZmSXSYREF/CL67guUyqDK5zfFL
 modKSKWqnuOexCfPrvw==
X-Proofpoint-GUID: ZqVJkhoXk-1dUg36t5vJGJCGMOtp-HEz
X-Authority-Analysis: v=2.4 cv=Yrc/gYYX c=1 sm=1 tr=0 ts=6a90697f cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=WTDSa4fX56zQulHxy5BIwg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6qgGxlNUwWlbBUD903MA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-ORIG-GUID: ZqVJkhoXk-1dUg36t5vJGJCGMOtp-HEz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MSBTYWx0ZWRfXwRqp5i+EbJk1
 u2oXa+Era38tuQ9ahP1UxIbfPOY0NoJO6LjPXJetObUfzdPz0xI2NRwye/Un1uPIJcjDzDOt3n0
 9PSXrbaLSHvm43cC+J3qGBg9qEJsJlU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270141


On 8/24/2026 1:27 PM, Abel Vesa wrote:
> drivers/interconnect/qcom/kuno.c

Thanks for review.

Corrected in v4 : 
https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com/

Best Wishes
Hardeep Sharma

