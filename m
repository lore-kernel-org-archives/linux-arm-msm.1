Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D4943D4EF
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 21:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784669924; cv=none; b=XYL5TPzLC0XEXCaWMDrQbBgW+Avqoh/IaDOoLMpn9YAdRcG8Q1HCmoaMu3cNeNB8ixqSeK8kharimWsB2R1+S0Cp3yZt23vTe1rXIql/FTFusnoc/P/WI2n9EAGWcrWaLfpDKSmaSPP9S5wSFn99vFh1JaqdJuWNKpOlYW0XZlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784669924; c=relaxed/simple;
	bh=EtT7e63dzOBPFhgAOclhtALdVcyw/UGm0SBDkdPJCGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKMP+ZRFEAdvr1wwL5jydcR7auCY8SSwIeXalo2Q2gd2+H8ofWrbL6GMBXPsYqOqtFjzcLwSrx0Tyc1Dvq7Lr5GnItmdddNx6vuUMfH0mm5mNV5MsZ6v21ojpEUcTLRuzoCYcRKKvgPa1XEv3CgmtF+rDRI6jWPtPqrOp8/BXNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=INJ0GV03; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hOVx8+Hm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="INJ0GV03";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hOVx8+Hm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKlRgv3072172
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 21:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D5xA+KjeKW7rpWnqY1H+cU5K
	mx5cP/D2LQOc1tGnR1k=; b=INJ0GV032sUqjYApkoCZ2HnnGCqniA/knKb+MDvH
	3O7v3+EJ7GU/F0yZrElKAqSHpwLIWitm9/304nKGfS1h4D68UugY9JuDm43V2X5C
	uu/a4AJiyksxWVxrCYjOXGU8CI02bhb/go7NLaUCeCPfPrFEljb5GtUaAMPC2lAl
	6XopfC2Tkjt7CMO/+nlz6S/fF96EOS9KakhOTISONQGWxDcxY5ME+bxuWwSZ0wWV
	Ai00z0bA5GkomTYYjad3BDFef4LTJlRLVObFgnCxiNRd7CgcJOevHVVADGWOAqRX
	Lfe1AdBME1D6+CMArm0BySB1inqZJjLghwzRhKKmAVzF0w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3k3p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 21:38:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e538afe65so1988600685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784669921; x=1785274721; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D5xA+KjeKW7rpWnqY1H+cU5Kmx5cP/D2LQOc1tGnR1k=;
        b=hOVx8+Hm5MzWwB+aaR6+crZEBrNuYcUIM0DxcETSNKH8onWi3n/c/9nYtnlH+1pM/O
         Y/1az50+ll4xLoNGoO43ugBMsuJlO9n8M5dVBFR+AJXEOOzKoY9osyXM8M4OqdUqFgYJ
         jUvQR4kmg3nOAgHpNsppQbf1WFseCkGVQhavSv08oYW1gEsnoCXja+QJtd6KCxBevAJB
         ntiV/BrSvzVMqYyLlBwJF/pYe3k65w1l+yEU5/11SrJVdb/RbqCFIEbRfZ1E7JgbPl7r
         Vtz8RaMRbgu3eGi9EPv1t6d6w2PCxafXFuA3C+EoZl+sM5z4NXlRKltBG1M5GeU6EAgX
         Wg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784669921; x=1785274721;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D5xA+KjeKW7rpWnqY1H+cU5Kmx5cP/D2LQOc1tGnR1k=;
        b=Az6b3EaDC9MoSgnAqv33N8Nek03YCNUbl3kZC0KhM/qKYLyOiDmQkXYpXeNR+Y6bev
         fcdyxc+r8oxcXNWqy+nrB381MUcYEcVnPPHsoXSUrUPWlYIJry+BTVg2O+vi9bCXEduE
         h+pTbHcybuXVmgwkZGeD5lcjBjlECTM3XEM9NimivNRgy72pGC8dD0iCFvxMU1FLSbYl
         tNs3EwJkn5OGsRhlAEO9y76J9Gc2RrHFrPHBMdIl8hNFD5k3f1ALn+2JNd00D6LsvFE4
         ICX700U5F9ESp5GRRj9dgU0+jzb0FQv40w/2NWsHbV6gheDhFUektE02jF2RDjdQEuBV
         T8eA==
X-Forwarded-Encrypted: i=1; AHgh+RoLvKZBj1nK69q8JaAYUCXIeWC6oV5BPyxWIeLhC7i8Hn8Jhh2aNXNSJV1nce2VHH3RM80T8c4Y68rNwzhW@vger.kernel.org
X-Gm-Message-State: AOJu0YzoaiSw0fEsMSN3F9VgrtsnIkk9z6s0RmsH5qlGFWry7Nlra3KY
	/LC3XviOso9iQSEWsxbODWJhlHpy9aYrv1SFTIWpLiM5zpHxXLht4fMHKyP4AWj2QZfzdgVFhft
	b7lYiopYsT/oXfZjwPhBmkgbuXo1oQP9Ypdl1X23GUI/HBj2Dja4JMP/FhHmwysjNXp3e
