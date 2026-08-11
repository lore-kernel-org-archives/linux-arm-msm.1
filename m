Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481D442F702
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786442814; cv=none; b=leDHz5xBAImChp98yq90TGhKRuyy0cIwmaMtW6IdPC77ejvOP6vT5ebTAytAuAxDZAzIk/WXdN3cishDmCJIld9u5hPQZN2acEoAIaE2On+V9uQYs/H7G218blVvGCYBnpXJsWl0f5fjJV+FffjNEpNaHEtU3uF+rKSFoLNt6TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786442814; c=relaxed/simple;
	bh=1/r6EtW60fns51ULiJJkfH9xxGYDd5LJ+4gmagIfBto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bamkQy8bjwP+UhPHSdEn5HqkzopCemMP4nE0tYuBNe8A4Rrhzzbs4VlFLELJ72tFsUqUs6PLpFvun+kPcdNt1Q90QrW4NwAHnQKQqPix56+b0Rhn0dQCOy1yFldlj1BrKQo18d7PF6mH9pXcJt6E/tkFn3dnFrXSLkkxzDJCFpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/BNF3P5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=irJMhDUT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/BNF3P5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="irJMhDUT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B75dnG4156993
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=scKxtiqSOwBFQc21NkVPF0up
	unJEoVm8FHU/U5KS0X0=; b=n/BNF3P5gjEoMbfm8jnRSShqUJS6pAOHkYDd6z9I
	peP4r6aUjFs2RoFlioeg3tYwpACON4o6K4PXF7ES4bYi6/44rGilbWlm8xCslV13
	r5EQb4LUbQg9MCOEzWmK5iz3jbpEx1rOdvzVqpabSI1qcL+z6pe3JAJ6ngIEHSKC
	OPvlgVP+LCgPuAs0KkW6FMXQdynKlnRcyPI3ny8YuFm78Ql6yDth9H/2Sxr2YPDx
	458iwoVHdXpBr2Z2n7EcG/6gep5SEXq+mat4OyLPJHokbuT4sGeEE6DBOhv834Tm
	AaFRFcZr78j7eLIt2mjfliKuS1VM9gJa3VSuxvc53hq4zQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyhp8kwrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:06:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f08560ea44so3529256d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 03:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786442802; x=1787047602; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=scKxtiqSOwBFQc21NkVPF0upunJEoVm8FHU/U5KS0X0=;
        b=irJMhDUTwcRhXRdITJDTPIWDUwADpiFc93Hk5FYIVcnhlp7m+rHoq9JC6tvUm1C951
         THIalUIOIH61iRmHUSWFMkFwBHpUObaiLw9rMS57PB9ARQNBy9dLpwB8TOYxJ2b1z8rn
         q9fGFj430VqNLiAv3N5bANorCrvtXp6/YywfeWXEH4nV5hxEcXevixXDU3aDu0DtbKlu
         ENIpApVBBalvHkrhQjahTGbqQaEziG6Xw0ZdlWQXzcsEtBNYTNS9/PGj6js0ZKLI+A55
         C1DPlCyjjdCeDr72xj8N7YMvJTCbBQchjUkobw/Ngg8WdHXScZ6s9O0u+5PGt3q1+eib
         XGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786442802; x=1787047602;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=scKxtiqSOwBFQc21NkVPF0upunJEoVm8FHU/U5KS0X0=;
        b=bmViSwvAEGvEArGmTgxGOwNMfxZvr+S7g9kbIuJRwgyxkch3w/Pr5IMhe2Q7WWNrdP
         6pPn9/DlGqCkJQSw9ns/GkcHiLBkgAVDweWmDzKLtIfMOZ9SRk67EAt1oDAy6sD6Ccvr
         4BQrrluYTXfjEJpsXky3eHCsr9BQxp0+hkg6hR9RIMSPP9Fb2dabchJmceP6SByDIwT5
         b7+avYnKrmQeSsLTRl81OEOokeaG3+fXJ3nm4N83A9g/1fi/PGLSHI9HCpXSypiLRtP4
         /icDYMnv0zVGOvBWkJBkaMzo8TSCecevwBGqjiJT0PWOLdEBkK+PNqPY4YF1ztBoP6vm
         Ypeg==
X-Forwarded-Encrypted: i=1; AHgh+RrUcDx2639DN6REK3m9weRMiwPwp79L6vlRyQI7Vq1zwZGlC53N3yXfVKbfT4v8sqcQmURdR4L4jipTxCcr@vger.kernel.org
X-Gm-Message-State: AOJu0YwatXMw1JnBGYQZ+LnRxXwb0FcyskkDGm39hEPW3fsAiPnBwimK
	GWuA4tNJlIn4b19HU9icBRRiG54mQ4w/PGuLLthOYHuLNMlFqZogNEgS/RLuN7wUjbAsbf8c3cy
	shxL6apKiNZuLRAjK5mTvwBH3F3g9uTnGBDQ0xvO288PGXehxnh9Egle3PhbExQRucOJ/
