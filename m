Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4FC408018
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 09:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339683; cv=none; b=UsSYRaYSuZB7eu8sBu+UGv2sHfwWHBJT4U1eahBbHGGc+QB+mcSfwODlV2qXZEKbUN+vYKTvvmep9n4GUJNpNKcimcydfTGS8sSCqDEjAJTSCH9A8bmzuUJChrm6D97ot53PjkJhdCnXUd//R0R6tRk3CO3h8RHWTfJRK6e4g7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339683; c=relaxed/simple;
	bh=Atq4pB3YGZ4lFAEE0+lnM2Mik4PShDbyqyPa7jARmoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ju35nmCMwOSbeo8eW0liPiRwH7IyDshWEtkzCZM+abgzycQ6tE0pTm66suRJyTkD+r3semS5iNIvTepSXClC3W6aAqoQ14o3riFFFqNucudNLQfhV1tuVitCKExsZCeLlz/BnRXTvDt+YzYM0SHX4agiSHoNl1psF4aOiOJkt2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0CDjcU0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NubLMv9r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0CDjcU0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NubLMv9r"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VkeX3758922
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 09:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yQbyCK8hb1C0dq/eCYljQc9X
	nj9duFCu694HFTDiHCc=; b=G0CDjcU0Z33uC/+1pPkUPpTkEdsh6cwkhIIBDNuG
	m5bnV9QrSeZxZM7sO0qUxMrZ5mwBp3IlzLTyttKxaW3xa9aYCD3PmoNLEtziQPh3
	BEgDf3lwo5HG8kNtSiT6VXudYGieSg8GURzkWnrPaJu7P9EI8AigTdUf/ViUDeG/
	WZLdSBjlEg8rLS78DWPLsb4jPJAkkSlic5ld2IFdaVtH4WuvDNDj2v18DxwaGVfn
	wMx8+/Xqj1HxCV/io9qcG32g9ZCkdV1mhWuwDnqcGqodXUTfLrTeA+64UItad1g0
	lptcR9pbVPxbnoaYgnPyZnYnjNSLB6JAh+Kd2fmItWrPZw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge39ck1bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 09:01:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930b571432fso145068685a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 02:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788339679; x=1788944479; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yQbyCK8hb1C0dq/eCYljQc9Xnj9duFCu694HFTDiHCc=;
        b=NubLMv9rEwJRAoPLsMJyGcQ2+HAWyffak+ac8at8DgDJIhmc0eOcx+bEHk9vuWcT79
         UsKm6cfbRmSVo8e4F97nQ38ZrXj6PCmlQ9rAjwK3bzTSOphMoDW+IYgMIir4dFFs0Qzs
         S76dOacRlFyaAUZ9q0CdUDABaFRM1HGJ4zzlGSEZ9aNPEpw7pN4e6psRlyee5F4Hr0VZ
         +8rdrW8nPmumcQKddMJnjPml+pYCCAF0UmQO/gRqSg0hX7N++ebDypHaQoRyFGklPlVh
         oA7/1oMbsxPiGTE4et9MqhggRAeItp+Ne7z2yqUd2EFB6fxAR0tOOsl2ZeVZnzB+/LxQ
         YxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339679; x=1788944479;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQbyCK8hb1C0dq/eCYljQc9Xnj9duFCu694HFTDiHCc=;
        b=AclfEdbJ4iMdcLbOl5/LsGJy1obzmhaLV/iVtVTe6dGS5b2+eeiOX021tUiJ5NXeWP
         ZBUXuRo4fm+8Uqxxvo8gzm1fQOtlCEQAr03FaaCUfQD+vc5noD/N9QymZlTXYjgICwXH
         wIUdvKdLBv7keHVWl/C+IdlpD9NI8JPCrPIHaeCyP76k+P8qJVqTj+4pLfxfa1tS6afP
         LPWQBrZfT7hc3x9HZbm4u5l4+aik3mwjNjkyjSzQnr6tc3alUtO4L86KFIhji/8CCIG4
         WVrjwN0pDh1lHGrbFXPzWAqNBIP15TYnisNAR7APFZ4GVn9DOGStOBulr5p3VSTciHsz
         ZnZw==
X-Forwarded-Encrypted: i=1; AHgh+RoFH3npvc6YyXAFwPenwBYUoExU4x2pGz6umI6jfJb7hB0nD5Ocb/EmGH6j8Z+OJoCYVDmgpMVpQ+1ejjok@vger.kernel.org
X-Gm-Message-State: AFuF++nmfEKoHfkiCO/3WB030n41XpIECjaoOoKCAQ50fG+Z3W3tyJ7O
	CHaVDCrZMPRaVXPe39xhvT8rsmMLwFe5CNE+vgoz4g4MEmOEVR454RMMDyoCep95yvDlXRixZO3
	eN0IrMyJuP1Mv7XOE1brfB4zawOM8MZ+61KsCeU0WR7B0A0FOhp+AC3YpBgcXri6/EJ86
