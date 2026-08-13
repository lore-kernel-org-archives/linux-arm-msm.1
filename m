Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67628375F8E
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 16:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637740; cv=none; b=Nd3wd2F4YvBFTYc3q281IGRCvYfJope2bcl04cEDal/QCAxjcaQwFBiMC+gSaf5xQYSnd/Ok4KLzma6Yasp4m7KR42NcbtcSutueZDYNUTzd2SUBntK6qjpqhhw2bMZQRvgJqJCXL/Qo+Zya++ot6Z8Hc5qMqBEFU7dSi2ate9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637740; c=relaxed/simple;
	bh=MIvrKutPPH2tVhwKPLjG5U5q/+Ok6qTd8pvUzYzU5ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CeNd5ITrhf9Z6LG4JWUrB/GSK2WBPVosIm77g8p39yGl9p1tJmMcymae38nCc8cHOfV7+EDmOrDTLc5KCWnfEucZ8MA+VIXAGQy6/RtMxNZKnH0Ii/BK5RayTn8k+EJ0ZeZ/NOTU5js3fbeicdwhQk0fhRlOBFIwJcuZ0GuUHgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b+09M2iw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g0x/hvD5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b+09M2iw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g0x/hvD5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFU4fJ2375717
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 16:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6e+LaW3yul46PnnkTF3KFrhY
	9wadBG1CabWIFspdcCI=; b=b+09M2iwW9KlmqorbV6w5LXAOnncoC7Vz930iiaw
	xcqEucJlhL335OPjnX1dx5mbiQcD2r9jL1vwCZY5YwX7R/GAq0ITyzLXCwI533y9
	CRY6Uwbd7C+4rbXG7tt81eF9v5hi1alCALyGsi5FkQMd22dURg3jjJlqSsAwEHUk
	ttAF/xyhMDnyjRlx5O/77b4BHpkRVKPYVLsV2CBFTgKHX025DO8c6FXAIHhWsD1o
	b0ftuptILIjcpiwqEs5wGdaVsMPmUQvx2lZw4nuRLdPGZ4aP1Ly4O1qvAPcELPh3
	AgVryZJhYCbTlF5mpXfrTRdaWSXNQynGd+SbaTMCHpsQWw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g14sykct9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 16:15:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52d28f8737eso1417791cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 09:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786637733; x=1787242533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6e+LaW3yul46PnnkTF3KFrhY9wadBG1CabWIFspdcCI=;
        b=g0x/hvD5dK/JYgS/DNkXEsqCRJHUrM6LHF05vgHTU6PhrbtpNOkoBvlr57c0CBaD8O
         P2vRqLEGL47lXup1YZd61E4ID6KKgp1sXYYWL5vRiODdZLFrhNDJOE2hPVHi7vQu38ND
         mpyAapnYwq1QoEcIEuQrStRMsTmaEwJRAiFPsxE+fM8gs6cj8JK3Y4AaWA4SwtkDvJwP
         3wMI5kRSbLc+L4cDjWzW/a8QA2JBpyjCdEQriiRjdYfLFATAz8zm0hlwc/VuS1LIw2mP
         UFz04VQ/jTr7kUY85VC40hXo/pQCeqGkiswCjAga5gtF55nObWFwhXrvarCAfEKGzWV3
         Kx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786637733; x=1787242533;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6e+LaW3yul46PnnkTF3KFrhY9wadBG1CabWIFspdcCI=;
        b=lUfoYA09sXl8GN7hle0cy9iHRp3EuTzkwjUGDXl7agv2jP9y0ApLJXPvjiBASdxF1G
         ThnQBkwca46Vz9tTxTy1GGwN5Uxs+8eSjTESkBzxznes8Out1E1CYMwrgL8A5gu9s2u1
         a3DGzHjToG8YVnhhpqLVrFFRC/mSux36KDdSt+Y4X+8VT+wiBrCeQ/7UNsfY38YZJeos
         IezaUXBPRJkrXlPQwyKdxKx+tEv3oz45FIsdnWi0YHZUIr9gvW8haFLRYV738YHEHfeS
         IVP53IVyIa0G79v6sj9WyOnaWtbLsPDEVTZ65udbP5cq66yuyQTdlWzL+F+zvK1BI9rF
         tMWA==
