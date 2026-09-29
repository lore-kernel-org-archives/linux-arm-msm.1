Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C85339383
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688075; cv=none; b=AC1utHqY1j1LZJBQSzYXU9F+oD+OZ5Qmyy3KdknEnN+DLdZ76V1dnyEn683iVHioqfYK/chl7RsCn5f2mVk3Gk0X3DyOHrk8GetkZI2dAZMirlL2L+pzPgtRFbdBAehYNlFII9IQlidtz2ApphfSJOqxPxtfMdhgsyVAnAD0zSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688075; c=relaxed/simple;
	bh=3h/ymNXYlxSl9RL5neHs+6kC8pmPpSHO2JHkaaK92w4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oz4AGE1eJ7h4Lj+elmEnWvgKJ12o8XsbbmpJjO++4Hu3nFekuyppnyKu92AffCmmuY4X0XMm2nT9j9rPdTetHFQHzVcKSxk06imziSN3UEes8u42HLRhqdLIfOgUHCd1eH2AcTsVULcne2Y08y5spoS85ANwX4y9nl8peZDj6jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aL4/0DBD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YbOV7l7A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aL4/0DBD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YbOV7l7A"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqedF1016876
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bv8dV17W/c4BxuznKaxP845l
	r+CLIZxBiDhUC0dcTy0=; b=aL4/0DBD4c385VnMkk/tES3H0IUBRk4V5rB5MLoL
	EUzZnUa8lCvqsND0aFQZrIhv1RirCP3RtfmtafD5Q8tTTGLy0kUT54r5dBTAE2eJ
	pdtG9RvL3YgGTmp6omDtkDFXsUzv7wNj3sWuYlNWzHIUSmslMMQVESuTemyz/EsR
	By95bCbOVQXCisNwUbbG2TWLxBjbWcf7opqCMEZ1JeQ4WBjOKKiDJBzOFgOSWloN
	b8tbmhAmMXoQdktNonpfU6z82pIAKUUcGMVoGx/I/LGZzbwfftxck1jKgijEUmwK
	qhUqTCfSAqCy0qZagDB1KNoUNh5yxeWNjM2w9w2KkSnVFw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h05yxj5pk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:21:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a01d1d1b6so760668785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790688072; x=1791292872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bv8dV17W/c4BxuznKaxP845lr+CLIZxBiDhUC0dcTy0=;
        b=YbOV7l7ALsC2IOol7M6eprScU9wp12+QCFhnpobuxn1fC7h8ZplDbuA/hO+31jkM2b
         3/yThjKCwmcUf1GW2fTrSEg8Elk4HpKK8f+W7ek7TdrX3nCeuDRZmagHyU+GxnZdj2Q1
         TWXn3DyJdICFeGpfK9ej1wsAqI/iCOQcpwn58Cp08yB1ty0vZQHCYzSeT7Gz/zG9+RY5
         MG3JfCj/mJVjQv8IHAcKs311KLqug305W4SCfgvPapqF3BY0ltDqnfgVtbp/EDu98Zsn
         LTR6yC9ZMOsdt5V00byAQFB400cg9o3VVS/bqPSgoNiSdYkrj0+sSF6qVFxe0KMIjNt2
         z6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688072; x=1791292872;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bv8dV17W/c4BxuznKaxP845lr+CLIZxBiDhUC0dcTy0=;
        b=dtuvQXATLv4LUJwxODQJGOqgBQ0ChtdD5lhKQr+sfQRMVM1X5Wn2mlJ5RG0siJVrIq
         re5kPzoe0yi3AM9DT+2xgaQi8wP/8/KPA4ly25ZA0U7sZkx32EhwYYRlEZI+AsyJzrhi
         pZ/D10qt35TUK0VfI1Wpy+ynpN7uP6RwftPrEIJXVOiLXz8xpKC9lXU4JSuDL5l1XxE1
         FQOalUrjUXUdTmdyO+x2vNIZ9qUQNwOjxw6VbwoC4Bluct2pg6bEfkQUJ+JchbY1rsYC
         umuvHNeCz2c0VIE/c2wdCyKVGpNZ8nyeB425ddbHtUd0ll/5HRu01kXtWjMkfbSAEeEr
         7neA==
