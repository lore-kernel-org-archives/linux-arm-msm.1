Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8077A448D16
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 11:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917808; cv=none; b=ZMeAnptWcpBllJzFrSrrC0mPjT0ohkEt62QxBiPKRHWaffZFZH0JCx1i0lHmEyTZ1AkxnMQaUnD40+1yqBA9YTsTJ3piVpFz+7DRd+T8UEOkBTZNYrykHf1txvC37yx+/ssCGr4rDPxf3il/QcoE1u2u+7GyxIf2YzEvHuquyVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917808; c=relaxed/simple;
	bh=OPMKygoceZMDJyOGH20lQgoZZX+2mPTA8duNWRXxNLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CaBeQnqNWRwLkQ7IECQHcZgUk+kfgbJlvO5EQs2LgdUbiBtgCMfWGhLsKMI/od+lD4KSsJe7m2O5SniQgJwCoUfhhdCLfqvfC+mJ21r3COIi2k0Y1XxrCDhy1+ithBOS6mL+z2FOxaIURtagkKdENSTQ5Svu9zIVkuyk7rS1Wmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JhEsOIRO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O1P6lxAC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JhEsOIRO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O1P6lxAC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA88TK2596139
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 11:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zkscxSeQA75G5CVLELcqbbwuEp11lW2ijBGhi/h86ik=; b=JhEsOIRO+a/i+u/r
	lv9dHczGxjqUsTe3Qwz8GafxHU13THPXMyE25KvSWe3Rd9gz7/laWRzJe5e/E1HK
	aOtHFWmWlGGLggkELzg7LfP7Z+T95CSgZ4U8Upa+ZXIWmoqBuMvvUhJoSJzXYZAH
	C+oy1TEku44trBtEavVlJIJfhue707iyK5rjK37AEi5pM5Fsh6X+M29mZEEct/2p
	TWAVHHmj+/VeRuIFhqmo7WqpjKIDCPzwHXCECiXWNu6neE/o/jj+NQQigVzTZ9tQ
	SNcmIJr7QuC+qmOb53OWtg3Q2cMDRAvQP75GTXjXvwUBwMZ9QU0rgYfGlE5hfZ0t
	STO2vw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb1v3a1kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 11:49:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21be5bb4so1091631cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 04:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787917794; x=1788522594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zkscxSeQA75G5CVLELcqbbwuEp11lW2ijBGhi/h86ik=;
        b=O1P6lxACLh3x5S9m/hXkfZOudtyPLBYJQWHFtlFpGBlEafj4nN9N1eeuY5iiA1vdTM
         Vpa3YU6TO6d/r/VTD0kPNMCFgwAC839v4ZpotzVQx8H6pnQlUUCPVNAB3W96xLYTF/gE
         nleVW5ZgLJQaXv8UcpQNYHlPqwzo2qbg8yeRSaDY3SJ5PkG+UxMcyh0sqdqVno6FOSCX
         Yj7BGIJHnrJkZZEGD9RF5GJs+AiUL552mBcg5GRGy/oYpH/IIJOABd6IyYJlEnDxn8We
         IA5ZhkOqhFpdySk/H06dbJ1VEvsJPU5dG8Qx5BM7wtFAGVGVZ4sKVMvXzpvl8ysogtnB
         HpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787917794; x=1788522594;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zkscxSeQA75G5CVLELcqbbwuEp11lW2ijBGhi/h86ik=;
        b=nmBsA4YbiiMlOJwe7S/poZt+m6Zhg5zf10odt/PYE+pjBZ8RamjRxQ6z9lygDNOI8s
         VLSh6JJ78QP+RyNd/d3pwurZu341IosUN/rIIIcV4iN51s3aX0HK40ydog2mhahrnckh
         ZzNJu/UHIhmKD9LhFbLSfftri2/PCpzpelBXgZbJ+VyYNBBcvKM8DKh16pfH5fez7X0v
         1U8c2QYEzlVFxOV26wmtfQ+RnY54Zx+ULQBsHo1Nby/glttBUEbid6cTGZzRDqBM/FTa
         jwfBM9t8k1yd+NP6ShrPYQWbJVnhXcccfWw/pwAAAmLTirgZH/yy1KY97OuMlIq+H2p2
         5rVw==