X-Gm-Gg: AfdE7ckepiuidpF+DRYX47412BwY/tqHNO41GByz268K8cb04i2eUWYBnkDg3IGa008
	uecEgO0vchdI/xEVV+SK/RCxCRXKurebvqr9AQSfoNCgopnGw9atW3zJjFZ5ZfrSMyIfVXL0lKB
	LpmRxdaqrequE+QkoUoajqjl3MULZ8v4u6tUNRmtjesH14szClsi/PJJqmr8ZfD6hShdp01nn2/
	9+XamR/Ur+gebqol46MtvceaGtLLkxAjJSMf9scKryfTiA/5de40MyYBFpKFBRG0OoRsfhZzQhr
	+aUmy1qoiJ7IKNH/eT+OUrh39Qz4TwTb+GbqaK0gpzaB9CcFEWiSdZ8PVeJfd/IQIqocXokiK3l
	0tp7EvOEE8Vm9qb6TJxnsPaQb9zFkp+9fTs5bLvFPZZq5Sh4UgkX9ZK0hK1n42C+L8COgJvxZA9
	D0j3NRbqzU+m6+ww==
X-Received: by 2002:ac8:5e49:0:b0:51c:7b12:5fe4 with SMTP id d75a77b69052e-5213f373c5cmr200484451cf.80.1784669921391;
        Tue, 21 Jul 2026 14:38:41 -0700 (PDT)
X-Received: by 2002:ac8:5e49:0:b0:51c:7b12:5fe4 with SMTP id d75a77b69052e-5213f373c5cmr200484241cf.80.1784669920941;
        Tue, 21 Jul 2026 14:38:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8bfaesm133609e87.5.2026.07.21.14.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:38:39 -0700 (PDT)
Date: Wed, 22 Jul 2026 00:38:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Enable USB controllers on
 Shikra IQS platform
Message-ID: <gg6lvfdgvcyw6hh2lqz4uzqc67ezyu5htrlu7joe6bmkrt4qb7@6xkjm6il7bhz>
References: <20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com>
 <20260721-usb-shikra-dt-v4-v4-4-2e7a092d7f27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-usb-shikra-dt-v4-v4-4-2e7a092d7f27@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIyNCBTYWx0ZWRfX+UsBGOLXvEke
 bGbGkbYjHk+bLrW/9R1iRNS0oPp6Ihy/ZM0sZZoJCDIRVnHT5HbflHwdXeIamBBWPFbcXHDDLiw
 Nfk3L15q5cbpZPSbYUacnKBqGDHmpM4zY02h4hRA+lNBgh5wwpdMHXr/8upsRYbd61I7GGCvBIP
 jOt2aqmA5MUOZM+G0DzLSVkXTfsoVqr9+y3QHt2FPjAa/e8albxJRL2f0aOcgyubWOgm0d4vNqS
 lH+a4EzhoZ6f4Hlizf5g9M4N5Oo5qQHkIknwYmjVsyYdhTKtx1I4VuZ1neD+etEE07LkfyNCyDB
 E4tV/yfM77DtLO9nyzDHsA/lL7862EVSJtKLuSMBCZZN1FLOTm73/YuJAeJHsK+D312kHhkGE76
 ff0tYmmLR6eMjvY4PwkenkoGsppZTf20BOpFmLfNGasp9d78jQXe4OTcVTOcheAkFkin36aKi7/
 iMVyYn39f46IkZmHHYw==
X-Proofpoint-ORIG-GUID: HMOEJeRRNXSirYCqBrlXXOze906eaVLP
X-Proofpoint-GUID: HMOEJeRRNXSirYCqBrlXXOze906eaVLP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIyNCBTYWx0ZWRfXwFNLdrcKrrk5
 ZliK3OfcHNZocU5sgoG9cCAaihnqufDU6KSDWpqD1JFKHM+fzpe2Azqc0nwtIDV1q2uZCTjGYpX
 ia4pvAK4Bsn2qpsDRZLWuuBq1Sk1fDY=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a5fe6e2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=NKjDTbTdbK9Woghm1DYA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210224

On Tue, Jul 21, 2026 at 03:23:48PM +0530, Krishna Kurapati wrote:
> Enable both usb controllers in device mode on Shikra IQS platform.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 35 +++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> index 3003a47bd759..2d4e34ec3b82 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> @@ -38,3 +38,38 @@ &sdhc_1 {
>  
>  	status = "okay";
>  };
> +
> +&usb_1 {
> +	dr_mode = "peripheral";

Why?

> +
> +	status = "okay";
> +};
> +

-- 
With best wishes
Dmitry
