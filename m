Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3560B4AA57C
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 13:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380490; cv=none; b=H/PgRLblxJaoNBFcpFZI41Zrc4LRYhKeWkaGPnCekxbr2B1gAhz9hrGVknYX6mkwMtS5+CtYcBW0nZwJAUQsywlxNE/CBBOl2U7tCSA3ZoGYpmBFg2ro22ATrWebrycyvxmztU9tOuWNjAQTJYtGO4Yu8oqJ5zhX3mUIwMZfAaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380490; c=relaxed/simple;
	bh=4BPC0RAv/+Xo6vftw0wqtFLt3xYpSNLwUfg/BFWjavE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOJcY9YJ0OM0zP5ojD46y/h2LT2DgNZjJDxwtwxUjMzLm2el39dx2NeM1wfEydD7UWE728cfZB6bmeIIvLmkSaPOUG79zVsQdurhZyMj4T5rvn1J9YBriqSfSxU4/mL8CnTkoX/wmTV+4XEFWtvlFMYBkMMzsWfYVIxfxfH06CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2Mj5czW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X1fh8hsn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2Mj5czW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X1fh8hsn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVTgd4178831
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 13:41:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RdsEo7LuSlTCZLMr1If+IEH1
	EDpELJpDjjeykvuSTxg=; b=V2Mj5czWbOeDLkaf1/6l5Q9Un3YxHgG0WSK8yVWF
	gEVQGizxkMhfnz1N0H3TZ5YXYfmaCyUer+HTffbZDGfgFFXwvgen7YWHLNpXAuGu
	EN4hiJBkZM5323aIWQHmI3uZOq4Wvw3jDD52PUhAUr6LnkziDhc9FG/MVp8XOYd2
	hzmlS0El8OEeCqSB7C55gK3s4JTD0p+J0Stmm7iHs0B79U5k5GL9MbA+bboefl4l
	VbukOYsKU+Wl8XBa0jLRNRGgyE6eIH3Tij6mVRz7A3TgZ874wz4+zpJoyJnYT3QZ
	n01RT9JWwfhrn8Ht2Dql5o48r0zBIWLpIARomW0AzT5htg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c60acvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 13:41:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caa0ce0cdso503221385a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 06:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791380474; x=1791985274; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RdsEo7LuSlTCZLMr1If+IEH1EDpELJpDjjeykvuSTxg=;
        b=X1fh8hsnrpk4vqoK6An5K9xHcGmpQCAZe3sMTKoO1flTqcP3ppTUfAkdV3QAsHIU+g
         kr7zZtPv2foCIbj61T69iSONp7lF6ghnRgWglQb2xDElvsAgi826sZ1mQvD9XnHGq7NQ
         GhAvDs2cVW6qYJzaqz9jF32oNrVlAlaAGaSwpZ6ZjB+ckabM+BTmYK3mOeaoGPeL+szW
         EHEf/Vo2Fc+q2AjEKn5xWICqBusQRkpfUA2ZtZLWSYSTt8lUA8egjLEFqbejwXcJWV+J
         6r1nnTppoChoWKiCD0qLfmZatC2zyCLfW118IipfcrqAXmm+mO5t+lGPFa/XG9BunAdm
         kA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791380474; x=1791985274;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RdsEo7LuSlTCZLMr1If+IEH1EDpELJpDjjeykvuSTxg=;
        b=Jh+tLX40ue7zZBXiAoma1pmBAC49JlnHtTrNU5isz+HZ/PD1AlQLgkTWqvxDm/Vaqt
         a3DlBZvU9xJNHzwzSvBUneU7j22a7YdREF3/ebA5V+HNUK4V96cloJL2DoJ4+wIa/e/Z
         Lks6BWscUsDdsp1ydjNA9WVNBlpdTMcz2kYZdvdTPIpWKw8uNeKAOxXn0RZhycCr/HcE
         u1RHBZzMBbW5ggosKumHA414QDcUQtperRzzeR9l8XiKCeaZvEyZGFlQomwaKuzKUZV0
         TD2NFEG+abJf/kO2hR/oBtrHhKKkx8PBQNxWORYUUTdMoUUt+6tZyEfvzp5uYyGb+/GA
         WXNw==
X-Forwarded-Encrypted: i=1; AKwUvBw+3SkA0kjDbkEz8qxmo/BrhvWieU1O1hXa+deJ8zJBJ4QxAhfV9/4/09E7Lg3AoO7oaP4W+ADqZ5+LCVZi@vger.kernel.org
X-Gm-Message-State: AFuF++k0VqNVr2UIehVr6JbiLF4H0uphmonB+0Y1I8SBPU8119N5fFFo
	njQRs1QL1z6qYE1AfTsa2VwDXUskhot9kQNFIdjTW6+CMnlXUz6iwoAVJ58YrGOnOH/ljP1I6CH
	x97xgOHtE0WHDmHs6eUNBGyUbR2wGzbt2znkwNzF/1T3ag5AJdWCe1BsTe00Qelo0QDdX
