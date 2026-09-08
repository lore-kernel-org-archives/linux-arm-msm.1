Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0E451474B
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 11:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788867841; cv=none; b=SAHXNL+3+pFfdL+kG7zJ94DtFLekaooamoGHzY5N8+XttM3TNREe1j6tPMEKmhdWlR+x7aL6tuZF8XFX0Rma253WBAXozyvvFwGG76LhStcRBLv2iWgvg8Dq8tf3dljEuaOikN4GpeDhxCKxmLaCYJXQ93Bhb+Hyyv2dRi5coEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788867841; c=relaxed/simple;
	bh=1klMqRFtUdYaByRu8GO+szw4t4l9Ph0YcFP9HtIkvhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RX3PiLiDhtssrccSlsAzyI8Y4KCNH1aN1w7rtASFbr2y1J47KnifciregTlrXv2CoGc222kxx9T+BaIJzYAwOFn99z+jNdHc4TL8t+xFfK6g/3Ga1Q71TNw5nWjRq+YRfS/CD4pz+JdtkDVQFR0C6qNe7B1u3dDCIy/fFR7tKx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OW8SIQ+B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HF2d2ASz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OW8SIQ+B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HF2d2ASz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688ADUQD1472666
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 11:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eJtXEg7vUHM0z0XVM9YoohNJ
	DcSIprCrERl1dn/YsEE=; b=OW8SIQ+BWiTQ4NAr/sWsoSSCrvxrmTzclnnTdZK6
	jBUHASaBiQTy7Gv5ZMwczIYe2NGaX5NiXrJeyJq67KCClIeN7QT09a7DePqn5YIm
	ab/z2gDOgXY5+4GlmgaI2NoVQWKeYxweycwz0Uq3zUUY1t+jXNYwk8nolK6xwahI
	iypTBdfTkxNdlT4GziH/AjIv77KwSTNopEYc0Gr1eglP94H2fEBhXK05QsbpvOkC
	dlUEOFtDxGpBLR5f39EsA+J0HG4skPE7oTwaq73rQNStMYIEIaJUPPprhXpS/Nqn
	gmFgvZVWUuqfKAUhjKkojLuL9s16qI8v9nV6Fc4SVW0A1A==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcrp9apx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 11:43:53 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98055f91346so3049720241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 04:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788867833; x=1789472633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eJtXEg7vUHM0z0XVM9YoohNJDcSIprCrERl1dn/YsEE=;
        b=HF2d2ASzDOIarr5WfoC1LIUcmKi+0bpv2+/OLDIA8b/IDJ96U2NYvJ6ZUNfUGOxhzY
         JcSnT7Nlmld3w6z4fuX3PX6mzy/SUGKYKsEtayg6qFqks6PXLIdgYEJHnXXuRKA+iKd5
         XWekfcQgYCaXAsHvocUIJ3T6C8YamS+iNDK2hKRdaYCamK+qArKAkA+Exlj1VWJqurUW
         /nLbBidu9mVmYsF4CwxJ3KXhYcDVFXDeedxynW3kl264zMsOgebgEkcEF14uLCwLONPt
         Zx+F8PvPhIJf6EzgizD1DB3bGNsTwpbU5VLJNuOtvuu/jrfIwz3h7WjMLWPjHMm+CvBH
         tWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788867833; x=1789472633;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eJtXEg7vUHM0z0XVM9YoohNJDcSIprCrERl1dn/YsEE=;
        b=BH8+b+IUM+oEVRziR7tFb181f8hSHQMzv6AOM76dsVFBRHC4OSRceP09VUYWqEKXs5
         BpUw4OKnI9x4x1w3Grvuw2NSryEWAo+csCzRbuYidNVSd2y1jFCa9FbX7H8NtZNINQTz
         s0jSV0vplY11Ch4Q3NfcDlPZ00oQGRwdMz38a4+3+ocex3cH6NiEZ3AsQQpCDpMIAU6A
         ogL0LhhZrOYEGJU9J8c1NMUw9ixWu9XvA/+cp+Vur1uEP2b+P0PqfTLm11AYd/yFU0eK
         7HB9SiwPzVhG+FUF9IAJ3ZYbjugGZQkjzZlTo8uyaPr6T0Db+QAj+DlCoHHiscfu2K1B
         4z4g==
X-Forwarded-Encrypted: i=1; AKwUvBzsyhA4/x4ocT3aUC6oKCbZF1I5acX9KgUZMWn3IjawBi4/U818vMboBxp/Qs1p3CkplIbHm/eoXY1YF0y+@vger.kernel.org
X-Gm-Message-State: AFuF++nQmP+VVlwj/r2MaLljxim5hQvWvylNPciJG0GlxBJ6qE79Tsmc
	TX5gILKtUK04uGE4ZKAcrIVtBOcwsbNGK8G3BzoaboHtOaROnI5GofObJLxyzX7czZhkX1IQ0oi
	zJWioYSz/mdmatH7Hd+wXU7a52QKlCWW937B2kxKOX/NiTiRrQVSjMQtKmhB8xuNjGFCLRRppYr
	rt
