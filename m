Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F55D357CF9
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727932; cv=none; b=u5Np53rdIrWTVBgDHZ6B1fj6ZocqvtxF5a+e0mcpIWeYTjDK8ZKoH0s5fTFumAZevKPJaWy+JmutMDDZ3D+wuEedgOyjYmIafRTaUqQLSWj5eXxMscAtyRe8jp1Ey/2lovSKQi1IiTY9y+3Wn2h/XQJN9XysMkfABig8JWQkRyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727932; c=relaxed/simple;
	bh=paG+iWxysrSOpslrh4rSOqCKN6UNGGbeb3lknWMvHPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mTO/Ui5gyaSO2SfU2y5aioJFVs2y7Tmx8EIrioTB/tPJnNOH9FdV/bzJNrgJ83eyOMvHW70MlbvS16QzlSI6rSGFxsySYaeT84lC3lJbUtaA1FHJypPNMW3vPv9Qjfqq7DSOYvOvvlXobYW7KhI9NNPKdRBzHKvXcJHwKXhcPuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m7AUa+s1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BTaUMMky; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m7AUa+s1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BTaUMMky"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWSxu445318
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dzTgcV6aGKBlGU956yU8LpsW
	tJh49NRiC/iioCtnUKs=; b=m7AUa+s1O38PGR2cVgic6D5tjjYwrJw9fHpuZ505
	tXdV3uLeVvkvMypAGTAfQXFqooPSrp23nSVXnaB0115aI2cHHR+tGp0e/uBd7Qgm
	6b/09c6MihWlyvfuVVtVZsodf/5yXSKRFRMP+3NnFH0ARjnjp8mMdfIS+FGkL8hC
	9NWny60dAFKRMJv3A5s6qXWpBXRaAfavcco5q9QMMfBio+RkgexfglO9/yPpyhzR
	pTCyZcGGGKvw7wKSa9c90W8wtgyMERqhevSRxl+OipBXVXfXmhAZ2fgooA8uE4SL
	rRVnosWUn73qIWDiqdd0ucf4ShLrq1tb20QtSGSmcHl1QQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjxmgg3e9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:45:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c110a3b6aso147728761cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727928; x=1785332728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dzTgcV6aGKBlGU956yU8LpsWtJh49NRiC/iioCtnUKs=;
        b=BTaUMMkyMInJgoC0Lo6JSLTJsw7BEsUwDVHbz+ZcV7Dv0GXHZ4XxDmdyEMW+JtNaoO
         YtY7/+hRqunrOoNE9KNjPtBTSVeMZG6stl3AQfoD+us7VDvHKY4Juaabn6iZC8CeD7o3
         DeYS29X/9k/eTWoqltPIJzYtTW9EeCAZA+ad2Reid3Cf/qJAuEGLn7RrtUVX5qypnjQW
         9UXWqy2frEdSJPzJfpU5jYNPG7tNzXt3d0m8/15k2BcdMLlvPkvPXAcxsa1DKVIbSCdm
         nzT/dr7OnaM/x42wLQTxEm62g5F+MlTlo2z3Wtm5ep4aXcjAMbDXVD/0twS+qOd/Xi/K
         X+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727928; x=1785332728;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dzTgcV6aGKBlGU956yU8LpsWtJh49NRiC/iioCtnUKs=;
        b=Yv3GR3F4O80+bEUNRJlgX/Bolc9r848Wb6mDtqAz0HTfyTsJOkgKmFjf44UMctNKA0
         lro9X9oP/2E85/iDI0aRVdemI/WYUwmXKczEXIqGBS2eVo1QrMxqCQkJHijs/4Q9krJ8
         UDGRXer/qTdTPPzjDiDPseuDNz4lPE3FQ/h65zGWoFGZO+2k2icBfeBh2cQ0ngZysrD7
         pd/XXKO6NQxw7xXwkg8ZA4QRaI/CT2RUxiOzdBMkVVVeCe7drSZgGUat9toHO4gb9diY
         fDwPi3b/oZ6lSR4BV1YB44f+VtKyHF4q958cZrYKzO129O9Ord+toXdyW56JsWjirnAo
         gYTg==
X-Forwarded-Encrypted: i=1; AHgh+RpiX8ciHPGBTXbAHGPqevtEbEn/bfEWvymjw8OnNPxHI+UgIM2B4F8SfQ6kdb9dHj+kdGMiUhI0qD51moLD@vger.kernel.org
X-Gm-Message-State: AOJu0YzEWx4g9J3/tWDYWrt/RLa9+atMvDALu+p2yrwGdfYgQH8/GGLe
	Q8fbluwGX9/A4OUhsPSxTXSOp0SOJS1HKKH00GzY8QE/mij7fJqAetjNgB3TCF5Ilft3Xj7fYnN
	nquOiC+krLk/zSBhVzR0eg6NjCxWLxon2c1rGezJIQDrVqMTgzVBC7DBwYWdmew7cq7YR
