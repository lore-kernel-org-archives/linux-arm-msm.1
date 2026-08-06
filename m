Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837113590AE
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 09:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008180; cv=none; b=ckxd8YqJhDpg7Xb4AD/qfyes8xtG+/rBiXHqKg4cMx/TX4i6dHg7BSZbblDdav7sEjUyQn9O1ZGHVM5+Lf2Rw2p/kXEdJyKBq/h3Aeexa0lG9WETJ6U5RbBoC87bOsa6f297SJZgSXBfUBg9Us4T7AwBs5MX3TAMpoMhn8urRpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008180; c=relaxed/simple;
	bh=dpY6Lb66UiiSVLUiNY/tDg0sHUc2lJJLguZEJbr1MoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C98x2lMAKQxzbDJeFdl8jS8RRoj8Dv2h7unZQnAQxrBSlZdXq0Zr/iK4Hb/TaNdgv6rWvDkfm/293yV/6Yu7msc+APIl8gymOTGsZTrjCGTsKrV3FNPoGSSb8sy8zdDhznVgo3r4WGXyRvZ3CBZDGB9k1KBaNBaXfYnwAxmsv+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZ7bYg+J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zw/u7Kuh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZ7bYg+J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zw/u7Kuh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67694NOQ1172693
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 09:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pqaJOMuddBQhzL/ghmNiBYFo
	sxA6nA8z5MJRgKzN+OQ=; b=hZ7bYg+J44WePbSRKs3FnHZFEgbIN/jkIDqJ8XQC
	+L08M/+kxTzNBjfrMG4Sy8404IJu57fv7SKb08ehY0Q14n0P1gowFrGTwkHXlfNv
	KxlFBdj/yd0kAV9a/U62UTrpHs49QIWX7TsbzxlDKhHkGR+GWTzgAx4ogVzK4Tg9
	lnOJ9Rck66Yn5duz94gHvJY4No1f3WWakYjmYZE+TisaVTX98JXKsxPpsX8pChGC
	Jw+NbTtnvR0GaZuSvdjx3nFw2nwOG+i5fH5nn9IFs7h3oIkATwxak3y6lne8xq4D
	ej+1YvK6FCJsGxjlRRC3NnUUcuwFKvNbDMN5IYra9SY+Jw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjueh8va-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 09:22:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e55721a8cso186734485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 02:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786008178; x=1786612978; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pqaJOMuddBQhzL/ghmNiBYFosxA6nA8z5MJRgKzN+OQ=;
        b=Zw/u7KuhXGABA03ihjje+ZbK7UL5ET2arwuIhIFXuQkYggHOLXF1q+t+tUXiAcXVaN
         WvLhYKxYr99ceDt+LNwmiYkhED4s9IlNK8jcc3oqFCVAarXtADzOYzC8FKIToolKKQ6y
         mTki/GaJA6h0cF9ECUSygQrQrmxlOCG8ZsgDrygrkBgx5eqkmocJjPy6f7SrKDvmyS5E
         y3Mqd8siuMLIvATn/wgykqxu2PW/h5RrbcHP3dpmF0QQMD/fPdP3bGFGj0r7GwKfKGbu
         XRsa9J/nRnmfi+F6+bEriLKv0Rn6RZftGsdAN20hFG6HUVTNbW8nSxXE7a63aKsU+G6S
         wPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786008178; x=1786612978;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pqaJOMuddBQhzL/ghmNiBYFosxA6nA8z5MJRgKzN+OQ=;
        b=hpIJ3qkmAfRWo56bIPPml2SnMDs8hSYy24yM7NQdmph3zaJ2TmDc37z0Tb6uWLA/zH
         9L5NWoizX9vF3aVH9QVGDpxkp9/ROZ/42C1daWveGWxicTJX3sp2rPWZiI4fBXoAAJYe
         NeQhyB/OWhI2d7wSQPC2JhTui/C6ZpCMKMKvctL2NmrM83lp4YXkv4PDAj3zEy5SUtVz
         YqdR5qrPdyTjBP0bC64le2vvHpFpLlRyrqaAcQAGvRTFANhoGKp8RLg5IQFJm//3d3iO
         Eeke9LM51WGJFkChao1id4UAlTH3X3M5Qn7yHths9Auku7mZL1fpVi6GFEdxDurUW3EP
         b4YA==
