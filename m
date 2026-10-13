Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2BB395AE4
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881082; cv=none; b=kYVIMR/W9tDs93E38YWgVVHO+8WCdfJ+JC8k0xuH8LNKTuOWq5VxTK0qAj6ekMhRibDzYqISibYnW12A1tU4Bczhge0VXOMuEFWtWjv2PHkjnqyFdxdp1eZO920/648XrhVNqyJRtwe2QpEI7+xKkiNivVwuWQAd5gp62jBJakY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881082; c=relaxed/simple;
	bh=HZ7QIReQ3uoSFnEfU/QJNR3c9Uf3lS5K2cdxd7fZlOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fK864065e3gKMoT7XeJPdaQ7pd4mf9o89Hf+l013nYe05tzlZ9X36Da6opPBl8MCF3fj5zCPCtAuK1xnuL/jFJ8caMII4rnb1++p20te1IMzGDyPGgheCyBYJvWbaM/KIEW7h0UVT8RKS5mAGuUzc8Lko58tKd5vgkPLGZR6aoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=caCpwNn8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c6jU8Rb3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="caCpwNn8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c6jU8Rb3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8UvW6924255
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=faK0bJ0sX0dcSnwboayq3MHZ
	Icr4uJu+BKG/etclmFg=; b=caCpwNn8oseMurXZLBRWMTz+TrmZik63MloQIBVZ
	V0h4K9VIGhkoKvsbacEkmw7TJ1RkBwE9tQ6rrlzbJte9vYAS3WFF8ufNY8rFH7zj
	MoaOQUTo6j5yAcaDh4HGM3IKZTbaBbCKmvAJjwbIk5R6JxnXy8VH9C2DB+mSTU10
	NBZ31VUZGd9PGL2Bhl59k3CPWx1hL4xep3M7aEhbJ8OObdNYAbHJVZtJH43tT+Fr
	TQ/TKZWW/lOsLgK4PVOOM0UtI+a/mGrAnfSuKWJ6KU5mFm0D41FScpZLgpA6Jsi2
	GR9ISiy+w5ZPeXUPuNj7ZYpV2pxDfYPBUQ3oo2TsZwMJVQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1t0nq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:44:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a3f673221so820718785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 01:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881079; x=1792485879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=faK0bJ0sX0dcSnwboayq3MHZIcr4uJu+BKG/etclmFg=;
        b=c6jU8Rb3hZA0A26Y6d+WOUdM93ZIr4Foan7aY5ZCvRKWXDf4JmhBnYEkvN2fyx/GaH
         35hK4Lh5Sbp2YvQmLJiEyNCtPTKi5QhcFLNgWyo2V8tSno4Z9FFJG/QQXG7Le2Usm67l
         eyZO/d0hoyz+XuX28aA3pFiBSI1SdBAWP2TDrgotWgdDt2TaPFqRjYXRHVBXMByaNG3R
         NkFkmkHIxOGY8T65SQxipIhd6VyWzQgeXiakllqno+deCnHueMP5oXEDrQmSsTVtfwMX
         bDBniD8xtwnwNgCEfmdLg6zAGbTHHsRvkb9RVATYC/Yifg2xvMp4cXocIMSnjrxu8SOe
         +qJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881079; x=1792485879;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=faK0bJ0sX0dcSnwboayq3MHZIcr4uJu+BKG/etclmFg=;
        b=CBJtA3vqhrneESydnInxLFwjqBiPeulM++Qg9td1NtV8nHBHK8eAi1dNeP5u44nsVM
         IFM1LwduOjJiZX5Q+LnaNA3qQaXd02wqUJZZrFKvfCpYPPsgwgSNuqXzzb9oBs7UVGHM
         q60/gaaxt2gSDl+ERgl/e7ClJNP1P0gd4VRkgrIOS3K5GKDPYYanwlMQMWrWcv+pe3cd
         xUGbL4urLZR0bUfh2d8/FYwuwhmjPIhXGqnI4z5F0pSImZCZR+A+aCQQCDfSdYEoDRg0
         1pMUBj6wayZpBosV/lGsyn63nF+ngnZR1YP4pPsdDx+ac7JmGz8e1SfSP2R6mhkG38OU
         b4LA==
