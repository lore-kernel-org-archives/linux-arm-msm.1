Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1E0400E17
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784657939; cv=none; b=Xd4Y29BRTIt82kRHlnqTTGAjDOfLB5XBco4FddLlvfpj0jmojS+mU0pmF09ViIfYP/0neyWchrmBov8SXFuVJ9Qi8HZQCfzuVvNSClTShopB3Ib1De/CXeq+lwSrrD3fBJg1bwbH3pJF32ebvEadg7Tzy/E4KQeEbhaIA7w92rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784657939; c=relaxed/simple;
	bh=CU5DqXpod4KJ7Wm4KtKE3f0aR5l8Q52YUf+L785YDhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6SVXNwEPAHCrg/Wk15mO0ntIvuTNb5ngs6kBVFJSmbG3nj/urvst0eZYJhxMxNJmYI5RAl5GiWb0f5M+bCke32beqY4vF5kK2cfQBnwv1sJQs0N3tD3YOV33lWK4oYLozvVModklaQ7iKK+om/4pENURhbP/thU6qU4u6vlX48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aa9dwQfD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L4PefQVM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aa9dwQfD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L4PefQVM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LHPOOP2115608
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4QBS1Lbjs3T8Bi8cwftIEYn+
	AAPcSxijVVdaZ7ikGUg=; b=Aa9dwQfDhcfc0r0EcjH1Xr3an1xQ+QC34uzc2ekz
	CmiTn907Igw+JrtVbV2NiDLgtFLn1Sev3arqXzpS158DGmPt8IgPbUxQid3E4vV0
	HegiAZFvCKlS6OxqPOZPGlvxs5yjxi5hnq2n6fltX/WEl+Pg8ljHPHBydu/e8yaD
	WLZ52/1TcJRcXCFgt1laSsBD+ddh7Ecx9Cs0qOjX55quWGqxyf2EeAgyZLMD5hyn
	Q+gVjv0JNxan8+FvnbIQhROHLuHbLNNLal7piX4huO5WGXuQFCFMialWog27h1S2
	9E1nWVhBOM0ARQUK16gyIUZzRzycqsHEjFXEnG/ig9kJww==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e08ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:18:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1b4d961dso94799881cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784657936; x=1785262736; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4QBS1Lbjs3T8Bi8cwftIEYn+AAPcSxijVVdaZ7ikGUg=;
        b=L4PefQVMJLRn3Iwo/GTUlJ7X9ZnUpyszMNTWY7h1wczFHNvWo+3HrtG1hB5IcUMoD6
         4pb3lWghGmV4bkYxkLSIUVR/7+AUilyQk6ofyxvqmxONcSoKGjl3WHO92MQTFYzFUk6e
         7VY0LGD4Jtz0f94F1rdicIe4XQNPrPH40Pn6yOfoMXpmdmYMkgJUdXvutX5P1AJVqKNy
         srJB8EmR8l5TLBencGMshYIDShDVZes7M9+YvdrvOIV1AAGF6SjZLdYiMoGovCDnYsQz
         y5qGxAfMN6tLEwPMSeJoj1l2sAV/o8yrCN1hv/f3f4noDCPQHT6Ca7/48jc0jMFEqyAt
         q55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784657936; x=1785262736;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4QBS1Lbjs3T8Bi8cwftIEYn+AAPcSxijVVdaZ7ikGUg=;
        b=n2OUsNavY53oGmgbRIFDUqzQ2yTRH3Ij4a0kGYvJ4tpd1+EHnBT91kc4qjtxZptP5R
         X03c1yUxil8yse6NymMHyD8TCYO6BiWZZMm6zOJM3HTh+8YE4pog+99fehDu/dd1j6XL
         ebgUt2V4H+TPl+L0UELcb9fm7mTknvDO+8AKI7YoOdwED2MsCAylVaka80OAl+ffxTQu
         G4E7+TP7JyIDjRenTHSVQl6gaJRCABYujB+tVNU26FkNGpNpegKfBt64tVc7U+Wjs08f
         Q+6h9kFl3x6mW58v9WK2nylLZ60BpT1LLgCawjv+VKnwhlTURpoYanz8CogLJjA4eLW6
         Lpwg==
X-Forwarded-Encrypted: i=1; AHgh+RqR8v2Lj1H8c+hWyTgbI0b2wtXtDvghTM+UstAHYBgNmYwkKHSPvozNilfVKtGicNYQhj8TB6z7F/3EoYSe@vger.kernel.org
X-Gm-Message-State: AOJu0YzuLSXOSCXgFFzq8GikMYPSbF8g1/aHByUgeITxslrFeGa1QIhG
	o3bCiOOzfIIaI6MZ8ICNgl1wBnY/EY1sPhoYs+8h4MKrqRDODHIvQeYie84UItkW+SB2ChQX/24
	DZDDfBj2S1PY8G0KgLJgxy36SPfphh6fB2E9Oq5QPsVITtKgz9uI9c0s50GZjRG8xZRfWgvWASi
	v8