X-Forwarded-Encrypted: i=1; AHgh+Ro00NHB92yoZ1y4EKGWHvd8q6ksNyr6rhngwKr34HLkcMIEWOuPBsMXauSx4UmrwpEvMZcejTMqUMp4P5Pi@vger.kernel.org
X-Gm-Message-State: AOJu0YwG0vg/QJAfMtkhMG+m+DlOVrthER0gQQYzP/4BEr5HPA1Y2qHV
	zBg6Y+8VbjB1Gcwg6lKruDm1xGyfTgaOdy1jb4aC48Y/mnHdXbiz8wDbPdFP1LXGzrQy4soy1R4
	3KlqJpzEKM2oiP1z0H9aY8ABh93+itjZ5ILEIj92F5xzbfmqvysoYD++WrQP7IGR9vhcI
X-Gm-Gg: AR+sD12rMlYboSTfCWhu2iy2gd2aijTfM9O+aj21IO3pXtrLnYXc97S1Bl1OWaopIwn
	tnmj0pVYgi/Hd1zdUh4SOmc0O5lMVkvXu82cJ1QmQPRYAUKgPTyzFin7sND3hnrFXt4Rv+1NonE
	h+9ug4KPow0BLMlTSYLvhplNt+ryam8Fw0RLZeF8El/lXJdUJUsbLRLx+HV+j9My+sggVmF+QL5
	8eoo7EIfWRMoEvhQ/G642qaASNE+7xeZTOdnJsNuJjxU75L9UjuosZjAbvsSWjcjQ9EBybsATMp
	BH8HsHRqhB9NT7/pguT5xyM+ys/E1OQpmot6W+xjMJ/grumwVRY9yT9TJVXGxjdbpyBbKm5bpUU
	I7sbFsY0n7QzTbi5bpS18+FazM4E9DdLC0iNaE9T2pAUbbz+2Fi+q7V2ulSDopykxqVIelMTwe+
	/2WKPwRPLxB+nDOg==
X-Received: by 2002:a05:622a:4811:b0:51c:22c5:daee with SMTP id d75a77b69052e-52ce6133c6bmr146671861cf.29.1786008177538;
        Thu, 06 Aug 2026 02:22:57 -0700 (PDT)
X-Received: by 2002:a05:622a:4811:b0:51c:22c5:daee with SMTP id d75a77b69052e-52ce6133c6bmr146671171cf.29.1786008176819;
        Thu, 06 Aug 2026 02:22:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fb9a51048sm14086691fa.36.2026.08.06.02.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:22:55 -0700 (PDT)
Date: Thu, 6 Aug 2026 12:22:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
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
Message-ID: <zqpgl3esozn4dgnm7remmwmquxasyc4qpyh3fgcdfblmn2xe3g@vhp5umdahvmi>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <20260731-vpu_iommu_iova_handling-v2-1-da52b5228dbd@oss.qualcomm.com>
 <20260805-dark-voracious-jacamar-6aae4c@quoll>
 <7a546bc6-a2b4-457d-ac27-05fc1cfe17f5@kernel.org>
 <m4rccl6zsdzmkzntc3njv3uczcppva3passjr5ukmru5q6rylx@wlwha7ydttfp>
 <163c24ba-6b78-44bb-afe9-3dcbb4d47475@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163c24ba-6b78-44bb-afe9-3dcbb4d47475@kernel.org>
