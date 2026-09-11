Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CE6493648
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141649; cv=none; b=LDJNh9tU/EobcW3x+uADxQxxYJTlUpIMBuCptA0M2Q6Ph914sU2Nfj6LtPTuXZZd0qW++oqmuCWkLc1t0gVeD2j25/x4kag01KhfVmJwmVwcUA15v/D6E1lF9I8i7TN4AJ4RIyipWeaocS27TB2UKRVih1uuPe/QzPCbXmos+x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141649; c=relaxed/simple;
	bh=jQOKo/0EcaLTKkAlP93GOK9T1NRbX2+OwvLKoZ940lg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kZhwBRumim4w4PEb3T4MGOspYt6xFAe5yDa3aOyxPOIB12Yzw9L8Ej87it/fVJoQ8V61QxAwq20WmUDtht5AV/wjWrhV8JNvLaHE6Mfp5ffLs4Ah0sJfB8PSSXiiYZLLz4J5QYApfGPYY2MDjFr0+qGnRMOub8dsWaMyXN10M1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nIxyRhZe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDnpNvd7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nIxyRhZe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDnpNvd7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmAV1222596
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tAP4G/5H0Hyu01kOmdgc+EaLrKXNW6ITWSH6r5rO1zQ=; b=nIxyRhZehWMkVrXR
	2GaPdMAHZP7A+k0lBwJrtHhG5VfwXwjxPDe3WJ2RtymndrVQSgeaQ/djVThV4h0A
	DEvBMiNqn7x9jY6lTt8G+u/kvyA/U1zG/X2J8kyGjf1f+wOVflZYvh2BPcKC0SGm
	9HMaXNYZURecS5Z0PXMHnGPQkiWbyHwmsNZ/QZ31Kw0GHBMzphG+fZMJnFcmWmTg
	rN4m96B6FO/fZ/5jAzxOms9UJ32YnzCYYW8WxUNuPL8BAOhYT2gZ4Lx70SrNuXkx
	rlz8hE1HWYftk6GDuKOnUY5FAOMwn6P1ZXhnMBAutEcPCQrrIlTMQYyouNRHLRM+
	jQ0qVg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdrahfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:47:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939eb754904so14583485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 08:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141645; x=1789746445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tAP4G/5H0Hyu01kOmdgc+EaLrKXNW6ITWSH6r5rO1zQ=;
        b=dDnpNvd77J+53Hdfra4cOIgRbgipGsvF87uzEJxRq0f+Cy0DD0MIgVMrTIYcsmNS/z
         FQ8xAF9Wly4UcnHCmwB4Ub4KrF5k+GsuPZ2aOeopFV2d/C9Zjh19VZOSKhVT7kEXaR3u
         inTAp2Ui3KPyQB6O/h+6QVEQcPwITyslWn0aoZNrgk4B74r4dyehv/Lc8INf3xZInNe2
         iJo3cwgKH3rSI6EkRLFznEMlwgRpu3nflfpqNZPvZYzqFMLyKaifJeV1ogHT1lTkoz68
         ipcgLHEKH/Dx22gtd3YK9jTWkEIGDIqbVu2oo7UQF7Pmz228f9o0NgKjFbUM8PrLNSyp
         wocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141645; x=1789746445;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAP4G/5H0Hyu01kOmdgc+EaLrKXNW6ITWSH6r5rO1zQ=;
        b=IH6ikShALrE3Km9vwEcyR7v1wzCn1KBMYV74pEfEoU25pfOTbS3teW95JiWvXMSuXY
         sEy+cwxkqqMM0d+3vvCXlWmteEpFgRE1iaHi+PmcRI+BtdBRL8a0VNUhQ+EcFlFBFe2U
         dYjZii4TL/FF2Rdx+az4YXfFvmqz4eYzUZyvPlVMcB5mVyK0Dv9KKntf9FFgwD6F69ax
         VYSNqra3ycUeeagiL1ZokPv7uusnmb3kQRSM4TpLh3bArYVhyDA0TEuBVrpeuh9fFjRd
         8LAg8OEHkzKBcmht1ZknhpecE5gdC6Tvb4FvfgQxXbQmFvkCWk0ZSdI7VaHxsPUgzQsS
         DERw==
X-Gm-Message-State: AFuF++m0SdPdaUEps4exw8ncbnfr8U582p1PKP0jfYn3y5Jweb7sNJVw
	Qrw1tVr2zyfbQEKCjHtwpsVsoCaFOcSvJno/0MMtb0Gf5XcMykVdIZntbPpYJTNeK5GV/hklu5r
	RU0XTnUpTXoFi/SLF2XRZ/WWphR3FCgoTleGhfadlg1xFtqTrOSSoXcYwAClD5a+I29PZ
