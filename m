Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B30424668
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 10:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786530808; cv=none; b=inxPxp5opuygDUxerL/qm+LCZQK+boYAyeVskrQgGn077tUpmpBDVgNDKBhbjlpf6dyu56Z6dzN4/w+tybvyZUZWw5P/mfem/O3lFE+M9fDrdJD1DDzzxFVTedoAGXQPuKQcD6aV6MVKms4FfYdICizGXVq+I3inReeJWLy9qcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786530808; c=relaxed/simple;
	bh=dl8Bs4M/9YFLjqk9ml8hirzbr3AuGfQhjzOKe6phffQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mi+nFhXPLGqqh9rr4uFcE79nT+MORExW85UDrPfz1NNVavfH+dSW/rh3mos+Z14LHSEee5A84xMgzYD4vUdSTiBf+QKT7a/vtyOlYRaYojiREjQCNLmgjA46SeE+dRpLojSYaXzVv9hvspOHgVhMPe78TXtAEUJDppMetAH9N+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NjG/nD+P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K8lk58K3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NjG/nD+P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K8lk58K3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9ftPg3436410
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 10:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Dnp21dfeRP87pes2x7pTSDug
	2r5Z4uUQca+B/w3Z4fw=; b=NjG/nD+PgEewToVKMXiUr3PlaZFab95z91dz9c9E
	XBvWx7MgosLNT5MXXCSYfJ2IxmuVucWTdTG7nt0FtogtUQb1MqQs8sHQhB/imDYj
	YyzA4lgZFWVachp8DnXLxMz7exqBxiHbjvOvwVrZ02BCoXRGJ9CN8GdWMLni7uUc
	pZtnUhwVAT1cMR7wY1whiYIV8XHOeUpAL04wX5U9bAJuMXCkRSdoyVEGj+Pkzdju
	m4QmpshREw6VZ/nhQqfhIP+GHFCJBy1zWHxZAyzK8iCH8lda4YWjps30q6A/5vtz
	Ym3OxC3N0RFuch92w1vlloA/oMPx/XduJ5noZEC7dNxbgg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj2sd9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 10:33:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8eeba1d9e47so7262466d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 03:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786530805; x=1787135605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dnp21dfeRP87pes2x7pTSDug2r5Z4uUQca+B/w3Z4fw=;
        b=K8lk58K3rgkEkr4ZtPi+RrBJRJ2WXaPKXhHoYlVCIbeQB44eN8W65RCerhtxL+TrZh
         Oj7qPX0Fe+35A7KeXhrxHzmjfEPPTs2lNK5iDJY7vi9piImcvu9NS1MRdZtH2fG/wyQZ
         3Bv2wLc6iFbKkmXq8Zjo2tQYhtg5SRGnWAl7CI1hnoDwvhsb3SABLnjH6YuqNaXFXfpz
         A0T5DE51eKVOxdkXtn+XEM0/MVCLbu/UAZxTkQ6zpRWJkC/zl1xT73UIql1J9BMPHM1W
         7E9WWfUOYTQ27g/XFRYeUHbvxzDA7X5EKPj26Npc/ZOjjdrs2hY9EotUkl+HPC9A4wkI
         7bBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786530805; x=1787135605;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dnp21dfeRP87pes2x7pTSDug2r5Z4uUQca+B/w3Z4fw=;
        b=g1HPbyjLmpWfZpZOOXDrNrWmcvnRfGWff3Ee0pznSEFKzPmsJ4B7O5d/NFnSfP2mME
         1akkVoJRNxxkiO6M+HCDfCF0dmTAOUDrUt8D+IJLvG83BQt0hbtE3GBLnDkzCZ+DwzXk
         D0q/o+LLhjJIT0KZs3PDSzDWcjl+Fvvwe8W+Fv9ddGFonJzZnx8hx9lx2XKgFmDfoTfG
         1H8nkzYzMONinNsAKv5+N35kC+Wjhr54kXQniteRTHABClS5Rb6cmTLkAzFHXw4jxU42
         OI2ivbPzPCi366idj2SwAyFhGLNf1wCIcJlbhwAOnqRDiLcJ/akNKeYq6JoXejm7nF/P
         eJuw==
X-Forwarded-Encrypted: i=1; AHgh+RoxWMM789PkSd618/rzFYi2HQjgpySFrCaJGB+l3bJZXaQRWwYIon3bQ4nAhuvGQrfJf43S5/sYPwVTmjS8@vger.kernel.org
X-Gm-Message-State: AOJu0YwCAIYedIQRHeO7k8IyYPdaE0gMZ/aXKkv4JzAbNHlqaQWYEwvU
	58Hrz/U/a0nrIbn5NvhdD4Z4HqeEgHd7wjUpKQTJer9Aa3tuKfqvBT54093QMLojoyTTzwe+0qd
	07PWCmJlYcKaoYTaSrE+xlbwgncb11ZfFztt1+CbosAZsZsc0HZ/NXcwIhTT2/kybfY3R
