Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC651414A27
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 10:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786012714; cv=none; b=pJugQMOCSwHzqhtvYP6PxdRhng6qVH1aJDkoyo7Y7eNX0PxF6WUstu2KrWf9IXICKn3xNG4hEV0ZjDP/CHsUp+7zEaIo1IyLRgcEcGoKihoOP55GplKX2er8zUNAHheCQdCAYC3wluBTvyHvxtmD8lXdYXQhoJeZT2MExQspS+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786012714; c=relaxed/simple;
	bh=EfVGIjWSN87W11NoJvTgUTrEfh6vgW7726CLFeRaEoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ItSgbDnERkf0Cp0P2HSYm/WlV47tXB1AETkRgFcGhoi+sFRCRwGJAVG2MVeZg6C731lfMd+J5ISLqOUVju/LJfYTiEJBs5lVBE/0ecM6nBoR2NwxRpHg3x9S0/W4CunkyUokyqyaS9lqYXbcoDK3BK/Wk4cYG+4IkyXHZXWNmdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EJlALQf3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XD0m2FXN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EJlALQf3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XD0m2FXN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nh3Q1876524
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 10:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Gu5kFTr5+lhKb/yBXlYjBt6e
	HzTbtjAXsXG5M2tBKsQ=; b=EJlALQf3o9GjK6BRzWQt0SITOIhLN0U6TVK+IfQw
	+UPyASyprE4ROHi9owo5E6Q22GxQlz8sRkQytrj6b7ztJ9zzoadsMGrZ8MbQFrQI
	p4i+ks8Rwjxe9U/+8QBF0UILT2T0f14qwmhRzTRg55cRxYQeJdpQaliiOsf2ncyR
	mtnEd443/8YV8AlViwKD5X8a2gIkDHfcqXBEEO2IpKOeS9iE1xo38kx1PKm/4rti
	o5LTXMhj2SjrwMLP1XGLag1Cap7Xcjcedlz75+CJqYPoyphMR4OyntWenm2IFTY4
	6YW5ig9GAVIQJd04JiplnFPHRZkASv1HnKhjT8nKghRXXg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjuchkqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 10:38:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d7886cdso34320791cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 03:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786012707; x=1786617507; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gu5kFTr5+lhKb/yBXlYjBt6eHzTbtjAXsXG5M2tBKsQ=;
        b=XD0m2FXN5TKy7XQeS7Y/4hliZmg0EqL/TRFaYZSd9e0Lt2N+VTdoxL0E6xjZaPsSvf
         N8I9LeXwM8Llwlg0OOSSZ+PRdNQc0chKtzhfSIBaJYgh4BXOpqFG293Tt1DqaULnlNEQ
         fGgLIsiPf9LvCcf5FfAlSr2a7otHWVBAWA4AQOKvxEiGbt2mifeTwts19m69XesjkeUQ
         M2NsFRs+FcDqZz7oFdarZh8iZgGS3ckyGXcY0CFZ0pDrR1/ikDC07MwQawUtKdJfCpzz
         DmJZ9QutGp7Qa4oEOUOhNRmRm3t1hMc3xnE2vbWjMBC8Sm2U8TzunHiIP9obYs6KimKR
         i+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786012707; x=1786617507;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gu5kFTr5+lhKb/yBXlYjBt6eHzTbtjAXsXG5M2tBKsQ=;
        b=aa8HKo0kmj0ikdxvxbCNRxNdcpliTm7Dyg8rHvbCQRpbIgLHP4rnj+ZUokwLvFKnnQ
         WsljXdPj3NQKCe1N9eDnvV0QIBe1hW17Cs859YTG3DmCjiUTiUnOo1PEdBYdukPTKK+E
         r3D2QxEDtF7t43aJ+I9u6RPLH2z5m13T07nzYOo7RnS1DoaJtFRpam8TyzQ8dNQSr+la
         X5emu5Q5KB2c5NfWCKGf8kqj9GXMlhW3lN01oKfYYDNtZYKZ6PiZrt/0tVOm8NgA/2cY
         xGHNgw65Q+Q8Z7OoKcLkFjnsvt3jctWn2yZxTD5BCO7u/q16oLXmxb2oyYAG9Rr7v5y1
         Mkrg==
X-Forwarded-Encrypted: i=1; AHgh+RpqCQL1BeIcC5xAgKaHHmCLdAcCpd8Y3iWQcoX2sCuF7Cr9nU/8y9YJfpEUfIYIuKqYLOnjwOJc4cKtDxRD@vger.kernel.org
X-Gm-Message-State: AOJu0YyBcihtBcfYi3zRuGwaLMGZK0rWkBP8wYZKS5FUXNEEja2QD2G7
	U6MXxEKEJpO7ZJd8b+ONFT8QnU82SyiupyhOJQdltsy32Am/Hn9t39iIkDPNYfl64VDfU2skaZU
	V5VPc60IJGeJqtz0fIIV/1DDlks7cMPnW1eIdpb+D2wpBbkk/3WoOECaVYa+9voA8QEfy
X-Gm-Gg: AR+sD11nHcfbt5bbySNus6JZVVGsQ97gmCKCbNNxOo3y1ma6sI4eN3LV64Ac241tebg
	yVZriuG9kmIeKhWocIsQzgoQQDucYdtPwJHPEkUPwGvaUBqfHiOicaclsq99Hd1d2wKE4zxiRyD
	qLIOqh6M9Qxu8eB9c23cYrOHhfDJeBcIW6wLZw6SHMTzQrRbx5od2v5L9cXwDzBPDFXXkUNdLD3
	Og1pls+iOgTqUt1/7ym3lQPXG0mhtQFV6+QQub5rceJbCiWkCzs1+NxNzVZrPM1tS4MeA2wIJ+D
	UUDd4+PfyErJ5JMQ0usGLhdvKDjqSPeAUrba1+zwJ+uJk1B1JnfvcTRHCdPrTRKnfjjuTzytomr
	Acwe1a7/4Ijd9ALxjxno8MXqlpe+0dHv63qF0U+bBM7k7mTmRagl57W/Qi65BBNOS0FNlUFHlOF
	0OZfU7n3uefSPobg==
