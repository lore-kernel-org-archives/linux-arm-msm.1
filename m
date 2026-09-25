Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640DD29DB64
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 12:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790338650; cv=none; b=NUL+o6e++psD5Xyf9Ubn/xSdqtLr61y3Cd+3vObTkjlh66FPaNHlpvMKCA0CFls8s30CbyIj9NPhG+KU+U7ZIpBwID06UwOa04kuBXAfb9pr3YdM7KxmZzt9TmJZjQwxXF2AMgwdWrBiS1GXOOY1X5UEjM+H2Y4ol98UJXUwHYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790338650; c=relaxed/simple;
	bh=pOTg33rrGv0PWyC/4cqU59Cnn4egrKff2SvU8hNM1Gw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iSKluY6bjsac4FgxpObt4BcILIhHlo1w+yL2WF04li/o0tpeJh0ny94VNTNjMPJF6dYfzZwmFqMkix3NczUxq/7ajtgpaocmmz1ry0aAr4DmxJbHVA+R408wH6OI5gnMRizIJ9qds8CPs+w+NUyWleW0UHLVoAAkYhF5gOMeLB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fZlYqEs5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aiJOeB7R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fZlYqEs5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aiJOeB7R"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YSZd2911624
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 12:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dvum8f/F249YZIo0q2vmJCMhfniVn8Gm1B/edD2cHpI=; b=fZlYqEs56Fkldity
	FfYQxfvmhoz5zHTvs9OMRfXABK5iLRBRWD45qK1pVAh7BzQ8sIGSrIt54jZkSHt4
	RjI494lWcsLYzcTyso4KhC+7xJCEOv3MqNglOMDlFiso/Ulqx61xVgWRaI0gsIMc
	3GXdAa6IQGoMo59pULdj5EjLvFhNBBTG85gqrHIsWDcbLbMTbklssDVYJw+pN7fV
	UtbMkeip6g3Me8ykv+5I4mFPRPIELWn3aBIY/SSdWbRcrl9ruxx5eR787gzrIvgT
	WpBr95EfDSL1gDdS4ROWLh3aLYU8EMV189Wn+5UoisAq1Tnqlv1LjWBXKzVGhRom
	AFf7RA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwhm51ey6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 12:17:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso7506685a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 05:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790338647; x=1790943447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dvum8f/F249YZIo0q2vmJCMhfniVn8Gm1B/edD2cHpI=;
        b=aiJOeB7RrHKLd5Y0A2tvKjk5WNm4eRvEvg68y18ZszfEdFofcOOfWcz/FVJc1pT3xF
         H8M3yMuWuyjZp0S9Yws4/t00r6AuYDpAhstfTxxkfIKpd+B1j0eOhxCHdctshdewlaZP
         3VB1vlk0JhLdcNgjI/lVfkeavgG7d8vdPTSnwJ83uav8ZaZ/kQZcBueSQjnJNSbMvwHk
         LkcAEFG+/6jYZrB5VmMA2P5WY7xFpMDQGpUgbT02EuWusPywqcNKUYhpyvymYeTqRYCf
         LT/OO8PqYz/MsJDYvo6ZqbZulk89sXUGFhhnlb+mYsiK/9m59uGAorFd+wUNI0I4Mhdq
         jIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790338647; x=1790943447;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dvum8f/F249YZIo0q2vmJCMhfniVn8Gm1B/edD2cHpI=;
        b=UB8VdL3L78IJq5b9iV53JGHvH82UQWDlFkwAxPFfrtKoZ74mpoejxl9oGyGCWuc2Ko
         gPxK2dBzzbCe1aGbiZC7u8WGbw8fVyh9zRki415kqVjwfyPOEufKxv24T9ih107oKq08
         ER68UwdgLMTnHjI95Ztn+EsVZuIKFdZtEAp3uUnamGUhnTIqPMMCv4iVEIIXp/4kJsyp
         ekIiBcpDP0rSZsrJYqG6pnbcJclFZ45hOhf6DuEOKnC6jjh5fr9/UsmKvGGfg6+Pby4T
         uDdWLGwe7fdgcssw5wjt+wx4x8cB1p45nlxTu7Q5jZOlC8gT3oHJ5EPeZa//DwKGAvR/
         +p0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxFoHlaVfX/kPhcP+szNkShOk5R4qQDZGbVyMNryKP684+psIZD38PKy7RcnyAX28AUS7HrTiCXb6lixbIl@vger.kernel.org
X-Gm-Message-State: AFuF++nt5dFnKeIHwXyGzAOBE8bycWoVfMXcNxT1VFPGFvp/rmwtbmwv
	qwtD75A3Dt4NlAQXE9Ju9mGPbk+NMTZGfZzOqjOCdR9r3vHHbw7KUoNOhhomxLCraXnA12LahSa
	9sBZtuRfj0Gg/yNckDfcZVc2WnpVdDix3QxaAIIZoZK5tWc+Fn7JDks/ja0OpgUNGB49N
X-Gm-Gg: AYBFou21UtaF+RkewaFvZsYTiBEdfz0Fh8sMI7q88qSGcMffRZbf3SeYe6Zb8WpXvrX
	wIk/RhXmw3fgJd9S1f64GRUM1fHNV1fy2ZWzVNL1nNb+Y3FkOadOhEQD+Kr6XEMTgxdbRDoVsVC
	BCTGSnfamsZKZ13BZ+A+Fmx4lP7n2rpKa4g57VxmKEPaI42/kbubUxfSf0F7ZuoOoBHjNQSq4Q8
	PvgLK5avThXsmvLNN9A9uDGFZ2vFrc2EVsPud6VGZAazJzskjJe74Ng1ZGmVfUuCtfV6GU76bhT
	LUsevGzafhoRNIooyONoebM9gXJzqzrc0r4Zo2CAIxISEneu8yad2YIOcxzui6DE2XhYrgLyaXX
	ejdW7+TQ4/48hU+Nexeu83Q==
X-Received: by 2002:a05:620a:370d:b0:93a:14c:329c with SMTP id af79cd13be357-93c43b93796mr401949685a.1.1790338647347;
        Fri, 25 Sep 2026 05:17:27 -0700 (PDT)
X-Received: by 2002:a05:620a:370d:b0:93a:14c:329c with SMTP id af79cd13be357-93c43b93796mr401945985a.1.1790338646907;
        Fri, 25 Sep 2026 05:17:26 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae7357c17sm106318666b.13.2026.09.25.05.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 05:17:26 -0700 (PDT)
Message-ID: <f23837ee-340b-455c-b3ae-1ffff2b49237@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 14:17:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc: Fix GPLL enable register offset for Nord
 SoC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260924-nord_gcc_offset_fix-v1-1-230ffad2dae9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260924-nord_gcc_offset_fix-v1-1-230ffad2dae9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eT-3pyes8No4XKVVro5p80GEC8FTmpb4
X-Authority-Analysis: v=2.4 cv=QYnzLcbv c=1 sm=1 tr=0 ts=6ab66658 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7o7Fz_jXMTEYJjNRgMcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0OCBTYWx0ZWRfX3vcjviLSCQsw
 q0eG8X1JkTiCQUb9Oglg70yuSc9FFQbvUo/Ul0gUzWGhT5M8X+DJLj2rdUyQr3TAvrWhgpg6Gb8
 RiT3FKOYv6x2MM14uyhX7iPIdbN6JAtDIolph8fj6BR8aJFBATF+29n/tmgW2gm69HeQKygVEvp
 dDtIY7nAn/CeVCLq1D6Wu+tdG45m7luywQkQ9FA88FhMvUC9XkAchfTRmjxpZ7aeVGv6B8TbGBT
 WCPoW/E+fnFIl1f8gWbpOs2FTHVE9j52Psa00tqN0GqX3fBP55+ZwRC89qwUL8+5bLEOWLZLaAE
 SUg7TGMoka4Ma8NQ4ZPDRNU3pwG+3tZUO6u6A0DHo7f89L1ksWWQ3A5TRve6Vo4mwI7aPIXCCcz
 A6dzvxsmRTHvX1C6F5rFeF2Z7sYo/b27t9V0LgmgJ+D4VH1w9A++cSYnPXVMjjNdZVkqLErMwzS
 JOkSu3mHOH/h6kMtgYg==
X-Proofpoint-ORIG-GUID: eT-3pyes8No4XKVVro5p80GEC8FTmpb4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0OCBTYWx0ZWRfX5QZKHi3ojDdX
 lgFu6DI6wLcJ0H9RphWnLwZtwAjj3uzpjgKui0ctv2ZlQsxJ7A9xODGU4p5RC3/wCgK+nkkTO02
 js85LVoESXFWzKqVEVAxu6RV2DJxcqs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250048

On 9/24/26 11:39 AM, Taniya Das wrote:
> The GPLLs in the North-East, North-West and South-East global clock
> controllers on the Qualcomm Nord SoC were registered with a placeholder
> enable register offset of 0x0. As a result the shared PLL voting register
> was never programmed, leaving the PLLs' enable state uncontrolled.
> 
> Point each GPLL at its actual GPLL_ENABLE register (0x57010 for the
> North-East and South-East controllers, 0x76008 for the North-West
> controller). Each PLL continues to select its own vote bit through
> enable_mask.
> 
> Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