X-Gm-Gg: AYBFou3+Hd/LOTyWjIdFr1223HpmjpVWb66gQts7wN5QtOz51bVfyRNLHUwZ7nEQCfD
	DzOdMc3XhoivegZf6q2tD0Ns6ERBDl5PMulcfG+Cij2XIXjsj3oa7mekAcpK/jCyox93NYZ1RII
	18TwsFrZ+5Qv7AxO9Ehbe2ZDoSaKvhAu7Hk+M8JdzKfbUQT7eN7KUDo6WBiFI/xbLmofJNsB564
	ZrVhnlXwzbLGvlMULeQHalfdxNBkl2geLU2KhkGWUvyxqVXcNHC1apRY5OeWiZi04ImtcZHNL6K
	jqZgjQRsOD/ecyrI5obSarGaQGTZKsJ+OP8gva3/tbHwX5qaONb9noW6oMdEeyZGZIRuCRqK6Il
	j3wd6s0gUjzNxp8hzrsdhnhhGPqMI1U6TQ0rCd88Q7tmaVQUk/4+m5cbt6zEe4/EcoKWgkJzKOR
	3obKY2utk4qQ4b
X-Received: by 2002:a05:6102:5093:b0:783:79ac:9db2 with SMTP id ada2fe7eead31-78a4a64b7c6mr10797469137.3.1788867832650;
        Tue, 08 Sep 2026 04:43:52 -0700 (PDT)
X-Received: by 2002:a05:6102:5093:b0:783:79ac:9db2 with SMTP id ada2fe7eead31-78a4a64b7c6mr10797436137.3.1788867832062;
        Tue, 08 Sep 2026 04:43:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b619820db9sm2943377e87.54.2026.09.08.04.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:43:49 -0700 (PDT)
Date: Tue, 8 Sep 2026 14:43:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/adreno: keep the GPU timestamp monotonic across
 power collapse
Message-ID: <le7zslxe27qauz7duczbxl4rrd3kbekg5cwxzg5tmsy77r2t2z@7gdoif3yfkgg>
References: <20260828-b4-adreno-timestamp-v1-1-273525da144c@oss.qualcomm.com>
 <80eb9f51-9cff-4c07-822a-759360617cbf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80eb9f51-9cff-4c07-822a-759360617cbf@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=UfRhjqSN c=1 sm=1 tr=0 ts=6a9ff4f9 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=OqzjHUTi1ChSdUIkaaAA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: InddSCVZ7sY_8L3Lyx7hBh4yhsldWRQY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDEyNSBTYWx0ZWRfX+dT09vRc1uh0
 DCDcRki0N2m7HX411kxKFPm8G+NzNa319JLRiwd0vE8Do3qBVkWaVOF3VysnJ8WQ8wwYjbvQX9R
 ndqDYcQ/PCeThHsooStM6M1O78RHiTCYdCvGUKfna6GEcM5+ZBIgkM/b/LBSm4IXCw0XBNyAtID
 S1TL9f+DckOT25IVksKUOwdb5G0Svb2XbJ387QtmzNMarFElZDM9znI/PLtzhOobEjelU2kkYRY
 Bo2D2SuzGyTsSVvE0tGN2s3Ef3dcBBdZj9g0cnUlJxAOj8atgV9P1CnG9/uhvB4p2SFogqYPE+H
 OrY8plzGBITE1SUrSwv4QwzfzEFlRMdwWsyYWNKCINfezrPTB4pn/igHcB1a8hQoKBaRc8BH9Qi
 vEa5F74Ofm0Isr1nIlk8MsG+6GRVZmEKDdv58LKx8S68/bgdMbTevrO1tyXB6BJBw3qkdLTkKm4
 7FGZeCJEGllZRQsiYLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDEyNSBTYWx0ZWRfX5HUejloAEElY
 S0ioAuYdBwzDPXojMgkVCegOqKGjnQld9GkzVzV0tFZY9aKE3buZv5kmKgD85UMgvgzbtSY3Pum
 RMPZr47BThii8KeDfmkMjJXzM869lmk=
X-Proofpoint-GUID: InddSCVZ7sY_8L3Lyx7hBh4yhsldWRQY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080125

On Tue, Sep 08, 2026 at 09:03:55AM +0200, Konrad Dybcio wrote:
> On 8/28/26 1:13 AM, Dmitry Baryshkov wrote:
> > The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU power
> > domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts from
> > zero whenever the GPU is powered up again and the timestamp reported to
> > userspace jumps backwards. On an a702 six reads three seconds apart all
> > land in the 500..1200 tick range, stepping backwards twice, and on an
> > a530 the OpenCL device timer conformance test fails because
> > clGetDeviceAndHostTimer() returns an end time below the start time.
> > 
> > Save the counter in the suspend path of the affected generations, while
> > the GPU is still powered, and add the accumulated ticks to the value
> > reported to userspace.
> > 
> > Assisted-by: LLM
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU power
> > domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts from zero
> > whenever the GPU is powered up again and the timestamp userspace reads
> > jumps backwards.  Accumulate what the counter reached before each suspend
> > and add it to what is reported afterwards.
> 
> Could (some) a5xx parts use A5XX_GPMU_ALWAYS_ON_COUNTER/0xa879?
> msm-3.x defines it as KGSL_PERFCOUNTER_NOT_USED fwiw..

It seems it also restarts on power collapse (so always on is not
actually always). Also if it worked, it would have helped only a530 and
a540 (MSM8996 and MSM8998), leaving SDM630/660 and all MSM8956/76/53/37
without the fix.

-- 
With best wishes
Dmitry
