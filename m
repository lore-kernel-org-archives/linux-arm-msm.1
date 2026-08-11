Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B25429CDC
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 14:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786457387; cv=none; b=SpnmUqdyX560MTSsQXHmzxeFVcqTTcraMlnBGeDD57p/Pz9hvqyW8YiWzrg8eY6i+5WF9YJD0S55lEzHSlvneqtfuns6heiWXzVTBl9Z9aHMxHUTmMO1aPmsXofi/rIYYTOKvigeNNVxV+O9HM/5rHd7FA1IJJPukFC9ZJCpuRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786457387; c=relaxed/simple;
	bh=fPNu+E6yUnEgXieWMqsixjaS20gWVDpNfd4ZMZkRq+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jPV54rp+cfRD0aosd5ezaq48pDjTzU8Ua1Ko3OG15hHaXuACRX/55onhkF0yud8IWSXPSlrI7+o4QZ3e3LkaAlvUAuNfpb8J9ITIQAeH8xm/etVuVMhDlWmn3/0e+IIQqDCRJAh6E5IM2M3GcVW+r0zKqb3A5Q8MO6qJzLgGUiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WRCMO5EX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=er2RvO2I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WRCMO5EX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="er2RvO2I"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDX52o766976
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 14:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PBqYbjhKCK4GIgjl9hdsBv5N
	7fb3V40anIzv18fXWJA=; b=WRCMO5EXN46sYDyiRP/sxseWkP43KIDweQBYnX62
	r8CYPK8CFn/KuP4atfyanAKHJQRRsO0NofJdmZ4xMMXwsBZxdcqKmLD4AOwRywIf
	xAqWEtxSfo/d70DdA202V2MaAlj5b4rMU7ckrxgF264w/G1ykr1JUERXo+GMOPoy
	fzD1JrbJc6csJwtZxVumchlxGQZ5ZV22etkS4JtijRHugi3fGY6f/3lIyyVOebbD
	bkHbvLZcYwhpveyfSSqUWgE7vXyaKTBv08H4MQ4FDat3Vzsz/AOD3/buHhdDwePF
	ZColdP1wqrJnXDpyfoDzgv6jOFQKR2gm8sol4yV++71Few==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01nc0vcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 14:09:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c12e43b98so9921101cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 07:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786457383; x=1787062183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PBqYbjhKCK4GIgjl9hdsBv5N7fb3V40anIzv18fXWJA=;
        b=er2RvO2ICQxBpY0ANfS/XmckDrZX7pGQFqMb9ckWttHAwyOI29UOPQ1rVgvJtNqPzP
         IEV8/ipYGm6Y837Su1G6J3TZckVLP4zaf802Qj/o1HZO+WmjbaHjaUrrb0UCVYoaApF/
         WSXKhQ5D1sbH1JE0DSfN5z24/d8CCofcxv0s1cCMFxAcmS3eIUl9wkUg6O/TtuzPqoQh
         3YPJBsIe+WK+LL1CBAlmdRVStGM7oiFaQLfIkB1LWEe2NpStORMs3ADt6kqUIHuwKvTv
         BtF4k+ECEZKIkvfjz7Z9NWfTZ27k2sOtpP9zR2SPYoY58wGlFX/odZkuagz4DCzEwKE1
         /6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786457383; x=1787062183;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PBqYbjhKCK4GIgjl9hdsBv5N7fb3V40anIzv18fXWJA=;
        b=IKcA5NY+T4DjSTXKpiyfdCqiFtXVBO0YpQ4AgLv/h/tzmZGgfMCuhYhF79S2zTDw6n
         lAUzH1ViPfCe4Ua3rKYGAQCoNbCwfeU0K4bcqau1g0AqUXQJg2LRpz5LVvMj0peFzG6q
         2GxARsfFi3/9+RjHyHGiDOoz78OKQ/62WjUpOLOJrPMZ9nD/I3v3EOztFi5oZWO8N2yP
         lRYLqaQ5+Vx6/MGd+65M0k4y0zp6Syw3L1AqfYZjGEZlPcmkjkXz1HdywhroVS9dSyro
         O2pr71QILMicARZzoAPL46/FIB2GWkAEezZuI6qUNQ2hCSuN5gwO/mVDGxFq3Px62iIO
         Ghxg==
X-Forwarded-Encrypted: i=1; AHgh+RoFKAQ369/KJ4CvWnLzvRVXAZDPjkrehEKCGR29Bp9stWzpCZ/5i7fhP69qlKMd5PAO0XaZPG/pxfQGjl34@vger.kernel.org
X-Gm-Message-State: AOJu0YzHCkTYT62Rfn9fcDgCsmCoeVikXC+/8gajYp89Ru2tCDVCDWah
	+BOjqc1zimKjggQE3cyjT8EZw+jcZijnBCrhbTc0mVh/byw1uJpOl/4m++YsVtKAYZvyywrEttw
	pAb4un+jd7gJdtBexySZiuvBFlQcQUK74CuB1kOy+egvGaGnTy6ToAtNyGwDqbCZzsOnv
