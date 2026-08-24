Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18B639EF20
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558696; cv=none; b=MKnVUtOnYv30i9x3nWG4xKFTNZZFd0NCcfTCPZL58sL10EETaQiTbTyBSKo+WfMZgqbqaeNGNiyjx72vn2PvilK1A2C9DlEIGeOGU7I/MzzhMRjqk7ODHEtQr0DZkz0UzyP75h8iSnj5CsRukuitsiEn1Cv4Nzsl10/3PGw2YFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558696; c=relaxed/simple;
	bh=Jqg1EoDVDYxk/8JdcNcaKA6W49dbTyuAi+5B1jH8WIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZmv3Gu5X1rZ8kPGeDD2fnqg28BS/eqPOgKmJH1rutLaRJUeh8La0v58EU25QofTNaAl2NxjE/0tfy8NvWHwWfZhRGnZA+obJfLsZutcLfVH9O/Dh1eLd+8QY1dDdaLsSsu5dfV3SdbbB/ak0oPwPWi2gKH75sNqIZURUXSF6bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AkZ7vdf/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QWCWsGjk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AkZ7vdf/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QWCWsGjk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RhPx3067344
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xuwALojs1t7YE4eu6ENijvAe
	4SU/Ojcsp9SKogHiCUI=; b=AkZ7vdf/sA0kbLDojB7Og4C5PwxbjhGDGQYNDLi1
	7IhzwjBirzL58bwYPqgpGAkJ14ZV68/UUg1wgwGpZN2gPcssev8JqDFTmkGXUWDa
	SyKeDslmae2DrO05o/wa8NL3f3RI4609RWOWKdnMpbrd4YJj44OiP9/tnjVAO+xP
	v97vJTafi3cyi5lX/oxL/pHIyI82rmYHWoayiE3aZ1vemQTnCLrwWKyN643bfM3A
	H+h7MJlla8iJEZFbMC/RpSnpXM/JF8ZHBRvmh0pfHM64WG4O5Zj6Et02V7gzBi3F
	GpHX30OYciiFlFNJfaNcAeI13OVHyNvRVqxlfU85Wd7elQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jphk3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:04:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9077b4c35c5so60145436d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 01:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787558693; x=1788163493; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xuwALojs1t7YE4eu6ENijvAe4SU/Ojcsp9SKogHiCUI=;
        b=QWCWsGjkq+OG44r6+27kabHNUJo308AOLhYv8lUwop2hzvJQ6v1z5UWPaFTTYvEEav
         M1nI2XAD0NkBpjPY64qT5m45Qx/gCeRAJ98GfFwUlg2uQJlw3wkA9KdIqb4X9sxke2/f
         Z23RFm+PyZiu+6vaS4wWpCTatmlr8p0DfCqsBxwmF7bKgyASvAmVoxG0ICGtR23lExi9
         ezfbpjCBaAMoEwuw3wZ9VExejf1JMm9XChNoSUF63mp9pTgso/8Wk2gEfTJjkkrf2gGx
         cA6rVJDyZXkezDylJRP9+YmLvqBn456DdaYFVpra/LoXnCJ4IAHt6BVUQBJkFMYSFr+z
         LUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558693; x=1788163493;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xuwALojs1t7YE4eu6ENijvAe4SU/Ojcsp9SKogHiCUI=;
        b=CJVsFKVOFzRjf4vCMP5HDTu8DjlE9VmQzv5+36NgXewFl7w7DmvmeJClJqqScPNfQb
         KGI0/LCmjNIooycjCGter7p16en5CW+dG/s1VbbldHUGjKAo9AAVMX60gvCuotD6PlXl
         I+ijPLY6lOvJTIiv1wLPFGHIs2DIr9sAQwGKeAc1CP2qM/+Cx2Tl+7C7xR+XhG/1UMkY
         qmMYyKdXfHNjaAqRqq3bT+haAsGlS8PmHssT7j/fN3mcRkIPTugOI8LkAZ7SvxGWfS5U
         IM80JKQAkThirn/k0UeL8zCDZsbRhfCnxaHgrmeO4y2v89/x97bzafckpYNNzZ57xKZp
         lScg==
