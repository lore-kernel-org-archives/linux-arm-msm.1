Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DD336F91E
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641314; cv=none; b=RbqhnbEkX+l+TYbx18NHhfQORSe57/3p0wQGXKoskT9yX79QV9QEjWy+emTXsChaAcHYlPUAPrSwafZgsUcC40z3SUW2ZcxrptG7UeUuZzAlsJ/K7ZVXZncQqkzfxGFO7e/JH84DEZaYs3DHWa0Z4nMhTZ9PRtuBlHLRVWi3aoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641314; c=relaxed/simple;
	bh=ds41uiC7oRBQ5NVCa4hz2bePlchziR7UFKhgrYUIkw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uXa1P+pVAWDK08sUNGL1f+IFT/YZ7rkywN54n4Bt3knUZoozkxe1hr7GAhGq/mfweFQWa/EbYTxcPm2F+ibcpiWiJQXy4HQTC2xa9roZOmZD4rlxj1M9FiqCzGwnlJYIBXsJs87eFosMQ4iA7CGl/1prvknlWQB6nY8Viwih1Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FPBpUMMn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YqgJLFij; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FPBpUMMn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YqgJLFij"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMDbX1922935
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jn+bU5PH+vGIOjjifUsUR+qv
	nZnsXNeOzfoYsc6YQUU=; b=FPBpUMMnEp8FmAWETiiMDKk+OxLIHO7oV30zY/V5
	imM+Wg4L7XZgKh5ojwWUJ+l+MS17Iw2La+IPiKKlBOibOuUBZ+tTxByWw0ZFtjPT
	Qrx4yh5hIM/JiG154Y9NRJYtbWzVgqo4BSlydjjSUjOr+dk/qwY0awUewMxtyya7
	a7HTgPdikjfIJ+Mwye/PzkwRQKC0z/U15anMpjjvbFkCMr8eSUGIsjkSrfe8NEyo
	waUb2HmjhUR+Hua8Gcyu+l+i3YbBFSXZW57X2omfCYMEIVg0ll9LQWN4OE+f7RRx
	X+ANxB2QjAOnDN9UUn2rsUUHBlM9uG03e+YOcBsIt5IWoQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj68612xj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:41:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a23afcbso99305731cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784641311; x=1785246111; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jn+bU5PH+vGIOjjifUsUR+qvnZnsXNeOzfoYsc6YQUU=;
        b=YqgJLFijU6ATHAFXnXuI6gIsvHFpHg+5RIUhT178WPmumN7FYq9DfI5nCcZx73nQcM
         cZzX11gga39EOQVS4H2yTWFNXhFJ62sBqZfQ8tJc3g/atLbLQ2sEBJGQB/4gKUPFftl3
         eorzUH5W2fkOohz9DBgbr2iGHZA/HqS54BEF1s0RoqgSsl3sAXra3WwIR6PWsY6QBJVg
         gUHyrELpT3HkJ2sPx0YzzQA+m0SKqPJlMd0gAdtqShaTp2AENqwp9TwCMfMbDtegowjt
         WNdclhUNlhioXmPJVVtV1J1lG0xo0xx6xtpUZe26kVyGBLGYjf9L9daGiQ5623iWfFto
         DqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784641311; x=1785246111;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jn+bU5PH+vGIOjjifUsUR+qvnZnsXNeOzfoYsc6YQUU=;
        b=qh25n80x5x5121KDVQJ81FtA8/lNd8nye+xjRe4Pvxbwa5pfjV7hsVE5Fd7qorK42C
         RcYsvoh0ykUPc3o40cbS8eZRIku8kHbbbOgRJR+xII5kUbaM8TNfHU+wkbdL3C7FIVE/
         MPqd9nw0zccPKkxIUJyWYJS3DWAUDNJb3Z+1g6RWpWvrY0nU8PABew4W8Gs/WW2A7FGt
         2PT8cXwwJ+sI/LudGMnpCZ0iIqtg9OgQ3mI+D7J/I6XYPTUYtiejnJ7+SeVPmDSFyJPX
         sBYM76DbdrwufXyxtCDaob2SLi/ta29uYuPNH6f++2meTWeLOWsO4+xTC/sMt+/GEDnj
         geFg==
X-Forwarded-Encrypted: i=1; AHgh+Rpb1yhJ0HlmB+V9ucyabLkAcoioUqSEgRjdUi82rJbqlE+nXzYx8r9gnpwUCMvpVRofBYYkwqup+dKh7XPy@vger.kernel.org
X-Gm-Message-State: AOJu0YwRNKcqaSwZatZrREDVjBmDnUxEFPEx9S2U6dTfLuIxCxbHmF12
	bWqOFVwOkUVrgH9azaMah4B3mz4VAIxcc8J63tVYH+8GaoGO2JUms/6drw/o3B1KU5ufnCpZi9O
	YssX2DZC/pYJNj02Xi0plIUNK8p4bFppKVU8F6zCOZdMtjk9Am+VqRGLrUOPuUYzyN+rG
