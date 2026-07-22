Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2406A242D84
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 12:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784722679; cv=none; b=SKCpxDqxwcWT55TPrVftkTEQ8ALUGQeZywcZwpEf8xnlQ8vgbOV6Iv88f8ah2cOeGaWOWgUMwNlGorU1OvPrBbilvLe5HEqAkJdqVsItb70J2Da7IiJYDWuWzuC/9LCdlse8fgvH/YQfWjel3VvTfM2fp99BAMSFBQ8hpQpalfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784722679; c=relaxed/simple;
	bh=Pp7CzaUNan1GgAKYKdMXo81H1EROhXGbCrOtUoiWFEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cELKMm20TRNU8H29xf8ENCUNYXtcQ3f7B7lBz6811mJ55AKetlHsrinJ6+1F0gZXZLL8vFuyPnjiXFl/g4gevzovg3ntQkLATQEeapV3wskOAlGEWaPCyZiAezuf/SEkHwQMlPM9k/EgCy83H5HpM04N/kWIr4RRfOyvOShazYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQ0sC51c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F7/c1sCG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQ0sC51c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F7/c1sCG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M9Dkl9049574
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 12:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zFADLEvI/qGdS1XKXSZzOMH4
	EpOSXlY0GIxunmujHh8=; b=PQ0sC51cKHxZauomgkIaa2PQ1TNzaGEv168JNE4v
	ryjvjGL/djBzVIFMMZOI1hoQ7afm6HIkT7Y/WbCTqRdSP4znHTKoV9aDiiKlr+vb
	eSZH6vbL2ijIOb9VffgNvXj8maT4wz4+hwM74sv5ohUY/oCZP3SKgv7ReEOjXSnK
	FIb42VxLv/z/fOERX3DcCYVNeubZaojXCiSY4LLBz6rLxpFznCZYR4g7//ZxZw4R
	yy3Yn7yI5zlL3e1WMt98ebKIujtI6XB0MdAGxYYbgL5/Kb1TVJLrMcMflVPZEWvG
	1e7oog/n2yZCFVNE+l0/19YzNpUPDRxZ+Y5PFJa9/Eihsg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fju228qx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 12:17:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8fc92c5373bso236499526d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 05:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784722676; x=1785327476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zFADLEvI/qGdS1XKXSZzOMH4EpOSXlY0GIxunmujHh8=;
        b=F7/c1sCGk1shN68oUPZtzVzHrR6rcFD7Hup22H5PYK2WI/QfbGOuqT0MlKx/xc76Ok
         VdrAYmlv6hV3c44Dif/0YKxrJkcLUx76p/07Ra7F9YcJirAGlySS7vrAjeA0NaPpgF7w
         5WLZv/qoF03XyB6wGhVJ2WQHDL8+a2BGVA2gPlryVzPG6r+pgxaI4D1EGpxtvDa7ft4o
         7crwUOoMsOag3gMkIX1gn6ZGnp9HQ2ThCPjnZG/Xw6a0u/jOmS19SiSy673qv2Y4i3sp
         MWymLmXM6JSIH4VSMGcP1OSExJs4zCxpC9eW4bYJJxrX5gMzzDIRVaHNZxuFw50wwOzs
         WAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784722676; x=1785327476;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zFADLEvI/qGdS1XKXSZzOMH4EpOSXlY0GIxunmujHh8=;
        b=l9//IEIvR4Zbe4VHziBjbajTObm6zuWVI40biClLvJRdtG5Wq4K2WorqlBTMYftXZW
         o+vEOY2rHjZcDT+yFd+RFodwVYX1JcZGmhhIf8fJSV4XzsFYjNwxORG3hyHAsdgwCJ4f
         IUFmXJoNSEHQqIZX6Yp+9ETSvIbxUvuHTKn0DnvfzvN1+T+DW9bwahbkMskDgEkk5Pps
         2/EdqeJi6j9A7yKDOoWXcpo6XM0ys9owpqAOBvQUbf8t9/7myln1I6L8HZ5o/F+htC+p
         EV+pbgw8y1r3LOCvALgJb8TSZGPV6bpMNKEXEuXLxQtFoNVzvwwrQ9S4m0VrGhfVGXFb
         49oQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqu+ThsE7K3wkCB+FKgl0WMCYaojyxrhBtXFQl4QomsxX2BWi4v5PaSnArawATrLrXGRXJCsoBX4kWFw200@vger.kernel.org
X-Gm-Message-State: AOJu0YywbYqnhgP7E4JDN0+Lz4RVLC0zFdB4+293lx+3ScleplzPjLSW
	fs1EiebnYuqMI/ZIBycNa8BSRZeBphB4tY723tP4Uu+YKrC0UUOkmiutbsbqmU5z1Shb7DnskJZ
	Pr9BdVwS7EV0KcFXfMrGA26pxFqW8aI7hDvpfBLPklhE2AYqlmR8GJ31c+mbjVqxX/mq4
