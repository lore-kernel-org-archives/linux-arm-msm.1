Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F241339EB5B
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 07:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853166; cv=none; b=bLFVV6T08KMg/dUxuPtDOffOud/ljX/mS3f4WTlAI5HLoEwyAnhTByAo5upEdhbsf8h1i6GtescSc8lGPEgKEe7tEUkmy9Qm8VhPluapERnODQL6ozUKjlLWnZnliMbUs2uuKQogzG+J8DEiBbX9QOVDfCQGSXdvwtnqWy9DT1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853166; c=relaxed/simple;
	bh=ndiQlkOabMvz2xRfex4FJpIVycP1b2hV2Ntdbd/KTmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kui+psb6wYB3d4EniECmtH7ZiAIgwASGPxYQZyHfbQxXsWXmKKjuvWTXuJO9tpZQB+gLRTJ+WtwOL6bb6OCod0lihvV7u6EAnpEhw4L035I39a+I30HdwR6N14CmGjUbVBhkpPTPZFlO7pBvueHUfGFFDLwc7XvW2CE/0tXrOVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XWkQPERk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZC8unHgk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XWkQPERk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZC8unHgk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886Lh9U1645915
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 07:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jnh6/unQ/9XWBJ9cydh2x/HD
	zEEBeHRIBD4szcO5/UU=; b=XWkQPERk/SJnvY1Kg6J4/nK3lXG04D+vm2X2Pu51
	nmZFWvjP17uighXN/Kc3CFy2U3G3h+ADg0xwexAID9uv368cqi3CGsBuqLylQBaV
	WDX/iS+owaGTSb5586+8OLJHxPmRHN5JU8LsXM4RvguUuOaZvJyNqz1gXJwgXHWe
	F555Nm21UAp0gpPRBqTbe/ze5h37HIoipbMPSXO4//uf6NVpd66CRmsNLYevgKVf
	mTV19pvzFTi5P9XOrXeDZzRnv73P19X4K7Kz6zsZ4IujA9ycHMdXM7Q1QeMiyOv6
	JxVbZmPU23wDlwM0gOHg/7SiBxzJ/ni9zELIVBDMsykVIA==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcvugbtn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 07:39:24 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b1c1538784so4310596eaf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 00:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788853161; x=1789457961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jnh6/unQ/9XWBJ9cydh2x/HDzEEBeHRIBD4szcO5/UU=;
        b=ZC8unHgko+pySsAR1fyMQq4hCjIiGOLLRoY3wzbL/iFXbT1zPZmL2xcG45rcp+dPJx
         /CaPjSBVqbaXEhoRyiA4/H+y8JUwq4/d/1ZyeUW/c2FHwPDIWYljfLpcNe/F1LJv8cT1
         UJkOK9OeH7n1yBkuDhuenlrbv3YHQQpF1uaG4z//DQhSffJwgAW8zrSKXVYopHqomxHG
         CkaWpY/Z9tQchGjZambqiR3RVG1nGLv1wSw4kXZMMiW2FT3ovn1pbEtmG7vPDVEFhZwY
         qUsZ3K4YgAorelXAzxclP9luQtmbxkuHkWSont5TFhnpybpy+jFaw4F9BWiPiTH5jknI
         tueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788853161; x=1789457961;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jnh6/unQ/9XWBJ9cydh2x/HDzEEBeHRIBD4szcO5/UU=;
        b=QBvDVxnp47IrgDMn6g9wKF99Fti95wor8I0pvYn4MASGYQ7RqQ5ItZ42X1oh00X+HL
         2TYrDRtIgLPYd3s+AK0K9S4SEnv21ch6vkdAHIpx3M57upQEsppKdMstDG/b3KAq/I+a
         EPcXXa2cCjaYygLNw0EvBQbf68AQ7XzoVnRpTfZ6oMZ6Kmb+2NhG7CkhDhinX0dFXlB2
         xnPVbds9/sLhPsW7o+5cnod+Mf3zemMfLPpxyRAQJaSvHQhYXjl2neQYwnVB0pJ1qTcr
         udCQ/16VutXVs3RKkfz9MANCRbGzcIRpaQlUsjOBpebQwJRogYOG4m/luUJ/7ZD5G19F
         YI0g==
X-Forwarded-Encrypted: i=1; AKwUvByAMylB/FVSz7VJoqcSOucmGiFgHaqTGexttiZvFJt+IwcJDItYXpdLEXK0rL6yw/+Qjg9SGt2lpl/rLEpa@vger.kernel.org
X-Gm-Message-State: AFuF++nudj9djZRDqbFm6KgyFv22laKOW7X3w918drHQyAWgURbZ3pkM
	8bHUJ4Z457aD5Ti/9c2pGvs4Ju7kjHA1zJFWIb+YGWYKTAX3vqIykqVUSYU8aeO+NpspRqz7AZ1
	E3tgahJgOICunbQlXiPWglebkAVwtR2CoXIvdo8HwBKGZZDIXPVfNFrdiIzD4XrrLqGzT
