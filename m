Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC07218ADD
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 01:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786930513; cv=none; b=H0DWgBLrBcPa1AbZWbBgc8CyctqUztU3kggBNqymPbOYulpRfNO9dIQH5NnJn8r4YTYZy893GyaYdqoUN8GQi/wsi7Z2iFbLLi3kssc5/s61jAtUW/oSThGlHt60FBu8qr2SNdzfr5cSpopt8VDJHW5107jcIusghTJcAYzySFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786930513; c=relaxed/simple;
	bh=ebkW9UfUH9F07rXyIwu31HzNjXAR+Y1CE6VkFciW4r4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UkCBZdVhrfCP7lyChsoPiBHUPaglelPmeiL5t5XOp+FTcPk4dQaGBr+rNtB9K1n8WoqwWjlprfyYXMjjpEQteONYcrSfN1dGOKF05G2DFAnRS+Q/awUPnfJ6+k70gLdiFwUTQpNiJnvEhnKa9jDsfockmjpWKYsFjt2d3ak9yJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JE6uf7PK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XZSaq8ri; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JE6uf7PK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XZSaq8ri"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLCiBB343123
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 01:35:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N8sTXhZEGzAhuFBbJOsyVHbi
	Ug2T+wfCrbiWH5+ncZk=; b=JE6uf7PKLHla+DnaSl+zAmTXSKdQyfm6zwtn1fBh
	8nDyN4WI6OBNguQ8zdeqvCpHIKb3TDdN03E31v4MYLnLqCybdRl831lVytJoVls8
	JY8zSFH77HSWbpZow5nM2Y7hsVoSaeRm/ve4EWmp4e8434ZeBw+1uh12GXovQAle
	qk3vOVfM7cwaUkJ/wzV9yZEH43xhierLGtqJjOj4HwUy1vplbWkNfeOQoTzUg8fH
	KFhbx5LZYCtKX6c5E764zkN8Tdm+WZN0KDuXP3xsNYRPPQp85zhbfaztM6r4oSCa
	/x6ryBR/N4A4+86TEiBqvQRxyJOEn65ME/KhLpvgNzdc0A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghemtwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 01:35:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930b571432fso274527385a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 18:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786930510; x=1787535310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N8sTXhZEGzAhuFBbJOsyVHbiUg2T+wfCrbiWH5+ncZk=;
        b=XZSaq8riqK/bC5Xl/KeQ3nRKIKbdG1HbR+/QhP1+AM0r//2QBaTy+NtytqgKOlgW2K
         Y6FAGVlTnu8WsZ5Lw28LxyEnjcUwI4wX0fK+Brosh6bep8GIn0QOa8lnuoBCLZ1iIRt2
         yJu7Ka7hp73eZx4KkJt57jt8UBEE0YyWRNPlD1axCXKOuFqE9haj29ePZLPjA9jGelYQ
         UHDeDLyTtkWzcPBJRPoykv1GWrLQmPv4RdYsEPepvYFGWMjkTY3dn2qz1b+OV/jlxobz
         Knnl5xLcyrd8ykBYD4XVJmj1pzE9nbLOIg5ON6tN/RGwD9k3wTZicvHkvX6bDhgRrnUy
         AcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786930510; x=1787535310;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N8sTXhZEGzAhuFBbJOsyVHbiUg2T+wfCrbiWH5+ncZk=;
        b=rSoe8bGW0oQs6Sc67X+F+au9imCrY2C7ZS8YvN7Zys+vu2Tj8ppubPMX7e81C2vgcf
         UvEDEYNy6RMwk6Wk4utnXVzvFhQPjObWjIWI/n2F3eHg1L0zGiOo1HJXonxLkcDxiITS
         18cmfWlyAJY64SJKaN+h81NPDWjJ9N02t4sKLLmDb40hO03Fr7g1ZH0isaPcTynIKn8t
         OkNnAdoyJGYrQb8wg5h+4ZbUOjQkL1FYWqtM46/f6aoSxUsw5Gt2QdSCTVpy2EM91Iqx
         8sLAUcgQioE5Tuk9hppZt2XuruK48zABVzuD83ZIiFQ3gj/21qzF3ZJhJ9RvuOvu3myK
         jP8w==
X-Forwarded-Encrypted: i=1; AHgh+RpqDbua6ieT8LBN45LjlRdJ5J8NYISuWlyK2QiAZ05zOwXQ28mK0rlkmO/jIcCakosy2TJ/TK1V3Zv7y9X6@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm4bacRJaedsq0ZhTQmeJwaMPkZJFXDXrkwNLNJ5Vn7UpE0zpA
	iL67HjSr70qcARZotamwmoJhRAJQWVATwsoLpqfz1q71JGFbH68c6nWVH9v9Cb4ZjugmpV7mo4O
	MUQ1RoQBd9hJAaKSFGqVrt9hWHY78+j5rImVLVZ3WQ3SjJnpnalP9CyRfssiq3Jv8jOxa
