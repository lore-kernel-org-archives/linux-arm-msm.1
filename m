Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625480;
	b=RH4uFV0wkOy8ckJazKjm4nXisr+UTo1gOSoJ0cXts66/u3+R6g0hA8pwg8IwyQBRhUg1
	 T0i6J3fXONOT58UuBnHEizm+kYHlEFbTiIhc56BhN8ZphCy+Q1QbcRiQ35Hbm5Vq59rlZ
	 PzaFH+Tx4DN9wRZ11CGX6ju2efN56YnnAD2K2WcM6UUFfqmk798WEnxiJuQ47XQLYOS7f
	 WRaDQLE/aobaBYAoLXjX4cppq8+/EdjiX8agdQAXXri7hCCFP9x71Epptjf6bwch22UZq
	 6WgarTsLGBT/RZWonKjo9JEPzHhI/4P6pts7sL/lttfQ0D9jRJZkjYYEj021Xrpdyjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625480;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JXpPTLRqM3tifKOcBlbkpJH/GIt4xSQu7xbUIhIeEi0=;
	b=oBl2nHDaR8JLnbUAh1EYgbZgas7jQD+8c+MdjWWRMOxmlMpo9HmahXaonp9IjA+hEOEk
	 cRa+kVfFRgceZ72SYsDh3hv1VDtVqtIVQXqwLXS8NAnub60KBmTI0OS+rmevnUYr8McgP
	 yOvx6pOzQbfaEMEu3XwVMv2TTE9DaOlsLMLwYRNlOpjKezsbjvZzfPAEuJ0vTXPqe2EIj
	 lq5rA9o1lkSksVsAYzOXmI+VV3+c9A7WRiI+61nUFiqeVDwhg8+5ZksMLKdGSxojXapkc
	 tnpZtscX1T9gk8fosfMsSfVHgd3V59We75g6pxNzR+8rmpME+p7+RLBszVvQsh00jIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k95Hx2hD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VFO4H9Zg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069B3606A327
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 069B3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k95Hx2hD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VFO4H9Zg
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAL65388215
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 13:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JXpPTLRqM3tifKOcBlbkpJH/
	GIt4xSQu7xbUIhIeEi0=; b=k95Hx2hDB4ND3nI9Djd9/6fvSIEcALgSrll/6GjS
	unWzwCMxB+dp41/2/iLTuEgCVlhYCUK+DJhmENFLekRC9yT8fWu4QK+k+y03KtPt
	8rertyP9cv83DgLzVnbVFAzUDH39WpdnMmSSmf6xfEg/FNazDVgwXdlkDPcWn0FL
	u3ktz0fxjDpcd1SMibt0vxonB9VcsgOsidSCFKcFjDPnRegrfHnVYsHckTrN4PLT
	WxI8MM5r8m0vk6sJC9pOPjU9z7et2ZKucz2IFEzeqAwnsMQuJSOqAKaNsmVVsioj
	Nuq7Nqn5ZzxBwatjz/p9n2pLpdQJqiaI2xCldWoRRL3LoA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph198vx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:17:58 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc099197b9so2491807137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625478; x=1794230278; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JXpPTLRqM3tifKOcBlbkpJH/GIt4xSQu7xbUIhIeEi0=;
        b=VFO4H9Zgv91vMgY72ZDdAbUWqKBpzlhVBFhHg50q/hGZyj+kZdr4tazMIlh1TmDLDA
         iHVOcmv0oNsUGi0k1CaOxXCmk+piQVlmcLPwJ4UwjJghn3MOjl5l7CxlkSlq40JgXetl
         11+7exxUGI7/RKgkBsvfchasW2pzVdUO5+16uPG3FYEBerf94zTcGU4lbT2s7mwYY16y
         97WEq0ZOpFmvOspM06u4CJvQZ7A1LD9s2B35wAur7WWYobhcy2PzGXbnUQj3vOr0so6v
         sNd0M47TsgRtZItxNZpJVPpErqvTnKwzs7hmUuspf41j7iwVYiO3jUAJDlZg2EWfsHPz
         t4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625478; x=1794230278;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JXpPTLRqM3tifKOcBlbkpJH/GIt4xSQu7xbUIhIeEi0=;
        b=DgoYuNu5zWmeq0ly54QtCEQqwVjpS9DOGxZQ6exP6Oxuc3oL4L2g6w0nicGEflBSWn
         cRIFLHoBYhMQjEb+d/T7I81sbwNymGFGII1TQK/kyYYiLcfA99FrtT14e65KGXWQhizd
         9ETjlAsfCnkV/lx4IpT/9NgOEqhF8sb4kNbn/SSdStR9tc0aLEhsyTkqxO9UuRXRTRST
         j9AJTHHeJpO+CUxQV5zmR0CcdL629h46BwQp3RtgwArHnH3B1ySKLrkI5n3gQv4ASH7J
         Z/uV8Oxn3NbwL9P3qB5CzJcdUHZQNuUtHrvyJXHmhQbpsnDAc3njw1Z/BohkZzyDBhed
         DMcQ==
