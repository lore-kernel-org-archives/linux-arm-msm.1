Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E3F439015
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 16:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637767; cv=none; b=Mo8hHLmuHeoGabTxMrfVncjZwOnlKniYENSP+imvEMRjQ33C9ixFOfEZeJHsfiuQznRTAMhvet8z9QleNg66VwFHs2hpfgwsMCI6OJfooTli3s1Mlc1j8evflmdd6NxEd1O+44WOJVu+/Dbc22aPRBV2VocZdz/+h1BwONm4W28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637767; c=relaxed/simple;
	bh=3yrbScmpvSxIS3mhWUo9AC7pv+CjxIvuV1adYVeaK9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GtlOrcuWoSnHo1xTZtNcjIJQESUh4GCHe5uqW4DYM2B+RcgSvTZ5nvw9+JCh1t4PZhGebYm15B/bcsw9O7xZ0NRQuARx+AAjSupHJNsWKFGQmys6cPCBYc40vxjSH7FmY4x3UQSW4Dr2jloR2ol7BfxQfmOETe8owLXdDeiQENE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sn+MIkWj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UamFaU32; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sn+MIkWj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UamFaU32"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFr2H43181683
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 16:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nQigXckDkcyL4OY2GZibJ85XWo/01iQSzsDtvAyCXM4=; b=Sn+MIkWjon6qgcG5
	EKQGAIp/d+SMrI3ZToBkcc6gksApeWNlj6HB+FJvDW/wPEd31WPdq2j5dBWkm5V/
	vOJyBdNOZkpXa7SG1s5GSjFgyRr1RUWRUkZkQRUmJ4o+uAemzTmIzUrisV15Dpcg
	238ELuAcVaaPqsz50tGB5Mhd/S1PknUZXmPItlv7feyHa9vIQDyEQ9M9pNOH2qMX
	+gJaJhSoO+gfPDdK4UF/+jh2mGCOmkFNcv3aZfV6y638pyCKNqMnhmeuRisHHqrW
	9/Zqgme5j9W14zMC1ajs0DmTRwkYw+9YDCYLk2ZQxm5DsbidOFkkDpsPLquPmY1D
	6dowOA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1gy4r46t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 16:16:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c21c01cf3so1574731cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 09:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786637760; x=1787242560; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nQigXckDkcyL4OY2GZibJ85XWo/01iQSzsDtvAyCXM4=;
        b=UamFaU32KAy79FP9vMMsz1WskN8+BuhZOTwS/xK0f/KX6ZiR6hrWLJQXJ6qs0QgFsz
         DlizEVEK31t5I/sr8FxNFWt/A4GoDkTuslMzhaDt1trV8ONNmcQEND6oicxcxpSG3TBp
         be0wjqvX3wdtsbake4EvP53iYsQ8+gjlWkQkg/P6LgUVr0eahnr6PMx68K7FzFtmmSNL
         YR+JPHwopOQbofjo6WCBRaJTTL0fUB332KQB6EmDB2aS6WJCqJh4i7vSDx5+fnZ/xe4T
         U4uth8kH5Ty1ftpfUTegek1l/UZYPqoY+Gw/CVwygYE0YCSjhjj+Oo/3JutmWLNmY4jD
         IxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786637760; x=1787242560;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nQigXckDkcyL4OY2GZibJ85XWo/01iQSzsDtvAyCXM4=;
        b=gT3xrUIKkdwyVNkdH5a8R7k6FNkHengBvsV5rwSR85xY6UBxmyH6lPjJv0SAJQq+eq
         XqdETU5+TvnYaACCZdVwSbSEOExmZSWwd8h+CWDQsN+46sZJwQ+9GDtsGj4LdNI/w/1B
         gGNLIdG0OPQ2hVNeeAdm7TIjGXIqnOcErXWf1ZcLPtho1FyE5uJxLOqPUxVQdKk8H54c
         ngXIBxVOytbAoviM3wk8ToiuJxmByyDwXkcFfq6eqnFincyJNIGS2bxUFyEPXdZW4Cdv
         bF6c+bqwXG7pggn97ltGol2x6eOLgHBlwRIiJqUb4j6J566FCR7MvckZNWMCgYnjFbZ7
         ocfw==
X-Forwarded-Encrypted: i=1; AHgh+Rpmcnj7AT2hgBumuWRXSej8q+nMi0FuOOaRZTR10RQmgczFsKNzCRGHOeji2/UO47PTJdxl3Qh1mLloySgd@vger.kernel.org
X-Gm-Message-State: AOJu0YwKaYFyQWYC8I9Hpq9P4C0nWacU0OPilCEtt4QR5PzrYZxSFcLp
	GIVKq+WcYnn5M1D+gWvoMjI/5Qu19VC5u7vrQEN1AKUzkbCOFHvkl/i3U+OiOLqV+6ZmU8mhjE6
	Rz5w0jViMtHEi21K7R1Z5Zcm0fATGhyy+7myiuEtE2h88xXAwxFiR+fNGsSUSCP7rZVSo
