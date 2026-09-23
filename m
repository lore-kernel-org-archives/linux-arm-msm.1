Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04B9494835
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162379; cv=none; b=OPR56OJRbh8XexTbAexBUfRkcwlvdl+fcGWqPhxS46SeJHi/wxyniJDCsPgi1nQQIvKG4J8mK8GJXhCNYGEJUDTiPHE36J0obi9VBFOYn5Vs2uVzQ/a4ggz0lbsdVZ656po1IKGGxJgL10+ScbakgWpoYxwLHoff6XGRF/qo17k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162379; c=relaxed/simple;
	bh=e3RItfsQ0FfH0wPgzNNhnyjLb0vKv35XtQWm7X0h0+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tlg4PdPebEXak/heAM5zwl7ko5N42NJGaWIqvXyneFG/q5jElXioYsdFX38k6gZmzQtIhTWG0S/JftkgZRLwuGpFpZYxduKapODP6gj9njcgJj88u6o3Xv+O7poclRJOFSpaeHfRJq2vlCDI1zeb50M35CuWy2eLOnF2CPUvX0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XmKMDuOE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SHMZ4fSn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XmKMDuOE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SHMZ4fSn"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA3BQh2262031
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R5RKExqH8rkcjkWpfakw6QznRsAOVeNLpg7vGSvB+OI=; b=XmKMDuOE6bXqez7z
	tbM6dnwVKDwMq5/ZYdxVL3+CLxnqvIdHTtV3FlY2/hq4TTgETuTt+FekgtNmdkXB
	3vcV8sipk+j2AZ10ZAj2Zl/ja7XaR0WALyIZM97cQfXyRbJuLj/IKUgX5eZRnrd7
	va9wEE3SWLXdURejmEPlt0qUh+1cqSxEQAtz/gMJ0yqYWGGZ5Z6vTyQ2oC4x1+wJ
	5O+NHWmiJD22LhpIWePwptLJ3XhGKFUL1vkTfH2Uy1TynoYzOD9wvrRURa2lZh6o
	stlWKhILWwNSnc6VgB/tkDj2Orsf3K+7RW4HYgnHyLThw3b6jHWbz/Kx4f9GhOFE
	TQy94w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c3qpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:19:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso25531685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 04:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790162376; x=1790767176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R5RKExqH8rkcjkWpfakw6QznRsAOVeNLpg7vGSvB+OI=;
        b=SHMZ4fSnN7yr1n9AplPVqd+bmStrwT3g4vEHDd326qIRDFsdCNgN+8OHuMJvIGB4K2
         8Dxc3Mk5ZkMBk1Ff9YdmIsyhigGMAsjI38E2028oiQh4lrBFkCaueM+J5fe1D+P+Itv5
         jwGrgUl3FXwvvEdxKZ9PMqgI9gBunAqkokRJypkCwqtzc9lESTrwXgHiA6uIe0U5ZGP2
         Lu91o9mD7JI+V4m8Cy55YgXYOE7HQcruSnEBttIemZD00UBJs4Ety3Ya8IJUSxouNv1J
         nJ/+astVMdh7iyFEUBOWgTYx6P3ofLBLfWsEo7JT5z3Q2/9qUKQ9FtH71WChssVnHXr0
         p+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162376; x=1790767176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R5RKExqH8rkcjkWpfakw6QznRsAOVeNLpg7vGSvB+OI=;
        b=HOqp43zbgjrNPFu+Ogso+59nQjpmiUHAjFUGZ1Rvkip2mLr60NDlWFf3111Eb5DZ2H
         r2PTD3C9AoY4A3eWR37s3gTV42cmLziAt6JIRqIShuSh5fCE1Hc3gupD+xufqmj6gVEr
         G2VRT7HL34FPOTUlQHWDtHBafJdmUeGYJf35UpdojnfP6NgE2yl948RFzSGHJ+9p/ZJt
         DSEP9C+kMRuGiclQ2UHQtv05I8lwk702eva6PqNIXBYJ7l4f2PAPlOSKZEPLQjhOm/Vt
         HruMN73dzLf87KsKikp6q2FvZcqtOO19vfpbynpjseSEmtpWB0XS+dBTe+LF9+xgNhAd
         K1Bg==
