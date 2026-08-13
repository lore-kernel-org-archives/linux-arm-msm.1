Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D12F3803F1
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 16:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786636906; cv=none; b=CUQTHhWGFta0/axjZd1gEawVVecruAfugygvMCq5xT6M7POVObZ4qrNtDrZc79Cz8mdkY3I6xeakoeWxN3BHgFLG1lqcrbA1IHleACKNpBhd2o4n3nJOQuGvMAayick9pSogbf39KMSupMt1QwqLLR00o2ZYUyHo9/S89Ht4rHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786636906; c=relaxed/simple;
	bh=RusOvcBFXx6SE72ZSRuUQFYQliPeDRYlYBCL3AZMShM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZmZbtw9VAGLDrz7jlopfuidC8Q8kXdHV1uxwf5VR1w1FaaB0ExgKDbtdA9HmzmPRtaH1skbMKhV+vlLgeKuEUH3X+xh4LyAzXWxg57hKcJT7JWPd0JMnE9W/JRT6MjUvsodenITeGmeZkj0qxSSFdlfHWEsvmb6DahiIePF/8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UQ396+7O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YhP3l2wS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UQ396+7O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YhP3l2wS"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFTrSk3050668
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 16:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vrxU2QePt16cQDKb0SuC0GCw
	XAGtbpNoeaisWIEP/BY=; b=UQ396+7OVjyRMuYv5P6MZRCkabHXplnPXppfYvpu
	6PhVqvk0+5llxA5F9ONsu8oxyyaeKZM2DIiaI0WXcBuAayj9OMDET9B/k2TIYEvS
	+nN9yGMgvqFg+yhhAd6R/49BQ5cmcGHo7KOwsWskd/yv5VceoOg1Q/8x7lR4OUs6
	fCNCJsutXVITKPXmiYJZcvc1+Tp0gZeF53gq/9wcfQhRF0xTiChLpYQlXiZgtm+C
	1nmEKjZDnxvdnbXC3bImLvUE1naiMxKD3ABYCfhiw/p3dUYJLewnO1GEOv7htVH7
	mrkOlSReZvpavHbpsd1wzFqRcH+wjdnBUdzp6ecwgKz0Zw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1fg3rhf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 16:01:34 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73850dfc198so7514137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 09:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786636894; x=1787241694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vrxU2QePt16cQDKb0SuC0GCwXAGtbpNoeaisWIEP/BY=;
        b=YhP3l2wSdRqqt6XsG7pqyhcbJWBjzqwukfMKpylHN5gTL0qRnoToMJKStMKEJSE+DK
         6mQApJlllijAkRibz0f8WztTmTuyq2Vrn+0Ti2zPvtBQz8dbMYb0xhmvxgKN/cHoYXyv
         jD8KDeupPwlJKtCGU+E9+/yLxzNvztwHF01o/gyKSF+eEdmoq3fqYszmF6SaSz426kXo
         QIPP4TUJuQTpFxksZKSH/2NXly2ruZkGuVeeVULM/iDP+4dzQHnNYyvUF45Xi7+wi1s7
         eEU0gS/z9bUFwkfHsi5SlgYevzih98n0lAlRICeYQ3FsbwnZpdNU+vKWNOLgns9H3Cvy
         X5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786636894; x=1787241694;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vrxU2QePt16cQDKb0SuC0GCwXAGtbpNoeaisWIEP/BY=;
        b=W7MgYzWLnQoTavm99V52yTJjjyuk9aYVriTLrkv9gK2oky6D8a40yNjbSzwvoXteal
         9SuYgEfwQZf6cIRXwf6yjl8CYdLpFKvrJYlLn/WJClEuNB3jgJZ4deqSAXfqMQZIHQse
         nr7K808bopkgZDdYa5/RnhWwKQQNQ5J2KZx04DhHqFzPnKtFcQKHrcUhRtwZPPfdMpjc
         vhfnje2zDBJDJtiRG8VIPZBlbCJmQWIxuH4ynmXLHWPpn0KiJ03yj3Jy40+pphdluqS5
         ArX8ztXuzTgISZzIP4JvlXM+6e7I1yZD9OQMd9mmu8qK5c6AzmBrie4yl97DHV9cwshS
         MyiA==
X-Forwarded-Encrypted: i=1; AHgh+Rog5ho5sq03L74Lgy/+FHhAnkbA65mNKFfeTbGVlhIepwvY7Cu4/RuPkrKFbMEPZRWRK1Nu2ZFM6CWXhO5o@vger.kernel.org
X-Gm-Message-State: AOJu0YwUBI/Cpd8cd6SIaq3NjMe52Xjgw7qEA6BvDfAzGq5v7cJDA/5o
	nKUx0q3WZHi1tERbAEOvB0l7Spn0x7LHZ3/oEYpOoD86oHVrwx/eBSHLay7VZotVZiesRZWluVd
	LZrnLkRXe/6xbtT4Tbgnr79z3sjTpjaOWwUcNmvpV8HL6l1bYgQ2m3Xd3nrcvDNUgYBY5
X-Gm-Gg: AR+sD11HFpCVaQcrhPEl3TfKK/e8Mnd56PG79wHpuoNhZ2Yhdxs6qcuklxd/0COHuqX
	drqjTvQqqG1hrbE/EHtuN7YdXA2vhXy91jzxohWyIsS3AIjUIoT8QPN9+XyIaMAK1AiKhqVfVl2
	1LKHkK1LLNUFxz+rehQk7Pk2TTsk5z3l2+qkUSV/FmYSg/9klXWCNcUTR+vpkM2H0jJutaAVi0F
	VE4AXC82jl6BmzK5lIUdXPEmKXOwH3Ui+Lqpe3ZAR70luZ2ecaLWQAE6zxbFvRhejtrZ6K00d/o
	mG8LT57iMkHN2Vg0XxnByhGp9rpBc40FQxN5MnM914bQf2nVK6q6tFJUxU0Y0cyX5oFHfuYlJ5g
	E4F7XaRpn3LXRoUssyKlSSc1j0LRLlC02EkPaQDD6sIRrddfqeXOMqkBh2dG2A8G7cdbVIkTtB/
	5POh0hIq8NMjgJ
X-Received: by 2002:a05:6102:5547:b0:6f0:3ba3:7d84 with SMTP id ada2fe7eead31-76db5c7523emr1514564137.5.1786636893584;
        Thu, 13 Aug 2026 09:01:33 -0700 (PDT)
X-Received: by 2002:a05:6102:5547:b0:6f0:3ba3:7d84 with SMTP id ada2fe7eead31-76db5c7523emr1514553137.5.1786636893152;
        Thu, 13 Aug 2026 09:01:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b453a54944sm578211e87.46.2026.08.13.09.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:01:31 -0700 (PDT)
Date: Thu, 13 Aug 2026 19:01:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
Message-ID: <3zqx6nxp4wmzej3nokfggoji7nihosru6yyaquvwjfvtylf2fq@ucr235faztbl>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-15-5e0ede4a0c72@oss.qualcomm.com>
 <wjzyvt7q4vpirxclbwexrhsmcoi23hmsqbjjpfto26ofci23t7@uufz7ilar4qk>
 <20260813-generous-romantic-asp-be92e8@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813-generous-romantic-asp-be92e8@quoll>
X-Authority-Analysis: v=2.4 cv=NsfhtcdJ c=1 sm=1 tr=0 ts=6a7dea5e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=foydBGwHzjCcBrRpJO0A:9
 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDExNSBTYWx0ZWRfX3FdoldN3kApn
 jXfo8J35Sw/S5q5M+0MCgXXOpsS7xcnsMUFh8+g8t+d7OpIxxldeaIb/3vpL/icK6Xib8pHMH9/
 nz++3BBGikl58Gc18l5RjiS+jzoyUV4yJRpbiyvL32w8YW3zJlTKdRpwcUjPasC/ibQvGeOpz8V
 0kv+DDWk66fiCR1Hdk5mG3P5Z8/g3Tq1dzyyqogwAaTdiwnDbNDehtX/YlG88pxjH9gHe7ob5kY
 82hFWaWJ0rcOmlPxedNShQ4rLEUAeviMjYPPhlxe3csG3PZFI3mjnch+PQ7qiosXcXe9RsISRY5
 +MTUC/R7vPPi/nWLItS+GXpnDZ8JgBC/B+JWCQtv/wafEFpA3j7nx9oFCT4n92J29ZcMAJ2Q81+
 Gda6f2Tj2I78eraLoUFC/AdxyY9iGOMnC+PnV2Jg7I0VVJs3uZmD5zN/Kbjm0DK/l6fN3262f6e
 21Y4Ta3fk9SuP8NjM2Q==
X-Proofpoint-ORIG-GUID: f853CWMGBGZtq2ZVpCJLL5RS1AI5ZLXW
X-Proofpoint-GUID: f853CWMGBGZtq2ZVpCJLL5RS1AI5ZLXW
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDExNSBTYWx0ZWRfX+Qvf8phuVcvc
 J8wryu8KLPq9Cse13SXHXi/NX7gGtAt0GAcSKKomymCYhPAkl+ocTuKgqPdf2Gt4vqUyPu5gxoD
 R8vHuI3NBIPOfFaMzBNIMLkrjTleGJ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130115

On Thu, Aug 13, 2026 at 11:44:28AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Aug 11, 2026 at 04:13:40AM +0300, Dmitry Baryshkov wrote:
> > On Sun, Aug 09, 2026 at 12:57:14PM +0530, Hardeep Sharma wrote:
> > > Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
> > > (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
> > > 
> > > Peripherals included in this initial set:
> > >   - Single Cortex-A7 CPU with PSCI idle states
> > >   - RPMh RSC with clock controller, power domains, and BCM voter
> > >   - GCC (Global Clock Controller)
> > >   - TLMM pin controller (110 GPIOs)
> > >   - Interconnect (aggre-noc, cnoc-main)
> > >   - GENI UART console (QUP SE3)
> > >   - SMEM, hardware spinlocks (TCSR mutex)
> > 
> > This is pretty limited without any storage. Does it NAND?
> 
> It has serial connection. this is enough for a start. At least one
> communication interface is needed for early upstreaming.

Yes, but then, as I wrote, it is pretty useless without the backing
storage. Also, it would be nice if we new the future plan. Is it going
to stop at this point? Is it going to be expanded in the next few weeks?
Will we see a spread of conflicting patches 'arm64: qcom: kuno: add
support for foo' with foo in 'USB, PCI, remoteproc, NAND, etc.'.

-- 
With best wishes
Dmitry
