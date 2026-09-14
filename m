Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA623E49F7
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 14:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394597; cv=none; b=G7LJLhTV2GXuiPeBQ74G6vtokbAq3k0sElxPxwUZbh/6QaBV+lpAX4UK2OvvSbg17RUJ9lvJRo2aW9jHtsuQLju+haIrQ8dBMG58MbtMN6IUBNuXH6x2QysSwcTzl/O9dUK1/hVE8erRi93XQ5YP5lz+L/0Ml1EUBQQMH3Qc4qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394597; c=relaxed/simple;
	bh=veFrKTAc8vROn8LflcgK9hdghqncqe4wOIseyA6YVQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJ1YXYW4X+/cmS2qiBNhqJNz1ze2ugkMxuPoK21z0k4+CIgW9J+gtu8HJAaM4DF3yg7M6KqMUAKYuDSx9q6uWV4BhwL/UtH7ZPOMXD2UQRmls1rS5IbjTNHEaX9ikGXGIFHMeUWOE9anFo9NbTpq799QZTbnuHUWw4t7bfsl5kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YBhRUMTc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hocREiVR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YBhRUMTc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hocREiVR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0o8g4159505
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 14:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bJLwYSimBgZLHlMCLJs49ctc
	RaD6WjoWxoa1Bx4XulI=; b=YBhRUMTc1WezRos+cEr+2rhnWlYmqXw4Hy9YQP2R
	vaQiwLYmZUZ8Suz0/7BUDm28BYVZD4LtpMKwKYu0jF7ItWIo/5SSG0/LMCErm2oz
	Z7JhAYel1S8oqrf8uKWyIoPqgkNEoeZc/qDpcJGcWgP2OVlqkZVogaybUlB4CP4U
	lMtgTeLyBOoFxOt4V2T5F99G6i+F7XrteMdBre6o66LI3/QILsi79xxDvmZjVA7k
	o5NKQDPG0CVxpb35H7fdzqjKOMF9T9+zJjjzlWo8Am4TWi/SB0rdgwSEuhMa/jxG
	V4d/8e8dU6tv2JZzQHzpF92Fb9aRwr5QOglGBS/fdOpbgQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f1an7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 14:03:14 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c664499696so4232643e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789394594; x=1789999394; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bJLwYSimBgZLHlMCLJs49ctcRaD6WjoWxoa1Bx4XulI=;
        b=hocREiVRAWAKiHu/5kDlv3UsQZYiczITVJ9Arn+ciFY8VaQy6lG7Q7QALHLzAuSHlq
         zos0PNPomI3PAYu7zAH06GmVydPigvZld6oje56ncoVVWCXt3GtvJP81rWCmPMORHRuo
         Wh4TncbQoCjPijJdPwavlgkUhKBBm6aCtSMEBd68e/vNV7pYFyXNuxYFrU4msriLOAgX
         AtopY61u2xxQ1988mJfmJ49if0qRTjA8pGHw9R/95ngnBsGLw7P7QNJHHcBmoT6iyuAQ
         oJ15WQZ/T7p0iU24dzA0lTQuDaq+i3dQUWe2KGuo5q5EaaDamdLqxlaat5qRyHzMtV6t
         QJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394594; x=1789999394;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJLwYSimBgZLHlMCLJs49ctcRaD6WjoWxoa1Bx4XulI=;
        b=rGvCfg2Mjc5imErQOC5/+aPqlfBuzOmCFgoFtUvwuMyTaFKE4emludZggrQzAfrrh3
         C9WJgMJN7ohW/LINbIQ7qbNg2LbY9XE7UBNd2Z81Qkd3cJMqwIjm3tMgsnNk5Mes2alO
         TXUzFxskhkfKLoBnzQYBIc4WD5gOFAZoyl7urDv4Ncs5RI6+3K+X4T7Q+rXgmO4Day/n
         z3+SDK7yVaiEdf0J8FVH6kQqM1JqaOKDRWtiuWnUuFoOmyBD2Db60VYFcZ+t5ePaqMob
         1xBAg+/uBayqpLfnz59semUGDDc0Xa0d9R5ktZ6iP9iDmNGOyWC/HPpYti2EXj9n4BQC
         /Y6w==