X-Gm-Gg: AYBFou22lpEphb6rIcx1PTCJEAY0bjX+w5yrBdwsyOabnuQSmDzCp8ZkyAYGHdDDDpN
	pruIa3AQIcRsGAdz2UJUJ1lCL8vo55/UOI7vWd/hSQ15QdK7wwndXzZjzgs8ikVp3+UNQ8wPeWm
	rJntS7jUXHUG2yJLj92eRCc0EvZyKeg0QmcAuaIYCpLW9NEArgyVNVPxNmFT7p0XCbKJj6sJY/F
	qGxKx4Zmo7Max9fQc6GdLmzjIZtEiXtk+WjXbg67asgKI8FOmCvu8ihrHvnA4Twjo9yRZA7UvcW
	+4silZ8Wlw6/UCWMeWvJqPwfJOJmstO8c3iXD1H7sqeicE1PwdDUvAFOG07A2kUSEStIPl0NDoN
	I0E1W1D6DmftC+l0NVC8IgP+u0tsLPx6hKOWKa8xl/6h6WV/VjMFos6dwQD5zQWSQgUwK6ouUex
	cww9i2+PWZTLqc
X-Received: by 2002:a05:620a:25c8:b0:93e:78b7:fa4e with SMTP id af79cd13be357-93e9b7865d8mr428385185a.37.1791380473910;
        Wed, 07 Oct 2026 06:41:13 -0700 (PDT)
X-Received: by 2002:a05:620a:25c8:b0:93e:78b7:fa4e with SMTP id af79cd13be357-93e9b7865d8mr428379185a.37.1791380473285;
        Wed, 07 Oct 2026 06:41:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd3083376sm54026e87.43.2026.10.07.06.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:41:11 -0700 (PDT)
Date: Wed, 7 Oct 2026 16:41:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: defconfig: Enable LT9611C bridge driver
Message-ID: <riv4zjtk3apvkvrkgkhsgl4uwnuggefda3uu6z4czelgfd5kif@qubcvt4k4czh>
References: <20261007-master_lt9611uxd-v4-0-9986704e2a7b@oss.qualcomm.com>
 <20261007-master_lt9611uxd-v4-2-9986704e2a7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-master_lt9611uxd-v4-2-9986704e2a7b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: _nMmV_3ehEOMNTIXcApsi8Ecx97bKlNo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1NCBTYWx0ZWRfXx2LE3ENES+FI
 U3+SgWxP24l+FISu0pBeE5D+ODs6zN95ZsZC9IZoEoTPLo3Zuhr11Ilr7hCeG/CCMAFk1RPOCHn
 9UvdsPxHsREgPno1Np+1oQwbtXjUX0I=
X-Authority-Analysis: v=2.4 cv=PM+aavqC c=1 sm=1 tr=0 ts=6ac64bfa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Q6lPxUuw6KINYsX_g8EA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: _nMmV_3ehEOMNTIXcApsi8Ecx97bKlNo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1NCBTYWx0ZWRfX1QAgElM9LMSs
 gfhW2VGpAvpwt6GEnXxHidu0/CPW+QD1v+01PkGGA9Bg1w5OMNUTXTqMcubM1ZH/jXaLwY7zHfG
 1vANjhVkgcsFDhAQ/OnaZYolE/n2lQ3n+7sG8tlY2jegqOSUKnL//rfhy3/ihZsatzdx4tBhqTa
 7N9y1FOUcagcDEfBrU+CJGhvrSVb46t7vIhGv46yRaCDf844nJU2kmnJ4lM9k3eOz7A0qY285AY
 ZEjnDLB6vhQhlRqLzEhLwQXYXo5j7h7iMLOirb3AnX1a1V7xBOf6tHKYrOoA4TyWdsVZURW2ISz
 /DAC5x7soFUAxQELolMQ2JN6H6gVSftYoR/9W+fr6yWyiNNrkaI1WB1F9+usvpThrO9kVUrtQ6P
 hXlxO43GdTwk79NgIHREQUysg7Tfni8EN7tu78IT0GhylwB5q3kJJWhiP9H8IecJes7wep5B9Rz
 AsOygxzTpks3R3aAlRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070054

On Wed, Oct 07, 2026 at 06:21:07PM +0530, Mohit Dsor wrote:
> Enable the Lontium LT9611C DSI-to-HDMI bridge driver as a module.
> This driver supports the LT9611UXD chip used on the Shikra IQS EVK
> board to provide HDMI output via the MDSS DSI interface.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

-- 
With best wishes
Dmitry
