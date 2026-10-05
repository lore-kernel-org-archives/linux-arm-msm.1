Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD0E47CC82
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 11:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198118; cv=none; b=TN/KcF4YmNRyf7Hle8r/WSjKmf8RnYS6h7fvfZ+hK3ZvQGK6QHq0bywiYNzVnXQlIU44ElnBenSdfWh8eA6rucCbClqS4aD/Hdtzd8OyaSt+VxIqEJ6KPbKLnaG6RIUSpoEJJ4c7XmB5XIvXAWTqK0GE5UybYvZks03C61WAk+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198118; c=relaxed/simple;
	bh=//qraIri2DlaIWPw45MlZXonKd5zhrspMWOiILpixHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H3LZiiTZMisg7rILnWXL/e1lznq6LBXgdcb+upWR2vRh558s3Tu20wZlMBBWRGHCn1dVTJvn7sI6dOCVpyx4WChqOveNCoYi4ydgO21Qf06prGA/aRScBRSXut7y9R3+eNjqAkBXoAjAddIt5rnhsqoO5pLA4eOYShM2ZGuKikw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WRk2aSzF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FhIwfOE1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WRk2aSzF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FhIwfOE1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695AoQOP1541741
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 11:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W7E7K4byUVJiE774L54djWwz
	KpsesLKw3mnR/cGeHcM=; b=WRk2aSzFYCp/2UTmSjZw6OZFQVLL2nNsqKUQKzT5
	9rCOtW4CaEtONqe8NynQomZEKSpRaEZO5XDLocv86bG0NYZouEYBIC3sghyJVQfI
	EDin35lZQiDWnzmL0E+2RVRPQ1nwwOTudvgcqCn6ZaiSGdNRwJWtcCzwYpDxVQdu
	npRIzhJoSJrzqkwyoNdRIMQNUU7QzVEQD0tvQma3i0dbkpKHMlxNdYxyWzhdvHMO
	zrk8izOheX1S2wndrQx6gqpeFjcBhGZOyNj/SrWXQuYiQScdKu3Fap6fdH8a5Z5i
	O7BvSubsDDsjdDgT1YJxH2SekT10lEa+ZLB4P8sk89B6Ng==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xhs1s7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 11:01:55 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c29a61f144so62391137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 04:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791198115; x=1791802915; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W7E7K4byUVJiE774L54djWwzKpsesLKw3mnR/cGeHcM=;
        b=FhIwfOE1QzREOEmN2Krpts8aoeP2eLvE03eye8VcHENXQ5MB+NKnQViDACzfbs2qth
         jIwZ8aXZ4fatUviO+ymfnnQzpKkE/YRSTnEwDbq9pGZCdOxEpuctQZ7CiQjQp/HXKk2F
         mxL0LUaUSceaU9/iYHHiiKHCsqa0zgYWXHfA46xaf+S3aNnQzLZwyGBcSeIGBJatnwV0
         ITrDT1rEGMPsc92ZNu05gRMcewdhadKdIT6MoswhRkoKOaTnWVYhx7lmn0zXMmO3U2F6
         u0vYR3MzGsAhTxzTzE1s/J62fdQBCGNNeYnVTfqYWuXhQXIRRtUqHRwdVPqchDTDtjh3
         8f0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198115; x=1791802915;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W7E7K4byUVJiE774L54djWwzKpsesLKw3mnR/cGeHcM=;
        b=ZJXYk3UCX5xCakACIOIYC6Ijr4Z2q425NEMT/12LgtOomLwHn8NglFDJO74NwhIBU0
         ULmdky/Lvhi1jutLa3sbiRRhrnoHfFoX1vlRDrynZVZPZYGRhAkBVQ0vu6WybhLhFVzI
         oEJFUB8kvzw9rBujaqa4bgwj9sT1D5gHBgMU/MggrO73GQJM28M2fEXvH+uZ9+AAF3Dm
         e1UNT2rXSon+yZMZkdCAZgvNRFnFlWFab6BnjdP7lCayQg9cLR2ojymfo43PWn7OwC2t
         xxoDP+a5BbUGnzWxRLF38kADM/Xgo70KxdBhpknPOrwUr11LXOIiC5QurXqE/87K/2pL
         cTfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkx0p9iIOXaM7wEpuOrZqyNXmmIu3yEcNjbYehqpUSIG/OwWYtsmaziLGwjl+OLWdUuKc6WMktCrYyaNct@vger.kernel.org
