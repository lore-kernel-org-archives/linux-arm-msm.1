Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999D2432E9E
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 18:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780428; cv=none; b=W4d1oAH8+58CB4wR71llb6SNc2LBg8Zlqb7rgUWLxyWb2rLeyxgkT/DTbmL9V0jPg7lvG7dJydDbJFdAFUntFyaA5mY4v3LeJnHnRApuz77jaMuxAu/7iWYD0vLHgwNbTRMVAtHBHOjzFJ76Uj9J7tFih2tPB2vIKMCv30uLDrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780428; c=relaxed/simple;
	bh=LwHbaRL7meJ5BgK2SJUYXT64Aczh0owcQAjNNq14KzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j7IgxMCybS7kxJTSb4/00voZ3W6ns7hbukWOx6I3+WY/uRdexXfmplcb4Pa0h/07pNyBKXV8FajOT7msANbX/q+DuZPNZ1mvP1hag2P4yuDJCLHQc5J904W3wQPHyKg7kVQMsNjWBhydFkfeCgj/GModQ99esbN9vr6WrmlJtfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JYAerpfG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QgC/D+eo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JYAerpfG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QgC/D+eo"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673Gw6871737884
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 18:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=42DUib38jBSO/OccuRuv4DNA
	e93CWj3U0RdHsNPxIBQ=; b=JYAerpfG8mgDi35J/yd18a5D9Jt4mGvvhi9XlsMQ
	wDT2/MsZA+oTqTPIExTufzQ3jx+xHOvmWNkL4/cKi+Bz3WYwrDbVSLT4bnSZIaxt
	CrUJz/+S2akXNk9Nr82d8/z9c4Ll8oGFKtb+VlbSgKKcnjqhj0G9b1rIyUDHT2Px
	AgIsX6Elig8GlzR0pj0W4xLIR5feKvdw4FjA1bpBBG/ZyhZ9jBSsGCctMh4t7+Ue
	OV7NCZ4tYfEA+Q45448fSJULenpC/wifGUiPdjaVT0ZSrQM2Zv7gVvh01iJYO/Bv
	obZqEBqRDaqeEVljSF7865mH9vsBI/jnAIvQEpR7aVi1UQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrdb1pj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 18:07:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52769fc3f2eso40985381cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 11:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785780421; x=1786385221; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=42DUib38jBSO/OccuRuv4DNAe93CWj3U0RdHsNPxIBQ=;
        b=QgC/D+eolH5BowtoSPTX/IhVKWHWo1MwnkXe3c+gCvca24s22hYFOiGCzFHwBNOPdf
         hBpt8whe5JhpGzx+eB6z1fUZeH9SqMpzaxORTM8YAcw/1TGMTLJHKqGpLB62+0/VRJOZ
         KRYQ0j75mTbU6EsTVXkG/NoPqcaKPJ737QmocDO8+n/E5Z5/cxO9s57alMm48wGX96IL
         DM81S3mMAoLMAxIiOLSAri0yvvaLYeP1U4FYnihd9rQwT5057SUBCE+Bx5jDnbT8FViW
         pH4BLKw5isH9ifdCXYKJWgp2kpR2dpSlNsFMXeKgpavFz1HkMKofuHbNtXCFEvXuCt6q
         Nm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785780421; x=1786385221;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=42DUib38jBSO/OccuRuv4DNAe93CWj3U0RdHsNPxIBQ=;
        b=BJfWTX7mEa4BiTTEpNHfefvFN5tZp0CLvBjnrqsbRynVIxOrW1RRRe7Ek7+81t/tMB
         VlObo/V5fhByz4+AsaVHc8rkkRo9eHTvTUlAm/qNjJNqAJUR8d++3Neghz1mgSyqG+f6
         0MpvzaSzDv627WDOcrrIG5Yem0HprnD9Vqj2nXLKQR0cvdtWSEPlKDGkiuTuCj5zsA/v
         4l5Vlkd95VwzYVwOtXRUzo2N1gFarqYdTKvXSWx+ZJGRs6thtFgQiEJHPYM9A8FRK7sL
         K+akX+SGeMSP4ZR4Soddka56q1R4wmAs7Yux3poU7FsWxyOAT5IWCyQh1oSu1PJkJa7U
         4Clw==
X-Forwarded-Encrypted: i=1; AHgh+RqeYNwYPaCxSuG2CzSr8OvhAbroNNBxvAk+crRIlDLGlZUtPvqsS7hi1Hi05Q1NDtvP5VDEA+sPjN3qnxOO@vger.kernel.org
X-Gm-Message-State: AOJu0YyYfWk0w9AkfXw3ns9cr5PyRFIQBRhRCGLT4XKIgO9+DH5nnu63
	GLxFGvwKWhkc3U1UDSVd7XbnSM7APayFLqnXcI/YZWypfp9uklFbKbOSuPB/ic1CS8vAoSG9HTr
	d1hEZyacPhzWuzVAfqzEOYXRORMqswTaJ6bGB+42sFKKTLvkrd5G8OojorYOoYPtDiGbs
