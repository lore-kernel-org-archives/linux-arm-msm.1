Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D39247D930
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 21:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786484934; cv=none; b=blFBWUfhkOOBYbWqmJwv4LkkQn5neiI5zPGa7TbLPZDBbeZIlVNBf3UrFC279A243K3bg4o7BvsYjjkFxVbjaHq9qQJJJvAlNy0OY0tHi/PJdwU6h6Bn/I+M+j+G8TZo/FO+CUgU+XMpkFPvtsbhcRjs0DXiipLjDhkLwyfRdcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786484934; c=relaxed/simple;
	bh=3YphB6p5bvAlpt7s8fIhH3wwoDBC0+jKMak0/KZ3isY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nSlkKioRB/n7OWQ4WS9k0z8g2ng0k4S65q7Fh+GFI39va8UvecXdFZPW4bjCxqLhAPoukacjeM92rnXFVjNUXML+1C+5duWbe/0Z5ZukDTFlVeAIlw/P2BQfiEotuddYzh8CwyWsLU4is5FEbN/yzuOgUS2zSI7c3CbbxTXYY5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RekMB71R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gq8H1Fhe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RekMB71R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gq8H1Fhe"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BLbDwG617133
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 21:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RDpWL6YX7Ibdac3Brq/BRIWn
	1DCIJBB7LKdAqaLHbeM=; b=RekMB71RMMNB3jONZ6iqeiZs+eUhhyBO2sw9Lcq5
	A8TVkohuwoCdeg09RSghhnpTGY/fe1J9s7i7fjt3vIe/n+S6H21ToTcocApbkKVN
	d2xxA9Tjw6Jwa9mfyvIJYuYOxqhpYWS+pmVSKzjEr7ObBwE9sXwp14DrSI8WPOba
	VL/MTWBEkCMfiXKGFVSJOsf0KhJl5XdxfuJfZ+dR5zPQB+M6v08Kux2nH4UVB0Ac
	e2XOeU5o7Q02BMzjHK1Wv+OwFAj4dbvMgZkMBdX7EVgnvIO7l3DQwRRLFiQGksBj
	ahVvuQY/eyAd+aPq8ggyOiyn5kBgbiKr1X67/KSAeqyPWg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyxweugjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 21:48:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1b4d961dso3382021cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 14:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786484931; x=1787089731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RDpWL6YX7Ibdac3Brq/BRIWn1DCIJBB7LKdAqaLHbeM=;
        b=gq8H1FhekICJvV8fsJ0i9hQEpJ7mzRfYaZthnh5373ydZwuvMPSF3pnPy9mZdy5tNH
         sBt6hq+OffPezQLCkbDCXgfr5DJ5qGhBSreXMuNloRhu7UvQ4A4Sh4s9mKFI/0QbPDGq
         7gMpigyOJ0G3Q4ahWtK86hhXJzmCsnBRJjOtULs9QmLiNQtkzOO5CVmi1pPPt5pkVR36
         rBvwznAI5xpQCRTF+WhiesZqoqTCMIEkuZzMPn4tRSpI/o6nh/iYZSXSH9qNPXn0mxuS
         Ngux21oLOIW70EzjVtHRtinaZkWSQoDAXj7qMfTe20gmaJOQVWS6i1RXiwWD054Dg05Z
         4B7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786484931; x=1787089731;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RDpWL6YX7Ibdac3Brq/BRIWn1DCIJBB7LKdAqaLHbeM=;
        b=G/1goCi+n9SEulvXEXkuMXspZA6r40MKemS+9mnqukepn3XvZeETpMcbp14mKUEBE8
         orO5mkeHEOgWB5Wy+TUcfli1i2FOdhIhhvrz85FlnES5B9uiy1tCYtOYWgsFv0FAWALn
         OLMVzKr4U0ow4HQmSckFS1OYNMoKUU+durDws3eKYpAqrcWTmLRYpx8YYdxS5sRCpTus
         mJgZj/Z5ZvA/QZXwl+cCr8n5LHtnZNBjC8arNfCRwcvCCBYkAjmN54w/ktr2tA3xEAWo
         eD84wGjRqv5acru/6p3fKaAy4g3PzBC5o40P/OJVfmb9RU4vLQcpZiC6M81n+fyG3cij
         QrCQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNZ2WvOqSrKhTjsvuI1BC/wf+D8zXZSzaEJU6+1Ncb9qW1Weu39Xno6HlvnPZWHg3WwLXu8T33jyPwVBIq@vger.kernel.org
X-Gm-Message-State: AOJu0YxcZ6KsJ7TjO2Zy6h02k5RV03vMis1+MNERxctG3mD5KrPnpBCZ
	4Jubl04a5X37qDEJ+rfQa8SKiNn13cN+LR/WCiHbLWVW8l+Q1uIwaq+oB1T2BcXL37nCWoEfywQ
	EPLt+HWP7FZ15roKADO/DQD21obcvZ6yneaJVmqbqO2s/yEf4m1g2Y274mcYJUyvcr2Si
