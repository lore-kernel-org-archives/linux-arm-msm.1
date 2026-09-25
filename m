Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B835B48A8CD
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329823; cv=none; b=iX32giakWiXsZU4x7izywEGoTaYeCWbUhndYvkVbbpzNtAlA8eJp2GNDRGX3hAxXUrkc4mmxvI2XwuK+XDUi8PypkiISAsv4O7E3TKDaAT+1CbfRsH2nO6GdsJ9UugaiyvR8MLwXjfmOMbhV8M52LLtpEPPZ1RVY/luQkHCiJOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329823; c=relaxed/simple;
	bh=Dke9mp13ZpcX4kPXedM9mKTUKIcxOeId2OOc/YcH3pQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FvEHglnFd8Ui9QDtkXr90J03yrkAnK7nQ2A4VDiOd8sB3XpcrW6eH5+9oza/9jYJj/vg83qlJKJqlBVQ+y/wSm5jpM3UxmxTX5WmCW4WBc0tRrlInXgxo1XmTO8tcAhm6I3Bqr1sM/nU0pxsaEgBpgpmaoSByvaykPQj37o3wmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ow9vXphI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vt3gu7G9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ow9vXphI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vt3gu7G9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YXSo289464
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yLHiwXQklmHg3BGQyexI717l
	yCNVJaLgg3xbK9n9cXo=; b=ow9vXphIS5Bk04s1Zxdr6kq+e9JGe+G3x+64k4qi
	I6G0Oz8rNoY3DpX62YJJ/pmMolcohoXmEn3stTOX8paKBZfxkkBUgOhdG58a61oe
	fxFdFrDUXGRSlklcYVqhpFGZY8tGEW9zRIa0NE4UyfdjYI/eeIBERLk/udv2nSe6
	7b5qeZr8YlpS+q0QTrK81b6QKQ31z4gI8iKgiAclXlFBbuM2gZIlMO0K906avSsk
	kAJ2Vrw9X1vuqgrvmP2giMl6VQyWxa61uGemmZj33yR7t7r5vLMZQogXdWVBx0dF
	EXOu8SNSFGJFDZEo3u2EfQ8cUU3XTjWO3ZaUbPhBTW5JYg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881u06d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:50:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a1de6d5c3so163755885a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 02:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790329820; x=1790934620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yLHiwXQklmHg3BGQyexI717lyCNVJaLgg3xbK9n9cXo=;
        b=Vt3gu7G9jAOD8Y/h199VYNaBNd5XcIBaRIYTJHdCdQkoTDVGnUb6ALvU2rLSQ9TZAd
         C9xn7LIk7IfqApRxZFsR5c6MDpT6HXuEg5rZeGEHgsIN2+qQzPe7BVeEsBdVzjSsb6Wt
         8RhPXzK5f1HBdlbAct/64et+qaRKnU8aDqHEGJaFjF4UGJQwiVUqAvuX05YQxmW9m8//
         GYIiH1nAh9miGDkf0OSEVXXO8V3SVtgDNm0R9xjHryk66jFQt7DAaJ+5GZoMqlrmt7WJ
         Tjft4HHis4Y0pIKeX+ycVTZYfc/tRXGdAMlMf9ff4YckU6Nx3kdWw/kueV5LexSBYoOX
         1H6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790329820; x=1790934620;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLHiwXQklmHg3BGQyexI717lyCNVJaLgg3xbK9n9cXo=;
        b=WgsQsRYpq8yIbYPEzpdqvFl+BybYAFUIrs708Rd1wp/LgJ7DvXYLrp+xZwtmAaWByE
         HR0Hfcv/u0bBKLe4Rf5GzoyfAXR9BKxwZeGcU8EM8KpPo3StOyE8h9ecAxFljUjdXfG2
         7sB7e4fYsu/3SUszBtgLZXzw8j6fpwFSYwSbbwFN2rmc8XaQqPRhcxIoFSVo3BmGjDWc
         dHqeFvr7F/6bpTkPfD70xCADi9rhDwj1wQ9l+79bH3znXJ62t3U5DH7SryGo8MFuu+Kq
         e4sSRjp07kcO5jtPHMaXNlUdEV9MY8YM7B9Waff/GyBRRTeZD61y1qnSv7bvJOcwkpaY
         oiJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvL9bwlu1y9fevhLvj5pqBR8lIemFCs9wQgfYWSxpKNHIVbIGRskcPapTpPjPfubQU+l9fMlsYR/XSZGfe@vger.kernel.org
