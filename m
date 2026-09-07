Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A06845FFAD
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 10:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778050; cv=none; b=HO3fY1yNSbE43cJfMS+AW9i3LX87NWAwix1Tq+DJ4dVPWxvxFwm7KxL48azaZvb0TCCs2qwaRHIe9f2zgSdxtG7UheMk1cIjaBsCkNI7Bks9Iu2VXb5Mk1IforazORF/ifVXENTLwuWqBM4/WXPlQdAqDye1Bwtd5fY+mhlZbmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778050; c=relaxed/simple;
	bh=9NTlxl/KRT7a+u6DdwxgUgjC8syCrwSE+8g5XIKqIco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TsPFVo45qQjZNuwHJIteKbkucNWXOnXo+s9MTlgf0isjEF410dJXwg0k1tLK78RbnNdeLa1clhmOCJyGt2OKqOLZwmeGANVZPF0Lfj2ygKqz97hck+6I2FJ/ANXGwiPjaDvggBgwsToL5lVyjN+9150cxfwNHtZi/jvDz6+LOmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AddXTiFj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EIqLCCeS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AddXTiFj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EIqLCCeS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bWgG648898
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 10:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=joXVJ+ek92ipV8BX41gQLKXS
	+sH6pDp8t54BpG2WTHE=; b=AddXTiFjvwJrOezmyQAiedNUl5AaULxa4s6ZUpNQ
	jlCEn3vBr52VEpai2I9Gh8nyffiCUQz6V0vvhVHV7bhDI8SDtu6XPUgfOJuoczeY
	w4T4FsZ9YUzv0PhDAcHMgHSjt3/7Smsym0UtKAkOh1tfpfj5QVI8CYId0VQR7QoN
	4Zc+7yh+r+YaedGbOFAs4LfuNwQv+JllbmHTLlM6w1b65OFOc+h1wLhhAtjrXrjt
	c38wEVNj4ZfvxdIzLQbw2NRTCGfRSBa+3AVF7IDfavq64uo7FX61H4mMiZ3Yz6Sj
	F/zsiTRhrhnqvlbGX3jqkJ4zYIYuZVoS2LSEvy9V1mvTKw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua910h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 10:47:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93903622880so734985685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 03:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778047; x=1789382847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=joXVJ+ek92ipV8BX41gQLKXS+sH6pDp8t54BpG2WTHE=;
        b=EIqLCCeSjsmzdRtRiEYxusBEQG8GFHbUxDR0VMZ4l1O92MMsnoLgtWxREtXXuaxR94
         BgK3CQ18SIGWIU3eFDy6CNvlzgqKFTyCUCRxl/EDkyuNF8lKvIT9SmBYC7ZbkA6YjKqZ
         BDGeUkJiiUSL/f71/RtimMm8nLcGbb8nu3ZreCwNsed/H7blxzANfWnCD6xQCmRyFrvE
         UTMXMwzuL+jD868dBs5HzoD0AsNlH1eIL3nnHNnESmZERq8qdONcdNFb/x/GducEK8Hl
         +8wroSk1wR589m+52sirsDbso/F/iTZEPS2R5Pt2SMalwCjSYPZxwFExkgdGk/TEWTeQ
         H7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778047; x=1789382847;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=joXVJ+ek92ipV8BX41gQLKXS+sH6pDp8t54BpG2WTHE=;
        b=kNYPte2WKEOWj0HKvpp0sSRj/Zatj/jpGRr0IJcXQ7913AGlBrUobUsBS5tnG+y3Pi
         IM8thualqBXM6vjjwqAHkaV00ZM3U1lGt5pozY01isFoveKlxazMxN5PTcriKBnfrnf9
         rSyjtRm3pDnO9n5knWtbsM4dVhNplZHOyK6E5jC3hEU+ZhMaXY4aNCDDS84VBzJ97u//
         bOjVRIjVa8ioZE9S1ZJwj9EBoXilrbtvrdWH2qqY7EnasjJrB25Xfs+85GJszWqyv0XA
         pDhOaXqzfX87l/YiT/hZztok5KbUQYxud22tqNjyLPDiwlMbSHR9dRhl0+DjlttNUshQ
         x85g==
