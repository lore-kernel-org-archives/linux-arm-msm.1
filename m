Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35E23AE718
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883715; cv=none; b=azM9o3wu8zpgwxMBND+RGzkm1u0UQpubs7BB9j0PNputQnfvrBRY5ifhI8mM8M7LOCoM/KitFLtT+3wFkAtxUhz0KB2moshnN1ReV1FJdRDpbx9sYWYmI5W5yYNX4Q22ctvGUwLPCM9TDWRXcal8OkoGCSBUq0a0QDjAgGXCMTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883715; c=relaxed/simple;
	bh=07XgK+pJXJS+SdUsmiDqD7OgbmqdQmDHY1L0Nzo3UWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KziMNfQkIJJba8cz7wSJsuB7K003usX/CZIJh+i7ePT3L9oTdPuC0g3NBitDj2LiYrKawmf/SdrKSxCrvdqoEItjBRj9zB06aSqmP+KP1eD151QbZbV9R7U5bONmA52IYUjuJRUOEyYVJ9GAOBpfxUOWmdOZ0UXHivHPVAsieMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ckxqoo6E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YHgytn10; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ckxqoo6E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YHgytn10"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7OaR7015557
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AwVrOQAST10OpocMcgq2xe5E
	4xD7N2fSB7icU0QeQ7s=; b=Ckxqoo6EAZlcrDMj0F4eefX6HbXJeXaByFh5SkDp
	Nvw/8uL2qUT6+EahYM4zs3007fQ+2db1+kOKUcHnhfJpQbX9VbFIblyNof8FRAcy
	R0wnsVVa2iFeACk68sPtCc988ESMyeC5a+SMZyE+NZjE+1fEtlpVZsinRZJ3NizK
	1i/dfxZHL3Sv4Lnbu2TNPaVVrCc/o8WipvshYcS6fYK8q5IEuPD6IYcgJ6B7P8Zu
	PmV04zNc5K/JZu2eYh68WBtiFNPxKjqJnwtCuornHyTCsIJnbz0J3W0Fg0L7QtZu
	6LTlv9V4do9Q6ItmYqOnzUyncCqtOSYT/grYLZwiWI80IQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7uggmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:28:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939c30aa9a0so253987985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 02:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791883713; x=1792488513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AwVrOQAST10OpocMcgq2xe5E4xD7N2fSB7icU0QeQ7s=;
        b=YHgytn10KwRtXCgXyIRAIWDVu7SFN8rmQ/0q5FjAxIqy1G/lT9akoCRrqtrkonpTm5
         WcCaPxaoI60LjJzsDgokC196eL41WA9U2dJPi7b7vF/UJ9ad1tq7vO7UqBvejBeYxLyB
         vK5uRlieSl/pyy4uhIodCqaM/7yWBtYIVkiTuacMLE4VSeYOV6OzlqALTWhfz97MuyFZ
         na8oljJKTmKnr+sDoE9cp0KJ8KzaII7ky0avDWZkLX3wUSJdHIHXHt79K+CtjLdxAD5m
         gPgSwR3VC5VqhqkLeyMLSe7N55iX/oeDl32O6CBAW/Q7AD+BIGz3FvUxY7PorwLAFsSH
         gEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883713; x=1792488513;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AwVrOQAST10OpocMcgq2xe5E4xD7N2fSB7icU0QeQ7s=;
        b=HE9jyo2ioGvtrDCelohgrBBZA5wfh5SHq65tn6O7FFIVglV0TfMf8EGoS/AQhTGKff
         MNTexJf+PJWhmJF8d6dSnGzR0Dj+4Ikn8wmIzksyvVTDPjcZQJM81B4PFdWPzmWxIvmT
         Xeu4LQh+Bu+Pzf9ZPeDGtMdNElrXigyL5gWjfnMov+VXQpF2IIpB/+OANXdzOJiuXtY3
         iiJmZvJnNELATyChFXNcxf4GfnhH6vJcjmo7SEKaNiHCL9NS9XjsYvFZVDjulpiP0/hu
         23Ct6yqtJLAfqfOMWP2yD7tjF10bag4u7s2V1cNWhvUgrRxD/WJrqVYCqEY3AKdJlcs1
         gimw==
X-Forwarded-Encrypted: i=1; AKwUvBxUderXlsx+gOAWd1Pmw4UdL0/f1eEb/CPvY66XhJvfJpjE6asXvTG3CWie6fU1PiBzR3z+R/KeGa2pOPc8@vger.kernel.org
X-Gm-Message-State: AFq9FYIdq1zEzxCJCX3ui8qNH1rlS695dE4ZcM5pdhd5oeWz9cIJGEyB
	yckT0jCKH3Q5agdF/9KWFasB7UPMNbwxUievLqKCaWczd+NF3ww336bGKcfgAfm95KA1Nc43Fhu
	Eq0F4gm32/pWE9/sVOKswaV8kB769dPn0F9AlhLgwk+PKgLmWhKKSk1Wnb2Kv2NXZ+EVs