X-Gm-Gg: AR+sD11wjkZt1jT+cBplEGIMAmUqTI/ro+vVrEoh9/sIz8multaRU/2yFWJRhGf7x41
	Q0tREk84ceQALq/18/AFsgRWy5v8aqGznZiHhDlWcRJvIDmFpTM69kwwdob6XeXyrEwGI5snI46
	B2Q+f81wUvlyw8GmFvXhJoQr72YFINLgeRkKXcYPX39whwZep3iVAGJ02CowfiUzzNie1yhSibT
	vCl4WSGztWZexs34mqztI1yMyaPIPELhtI8/KCXj+xdQk95KLHtmN2S2x5KiIReIbwqotaWKdmp
	4i9pMlS1FvLl4qWVWci4LTvz8Kc7wFKaFuGP9UxKuMe13x2ePFGd7spQEEYPRAb/MIIYc4elTyq
	4JrxyCDC4VQomSzgM23qxDCW/ppkIk1tZ33PPsyP9lUcjuweW+BZVUXy8L65KshXhGJ9FhLFnz8
	gN6w9aOTNhNMT+2Q==
X-Received: by 2002:a05:622a:4d96:b0:528:3377:c2fd with SMTP id d75a77b69052e-5283377c640mr15418181cf.83.1784727928284;
        Wed, 22 Jul 2026 06:45:28 -0700 (PDT)
X-Received: by 2002:a05:622a:4d96:b0:528:3377:c2fd with SMTP id d75a77b69052e-5283377c640mr15417731cf.83.1784727927823;
        Wed, 22 Jul 2026 06:45:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c0a9sm510523e87.17.2026.07.22.06.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:45:26 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:45:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: sdm845-google: Enable PMI8998
 camera flash LEDs
Message-ID: <bmoq52hoycfks65xplep6ggavilr2xmz74njgfn4wyufl6vlhe@5l7rcyyb2qgn>
References: <20260719-pixel3-camera-v4-0-48cab1236852@ixit.cz>
 <20260719-pixel3-camera-v4-2-48cab1236852@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719-pixel3-camera-v4-2-48cab1236852@ixit.cz>
X-Authority-Analysis: v=2.4 cv=D+V37PRj c=1 sm=1 tr=0 ts=6a60c979 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=TWkwOYXMJnNHLyErFSkA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: FWerWJfMkdikpFltKIrDd1vL4wh-OvV7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfX4W9gd1ZK7IMo
 x8Qu5SjBKnHEXmkl4grN7JSEsF2xTOdTaiE25iU3BDlteRShK0YWGbnmABhgKtSkkPUS9qx0Y5q
 Yh2Cf0kUCD3RQubI8h0qdcdm7gTzzwQ=
X-Proofpoint-ORIG-GUID: FWerWJfMkdikpFltKIrDd1vL4wh-OvV7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfX2C2cjBP8KziW
 CP00Gx/YswUT+8XagORClubQ3u3eISmyQlZdnZ/3LeMOXqIcZu5Caga6TN6CFItBAQU5XMM8fB2
 Gg5SvQ18Zv4wDsOZfzXybDMQRHjo4PJfDYKH0jsXrsAhCFAbSMPfILbj9qVAXZU0jdr8cP2FgG4
 4Oj23uT8m2KDVz/CIZEBavUXNwPVhX0ohkxmQz79wtEgXfULTwIV1QAgFJipiBesY0uynhxmCAI
 5aOR0CfgHZv/Gvegb/69i5KC0XibB/uoiZAeDqENeQsTNIz35d3FSuvwVxgBRA85kRoo+P36aow
 awk4rTtvS1UXrKhDuoXzS3RzhS1TNg0fRUs8IVHngrpTwmhahYuWxc4Z/vq7H3vxYIoFv05xySx
 7L4fEg4adrvwyt8PiRYcGxVQ7ZmuDkzA1IhjeVsPz1OUfxr+lWjHusAQo80hsEDP6/z1C7LVvES
 XhuPdaX8+TN0BuLxC2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220134

On Sun, Jul 19, 2026 at 07:02:00PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Enable the PMI8998 flash LED block and describe two white flash LEDs
> used for the rear camera.
> 
> Configure the LED in flash mode with hardware limits matching the
> original device configuration, including maximum current and timeout.
> 
> In contrary to downstream, we can control both LEDs separately.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