X-Gm-Gg: AR+sD12eJ2fU5oEKT3t7TTIRg3RArSln4HNMluVF+5sgkM0s3rjT1ikQAqjlEiEkFlE
	9K+4fq8/sFec8FgyEqdEWPnXZ21xqjJmz3iTzy9G4t9CzH674m/PXLDwtbyTXoqfUpV6/2C7WGy
	5gp2I0lu3GnpbnjW9FLXZQXZAjjHpgMYzkmYBiriOWzA5p/pslcPH2G1wLOjG0siDbkynZBr8UZ
	Wg6au8Zl8bVe3T5biPfpew8r+c07JEo3cCME38FefhtfsOyYXl5obn16p/oI73byREdABfdhaHU
	BzAeHBblsB1QGoEeBYn6VJbIhHhvQcpZF4l24xoXHtN5ac1OTkoeHqPq1aH7Dm1R/mNBWCnr2wd
	tP6rpwqtB4Nw6krOZ/4jv95bXe7te7Iz2rGB1Ka2RxClYSwlfczrSPO/tE5OmdDi/y0/pa4ebAd
	DGfY3KJx+/E/+RUQ==
X-Received: by 2002:a05:622a:1dca:b0:528:317d:eaf3 with SMTP id d75a77b69052e-52d60204d8cmr31340961cf.6.1786484931330;
        Tue, 11 Aug 2026 14:48:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1dca:b0:528:317d:eaf3 with SMTP id d75a77b69052e-52d60204d8cmr31340721cf.6.1786484930905;
        Tue, 11 Aug 2026 14:48:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b44cfc4217sm110801e87.28.2026.08.11.14.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:48:47 -0700 (PDT)
Date: Wed, 12 Aug 2026 00:48:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev
Subject: Re: [PATCH v2] soc: qcom: ubwc: Fix link error when QCOM_SMEM=n
Message-ID: <eptix3j7cqs6mhbk5ano3y6nhsl7r6fhrkfz5dpollvkpnu7wh@uy7y6txd27q5>
References: <20260811151905.311267-1-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811151905.311267-1-daniel.baluta@nxp.com>
X-Proofpoint-GUID: iGteiLGtRND4l3HoMjXb4k5zOTEAu6pf
X-Authority-Analysis: v=2.4 cv=K8QS2SWI c=1 sm=1 tr=0 ts=6a7b98c3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=tRDJS1cfbB0_5xRKd5IA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: iGteiLGtRND4l3HoMjXb4k5zOTEAu6pf
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE4NCBTYWx0ZWRfX9veysTtCfmC6
 FeVXE/fZLQzI2JSUiFbRqy/+S1IXYPAJYFNqAHCC8U1S7Uicx3Cw/q1nsKsMeJT9HCXIvwTVWQb
 ZaZlAAEIfRoAl6hu4NkWUDX6sviIT+g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE4NCBTYWx0ZWRfXzyHtsMgLHM38
 r1KuVUtodbK2E0e0bXpp0S3uwBbeVjcj0BnBpOt27A7W3e0T9+OnW2Dp2Nmkr9+MH8G36dsGJg2
 qr8AjzbruLDESgo+RYeRh7r5LVMgEI+798z0L2p9LHLc7VSkWImUbo0mLjC0c61mFzFX/gMB1pp
 S2+4fYADq+9hP6jH8DY1XxnL+mTjy2RfhjCWY8FqzmlDiga0As5T/YLaAf9hSl5rG0OqRkQVb9j
 s/2uE5/VCgZreERcs+6rT2W4tATLOXpq35xIZIUvF//rWF6RPQVVB+sfn5TUGkSFRPcPzJoDDOb
 R3d5IdOUjA3bm+jxV39FtIjKyGMD0qWAUGWg/CYQXmaEplyKPYAP630VvNwJPq5JJWAtGy35yHV
 ITrPfnfPDyveumRceGWcbfrC/YNOicZ5c2CMBZf8QHZ2eqDz/cFABnb5+NMcpno7sty30iLHZ2l
 0bsnmvnvz/Fs5sY3Vug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110184

On Tue, Aug 11, 2026 at 06:19:05PM +0300, Daniel Baluta wrote:
> DRM_MSM unconditionally selects QCOM_UBWC_CONFIG, which calls SMEM APIs,
> causing a link error on non-Qcom platforms (e.g. SOC_IMX5):
> 
>   arm-linux-gnueabihf-ld: ubwc_config.c:(.text+0x2c): undefined
>       reference to 'qcom_smem_is_available'
>   arm-linux-gnueabihf-ld: ubwc_config.c:(.text+0x4c): undefined
>       reference to 'qcom_smem_dram_get_hbb'
> 
> Relax the selection of QCOM_UBWC_CONFIG to ARCH_QCOM only and make QCOM_UBWC_CONFIG
> depend on QCOM_SMEM make the requirement explicit.
> 
> Fixes: 1b445022d1d0 ("soc: qcom: ubwc: Get HBB from SMEM")
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
> Changes since v1:
> - (addressed feedback from Dmitry) replace adding static inline stubs with preparing a better config
>   dependecies so that we use the qcom_smem symbols only on QCOM platforms.
> - Link to v1: https://lore.kernel.org/imx/sy2ulk536ryakhy6fdnqr4asvzvufqk3dlo2awdrfomulyf4n4@qtp4qoazqmhj/T/#t
> 
>  drivers/gpu/drm/msm/Kconfig | 2 +-
>  drivers/soc/qcom/Kconfig    | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
