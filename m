Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088EC31E847
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 14:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786718882; cv=none; b=iS43Corjj9xEkqzHMRKx73AP3d3eRJPLV4lNxpQWkb7qs4s6gzSp4doiNuLEWOL0WQg3vUV/t4HODJ4cXoMQNc4ZfqTUMGb9XdV6N3mGfD0GPHHGfC4SbSHuruK91UPKgrBD9gubszlfVeqohndmoVp/REjP4Ayucfn0LGZeqPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786718882; c=relaxed/simple;
	bh=PRfChCSkOVqWm54rFZ/7XVe82dB5Yyazj7g0F5AHQQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUH9DHBo4IfPsFPnp6zMHulhfxexD69RmbU/+UNA1H7ZRmd5MPo5wbze2S/BidVt85msjBxJBQ6SrHutST2fwRvFTl5NWQdM/DgDDHQiPt6TskwB96O+B/IRbxi0GWMkO9aA5q614Y2tzUzgCNCKklrT+rYMMk4rGJnXWm46OBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aHZhPcuJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h2o3Z6oX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aHZhPcuJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h2o3Z6oX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EDxKbQ1505825
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 14:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3zH28m0yMIFAHiTATXVrk8Tu
	QRDiVPyngjoADZud3w4=; b=aHZhPcuJcnrfwzER91for0kgtLwJjXoAIk9QHB0T
	LqDdcyCNSFbBQrTiEgyap39kiV9oHd22g10ypRqPq9GnEmoluYnZDoHFHvYBqK7K
	kAtdsB5/TnfdTgn8rQCD7QiaTL5/RfP3zcbBxEkxm7S3w8Y6HCqqimDMnPF4mnBB
	dOwJ21pNq6sAfckngDf5LH98eUOBudEC6ZhaW1SQO9E0ekqFO3IeweBBMdv4djgD
	yaIxiT4XTEhzHxV4psZi2EEtInJjAqaonTH0lBFq6INQtoCE75YXJzCX9RDOJi/m
	XQcmJVygzIRMGgF6zIg9bTuXolnM7rJsH6SZMzl7cjM3yA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1v8ptd5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 14:48:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52d33c89a29so15073841cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786718879; x=1787323679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3zH28m0yMIFAHiTATXVrk8TuQRDiVPyngjoADZud3w4=;
        b=h2o3Z6oXvAsPWa36OMLvFUkLa7BrbeQEKaaQwda5J9RHS7RhCqjYrvNqJ6WNDtXSYV
         MbcO3n2cG/2/ah7PFlF2k6nUMLx9qU4HBIyDaxMiREhDkD/cLGr8v/ZEx3TE+cccQP9z
         Znbvpow1V8vmfTifkgBcBOmd2yGSR/Bpt67kK34fdlnXKz9ZZPDSrLWwcF5Jtru3EMUh
         VvAF09VcRd8mJh2GkrkonPhJHyud+y0zpGOJ+bSsGMumMF1qrhQf1q5Vl0AFjAejli1A
         6Gv2suz+xsxnLKzkPpYHpyx4PuG37mgGMKIYDLHQ2PlGFSKChFiWsCPoD1MzQjSEOIEF
         Vvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786718879; x=1787323679;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3zH28m0yMIFAHiTATXVrk8TuQRDiVPyngjoADZud3w4=;
        b=WhQG6yOAT3I4xI0a73ndlAHOtK3VY1TzoeBN8VTraLMumXc+981Aqmvz07QLTi7pQh
         krEtJQ9agStgS85oOGlvH6p4uboyE515eXDb2xU39fHU1/rqM2l6qAJ7oMjzHRAstjZN
         WbRLgPbwoBxPhCSEr7PsisZjuUuNbshJGtkcAwUewQ5V1otHpVhMvJEonqa4hvEBL8QM
         RpNmVxs4kk8GLN9nxOHl5VeCtmRcn2oWyLhiyAU0Pes8/Y2nxyDBSID6F5sljwp4qNNm
         r9aIhm3zd1MsvyanxVVai2C5CQ0vaLqdI6EZKmWUOUZk2g1HmhUFRR+aJD5wl6ii6lgX
         qp2A==
X-Forwarded-Encrypted: i=1; AHgh+RpBun2YDdw8IDlgdAdq3+JCesGAw4HNmBMtNZBS6ZLRIfasmcNRSZwkwOBACJ/ADONeLxnxq3jxKkXqTuRI@vger.kernel.org
X-Gm-Message-State: AOJu0YzVCkqt6rAO4msdxY6xUTSwWzLJXJxl7mPoLvd/RVHhz4HQF3br
	Jg3G7mBNiHC/ihQH3K+FuB6RXx+30PAu7m3Wa8G36GvBpCYXCoZxrdxqgpGFp322wNBrDIzHiwa
	RCUb0Cq1oK7Qvc/hDl9mbSd4HvoboWjUbPCHG0+BdMjtdACeFGICsSMtNOlrDEyV53D7i
