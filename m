Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FB7470EA4
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 09:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256465; cv=none; b=vFcM8RapR5F2erkMLdN0wco++bRsN4oejh6tfNenF4OaoRuhqsn5AHD7Kzp7oLWreMXfLLVcKWJpXaq2PcfgmuAFRVkK6MBrxfLJnUn6hOr4eJ/BUPDZJTwX1kvfzUiwFLqQM0SZ63A1FVzdVdForBlNVyqEnO+otP4WTv2bvhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256465; c=relaxed/simple;
	bh=4afiGkcNEeX8WmPB9DJBvWqvGi65/MUDjG1PvDWjfHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q3L1ecTPIcO10MzSgZW5kLJulP819xMjaJSSFjaOWdtfl8r6CDNJZ6r7pDHcKxNoCwWAbkkQcGKy7GklZ6vFJLmdpbrFc/LaShlbimbaNQ13+EeqExZrAG346uMjfiEwGokDtGRgdAhNCMDMQ9fmja/oftKzil9Ro+Ed6jahC8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJfeO3cE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=biVow5vX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nJfeO3cE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="biVow5vX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68178nck2973828
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 09:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6UPDyURVG0qLypFDxekoTlpl+By1uFOwQ76rrcLT+Bs=; b=nJfeO3cEXlUVIPo0
	Jy+RmnXZsLvVBfCvabNofn2k3E3Pq8bkzJNvFBzeJ9pjhrrIcZnyPL3SXqc40UqX
	9d50f8REiLc/zmV3xwrYCgiE9Rmvl75Ahtrky6OaqVObCwbqaT0y6B/uG8Ti1nFA
	k+BioNg/xmir0clteotYFL9wQl4FFwOdBggZqS917IDM6bfQ97WxauGSpYNKF7Um
	E9HOzXMyjaT8jkC4jRzYqEhW0FLa1vLOw/owjWkRbP4zvv3RzoEZOhxvU9q0bi+8
	hLhbl/5azFA4ocsAXmR07LZtTbR2yAQzDJn6iT2GttB+T4r4VOvc8pd8N9LvMXEh
	PpaicQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdsnu0u9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 09:54:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9349ba88188so117746985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 02:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788256462; x=1788861262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6UPDyURVG0qLypFDxekoTlpl+By1uFOwQ76rrcLT+Bs=;
        b=biVow5vXVa5rz4615xfOjqlCnGyf6YlekUUf+sdO6S603ut0HktFECSDQOZSnGxHE3
         sFgoq7VbtKir/rxMBnaXBTablyM3KuH2omIy7pW8QKuFj1yOHf6LPwJwrTD2vMn/j0+C
         KrdzzbOBhYGS8BapeS0Oi3jtPwzm+Hw68G0Ky30yFNFA5Bs60UoEjw1WBehj1381TEst
         P0HPUSz0XnO2UBzAtFmd9eoQ3VAwSDBv5S2+30zyOTYNSRcVAsSJWblyf0ktb4RzMNsj
         Sbf8Ci5cnh0dtFNBgHHghe+WIQlTfcsPtayQTFMnwnNzuDIj7UIEP/LAJ/76ldv+utyf
         Kd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256462; x=1788861262;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6UPDyURVG0qLypFDxekoTlpl+By1uFOwQ76rrcLT+Bs=;
        b=Xes9qzcABOUjWhsBnv83CdO+34DnvOLtqklT/7FEjISkIYYP58mulaCSrXo1e4uLFa
         kRzqIzKzpmIx+kpbmvQqCrEP69iewYerpJpjlwcjqD257NXuHOp8F/e6OzNiCkiFvpnb
         rkol5icLYpgDVItGbVM1sH4pNAT85egfcz33I0mgkfSfZ6rTq+BvU0wuthhUgo1tIVgB
         eH/fOgTjhdMjWcWO6DuYCiavX+KjLv/fdQBXTOy7Mx1Yq1I+HBgK6zNqf5YexIcAswWU
         /NGYedYyeHZNScu+tf2vBKdGXqxjz6xF/+FMXiu7cX0V8E1t015yO5D2bNjD3fnGpd+6
         r0Ug==
X-Forwarded-Encrypted: i=1; AHgh+RpVBZnRlEstlrM58S8kJOI5LDPKnMMk1ZNUCgEgYJPIhe7in8IchcsDGeAA1MNUaqm+C9gUQaigvCQK7wz6@vger.kernel.org
X-Gm-Message-State: AFuF++lmjiEqvCBEgbUxDsgZmCoSmicSjO+hpPontqO2kagfMduk89kw
	mCdz2L7crMf+dTSYa8kwj0hXIi3KtWI7skEtxiEqgNbEW2KwrMTiYttkALHraQGl//zjCmy/x+U
	+mNWcWjyy4qJ15o1PSckw670/mWS5FON237PYDoSP/d9VewAxoR3HSDiy0bbXDdLl+g3LTkKdbp
	uX
