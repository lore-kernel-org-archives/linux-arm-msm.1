Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0462434389D
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 05:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787721709; cv=none; b=lrfW/2mN96MJ2z4nKShckosE0Z1ysAuhd3HOodp3TYl6+S2YjuP6pzXOrBhiCWDjWI771MaZJ8t2X1IBNjxUsdC/S9U9b3OfxCgf/E3Ppp9Pcu4kwF5jD3ao06kmw0wgpjdToybFzsTaxkQ2B/VSROphSISiBMIW6hdLMyOVFAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787721709; c=relaxed/simple;
	bh=ABD2/Uem12rjFzZ+N1wA8Uzr0Vbc7D9ujFyssZ7bl7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gJ+JEEILC5QWp8s7SYP44JX9L3rNIGcUbK+7SI/j/J/qSgpVR9wSkezV7uKAsftgNUmJz8LG2PJq23PMmySCFA01kb/rbHPlb5j4vs1nP7nsqbDVEhL+TMBOR61X87edKSG7vWEiGMw6wW+525DFjSBP4maayLL3eD/PiEgQ+74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TKWXg6vM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jrt4pOwl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TKWXg6vM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jrt4pOwl"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q3HGjI030882
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 05:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dH+aZhaN8+2l2qJbM00g6UXX
	bFecrdPsnX67x3WzUlQ=; b=TKWXg6vMgoByvPeUkNJTD5Fhgaj0coBm+xojWVVm
	tSBL8znXo7s/sjvGxOuxbCZgaDAeC9CNZbbOMD6SpPtIAYPTj8YaMhFvM0xRl5eT
	rJAtj2Dq/MlRKi6wOHbpgoc5D9lBm4nvRbh1E5H2klMPAS0LJ2PjaSUL+mOtoBKd
	/GpBVYgoAJxA8utBpfkQyvvGr2NwL9hufPY0/sBKwK319CORbAnnphsG9NrSzQN3
	isEu+CD6nkbNeJV/AOU5f/8lwF90/1pVxr6FY00IBPE7HxT4Pevmt3LHah+aRoJQ
	iBwgCfnNPYwBVL7LSEOwQ4V17z71d9DtD7W9m5tfj5eSTA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1ggd26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 05:21:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c19493ac2so6312671cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 22:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787721705; x=1788326505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dH+aZhaN8+2l2qJbM00g6UXXbFecrdPsnX67x3WzUlQ=;
        b=jrt4pOwlRUR4UAKz4xpciANF1ucoFuzKpKjPwsj8mQxNmigKX8C4T2/K6zCPUVF2co
         xW10dZC6SDe3qnpopBEcUzX6hm7GmjH5F6x3xb/Dep0n7bgau4BAki9njbBVK8nETXAI
         jEYCzTTs4A8Po2ZXqibT/YanM6BKbyxRsHKYmBlHUZZApDIA906YtGJ2uWh0scmTUjrj
         VILMIhhCGlJ9lBxPFevClx8G1sKygTEO/Aus3NK7T1o+t3t0CPrgZygruGTKgVE+Ek07
         BxPu314EKJyXmQwgFq5yA3/ywG829r9OGwBV5yaDThoiYCF1ZPORAj16msXNmSDoFnfF
         aiCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787721705; x=1788326505;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dH+aZhaN8+2l2qJbM00g6UXXbFecrdPsnX67x3WzUlQ=;
        b=Ma8a0GIGKK93EMdskoD+cE0wXwtRoY4PZv6bMGTwJf+LCcaRPJXva8YDemu8Gv3ki3
         Wna4YMlzszk4QG0QjSwH4Lt1tIicgZxC0DHs3tHI/1fadcznJVzmPYRopWshngCEtjvy
         sL5zD/aD2/UBy8S8NMaoLpzEypLRvWayDrpLQ8omFSiV0iqXkI/cehCc0dr1sL8RCIh8
         jMpo8wPkgwAZUvCTrJBlfM99FcmN8ZQC7VE2jHeUxQH4HwIRprrxyl+4bP7Wnbk7CFAs
         VTxS/jVdoQJ/hfCfMPtZOXf0WuoVEef4fpFbpNV79Apr/xI2wF6kIxslvM5NkusRLPPj
         SjXg==
X-Forwarded-Encrypted: i=1; AHgh+Rp3PN9i3XTIvLPA9ZBOv3GBcJ/QIZr7Kchg4RIc88Q5Vo31mlszKPhLS7n2DEETf7vxLOeT3LJcVPJ3spOV@vger.kernel.org
X-Gm-Message-State: AFuF++npABKbeDhJM/vQOvvl11SyhTHpiUXlQZNoV0P45BUSzDFfNvrw
	MUwrb9hTKbpOA2XFNjbBifqUp1i1AuM9BO1VSCzrwLauX9qQZRIJ7IlRw3ggGYkIRuzIUBaotN7
	Do9PVpavcmC8sQQKRVfIx5r5nNcLHQhgidzHw8+4LQt0mG6f4xMmXqYiaQGojJTZBDRe4
