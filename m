Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA4336196B
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786443561; cv=none; b=l5yk/T0o5JzaMUaSADQEycP0wGVE/bYUz8rGKbF9EUzO4tO0jUsXUPZAW+g2raM9csqh2VP1dYkKlr1sn/uhxW4d2M+/3+BZHvVZO8QAhHiEUXpskiVTZz9h5hEt4SUno2ujAIxvaLVdrUFBnh8rigChYUJ62oGFj0gEKlu0esk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786443561; c=relaxed/simple;
	bh=yIX0AZeDSBCxEM283ktfqzeqM9UC6TznRuSs2kcJaBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iElX3hfK+1KrFLKaSY9PlsMtwFPmfUfAuzMdRWB9z8Z7PPhJHvwdtgxMYL/rdsC2w+6Ozdh1B03qi9mjSx4ezJuRX8wKwVFb/U+HhFdqEJjaMgwfZ8o78r9n/Y78asnirg/4azx59z4az2kVmRjM2z+DcAuvwMqoI0rMFhy+yTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aEqFXb/Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M8NG32OC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aEqFXb/Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M8NG32OC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BA3aBS299049
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:19:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OkJhmhbIilLQammOt+nQdb0o
	o0r1qouASRnfUNYThiQ=; b=aEqFXb/Zb/AcfX4XwnYbi0fIRplVtMEbl7bPsWPU
	6SxB8AVHa4apVJIHtqBA2Ac3mEf4lMpoHGIgsihAli5yIScg8OAf98Z8GAksw/9B
	wp/sDmPFZ9Wu0OhG2hPaUMJPzhtVKQfdjyige1dvaJqq3hF5iCyo9XBjhHXiFmFj
	2hZmqmh4zTaagp3CPWyu+wCQE4HPwC/MUlCMgVVRbPt8x16RKnJKcy9RpkWHD9vG
	V7WEzXd1tST7m4ZzD3zPD0vzZKvZZOyO8KsTI939rLmrfipyjCCZZOW8ic6N9f+z
	ye/Hl4FSBYv7U9Vu+SSTDv5Fh2qizoeQcDsyIxMbmDnnxA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01nc01qc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:19:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ce64c41efso51880211cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 03:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786443545; x=1787048345; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OkJhmhbIilLQammOt+nQdb0oo0r1qouASRnfUNYThiQ=;
        b=M8NG32OCxKAsGg285+eNiXR2ELxCxmxzX811E2c2HF5QMskqyan/WMHqMMCHqKYqIn
         SmW+otVDMOtKcm12dDLhHg5OZE4Adyzx2DMH4jMAjbncmi7akXIbv8AywcPJUUMOidJw
         SqYyg6Uu200WiqwItT09H1jGt8tcKU6s9Jmz+wCr6CLNEjNuFUediH4Wow5+Y5QDol4X
         DshWe1vsaiEFPS46/fdwGgR89r0IJSjnKS1JFcYMZeXqBCeU+ljr7+kosV8k2NEg64W9
         LoB22Zh2I5CprkivtxCJWPr1mIONuIu9od1I+m2i+LDJCErgqHbGb4A7TpOJgsQX4tX8
         l5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786443545; x=1787048345;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OkJhmhbIilLQammOt+nQdb0oo0r1qouASRnfUNYThiQ=;
        b=ADBytFuLU/AL16dMfCv2CpjfY/6QCYZlWkMFufR5i4DKY2y1g5krLwZCcOGZTgAof0
         vsS/uFioUXSxWovN9yO+Xy/MgpKGX9j9Qq7bnpPtsMIMsA4Y7997TFwU+EQLF0ghvbNi
         042Z2GbZ13Vfp44ZrlMgPnyIkMrrmIzhyeT8085ku0N+E3QE96zzzZWsi1n8/w0bAvUb
         bw/4syyNgRwTU1FQ5v7do0LM2JfaOLNpTs7A5d+4nW/MTa8EkObgfcKgVuLfhg8FSyC7
         VyT3yEEESk8sWDEoYihMucysaIEMoItNQtLHbPztF4TOfZWpMiJHmEtREIHQz9NnA5I2
         sTBA==
X-Forwarded-Encrypted: i=1; AHgh+RpuLIWeTgi4K5zoDGGs38lEaV0J/v+gcxvqjJu/QF49EZpm1yrQyzUDAKCeJf+gRayi7AqTbgdSW+/fB1/i@vger.kernel.org
X-Gm-Message-State: AOJu0YxDO2Rij8aZaQUyBP6+FbpLZRfKvz3S6/xcDIoJyXDqWSD0GD/P
	6j6AtFHaOK7NvDz6ioJt6M/UmhW2NJUFhmYbCbw86B9bOgZDLc30XdNNPZjZ+Sx+DjDtqZCzTo6
	KPJQUuwwdxr+/1w45oS4kIMasC72d/GCxEKvzJPkz6ojY4DkKy77Ddd+cUjHcvxOCv8q5