X-Gm-Gg: AfdE7cmutQFCLSAjV7J1bHCAlEx6TOzIX8P5GrfX/xRLQVnxEsZYoWtMLpVcA+DsrBI
	NMNeW846D5uENJZYU7tOT8WNz8YnxKhNKJTU4ZpqoIqpZHVyvK5spBtfXnKzHL0cKS3UNr5WSvS
	clSyQ1+OcXcw0zLY506AoqrXwhCVrNRtmKAlYaL5bINCx/RKssYhP4mNT2f4+Zk7AnUdNx60r9F
	w0KIAdYvqyl3HrejpVaeylIS/q9MSVIktrVsQBg5zu7HCCfE7b9SyfBCd7ZPKg/tzfWGURKixma
	TjzqtDvRNfTeT0FfdOSe5TzpYu2QEovBB5eZEJqSZE7q9UQdleUA05srOnUKPklKWj9JXlwsQc6
	c3tJOuD/ogAZx/BlMO/pBN4TGGZvMVslIVe8y98sDuIxHn2Mc8WMZx0Fnd/1lrb8bUsQbk8IzEN
	7y0u9HbwHHRqrHmg==
X-Received: by 2002:a05:622a:480f:b0:51c:439c:babd with SMTP id d75a77b69052e-5213c10a2efmr201273321cf.9.1784641311288;
        Tue, 21 Jul 2026 06:41:51 -0700 (PDT)
X-Received: by 2002:a05:622a:480f:b0:51c:439c:babd with SMTP id d75a77b69052e-5213c10a2efmr201273001cf.9.1784641310855;
        Tue, 21 Jul 2026 06:41:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a5a3475fsm413974e87.58.2026.07.21.06.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:41:49 -0700 (PDT)
Date: Tue, 21 Jul 2026 16:41:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: eliza: Add fallback compatible for
 ADSP remoteproc
Message-ID: <oxiv4b72vh53bmibs5jol5klkpx7zokn4r2l5o4az775nm52lx@pcz4s2w2wxqb>
References: <20260721-dts-qcom-eliza-fix-adsp-binding-v1-0-3a0b03af2ec7@oss.qualcomm.com>
 <20260721-dts-qcom-eliza-fix-adsp-binding-v1-2-3a0b03af2ec7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-dts-qcom-eliza-fix-adsp-binding-v1-2-3a0b03af2ec7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX5c8/ktb2H8i7
 NvIeQkXVjBlcRDbpDSJG0DVOQg73EMdMLTUWZEzVmcv4pZcsNEHTQUTwvy5eBPViu4/ZGY9griO
 HWWZo06x04sKADNUW/G0P7vAQ0JNWHY=
X-Proofpoint-ORIG-GUID: 8MgKzU2_jMtrDxEmRBrQ77yzBACjeg0r
X-Proofpoint-GUID: 8MgKzU2_jMtrDxEmRBrQ77yzBACjeg0r
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a5f771f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=pKSKXMcIEd6FydBdNeAA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX3l4XsFvup+J9
 MVADVw3pUYLaFY3np7uBojePXQmLGDaQtw4+hGZAT3XVCGLgTnjBFwuDX1dBoK8qCO6UKyVqgKp
 OdXfTESuTrUUuXWU+dQj2uRE233+8jYaSLjY8EXpUSjuIad+2iOD2u2DgSCaiw+Wxc6uX973efk
 BbBMIzS1T9NqRMzuX4Sbk7IH5ZIRxnsCqg3xgoDfIkhRrOcXWiF8R8sOtBD7/j/2NYE6mnzVDVR
 z6QNqyCIGXhdOz7f2eZt4f6xncRU1Ijres33x29SNjnPbGkHorBuRgqwiI8B9Z6NnUp1TnzXbTC
 rAEEXoe/u7WShd+fYzldIACp+qmJCRVrz/9/jFZ8qhqjA2CIJGW/dnUaVxAUvGP+EV9ConSW+zj
 YR2z90diwIcRLIbNv/tHhmSOpa6/eWoqXwNb/4GfpF/UzTthLL+kkka5XPJI/LzKcpH0w00codp
 7a2U3YYwS/sgmEtw65Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210144

On Tue, Jul 21, 2026 at 02:35:08PM +0300, Abel Vesa wrote:
> The ADSP found on Eliza SoC is actually fully compatible with the ones
> from SM8750 class. So add the SM8550 compatible as fallback, just like
> the rest from the SM8750 class SoCs.
> 
> Fixes: 88ddafb01ec0 ("arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