X-Gm-Gg: AYBFou0J9KO3q3ZZ1rCPOSsRO1JSTQVfuAsrIvzce1mWokkpos6BGAjt/Qj09gAfgZu
	JJEHYdtf4LJ6lQ2fS1P5iVP9Y1fKUXSlZaFpKsRdKSVZ0ai8wjPxNGaPdoe1tgWdHw0qaJvZ/S7
	EV17yVZJtg/+ODVpSfwNp6pje/WQ9m+uK5d9usy3W0/Zg9N/kvwGMxBjWT4Ej1z+NBvF1Hgxs6F
	EcZXYJ6iMcnDXBzxnc6fIzbviT0QczQb+Pdh/eBzkhFpdzxOyD6GHNNFEzmtV0qag9p5nXd1C/i
	T36Rg4yYscQtiTmd4s7dPvxKVohSBlYG+WzDoeZYPOZlB4q78h0izyQNgJuP09L81FFcsTjsvYF
	jMpZ8na71zg+NiPLi5ULRZA==
X-Received: by 2002:a05:620a:260f:b0:939:7e96:d296 with SMTP id af79cd13be357-939e9e707abmr563651285a.1.1789141645443;
        Fri, 11 Sep 2026 08:47:25 -0700 (PDT)
X-Received: by 2002:a05:620a:260f:b0:939:7e96:d296 with SMTP id af79cd13be357-939e9e707abmr563647685a.1.1789141644963;
        Fri, 11 Sep 2026 08:47:24 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5912644sm984557a12.11.2026.09.11.08.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 08:47:24 -0700 (PDT)
Message-ID: <fa4c12eb-2b46-427d-bc47-a55e10e963c1@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:47:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] drm/msm/hdmi_phy: Cleanup after
 msm_hdmi_phy_resource_enable() failure
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable@vger.kernel.org
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
 <20260911-drm-msm-hdmi-fixes-before-eliza-v4-1-87bdb9f1987f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-1-87bdb9f1987f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cmhvG6XBifcTAw8-0uVz96W_yZVzUlyI
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa4228e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5N7f0bWkOQp0pCbeU4sA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: cmhvG6XBifcTAw8-0uVz96W_yZVzUlyI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIyMCBTYWx0ZWRfXzfnrdr/3e6sa
 B1Zi3+/dPy2KPoph9BoeCZqFNnuLU0WsdVgaCsjm00MxsK/fU3lWkKHI8JcNsssnAqxb/Oq7McU
 Y8c4FApG4t7kccxSsL2yz9Gpg7aQJoo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIyMCBTYWx0ZWRfX+cNfe/R6+DAk
 b6R3y7r6d6YOtC/Ju72O7rd//Ltl1LYe1KwMVHTSNXUsdWp0D82a/e0Wlj/kAHUIWbxyFFvx8Wx
 XHO8OwdwiyoYUp3mrEA/XhKTohxtFdzW08zPsQNQjOy7+xrxvmvc+flGOFHMyVTaaaRM1GLWLNu
 BkDHiuU38f0eExOlBWobmrBJ0SSgf82M+Vq5QGa4bXi8dV5igL1VlPhizYHC48LBIfi40ZccyhD
 ZENBsvx0WbrpLXYoX6daxigSqFkHgIOpE33eI2V1amfgNpBgfFkMw5LcCwfqNKOg9PLTdUfnH8e
 dUQLMUawuys4cA7rKh+c8ZsvUhRCZngxoFpYHBX7+5RdWQw9IRh4pkplIeGjS0Rr9UD+QhmTBnv
 dDU7crAnesT1oNA6K44WP0DclgrXaiRuxMyCcV7e0nVq+wKXMoZN9BPQhxrxN4kSIt/nntm+xcx
 lKajBtY7U7nMrEfMwfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110220

On 9/11/26 12:29 PM, Krzysztof Kozlowski wrote:
> If msm_hdmi_phy_resource_enable() fails, e.g. when enabling regulators,
> it should reverse the state of things already changed.
> msm_hdmi_phy_resource_enable() is used also in probe path, thus such
> failure, which could be simple deferred probe, would leave these
> resources permanently enabled for the rest of the runtime.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 15b4a4523859 ("drm/msm/hdmi: Create a separate HDMI PHY driver")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