X-Received: by 2002:ac8:5d16:0:b0:51c:a8e2:57a3 with SMTP id d75a77b69052e-52ce6180b12mr110351911cf.28.1786012707270;
        Thu, 06 Aug 2026 03:38:27 -0700 (PDT)
X-Received: by 2002:ac8:5d16:0:b0:51c:a8e2:57a3 with SMTP id d75a77b69052e-52ce6180b12mr110351381cf.28.1786012706837;
        Thu, 06 Aug 2026 03:38:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f62c50c8sm635416e87.75.2026.08.06.03.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:38:25 -0700 (PDT)
Date: Thu, 6 Aug 2026 13:38:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org,
        Daniel J Blueman <daniel@quora.org>
Subject: Re: [PATCH v2 01/12] dt-bindings: media: qcom,venus: Add context
 bank subnodes to common schema
Message-ID: <uk7doek3x7km365i2nbu6yr672ywrwqm5czggugji6fudwmgt7@skaynqddkoqc>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <20260731-vpu_iommu_iova_handling-v2-1-da52b5228dbd@oss.qualcomm.com>
 <xusr4efn5dmsvcs2hl5vg3t7ctqbbchnbdx3mx6km5s7s3se23@mzzqs54lp46l>
 <d6207874-630f-445d-8d1d-3a30ba8f41dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6207874-630f-445d-8d1d-3a30ba8f41dd@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MyBTYWx0ZWRfX7/g0EbrvCGk5
 mvRm2cshBZW3ficF8VZ7Q7R/NyXS7dDfE3XXLKwH+0IUaoOk2qbKLOEmwOdE82OsOPUhreJlhrU
 Q+lBx2Q3zmE1h1NhjgDi4B4JOkKtlWA=
X-Proofpoint-GUID: 0EoaeO72iUvtyCyf2glPYYlf7p8tNvmK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MyBTYWx0ZWRfX2YWtLL+rWBl3
 NZTV/NZ3/wen7PzBeK8ForaT7Jp7aoQDHPMBG4OfJ1MPUl3EEF7BhXlU+h44yaYwh+s6gvOc8AE
 vTau1XF2biNgsEXX29rmmyk97FkrnI5hTPEW798cZuUfNVtFOcLwynFsez97d1EnTxWHHrXl8bR
 nWg+96BKdZHyT7Qo3r3FxlHqmdbXIk9QA+/y2DAkbKSwWk1BIRvx6qqd4ciLhbG0nahwO9TBDeu
 OhCw4zhiEgJPlZLl/v7dPJ9btwxt2saQPEbjOcxnQcTemU8k1s996adHTLwWv9fpTc5dG3GLYwn
 Oe0lImVTC50atv1oXQ+QrDKuLpjK0sRBbkCa534cZmjf7yJo+MYmQWIVBLoiIYYuI6ZQf5GE2Ac
 X9/EN5D3vleV8MeGXLtNpumKTM3oTZweNQHlkw/aw0na8sQwU+DpuZHlN0XDCitWz6/HW9mXJxj
 LR1Fa+cVRWSWQn8cAuA==
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a746423 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8
 a=yy27Je0FNM-02PBfZ1YA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 0EoaeO72iUvtyCyf2glPYYlf7p8tNvmK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060083

On Thu, Aug 06, 2026 at 03:22:26PM +0530, Vikash Garodia wrote:
> 
> 
> On 8/6/2026 2:19 PM, Dmitry Baryshkov wrote:
> > On Fri, Jul 31, 2026 at 11:52:16PM +0530, Vikash Garodia wrote:
> > > The VPU issues DMA through several SMMU streams, and the hardware does
> > > not give every stream the same addressable range. The non-pixel stream
> > > is restricted to use 0-600MB of IOVA space, while the pixel stream can
> > > address the full range:
> > >      +-----------------------------------------------------------+
> > >      | non-pixel stream addressable range (600 MB - 3.5 GB)      |
> > >      | 0x25800000 - 0xe0000000                                   |
> > >      +-----------------------------------------------------------+
> > >      | pixel stream addressable range (0 - 3.5 GB)               |
> > >      | 0x00000000 - 0xe0000000                                   |
> > >      +-----------------------------------------------------------+
> > > A single "iommus" property on the video-codec node puts every stream in
> > > one IOMMU domain sharing one IOVA allocator, so nothing keeps a
> > > non-pixel buffer inside the low 600 MB. Once an allocation lands below
> > > that boundary the hardware faults, which shows up as unhandled SMMU page
> > > faults and spontaneous reboots:
> > > https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> > > 
> > > +  dma-ranges: true
> > > +
> > > +  '#address-cells':
> > > +    const: 2
> > > +
> > > +  '#size-cells':
> > > +    const: 2
> > 
> > This would conflict with the 32-bit addressed Venus nodes (and it will
> > also break examples). So both should be just 'true'
> 
> With "true", i see following comment from sashiko (when ran locally)
> 
> Without a const constraint, a device tree could specify #address-cells = <1>
> or a non-empty dma-ranges, and it would silently pass schema validation. The
> DT bindings guidelines also recommend that cell-count properties have a
> const constraint matching the hardware.

We have 32-bit hardware. Also, as you've seen, having only const:2 here
breaks DT examples.

-- 
With best wishes
Dmitry