X-Gm-Message-State: AFq9FYLfsfGvQZa69a1jMcOPJJ/X9R8y42rTeS7uMn+E8yReU1vB9HEE
	TmroaClupo4CwMed7v6tNsxWRIcCAc1aUF2ho2OPOyrv/7Wk2+5Db+7hu7LV2Gb4dlnB9Cps3GO
	ps/scioS7SKAyjgNxQaC0Tua8OkGYSV3eZvboIAsurIt8Ue8/721EOSRW7IrvPJQbPFYG
X-Gm-Gg: AYBFou1k82pawHojDdxVvLlm8/vZ1E4/cDwA7WZqyvqgBmE5xx8I0tLW9nK6R20Fh9s
	+gqK27QXoW1ocux+BqJe8pilfuEdCVU3OjshlSM5BzxEj6n0Wgm/6DGtiEihiPU77yfXnsKYeLB
	B52kQ+i6ERn10N3RFngByhFXx2SdWdEpEXGK9qO2ZzOfpXOACXTvSygqBsLWx7Du7gQ+zzT/Ydb
	UnzshOlV8Z/zxDiTU5MGG4jzOtBwhZ5mN5DV4aoLSKLQj3GESLkB0p6eoBB8NE7Vzl8cLZ3Jn7Q
	3E2o6K/8oHweo2AlCwRrinKbUX11O7blZnvv/CXtcNva1MJiO6uQNEVsZ2Cp4noqLo24IjdkxKY
	BYVRoU2TB/mfbssvzWujNT59ecCq1Ki3Mx84W20e0hYuo7FVdf/v3zMRUfdmKQbnq4q5HXQChqx
	/jgMgxW4n29AcN
X-Received: by 2002:a05:6102:390a:b0:7a6:a24e:8140 with SMTP id ada2fe7eead31-7c0f488a869mr2125312137.14.1791198115267;
        Mon, 05 Oct 2026 04:01:55 -0700 (PDT)
X-Received: by 2002:a05:6102:390a:b0:7a6:a24e:8140 with SMTP id ada2fe7eead31-7c0f488a869mr2125284137.14.1791198113297;
        Mon, 05 Oct 2026 04:01:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e333cf3sm41714871fa.39.2026.10.05.04.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:01:50 -0700 (PDT)
Date: Mon, 5 Oct 2026 14:01:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/6] phy: qcom: snps-femto-v2: Add IPQ9650 support
Message-ID: <lfs76pvsdpkkle3b75m2ez75x25xjqjkgbw6kkaf7rxqrc2plz@7sekrxlnqcus>
References: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
 <20261005-phy-v4-6-b04c4123ecb3@oss.qualcomm.com>
 <ck5st7q7rbnzfp26kbwzixorxlikq6hpmso5fzz33dlsqsrnrm@g3aey2pabkzb>
 <asN/uLBfYARYXlhb@hu-varada-blr.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asN/uLBfYARYXlhb@hu-varada-blr.qualcomm.com>