X-Gm-Gg: AR+sD12cGLjskDHTBy2IseuAXB6wBhn+zeDA4BVEauBm3RSquXd5d7mGL2BR2r8jSVq
	slPI0ZojVa8dIFeX20xxj58d45PhsrddQOSzTJZ2+V7TnXCNKc/Zhefmstq0sx37oNFElbPyEGT
	b5VCUNDDq0QaIc0sUEkPA9Ng1FlClTbYzh9gIGrQcMfEs8Yjn03tHQBGUBOLESf2cDj0Gbmt56U
	IVvPAWC1EnP13CCVuO+rVulIjh50e32/5zxEiJsN+RDahaTs3IlTI1g4UOojQp9SENf3IjXbBE8
	l/tMac77ff4/R0YPx04nKEpF7HtUOgpcAuvdSNQ07iJdSoaG2bRub28xZv0KGc4W0kGvqJZL3Fq
	6giOOcM8LuU3WVhkcTm2RPDzcvFy2vrrM8/hU35sp4o3We/F8OmbBBiglwFJgmrDGyEK+X27zUh
	sY3Hsk/p6PYIH+
X-Received: by 2002:ac8:5f95:0:b0:51c:73f:e3a7 with SMTP id d75a77b69052e-52d85422700mr67910261cf.26.1786718879352;
        Fri, 14 Aug 2026 07:47:59 -0700 (PDT)
X-Received: by 2002:ac8:5f95:0:b0:51c:73f:e3a7 with SMTP id d75a77b69052e-52d85422700mr67909581cf.26.1786718878719;
        Fri, 14 Aug 2026 07:47:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458bfe388sm593150e87.59.2026.08.14.07.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 07:47:57 -0700 (PDT)
Date: Fri, 14 Aug 2026 17:47:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        nathan@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v5 1/3] drm/msm: Guard the QCOM_UBWC_CONFIG select with
 QCOM_SMEM
Message-ID: <4xhwuoehp3tzncetn5y4eydefkxmwsyd7jih25ngsxeagdxbta@r7ofralz2er4>
References: <20260814141724.1006382-1-daniel.baluta@nxp.com>
 <20260814141724.1006382-2-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814141724.1006382-2-daniel.baluta@nxp.com>
X-Authority-Analysis: v=2.4 cv=K4MS2SWI c=1 sm=1 tr=0 ts=6a7f2aa0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=qCMfp5iw1hmu5WYrWjYA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDExMiBTYWx0ZWRfX4vtfBMV/4Fsr
 Hzbl4GIf4eSpK1GAx0Gh/HwCYpId3lUvwkXZ2EEwJQhAUJzZI7GW16mBMC+Yb2aVPrTOR22oZDy
 SYowR6v/sdEvOXjD5Juk3HIoWoUYiIq2bST3Z9GWZLzAWHqvwzyIKqYHyMlFy48WG/CnvQrybWy
 8338mU7umvFuerXqV9/vhnTyoxLW3acEzn67SmzP72/gSX6h4rYzwETJGIPZWjCagNyBVMbv6bR
 5Hvjc2l55hTvGTitXuUfC+vjm1nF/d2MmdIhjllcRON5dMtzBp9ruv5WFP5Ue/POsX8+XiO+kKN
 hovF3n30WZV+63SzjUKvXzo1gciRLiZjG6OH9oCmyR3IZo7zGBCYGt/ll8bx8JRGKPGSHS1zA84
 jcxI9dlKiDq6V4DfpakZWdFhCL2LttX8ei7YDqzQsu8tT1hFjl/UA9/qrrPc95JIXJ6Gqhfu8KA
 jaqyTyveGnWHmwxlw6A==
X-Proofpoint-GUID: Xge9qat0mUph-1-FCuULqipuc3nDUejA
X-Proofpoint-ORIG-GUID: Xge9qat0mUph-1-FCuULqipuc3nDUejA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDExMiBTYWx0ZWRfX9gpBA7FLBbjz
 2WYRxMv5nTGvWS9OTr7A7/M0rogvl5SosCyF6QEkWz18tvnRq7S8fUyJBFeyqTigV1HYbkaIlYG
 i3fv5b/g9u7UpZIXx24OLNnukhdl5+g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140112

On Fri, Aug 14, 2026 at 05:17:22PM +0300, Daniel Baluta wrote:
> QCOM_UBWC_CONFIG is about to depend on QCOM_SMEM. Guard the DRM_MSM
> select with 'if ARCH_QCOM && QCOM_SMEM', and add
> 'depends on QCOM_SMEM || QCOM_SMEM=n' so a built-in driver is never
> selected against a missing or modular SMEM.
> 
> Fixes: 1b445022d1d0 ("soc: qcom: ubwc: Get HBB from SMEM")
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  drivers/gpu/drm/msm/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

FWIW, for taking it through soc tree:


Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

(Rob was also fine with that in private communication)

-- 
With best wishes
Dmitry