X-Gm-Gg: AR+sD13VgAUWqI9qcy6vYYP3OlRCBNryYLq3aTPhLFaRp4Ez5aeIe4YuTgkuyAsHMJ5
	+7WbVwrGaDIHiuOu0qu/OxBmU1rVqkjgIWdmpiWO2/ylLslbq4mCADdWT8UX+/IyAySOjJJ32nL
	uQldLCOiGa8YKWZ8UbWcOcgwiv/91NbEHSfobbkhjFbnIE/uHfL5OXaFOdLTKJQq1JUtSdHLS0I
	Ed4iHp/vqpdzfLh/XG8OH9xn81tr2ZYRyy8jmXvkx4U5SSm588+KvAAMQvOnc4HdAlKFsEiotwS
	y7cjKw72hWYg2H0Ix0HrEB2NUqzY1q4NVaxMV6VHi4hJl+gEgFSQa5UkR/qdpuIzqZnFbYNlNFM
	dI5XpxuGYUWzpWQ==
X-Received: by 2002:a05:622a:58c7:b0:52e:119c:e82b with SMTP id d75a77b69052e-52e4228d40bmr44170081cf.13.1787721705240;
        Tue, 25 Aug 2026 22:21:45 -0700 (PDT)
X-Received: by 2002:a05:622a:58c7:b0:52e:119c:e82b with SMTP id d75a77b69052e-52e4228d40bmr44169841cf.13.1787721704692;
        Tue, 25 Aug 2026 22:21:44 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8d1afcsm3720943a12.8.2026.08.25.22.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 22:21:43 -0700 (PDT)
Date: Wed, 26 Aug 2026 08:21:41 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v12 1/6] arm64: dts: qcom: Add device tree for Nord SoC
 series
Message-ID: <yhnkj6mtv6tdjignuey2dmhssihtoznisklpofrauwv6iblrmr@rmnrr2bjvfm6>
References: <20260826041200.528588-1-shengchao.guo@oss.qualcomm.com>
 <20260826041200.528588-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826041200.528588-2-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: URRf6NIiuF86fve3N2e3BI1hwADJEDfA
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8e77e9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=tDYwhEyV-ROJ_5m0-t4A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA0MyBTYWx0ZWRfXwO1u3p4Aw83o
 lvIj9YcNKaCvAxUe4YOKDrPQN0CMWS3SA/im/tkWS/VmXOtAq84D5Nw6vlReNfAAvqmVqp014wQ
 nl4sMGzsi0JQQvkB+ktAmf5WYGyA4L8=
X-Proofpoint-ORIG-GUID: URRf6NIiuF86fve3N2e3BI1hwADJEDfA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA0MyBTYWx0ZWRfXxYbRwX+vjv8p
 +OTzwk/iAR/+IPzBKa8WNzJdciTZKwYG6DpHd7vggQBC0Kvzwxf8udOvJh0u3GoA+cDGJjRYqsY
 THkWgv0+uu/kwQi+3VA59u4muyxen2OFEza6FXXS5KApkzBAQ4F+hE1bagsRgVA9yM9jj5V4Pzn
 0NlWyFNcwsrd3QfVHNzYw1aamBaROztNUiHXMYlr4YNZpfYCfCY4h8bI9hPXSUeqFQL5N2QVIIA
 QGsAVibVr7E6Tqo3ii1WQ6fOGgLvwUELbID0xJc7Q5i1a2yFasJ0rCN5HNEXpVUZsj6DoeCiOb2
 AaaA6OnfqFFlzWqn5Q9bZW4KqzBgQLOn+zQ9eNPJl164SaFGvNp73iPsR6Uub+Q1Q/LXIw/6HGR
 /+zx+9gseKWYmHt3jBD4rKJoGJv+3w/TUkxUSSHsoNVB8N5CbFFKQeTUyyH97GaDGEMhLyE780y
 KmBhtD1nuZ6Vw8Otp+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260043

On 26-08-26 12:11:55, Shawn Guo wrote:
> Add base device tree include (nord.dtsi) for the Nord SoC series
> describing the core hardware components:
> 
>  - 18 Oryon (qcom,oryon-1-5) cores in three clusters, with PSCI-based
>    power management and CPU/cluster idle states
>  - ARM GICv3 interrupt controller with ITS
>  - TLMM GPIO/pinctrl controller
>  - 8 TSENS thermal sensors with thermal zones
>  - 3 APPS SMMU-500 instances
>  - 3 QUPv3 GENI SE QUP blocks
>  - PDP SCMI channel and mailbox
>  - Watchdog, Crypto, TRNG and TCSR
>  - Reserved memory, CMD-DB and firmware SCM
>  - PSCI and architected timers
> 
> Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