X-Forwarded-Encrypted: i=1; AKwUvByBt/X033srhWcLkcGyFsr2MCFH9D4kvK2EOp3Sz6Fcd0IbXEqFV5OL3fClokCmXgvuqMnCYXCqtRHl6Ka7@vger.kernel.org
X-Gm-Message-State: AFuF++nI2ChI9pzut2aXMFCpoxaPUkkruMMkGCNu7SnXx6V9576ByZlK
	9TIKIeo1vk9/fPaSueHWBxOSUoDCRxRKHowtUf7+Q9Ms5ksDxhajXTi//VSeKwfdVqY5sId2g7r
	qd0+RDzC2wpArJ1BW3ksozhFgxm6A8z7zd0FFNDUpoTHiTRtlDIeFJVNNRoi/OA6ucDQk
X-Gm-Gg: AYBFou1Jq5Cq0K/aNgy1N0SE8VJedLXAXT+Qo1GMZFjiKHjezWBDSCJ1qntnOZ9vFgj
	Z2KCZDX5wmr84PHeTXgibOODj8G6g/cMmZhbWefDMTiPTlZQicEZ0IPiD7k2oxZXNWnMJmTHJcy
	Vly57Vi3reDB3Z/MZXRBkT48VvRXi+OpcQubp0PGn5YjGzQrTP/CQ6yqcVprthRPJCOTlTEiJzB
	QVbawjbPwESfrjSnRSHtEv9ssgAC7V+tf/RnlNFvD8nxjeZXZUzS3ho6PGSKZ9ujvysqiyOXsnY
	QGb8+tKxevHdfM2o8rWwKK6+VbUTjTl/LfwfhF/SErWv3RMVaQTksZVOHNoyWNZa1vcVV8nCp2H
	zaRCFoFoKP0XDEDM=
X-Received: by 2002:a05:620a:1d08:b0:93b:d7a0:d9e1 with SMTP id af79cd13be357-93c43d42a19mr2688510285a.59.1790688071991;
        Tue, 29 Sep 2026 06:21:11 -0700 (PDT)
X-Received: by 2002:a05:620a:1d08:b0:93b:d7a0:d9e1 with SMTP id af79cd13be357-93c43d42a19mr2688500585a.59.1790688071199;
        Tue, 29 Sep 2026 06:21:11 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf2d973sm93403535e9.0.2026.09.29.06.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:21:10 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:21:08 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 11/12] arm64: dts: qcom: pmih0108: Enable BCL sensor
 node
Message-ID: <2k5k4qouibqyynstutn5ffohlti63cblnatvhwjbo2e5vok3ww@yudt5aofkc5o>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-11-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-11-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX0redeyTS76B9
 Px1tdmYKNXHQmwNW9hnZrJCeP1iQqSbIxXoCXYXTll94mFVfCmG4GTnwdGfezCHv9w/ohu/tZ4s
 GbNXEZnpmv+DEZfjcmgbcmmBk2CDwmo=
X-Proofpoint-GUID: ss2UPNgP_5CpWC66IQrEhhQYpfcOFeo4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfXwyVipJMIPQAP
 OGcGSRD3JwhArP8C9DPA5GR/Eb52+2zYwntqU3fJItcoqkBufmcksnzjGm1ox0sFY+2W2uQYwaY
 o6/FbJOxkyjHJgXMo0k+zv3Ba5lEjlrUeL5xkkt8qZd1HLiOTVtOhZgI9HNKyz7pM/8994RtLiO
 YmprSmL66CGfpo3ch7oWGgtG3x6yzp1/upX7Hs+JYBfM6WHy1BGVtbd5LNv5nhl2gCRWlBv46kh
 UBtpWy1IkVeTyvj+N8Cne9muGBDqED8ezv39I2NEquCb2OgrqG3nDFpdyGvS48Gn0rXGjv0vWn6
 mYiQmZDUxNOoStf4uNSs6JKgwY38fGJTKlZYjs6QPAOH5EdLPcVdfWRx0oVDYbz5yKnukHuObXX
 q6YKVwISB6+ZSI4bIwnlCaa7DDcpGiabzZ1n3BWLji+Y0FfYy17I+0kYY6/K4d3jJe7vfqrEPjV
 lOGPac2AYRecJNL4/Qw==
X-Proofpoint-ORIG-GUID: ss2UPNgP_5CpWC66IQrEhhQYpfcOFeo4
X-Authority-Analysis: v=2.4 cv=SaFi5fRu c=1 sm=1 tr=0 ts=6abbbb48 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=_ybYkvnUm3iZRZ9voNMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290053

On 26-09-29 18:39:43, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