X-Forwarded-Encrypted: i=1; AKwUvBwJGPA2kYRilVUkF9vqhr8A7ERthb6PzDClQSrXxrIZCH9/Nnxgv7bY1M9YK3pToRDrTTPtppEdgjqLTkXQ@vger.kernel.org
X-Gm-Message-State: AFuF++kL+tu4t9vW/QIAhE9FXlCSdSl2phPQLsmB/08hMgUIdEgJjkWg
	LIVWY+/ICHRevHxkIBCFZR0+FkJmrai1ayc8Y01P6Ry8KicgGU9IkNayZNHspSiRGgQbwMLk35s
	RDkfj4siwwQAdwO9gS+1H5t+0QWhX8KX4V6wCSRMo9HRlbinbhZulPq8EbABL2c1sDbgo
X-Gm-Gg: AYBFou1HN+60nTpYHn94gj1YfOUpC+Aux8ssFsDop1U7FGYa40cNA37VqeElOLOM9r8
	rQhf8gcSRpbZAJgRZc8XceKf+Vu7091Z04s/1XLSkuDAJY7SVORD91Oi2WiqKc+I7pwnZPbdqRh
	vc9afnRElDIz+9hx79w/EWvvqygxJjQIZFLW17vRX+3SeYCPnfUrT6xueSAfFy4IMPgd0XQQ5Br
	p9jJCmVadH/i1LdGMY+IjlLwDiPovMX5JLfVldJJWUYwM6aKdZicRIKlivaRk5byVMekZk1mm8c
	yrIHN3P/HMoMTSDK0GPyKR/POc6/UjVdVbe6z8uFS6WFE32zimE5Ymfi5nxcADDjFHlA5+jUMER
	3ylZegty9yvMI
X-Received: by 2002:a05:620a:d8b:b0:939:b783:1748 with SMTP id af79cd13be357-939b7831bedmr22466485a.7.1788778046710;
        Mon, 07 Sep 2026 03:47:26 -0700 (PDT)
X-Received: by 2002:a05:620a:d8b:b0:939:b783:1748 with SMTP id af79cd13be357-939b7831bedmr22462885a.7.1788778046123;
        Mon, 07 Sep 2026 03:47:26 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d476esm423348425e9.1.2026.09.07.03.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:47:25 -0700 (PDT)
Date: Mon, 7 Sep 2026 13:47:23 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/6] arm64: dts: qcom: glymur: Add camera MCLK pinctrl
Message-ID: <5unqbyuzs5sglugv7kbtvjqmsokjxm44ldgpxatfvcksntmzdw@qe4faliho5ur>
References: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
 <20260907-glymur_camss_dts-v1-3-6c2ced5ea5f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-glymur_camss_dts-v1-3-6c2ced5ea5f9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: jD1NeMGYL5pgMcsKSSvzFi_eWaK2P-ru
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9e963f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=x3DTJP6EMlRaZ7yyrLMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: jD1NeMGYL5pgMcsKSSvzFi_eWaK2P-ru
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExNyBTYWx0ZWRfX0VR5HTVRicd+
 O953fgfT2FVvtNg5mytdxwUIYdC+PqGW5+lGdAeKYUyjsSr2M2lYUUrrtP08f4XPG8fFtGBEHRX
 EboNyTi7Laey8gr76DtcmG4RhEA6YzI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExNyBTYWx0ZWRfX6yQav8pDEjNL
 +7nooER9gfNYVZqC7O8AgwXLkxQVaF4JULK0waCMWWQQ+iS6o33kdc7x8SmtGeEz94YaYYCU5jY
 gfBMF/Bgpu4I2hMr2cms1tTIhrdqgs0MfQWRNlPMxpbFCRdXIaPqUGCb30kpMdBtBe5ObbCAErw
 GYBjqTVuFFSmabOCR5nJpw/UFR1TAacuLDKOJtN1UZKv/lq5jyuRH7+spweIX3FbOv/s1eO+xNn
 vbvWFK1WJlaTSjMcMYm444vVmKz1sVsvDjPFROhNQ7XPvzjwizFnLtoalLg41KWRUHfu48c4VQY
 AovQBSA7mt74czi31HdLsmB6s22MEdxHAs8NhWcsr0XHHWiYGiOVPNwPQnfoy40A3GtnsHughps
 ZgF09a75ExZSQXVjSBmIkDL4g/xcbpEgXTlI+1xEyw676Xxk777rJtcGQi866prqdyoxP424J3w
 VXJxmKexwAxf9vfXRTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070117

On 26-09-07 15:37:46, Nihal Kumar Gupta wrote:
> Add pinctrl definitions for camera master clock pins on Glymur.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