X-Gm-Gg: AR+sD126ZIxC1/Bwh9xS/icIsALrBYP9PQ/QusUHj67QllLFY5eY3R7dLQUdbHHRdyV
	V22Z9V1Hdv3MwAQ6sR6nIJTSZZc46drM7JDyOT8AwY61gfn+LhItHTkxQdBXBWIRURlPUStY6FK
	t545IJD/ZDfyDVHA/Qh4hYcjob7BN812XVu3GsVBValTcTF7/CJPBwyrV/X3nhGTIuFTol9SwHU
	cGZi6jX+hRz0BhvF4NN2bDWf/hdiJ3BAfo0aGJm6bnIKR1Aq+NqFsAlol3TtCTqpw4vxYRAGz72
	fcWsfUIJzO3+EaMNlvWUjYasi/sSAmvfEoWZZlOo02alv0D+QDQtQlbO7bPD27EhvGBoCiv+nQz
	918s+whU82MO9H7+cvE1DJ25jRTFnwvMPzYLPuuy+m5/iSkkjnZ0g5IgGSpF8DwMeoGIbdTD+FE
	guQ6KoSXgUL3NS1A==
X-Received: by 2002:a05:622a:2d0:b0:519:e020:6087 with SMTP id d75a77b69052e-52d600db4efmr5352401cf.11.1786457382700;
        Tue, 11 Aug 2026 07:09:42 -0700 (PDT)
X-Received: by 2002:a05:622a:2d0:b0:519:e020:6087 with SMTP id d75a77b69052e-52d600db4efmr5351211cf.11.1786457382199;
        Tue, 11 Aug 2026 07:09:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4486c0505sm316739e87.6.2026.08.11.07.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 07:09:39 -0700 (PDT)
Date: Tue, 11 Aug 2026 17:09:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: rafael@kernel.org, daniel.lezcano@kernel.org, quic_skakitap@quicinc.com,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel test robot <lkp@intel.com>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        "open list:QUALCOMM TSENS THERMAL DRIVER" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] thermal/drivers/qcom/spm mbg tm: Fix missing bitfield
 header
Message-ID: <kjsn3qdfvvwuwv7sqqbczrtfc32d5ycdygams3ajpzyqxlbqgg@awsxd4tluphm>
References: <20260811094935.2941313-1-daniel.lezcano@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811094935.2941313-1-daniel.lezcano@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExOCBTYWx0ZWRfXx+CNnJ4iCVMy
 5fSNgZbNs2IzNtOXgbm4xZTypLdQnkeabKQZ2MAgEh3Z1NVM7/dRLJMQwc1i14Sy3XJuG3m+DKN
 GSJqcxqQ8/R8pLcmGB8CtxbTqp2J3nY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExOCBTYWx0ZWRfX1POjZZXg92fF
 ax7eFWyCWAadC8zRhiQYaaIAurz3N74P4/8dQAQQ5dswrnedBFc2dSnz9IYzjshLsbNnPrsOfxm
 Uh1rJwqIzMLpYE5u29+uW/h9Sa4AYRTVQpwOscdKxZcXjqrUp2WTALat09v4KqbJ9gFKfy9rkut
 2c3SxtbqWAPVbZRp0yK/V5JA3DBERXo2OUsu7iTwkUW+P99ATS6aFyk0WdQ1pWzJcorNc0rwrdg
 7689jQ2BGjYbaPl09Q4jEFvu38dyQ6c2PzdmRjDzU/dUuQ52Yuwj2HbjhYebVRs0O4C/qkeZMli
 DPzaTYb64KAu0GXFshsTKXcpqXlNv8DYZ6Yr4kzozieT2cj/NyoZTIksmbc8AOgrOkNUoe/tFtI
 E/hua9aOA9RE3SDgzWaNnATYwuznjJ5HbGH0o7g/BD+k91DjDV8etU5x6GItm2FCbuw5TBSqQot
 JVVATeke9gSI2LxL7Lw==
X-Authority-Analysis: v=2.4 cv=RY6gzVtv c=1 sm=1 tr=0 ts=6a7b2d28 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=WGM30ylFM8xG4-sDf0MA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: dF9GVQcvQ3AS5q359vQsZ7aPdQNANjQg
X-Proofpoint-GUID: dF9GVQcvQ3AS5q359vQsZ7aPdQNANjQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110118

On Tue, Aug 11, 2026 at 11:49:35AM +0200, Daniel Lezcano wrote:
> From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> Add missing bitfield header leading to the error:
> 
> >> drivers/thermal/qcom/qcom-spmi-mbg-tm.c:184:21: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
>      184 |                 if (FIELD_GET(MON_FAULT_STATUS_MASK, val) == MON_FAULT_LVL1_UPR)
>          |                     ^~~~~~~~~
> 
> Fixes: c3dce117333c ( "thermal/drivers/qcom: Add support for Qualcomm MBG thermal monitoring")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202608080800.RfxKb9uR-lkp@intel.com/
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/thermal/qcom/qcom-spmi-mbg-tm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
