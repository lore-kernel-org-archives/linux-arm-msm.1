Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC1839E6CD
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 08:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790755798; cv=none; b=CJEdWIWbmKIfO6MQUewVuaObzu0bNBjYtayp1PuYxiODZBZnWYLyqBf2QiBUJfWryeWauW2hwk9XdXP4iRnQZqw0hvJEjkOhLaubVHB/p3+zeF6HraK8WBJEN+HquBffUBVQcycZLxVmU/I45hqccJzWKejlnlb+0s7GeIsZ3Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790755798; c=relaxed/simple;
	bh=vBd80ETfLcFFXqGoGb7udPCzwY0bSmTURW5OMWDvbpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a6nNtvvCek45nJsaPIyMX5q+D4POny4OQDr0+V4teyatJ6+AgeyiUh6+ZzCj3u95jGFHHz+JBQHBB8c97E776BoV0X8Lqi34kLzmi2SdVYxMps7er3QAbGa7cDS9NpLbFqH8EStHF1qTgOd3Lv41kuDlNJl+NW5Nw2DG9hauoOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hiTczt+Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iL87P3M8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hiTczt+Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iL87P3M8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dXMp2667046
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 08:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	StfWU5Pc0lPpSLan0imL9WTqO7hrmam8Bvlpeq16QqA=; b=hiTczt+QL84s81SW
	TSk2vNGmZpEVDN9Ta9A1dSmbbaoHIwB+3rDnngY0yniDaItvwsPbJbi9qpGJys04
	YFS+x7AH9LlbdwtLnLYnC3qxyLcHXuzopu+3hukQdAGoYxssRLtNbmk8T5+VUkjW
	esG3nR1TmmlDA/BmmFkUkNk48q3PA8MTBdrSFrnf/2Wdeo/ksBeUcERfgJNwzqn9
	QZ9sXOzAYM8i/ektU5Gs031hlWbUbuJUTJ6mXoG30u7U8JsVOMRKCuryx3m75ExM
	WxfzuTv7t9Ch+/Gi6JARf+J/J+n8GcMPk0WByrUtylKKKh6mj2smK1ltNbAZVx9q
	q6nWWg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x27g6ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 08:09:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-530cd3dff25so7997161cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 01:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790755795; x=1791360595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=StfWU5Pc0lPpSLan0imL9WTqO7hrmam8Bvlpeq16QqA=;
        b=iL87P3M83mUZZqMluirls43x2V59PY3yrTkFgtlV+6oiWA377fuHJctQGKpYprsay4
         fWsD5AqTyevEhUUN9Mk301QNHnc4EKCbWBD5fnOaKtsvGiw/pFSK9UNNoiCPiRlSRMaK
         Kl6QqcibbDUWqs7/3R/Cy7dzY7Td+oufrVj+0ElBjoppA+nwHOVG6gFKYPG223C9QrWt
         cQ1qHrf55VRp18L2WuIh1lcly7KT0gNadZBYjS8MeLd50fEp9HbE9kf5oRSAPVJKwtvm
         UPa2l0b3FjW7ol8cNpKDLyMI5dBDNdoZv456XRJtaTO8L63uh01Mnzseg1UjcP+/6rwB
         9rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790755795; x=1791360595;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=StfWU5Pc0lPpSLan0imL9WTqO7hrmam8Bvlpeq16QqA=;
        b=2WzyZ5jxzMrWzefHWXDQX2g+ibZY+pwACnU/KnQ4QgSGB8AmLv+RMCmKlox2mKakh+
         GZgKHFuIlDzl8RGo77benZW8ma3QNOdjcU3sxlsbu+ZnDRIwoDwUr8nq2USzdIWiXGXP
         Ssb2zBc5ma3px98apvn5ujb2uiCfiVd5AozGMa7RhfUJflRupdPHGij2vJoa4NhSKBYm
         C3JAQDO2Ovvm29l2EUVVcvG/tdiWtfOLAQnBxTE7TwwIG0ptB96WOjnUYmbOv9FOJx/s
         AYnaF6P8+r6YmYpSdH2Z3yFYm0Py2cLn0iEwDVP7rJrXKOsKJqoc1bof6E0q0Mf972Uq
         udvg==
X-Gm-Message-State: AFuF++kcP9TrvCf/GBJn6iixkChF4Kok4LAd07Cm/zBME3wc8Ux+id/2
	Ab4ZQkwsCcTKpZqUDVHrgQamNVATW3a4uMWeNMOY4shDRPRulHGzle/SSMcCS2TZnJgsrLBtC8R
	kG82R7g1RPduj17dCtDcBpjUWVTGhWPOawc7vH0wE2dLuN/4gBDA4M48WVnForGckLF1y
