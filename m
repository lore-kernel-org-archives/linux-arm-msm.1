Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0B93546E1
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784729049; cv=none; b=h/pM0FFRKrB8DvpPH4Yw35A3f/eEFHlNqQ92Qr3xsKNuEJPc2uAj7zmTv6G3nKr+/abBLzSepSwSysr2WzKdD2nS5HfdQDjgqzndzA/CmbXmMGxhDpr4CDmFXDg1lwdllF0INOPKlntTrRTffB1O/1ScCkQmK2auH5SHlUE15n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784729049; c=relaxed/simple;
	bh=vXRowRzjtjaxrwD+rji2hr2nDDh0fvUrsn1Nk+7jjc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fheUQmH3ta8Srv2gRXiTxBS2ZRFspEoktw4rjOzAUY/z05gbSjWV+7y/5nliVa+pfrpLaWIyJcgw2upPxn52d/juZABSeCzXgxjzpB001UbpNnaUaYsBiFCPSxQDr3BkA0ZDGyx8jKG6E69GewlnHP/7Aat8RBJf6RZKA/Paww8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7+uhPs8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XiY6wtLY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7+uhPs8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XiY6wtLY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWgN31033849
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jRWoVSO4ykvp/ib+Cr2av0mo
	9ut/H+oT06MlZHe2x9o=; b=C7+uhPs8U4bTkQ5F+4B4PNYp4shC6tF+Jc3mFOfV
	skKHC87TgKJSHWYnD0BCLZa/hXViOh9r5Erjr5UD8/MmoXPpYWgkTcKAfgZ+Rgzv
	q68qu6HMMSEmmxH6YDjt3uDjMNWkpSEMlNzNNu1En7loPQr3N9GEmHe9l0Wd5RzZ
	eVhSHtGq3vKqzzzprglO+TruUsEPAw/YVc5NU7/SYrPoMNLV80391ylgaqngWJnY
	OGNymrbsGMSPo26Yz7qQzBoWLu0mkIoV/323zWhV3CHxOBViMd0C9AF22V9YKnta
	Gp+jmb4Pt3K7qxKWk/+ou21nWNU8aloLukigNNj8bg9rjg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjpxdj6wx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:04:07 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97702191344so5107282241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 07:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784729047; x=1785333847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jRWoVSO4ykvp/ib+Cr2av0mo9ut/H+oT06MlZHe2x9o=;
        b=XiY6wtLY/k+bjx95MTaTWywO3nCp10oTcO/fv7khXcJws4tayzVvYESzmo8d+J1qmH
         Kunk4OnXN+xJlchua6zkLp7iEF6VueyDmEGutG7rNXzv06aAD6gLOnt6Zo78YV22Jarm
         JuUAwtfXHVPYc9FY77jCtkTqx53Lf91UQjCUz2MdJ/s65aQFtZIbXnpbXvqtMbAH2Ii0
         XcpEvLYEJdumIYJm669kT1Co45tgj9KJ5l0Tx0jqbziD5S+aaPkG/tJaz1tYOGfpLTHc
         lXhVpSyGACLLkN3B0EzKuHiRaqJFHxVUeTcKy2jhfI6xvOaEt4I4nxig0kC8jB0wGZcB
         sLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784729047; x=1785333847;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jRWoVSO4ykvp/ib+Cr2av0mo9ut/H+oT06MlZHe2x9o=;
        b=Hl3nZSG+XvSnLxAjLZc3/CU3ZkdaMvfKyumonTEFrA3Mqp82SVOLIHLHtunpBm41lN
         PjH02woQGd6sRo/Jk07vBLF5NDzm6YdxJimgZyew5e3vt5MwzFBhDCD2ZFHCSKDVvxAa
         pX1l5prhYSsEG86APWNRrS5hjX6A9cQWqHWrkWGP//j0xOng263EGP0NgtLUKczl4fQv
         eHINbIN526LwaHlEvklogQXVu25MZMpbscW8aMK2nxuEbYLiHpuggB/aRJGY8lfXiG5U
         OXZeYBuP1crSdG5FHb1UyD8V3CkWyB7oLHT4PBIm2yqM+ZKic79ZG1rUinzZxS9g+97O
         DhmQ==
X-Forwarded-Encrypted: i=1; AHgh+RocerzLsy7W9wo1GFK8OMemvv67VdKa1W3NUvr1YUNmTWXIVnmRGCO1U1d7lyGf+Zv/dU2ob5P42bvuNBEM@vger.kernel.org
X-Gm-Message-State: AOJu0YwkxnVgmGgvv+CMyh6nD0bniCpIYTrNWsevESDtMAfD9FgWLFeK
	U1E8I0YhywFIKRAWjfbV6LaMfkNQRXGW1Y/OWEKsNEujSqK4F0vLw0iSsq7QFWNajL9mZnEAL/x
	Sth+w6a606D4nKZd4Y88laVYG2RYioybnPE7Ajam12BRRiW+QR8ZLoHVlvkdBkNsTGz82