X-Gm-Gg: AR+sD13msriSPiNnXYmIHcFPxS+wPsR4V/JOjzpCEfdswv4yhGl9E5+T12fXVDeeVNI
	iPtxmMgkJNSMYPiRZYUPGm3mZZjXEUNuYl8GlzPlJnp28PJ+y08Z/lpQB4G4ETCQJezPinNJNt4
	r1i6ZjKX8RS+wQXoKNLjYacpiMo9oLdHdSSyqzMCxNcVlf+7vHqcjr27YZNkCbncXFANTUFpy54
	raaosKb/4vrUJRpYHHbFqEINhEWuh0Qe6AE5CQzJva8orPSH0zkmtmBZ38O/Bu/+BfKwcK9c0fk
	yJsyynaH9kP5E0N/aORsEylCqPiRQra/5F/lPpD0fEwGQzGCYh/pGi4tYyDIM16kGLQGhpR0UuR
	3Ekw7ewrxcuIYO2AFIOnaHszZpZ6VVnWVQuuL0OIYJqNJQ6ZN3cvSnno1LCVzgM/7QRx+T5nuUT
	cc01DLNAg150Ic
X-Received: by 2002:a05:622a:1925:b0:51c:1291:911c with SMTP id d75a77b69052e-52d73c4bfb2mr80778991cf.14.1786637760019;
        Thu, 13 Aug 2026 09:16:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1925:b0:51c:1291:911c with SMTP id d75a77b69052e-52d73c4bfb2mr80777751cf.14.1786637759504;
        Thu, 13 Aug 2026 09:15:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a130872f84sm441111fa.1.2026.08.13.09.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:15:56 -0700 (PDT)
Date: Thu, 13 Aug 2026 19:15:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sm8750: Add GPU cooling
Message-ID: <bnkma57sumxaoqe5ommkmugkwpvqsb2i5drs2g5grzysikltuw@g5vaqnajtanh>
References: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
 <20260809-pakala-gpu-v1-4-207ad1fac1c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260809-pakala-gpu-v1-4-207ad1fac1c7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 2RoU9zkk_duPpz3OCNupGnlI7YO5HW81
X-Authority-Analysis: v=2.4 cv=ZYAt8MVA c=1 sm=1 tr=0 ts=6a7dedc0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=i6UeDzd0F3NWq6oLIEcA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDExNiBTYWx0ZWRfXwTUxxCtUX6Rz
 4eOAtSqZQYBLM0mxDTMIvUQx+7/hkd/+UB1ZjqC/84sI0vWaiDqUqev0SXBxSOytE778KFQAE/y
 85yAtLgrkC6+Fb/a1e5aKPk+FCSkuNI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDExNiBTYWx0ZWRfX7moL/OGJDlV5
 wftvR9DIB6GzdeRX4o6U+m3fFMSd6LvlUC+UiEcxyCE08736U29l6P88u40F86f2BK6Fzlrmlyy
 Fi6vsyH0C42z/K0gdPHcSs5IVlWOYVFFR4ez9BF7YMm50c0a+G7cyIpJYWpwiqJin1x0IVXdKY8
 xNqI/dyDpBfui/ifGBLxl2EyVIkkgVtpUHls2F2kgiiWdQ8jMtrMHeZM5Wcs8VkDBI3ZLDg/b8a
 J2hcYglursWiMw9UrzL8TWxuDrJwZhXyCX3GsAnV/irM6SQRPiEFvtDlSovhZs9nYLpSk3dztP4
 kVem1yYqhFgZxQodyyJFe+n8kxFl+QFiLXMeLPMjlcijhPnlcEIfv2Xb47monphdn+zPFSgyb1T
 BBEvpfIR3pm5oT4UJoBg1Nr8Phy6gl+cplFiB354OgUdEzQcPiYdrI80T3ovjOOyUYTk4gl3hQP
 +kmwcS8lmqvwPNVdetg==
X-Proofpoint-GUID: 2RoU9zkk_duPpz3OCNupGnlI7YO5HW81
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130116

On Sun, Aug 09, 2026 at 01:53:11AM +0530, Akhil P Oommen wrote:
> From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically
> when it reaches high temperatures.
> 
> Set up GPU cooling by throttling the GPU speed
> when reaching 105°C.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 104 +++++++++++++++++++++++++++--------
>  1 file changed, 80 insertions(+), 24 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