X-Gm-Message-State: AFuF++l53Bu+YAaxef20vvO5/yCH9LRE466g/O7D+0WuD7wlqKkuX64L
	4wgBl1/+KLeaDMDJz2tnIB4no/73TymjX7t8VrCO/TPR5cn4oArgMI/4p51GjwloWHYC/h3rXAA
	HJ01v2KkxeSSoqafQPa1XH2aA7+X7iuKZ3qBqiXHnIEBHj1aEMNMi8CCImbYDqO/uAJjW
X-Gm-Gg: AYBFou2UPq+W/Tb/wXEwCIZXL+6K9DgGbRXtu1XMW85e4p7hV3Ondm52fi91h2JxpB7
	vW5dO7VaDRs/HBLKp9iu1m2Tmo+y6ujuIaX6ENMPTXIzMHJt81AuPFQEczr8XplurcEtt+CYSsd
	a64TPaLmyBOT2A9coYF6aUU8Bl33z6aswya+/1ACjm2l6uF8CuBo8yy7CN+LICCbb7DkuHkcEcK
	ImVLEy3tn7efKEsy5SMGcqqauB0MYW0MZ8FbVXqSzb8ukxBtN+0DLOGwaqgTmESG53CN/zt3wGD
	Q3hrwJ9etE0zRRj2FQpmS6BNcL/O5BO4OKRC3My3cVRjV/JH7xZuWjOMJk/2Pxh023HHW2Ug7lx
	wkTzEPEmD755Ke2c=
X-Received: by 2002:a05:620a:8808:b0:93b:c45f:9024 with SMTP id af79cd13be357-93c43cc2c98mr342980185a.7.1790329819842;
        Fri, 25 Sep 2026 02:50:19 -0700 (PDT)
X-Received: by 2002:a05:620a:8808:b0:93b:c45f:9024 with SMTP id af79cd13be357-93c43cc2c98mr342976785a.7.1790329819260;
        Fri, 25 Sep 2026 02:50:19 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355826sm5830535f8f.18.2026.09.25.02.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:50:17 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:50:14 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH 2/5] arm64: dts: qcom: glymur: fix Adreno X2-90 GMU
 compatible
Message-ID: <ahdrlb7wvcr6aczgrhiwuyy7ahi4ahvvv26aweucfb54hmwszm@f5spdkm35xab>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
 <20260925-mahua-gpu-v1-2-0fa0bfd8d315@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-mahua-gpu-v1-2-0fa0bfd8d315@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab643dc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Le0wDFEDRhIWofPBaA0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfXw6GYdPbHGszE
 Q8Fp08zhp91v5kWc5Y1QA3JLX4lcgDhc5Md8S1Y3u4JE0zXCTVLnVEXJgtwuXl3c/vueZL3Tnn4
 iRBasV5bDMHJz9+H1ByvRdN+rzGQKsY5UzFqbO0Hn6Z+vpMlNdxZ3X/WqaSDEPLOITvBqJjrbaU
 x6m6F/Kz1jo+za/NBN9OC9vrYlW9H1euMHIYcIAAB7miWoJVmTpO4jYuIOFw5jsWO7tQS15erF5
 NdMDgzJvp8mWFx6HU29tHswJKwr3iaK9qwlTenvwCWBFXgbQXltqPT0ohilONbXqd/wq/K2PFAp
 EYDJ2Cw1sBg+iJ/cHONiiC9CBta/qrRMU5kNG19q3ioD8Eq4GKw2V+9wyzpK87VfxgPpmxHz9Wh
 vQ1wpJQQt6nSHSW2Wzdkma7tk46mYe0vnFjMeCNVUmJeEQcDvqWRgnZ9U2lyUD0xJwB8VKQHblw
 rKK9qzVWs/m5JP1mywA==
X-Proofpoint-ORIG-GUID: iOEic6UnDrY3CE3L3dHC5t2DTtv9RuUC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfX0XR5wxn4bRhW
 FyjKQM7LAK+/VKwnBX1ms4gzTx4BLq4DJpXd+dtt77r3B8whoql0LVM19lqjBS93harADeMMZ1E
 0jaOufrp+zibQWfV57OFRzYloeiXs84=
X-Proofpoint-GUID: iOEic6UnDrY3CE3L3dHC5t2DTtv9RuUC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250039

On 26-09-25 02:44:33, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> The Glymur's GMU compatible was set to the wrong string
> qcom,adreno-gmu-x285.1. Correct it to qcom,adreno-gmu-x290.1.
> 
> Fixes: b6ff8cec8aaa ("arm64: dts: qcom: Add GPU support for Glymur")
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
