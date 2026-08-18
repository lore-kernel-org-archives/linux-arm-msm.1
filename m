Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05B24519A7
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049636; cv=none; b=f8476qDS1HyXLeq31eGgyPxSG54UTiIxdCaSszY0T6wgw65dJzOlXuZMgkBMR3UfwkZT76DP1Q5ZYd3/74MxW2W+9yawq6pptmbIpF8+rDtaLAmC1k6xy3Z4OxWNZn134NJzf6F/8dQ6ESZ1cPB1uRcotXiI+QGajYrdOEycdo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049636; c=relaxed/simple;
	bh=JfVZGKTRKN6UKtfQwoLir8mHm6Rec0fxnWe518wunG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J4wX6k1z0DRCW+cRF4DB7HW2qaRy1/CmBoVGoiLPv6n9dSSjb5+oTRI0nAqk/oSWcapwHNcUc1L1+tZ9erFTUYqcX46bDBLNndFRQ4d7SgVx/rW6/WTDWJ34fMWBBN0TbHHBvUSosDImL/LJvK5jX4F3JR8bPO66olfazmD+UYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JzBOM1zw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QO5JLabw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JzBOM1zw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QO5JLabw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABRPK995813
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AnH+0QXrWlD6vyCJWXlr8r1LgxYaD69L2S6S9TrvEN8=; b=JzBOM1zwrfzILJEl
	xiCIDFHgpfHTv2BBYBURZs8BkOGG+iRDla0mPTLH4XPTybkmJtVPRk22Ep2+RIVa
	Ujc0ktiaFRJGLa/LOVFaCsZdWjTmUUnjSug93/xufxgJKS6StaR1eIMHs9qCVIpQ
	LbD6jUCEGRdgtFP4SrCe9UtW+IJY2vXGVr2XQ2XwZI/d5VoUnyrFPVj18M/MVJ9w
	l0AxGI0AdLDcASENkRVPK9u0foU/mKrCp18n614L+2oDF6gNv5WJJGx/UCwfIMFO
	dnmP3+VoMd1tlalk0Yllb2/PLzkOd6chGtZY2IyMGhGDgV9addMzlsmeabFZV8Wm
	VnsU4Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4615ky4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:40:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e661ce1dcso99925485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787049633; x=1787654433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AnH+0QXrWlD6vyCJWXlr8r1LgxYaD69L2S6S9TrvEN8=;
        b=QO5JLabwaHz2EkMl5tF6CyxRwEx8bC17DUBJDCtIysJm07XOm27yeMD8zf/ssdu+yw
         QMnrAA3ar1epbwwYgzFon/zbW/8Y8zYpMWJlVISDIegLzA7H563hH4KIKMyjoFKd9SAj
         ITX6rQep4y6qUiwuPNjrT0w9e2BUqMGHrLbNsDtlj2FJpiZHkIWcoPmr1XG2gj670weH
         xkDvvxbb5SLHlJQlFxCsZUBgHWNUe0ndbm7UnkGOzzNWSe42m38EQ+cRL4Zj6YwI5Sh+
         Mbj+i1oMYGIWYpu5eewMCaC9hTcjFJ9vzaCryCcGDnE+nE2WzFMwOoeX+O1vKQzSdLYY
         sWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049633; x=1787654433;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AnH+0QXrWlD6vyCJWXlr8r1LgxYaD69L2S6S9TrvEN8=;
        b=n04Q9c3SYHseaFd4sjyrgjAxfDpdlO/st1Zw2/8gkrPj9+yFnLXyJV7IpMyh8wnum/
         voVXHIvvpJZ9vYqUO0hrtTyhZjfy9UhSr+ZSH3SE9Y0HJaQRn8/s2XoXgtoSS/CyLU30
         NP+uiWVk+kMeRGnTc+VPSEwFYhmTy4kYBLTKhpfqQJLvavWDU/5XRZATzW+w2geiyD4t
         xHz8HH3E0Iq+h6k+gXmrUa+PU6wi05ob8he12hpm/jCjZdTN8oKPi3JxfxlGiDMyLXEf
         zqyjauYNUu7EOEb6edfrkxXP18cNgxB9kte6KSkZGeU0b3jEnz44dPT/pVYWZdBTbDrF
         EAmA==
X-Forwarded-Encrypted: i=1; AHgh+RodcPy+NuGcdjjYpo60K4ww5SPt1L4/D6zPbAn8KyBHz86gOYFBjaXwGOKAAXfI38mb5f0XJwUNKcgbT1EC@vger.kernel.org
X-Gm-Message-State: AOJu0YwKT3QKYKQt1UmqGhJ4U2BTG0EjsvUnzUWT6TkHm/4OPAoc9TFE
	SmF7/J5A7Fhd3coHPuj7p2ycdILoys86JVeaJ9OqZYoEBUXZ+ygfb2gorBullXOcaU4GldiZPig
	CzY/adjnLdWbvx9GZWUFM8NDxaYIcFi2DWk011F5wHJMWbsTyijoUGuN3ik+YlquUPcwB