X-Gm-Message-State: AFuF++lQIBmtmaJqOstHng6y2hMIXqUeT7wd5xQQXrN9wTxk5pob1a3w
	tWyL+6dC3/uvor95X/qNXpN3lwfcaQaeVHvM8Iv81GRpoVNTSQ7VELAoK4Qni7Idrp8Iy/vOx3Y
	DHfEIGtaXf4fsvJKzNFK5bUhGjm83cf49p48PGfYOVFA0hjTrY5fNfSnjSzN5TSTUVICd
X-Gm-Gg: AYBFou3LFfp2VjZd7hErXxvWN0t44Kzws9DXSe3HTZeScGNQ1w8rXOo4EPybdVs6Roj
	ZZX486JmerVrL6ox0kn2Nm2sDD5UxTmezt8MoZlte/VPeQj0DaOnlNdQ11sK80a0EZ4J+VRihrq
	u8iogbxxoBRH7NRrBDO8o6liM/FQLfgD8R+h+8zvOWM5WLopGqyZof0yCusvDDTdl9Kz9CeXGCk
	UXU2OcoIVDhFGVwzIYNIKEIjctG8gHuHsJ5GsOgWC9CmiWdx9zlNMx1mcCiuebcuEidoB6YmWc2
	ps72y2Xk7bhM1fKNX3S9m/GMzPZ0+kPAWo5KalRsCQgtgynPSKtnrXg1oXQK2cjtklsclIpYRGl
	zM2UodWDeZn7bNfErpeQoXQ==
X-Received: by 2002:a05:620a:4547:b0:93c:203b:3e8d with SMTP id af79cd13be357-93c252f9ba7mr335754285a.6.1790162376233;
        Wed, 23 Sep 2026 04:19:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4547:b0:93c:203b:3e8d with SMTP id af79cd13be357-93c252f9ba7mr335750985a.6.1790162375775;
        Wed, 23 Sep 2026 04:19:35 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab386e7bcsm1458942a12.10.2026.09.23.04.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:19:34 -0700 (PDT)
Message-ID: <cfbee1b9-4b13-4a7a-b1ba-0fc666b149a5@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 13:19:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/15] drm/msm/a6xx: Clamp MX dependency vote
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
 <20260923-hawi-gpu-v1-6-0c3c79a1a470@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-6-0c3c79a1a470@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oTUWyYxdM2FQKQf4u8YyPdYQF7g38eFF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NSBTYWx0ZWRfXzz3bnc30MQ7l
 vOdGVLquKBdGOiBDxbe5eNcYZ5BVf+VjWrj1/cnDqG3SwgHMfdVm5FPE64x2g9qTGAetfVB3sUS
 uDbidJT23u235qtnpp/W0BSLmaX6x/4=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab3b5c8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=2GDL5SuO4PwTqS1bYXoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: oTUWyYxdM2FQKQf4u8YyPdYQF7g38eFF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NSBTYWx0ZWRfX4zdWG1O8V3JG
 RdpSSjU3Dkee8nb3DZSZ4/XwASnHXzHKvR9etKTtyeWCvig89tx+h94w/YKAqFshe//vS7J/HyB
 ceIv5GzWce3aMiWQNZvn8qjaQq2ZIvrlBSD8iZvIIHOPEv7lAQtfMm2MdMwKpigSMbCREXg1PpP
 C+naKcEjQO2aPOw96hq0aB4AXAdoM/vBP7NpYOmrxcx+BFkYIYBDXd5JM3GVgMim/HUIti5N506
 qUk7HMUShnGWLkg6uimgFs9mJQAB4v5qBDT+gcdRlMBgmSXV6Fqn+NAflzDoEEAknA3bZYhvXwM
 DOBM9xTsqKEvQAV3EU82+gUc2Qp1nRsB8k06hHLLO9Xgi643fCheCgi4HDCuewG7RaHa9tK0xjn
 nySGvKw0FCQ7BNE64BoGts1o2WDvkSOsm+yBIKAn4/PA4k4Gd1a5GHSR9dr4VQETZ7fmzaL18eE
 wThYYWhgg2RzqWMDApA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230045

On 9/23/26 12:25 PM, Akhil P Oommen wrote:
> In some chipsets like Hawi, the GPU arc level can exceed the highest
> available MX corner. In that case, use the highest non-zero MX vote instead
> of failing GMU initialization.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