X-Gm-Gg: AfdE7cnEPnYVTDyNstriA/AqtAmJmvrGOqyzm/vu+6LwpPF3fngH4g0cmD+Y4i2eiLZ
	dbYYThAhPFbC6Sq4O//T++oKHoLg6JEv08KrKYwcrDQXHpviNVqnKcGa25wQS1Eptbm8GoacYkV
	lQNh3D7/WxuGqJTgkm936lGslrgItogS392edNg7G26HSRu5yq0eCuAUQXzaC5GgxAUtj80/Ynk
	isxvWB6/1KXveDwf5QymnXtUgP6i4RnVDeU0vhRcry6nemzL2SBgdC01ghnTnRzNxXr0tUhVduH
	c+WL0FGCih68d23YJoI5uBUcnKKpDER5YGjweIaFDQCMnB0Ng35Ltnh/q1s0XOxFoRcbdmKeyL0
	042UOIPmVi4JrKIwo2P8PxHetymDtp4LDcLWUzncKMq6Kcf6tSeH7x9tMcBkDwOizCfLMNtbKqz
	jcnvUCrAx5ltwjcQ==
X-Received: by 2002:a05:622a:1c05:b0:516:7a83:8c37 with SMTP id d75a77b69052e-527a640e6eemr9783141cf.11.1784657936569;
        Tue, 21 Jul 2026 11:18:56 -0700 (PDT)
X-Received: by 2002:a05:622a:1c05:b0:516:7a83:8c37 with SMTP id d75a77b69052e-527a640e6eemr9782501cf.11.1784657935963;
        Tue, 21 Jul 2026 11:18:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b9ac81sm65135e87.21.2026.07.21.11.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:18:54 -0700 (PDT)
Date: Tue, 21 Jul 2026 21:18:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
Message-ID: <nqxbpcwxwastqutkfkaqz4o2telev3lixgrdlmb6anftpywjog@ibfxfb4e42xd>
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
X-Proofpoint-GUID: 1N0Rg9xOeA-ltcO4qdMU8UlefQZqriwO
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a5fb811 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=HlDJ1ZyWpHQnnzQbUF8A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 1N0Rg9xOeA-ltcO4qdMU8UlefQZqriwO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5MiBTYWx0ZWRfX9RtfJ0TOP1pF
 BHwUDtwdOjaJvj2NjpoM9U/K9MgjNkyGLseoPFtdMtrYhQoGeNBIUocixC6qWRtazIntFO3++eE
 yIPjdA9LTO/lhVI3ZmduOs1pYfKtWW5PsFljiKF0ePpNoG6O6j+EEogfPxckvtxcOGuya/dMoS7
 p7dx4+jroC7V1KpOkvmbCEcQR5yBYDq4r3o3KAcd6EtHf2fS+pFbtMCsYtUnJKfJ+erhYx6l/SA
 LpJAuBkPpTCesVpEHAp8hVfDNpOw5oBKJbScxXmEivBpL5LqV+exIkPk9NSAINPrCfgfumjvENA
 ppLtdMGjTMUKLr+5e1SlQmPwjh6IHeS+2O6YcUw8pUjY8BIGKrh2Hr9MeiFLjKCMT1a55S/RPG2
 iYZHEHpwWxvpdvwNXmbe11MFMG4j+rtdqpiLzjm5wI8gFjUeSNWW0Yx6CHdEapWgKdgMqeCK3F6
 HU5H0a2ONtQ+FW+sQDQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5MiBTYWx0ZWRfXxD1dGD9eZx8Q
 PmMROO4Rv3Ys16Z0DDyk4UbPpvL+KDz+DDKbJxnWP9IS/DTk3cUjLpYQXNdUpToQgw4vfOfPKr9
 8BlKGKYsKMZyURSEPTVJFPv+uzMHSTs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210192

On Mon, Jul 20, 2026 at 04:43:53PM +0800, Yongxing Mou wrote:
> Kaanapali (SM8750) and Glymur use two display power domains.
> CORE_GDSC powers the main display hardware while INT2_GDSC
> powers a subset of SSPP blocks.

I see that INT2_GDSC is defined since SC8280XP / SM8450. Does it need to
be enabled on all those platforms?

> 
> Allow the MDSS bindings to describe both power domains and
> their corresponding power-domain-names values.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/mdss-common.yaml        |  3 ++-
>  .../devicetree/bindings/display/msm/qcom,glymur-mdss.yaml   | 13 ++++++++++++-
>  .../bindings/display/msm/qcom,kaanapali-mdss.yaml           | 13 ++++++++++++-
>  3 files changed, 26 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry
