Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723183BE62A
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 15:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786463701; cv=none; b=qlSWkwnR98YRuGx2AeuMED80WlI6jet9/qWV1A5OzbVNAFCkrRPqhJf5NY0abyFKa+sVQnog4S5FEgwu6scYbYoAQ43WVdQKo/St95sCwtlkH9/Ii8gMtV3SraBQJimT+coJCNkF7dH8lTBcZpri6A6ZTAA+yoLeSfb4Lfqm5/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786463701; c=relaxed/simple;
	bh=vf+m5sw/ANemO4K+knJtXSozx+wu+IX4qR7hnuZNagU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s8lcjhTSJMpy33nqu3Pm3VxFJK4zL9DjB5zvaZpdE3M+g5bP4ilDPqyA1SUhYS1KQpj8Cb+VTTSswoLm6s1lXBR0tClEjZouLmUSYH/6cf2LX2bt6d/nDAqbe/QvDGE3GwdP2dMokZmARoNG1taP78s4xkPq3Ie9cRG8gNA86bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NWA15m//; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ictC6cF7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NWA15m//";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ictC6cF7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDX5VP766960
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 15:54:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=elZexqokhT78t/wR21U8SVTp
	ZpqnywJTXTccn9S+dUc=; b=NWA15m//FCm2zFi8wN1WbuvtYEB/h4RaFLL668Yn
	9h51SPzlzcWzwuDgNmyI4UrtQtfCUTaZS2wcRow3vACE2CO9ihy+UreGjA/OoRmo
	1JYFeefZs+lr0U+zX8YCeAX6A/VdWty3OH23sdRQi0DCmE/FiC8TlnlZmEPw7fz1
	1AsY/OvfcX1Rbv78XSiIFyEt5KyFtebmJFZjQtsgi+k+pAYJYjdS1UKXrmKbpLFA
	UNPPy93/AFJUz0mNMsZFVJq/SHcF5ZUowIj8FS+WBijQiozCC4Ae0tQ7lBJwyoCy
	ofMy38OfXGAWZPiCxkjC1ZbRaxsIRrNFJIepGiopaxctNA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01nc1bph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 15:54:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c12e43b98so680981cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 08:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786463697; x=1787068497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=elZexqokhT78t/wR21U8SVTpZpqnywJTXTccn9S+dUc=;
        b=ictC6cF7PUZzxxZzI07Fir4T0Ij9Ll1VzEBiRZBimy+qQCLbFAIz8co2ZX2RtJyNL+
         x8osbaCOZGWjOkEBXV98eV+qqp55a1ZigzXUGSo+woDxf+P0j9jm1Xh3O4fIOip+NzOV
         FC5AlGSxGJGehWnNTTOR3EDgLy+m/TMUxOIn99pAnLnesWx5iLSvNombYUg2X/BkiyAR
         JuAwjS0YPO4PQkeI7/x3Wjr1Liz4U6SNmiPjr7yJ31JIxpXfk1qiqtaGb9dbjDvXQQrK
         YQ2GMX3kxanw2ggoSipun/8FBUGzz2GiSnw3yE6WzuVeiImP0wIxx752aEWGvopV49rR
         c9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786463697; x=1787068497;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=elZexqokhT78t/wR21U8SVTpZpqnywJTXTccn9S+dUc=;
        b=JGrGu9HMFln3e4slqlO0Ib/ghWIa6YUPvsB327ac+GhRsCNL0vY1euAaBn+rkbDjbP
         oz9hX6+Udsu9A5FoibdFvRZU/S+YFRg3UBRCnTnW2/iTOfuwTJHNVUIUSTpZD7zFgiYS
         ycwO5PzEzMxHpC2WbcKqI49vhEeAZ7UtNBCtnEWc4JmBLyq5eA2f5a78AtgFTwD8aSnR
         IdpGCZAi1IisB5lymUwXuQEiZvpr78U2yz7s/BM52ikmllAqFqgwQY3V2UdlS9cjDLES
         RYx6TA5upVCoGfrgHxRMe59cOfTMYTT3J5vA8fjsWLancnq+ib/sR0R5vQltLhPTmViZ
         jDFg==
X-Forwarded-Encrypted: i=1; AHgh+RrNQzF35L6GWoxmTnoBtSy6KPJlzx6TZu2Oe6yjxqy5i0TLC+NLVwLDMZx8HHNkcfyVCdPquGPuSb+d+fMA@vger.kernel.org
X-Gm-Message-State: AOJu0YyhTT247edynP33DSp74m/1xXXZXigdnv0rgXQhdbEA4mph7GoD
	+zJVHDTh157k9tREEjFS23pTs//TFEjR/Mj4NN844wz2WIncIcd0cA/wMgojej4Oe9MjdavS6/f
	+q4Q9DdGsFRneXcXEsExv0Onhrml6w46mcVgQYOVJeQr7RXxlFUKb73nepTMnswskuqQseeMCt4
	gR
