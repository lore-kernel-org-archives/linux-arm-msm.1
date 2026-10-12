Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003B7478E20
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806763; cv=none; b=No8hAbyYVaaTZ+RVnzzG39VMP/LYMtMSX0QerSqAwAXId/8iXdfCwDf8Rk/9EkWLASiEeczNcCmyC8nkU2BA0KqZoo2jM3RMEOVcWQ/2P+QM8EKBGpvU0YNRYBnBCzC+lWCzWRYKmVKBgOphUhprCJzKYEsd+SsMKSYymIOSamg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806763; c=relaxed/simple;
	bh=12M6TPeIbT9vbvxUSeNAvCnDPU/QHc4oSgpjoRCUgt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K04V3FeO2P25HIwybduzTcZfXSRGxqflfUXSWU3L8j0c1lU7UGSEi5uIiCDGUFCHNHc6TMm88GX8VeU7Y38MSfNlxwxQ1pCH8Ajqo/LXcpHyPo9+Or2om0u/En0ZuAIhi5oGkP9C84X1/j9b8t+l4w82qBMAf8o7H3ifT8uDY48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gk9YS+fi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eA7GfwG7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gk9YS+fi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eA7GfwG7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0ack2679908
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JQGb7wV8QBDsJJE2TUk92K6f
	TbAus6ZSYAa/PxD5KS8=; b=gk9YS+fiYhiYoOO70Lz+G4t69FZOmw1SOidJInvb
	V5n07EXUAWrIBNNZ1FhH8BaA0c+L4df1zTU6TAVQ/A0bIISM26HBJV9GG7MGU8lk
	sMRFJdX/cIprOaU2mbk+clOqZ3rq4pOoXZqxZd/79Y/+vVt9hfG+WEG8s6Zngisl
	+IAawpjPCd22/hHbQpE6aOJDLPKSrIC6nv4Tc47+7Rcdvk88JLGZavmYrkB9x0rn
	ryl0rdXESfsvqUlcO79WI1rgT7IMhWd0kXz7Qnb+4sFwxVMoCZy6HqSkbMXTcCLl
	meSyXCZRySuwUoU6nJrPFhcCOznmH3KlOTG4Tk0e/7/Qzw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1stmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:06:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa34873bso383282285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 05:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791806760; x=1792411560; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JQGb7wV8QBDsJJE2TUk92K6fTbAus6ZSYAa/PxD5KS8=;
        b=eA7GfwG7jf0R2/ZKtEWspGUuTVS7AIZh6rSTkcdILaC308SKS33cSZnbnLpI5m8YFq
         4uPmofeufX8aRL/9MQQSN7GTsGo2d1owyd1skzCNggys2foDEtc/ImiGJFIGWOmb5AHP
         mLHvy5j2hv0QmZv7vfB6g7UiwTWwtRKnjTjfG4AnUr2JUZOSvlRWwSCvNmqqLS/ZXwNO
         wT7kyh6QIzfaDxe/ynTds09lH7hWufN2RD3RP2W73DfqpVzzPk1xengBTU79rKnnWDyQ
         dUkrB/6fiNlb5gAcsVTvx1sg8ucUUFzBHTY3Em5nOvNit2a8/ty+jLmg8IRTTgoc1TIC
         Rrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806760; x=1792411560;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQGb7wV8QBDsJJE2TUk92K6fTbAus6ZSYAa/PxD5KS8=;
        b=IT1zSPelMfNb1w4Sgix+dVeHXlMF5c+sV9hQOfKI7dqKDMiyQyVRluMvutoQCiuRiF
         Fm2Tj9ueg4aEg8pPfdNBQ9VuVGF0JGy66DEZVZAeIcbtwDTHrjO+KO4Siz0Gec4dzbr6
         QnAN0vFOo/msGVvWiwX8Xrg/6dG1rek7puQ3h88JigUPpBnZRu68npGxytyzuZiYOtGG
         MknCULnfM48ZxBY1jKuM/atTBVOH4ZRNqz/3xTTEFxmsuM2eMJhHIeh0xEde+vZAefV7
         zUo79ZbnXpZEbbLtqINet6fJoqpjGXLjcn/ro+0JI2haXJGrp8d7hzvE8RXJVFAfWmL/
         XQEw==
X-Forwarded-Encrypted: i=1; AKwUvBzvhZ/XCiFhPfeMYrikGQ32LYg6X6f6d22b7HHxF91zM127bPOw79VTOwRaZHuknlySfy5BLx3Sq6IXaKCM@vger.kernel.org
X-Gm-Message-State: AFq9FYLKUTN+G84MZ6osFH3gQpwzRA4ELYQl4qzcr9hT8rMH48RBCdLP
	6Et1sduo3dbpwSsijJ8jhQ85qdPJhMuL8OfThmaOW+Zcr4XRhb1jrYrvO+IGbGIZh7aYG1LdCtC
	01dH/q144EjfZl1twGi+Kf8zGC0bb2cLzSuVuYdZkCiByIjqWWowJzY21cpMQJA8ysY1Y
