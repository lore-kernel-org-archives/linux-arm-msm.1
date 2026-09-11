Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5A0423A83
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 07:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113110; cv=none; b=FN3Y0MfKdgfdfwAD+LSjuq0PEdqMcbPK+mtt0M0+drGypfQ+vyhiS3vJsU5jacFa+k6mWbu0qnZmBZyXycvfevQWauyBRIJokCQN5Y4geIZoNvajLRWlMeMpYNAwAl5juI++Y+3r2Gf8y2T8SH63HTFNAesMjoHaVXxPP5XnUxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113110; c=relaxed/simple;
	bh=cJAfgN1KYWp1m6GWysztFt7BByetTfE4jM7/Dt25tf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HXq6zNr/EcpxQvDj/3mU5ECvYhgV8MpfAWNYEeKTIdd9c2PDCttuLOJYO9/gpuTL+GZ8yNSpPbyLqH3UX8g6QBc4ZjJA3QD6n0VDDb48ZcER0KaOp/kIyypZ9LGxM4tm+ntc+S9vaYMhiW5bIYx5FiQrwW6qgFltbsLySdyT74c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kDGckt9o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=haAX2uTY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kDGckt9o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="haAX2uTY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kjUF423592
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 07:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rmmrZM6VbrQRpI5MPJAL2YcY
	UInPqlbd0sBOxYA4Ai8=; b=kDGckt9oOH+uSG8JKJXVo6Y0ygPy0pRNaQtXRKjZ
	+G5v66yJ4kE5GbTDITagLUdwv8H4LAUmrAfqjF6A/sH/FDKQVy/gAnYTB5zDW7XM
	PRzWhbmo5e7d16vRA6UNsRn3V6DwjkvdivgCOJI+eb4k/V/OFRqSS+rAFhcXa92r
	1mSXWOh43Bu0OtOCFriLuHLmaVjC7896HO40lJ2APfC0OxgKbzu+jySWtgprRIna
	jugK4Fn6n9+gNgyy2H+uk+PV7Den5Jm1LJbpGwAjuXU1S/ITBdoVsQVjTMK0HiIW
	/X05ikGvRkhJ2h6p88uPIExHHVp8QIMHXoGJSq2pXd/DXg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbf8gjb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 07:51:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e820609d9so88899785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 00:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789113107; x=1789717907; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rmmrZM6VbrQRpI5MPJAL2YcYUInPqlbd0sBOxYA4Ai8=;
        b=haAX2uTYlV07oqayI/ltdE4h6aSzHtXd67sRSuWvMAExvex3I4uHTBZo0cZ3hnbwKD
         +OiyWbY8ePCEk5YxyMasCeyawjhG3JehG1SIXPZAmWwBHMfs3HedNKbO60gyCvR1sfy6
         NrIm3SXSykzB2qYj7aiI/t/FDmVJt0CBU91gAypBGuTm38pv21mse5V2LkhEAdSGshET
         xtuesSIfKZNn+lF+ra/mt1KBbpoDN0ot4zpDXdiq9clAgPFmiVZvGgzJiTDGsk7eLAp/
         3RsNPofa3L9Y805m8Ss1aHV2mbSjz+liDeR0XPqgc3r31jD22VuWtZgW9xWGrgyEcpqR
         7ILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789113107; x=1789717907;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rmmrZM6VbrQRpI5MPJAL2YcYUInPqlbd0sBOxYA4Ai8=;
        b=FJhO+QgMVTmvflgR8k9cN7SLgTbMmA2ratCAfqRnp9pJe6JV7ap0HuYz36MA8GUOIF
         Ad3EeaKymg2E6LEJtQIiDnnyMiJxOku+gUI+kb7flvICKAXKhQ+o5HBzSaBDmGtDHaXp
         i36qbUkdq8KOfJV9G/vMwz27As4Q3K5R5S+za6eSSdOqehw3YbcL1FFhTFrHuMD3hypz
         zKwK7thfUfPegIKuLlGcz7Xt0AwW1RNz3GvT2EIvmxnNHMscytJuMGiuw7prsDojrm/E
         g4//Sxt3CwJMTtqvXY23HNjCxl1QkJKRUIzsezs7G3x0vnWinqrHl5rJ26ZS5rwkmnr8
         W7dg==
X-Forwarded-Encrypted: i=1; AKwUvBzya7a/Kz3CKBHpz//fPO4nsPT++HuDokjODlaa8a9ko2I78TkEL0JBHYGn/1Rg/zcAj+kmjxD5J6cRkvhg@vger.kernel.org
X-Gm-Message-State: AFuF++kkBwSFyG/iawDEaeuIFWYywqayZUZKKnws+Z1dOqncoRMQ+7CQ
	VSy4qAlCI/Iu0ADVP2nr/4n1kP2+b+WzzCty7uaKO7B+iXhORxlRsa8DNcuV9tJNf4W/8DQLrv1
	b4/xUceDw5Nlg+XibdxP0YANdoKsKTNeiMyIWUbuQAIIBxAff6rvZbWeONfAcfXMpL2s8