X-Authority-Analysis: v=2.4 cv=aNzAb79m c=1 sm=1 tr=0 ts=6a745272 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=4vcYjQK5CgZr8qocVmwA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: E9KnBz5vMOxUo9USHThZJBYan7xhw1_1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3MiBTYWx0ZWRfX0jcN8bD8vd9u
 l23/fxIRjhUQ7zcuifRpzGCy2Cd6jMsiVrfCyk8iAbvrYTbHcu8N2Azx0Ru8dLNDHaZ+aKN3UKZ
 8NFWWNQe3kG+TxKXpcba/Nf5lyhVdUTFVMFQaRrzUc5abbAD8WGLa82xI4pZIuWyTMpZejaBNaL
 5rF4t0FCJkaJgebz2fCTwIKOXykHAY+6nW6U6yvSi5a9u/GIg6HTF01NuNjf3RFskFTT1oTwrk1
 4In1WlqHsQN/zYaBMQrsShQ9EBrh462oSFq+2YzYxM6fH+ryAlA76l5RqzTa3atcDWH6PvXLYVl
 nUkw5jUDPAW2GvoCZbThzsZMylB+u/AdlYyFBugGSCwpRKiN2RFo/Utz9kDzrF68RGDXrC3EUny
 OMXG2wlpemUWuDsbA9AxZwhqO11Vglm4XKhxLbI6P/pHnOuiC2aUUnr+zvrmsQ+pVRxEu/95F1C
 J9axU7rGyQhKH+Crxaw==
X-Proofpoint-ORIG-GUID: E9KnBz5vMOxUo9USHThZJBYan7xhw1_1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3MiBTYWx0ZWRfXzQvHBnC0NtBp
 02WThfNYahp1hvE73Me5ajpmBUnJ3GIcQKSDH8LUPWAw3MEN4Ig1e3WHMXqBjq4BCl7/M0AX6cL
 u+Cu8UALfRCVP91BuwZJZ03WGxBLXtI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060072

On Thu, Aug 06, 2026 at 11:11:09AM +0200, Krzysztof Kozlowski wrote:
> On 06/08/2026 10:46, Dmitry Baryshkov wrote:
> > 
> >> dma-ranges tell how this bus - so venus/iris - performs DMA translation
> >> in respective to parent. Address/size-cells are obviously also needed if
> >> this is a bus with addressing.
> >>
> >> But there are no children with addressing, thus what sort of bus would
> >> it be?
> >>
> >> It looks to me that having here both:
> >> 1. dma-ranges + address/size-cells
> >> 2. children without bus addressing
> >> is some sort of abuse of the DT syntax. It is allowed, but does not
> >> really represent hardware.
> >>
> >> IOW, dma-ranges alone feels okay, although unusual, and it states proper
> >> DMA translation for this bus. If you add address/size-cells, it means
> >> this bus HAS addressing and thus YOU MUST use addressing.
> >>
> >> If my understanding is correct, then solution would be to add addressing
> >> to the children (so unit address and "reg" property) or drop
> >> address/size-cells as Rob pointed out. [1]
> > 
> > Doesn't dma-ranges require address/size cells? In the end, how can you
> 
> I think it does not require, at least how I understood the DT spec,
> unless you provide actual addresses to the property.
> 
> IOW, this requires address/size-cells:
> 	dma-ranges = <0 0 0 0 0x10 0>;
> 
> > specify the DMA address if the device doesn't have addressing at all (or
> > MMIO-style addressing)?
> 
> Yeah, that's why having here children without bus addressing is
> confusing. I would interpret it that, children are not on MMIO bus, thus
> the venus/iris is some sort of proprietary bus with no mapping between
> parent MMIO and children nodes.
> 
> If there is no mapping, then we do not have 'ranges' property. But I
> could imagine that such no-mapping bus still provides access to system RAM?
> 
> Actually this feels like a huge stretch, so I tend to think that the
> only reasonable option is to have children with MMIO, which would make
> it explicit: Venus/iris is a bus which provides translation of both MMIO
> and DMA addresses to the parent.

But there are no separate addresses for those subnodes. Would you prefer
them to duplicate the addresses of the parent node? Or would the
'ranges' be enough?

Or, thinking about it, if Venus / Iris have 32-bit addressing, then
dma-range should probably define the limited DMA range.

-- 
With best wishes
Dmitry