X-Gm-Gg: AR+sD1147AyvPYYhv/tCxpG5bQydc+A6p9TwwN1oHFdfr4Rd35KckbO8U1z9h2ZBM+S
	fzfCFXuRiSgJK4HfiwcYioRXuh5CT4zDYf4+N2N1T2qfZfDOcA5uWeqhnqy+ySFJB6fQELbjKK2
	WOMS2XsP+Pn+OVa2mTWssQ+MFVH7+SQVkyURlniG0rdsEV2KMrtwNON6xtXUsZVPYn9JGrcb5fd
	AS8vJDuxOXvNVaNqOsm1hszN1RkUjlv7kB1CrDtB0KmV5DIUsYqoizw8KZBD0MoZbmvnoVAfxVo
	PVcUowd+fYveMmTnoS0y4cFd09yB2jVTPyBQijP7HN7UdxvWR8Ct+BF4q0h/K2vzPSzHT08IIl4
	sJHGSbGeWV4fPOBO2tj2nQMW8
X-Received: by 2002:a05:620a:1a04:b0:92e:6485:f640 with SMTP id af79cd13be357-936d261aab1mr2297577385a.4.1787049633285;
        Tue, 18 Aug 2026 03:40:33 -0700 (PDT)
X-Received: by 2002:a05:620a:1a04:b0:92e:6485:f640 with SMTP id af79cd13be357-936d261aab1mr2297575285a.4.1787049632914;
        Tue, 18 Aug 2026 03:40:32 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d85886bcsm1765658a12.16.2026.08.18.03.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 03:40:31 -0700 (PDT)
Message-ID: <e5964398-cc23-440c-8c69-01353b5a5ecc@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 12:40:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: fix autosuspend cleanup during teardown
To: Guangshuo Li <lgs201920130244@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20260808131624.2854412-1-lgs201920130244@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260808131624.2854412-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: q99HThGbQSVJD-W9hRq1Ql4ggYGcypiJ
X-Proofpoint-ORIG-GUID: q99HThGbQSVJD-W9hRq1Ql4ggYGcypiJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3OCBTYWx0ZWRfX/RBcjj82sbYC
 AAEkkNBuEy5mYxMwkOoOhDVaZqPoe1p+PRZJ1ChFNICsP8ibGUd+tQ4MdKS9jPVM6xQig7P7N1c
 JkEp6nmycbt2Bxv1N9ABW9chskGepmxzqj5pnfrJAxzGzaIaTquxXs1onuvW3OCbGrrwfZBdrpI
 eHnthgpXQYSBaHul3Lj/lxkutz4nXLUPxPh7c2BROXgfezrvKpsH2ffi9i04LyuiFf3NJs6ndAA
 Bw3jV/NiVP8vdD6hNjeG5uBu4fDf5fLmbmDGEzX3iQtTnQNSuEGxGlNI7oPRoVGN9GKcvl/zD/E
 D+LPw4h4n1uTBftaXyigDGc8poe89NTXttrCBO+7CNXBvA8WKTNHEEj1uWTzZfra61GBWle+iDv
 6INXM/fIXuJWJxIfj+gaqOcZyff2EGlQAghJ5LTLKFNFNDoWlkTd2e4gp4A/04w5zsNWj+F1hE5
 WjwZGG1grnmE890ZvwQ==
X-Authority-Analysis: v=2.4 cv=Ruf16imK c=1 sm=1 tr=0 ts=6a8436a2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Sp1j9OMB0jjwDDl5ZD4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3OCBTYWx0ZWRfXxVBRorx1QZUK
 8+hXQJ2ro75fNHhJLUT8H9fu1RN5OdWDmXePyHSJaLaty2qt0k5SnQQeCSD3MOpMy5jgLAVotvd
 rq0i/HbG5vEbdcEJ5RZXRifdLN/K/WE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180078

On 8/8/26 3:16 PM, Guangshuo Li wrote:
> adreno_gpu_init() calls pm_runtime_use_autosuspend(), but
> adreno_gpu_cleanup() does not call the matching
> pm_runtime_dont_use_autosuspend() during teardown.
> 
> If the autosuspend delay is set to a negative value while autosuspend
> is enabled, the runtime PM core increments usage_count to prevent
> runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> during teardown, this reference is not dropped and usage_count remains
> unbalanced.
> 
> The documentation for pm_runtime_use_autosuspend() also notes that it
> is important to undo it with pm_runtime_dont_use_autosuspend() at
> driver exit time, unless runtime PM was initially enabled with
> devm_pm_runtime_enable().
> 
> Add the missing pm_runtime_dont_use_autosuspend() call to
> adreno_gpu_cleanup().
> 
> This issue was found by manual code inspection.
> 
> Fixes: eeb754746b14 ("drm/msm/gpu: use pm-runtime")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---

I think we can use devm_pm_runtime_enable() instead, which will take
care of cleaning up both the autosuspend and runpm halves

Konrad
