Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5230B155A5D
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 01:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786930659; cv=none; b=Rpe6ARr2XDmaJEw9vNe+LnCGBvtwETgXvu6pnHX2IfomR/bsZvcCmPtS+jHgk6bHho/9Akc2N0VtF7FhcBs/5QpgyKFs8wUMj+0SA8X9gEiuCjlrZW7LKNY2KyusM78SyF973zHo2JSxK70TYxfbwb28DAROoaLjJK12PfKVVbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786930659; c=relaxed/simple;
	bh=Uf5qY7x61qYUtIfV5U4t7BoTPkkJjFI2kdvB0YyL6BU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MG1L8UiTbBBAefkJ4wyIGFRn2iKVpLobS2YPsroj8ffYnO7hQulV4tmDOI1+YOx08KJwR1IVuMdyNclk4aCWdOse5VoeVusfwy2oN5Wt7Cbvjb+DrYL3rcmIRCxZXDv/6uq7beX/chPzNxbkv8vbj+mmjV922PQvffaqnEtrdCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j1rHNyaj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xo2QgcDj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j1rHNyaj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xo2QgcDj"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLEoHG3309446
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 01:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DttHodwRqqzN0BeYmqZAVBHE
	PT9Q+8sgPwybpRYzvCs=; b=j1rHNyajXeFMNQjbbUA9cyESw9DBP4sQmjSlCzGM
	KB6Jgmh0xIh94r/T4F4WR7viZMnSv1ri8Q8CQxepmIDP3JS1DI2iiQVa4j0dv82z
	Jy+CQt+cBuv6qHoCGmDqeB3x7z+YlS8f8yMWZnaZsikmnupdCaQtUZIB5V64wU8l
	CNbeybubsG+3TMg7jP66fuIOsEtnhh6daB7O2u6U5q4CSI5+XrUQK/KMcbcxTIAi
	wwIIzN2TfBMaMFzuXmGiPRr3Rf2A31LAo3qFwAg4uAOdkvYJYSlux4ftXMGN8sCE
	FBdPDS21th9KEAu6nQasxO87Wje82H4hEv2dzfFwMm8fjw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghq4r62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 01:37:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e52306621so277460285a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 18:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786930656; x=1787535456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DttHodwRqqzN0BeYmqZAVBHEPT9Q+8sgPwybpRYzvCs=;
        b=Xo2QgcDjN44bixXP3HgkyaJyOyf+YpAP01oeBn+8ZLdYpjhFX8j3K0olNoxp7pPrPY
         zehNrUUBKob2w2lfSLc+4Lw59caKm7cqzBUQnJL1yqscli5itxQfwF8UTTvJq5cC5Zdt
         6kJ3y0oahzKIP6s4Z+5d9aWFE8PllaxCZVX3TPIG6xc/rg42pjNw1vMzotICRLfG0Dfj
         OZRvEQlfN5laMfEmE8utKH50R/8TB2vk+O5dz2QlApVR925/g8PCGk61ITmPmtHupqhE
         PdtAiNqmaZ4uFrAqsXeNuY7F33716XB/YWIealptMn7+o2/iXq7VFUiGRahgQhv9Gtgb
         Xqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786930656; x=1787535456;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DttHodwRqqzN0BeYmqZAVBHEPT9Q+8sgPwybpRYzvCs=;
        b=cpH+2+2w3XBIZ6x2eWG3YhZH5yuROgnfAOH3eBt1j4N5mAjnMJejmq2DS+OkADOjBE
         L2r/lLEsuQbPnay1n8UzmRprExMwSyQ0eUW5Tmv4G6tSfQmzoW7w+nF+EkNTK8Cx//Or
         5XunFZqr9Zub6wN+b7F0C+KK89peC2rNqVom6bEagTOz/CaOCFz1dAUxeDFUjK2dB/Us
         97azv+DF2poLRP10FGRqKMAM8p9nFYcI2mk3b5JM2OKRV1GOHuJikn6ld1qCUShpuakK
         jSCnChQCV/EJqYr2/cGHzRHHx+ytoS9qGL159LWQr5VaSG0MEEkwbfpqEkj7e5z2oiOD
         q6Hw==
X-Forwarded-Encrypted: i=1; AHgh+RrTKICIoUr1D9hPafmLAgZuqW5VyBxQc9i/qcSOAD6gyhxw5Tpmrsgj5K46sxaHOigCGzOoEn5OaCZokLYC@vger.kernel.org
X-Gm-Message-State: AOJu0YxBp4m1WRh7zq2pw/4wYgQHq5tKXDztrHi07p0RHq0/IMXJjNfa
	svXRVJJyvHnc/YPnnpQ7g0cqLUHXOlGBtC3FSPxapEDFv98Qz7tzt3+/1LStJxOZHufgE8Hym5e
	xnCnia5YglLznfPHU7uDWiOtWptHVcCTgJGW2AGf8jsfzSGqQxPjhBs150Drw15WJR6vc