X-Gm-Message-State: AFuF++mYvWRYqZg4sQQdPkj4y+yAU4iswEB2bxZYBBFwPBnrzspBLe+/
	k1R4iJiqL58Z3RKELLDNtMs7HRF1lAhFDT7yp9bPR9xwJAv8/JefXx+V8buhf5BjXoCXQxT15c4
	Ie9BwoCSE2OZOgqIHREJ966qdTMDYRfm74urn9Xyt/7Mc7ocItZymp9rsDgAdTOAPUMek
X-Gm-Gg: AR+sD10WbIDKjUsTaN8VSMD2kG0gSdlZN45QHcrgQkizUD4zOS3ZoEFYJxH2nzJHhbo
	tFyZfb8+KGVwfe8eiOQ944N9wKEHfWagXEvkwmY+XYMbXckAV5jzwLeLSECNCQyooiInJYDJZPs
	cwbK7vJMbkH2kisuuhYAi2ss/9xmSrGXIMdkU12k4v0KKvyNB/tl1JD37d0f0xJcjUOEvKVRidz
	DnrdPjCDMvk/DTnMOadnoh58xaY9qa2IKx78oA2MLX0sch4K9DHyB5eDJcIb/5gJLviUTIAmkZU
	JNzXDPXS+s2crL1iqi+Go/SB+hEWqvYVfzydpu1H0sc2NcJoxk2UuiDu44v33i+cL9c3c5JcZEF
	eaOjLjJuCfRR0f46ZDj1CfEs=
X-Received: by 2002:a05:622a:130b:b0:51c:2324:666 with SMTP id d75a77b69052e-52fb9603de5mr48555481cf.3.1787917794462;
        Fri, 28 Aug 2026 04:49:54 -0700 (PDT)
X-Received: by 2002:a05:622a:130b:b0:51c:2324:666 with SMTP id d75a77b69052e-52fb9603de5mr48554871cf.3.1787917793734;
        Fri, 28 Aug 2026 04:49:53 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611c38e82sm439669a12.19.2026.08.28.04.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 04:49:52 -0700 (PDT)
Message-ID: <cc0906d0-5a56-4878-88c6-24f28a7b2fd2@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 13:49:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] phy: qualcomm: qmp-combo: Update link rate
 specific DP PHY tables
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
 <20260828-glymur-phy-v3-v3-3-8e73ce7c4636@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-glymur-phy-v3-v3-3-8e73ce7c4636@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwMSBTYWx0ZWRfXxgzJkD6S6Sg0
 sUYYwNhA1ImvquIzqzqhnh9GV7hra3Ti/w8b5gylEA1Q1gQbtXJPBrrDisKXA3u2XP3I4r8Q0dW
 af4EGe224AO4SyiPwBWF5Mw0elsnD94HVZi4GqYbMeJjWMV37kR5lUti5eT+Kk8OTrVX92L+Ytx
 w3pEan4xijfDn648eerGs4Cf+mDv/50ACwi/KcoT/2PBjuZj9jkGK/sRFkF9rDfCIylm7cPODsN
 Ko1zpzzt7F4YJrlXKwkbSDKwTqFXun5ue9uL6Jij4E3NyGTk8yauy/lbQkpGXqzHK4ZGZVLFwRG
 sxUbaGA3i6BZjwhPQc8UvgweKhPimT65XPtq3uGy5k4ZCYP9nNWhoxlpslw0cvZ5RljbdfSY+VS
 3vIXYufGe3E2CZNgZMEurp6ynIwe8ZF4yBTPSfI7FW60lW39wEz4ATmY0oUJbQmdLWWWPKtePJ2
 zPJCB+HOKY3i0Kn/TwA==
X-Proofpoint-ORIG-GUID: fJbPSZd0x-JOMe_easKUmq1cn0Qw7quP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwMSBTYWx0ZWRfX89T1MFMObdKt
 xPSPmrq8FJzz32k3J4N9xvpLdmMdfE+SJ+KIUKao5bUoS/a+zwdhPp0UP/q3tBCcD1qbLMxswKK
 IEEVv64vjPwsPdC914266PLKiEYVLCM=
X-Authority-Analysis: v=2.4 cv=faedDUQF c=1 sm=1 tr=0 ts=6a9175e3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ICfJUWih502foIDt9eMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: fJbPSZd0x-JOMe_easKUmq1cn0Qw7quP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280101

On 8/28/26 11:43 AM, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Update DP PHY initialization tables for all link rates (RBR, HBR,
> HBR2, HBR3) with corrected VCO calibration codes, lock compare
> values, SSC step sizes, clock forward config, and bias enable
> settings for proper PLL programming across different data rates.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---

Fixes: d10736db98d2 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