X-Gm-Gg: AR+sD12eKKViIovajYsb6/W2Dz3QzXd7XC9lpY9EphcUfe9urz8yfaRjxCrZRY1z/ku
	YUMnKFiPPVOmXjVoHRiLDSLnc7Yqi6l3prYIUKPRHZ2A8CiQdvKxB21yst7+jYo/yoCPFbjbgR4
	ko+cjn/Q0WfZg8s+owxqvm8OYNWyHy7Miusma6d9wjwMGd1omGEg/FFtyToHN2SjzbJQ93uQbIc
	dNLOg0Fr0Hq3vd3cwi8kkocoju+Yjrqs15cFLAgdLYs0Pyongxat4XGKjQwg4l+4hQUH3g+Nle3
	1XV8DMmK6a3QRGNNzje7f0sNORUqGDTWY4sHKCfactbI5DxgnuzSc2oIWv2bJftq51ZBOtA5ySx
	CBS01pWQEThialIcJ3G9yYw==
X-Received: by 2002:a05:620a:280b:b0:939:2884:e11 with SMTP id af79cd13be357-9392884109cmr1442798285a.5.1788256462574;
        Tue, 01 Sep 2026 02:54:22 -0700 (PDT)
X-Received: by 2002:a05:620a:280b:b0:939:2884:e11 with SMTP id af79cd13be357-9392884109cmr1442793985a.5.1788256461852;
        Tue, 01 Sep 2026 02:54:21 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1facbcsm546460666b.44.2026.09.01.02.54.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 02:54:21 -0700 (PDT)
Message-ID: <f6f632b9-cc2a-4966-a43b-c474a05da7ca@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 11:54:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] phy: qcom: ipq4019-usb: Propagate reset operation
 failures
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
        Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260828091857.8581-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828091857.8581-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX/K2o7ZawwXQA
 znKTbKRPRUtWBn3MQWA14ltuAdkKoUrQxCA3DU1c979+r9ZqZLLfyUNBHwN1sNi4A1LsOGl4syN
 J9TpdOPyZGBC4xQgNtl3dzLwKHIUbH6ZKzLntLgEaANh2+6ZDqLCqqKZxYIhj8cn7kjcjGNwRsO
 QYWUAD4Dhamh8W75RZGmWVwE6qhVqzqKWrMSmU4yL+Du5y3VaKePQ4IZ9dVgedURRSukTvcSuuo
 slTOl+LBu1LBbErzi7+ZY4a3iIgflNUH0BK8zhTaPI8VBn0yvaX7lSw0ISeiY4/jY6mhAj+sHYC
 GQjRZ+kYHfruAIXkS9IXPB7dFFMB7PIHZtu1OEnZSQmk30v4aeeibOn8UCxxRCJn5KPVTJU7nIu
 sd9RsHJlZfz2WcxNOfhlCiZ+ExQyeho5y81ToWYSdiBgVDfDOsWaEFSm8irLz55JwtvX0GK/D/j
 TWw2dwlDsbvmFplYegg==
X-Authority-Analysis: v=2.4 cv=L6ItheT8 c=1 sm=1 tr=0 ts=6a96a0cf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=YGK_NnCJ5jihIqQlHZYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX6zPNUUwpaJXC
 zu8ZRwNSa6dXkec7NFqG5P46W1lrkwSH/vRVzRu44x+YKXU2V//9IipOUs5tdXYfdmmWT68nR5P
 tJnPWMXNO2wh0L+11ftpWzpP2alyn6M=
X-Proofpoint-ORIG-GUID: KeLgJOez_xqJ_bWESQztIy0ybLWZXVxC
X-Proofpoint-GUID: KeLgJOez_xqJ_bWESQztIy0ybLWZXVxC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010087

On 8/28/26 11:18 AM, Pengpeng Hou wrote:
> The IPQ4019 USB PHY power operations ignore reset assertion and
> deassertion failures.  Their callers can therefore publish a PHY power
> transition after the reset controller rejected part of it.
> 
> Propagate each reset error and restore the reset that was changed
> earlier in the same HS transition where possible.  This is an RFC
> because a failed reset operation can leave hardware state uncertain;
> feedback is requested on whether the proposed best-effort rollback
> matches these PHYs.

[...]

> 
> The issue was identified via static analysis and manually reviewed.
> 
> Assisted-by: LLM
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c | 46 ++++++++++++++++-----
>  1 file changed, 36 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
> index da6f290af722..8c1834cd6a8e 100644
> --- a/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
> +++ b/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
> @@ -30,7 +30,12 @@ static int ipq4019_ss_phy_power_off(struct phy *_phy)
>  {
>  	struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
>  
> -	reset_control_assert(phy->por_rst);
> +	int ret;

Please don't leave the blank lines above 'int ret'

[...]

> @@ -69,14 +86,23 @@ static int ipq4019_hs_phy_power_on(struct phy *_phy)
>  {
>  	struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
>  
> -	ipq4019_hs_phy_power_off(_phy);
> +	int ret;
> +
> +	ret = ipq4019_hs_phy_power_off(_phy);
> +	if (ret)
> +		return ret;
> +
> +	ret = reset_control_deassert(phy->srif_rst);
> +	if (ret)
> +		return ret;
>  
> -	reset_control_deassert(phy->srif_rst);
>  	msleep(10);
>  
> -	reset_control_deassert(phy->por_rst);
> +	ret = reset_control_deassert(phy->por_rst);
> +	if (ret)
> +		reset_control_assert(phy->srif_rst);

This return value is silently ignored

Konrad