X-Forwarded-Encrypted: i=1; AHgh+RoQxG5pms8NxtKMX8euWSyuJ7GutcX60Rmqa69CAEVdeJjbbiXOch81RnoUaFfeUxWtQyGDsQuo8N0QqSAR@vger.kernel.org
X-Gm-Message-State: AFuF++kLRz70O2UxEiyQpgelohzNzwhu3RmhhgxZL4wCO1XWpxHcrx0I
	Fy6I352FlmRxkVuK/SEiSHKlgaozA68sG9CWjUF+edpHxXISuglSPkvt8dfFoH3VVXpsJAgab6C
	LnTZ4aC9IQiHz4uugBgKR/SwOOOt6CXU8+cMC6SnJ1XGzSwIxWjZClVEs3/Yiue3VNLNe
X-Gm-Gg: AR+sD11By6g8YRsbwbQIq6AnGMGbNXwQQBK6Pm395pEDSDRzlHf4ZjglKpMOT3yvelz
	VdpT8/iZFTEuVe+JuhrvPm0IofUTioOcvmft6wALWqMT0gsBjOZJ2olwpqWh+jDrly0h9qD2lUy
	f0vYVMIgmAf+ii5uH7GEMyfQ/X45Dy1QKrGKINeFHFL8MTaMbyS/biqWnga5KWTJVjBciKvRBrP
	nyOUvlSbXvHbq6X6VSl8k5mB6O/+duE+97odyYh7XzyKEAh2hWacOoYRj2MI1vRpaRNxLFSAo5I
	WuVxz4Wg1fXJEM3Zz6eZWPtFPj43ii+t5boWwXPqbWclHGUiTf4eQjhLKwrws8TNlHqPH9iJk4v
	ZA0MBOPh6H1OFkJs=
X-Received: by 2002:a05:622a:1353:b0:51a:6feb:dc8a with SMTP id d75a77b69052e-52e09bea1d2mr160318701cf.18.1787558692832;
        Mon, 24 Aug 2026 01:04:52 -0700 (PDT)
X-Received: by 2002:a05:622a:1353:b0:51a:6feb:dc8a with SMTP id d75a77b69052e-52e09bea1d2mr160318391cf.18.1787558692374;
        Mon, 24 Aug 2026 01:04:52 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496296cafsm1155678266b.14.2026.08.24.01.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 01:04:51 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:04:49 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v12 6/6] arm64: dts: qcom: lemans: Add OPP-table for ICE
 UFS device node
Message-ID: <jvrg36wp23yzewcphyumsy5xdm3bfks56rnztdmloqj5nc744c@gvtowzq75fr5>
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
 <20260824-enable-ice-clock-scaling-v12-6-09271f583dc6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824-enable-ice-clock-scaling-v12-6-09271f583dc6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3MCBTYWx0ZWRfXzaXzlyxbPwXC
 /B7OaNM40AAO7FmddkKHPCv7wBr2DM/ZxfuWdUKxuiR34EQ38dyKXG1i5KM9aAxMdI+1P9ilifS
 i9okatj0VkRYrjTzoEFlMNV4ANKWJkQx28Z+O9wIEHgoaycVLyLCx/X3ITTKyfgfsTw3hpE96n9
 mlXrFkWKMNU2zvz44vs+oNou6RIvDcW1FJKLMIyHAWbhIkmpYGXq7drpJxZZZZ53+eodwQGyCSr
 UNSftdrsH3JWNMV6WrTq2/vSILIQ+0Xxq5AG5v78n4vDAu8xyfX0P8wuC+7ndlpO7AKf9hnGoyk
 xYbChMANMF+r41wQoEEGSUABcgKni8m7OTsObCps5vzzZqneuwCbeOI2TBOuw+Dr8gc7MLLUKDk
 fD0Fd4pGAX7Q9u3+gh+ZtnBKoi+Ox9RVZOEYXTRLdmzSMfItbt+t11ZzFZtVY65Lx27uGj9WV9A
 mJQUftAS2aU5f2SkQsQ==
X-Proofpoint-GUID: Tf4ffC9MoOLZPf6AY4P0HeZ2Ctbb2zNU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3MCBTYWx0ZWRfXykIfb6Pw5v5l
 VmyX8o6gy4f9oDEI0WSHj2tz0xtfFDmPCbIvdOPaFhgtTyr9/Huqwn6kmhj/+Sj9SN9EPeC4lgb
 rx34e8tftf01en1KjQr0Ei4g+fVU+zU=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8bfb25 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=xhZcOr--89cURCpmMK0A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: Tf4ffC9MoOLZPf6AY4P0HeZ2Ctbb2zNU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240070

On 26-08-24 01:17:43, Abhinaba Rakshit wrote:
> Qualcomm Inline Crypto Engine (ICE) platform driver now supports
> an optional OPP-table.
> 
> Add OPP-table for ICE UFS device nodes for LeMans platform.
> 
> Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