X-Gm-Gg: AYBFou3gIJU3oW8+V7hYea9g/SPcvZqeQ9Lusjiw8uJjmTN047VPjeRc5oStUU+wIzE
	Lj0bCms+IKXxPN4zn6NclLWmRFA95+EtrH2MW8ENZuAJn7BV/V6E/30fOn3q0vkKQkCxHqkrv4D
	BBP6tQ0ivRbvg8puVGKDGvB4JwVZmnOxPbLMC1r6tuFw0oxryrt+LWsvHtbCIWssZlRh2izvM3G
	4ReypLjZzep8ajxUgYP77GuAm4iiPaDm4Zr+kzmpl2HVFx+8Jm9727TGAaTxC+DhRy3DQeAvUpL
	fjWzLsVK79TSM4/y08SaUlewEqPv1QMLiRHo3xDg21QhnlQmj+FbO7OKkc+InV55Hm5Zn7I0pQJ
	2BNBUiYO0uRkyPIjyItmyIxRqayrM1ilaG+2ThxOZMrF2XSDt6PQZg8MuNMy+5R1fGfwOzOGf2z
	O4sD1YM8DML1XP
X-Received: by 2002:a05:620a:371b:b0:93e:6c4f:bdfb with SMTP id af79cd13be357-93ebd22ab17mr1631959485a.48.1791806759558;
        Mon, 12 Oct 2026 05:05:59 -0700 (PDT)
X-Received: by 2002:a05:620a:371b:b0:93e:6c4f:bdfb with SMTP id af79cd13be357-93ebd22ab17mr1631954985a.48.1791806759159;
        Mon, 12 Oct 2026 05:05:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9ddd8a0basm11338201fa.5.2026.10.12.05.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:05:58 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:05:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/6] drm/msm/dpu: rework layer mixer allocation and
 mode limits
Message-ID: <ahg4xrildtnicph5ecwknrxqwkct3odcjkfnsc6ehympy6y5mz@ddwmentwnuth>
References: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: _IB0OSX5e3FW50yndogUbD4ApW45-l8k
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0NyBTYWx0ZWRfX4Ex36aORCiSw
 iafwVCyP4rYeqSnRLUuPCQ12CTAmVC+5eelzUcL+pKfaP+IuVDCAcQ8G3Lt9BcWhsRhwg8ybR5+
 Egxss5I5n/T8yu5BF+hbyBXQPlNtzIA=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6acccd28 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=SCZu2Cd3t1KZmZdEZlMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: _IB0OSX5e3FW50yndogUbD4ApW45-l8k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0NyBTYWx0ZWRfX0wvrbaW48Hj9
 PaSasfPMGIuKJNH7tjM+TjkSSOBefgy1KRa4Of8MoL30woKHfuEEbdL0Gn+GNWguY/DmGI4TkOo
 eFE/xg7PGZGstHdN4xWXAesYese9ag3s8W4s2ezTd1CDHxHeRnL1rhob6VhPrtJ7bzXCJCJPY5T
 XcJGIUC/fcVNcmqBiCm59OVSnnZG7mm0BiuVgpkJqO30hRZP6gtj1sIAMwlEyGv4hso4uDpg6xK
 rMBeKdlSDZwAVZmSakk2YqW48xwzn7yYXlTK6n0YVoN1DBbqXX8CWMhqFXFthvKkhHiQDxll4S7
 i2+uu0e/W8E4tPLhxqyMjYs6LReqVRewzvTfPZ2WslHYK1ThSVUUwmN6X4tlbVsQwpa9hWb+ehJ
 h4GOxu0k0687TzpiWtSDeYYxCxP0HDkJIf0OKQ0WHylVX+SuktT6scpg54ljxwHBJ84QTbGni+r
 s///+w79U8bCoHIH4+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120047

On Thu, Oct 08, 2026 at 10:53:46PM +0530, Mahadevan P wrote:
> Currently, the DPU driver bases LM reservation off of the maximum
> supported width for the layer mixer and an arbitrary MAX_HDISPLAY_SPLIT.
> However, these limits are not hardware limits meaning that a single LM
> can support higher resolutions.
> 
> Switch to basing LM reservation off of PINGPONG and DSC encoder hardware
> limits.
> 
> This revision also adds clock-based mixer selection and a source-pipe
> width guard for mixers without source split.
> 
> Assisted-by: LLM
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
> Changes in v4:
> - Rebased on msm-next, resolving conflicts.
> - Added clock-based mixer selection and reused the helper in mode
>   validation.
> - Added a source-pipe width guard for mixers without source split.
> - Extended the catalog cleanup to newer platforms.

What was the issue that caused display breakage on the CRD as reported
by Xilin Wu? How did you fix it?

> - Link to v3: https://lore.kernel.org/r/20260112-max-mixer-width-v3-0-f98063ea21f5@oss.qualcomm.com
> 

-- 
With best wishes
Dmitry