X-Forwarded-Encrypted: i=1; AHgh+RoSJ35qFX7XZxSVBlQb+GCikChK0wlm4GxtdgLBAngDGVEN4xJhw95KimGyfBObkf6u7lufNN034OZTOITG@vger.kernel.org
X-Gm-Message-State: AOJu0YwFCDNOdSYQ+O9mxTQrW9FFvsDhOvJOLcqJ3/sgiq75tbI0runh
	h8YAGXEMWd4C5k85HL1N62q2goT4kNtng2H0WEFMrlhC1Tbw0TccE6+CvSZDoGc17MJNKWPH+w6
	3qHxNzx6+lvqqgLMyynvC2ddRVHPqBd/k0Hq13M6I497YJU9lqVd1eYFBx0WAZSa6k9uL
X-Gm-Gg: AR+sD12rLxQbWiFpd5Z166PAq4tgTh/aE6pab7wKu2vC7eGly+GqbrgPFWNMQN2g2JS
	pWay4rS5CSidNc6zl4oyz5f45ZJ0m+bwR6SoH6hxeJOKy66ZLFhDhOKthSpU+1VXGO+G51t1WEY
	GrHvK8ZFdsRVx9hvRGg0U1oWSZtE74jZOeZysSnxcTmhXtq/0XPVooPYd6eYBr4kXwdfXnu4qIk
	6g5uQPCDiwOTVYZX2ivPLY9vIM2Ugk7vz4843592t/rPRLjo8kR9KerP+6KA+757t/9Mrzq8wW/
	5Jj9zfqkpGnoa6xwNfOwgiFL7iXZ1PCasCpHME/7HZ1c4Q4NL7VSzHngIAKZXDSS7wj2SbvZPXu
	GcKwGQwkBYJyw7qCqWX0aXBXf9zeoYOGx4PhBKs17ZlUjf7rW0bIslSYptOFwv8crA2/AxUDx/m
	od+TFg4Hp5AT+d
X-Received: by 2002:a05:622a:e0d9:10b0:52d:78c9:9377 with SMTP id d75a77b69052e-52d78c99f36mr34724751cf.36.1786637732608;
        Thu, 13 Aug 2026 09:15:32 -0700 (PDT)
X-Received: by 2002:a05:622a:e0d9:10b0:52d:78c9:9377 with SMTP id d75a77b69052e-52d78c99f36mr34723971cf.36.1786637732188;
        Thu, 13 Aug 2026 09:15:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b453a68391sm582574e87.78.2026.08.13.09.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:15:29 -0700 (PDT)
Date: Thu, 13 Aug 2026 19:15:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8750-qrd: Enable Adreno 830 GPU
Message-ID: <rrjisqkx5bjkbcqtrd7so2fdopvuzxvmijg4oe3cvaz3ccbecr@izesra4p62tz>
References: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
 <20260809-pakala-gpu-v1-6-207ad1fac1c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809-pakala-gpu-v1-6-207ad1fac1c7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ZcQt8MVA c=1 sm=1 tr=0 ts=6a7deda5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDExNiBTYWx0ZWRfXwuT6NtYWlGnP
 xRs+VADBJb9xFV5zXCF+TipwLhR1pATgbQe4ix97+vmYxoFIjfGBM4HOSOdpDjj8WFKl/d8imIj
 vHKgud8EEL3UB6Tq0QCBQmhL3oMdwRJWisKM4RNNPeuAYlFftC4pxm81ysbtUsqY3afbmMiiPbZ
 lEW4Kl+DZg8/efrPbaa0MJn2j1/bLe5oSErZgiHWSsrTaW1DBgs91PtZ5eqBXAfF12iv4PqiLKZ
 4zDHwzW3PFdcz7CrAMuT/J2u5MGoZSseh49DUqVSs9GA2GrQcio0xxSvE8qWq3TtvO9O6LekuV2
 rLxBvE5txYHCTt/ZKmUi8OvKowRS1tpr2BQkLbwfeNFu+Ba2euCfr/MOmMH2Hc3hux27wDJrmF8
 0R0oR08MfcldXlcxTO5zKOaqky9nJkkjWc1FLgi0ggZ3secVlH62CQXUlX/eGu14YG6pFVuir2P
 V1i8eb3Xpok86MvTwRA==
X-Proofpoint-ORIG-GUID: -ojjeC_3T1oUz9eQ1lPDXpjn5HRoivJG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDExNiBTYWx0ZWRfXxn41IEWS+H2U
 RalmK0VC5YByx/ZoVH4FdrsAdgNKh+7MDWSYCWkdbfe6tjUa1ZsrxDHOVF76+6haD9Mr2OPdnAh
 6+oAKVc4hZZSX+7Oo7zrySgtbWlP1bA=
X-Proofpoint-GUID: -ojjeC_3T1oUz9eQ1lPDXpjn5HRoivJG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130116

On Sun, Aug 09, 2026 at 01:53:13AM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Enable GPU for sm8750-qrd platform and provide path for zap
> shader.
> 
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