X-Proofpoint-ORIG-GUID: 3G6x6u7gdjh2rgraMovsn0SdcpSS-aVv
X-Proofpoint-GUID: 3G6x6u7gdjh2rgraMovsn0SdcpSS-aVv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0MiBTYWx0ZWRfX4KW8R+3FFG6C
 SVl9bcRhO2BbKDtZmr5O8wElNjg7mc0s8Z0xz0bbsGIJh7ExUbOHO9W+BWwD7L7fRCVfDkrEmaT
 RcFA/Scbcuosk8LFPFt/GAJhyIwr+zg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0MiBTYWx0ZWRfXzi9+Z3n4OExP
 2cNxUogkhKaBhvFZUd5uHacNuoj7VlH5NKCwb2k9rQKgD7AY2wPdZpU/lMpzJKnvFrxhXGBj/2G
 PMzonq8HNpHtbsY/pdLNc5EC+drLcejB8kiP1W2526AfDWl/clnvNdF0rYqyaj5B3xGLwshhUix
 0kk0GtrVtmWpLXaS2DJa76lkxpojLlYefPOYOhjKPTO+Z7ew7B+CT4BNsmv5yk0CmOD6FAycrCM
 q5dWER9Do7URMxImgrFsmKjF8JMMXop8hh/S3QYFFmcLWnsfkGTXKyDFKzIC+hHmM8+5+9nC19w
 p338Wc7wEptMgg3q1e9snxnOWiAryqyTbUGCe7u6+WA6NHIy3LaGqP+EdzNi2BpSdkkWS3fqrvD
 5CPGrdnzWW2xaCCDAzVlTGAIKRLiIOOXesK4DgigtVS2mNzetyJKuZ7cw6HQ+M9x+x8W4wb/k+8
 D/F6xh885yInzaACwJg==
X-Authority-Analysis: v=2.4 cv=Q6tHcI2a c=1 sm=1 tr=0 ts=6ac383a3 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=lHZ1h7A91xy7d1hexNcA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_02,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050042

On Mon, Oct 05, 2026 at 04:15:12PM +0530, Varadarajan Narayanan wrote:
> On Mon, Oct 05, 2026 at 10:17:32AM +0300, Dmitry Baryshkov wrote:
> > On Mon, Oct 05, 2026 at 12:06:31PM +0530, Varadarajan Narayanan wrote:
> > > Add the 6 nm SNPS femto USB2 PHY configuration needed by IPQ9650. The PHYs
> > > on this SoC require a dedicated init sequence and override parameters
> > > before they can be enabled.
> > >
> > > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > > ---
> > >  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 62 +++++++++++++++++++++++++++
> > >  1 file changed, 62 insertions(+)
> > >
> > > diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > > index b6bbf2b570c7..8957f208bc51 100644
> > > --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > > +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > > @@ -29,12 +29,15 @@
> > >
> > >  #define USB2_PHY_USB_PHY_UTMI_CTRL5		(0x50)
> > >  #define POR					BIT(1)
> > > +#define ATERESET				BIT(0)
> > >
> > >  #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
> > >  #define SIDDQ					BIT(2)
> > >  #define RETENABLEN				BIT(3)
> > >  #define FSEL_MASK				GENMASK(6, 4)
> > >  #define FSEL_DEFAULT				(0x3 << 4)
> > > +#define FSEL_24MHZ				(0x2 << 4)
> >
> > Use FIELD_PREP, please.
> 
> Not able to use FIELD_PREP, getting this compilation error.

Sorry. Does FIELD_PREP_CONST work?

> 
>   CC      drivers/phy/qualcomm/phy-qcom-snps-femto-v2.o
> drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c:449:53: error: statement expression not allowed at file scope
>   449 |         { USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, FSEL_MASK, FSEL_24MHZ },
>       |                                                            ^
> drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c:39:23: note: expanded from macro 'FSEL_24MHZ'
>    39 | #define FSEL_24MHZ                              FIELD_PREP(FSEL_MASK, 2)
>       |                                                 ^
> ./include/linux/bitfield.h:136:2: note: expanded from macro 'FIELD_PREP'
>   136 |         ({                                                              \
>       |         ^
> 
> Thanks
> Varada
> 
> >
> > > +#define VATESTENB_MASK				GENMASK(1, 0)
> > >
> > >  #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1	(0x58)
> > >  #define VBUSVLDEXTSEL0				BIT(4)
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