X-Gm-Gg: AR+sD13CVZy1QQbN1bILZspzHSWVkG2m9ndcNd/G46kjDIS3sl0A7vmtkK2NHmqNwfj
	Ar31y6sz8xtRL5N66Me115Q2i+9hq8ETZlnyqr2N/91CAkToiENYVWmPWNGeuOvN7+OvKZjqOWW
	SBDjzHbylUAyZBwp7dCwX42U4kcOckx9mHfu4yCQuaoUL3FUCb5303t6PISgfgTT7l2XnYlZDKX
	dw7NLNLlze7FPQOXHw3gC27nQGAcetKXRPGR3h9yVbIsdaUXHO+NFQpXKHkB07DeWeaIOu6oJOP
	XQEbcvBRYqvAjup8QZRxy6ZuZOtGXoPRQ3G6nvkWHhWcj1HFnl8Sb9tpxtFQvgEdwdbT/1/aQBL
	yB5iMKmXjpphQbBrZ41ZWZL2S1PdjJAUkZbrGFtJ7q89cGDJ6AgCVRIymo+PrYAZmD1xls1OGSU
	+wnQAnwTP+bJhQYg==
X-Received: by 2002:a05:622a:2611:b0:51a:8696:cb38 with SMTP id d75a77b69052e-52b56670997mr241805111cf.7.1785780420832;
        Mon, 03 Aug 2026 11:07:00 -0700 (PDT)
X-Received: by 2002:a05:622a:2611:b0:51a:8696:cb38 with SMTP id d75a77b69052e-52b56670997mr241804201cf.7.1785780420185;
        Mon, 03 Aug 2026 11:07:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f812ade92sm13853431fa.23.2026.08.03.11.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:06:57 -0700 (PDT)
Date: Mon, 3 Aug 2026 21:06:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdx75: Use SM8650 MPSS as fallback
 compatible
Message-ID: <sxn52bn2zcy6blv4rzkdwpthr3s2ozlzarex3iclk7ail4uhx7@czy6k5krxuex>
References: <20260803180021.20368-1-mukesh.ojha@oss.qualcomm.com>
 <20260803180021.20368-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803180021.20368-2-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE2MSBTYWx0ZWRfX5xM+HEzi0JVk
 AcWztBCIlrFBwx+Bjy1qZ9YuWGBVhgxmPSNuxRJCJPFfnS1c1EnrUa13L6utDTxqos3aiGYazFf
 Fp5rVZplBh85OdBHiEE4TtvbnSDiUqE=
X-Authority-Analysis: v=2.4 cv=f/94wuyM c=1 sm=1 tr=0 ts=6a70d8ca cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=gIi9JqMhTtM_ZK88ZZIA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: -Z7iE68rFR6e6I3ZVWNKh7E3JF3becOg
X-Proofpoint-ORIG-GUID: -Z7iE68rFR6e6I3ZVWNKh7E3JF3becOg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE2MSBTYWx0ZWRfX+xvabjNl1xyV
 zAXiZ1UaqPKGsV/Cf8n40/1gD2Px6aXrIGHUdVxkEE5z8EfgIm1h/GVUPYxcoWd/q/sPXt7Azl7
 56LCwzOZ60uREUTQ6PL1agxHBRptPcJJWtDGJl7XD2cps5y/ydxBwLBG4YoyHrYBFFlTmpXf3Kl
 kzoyxEW6nuUR0vD8C7YNmXBO5yxEILoZykrNqZPRt6h0tssx+EzNlJScqWpqSC4bNfCe+Ko+5y2
 CWfW6ab1Flxuwhw7xXT6Ixu+dILuVdDhZJYpFL0EVHNSl580bwo7YABSYAuF8vWlpA6IlFep7w7
 L3rfuH+XAZ6M12O5oiyUtoZRrHRgZxgcOXL5wqCCzbrTJqe4UpMINiZaHC/86xelvrPHUOOmYUg
 VK5h9no2UV6029FP8L/9u+S1yxKhU5gAiYFVTjC8wmZvVsZ6N5cf2P5zzc9lEj+mCYeh4Fhd+v1
 xYRf+cVxq9OxLGnkKbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030161

On Mon, Aug 03, 2026 at 11:30:21PM +0530, Mukesh Ojha wrote:
> Following the dt-bindings change that expresses the SDX75 MPSS PAS as
> a SM8650 MPSS fallback, list the SM8650 compatible alongside the
> SDX75 one so the node validates against the updated schema.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdx75.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