X-Gm-Gg: AR+sD121mCuLYD0MYtiyHagdysqkNU9WNHRez7TESBZZagVDxaXWSdZU8lcRIhmNMor
	7D1rxckQutqqNDVAgxGmTzWf0WyhWSz6Y2IBxcf4D+pqfN1dlXpGTwYyHlQQhnxbOaNuIPREFXO
	7PBADJ29f2BTpzhnHH6f+/FKNDjLS8OXr7gNZsmvo+E9LnQV4thZlCdCiv+pgLe80EkoQS9HTVg
	hW9ob+fq18M0PAT//y5Ozw86mBtCigQ3t4AIs5OB7HTJox1y1MS79GH8/E+qTBLHf3VmfOgqdok
	+9iRG1xtOgFIP7ka0thldKi0W178gpBzlNfrazWemDh+FcXCOxvQWI5dHrKalyaSxYAdofebA1q
	inqg/AS2Hx2R0MZtggnHr1+o8uGaorCx77psOdwCDU1jfKBiuxYVrDt0igvZpR24qoVl225xi3G
	NKq8hqsbpy4QzjIg==
X-Received: by 2002:a05:6214:2d48:b0:907:c31d:dfad with SMTP id 6a1803df08f44-907c31de507mr8948016d6.9.1784722676372;
        Wed, 22 Jul 2026 05:17:56 -0700 (PDT)
X-Received: by 2002:a05:6214:2d48:b0:907:c31d:dfad with SMTP id 6a1803df08f44-907c31de507mr8947596d6.9.1784722675876;
        Wed, 22 Jul 2026 05:17:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6d8bd17sm3985571fa.38.2026.07.22.05.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:17:54 -0700 (PDT)
Date: Wed, 22 Jul 2026 15:17:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pavan Kumar <pavan.m@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] arm64: dts: qcom: qcom6490-idp: Add IPA node
Message-ID: <kdbo46iqmo2oxkdrjjkoumab7kveg6bmgijbqadi6aknzhuj4a@eo6ditkssiyy>
References: <20260722082314.1502072-1-pavan.m@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722082314.1502072-1-pavan.m@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X4Bi7mTe c=1 sm=1 tr=0 ts=6a60b4f5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=FyoPX5VLu3k4-qMXoUMA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 759O3KufkKmwII0Zg-i6IXuT0pEPZ8mM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEyMCBTYWx0ZWRfX7E43/abjo9yp
 GjBTfLZbFxZxaSnkWtWKQGY1WKIkXiqFYRT2VVK3AAeY0xsYdCd+NVh5Aw9K+mqScE9hstFDsYz
 n8G2IiJRyj4wzxRGc0zsofZ8iQcX7hg=
X-Proofpoint-ORIG-GUID: 759O3KufkKmwII0Zg-i6IXuT0pEPZ8mM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEyMCBTYWx0ZWRfX5FTCoQfPGlC5
 KXF4mUBkuFkZGdACUXCZUG9JHX9iwjo8mn6X05V5n6NDHIAm2N5C/TAD1N6xGis5v7teCVUm0sU
 4/SyVbWyij78kxtcTdXMmnONc4cWMRFVvxIRhLAhPcVzViqyJOy7mwLGBGlrRnIOwK9Od7eTy8n
 xdVWGgQ6zcFfxjZlCjUGVS6wQlmwjFJEiUuvd/zBpVzN62E/5zCTxrEsqlRkctHZEMqDbMAhAYF
 5JJEjpPbPXaSZqfO3n17gmH+/kYLZ6OfrqVlof7cLQ9yAwxI+YoSqNnNagtz+nMgfsLm2wMOOzB
 +Vv+1e6n+caqB6ZmJ+f+XLsZGXnnqBV2rB35aBUTVQ5JYKqNezeoaOosPCtHJWVcYeZZFOF/TsR
 hR0txGb/Xxn6Vlkys3OLddbr7N2MgmEaMiKnP2ap9M3GKi+Af8ks+1OmijbFbjQ3LWxkH0W5jfg
 DbAvzrW10WYkaABdXWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220120

> [PATCH v5] arm64: dts: qcom: qcom6490-idp: Add IPA node

-ENOSUCHBOARD, it's qcm6490-idp.


On Wed, Jul 22, 2026 at 01:53:14PM +0530, Pavan Kumar wrote:
> Enable the IPA block and provide the firmware name
> required for firmware loading on qcm6490-idp.
> 
> Signed-off-by: Pavan Kumar <pavan.m@oss.qualcomm.com>
> ---
> Changes in v5:
> - Reworked commit message to describe the functionality being enabled.
> - Removed IPA property consolidation explanation.
> - Removed obsolete Link tag to IPA loader series.
> - Clarified that the change applies to qcm6490-idp.
> Changes in v4:
> - Removed empty line between Link and Signed-off-by tags.
> - Added empty line before the status property in the IPA node.
> - Sent as a new thread instead of replying to the previous revision.
> Changes in v3:
> - Rebased on top of IPA property consolidation series.
> - Dropped qcom,gsi-loader and memory-region properties as they are now
>   provided by kodiak.dtsi.
> - Added Link tag to the dependent IPA loader series.
> Changes in v2:
> - Modified firmware file extension from .mdt to .mbn
> 
> v4: https://lore.kernel.org/all/20260703085809.2573214-1-sarat.addepalli@oss.qualcomm.com/
> v3: https://lore.kernel.org/all/20260702105509.1360340-1-sarat.addepalli@oss.qualcomm.com/
> v2: https://lore.kernel.org/all/20260618124700.2001191-1-sarat.addepalli@oss.qualcomm.com/
> v1: https://lore.kernel.org/all/20250304152133.GA2763820@hu-kapandey-hyd.qualcomm.com/
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Other than the subject:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