X-Gm-Gg: AR+sD13uZgnM2l5Y+L+HPDL5AezF7fUloyJXgIX0pWpN1sqU0Usp3MeV6zp6LmRR83B
	7wEBJ2zkDPVgngqCxMXpdK4da118OD/dAmysZErRc6X5Tl3p2p0EkGsRK7i3uyxHZD6IjEprw3a
	juRCBr5KMQzh3PWURFKyIUyTBEJ25O5HB6jDaFQyyQxoJhY8yLP+2XyUkGGIRIJSTe5wH/W5i4i
	YqE4EOSjWdWN1vABpEu93pqlMiY8KbiEKhipGv2VB841cbOmNXQyAnkKAAEGl/XsXBc3Jx+jj9a
	3yYBzo0RSyEPMnmCooIAIfXLVHHBE42033/qMk3Zy2tTnE3wWH1iiFISKbiX8qUBSWC7xEkXH+0
	nA/c3kdqBbd6aqvKDjh4RdHiFzYmUHuY8l6wvQkZqa+Q4gpgdenCQcu7AtfIO7gsXxpxbBfhdLt
	3TvKIHtzdkCdLCBQ==
X-Received: by 2002:a05:6102:6a81:b0:738:a8a5:4c89 with SMTP id ada2fe7eead31-747536cc599mr8709186137.18.1784729046671;
        Wed, 22 Jul 2026 07:04:06 -0700 (PDT)
X-Received: by 2002:a05:6102:6a81:b0:738:a8a5:4c89 with SMTP id ada2fe7eead31-747536cc599mr8709058137.18.1784729043791;
        Wed, 22 Jul 2026 07:04:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6c41f9esm4375821fa.26.2026.07.22.07.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:04:02 -0700 (PDT)
Date: Wed, 22 Jul 2026 17:04:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com
Subject: Re: [PATCH 0/2] qcom_battmgr: Add batteryless DC-adapter MAINS
 support
Message-ID: <aimahyy7gnnw44pdedtt5xovq7nqw236fb6hwsm2fqjzagmcm2@7767eiubcdz2>
References: <56a54a34-1040-44ae-92e2-ce65a3d3acb5@oss.qualcomm.com>
 <20260519065938.4i5wot72pfxy4m3d@hu-kotarake-hyd.qualcomm.com>
 <ag-NLvh4ROgTCs_L@baldur>
 <d4001407-cdb0-48ee-a138-87c94b5dab01@oss.qualcomm.com>
 <20260702111737.2qtjcfskulav4usd@hu-kotarake-hyd.qualcomm.com>
 <5d5c693b-bd07-40a4-aea5-d9e1884aac50@kernel.org>
 <20260703091319.5kcsqjtx4e4rshsy@hu-kotarake-hyd.qualcomm.com>
 <7c7ab43f-45c0-48bc-921a-8820408c88c9@kernel.org>
 <20260716084850.gssw67izy6vq36tg@hu-kotarake-hyd.qualcomm.com>
 <alltBcYWULOv7nEv@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alltBcYWULOv7nEv@baldur>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNyBTYWx0ZWRfXw65CRUz/pDi7
 GIO26EmF+R7In97OdjLtJMOadjNNgRpWfSecnUrmUKSdcy2aE8Jnd6JhhJ2WLdDY7B84KZNgPdE
 FLfDRkkIPYb133jhzIMNWBxM7+xlk03lIv23LwgheTXnYEjVOS0ixWd97Cx9/rJkfMZOOoWQAUU
 6xAz2aum74D7U1/qFtZQwTWXCTlRRDNh4RpiSzfsdDD9F0wO3WZk3qfNfchjPnKCHL7Z65BXtJP
 MsCZpdhTS9WmDFNTez5+U2Bm4zvtBPqJff4WtFgw7QKykTCbthIteWf3EhJrwaQO1qjGN6UD/62
 HkrCwOs9dDWCMRRGS4HK1qohNRQ37nqp4vxCTNH7WNp/E08Y+9s1XRXCb+GB1mvRtvwBd2Nd+Gg
 N2doUB+580VrmK/SO7k3/IT87sgrhWAUADwmQaT/we1HAqhxytoNnioa4/3TeKlpbnfDh9yzNqm
 CC+vJ0IUogBu8GWdrlw==
X-Proofpoint-GUID: O65wWG_ElwIaPaWQpEqauAnZYLeoKRuz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNyBTYWx0ZWRfXwNnbJh0oE60B
 ZxJBWhCWqWkyID4w8wfBlAqoL6gMLEdeDj8zEpV6t7bEQKv2jEyMuHE7iZNQ6R6X53mlvQch8p1
 1le7ACppdxlRizHB2zstsijZ7l3UdRk=
X-Authority-Analysis: v=2.4 cv=b7iCJNGx c=1 sm=1 tr=0 ts=6a60cdd7 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=Hma63FIqJW4f3ALk-BsA:9
 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: O65wWG_ElwIaPaWQpEqauAnZYLeoKRuz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220137

On Thu, Jul 16, 2026 at 06:54:36PM -0500, Bjorn Andersson wrote:
> On Thu, Jul 16, 2026 at 02:18:50PM +0530, Rakesh Kota wrote:
> 
> I think this is similar to if we had a discrete charger block that we
> describe in DeviceTree, we would somehow have to describe the
> "configuration" of that component.
> 
> But I don't think you considered those other use cases. Perhaps this
> should be an optional qcom,battmgr-interfaces = "ac", "usb" ...; taking
> the list of interfaces that is actually implemented.

I like this idea.

-- 
With best wishes
Dmitry