X-Gm-Gg: AR+sD12Q9ZPtEkBUfyGVzm31YuyMHIkpV/sARorh+jJgGvPh2tQZbSA2HWtpm/bfH/Y
	I7HA2oSSJJT/e4PRaE+6VNjjGSXApMHZRzaauuCUM0vL49NbLNqPiEVyXCLhr5qRr9cVrO5i9tc
	3ZU2sUvpiXoYnepCd4onwJRVTge2csnL47RrVNYmprL6+lfVfSXWIKN+b8apoT8pajpyJmh0hRA
	KP4tsDUAM5u6h2g0nk1P0OBke6Q1fgatmWcLrrh3yrwxq6ITspZiAjXSfrQ0uR9LjDVXBxlNKiR
	hZhyIa/ogCAjWjA3RnaZMICBte2vDd7GgZB0LkdTRJdxnOv7TRvGMGtsvomTJscHobGS8VMMJ2a
	rj41ZsUadaS9cIJUhXRqoOPG1y6Ob2xctt6NNA6bicEIGyNNBehI0473UiZFXcIGPBWknxj3xEn
	IUYMhG6pGLp1y2
X-Received: by 2002:a05:620a:28cd:b0:931:3ff3:30b1 with SMTP id af79cd13be357-936d227a02emr2017840585a.4.1786930656419;
        Sun, 16 Aug 2026 18:37:36 -0700 (PDT)
X-Received: by 2002:a05:620a:28cd:b0:931:3ff3:30b1 with SMTP id af79cd13be357-936d227a02emr2017837785a.4.1786930655994;
        Sun, 16 Aug 2026 18:37:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458ba9ac3sm2126646e87.33.2026.08.16.18.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 18:37:34 -0700 (PDT)
Date: Mon, 17 Aug 2026 04:37:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Use hyphen in rpmhpd OPP
 node names
Message-ID: <vfq22cxxut2pp4ncncwxg3x3qgcox5bfujg7d6qg7djbesxzyp@evmfw4hqeedn>
References: <20260816123648.1632681-1-shengchao.guo@oss.qualcomm.com>
 <20260816123648.1632681-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816123648.1632681-2-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAxMSBTYWx0ZWRfX5XZkG9J41KhL
 eTSXlvhCc+MlSPI6E8kXDvTg3d2pYixE6ObGnZ2HpefNQq6M6aRU96bVkEe+xiHtNUZIyOiVZni
 ntUoQ4uZpj/MEN/g1aTayaeEESXmuLKI3dSANZMUaMTHWtTpAjWOxlKXQAYBitHpM3p1QvhNx6I
 HvA2VzNash06FKQ+qiRH+Eh0mNVI8K4iZa6b2zc6/eQRQR49e/kkF6/vyP0p949segtIXH6rtVX
 UNCSnMwa0fvgg1mKi0wCJgPZyTGHBEcmlZYogYPMG7Q5SOSxCtrPRwxWK2krKAHedm5X2YKgMKo
 r2kBaVe6kPG44fYb8lQUnvAFNKG2LR6OPGHzDOAR1SUFp6cJHMNSs5ydp8vbzaGoevmRF4r84aG
 doI7tPMgOcqeQ07jkIj6TEcVVRL67PWG60UwN7ALt+PQslmbdY1MkBhjwPqgZ3ywKSfopLrHcj7
 sHQINc9qDf1WjyACL4Q==
X-Proofpoint-ORIG-GUID: gN6Wn6kQalFH9_vCvvdXMBpqyYU7ytm8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAxMSBTYWx0ZWRfXxaS10FZNiZDX
 juC4beAlbqsK/JbxcDG5AieMb+JV3weSD5r73+m73CvRY3HqkXSP2aVXow2w6Z4zqSNqCWqHwIl
 s5vPyeM4MInnwPVFhhX5PTVY1dGuUZo=
X-Proofpoint-GUID: gN6Wn6kQalFH9_vCvvdXMBpqyYU7ytm8
X-Authority-Analysis: v=2.4 cv=dvHrzVg4 c=1 sm=1 tr=0 ts=6a8265e1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=hAkKzd-5U1ezm3Gbz5AA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170011

On Sun, Aug 16, 2026 at 08:36:47PM +0800, Shawn Guo wrote:
> The OPP nodes in the rpmhpd OPP table are named oppN, while DTS coding
> style and the rest of the qcom DTS files use the opp-N form.  Rename
> them for consistency.  Change should be safe, because node names are not
> considered an ABI, and all references go through labels.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