X-Gm-Gg: AR+sD11ArqrywoT0jX5iECna9HSGC0IjylFYuorY6S1QGmoP7HIymbZvza2PYBsoT8s
	Q0NCARZvruby55NizMC4H4qghSQR2Km17lKPY7xp47+iiIhyQ6dHYuWEHqzcnA9j4jzDWMykZKU
	/NTMlELCal8w7K4+YyNfFI3rqO1z0XFR8meZeC9JeUoIU4gHEEVNJCvzglbKYELPBLgWUC/rDGJ
	DeCe81njdlm964g+64YJkbnRHgCqZotVaYruBZcW1zMJrf6jQf/nbe4IBg0FozUeZtZWKg43upg
	+He7Kmt5O+qFYX7IiivWz+K1h5m6ty9HSGhGj+3x96hoGzOJ9ZgstphryYRTviy2BKasJyXc+hv
	dzgXekEtqh66Enq5frx3g3pEcq9hnqUF2/rmCzJsU5o0wEf3GIYRJi94AxHAJhr9x+93YKkYGwz
	1++72IUb3MlN4gOg==
X-Received: by 2002:ac8:5f47:0:b0:51c:a70:5ed with SMTP id d75a77b69052e-52d586365d0mr15297741cf.30.1786443545259;
        Tue, 11 Aug 2026 03:19:05 -0700 (PDT)
X-Received: by 2002:ac8:5f47:0:b0:51c:a70:5ed with SMTP id d75a77b69052e-52d586365d0mr15297571cf.30.1786443544894;
        Tue, 11 Aug 2026 03:19:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a0fa3fc5d2sm1729601fa.10.2026.08.11.03.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 03:19:03 -0700 (PDT)
Date: Tue, 11 Aug 2026 13:19:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: interconnect: Add Qualcomm IPQ9650
 support
Message-ID: <n54sewn4sjafsncs2e64hkynxr5ct7qh3xukmgvdqankpsg2iu@kunxe57navul>
References: <20260519-ipq9650_icc-v1-0-4d3554c94257@oss.qualcomm.com>
 <20260519-ipq9650_icc-v1-1-4d3554c94257@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-ipq9650_icc-v1-1-4d3554c94257@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA4NSBTYWx0ZWRfX+owpSvR40JJ1
 sgYOkaj8Aox6Nq1K0WXPWJBm2g49ri5RmAKLHloJams2QTZnKcngCOUs4C65m9gRekqn5vpCbeS
 XmSQPhMo7IfhYqgtAjacsLZBE6wapOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA4NSBTYWx0ZWRfX4fmvHbxUYXlM
 7UWiEuf1tfULS+lmj+wzgR39UtVR/V//XG6UI6wzVGB3DNBkSUK81G4zX2ZrbcBhuEZP4YVWUTy
 jOh7S6J2znlVc3a1hmdAvbskDz3zzsLPGjjl6/SxKSs48XwVl+vwP/mae1mE9juNEbv3PxuB4OA
 E1WSgnUV3JY9wkhRGznIgGfLrQgDNfhBZ02ZQV4gwPP4xc6S6XtoSkyca3haJIb4XIunfADnqd9
 UUkxWt7lLuFulEv/6pFiC1QfmNEI6/mMz8Z3pzBzcaQHgPuMR4R5nMIyBUOJW7gwxS0pxGlEQSr
 DZ8f9SKepRx7lFrLXhE6F1aHWucjlT+kDcryLG2nZt06XACx7oZM20/DQZ5h9YmBzxM1kJqcsAQ
 ttSVl10Q4vu2Z6yrFfQOAim29Z05/BvKTcc+6QrEW+SC+z4mJ5pRxIfDHaf0FJHkXYHUseaqx0X
 IZqmAUp2FXJi86ZMsqw==
X-Authority-Analysis: v=2.4 cv=RY6gzVtv c=1 sm=1 tr=0 ts=6a7af719 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Cx5HlDUoyQ0isXJhYOIA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Np4Yx3DMfRhQfrA_SZXejSniBkXVD9G_
X-Proofpoint-GUID: Np4Yx3DMfRhQfrA_SZXejSniBkXVD9G_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110085

On Tue, May 19, 2026 at 02:17:05PM +0530, Kathiravan Thirumoorthy wrote:
> Add master/slave IDs for Qualcomm IPQ9650 Network-on-Chip interfaces to
> support the gcc-ipq9650 driver in providing interconnect services via
> the icc-clk framework.

Please consider adding an explanatory text.  Something like:

On Qualcomm IPQ9650 platform the interconnect busses don't have separate
RPM / RPMh controls. Instead they require direct votes through the GCC.
To unify hardware descriptions (and software interfaces) between this
platform and other Qualcomm platforms, make GCC export corresponding NoC
clocks as interconnects. Add IDs for these Network-on-Chip interfaces.
The GCC schema already defines #interconnect-cells since it was added in
the commit f92b778251ad ("dt-bindings: clock: add Qualcomm IPQ9650
GCC").

> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  include/dt-bindings/interconnect/qcom,ipq9650.h | 28 +++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)

Georgi, any feedback from you? Would you ack merging this patch through
the Bjorn's trees? Or would you rather pick it up on your own?

-- 
With best wishes
Dmitry
