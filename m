Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802D43033E6
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164622; cv=none; b=ik5KfaEC06DoBlPaot/7u+qTi3F+EG3j+RZy0aqQDaZdAtxCaoETMYwt1USXjQVyVua93OGs386z7iEQfoWB1l4vLBtzfHkn+mRdr9qVP6n7Pi564xyWOKm2jCIOGC2cklJLdopH9VBDWajG6EwH8Et/OTtgOlIKBN11twPfW7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164622; c=relaxed/simple;
	bh=AEOvwUN1Ko3LmIWJSj820o0Y48vbbeYRsjRj/3Bz49E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdE84UyUrgpGAfWytpOmSJ+yX4w8KJd7sPsf9ovtlJpehglKepvaIJOyIje4KyEvtBA+s9QunwWrQWuzRT3j+QiN+6OkTTGKTwr3pFsWYg6+yxVGlTbG0+K8ocaBobY3IUMS1yeeYqDfThX7lePYQARIJ8rXr8ONki34LCGAx/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KVzgxPxv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3AkMa1e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KVzgxPxv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L3AkMa1e"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbdJI3414037
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eaE4ME9RK4KpAJCqBvh8UgZJ
	nTLKzekG7ESrGMeYrsE=; b=KVzgxPxvJSpTvOp+zdnJM/Dwev12HUz8rCIg3QfT
	bTMfG934vXTG0EFNIFQqbqiWUrW8JQXuOqW9pRjmMBTtmj9Um86WyxU8bfafZUT9
	xBdwOcmUyyU9x/qdY1AEwBqNFdFwWxpWWt2wJH+qF8cZtaG8Ni8DW9blbk9FaIOX
	CJAvoZoE691cmEbSVvVzKuVnLmP/xWgMrIn9bOA+Cha2a14/ZngSMeX0RwSoJrcE
	ipXTNcljYm4Z/V4GnbFSvz194EdHeXcMBVbIkhfRNNtaGpcT+atO9qfd7RdYgaBF
	PsH7PxEKVMsnAk6MAql1KAeynkXaVOeEuu34qmUdr9I8Sw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n1tx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:56:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so1454784eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 04:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790164616; x=1790769416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eaE4ME9RK4KpAJCqBvh8UgZJnTLKzekG7ESrGMeYrsE=;
        b=L3AkMa1eadxUfIur+BeIarr7FGhZOxe/nlQ22RLSFhcSJbo30/rNbEgT2B3gB+T12E
         nDDkMaeDmwLJHuqayt5hAxAtfSQ9fgvNha9EfSccfXHsLTl3rzK3vXm5kHpj2/jQ4KFq
         vMDfJqOzwme8J5/GBNeT13EFRzXYXlJLVVPGeEHc74hnbsGP+VhmnPgtYh/1L1jRO+W4
         ZCErW3slE0NppiuA1kJIG94RVNlxCCIfIe+De8ASUDzmfycLeqzbIoeSRPDD3RkM8KX7
         yoNGMiKNxp5yMH9b/5La38Kz74MR/NOLlmY0pob+VACvuWVjiQeeCPRfdcSPV86Up8Mx
         s+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790164616; x=1790769416;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eaE4ME9RK4KpAJCqBvh8UgZJnTLKzekG7ESrGMeYrsE=;
        b=Mk+X9AZvDpH6tMz9nCdFuhwSQWRpb2J4jN5174DygIJ5PYb/PN6SFYav93364vK/lN
         rhBrmfCCkT+9eTKQge80XaEqUpJOsOGld+TcEP1o0fNOhisQ34AoDcfoIkU4NHTylNWN
         72JpB91VzCmMywn6hp6Igh4DfeFy5msvi/pA1FagmMmAPiDYBAfCrvNt0xquoDlrnjlR
         or8hjaNeccUBpVOrCrGfO7V6HMbAtF4DGK6QC3IVaSdRib8flFj5w7FfXerIh6Zsn+A4
         JSr0dgWXuhto7+2DUBWGxKTIQKVB0SuqJ1U6en+WKtzgkscickAdlxfKQJVTpvReWa8g
         2pag==
X-Forwarded-Encrypted: i=1; AKwUvBxx4dBbgMFZ7J4Z2NOU+vnjWfvukU1+7pZwht3eoQ/sMDpVOkN/W+GS5RsPkgv19IZbe5do4c8nSuJqk6Nc@vger.kernel.org
X-Gm-Message-State: AFuF++lEMZ/Tn1OTwPv+uLdOeLT61Kn9UmF9mIs+BLXLm8FwcHDlydnp
	kKuuWEuHOxK53tICRXpRKYTPvfswsPXPv6ONk9RmBluwqDeJOIZN4zsfXc6VXU+F1ymd9oznh+L
	i42Tdh7MB0YO9+NFqGhYvnbfKqWX7OKsUksau7yb2SNgl1zgnbuAJdZz1fafoWm01NKQT