X-Gm-Gg: AYBFou0j3RWl5ZQP2BP71o4doL8RxzfA7zjGQDERGDxP1B7uS8tuLCi0gDqIanE5cEQ
	s08rSExMO7XtqEG5JieEvn48CU34VmxFDFSmUsE/MiVdSLXdWi/aCHio50sRJCDIk0BXsdF8W5C
	k6KR731AeDtAFlVWEt35dZFtroGBSvpURwTPX2mLh6UGuhx9L1EnhZWYb8T+ShoomEYSSFhXxF0
	F+yT2FARHcUsd+Vf+5Hhr0CCGeHD3AZ+ILzngnIF8RWAXTR0rn1vcVNDdCqucZGt+8f79EYIzN5
	3J//2ii9cXVJZ5UDLIVayDHsWFJ2dw7//w5+Y0Nri6/do8foDaB7CLlLKK5JHPg8qLmvp4L0uWO
	y6RC7Tk2tq/x+8w==
X-Received: by 2002:a05:6820:f034:b0:6b7:46fa:16a0 with SMTP id 006d021491bc7-6b746fa1a27mr14489627eaf.53.1788853161220;
        Tue, 08 Sep 2026 00:39:21 -0700 (PDT)
X-Received: by 2002:a05:6820:f034:b0:6b7:46fa:16a0 with SMTP id 006d021491bc7-6b746fa1a27mr14489613eaf.53.1788853160705;
        Tue, 08 Sep 2026 00:39:20 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm29571562c88.3.2026.09.08.00.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:39:20 -0700 (PDT)
Date: Tue, 8 Sep 2026 13:09:12 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH PRELIMINARY 0/5] arm64: dts: qcom: shikra: add Ethernet
 support
Message-ID: <ap+7oEcW6GONVdEk@oss.qualcomm.com>
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <e9388ffc-ddc8-456f-ad7f-1d185d35ab69@kernel.org>
 <ap+zd/2QmerMwi0o@oss.qualcomm.com>
 <c23369fc-84ff-4881-8327-c18fc3692306@kernel.org>
 <ap+3+Xhq6ygnPzQ7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap+3+Xhq6ygnPzQ7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ePkjSnp1 c=1 sm=1 tr=0 ts=6a9fbbac cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fpx1x3OIhUlXpLwz0nAA:9 a=CjuIK1q_8ugA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-GUID: ABH0p-KqWb99i1EYQnwh3MiqF4BPio35
X-Proofpoint-ORIG-GUID: ABH0p-KqWb99i1EYQnwh3MiqF4BPio35
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3OCBTYWx0ZWRfX/u+5KL9HSZj8
 E/fsiK2y5WvrORr2BP3gEue6r2/gXk+eIETYDOIcft209Mr41LKnlkpuwcg3NEo301L3uopb9Iu
 ik6s/i+2cLXgm/Xtoyfy9AqttOgetH53xsXZCQ10FZhj7CsMJT6QjuPuiZmDA/haUpUNWefxgHD
 DpXF2VAmgMO+ZNParZC8trvbbVGTsm422JjscrC5uvfKJDRZ60JGjGmfcfO6k+n7W9v+yrbU9Pv
 a9o06ejWT+j5G9L9LAVsWeYIIJz5EFmo2Ah8laI+xF6wg4pruRFJxOpov5pmihitdHLLM52etTV
 mlD6dKOdGg12vylyzPeYTsBlKNOIAPU7kQjT7zu8l18V4H68mMBRd08kO3jumQAvEzsKT3TLegA
 033k2jjljrw8P14nACJXjHa4OHWy8f2IONUzSPBLB7XWklUkUuReB6rLXtDxAvGO8m0phgXVBZx
 NmJujpT/MCxY3747+qQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3OCBTYWx0ZWRfXxdHDJsof8GZB
 zm6Y/nDj7xLuUSlBoE3gUpJ4Eco3IO01UkUgOqqxOYjfpoFgv9RyW0CUM8ZNrRvz3KRylvHqiYX
 xrtcTiQgpCLcnAZ8emgTrCh7iCSjC58=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080078

On Tue, Sep 08, 2026 at 12:53:46PM +0530, Mohd Ayaan Anwar wrote:
> On Tue, Sep 08, 2026 at 09:14:45AM +0200, Krzysztof Kozlowski wrote:
> > On 08/09/2026 09:04, Mohd Ayaan Anwar wrote:
> > > The only reason I added a PRELIMINARY tag was because these DTS changes
> > > should go in after the driver changes and dt-bindings.
> > > 
> > 
> > DTS cannot go after the driver changes. If that is your requirement,
> > then original work is broken and needs to be fixed.
> > 
> 
> I should have worded it better. I am only worried about the dt-bindings
> going in before this DTS. The driver changes just add support for
> whatever we are desribing in this series, they can go in after
> dt-bindings and DTS without any issues.
> 

...would it be preferable to instead have the split like this?

  - This series + dt-bindings (on top of linux-next)
  - Only driver changes from [1] (for net-next)

	Ayaan

[1] https://lore.kernel.org/netdev/20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com/