X-Gm-Gg: AR+sD113s2Oy2RAnK/3pWipZAaktgicWLvlUC9OUmpB8IRREprlSpj11As+xYAbPndC
	uOk4k6gJJ+cfKt6yPX0Q3/RtQSEXC1tekqTR3BN+Y1F6yc0xlYRQuf9RwaHjgQnBlSFaYQiuGro
	/GOh9IXh84IdyADHBjzfOx/PrLbkAjCTRkXp5DI2equZenDpZzroqSNQ0KZ5Ekt0INvzHOT5FCF
	vKwNvwHBTZB+ubXGyNZDl5UcCkb0+VU5UOQwLMgfcKVTSIxHaKhpSq7OEnXQ+LRK/MRquXgq6Xw
	Na+CSnt0+2sUhKF7B2aHyUciquO/6F4BR7YJMRFG36ONr5EZXmPEuc3xwCe4eM5NtPpcjxvQmLO
	J4zAXIm6RmZP+6GnPoWTRWn+LDHz5KPBIAp5qEmxJS/SepC/U8SnHbh+43T6gk0bFVC7E9En6dH
	8qKF+owHGG64LhQQ==
X-Received: by 2002:a05:6214:40b:b0:8df:98e0:4594 with SMTP id 6a1803df08f44-90a668d9e11mr14256446d6.15.1786442802152;
        Tue, 11 Aug 2026 03:06:42 -0700 (PDT)
X-Received: by 2002:a05:6214:40b:b0:8df:98e0:4594 with SMTP id 6a1803df08f44-90a668d9e11mr14256016d6.15.1786442801757;
        Tue, 11 Aug 2026 03:06:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4486c0b96sm192135e87.17.2026.08.11.03.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 03:06:39 -0700 (PDT)
Date: Tue, 11 Aug 2026 13:06:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq9650-rdp488: enable PCIe support
Message-ID: <ibrpfhkqryw7tvgpy52curh2an4pvwvvfmdva4bkwr7f74lfmp@7gom25ntqi5w>
References: <20260714-ipq9650_pcie-v1-0-4197749d06bd@oss.qualcomm.com>
 <20260714-ipq9650_pcie-v1-2-4197749d06bd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-ipq9650_pcie-v1-2-4197749d06bd@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA4MyBTYWx0ZWRfX8CaZPPXMAOWf
 JvbubGU3xpRspWc++8P7WmwAgowuoD3odO8xlR1OYDjgQ6gYdc8oKNv9pzBHibZikJEiTCTGtj/
 NQ9h/qtUnnOSexYqXy79GcS0u+wbYm4=
X-Proofpoint-GUID: m5WYjZ1-JkJEFoXnuTzuB4j4AqVz5z2o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA4MyBTYWx0ZWRfXzEGsX4eCvG+U
 TGSli1k1/85oyWgPTvOfVy1qumqxWIw/Of4uWG1KbUO9pRj6kI+YLdk2/7XTS0lXS4WXzO4/vFS
 mY6O05hbWnQ9u331XnoX/puEt1RHiR2Hip7RBnLvaqDRXjT/nnQolVOo9EY8+gRhie83lsvbkPM
 mTMvVWWZq8mP9LGvzHIC2AeY8IMRElsX2MPeFkNUUrV2CqRbfc338Xc7foGhDJsfx0EO9E6wjBm
 rc/+/3+eXKDAXdOQFWE0BW1H3mrqZZ/n0FoCJx1P3+OU5DhGFbO/Viz4W9NkoToJ3HQXtBlbLzq
 KebIwLITRD8durH+5d0ezIpFfr7LNvlG3bFU7Z3V8YkGZP3F7HBSg1K63TGSbLdBuWKckq4zdyY
 LwBpalN9fWO5EDjM3dN7dHQGnnz120zfwJlt5UeTiFYxzpY8iss2Omj5DW4vJe3YEWm5bPeGV7N
 Jt9x01d39aOZex1rS3g==
X-Authority-Analysis: v=2.4 cv=RM+D2Yi+ c=1 sm=1 tr=0 ts=6a7af433 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=BkY8d_yo0xCmcOyNz0MA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: m5WYjZ1-JkJEFoXnuTzuB4j4AqVz5z2o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110083

On Tue, Jul 14, 2026 at 09:59:17AM +0530, Kathiravan Thirumoorthy wrote:
> Enable the three dual-lane PCIe controllers supported on RDP488.
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts | 119 ++++++++++++++++++++++++++++
>  1 file changed, 119 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