X-Gm-Gg: AR+sD11DC2K7gT4fUjw07TC2yI96kPi2tOru/E3nBINBd2HLKLyiiwqdftH77I7b7EX
	jhJ9RBQnD+rnq9mW+0k4v77sXOplQ1tFvGr4lgm+9C+eSpWka8G1ocxDlGyw7Vte21prY09TJVo
	IVtXbTHRuHoOmLV76JvfvHDe3FgQHLiUhpzFatmqoal0RAuV9fe3PqRC+JPOJfjP5f9+eRSQIQJ
	HBy+glQVml1z1wuXCZANz+nXe6Rb4vdpcwvtoWIW3oreIdm5yfAT16b0omFUCgn9QXhZD1ZaiHV
	duWeTHBow+nAe+RpYDPuM65uFFMJQZzUQ1oJIc7JqITvk+Pulhw23AacFEg95Nfkl/3YT/z0mqL
	5CT9A9wgyCHg4q7PgLsS/Y/fYvv+7Ah47t0ShQ9MXmhPToqHMBeAsgigDtyoSJoGONxV8MIcF02
	OzkE1UqkpIAYMMQA==
X-Received: by 2002:a05:622a:c18:b0:51c:9b44:c59e with SMTP id d75a77b69052e-52d601ec272mr14763121cf.22.1786463696618;
        Tue, 11 Aug 2026 08:54:56 -0700 (PDT)
X-Received: by 2002:a05:622a:c18:b0:51c:9b44:c59e with SMTP id d75a77b69052e-52d601ec272mr14762571cf.22.1786463696133;
        Tue, 11 Aug 2026 08:54:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a0fa5bc0ccsm3355571fa.21.2026.08.11.08.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:54:55 -0700 (PDT)
Date: Tue, 11 Aug 2026 18:54:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: Enable USB controllers on
 Shikra platforms
Message-ID: <vk5crofplsqmkpit4xtqiahnsunklvxzix5c53wxxnogh2ix3w@65o55mcnekwb>
References: <20260811-usb-shikra-v7-v7-0-753e928f37ae@oss.qualcomm.com>
 <20260811-usb-shikra-v7-v7-2-753e928f37ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811-usb-shikra-v7-v7-2-753e928f37ae@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEzMyBTYWx0ZWRfXxV12xiBatWSl
 M/RLLqjXQS4BD5uuMgryQiMsf6K/JommUKzbbSCYXHSFcoAhfQp00oMm4VXHSiMpoXRdhFUx6sr
 mdFakv58pH4P2u1sE5sx6TAiIhut4FI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEzMyBTYWx0ZWRfX3bfFLwFroY0L
 l9HSlI4DBVTaNQMe555+XsotLLcK/88w8XXU6SyygcymErK2cnX0a+Q5RU8ne1iZ1t3XvnNkALl
 JuobbJXo5lmul86NsLMpC0dcv83T0Rpi5AxArvHBBZa/zYAeKBdpMIyB9igvA8DmMejRnu6D8oX
 XKQegkoFLujPaujeChiKa1aQ8mNPj6ZhRPmIEy1ki+MEXbFuQM67MVNQapiUkv3FeFaC9XWAEUc
 t5oTK8jfGZ7xbAelR0pRfR+CVyseT/8ndILU+xZ2nmmhtWVeOaOSMfgNKJmr4xvkGVwm2o5oy5k
 LbRlf/CnUypqY7+nsKqhCbaIgGN+9c6psFm5zVINwJ89oSMT2Nub+YeawOEQcccqEAXqsJxQGvx
 TE/bnfuirCltMqvnetnG1KE6zrcU3oS0fQ3fOZrvVVsUIfNeTMAfwMtLo2yIDdyG/rH34D0k3cE
 +A79AbF83JCYe2s4k8Q==
X-Authority-Analysis: v=2.4 cv=RY6gzVtv c=1 sm=1 tr=0 ts=6a7b45d3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=mkWA_SVPRw4YtxPa1GcA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: m2ZETWFPerATOj_E8CUIeunag-qq9d4M
X-Proofpoint-GUID: m2ZETWFPerATOj_E8CUIeunag-qq9d4M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110133

On Tue, Aug 11, 2026 at 04:29:08PM +0530, Krishna Kurapati wrote:
> On Shikra CQS/CQM  platforms, usb-role-switch is handled by PM4125 on
> primary Type-C port and Cypress PD controller CYPD6129 on second Type-C
> port. On Shikra IQS platform, usb-role-switch is handled by Cypress PD
> controller CYPD6129 on both Type-C ports.
> 
> Since those changes are not yet present, enabling both USB controllers
> in device mode.
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 23 +++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 23 +++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 12 ++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 23 +++++++++++++++++++++++
>  4 files changed, 81 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