X-Forwarded-Encrypted: i=1; AKwUvBxZ3O/4/lQaFysuiAQHWjn82jN4QTHO3uCSU3Y3nVdK3YI9GQI3AA3i/Rvfxf6A9hDhue4Oldcd2WqxGb+e@vger.kernel.org
X-Gm-Message-State: AFuF++koPWYIDZrmHxEsGpnT5Y8KilLWnS+TYepeKv2VJvT1XnyIXxAo
	/2k/At+KpYcfX3It55LaP72JgiPkwY2PEPxL98CfyY1AxKCwlbYvX0y1j5/b3MOHyNtMUIhAWYk
	+M+rb5zLcfZP9tipcHsW+3mDAGS2cnIJbQvi8UZrCl3Wu5GfSd7gqicn/UJ4WV/Ze7pb5
X-Gm-Gg: AYBFou2sCeWAmNmYtP1GkMM6vKfnl6tpBONOcJEUsckUbNq5E0lRHm5jAXMY9gIkfiQ
	v5/iEsMfvf203eacCgvvJeowBenJt/LRUaGYvSPhuHfVjLw3+N7qII72b1eP4fLUbmLZxdcEKYz
	UJrf8IGUpculNN0KXIdBHBvBSznidM79mdHU/TyhpPtzMl0KiulH8dXBLoZhvjgN/UKFDTempZW
	eQkTZSRZxlyViPNOSfjecCEzOjLDJywoTs0WxNl9W0/ZUYCY9AiLLGKl6icfMoh1/EcO/FP0/uY
	Uh//1mJoQ8ga7GNrOEHANZv7fvC9cupEtbLuXLOAu9hAzTaHXLpEt9yh+frkFPLAlEnLgpkaPiM
	5BjiAZot4cXay3xs=
X-Received: by 2002:a05:6122:1055:b0:5c7:c898:9817 with SMTP id 71dfb90a1353d-5c974bbfa09mr1904877e0c.7.1789394594145;
        Mon, 14 Sep 2026 07:03:14 -0700 (PDT)
X-Received: by 2002:a05:6122:1055:b0:5c7:c898:9817 with SMTP id 71dfb90a1353d-5c974bbfa09mr1904778e0c.7.1789394593473;
        Mon, 14 Sep 2026 07:03:13 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb3602eesm25999064f8f.34.2026.09.14.07.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:03:12 -0700 (PDT)
Date: Mon, 14 Sep 2026 17:03:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH 5/5] phy: qcom-qmp-ufs: Add Glymur support
Message-ID: <bhwywy2ldrpwff4wxi3slisbggqt74pqz523ksanusssmpfvbn@ht7pp3fafw6p>
References: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
 <20260911-glymur_ufs_qcb_enablement-v1-5-b9fc5e2ee99a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-glymur_ufs_qcb_enablement-v1-5-b9fc5e2ee99a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: unof4K5L5yhnae5G9mraEVC9IMHqG8qf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIwMCBTYWx0ZWRfX/32NP9ViZG/F
 c4A7RBYzesn8UwHg8DM6tdpoMtwlAGXJYPKDMORIbAAlVPvu/Db7qbAZcdm0am/gA/sq0KoefSF
 uFxhPL0rTvIqFlpDU+xEST3sLJOnsK0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIwMCBTYWx0ZWRfX4EmKe5S/pWfj
 cRVbeBzSn4fG2AoBW55AV5YYuZrlXu2smcYEO1n+HKEGlHdx5w0eS2SWmN0Q9VUWZo4K+IjW9wk
 aUqrTzxnFcW8DAVXdbwRetU+0kop4QVJBwVzFwtXmR8JGodVU7+cgO0MsSGxMGa12UDdaN3m9ZP
 Xi8NJfiRiYb+ItYal/23Fa38vzL9g2D94Xr+/ImuJUt8o1+xOll7jv3lGCjSHCHlVAdZixklAPX
 moi9zzGdks9hfyzsNyzthWllSawZM0OaTMkmnU/auZ4nQAYDmaJGStpvsyScoB52QMOfmA/vLBz
 1UnXgw0vGrPJd7WWAXUapnQMWpP/EXh181rgpjJxiT2j14Wj0OtAGsChAq4cPQNPr3c+NfDsRj5
 ELbgR7K5JvAoVaPd/biZnkx2OZdJ/g2zrhACRH3tGlUf98NGeugWYKmtJfsagq67z6GSMSq7MuD
 kcaYB6wHoNC+VLqC6Vw==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7fea2 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=l9x3Jx16obnCIVmqrg4A:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: unof4K5L5yhnae5G9mraEVC9IMHqG8qf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140200

On 26-09-11 22:17:09, Pradeep P V K wrote:
> Add the init sequence tables and config for the UFS QMP phy found in
> the Glymur SoC.
> 
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