X-Gm-Gg: AYBFou0y+1qPP9jXvQuFLEG2zXIzjnDkDiwxXiDRFWWDABqNFkcvBbiD6Tp8wqVblQ7
	EBP3+hlFVrbx2Gnn02h6acHpbv9Qdgs6wKsu42TXL4k/5igVoy1ZOK6Clzcy77hUre+bDHq5xID
	0GbsVgGqAwmqzVUtNmRKHS8mBjhVUiFKR94ez+mVkw3N5w8VOmVlNSDvG77N2Feyh5Zg1aumArc
	n5ixUsiXWuKsgGwUtfVqVKB/HbJdvbEyLWRwxY6dbLUQYixWJoMwBJUSrulL8OYbveHDjsocjqJ
	arrdyrFABolEr3fK05UevwYpGQ4K5wg66c1/oClm0kWEDJ6rAUfK1rYn21jO0tTQGdIHpZ3OiFl
	880mjp0xnCyIn68vubjlBqWUsYnTLpsCJJeXYsfzOZLZFrfe+8t5o8F45iJlOfKwV+VP7FtRaiA
	bD8QECsNzHgUY6
X-Received: by 2002:a05:620a:199a:b0:93c:746d:7c72 with SMTP id af79cd13be357-93ebd29a3b1mr1894161185a.64.1791883712936;
        Tue, 13 Oct 2026 02:28:32 -0700 (PDT)
X-Received: by 2002:a05:620a:199a:b0:93c:746d:7c72 with SMTP id af79cd13be357-93ebd29a3b1mr1894157385a.64.1791883712361;
        Tue, 13 Oct 2026 02:28:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3cd5adbsm32808981fa.29.2026.10.13.02.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:28:31 -0700 (PDT)
Date: Tue, 13 Oct 2026 12:28:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Subject: Re: [PATCH v2 04/13] drm/msm/dpu: Add support for DPU 12.1 on Nord
Message-ID: <vn75stw4ni6y7gk4reo4z25leimkahfocqrsvhw3pmappzwfvy@2pzxjkwbd7pk>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-4-a2ab9af954d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-nord-drv-dt-v2-4-a2ab9af954d2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNyBTYWx0ZWRfX4b0p+8RXTXPE
 dCJsJ4IjRYwUqKLhqv1lXVYu6rlBMBmAVDrOZX2/i45at8rSvfoLiutB5K8GZ20sV/k6+eBOTVg
 GKJLrG9Q+GTEFMd8P1/k6kQo2cQIlcTHfQQmYVE2CvqQiSCrhfinizhyjazvENgYeCZFIgVZCio
 hQRXY2zOiniCBnoz86IhBgK+6XxdnaA1Oyu5/OLi/0rMLqrBPGUV8Q2miVLpJbhl8Y+cTGit9SX
 3tqmOc1lj7zEmnpxJhFD3DdChjn+qC8XHztaBePtMy8374ZSEjmhbK1qwTW7W3tGZ2Y+oauokki
 neR4R71rwS1DL6fmbCN1vcHgLOz5GaVeRlRsRkbyFac7WtBr4OgKnch0Vqt7ykZU4xC1xRFeyhx
 fdxaFbhn8oZf+mxwyaDPUGCxNZ8P/Z2q1BzuE7DNmFprK5FbkZh4UCE9tMvD8H/LayOfHi7BvfB
 K/zpRpMA/cI6pXA3dHg==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6acdf9c2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=VbBZhAhFZuLLlrQ6NhAA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: mVSC5YOa_h9R8vRdzCJnaBCsyCKR-cv6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNyBTYWx0ZWRfX1RGS2P4CdakN
 wQKAojhfvtDBwlRknoY23p4WJnJLaDB8YCpcGF9lA1I+/CcNc4Akrlh3jIJb1H76bcO/asScbdK
 m0D+ggVUzWuA+OVak1fYAb0mdS74cfQ=
X-Proofpoint-GUID: mVSC5YOa_h9R8vRdzCJnaBCsyCKR-cv6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130037

On Mon, Oct 12, 2026 at 07:02:14PM +0530, Nabige Aala wrote:
> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> 
> Add the DPU catalog entry for the Qualcomm Nord SoC (MDSS 12.1, DPU
> 1499A). Nord is DP-only with no DSI, and provides 8 DSPP blocks, 2
> writeback blocks, 8 interfaces and 2 DP controllers.
> 
> Extend enum dpu_intf with INTF_9 and INTF_10, which Nord is the first
> platform to use. The new entries are inserted before MDP_INTF1_TEAR_INTR
> and MDP_INTF2_TEAR_INTR in enum dpu_hw_intr_reg, preserving the
> contiguous MDP_INTF0_INTR..MDP_INTF10_INTR block that the
> MDP_INTFn_INTR() macro relies on for correct index arithmetic.
> 
> Corresponding register entries are added to dpu_intr_set_7xxx (required
> for Nord, which has core_major_ver = 12) and dpu_intr_set_13xx (for
> consistency and to avoid a latent bug on future 13xx-family SoCs that
> use INTF 9 or 10).

Which latent bug? Please split INTF_9 / INTF_10 handling to a separate
patch.

> 
> Assisted-by: LLM
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_12_1_nord.h  | 544 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |  20 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  7 files changed, 571 insertions(+)
> 

-- 
With best wishes
Dmitry