X-Forwarded-Encrypted: i=1; AKwUvByk48ZbC7JRYVC3sLlqHhJlkyIdduWmrNPW2rh779pa6u7OBjHAMNMtgrrzLS/SM6dkbxmFaLO7sQi7mKJO@vger.kernel.org
X-Gm-Message-State: AFq9FYIg4MVrM4Yr5BKEGgEfCFCp1zX9rjeG5N/jAvKIcd1Wp8xzulTg
	6QRs5BQ7hRHTyJGmjwZn07+23z66cpn9ar+tvsxYvt/aghHG5e2yoPwBcZoEDrtPF7+Ys6X8RdU
	n2l/22XjBqpTsOTILaAPju2ecUBgjcC2PZmwCxTVH6bI1Dqxcv7PUcjPTIYv0UeGZETTy
X-Gm-Gg: AYBFou3/d4wwkNIUBJvdvKYlC1lfvaPK0vtMlkVr3BYCHi5fIEWyD3ap7PE01k0ByA1
	jS9EEw2cZO4I3jOYA3QDKOzayteWXhpqKx7aT1Nk4dcx5Luj5+i+u5IAGNCY4WXRb6IMrqPmbX5
	YM/gMSgS1MA/Yw4XcSlzuv+hBv66v3W1v7sLDIVFDTyLBgFNzZiBbwlN8h+XXRo8lsAHOTWDchr
	iZiYbLj/AxzBGoGjKyYISCWCVaCJT1ONNrC+m2Vzotdsm3X+oy1Sc5wIX9W8tU2yB++R1inxGLL
	owaqcLlGmEi49EnmbrYwal0f0Cofpbxa4Vhs7DRfOK2+uSGI28iOL9zhk9hSihoDFRGWQVDVlAY
	nJw9U0unyn/yTgo4=
X-Received: by 2002:a05:620a:4507:b0:93e:c12c:fbbb with SMTP id af79cd13be357-93ec12d05d1mr1863344085a.72.1791881079140;
        Tue, 13 Oct 2026 01:44:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4507:b0:93e:c12c:fbbb with SMTP id af79cd13be357-93ec12d05d1mr1863342285a.72.1791881078606;
        Tue, 13 Oct 2026 01:44:38 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beacd2csm380055145e9.14.2026.10.13.01.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:44:37 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:44:35 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v2 09/13] phy: qcom: edp: Add Nord voltage-swing and
 pre-emphasis tables
Message-ID: <qihez76tvkqvq4axyqmqyig73bdds4cuuxhzzv3smlztu32gje@q3r7o2uuqkw2>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-9-a2ab9af954d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-nord-drv-dt-v2-9-a2ab9af954d2@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6acdef78 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4S7jAy6oAwHpvZ4QFX4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Im_2M5gsBDu5sM99aPnFi9DQR_xZKIua
X-Proofpoint-ORIG-GUID: Im_2M5gsBDu5sM99aPnFi9DQR_xZKIua
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX7VXO63V8BWqO
 4ob5wMoGHup2choWHKHqGaX5dyg4eya6EM6o1BNTr3WoP+VOpmuaOowyPncuUCqHT/4LwFNz7GM
 DzttgwCJQdujRxrqP6LOFg13u+//Zx8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX2qR//56Hvam/
 Re1F2vNpC6bdYmbrY7V7HGm/5A+pxeL3kFEOkNLAP9ysfFJCqPWEGDAr8r3YOwLh/joeMZuYd93
 1Eg1AVeGWv//QLVqBB0X11VkKDRy7tFcDlSgfd+QxSsA0v5b9E49f//zHXdbA7jZ/COAyW+CCqc
 l/RnbHhuxvdQvgUdsXfIGAFYwBqwp88EwtYR82DQ9q0ULm+cuEBwyxojZllVOjirBY8IshxseIL
 EnZgbOESAqpCPq0+/ZJJsR4q2yJ47f9XnY1fV6saJ6J2bCUiQsclkDl+GSRwXtVr1lkLH3e64G1
 b/H4DmohZyFgrXcVwd8szsQmTZntjb3McIRXzxfYTh03s8lLGXrprlQkcVfk8Dt/d6GbQlMQYCa
 HQCsn14hB0rcM1SI7tevjddbn+CkdArPW0U1Emuep6fbkjnpNnk7EY3Z42BrP3GummNmAF8k9rW
 AbULhbuwLQH1Uw4kxxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130034

On 26-10-12 19:02:19, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Nord requires different TX voltage-swing and pre-emphasis levels for
> both eDP and DP modes.  Add four pairs of 4x4 tables covering
> RBR/HBR and HBR2/HBR3 for each mode, sourced from HPG Tables 2-2,
> 2-4, 2-6-a and 2-6-b, and wrap them in qcom_edp_swing_pre_emph_cfg
> descriptors.  The eDP RBR/HBR swing table reuses the existing
> edp_swing_hbr_rbr directly; all other tables are new.
> 
> Assisted-by: LLM
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
