Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D1B4E50BA
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 14:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742647; cv=none; b=dxMO36dzP+fBY6nWO2sTFILfWbebg+be1lapEkiSIButqOtJB4K9WoSO87DJZulylIrDfbWz5uZcrPjz/QbVK8CU+UwFXj6Des1COV9v61MtbvFc5pYlLCNLfNr45yyAT9SX5UDpeHXM8NYvUUPFDkdDoT5iZ8yJc/VE/4wUv/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742647; c=relaxed/simple;
	bh=0XKJE9i8zYMBMANsCjjE5uTtIk9+qkiPDvkZ8ivFoFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oUPgYkmzzgL1h+rRP3+k+SoQOdKUlgDEifnEqCjDqxX9pBtrBIKWDAAtmgvO1/sE7D95hWLz/SIWd9tO0durqjVseLICAdnwSI7YzSOhLN3mbiAG7+hGChQGveB9jZlqq9WKvYjnrp3txY93pKo6Ce+FYMB5GYoI+SQT8VnoWzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ggE7Ni8C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L+ZRgUVV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ggE7Ni8C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L+ZRgUVV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOrgk3646228
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 14:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GgoDsfXnaLRNGr+mmbgHEyI2
	xXAvLS7EZNrAWbkAX2E=; b=ggE7Ni8CNk3DqLQewYKJLXfBA6gBSgTVPmuk32Vj
	wmh3lVG0Gal5Em3dnTZFTwFMOOsxdGP+elAqXaBis/9u1W34xfSoaCAjbxMz+Okt
	yu/3NYfauYjKz0KuE+KCubVJRisjUezoFV879GBqjnDPfhgVZJ4i8wx9hUslcrxB
	tvLRWj9IbU4Mlwe2VMQGSmqkt3fNPpZ+0MPTLKvAB+Ve5YiYd4XYG8IHNcJAKUw5
	C63HkGghrXWNDsny66CmGxm07STlQLm/br9u/vmgPwCilrBbVi1Hw7cuqpkGwLnG
	tg2zFaXGyK2jceOxQzy4gUkAnZI3fKpy0XawSyfVC/2IDw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs37dh1m5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 14:44:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8679cfe5019so1269968b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 07:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789742644; x=1790347444; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GgoDsfXnaLRNGr+mmbgHEyI2xXAvLS7EZNrAWbkAX2E=;
        b=L+ZRgUVVW626yye4SF8Afi2fgWs8NNhOz4r+X3t9kG9JM8vrQ/a7gJ/sZGduHfMYqh
         HDxe+AdkSlVAxLh6b3LFpaFMv6Ww5G69gqhBaVltZOpKKajGE01JBedOBZRpwYFdq2Ib
         hyfTdm2aVctNESOld8YAtjSGokWKVkPZPl16vaLoZSrftid9R9vwqW8DH6/mJZFOLdFO
         JHf+cMG9xo6vrxK5ths3fZAAldgqgiVaslD87o1OMZJwDwJoLT83Df9fD5BLknljlyJQ
         qLG72W/s8UaEMBKvbAGApcs/Q7ro4z1lQcMDTL9P7/lyhW3Mri1C8H+QxIDSgWSnYwIP
         InOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742644; x=1790347444;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GgoDsfXnaLRNGr+mmbgHEyI2xXAvLS7EZNrAWbkAX2E=;
        b=oOaAToSp+6YmsWkOh+r4O7IpKGT9R38c4dAB7GbFZDHEzILJ8rHPL6ZUCCRo9Ql8vb
         UR6skjEAVpstszBduJZbi7jmNYfItoLqdcP4+FzYCuKxijqifiybr2OqHa6/ETghaXMw
         ltkZYLvd7S/hDkUQOArL/Q/L5Au6Pi+7Mwoow6ZKDnuuKcIgMzOVNs33rsfTgImfBjOE
         e7iGqN+7AxR+vAq07bCLh+YjSPqikHF5TI4X/j9vDRdu5l+zYgbRj7+Vcwu2jVEA1gKC
         gogmQNC6x6/Ox3jYe2BllMaUiUeleYluG/XALk8xrxWioQx3oe71w1VR/9wVjOc063dg
         ndTg==
X-Forwarded-Encrypted: i=1; AKwUvBzQvPsbBfjgJ6GyFe14s9/UwvsxePi/qzcyshBwcqOtRXXLeaMpdjc6POnxr2GGPQ+DI8YwIrK3rKkg9EQL@vger.kernel.org
X-Gm-Message-State: AFuF++kS5uzvg1cBe/VgMZNXgOuLqRapAhf9IdadxuteZyvh9xHLANtX
	UFUNTjBTGxdyfxtwETu8r6nRmOcGK7A55ayzG1X+ZetJq9SKTNBO4eBvvnRTn+M1QM9A9mcH8Nq
	wJ1SlnSekGR49ole0UPFKuA4e+aXLuRQlMtncNXmnowJ6evUJH7gt4xfmcH7+k8BvGHRFinugP2
	2a3KU=
