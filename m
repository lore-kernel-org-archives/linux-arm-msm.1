Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBEF41736B
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 11:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785411157; cv=none; b=biBv1N7MogUswBMoJAica23n9Zi7TNXQ2ofgbiBvNU7tjrJujiP/AV06YoxZbnCRtexDglpnB8np9ax6hURU2VU3TC9hSaDZVa9jbMscX1kqMSC3ISD0wIbrCZXHnv+h2D/BYKL7MIM351w5+xCLNUQ0IlVRXL8Q5woVB2Cfj2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785411157; c=relaxed/simple;
	bh=N9Ohv6rcdNYwhoH7sgF7IMFqPbPWZ8UU9+WoZm0Q1PM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qy9UFkUgLv5xXlqupt+KtpdLxOKTDvgA8nZaEyciGT0Or3EujpQ8WMVRHxMuwOd0lgxLmlJdqYR6IYVA0sAXY1PkUSXVAaEl5jxiCtpJT6gCmkjjktEnDoGJa0P4LrTScE18Hx8f1H0pLwcgR/C+srQNeTWfa8ma5QBtXRRN6EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f+s+ANf/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AGUZPEme; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f+s+ANf/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AGUZPEme"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UBDLg8655003
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 11:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mU3S2KFyCM2FJ/zPY3ZKd6sbQzwi2C1DPhH/yC8ntBg=; b=f+s+ANf/k1s576D5
	LIvfUa17zlcR+dIgzS72oMwvXrvZK/6kAyystl+icmj6yqXfoDgYJ4hhVBueI04C
	q/IfrBUiivE6c4nFF3cr4iDoZSJre2Yv/K7EIb6joVU11XY/e2aHGrgvP1hVu5hJ
	uxMIXlVyLlpBlxT4e8VtbEkekWNcNV/Mmcnzp/f2Jn7iSiKwdXiD3iZaNfu9kG/B
	0WsaOZJVEfcMiR+wrg5BeyBZ99WUHD+miL5e5bj/qlpqCBXRQJ58F9d9ANjSDiGC
	FvQBzIP8FXC/pZfjKz/vrTdEvQTkD81QxM5wl6aQZ0O/IwK335oRaY0X20cPx2jB
	Xq3A8A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr5j38242-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 11:32:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e661ce1dcso34210285a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 04:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785411154; x=1786015954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mU3S2KFyCM2FJ/zPY3ZKd6sbQzwi2C1DPhH/yC8ntBg=;
        b=AGUZPEmeqOidzVYwivVxxuJYks1pGvvAqWZtHi2CevuFbyRDRKAu7AX17qI+G+7Cg+
         5D+JgWg36mKgcoVEd3fU+3nZ2Jg5napIysRDZc6qL0Cx/DbWyv1ebIc4HlnBYRXGJgJ9
         kVW01KTqvB9CJ/GDctxAdHVDcGFMBKiin3x68fdxY8NvqHCbhyNe6Ti1TBHd8hphrOjA
         fVwx/LWFE46O5aFaY9h5xUWigCErzNzNOmTzb1EiAO3I80hxvAK5RlBjlsyKGipo3Z1+
         0rQWduBvHvLDd4ui5CoBtHihXw7fIXQo0NrzaYAEZGLRVQE/+GnxmZ1nHnsV9JcticMb
         BhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785411154; x=1786015954;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mU3S2KFyCM2FJ/zPY3ZKd6sbQzwi2C1DPhH/yC8ntBg=;
        b=Os4nAk5NFimUkdX7XrbfQKStzmQaLRhfXKRTf1mr64qR57Y1b7rYrpYWCDKBYTisU5
         PqH1ICYizc2uqJNexYdaImKTLny0skxJ5S0rbY3hPx0GIOkMMH5i7jPCM0KrdiKLr0GV
         rrPm2FdnCFrtHibRfUMNQmkRW1fCIOKGvwYlr8IADCbxvTsyF7K/xROxp2zsaaDAbRSF
         uln3mbTK61u/7uPIHhqpDdJJE5NDNlvXkGA2MSuLHExG7hG+k2beszBNaG3FE58DV+xt
         4zmSV5PdHwniDN3Umrsl4fMudZyif8zdgn2QaAXi9eCR40UDfW7cR1k6OPx6k1Ai+yew
         REZg==
X-Forwarded-Encrypted: i=1; AHgh+RrEoQZQr90oIizU7UZfKHFDwHiqj1+UvZv0KjyiALObI7l6T1XNIJ3XK5m0yLboEeY72AnisLKmcDYcTpPH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Q1XHGymZtwZP5NqeHMpseLo33piRgw1tAVRVm/Bom3hjUrg+
	FTpOYU2/2eOLcNCVxRdcJKjPQFWipGyt8b52BhBihWwiDKkjdJ5nbpV4+2jv4HvjESjxVM2AKhE
	/DKp0QvUnmhajUwwRyAIvxStS/QJxy90j35jNZIqUPuljvQ5M7jxB6HYTMVtvE7h1cHcR