X-Gm-Gg: AR+sD12hr2QP/AnEYuT2F8DCmp78CBcWqwEQj/TmOvgU4K7GzcrmrjrVqYh1rjXMIU6
	igx5OMiomNSDLWSqFs3HsamRLl2CR6ecVo6D0gYXxb6Ps8vCKDWgaJBK53DjkSkQKeYiD1ARIdS
	2ZKNnETnkSlVPjX4bfc7TLJ45tYqi/3KrsbGE6lBca74qy6F4hYNTc1oeQhaFDUfrh0re+t7UEN
	bMFLXAh6n5Jlkqqa54OqDjxnYnpRDYlYyoKJxIw4gcxRPWWc0qZ0h15kns11NiwpUTLaidL0m3i
	fXxCCmidwrgj2OQW+PEYRWCcoUOiMyOmDGpNTYHVup5DH9AZ8xqTMrCjWCHBaRPH8YD1Ev16ZYF
	VIp3Fo0qge6fGBjKqXikMogTY8xpLcbEpw41IQV3V9w7h7VhYN733dVcITxPVDeonWboG3UdGaL
	tL3Vm24suDbaTs
X-Received: by 2002:a05:620a:372b:b0:934:ac0a:8bb1 with SMTP id af79cd13be357-936cfd6823emr1951787285a.8.1786930509744;
        Sun, 16 Aug 2026 18:35:09 -0700 (PDT)
X-Received: by 2002:a05:620a:372b:b0:934:ac0a:8bb1 with SMTP id af79cd13be357-936cfd6823emr1951783085a.8.1786930509356;
        Sun, 16 Aug 2026 18:35:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b0e1f18sm177241fa.12.2026.08.16.18.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 18:35:06 -0700 (PDT)
Date: Mon, 17 Aug 2026 04:35:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_tdas@quicinc.com, bmasney@redhat.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add SM7250 rpmh clocks
Message-ID: <am4d5oar3c5fqnahzdxck2qdvubrragah7s32gcqhcp667fr5z@wxhkekuarsl6>
References: <20260816131646.10551-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816131646.10551-1-sreeshankar0910@gmail.com>
X-Authority-Analysis: v=2.4 cv=EKc2FVZC c=1 sm=1 tr=0 ts=6a82654e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=RPy-Y7ChLrGBGpb54VYA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAxMCBTYWx0ZWRfX9E+HdPtHyu1O
 QO3JpVO+ea+KxB9WMkUfna7J3MA1ivwnrs6jkUzrLQcFS6OaQcV2YpwbalC2AvhKpOTrp6PeASk
 eOWvv61ORAAZmAEVomAl4ynkzx1u8qI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAxMCBTYWx0ZWRfX7io8Tduo3TD9
 aI93HcF4AZABwqYXAtQzR0tthvmlJ4MKzFJVeyWMs65GeeIM4lj4cGDq3AQoPZC6ymbwsG/ioYr
 /J1RcC9LVmsmmfpeEkYRAnDh+pos6okoWHb2DPRGaYx6A42VuKstO0OpHtmOanPZ6Bn4x/W31L5
 CTijXiasL5oqOFx4F0oDb1Aehfddx80kjzFuigqQNBNGdLMstTbswcY3rFfBEtj/F4kk7WZYx+5
 bvO0AOZfZtpd7AY6L/JJziwa4uCFBWEXLpvWRlfbYO7nrvVK2/26Dq8LVvMSgdRmyMQobdpez2G
 Od0jEs9tBLU9BaNqwW+LQcu7MqHS/CNwC9v+tLlsv6991oQkXf6GgH4B+x5htFzrisSCxlSqdU7
 9GTOq9XZ5CxCtbX4Iqym2Nw1guGCBA01fI2oYIoLnCOukPqzzO1SWfQy4i05Umva5vjl88tCUTN
 ay2WgS1jOfDSgv6857A==
X-Proofpoint-GUID: 12r5FMt0DeURHVACg05_Ixq0nRfgw4kx
X-Proofpoint-ORIG-GUID: 12r5FMt0DeURHVACg05_Ixq0nRfgw4kx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170010

On Sun, Aug 16, 2026 at 01:16:43PM +0000, Sreeshankar K wrote:
> Qualcomm SM7250 is known as lito.
> Add the RPMH clocks present in SM7250 SoC.
> 
> Sreeshankar K (2):
>   clk: qcom: rpmh: Add SM7250 rpmh clocks
>   dt-bindings: clock: qcom,rpmhcc: Document RPMHCC bindings for SM7250

For the future reference: first the bindings, then the driver, not the
other way around.

> 
>  .../bindings/clock/qcom,rpmhcc.yaml           |  1 +
>  drivers/clk/qcom/clk-rpmh.c                   | 24 +++++++++++++++++++
>  2 files changed, 25 insertions(+)
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