X-Gm-Gg: AYBFou0r2L0LeTMCrXGuLyIE4NwhR1XBFAdJukPO5Az82g3iJaZv4Ii1+Bl9pEuDRV4
	+tYw8AzaoygGVFl6NO36kY01PwooAy7V8nnwlz86on4x/PzgX+y+E9ZaOIkW6uLRSxZo9sGT6hs
	/l6kte8eMqrO9cJMs1XIVO4JyvYVTwsxobBDH1+jqlfvmrCNHzBoAijh7thn/RRVl2g+NPlVw81
	OucEeJP0GngMW1tKGvZPLxMOFtUNABvkS1YP3f/dMLNkW+up453/UsjPvW+7ClfFt97b5XRr3Dy
	qPlg6S8ZxODakuLRVSVcCUWQsnxT4oO5dBaTw5VN5Y0+xwyWprHpj5w+AmM1rciv3I/9Feg8SQ7
	4EH1zXuDLj8DnbB6QafZl8AN7NOdUNPhnG8Gaa+Qv/UU=
X-Received: by 2002:a05:6a00:98f:b0:845:e9e8:645c with SMTP id d2e1a72fcca58-874db8eb010mr5315269b3a.6.1789742644113;
        Fri, 18 Sep 2026 07:44:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:98f:b0:845:e9e8:645c with SMTP id d2e1a72fcca58-874db8eb010mr5315220b3a.6.1789742643568;
        Fri, 18 Sep 2026 07:44:03 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-875dd3ed263sm995033b3a.39.2026.09.18.07.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 07:44:03 -0700 (PDT)
Date: Fri, 18 Sep 2026 22:43:58 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH 1/2] gpio: shared-proxy: track direction instead of
 reading it back
Message-ID: <aq1OLkLiIL58V8aK@QCOM-aGQu4IUr3Y>
References: <20260915014447.282121-1-shengchao.guo@oss.qualcomm.com>
 <20260915014447.282121-2-shengchao.guo@oss.qualcomm.com>
 <CAMRc=McgPQe0x3bWYArqoyprh1ZF9owf3Etop1hqMt67nBXgnA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McgPQe0x3bWYArqoyprh1ZF9owf3Etop1hqMt67nBXgnA@mail.gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIxMCBTYWx0ZWRfX6wNgFDDEtoov
 oT11XzFi/L+fzDO3dxMCLfzkQi/932kIvHwRz4lwZB1xAR/JmZ3HEGuVJdZPRgrbCi0hUFv32Wv
 asd/yOM5ROPpxT/cMDmd6r0gHOJwvRY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIxMCBTYWx0ZWRfX5+h1tjhPi/c1
 TdWGBlUW7g8OrHq3laZEhsWs8ZztXzQrBLxc3qSwpjM/DcK6+uGa6/tEDBupkvFqsd4dQSEtTRa
 iWNYpghZOC6rlxH4dsXTYB9sC+Bl0trKDdyG7fkc3kD3qcPmog7QRkkdb3B8uk6ytnkWySAjaY6
 l+vMrsR+zrpJfaAQpsk1qQGUQjr7cnESc1Ea2orqFan8RbMDkEbtmcgtdQDMDMF9rbgsdUMXW8f
 57sT7OFHQyOI7HhEENNUKcYCbw8A2d46RlVADEPepm4zVvtmvrZddP9F3K8diiZJknpV7hqwRMI
 UeKBImw/ACsF05v58IQBqZt2aivU0sqpQVT3vd4y4DkqytEWqz3AnPnDq1xazvcxSpW3aF8pbXY
 hBNfqKzD3sh1pmCFm5BreaF0HKgH4A3QBqRETsFjplfsnH5N7jScVTE+UW5T5pjB/bh2IFHzq/y
 35yKDTmoIuHfOCQIWVQ==
X-Proofpoint-GUID: Ku6pHFVEhSEibAvjqYyHir1yJpeJAb1R
X-Proofpoint-ORIG-GUID: Ku6pHFVEhSEibAvjqYyHir1yJpeJAb1R
X-Authority-Analysis: v=2.4 cv=R+mWitRX c=1 sm=1 tr=0 ts=6aad4e34 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FoUT1gWrgmYscfJCTpIA:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180210

On Wed, Sep 16, 2026 at 04:00:01AM -0500, Bartosz Golaszewski wrote:
> On Tue, 15 Sep 2026 03:44:46 +0200, Shawn Guo
> <shengchao.guo@oss.qualcomm.com> said:
> > On boards where more than one consumer shares a Qualcomm SPMI PMIC GPIO,
> > all but the first consumer fail to configure the line as output:
> >
> >   reg-fixed-voltage regulator-wcn-core-vm-1p35: setup of GPIO (default) failed: -1
> >   reg-fixed-voltage regulator-wcn-core-vm-1p35: error -EPERM: can't get GPIO
> >
> > The first consumer takes the usecnt == 1 branch and really does set the
> > underlying line to output.  Later consumers instead read the direction
> > back with gpiod_get_direction() and refuse with -EPERM if it reports
> > input.  pmic_gpio_get_direction() derives the direction from the pad's
> > input buffer (pad->input_enabled), which pmic_gpio_direction_output()
> > never clears, so a pad whose input buffer is enabled at power-up reports
> > input forever and the proxy rejects every consumer after the first.
> >
> > The readback is not needed: the proxy is the only entity configuring the
> > line, so it already knows which direction it asked for.  Record that in
> > struct gpio_shared_desc and compare against the recorded value.  Keep a
> > readback in the get_direction() callback for the case where no proxy has
> > configured the line yet, and reset the recorded direction once the last
> > user goes away so that the next requester establishes it again.
> >
> > Assisted-by: LLM
> > Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> I think sashiko is correct about the GPIOD_ASIS use-case.

I didn't receive any comments from sashiko. Could you point me to it?

Shawn

> I think this is why
> I used an unconditional read-back in the first place actually.