X-Gm-Gg: AR+sD12vSGfyY07qmonnNf5+tLpbHH/yHcyCoPberCY5p27iSQECZDc6G8wScgjO7I1
	cRmW5Le+0FJFLIwfJxixGCNOOq85pSlBjgQDcVXHyX6qAXm9P9r+aH8iua/TVX+Tu+oFdynGESu
	iVuD1I0bgofDyT4Zje3b0RBqHY0wPAIJHzLPsZ6nm5BAAdAsfkyO+pfAubFG1thzudHYqpjXQm9
	XNWb1mqlBBDtkTecTJ7A4om/mQZrcdcZfQiognIuOVK+cjlnGGmEEmw+kgInSv+naEKq+CjEQEt
	1Qae5nmFj14PYAMSy9AWnwuN2TL/g12DjZU0/ou2smhA7fBdxXXdP18pM39uG9DZP3L+aQ4NpZa
	LTdYHk9cx+DcV5TH0Ak9bR0Jf
X-Received: by 2002:a05:622a:6d01:10b0:51c:845b:ac4 with SMTP id d75a77b69052e-52b386944b1mr27789381cf.3.1785411154294;
        Thu, 30 Jul 2026 04:32:34 -0700 (PDT)
X-Received: by 2002:a05:622a:6d01:10b0:51c:845b:ac4 with SMTP id d75a77b69052e-52b386944b1mr27789051cf.3.1785411153808;
        Thu, 30 Jul 2026 04:32:33 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa857c8e1sm59328866b.19.2026.07.30.04.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 04:32:32 -0700 (PDT)
Message-ID: <3da755bd-ab8c-4d2f-b7b0-6cd7eeb4808a@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 13:32:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Fix test_ctl_hi field for DEFAULT_EVO PLLs
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>, Shawn Guo <shawn.guo@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Iskren Chernev <me@iskren.info>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260729-pll-test-ctrl-fixup-v1-1-246d79589380@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260729-pll-test-ctrl-fixup-v1-1-246d79589380@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Sd8ji7MVo1PPSdE76KdHOhj-ffoBqKWf
X-Authority-Analysis: v=2.4 cv=JeWMa0KV c=1 sm=1 tr=0 ts=6a6b3652 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HWpFVbl4Vm_CWwIzw78A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Sd8ji7MVo1PPSdE76KdHOhj-ffoBqKWf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA4NiBTYWx0ZWRfX2G1rCTaeghFq
 0Tz/1LVOmd9Izd1wrmiPP7QtHQLuqAf+tvGBRyT+CaqjA0X61Dtqz3IvQBuhSOsrEiUe+s9Y2NR
 +aogw1VMJbNgArpHHsFtPMkJhowm91o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA4NiBTYWx0ZWRfX0qaHmkALFHVW
 Su9n7Tv0YYdH1+1X2Eaot2GoP6Z7DXt/HYy+5EscN8K1nRzsqJRFHDXyOkJSgpqY1I9q/nozzUC
 ejmGaOkXH3cJ5JZdms2bpu87QzpI3da3RNNENuVCKtaRlZKLu0glnVaHBGvtU6SGoh+d9VVmTgW
 31L9epHZaut72jBQ5159dxYJlDhOctIKf8CN9ZV86Mjlf0xWdK/JZT4czZrnH1hvOSiQvm9pmVl
 7qCQ+LdacuZFlY2LmRIPdFlcDu7PjAkcgSzPgKEmGtA2aco57xkvdfKVIWNYRcUDzrRRGYNhQ5e
 2R9sSnG9P+qN5olJA0xviDIZB/pY/4kJ/Vznb22IdD6F1jfdK9sdZMdHpUE+m+sdQekWoyoPUA+
 jOTP6IYIhB5qQakVU6Fa4fwqZ5WuWpzcTvzfJtz+ztV342P347117CtewRibF7iheP951wHpOM4
 TdCdxJOYVymD69Yw/ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300086

On 7/29/26 5:23 PM, Imran Shaik wrote:
> CLK_ALPHA_PLL_TYPE_DEFAULT_EVO type PLLs do not have the PLL_TEST_CTL_U1
> register, so clk_alpha_pll_configure() does not program test_ctl_hi1_val
> for this PLL type.
> 
> The GCC PLL configurations for QCM2290, Shikra and SM6115 wrongly use
> test_ctl_hi1_val instead of test_ctl_hi_val, deviating from the hardware
> recommended settings. Fix them to use test_ctl_hi_val.
> 
> Fixes: 496d1a13d405 ("clk: qcom: Add Global Clock Controller driver for QCM2290")
> Fixes: 01cf3e27824d ("clk: qcom: Add Global clock controller support on Qualcomm Shikra SoC")
> Fixes: e88c533d8a2a ("clk: qcom: gcc-sm6115: Add missing PLL config properties")
> Cc: stable@vger.kernel.org
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