X-Gm-Gg: AYBFou2CEkjX3pY8lsBK2nYURzRa9P9vs5gf1Y+tt9fwSWbqmufhQ6ra5jCtssEX+CW
	I6BcTiXfipUxYdrC6xVmDtoSZ4L2XkKVisQaHJl8Xfmx0qtDI0glbDs4vtjRsUfXyy47r0WEEc1
	BBl5XKIkB/7gr+hvktxZVphotyrd2KYaxPZHXkDO+gRDUNxa4MYY6UTR2boMmFIPv/TRsSQ/Yik
	ot8IZlzSzOO7Vh7BUFVJGQu2NjsKNS/jI8EO78AF0K8i1+jpk1FUmJqAfrnDIu/kqRhrfswuJXk
	iIRwawnnVdhzv/4K+BDPcMKueJWDPM9D++xlcv7e3ZkxcKAs9FgIsf3l/dPI0tF1PgLe9Z98s3n
	HJli30e/akpGVQq/bvqcCFg==
X-Received: by 2002:a05:620a:700a:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ca97d148cmr84678985a.6.1790755795565;
        Wed, 30 Sep 2026 01:09:55 -0700 (PDT)
X-Received: by 2002:a05:620a:700a:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ca97d148cmr84676185a.6.1790755795118;
        Wed, 30 Sep 2026 01:09:55 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae047e9b38sm465136a12.3.2026.09.30.01.09.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 01:09:54 -0700 (PDT)
Message-ID: <00f06039-3b07-4c3a-874f-415b836976b9@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 10:09:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: geni-se: Drop unused icc_ddr parameter from
 geni_icc_get()
To: Somesh Dey <somesh.dey@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260930-icc-ddr-param-remove-v1-1-61223714c9bc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260930-icc-ddr-param-remove-v1-1-61223714c9bc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzMiBTYWx0ZWRfX1/04Kljz+w/6
 G2suKQ+SHL2eL7lIPluhsnaKQz/wTHtzRyNik9fj4HAks7IlOkYPF5RpRZcOufidTQ1JVTvPg9C
 XU4LIbnVybusoe2w3/P0K/vIe+BwgoE=
X-Proofpoint-GUID: NS139uIru464vMQYHQhyKG1a4cCH6r8e
X-Authority-Analysis: v=2.4 cv=W9GtxhWk c=1 sm=1 tr=0 ts=6abcc3d4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=MFSh-5WjxefZ8lS1Z5gA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzMiBTYWx0ZWRfX9YXyql0PYmIL
 sDlj4GNHlZVNTrQTkbiJuhhs5Ov6FCD7M+MuoiPYF4bsH+0qs9AIUqXnGdIVGEekRPDqwS9TZ2j
 cBHHQxDBnPgluAj9WwXsUdFQi0nz0cgy5+pludifM5z0CwbuEOZHm3cLrlEORqmLuZBsgPlYbpY
 v5fRBMjax/8Iw2rd5Oml7d0oSTouxL+FfGPKwUTFjZpCYIIMIuKCYz0F4IhyYvReFgdnXNDgGvp
 Aa8J7dyQ0u6nOfazhs3CmzASk8iKNsnP3/kvvrR6cADI8aQMxc8YlUXgUpTJcun6Z2KPiZGb+4t
 gTGoVti2XvZhd0FYI1N7T8aKb7wUkwxwQ1Von3yhgs1FW2RtROXmfp/s3ffNnVisQVisI0HoNtt
 oPeCRUpnRkDgD8C4P2kBG+BkOcHmVSQoKnBwDHqqTksp7X1Sl9OgTVHXMd4gfzWe249EII6Sfr/
 sPS6oSLRfMIkLqPDRPw==
X-Proofpoint-ORIG-GUID: NS139uIru464vMQYHQhyKG1a4cCH6r8e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300032

On 9/30/26 10:01 AM, Somesh Dey wrote:
> geni_icc_get() takes an icc_ddr string argument but never uses it: the
> DDR interconnect path is looked up with the "qup-memory" string literal
> directly, and the sole caller passes that same literal. The parameter
> carries no information.
> 
> Drop the icc_ddr parameter and update the prototype and call site
> accordingly.
> 
> Signed-off-by: Somesh Dey <somesh.dey@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