X-Gm-Message-State: APuU4Z8BpRNZIZ4U7qp939myRz3s82PIGkLfaDrB0YYspDgiGG1PDp87
	g41+8L0++RAXAoK2EMmY5cXBQuNY3UTyAZ5fbkvP9liK5fk1BmT+JLLk/Ic8370CbhnKAjWeifo
	BSFyDfkC8L8ALG0TmHP5T+4k2yGXqrIWIhy5i3C+wgPUJNfrVvGL8Baq1l8K/EsO7NIAE
X-Gm-Gg: AYBFou0Lv56vVfeEe9CqxgwaLggwThgW8Z/katjVhEDvK7QS6F885cYxRckfDII0fos
	hRCKjdClL0OERdEZrtoq4QlNFQj6/H6TvOAqNGJpJoO1coOJSiKWgUHOqjM6hClpGEncL/G9RPO
	OS/zC+18jKfYbJV123/P5gfAV9/jfCPOrn5sotNTepTBNjcKW763I53WU0Udk0efvyflPHoht2f
	iP7vJL2gpzt/bz1wadTM+GRlRGoLt+e0tL2rONnuCEaKRZdgZujk8sMEypK1X4nhhSol0vKHhj9
	qRZv3bpBq14+N0yb6seQIdKBTAhn8twia9HkIFKGf3gRzCyTr8nFLejbu6GLTCNQPzu84roAFMj
	12YyhbovQ3JVz7RqXga8xKH2wCs5y8PsTg3fUUcaj3Jr/nwOZgppdQveCUqcaDRU=
X-Received: by 2002:a05:6102:3589:b0:7c3:f36:c7b with SMTP id ada2fe7eead31-7d072c2bafemr4799649137.14.1793625478228;
        Mon, 02 Nov 2026 05:17:58 -0800 (PST)
X-Received: by 2002:a05:6102:3589:b0:7c3:f36:c7b with SMTP id ada2fe7eead31-7d072c2bafemr4799643137.14.1793625477637;
        Mon, 02 Nov 2026 05:17:57 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80333sm21404342f8f.32.2026.11.02.05.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:17:56 -0800 (PST)
Date: Mon, 2 Nov 2026 15:17:55 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8750: describe all MDSS block
 resets
Message-ID: <buaeo5m3ozihgl5t6767jvu72umwbzqx2debegmzvkuigwwqki@zbtoarlnnihe>
References: <20261102055026.438521-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261102055026.438521-4-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102055026.438521-4-xiaqinghuan@mail.ustc.edu.cn>
X-Proofpoint-GUID: hxQhVIxupR-cM6Ud5Us-SXim19PsOnuF
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae88d86 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=yBVnyk2oG99e9CeqceQA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: hxQhVIxupR-cM6Ud5Us-SXim19PsOnuF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfX/nIr7HsOVa+B
 7JkcjF0/XhroJDdU5ufXLnHUkI3EOvsZPZRRLOrhC54ahzWpBPZdTXErUO/U5i9U3hMxVIaTGfd
 KVGrPYO1vpsmY/HRuDJ0rJpY7YVzSZm776z+oas3AyhZNXqqJjVy6BO+kk//9SVUUqJccKRKzkk
 j5ONa721ZsdTiE1tGH231qvNqG8DZL4knocnY5NMoFbw4LPKbWP6jQGdVR9cnMkI1+QZWSjTJzT
 0Fn7p9rg/3fLUE8oqmfIULf9cDGpZPUY4NNd3vge10lR+fDYusAemZtgRK8slXgM360+QMQXeog
 fPBGWj9HHtgWQl5/myyzk0PEV0Z8JHqhOdijV2tbE7wlPBaofL08ccL8P+A17sQh2qzKTJ82a24
 GhC+AVM38FtsMM7+Bdqfycme6vQDPHFiYzcrBcJYoKBGjDPIc/l9BjXEI6fRJ9TEP8Uz+VWLx/t
 eWY/MHgrgnJJ/s1VepQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfXyQij0BAu6Wyv
 sXTvxO3gOFHKS44rw0WaD+HNrzLYdv/eCq/F8kgq1xZ16HGoPXBIJVKqUPKl/cT/2WBSi5J+wyA
 ZfcK7+IIw2nf18qE2KYsnPcf1wza4DI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020052

On 26-11-02 13:50:26, Qianhui Xu wrote:
> The SM8750 display clock controller provides, beside the MDSS core
> reset, a block reset for the MDSS core INT2 interrupt controller.  On
> devices whose bootloader hands over with the display block still active,
> the kernel so far reset only the MDSS core and left the INT2 block in
> the state left behind by the bootloader; command-mode panel
> initialisation then fails with command DMA timeouts and the display
> comes up as backlight only, without a DRM device.
> 
> Describe both block resets so that the MDSS reset returns the MDSS
> blocks to a known state before any display hardware is programmed.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