X-Gm-Gg: AR+sD12OT17I7ka0v4AQgjqtIlZ7/+F8hz0XixQngZPTrZtuDkXS4BArUwkt8H1Ceou
	ZZnwwW33QwPCJOKXoqOzngJwkdvIul5CCEETumdcpZ+A5suOHSXpUjrBZvn/33NPCJpoz1jVJPB
	bCW72Q7UusRQQ1PH4z49WXng0Ob4fZ9CbhC0Lwk/7B4LobEs2BJTbZ99N3h6gS9B4R54GOT37F0
	XtFKpWWUTfzdeR+UMgoYL4YbfmG275yRGa3mc0WRr8oHLtGlqOSpp6X/daPh113e6CWqq0Yr2CK
	b/L/JB9Lfoahf8g6MHIxEMUO7nQiSm73+EArtlLtPaY+zgqeQACFbTNuyw3nVkdxS8uHTXZFhPR
	dgFAexVzAH+15h4A=
X-Received: by 2002:a05:622a:5588:b0:51b:fde4:cd4f with SMTP id d75a77b69052e-52d648ac2e5mr29216701cf.30.1786530804905;
        Wed, 12 Aug 2026 03:33:24 -0700 (PDT)
X-Received: by 2002:a05:622a:5588:b0:51b:fde4:cd4f with SMTP id d75a77b69052e-52d648ac2e5mr29216101cf.30.1786530804282;
        Wed, 12 Aug 2026 03:33:24 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d709dfsm6257017f8f.35.2026.08.12.03.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:33:23 -0700 (PDT)
Date: Wed, 12 Aug 2026 13:33:21 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Radu Rendec <radu@rendec.net>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: purwa: Drop the Hamoa
 workaround for PDC
Message-ID: <64gsoxeq424ce27ekherkx3zxbv7fxfgrjzykpl4orccwvk5g2@f2uo6eh2jabh>
References: <20260806-purwa-pdc-v4-0-62467f4b4ddc@oss.qualcomm.com>
 <20260806-purwa-pdc-v4-3-62467f4b4ddc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-purwa-pdc-v4-3-62467f4b4ddc@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=a8EAM0SF c=1 sm=1 tr=0 ts=6a7c4bf5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=o07dIpAjZdj6OISZKn0kaw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=px_f_vAfgXbzbh29wf4A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: Myu5M6ahMtQWQqyDSqMGd2s32KJwWHaq
X-Proofpoint-GUID: Myu5M6ahMtQWQqyDSqMGd2s32KJwWHaq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA4NCBTYWx0ZWRfX7qG4lw/cePnn
 TVlfBKwVgEkFo5WXxfbrP/mZyp8qZrGbLcbYdaYZZPaVsWz32LJNVBZRdV8eUbyMhLjx5hAPiTX
 2B08XTOOIieyGwZnN7R4MElcfcc0vcw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA4NCBTYWx0ZWRfX2aEIPoTjSToJ
 ZZK0oy5T6YOrj2/HlrRUu7euNfbCX9yuLDxiDq+vgqQuasscGsA1kh/N3A84Q2h/9Obxsyv3FPU
 IwEuBqPC50MA5sYTAxij6Ln+wKOBlHxkc505W4POMau1BE2Z6ZVLsxM0EZcmnTOK59HyUcIkk1s
 l2sP3m8t6h6BY3eqDrMbD+QMLf+lfnWyfdMGvvWQmgyktmT+f27haISuKC5jiA8ERGZOcvzRR/o
 IuoYCNdxlkY/uS2whsXeAnJg0k/fBvY/TWqR+d3qrAEU0x4Y13PaAYnBjlYrEUEU5UeUMbGKtrV
 QfnSE40uwNzRqsTOi0fzmDy6DpgOocIOZAqufaS1fF37WI1SaO4nZ17mhlnjMnZzdgbgOb8HK7X
 hSNifvAcNC8TeBklgK9GFybGTvqw7WyFRf6ekKMGsXtkaE8uRwhl0uC+X2gXCprBbi9EpQK9ujC
 SUkw6ska1+/EXSWdmUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120084

On 26-08-06 14:26:29, Maulik Shah wrote:
> X1P42100 (Purwa) shares the X1E80100 (Hamoa) PDC device, but the hardware
> register bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc:
> Workaround hardware register bug on X1E80100") is already fixed in
> X1P42100 silicon.
> 
> X1E80100 compatible forces the software workaround. Use the X1P42100
> specific compatible string for the PDC node to remove the workaround.
> 
> Fixes: f08edb529916 ("arm64: dts: qcom: Add X1P42100 SoC and CRD")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