X-Gm-Gg: AYBFou2AJLfdSoGMXtP99J0BbKm5VCD7q9hrrLsNf21J0oxVhoraovftpwDdTtOlXz6
	J85Y93B0GH+lroEyg3PEq1ySOK9S4Kr2h/Vs3821HV5OncvNzqd+Tal5zyhX/a44J02GgoK6YGH
	bb5/v6avB0cJRbuV52yytDxdYnTz2SP5+P+NI6Nw/TzyMPnMms4NtmEf+QRxL31HM5g6b7CMCK7
	4Hgs351a6R2KriL1RIBMoOSJrOaS/ePb3eDHAXUhwqWXaqOG92pM39bONKsGlXAYQZOHZEdvAO4
	ML+Q7lOU66cbcvDCky1B1oPV5vM8uurd2HdbH/HR40KabcAfPUCdYhCMdElKuAGOIcVRVfRZbg/
	rJKnNMgKXzqiMUGKOIqd+Nf7mNA==
X-Received: by 2002:a05:7300:5985:b0:33c:e91:66c4 with SMTP id 5a478bee46e88-33e8bc72bc5mr2696809eec.3.1790164615738;
        Wed, 23 Sep 2026 04:56:55 -0700 (PDT)
X-Received: by 2002:a05:7300:5985:b0:33c:e91:66c4 with SMTP id 5a478bee46e88-33e8bc72bc5mr2696769eec.3.1790164614701;
        Wed, 23 Sep 2026 04:56:54 -0700 (PDT)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96952605sm6487147eec.22.2026.09.23.04.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:56:54 -0700 (PDT)
Date: Wed, 23 Sep 2026 17:26:48 +0530
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Add PMIC thermal support for Agatti
 QRB2210-RB1 platform
Message-ID: <arO+gM7lIHa1vkQE@hu-raryan-hyd.qualcomm.com>
References: <20260824-pm4125-adc-thermal-v1-1-3b67ef2eccb2@oss.qualcomm.com>
 <00cffd4f-d981-447b-ae97-e8978baa038d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00cffd4f-d981-447b-ae97-e8978baa038d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NyBTYWx0ZWRfXxEjbyk4Oohjz
 PwIeYcIns56hEVmh9nF9kCzHG9Ft7fC4YNyotw/SEx0buJrpcr88FK8Nxj1PmgSUHlairRSn4EK
 Xndx7QOfRYrcSMDmJPvN7LN/B8T4RZc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NyBTYWx0ZWRfX2L4Np/d4fhE1
 CxgkLGm2a7PqFzA7jbHPqzf7XZMls3QqmvtcnykZzN7vQWTwVRLMkWoXQJHJkqFTzk8cH6jxf4t
 cjK9u5ZET9uoedlTCRNpvnap7xYiyTE97T+5FgSTnuHyvP0lq2n71pPQHirU7v2KHajTV0kMaq1
 yIfBvuJdpH3/LxDFYSKkyY7gDq6ER2rKb8hxMK6+zV7HnPF0o45Mq7u1PN/u1cmNKRGlHjs84UY
 ziuQeqG5H0iQJE/Vsp2tGi1nCoIJafGDA2RsNvBP+nzMywyj9OMRXgbFwXWnjGROJ2xge/UShLr
 xmz0X+FPXvpCmgjNpqV/quU1yqnh+T6uTo9IZYfdVp/gp+AlEOMD9uYm/c6GIqqznCgZnTJodpS
 WE3Sain6Xmfglk0g57xipRYNDmuOzPiJ8kCcFdBzu4l7K7BSYZBObdn7VXVCDnd6LP94+1Px6/L
 WxRszeAT9ABs0XJYSSA==
X-Proofpoint-ORIG-GUID: iJYIe58wQvULOvzYXYK37rK5ykHGUSao
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab3be88 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=wkZ4SpZ5FDF5jysW358A:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: iJYIe58wQvULOvzYXYK37rK5ykHGUSao
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230047

On Thu, Sep 03, 2026 at 11:04:30AM +0200, Konrad Dybcio wrote:
> On 8/24/26 4:49 PM, Raj Aryan wrote:
> > Add ADC channels for msm, quiet and xo thermistors along with
> > their ADC thermal bridge nodes and thermal zones for PMIC
> > thermal mitigation.
> > 
> > Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > ---
> > base-commit: 3d08ff75a47a3e7e2ab45a3bcab6723b4d906422
> > change-id: 20260812-pm4125-adc-thermal-4c0f713737fa
> > prerequisite-message-id: 20260809-shikra_adc_support-v5-0-bf6882d18bad@oss.qualcomm.com
> > prerequisite-patch-id: 7c371f4d9b9af04a9765b0b5b084c498e8979fb6
> > prerequisite-patch-id: dde0d9ae1d46c16407cfcfa818dd427904748af8
> > prerequisite-patch-id: 391360a3fcb2c44648ec62930e3af61d4eb12001
> > prerequisite-patch-id: a1c862130f572ca027bc9c482dede8da183e51b1
> 
> In this section you say:
> 
> """
> I need the 4 patches titled:
> 
>       arm64: dts: qcom: pm4125: Add VADC and temp alarm nodes
>       arm64: dts: qcom: pm8005: Add temp alarm node
>       arm64: dts: qcom: Add PMIC thermal support for Shikra CQ2390M SoM platform
>       arm64: dts: qcom: Add PMIC thermal support for Shikra IQ2390S SoM platform
> 
> to land before this may be accepted
> """
> 
> which is overly broad and you're hurting your work by introducing
> unnecessary dependencies (because you don't need the entirety of that
> series and you don't know whether it'll all be accepted at once)
> 
> Konrad

ACK. I only have dependency with one followinf commit-
arm64: dts: qcom: pm4125: Add VADC and temp alarm nodes
So I will rectify this is next version.

Thanks & Regards
Raj Aryan