X-Gm-Gg: AR+sD12C7J/4ai7ZY8X+/rmJYIxL0Djc1DRguT0/zPz2VRTV46yxg9ZDzrFSfswuWbz
	JZyxdZYDGqV4T4O2tI/dtFAu98q8lmgFjecODYXYuQwfcnCheRIfSYaVHCeCFmgPbwaSMu+mmwM
	7yLAoJNaoGpZ5u2cwq+n8L/wcdU+LmvjoB5ddEWZDxuAMysNFUSg+DAsn+1OxpuTFgHu3FD4zMQ
	bj4eRj7VETCLwXahIHsS6Qef7I36fHEPMcdoFPt2n48yRrUahhkIWte2/iajBW/n2z2bspLPlNu
	nJbrs0Hy5OFieZAFJqqdu/MsJHRCQW7FXcRv/alqq63wOWGPtIIwcbeyPXdswZSEfwy4vAUnpql
	3GF9QBopvHr1GdA==
X-Received: by 2002:a05:620a:6018:b0:939:4bee:f84b with SMTP id af79cd13be357-93965a10813mr141499885a.9.1788339678442;
        Wed, 02 Sep 2026 02:01:18 -0700 (PDT)
X-Received: by 2002:a05:620a:6018:b0:939:4bee:f84b with SMTP id af79cd13be357-93965a10813mr141490185a.9.1788339677868;
        Wed, 02 Sep 2026 02:01:17 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce4a804sm155172055e9.15.2026.09.02.02.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 02:01:17 -0700 (PDT)
Date: Wed, 2 Sep 2026 12:01:14 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] regulator: qcom-rpmh: Add supply names for PM6350
Message-ID: <yhbjhnmuwwqqbjlhpo4ppwtmehxnkiuqagzigf2nieqxqpiako@c4tfpqbizd2w>
References: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
 <20260901-fp4-regulator-supply-v1-2-68288ab70aee@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-fp4-regulator-supply-v1-2-68288ab70aee@fairphone.com>
X-Authority-Analysis: v=2.4 cv=T968ifKQ c=1 sm=1 tr=0 ts=6a97e5df cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=siMggkYB9rnzUccrDQUA:9 a=CjuIK1q_8ugA:10
 a=AYr37p2UDEkA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: TOqglRQDgtjRicz8FwHxin_0Znsi35jH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3OSBTYWx0ZWRfX/KVBPx2/iEw/
 ZrLisMWiHOT2ZaKkY7ec2ypQDLYWwrftDqDL1M+jgrwBXqQkEA8xX+c60p7+zStDDl2pEpIfmf1
 WO1XSMMgrNCuM7/20wS5Jh+2H1e/+/Y=
X-Proofpoint-GUID: TOqglRQDgtjRicz8FwHxin_0Znsi35jH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3OSBTYWx0ZWRfXyqnNBXB361FP
 Xswqf1kIlgvnv7FEXEGoORIdZoDNI5NrYsP8QtAgtZgIR5JKsqmxUkMvXg3duD5bsrKgAwk7BHa
 8L/j2QuplyoKgAxSLD6U45FT+FE72QkYvodQzxvN3O3j/OE/7eR6QMKm5HaPMkrsJcoxJuazdck
 1pJSt9Pdx3Iex5vABv7nRRFBh7PWDQpwKNQVAUZU+0fg+lKpfRmzIWYKx11TNMgdB+1PT+2DQeO
 0rmdU9uO3gJHfJH3rjRO1t83v9JsffdkLnwg1ZAOtOvay3PwzRtAElI115oZBsRjuERHGoCoIIF
 akzJGv05O59mb6/MTdCzQLbVxul87O0HSKYL9QDiV6tgNi5yQcDSHKeWHzdNX6Xxkt4qnznXl+4
 1X4Kx8bJ9qClgR1LddRkGQwDEBWMQLM2iVTlUK+4fua0UtyQTbsqCMWOS3YJsv9Vbv2WHAmvx9r
 PBXG91PyOr9PLdNeoDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020079

On 26-09-01 10:58:57, Luca Weiss wrote:
> The supply names for the PM6350 regulators were skipped during initial
> bringup. Add them.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