X-Gm-Gg: AYBFou1zQpBJo1C+a9cfG75oGaulKM7xfLGME1VfK5NJI8KpNwAp9V2CZho+VbXDqpd
	bIfme/MBm8ZekAvyVfXXB3Aw1gzAYrzghp3a7O0Ff8EW+MdCEEdQMoQjSU1RQbIRFRgWkUYsFX7
	jz1EZ0H42Y0l0MCb1vzE7Hwm0oZiaoYyC8BIPnyqh33N1iXYZGsa5+Qqt3CyXaCh5QCVyxvgJqG
	iAxBFgilseo7Zh7m9hIs8jX1RamxfXB6thCGMKxsgBwmy07NGskjXR8+8hDOX78Y844ibeJRMZJ
	6cYMVpSJchp4aVy7JtdyVKSR6Gk+ReD6qyb3EDicurh+iwc4EYSgaZNSzvGwhWrPJy7ewvxDaeZ
	BYz8uaHSYBECyCK4=
X-Received: by 2002:a05:620a:26a9:b0:939:7162:911b with SMTP id af79cd13be357-939ea21332bmr406987085a.32.1789113107014;
        Fri, 11 Sep 2026 00:51:47 -0700 (PDT)
X-Received: by 2002:a05:620a:26a9:b0:939:7162:911b with SMTP id af79cd13be357-939ea21332bmr406982985a.32.1789113106412;
        Fri, 11 Sep 2026 00:51:46 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e636f7fa2sm34366775e9.15.2026.09.11.00.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 00:51:45 -0700 (PDT)
Date: Fri, 11 Sep 2026 10:51:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, zhangfei.gao@oss.qualcomm.com,
        shengchao.guo@oss.qualcomm.com
Subject: Re: [PATCH 2/2] soc: qcom: llcc: Add LLCC configuration for Nord
Message-ID: <2ar2mbwsbhmsdodo24mlckgj4fz2au35c6w4zcqorwhiomux3u@3uthjwyommcm>
References: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
 <20260910-nord_llcc-v1-2-30fd1cca65fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-nord_llcc-v1-2-30fd1cca65fe@oss.qualcomm.com>
X-Proofpoint-GUID: Hsti6DE5FDb6M7ddJIY8mLuFoTtXsioV
X-Proofpoint-ORIG-GUID: Hsti6DE5FDb6M7ddJIY8mLuFoTtXsioV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEwOSBTYWx0ZWRfX4QPK/SGFcKep
 q5AAntBc/pmuYhme5T0Oy7Nf4Ge925aYv6ndG65cU32MmOnmv6X19cem0BwNS7oms071IVFL/aI
 2lCbjl5S1+WgVBOlwzP4OZ6vEs2kTwyhg7brj32BnECDqyIgeDpKi+5qS5YWf9ZL1vnY3qMnKwl
 cYYF7abGtm/Y/IL6wRccbzyiQwvhPpwj10ryP0qXWsPwznmmUr3GfoiZUlv0dnhupF6Szv/FPaE
 7V8/irr222lqJWrp4GK9V2pF3GTQ2nWL8zIkc05hXyFPIjd2uot+xZMDWBzB9nWBZ1p47Ijfp3A
 9SMWf+TmN/5wK+lIPgcwrvLv2r1rtuF7ReLifMGOftxMK80XOaMbm1WDgxXqBGi0Tx6y/NgjenG
 u4pu3gCXUsx5Ak71c8jt9iKV8yRkfl4oQd+K936O5gbLn1RJvtADacKXvaooRiDXubnMYRjXWgl
 HnKl37QodgLBOwocrZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEwOSBTYWx0ZWRfX3s6VtFui1bPy
 JGNQ7iIIzEuGXnFPEklpkRZcsAawkgii1Zh5zUwEZ0PzuWFN0TTr6sp3p4aQSUsZWLJyRVUDsXR
 S+Cjgrrhsqox7uFAreMe9TMB6trcLKg=
X-Authority-Analysis: v=2.4 cv=UJFIjyfy c=1 sm=1 tr=0 ts=6aa3b314 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=OxrQ4fpuk6iiGASJZ2MA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110109

On 26-09-10 18:30:44, Anurag Pateriya wrote:
> Add the sub-cache table for Nord, derived from the Nord AU (Safe IVI)
> SCT table and limited to the POR use cases that have a unique SCID and a
> usecase ID in llcc-qcom.h. Nord has the CFG0/CFG1 pairs and the full
> ALGO_ALLOC0..3 set, so it uses the v6 register offsets.
> 
> num_banks is set explicitly because LLCC_LB_CNT in LLCC_COMMON_STATUS0
> is four bits wide and cannot report sixteen banks; a wrong count makes
> the driver map a bank aperture in place of the broadcast region and abort
> on the first broadcast read. no_edac is set because the bootloader
> leaves the LLCC EDAC registers locked, as on Glymur.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
