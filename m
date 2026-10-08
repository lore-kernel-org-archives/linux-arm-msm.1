Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7974548C8AE
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 10:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454760; cv=none; b=dmoG/PqWvET//meqg99fxdxqdoBNrfz1CN1LsVdgsVJ/7qG2V92aa5CldPL9n1taW1FB4niUGgw9yDxSjdXf9qFPMFBh1yR7nwbwZiuNLKVaySncwVxfyjYyHrwwvFfVlOMaTigQGuI59HIRQUeuzkL5mWi/jfUK3g+OUDyIG58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454760; c=relaxed/simple;
	bh=S03LwFerT/ooRJg62vlbHpT5llQgKvhDDZxiJuNZIBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRoLAYj9PNdG1htLFqisWEUy/2DAcKYG0jvRZwEKcUJfVVwb66IsERCcUzdjL8t8rfq1RzGiVeScYhhgwWjNgQJ2xayCbkSWIHg5vRGDU1KQ71rwKRngWootWgDeTR6Gle6fAfAukysHJAfPn7U0hjaiq7Oo2onfo7v1hLJ+7og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C+3VWlVK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hibD6EP7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+3VWlVK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hibD6EP7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KaiA1846622
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 10:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g4FJlDdpi5DxKcM79pJauxat
	KMVB0hxE7B8PqzHViqg=; b=C+3VWlVKU8pC8aZKI2i/yFCj6wao/v7/U1raJzw3
	R2mf3ukU29ZVVludR0ZAtvmWK7u8YiV6vuZKoz30dMu0QbpwZ69jUFOBSXs2CI1s
	lZ+51hWpfOgiSeGLmY+Ie8mVP3AlB351/ozRiOTOeV1dx0P4tCSyeDH+rsuRF6vk
	YQz8XIg1CyAV8HPkHSr9L8IUISWfSq2asL2es3cXxg5pW2t6+dUouijLHDymk2AH
	5M3sZSz/Ww0Ja13znYoDX+BmNkcp2jSppLh82NDNS0lBY1wDdGlfFuiQc9YaPh4K
	tgF6JJriwAJw0n09SkhwdPiflZHPHhsxuJKHIwX3VYp4yw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3jgvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 10:19:17 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c29a61f144so914560137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 03:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791454757; x=1792059557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g4FJlDdpi5DxKcM79pJauxatKMVB0hxE7B8PqzHViqg=;
        b=hibD6EP75Bt9l1p2vNVRnWBbNde2un5e8tHdr7KZL95iVtNi+G8en5OAkKIvwjk1ds
         myByIRZnD6FqUgrCEusRRNQJ/bm1HeOVTFslL2tPpHjf6K3hM4PimdXA/6R2MwwetSwR
         QKt3iOkkWrQ89WDwj2RAwKTKefhwv15LOQiFnm8E8VF+Z3wvf9M77rq2j+adJeERIRkj
         FfxMw/5OY3OoQQeYySECplCzyle2+jibtMsT36/y4AuyjuHvX/eYO/DDoia5VNNOHD43
         Fxjmu+pAHSiC9NmobSGzpUbrWMEzlfOzfR9AXWbGqncUj9YnR5LrEq/8LfBMjMES/pA6
         vGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791454757; x=1792059557;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g4FJlDdpi5DxKcM79pJauxatKMVB0hxE7B8PqzHViqg=;
        b=Sh9ICDdCAR0rK1ShzCtEJFSEbozt6q5MXqPG4Ls+bejJJ2NdgYImXB9kYG40QSO3Bx
         DVhiU4U49oNeLo3aWM36aX8HggjJSAeKd80Lmr4kR3ibjpII2qbNAPWs1r5DzSpeMLTY
         nq/WaaeJcQoYxBp/yM1Ww8DdoQLO524Z7qI66uSFz7jglK20pZjrdTly2BQIlVntrPC9
         cVhnK6kXw/CEaP+2MV9xOkIMkLNvRUEv62VmICGFgYfMHj3EFtX6YGn587Njgo2Myihj
         2Zv4Ij3szrV3zd6qXDqvzLsC4QQxlAAdYHzh9PTvJDvtBYMKv4lwE/VQlzq5hQ8ZLn/z
         jeLQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4AYi1meV8Ql24imF05nc577j2sE7Yjrjb9xQuZgO8QMzuRXJBD4Nrsff1VzAEeeJf5etJ/Kj/auQ2uTJq@vger.kernel.org
X-Gm-Message-State: AFq9FYIhaaTw28gzLkWJjFu6P+q5XD76cXSRQ6oN0Km4cO3FNmXjaT9R
	Hocvq9Lb0UKuU9piW1XlZXaCNbCQdrSG4G9Govc/c3E4fqW0k66J9taarCJkvlEZFiRwHM+gvLI
	SOH/0+2AVleFOlVxLt0an/UAkDJ2qs3eiP/mHnCHDt5S+bVl7bSBe6YTRAqlO9WEdveNO
X-Gm-Gg: AYBFou0N+2X2UbLE0wKL7wE0ATTpa9SFsR1OkDRUfy/1mqHiR+UdAhm1ORuWJlj/Pma
	7dnt3OYE8V8DN9gIhfuPXUgkDC/7iLgHZ0lAXc4M56y6OAa6W22G9D0mGP5sRQWE0X+HW5+2hqn
	C2P9zWUmwArp6KhF79wl9bZB+6VMdnTotluDJfCEoXPnnxHLnU4/e6pqI/8GxVfBNiLUlLDKZnN
	DqCN3emb2I5KsQ1IBJ+onHeJ1WjyoyeByThl+insxpDdTIZhr1n91dYlV40oHrNKcOOj3K6SGPR
	2PkFYlkVhucJzsbszWSJv4BO9X1TCgnwR3cxW5lWtCF2FmDRQdaAU1mYqcOOUSSrL3mEkUEAZva
	f53gA/FZZArmrBiA03kPikz1BqbCGC+TLZQpbhIKu0cCfj0MRWqlpqpPnFQNV4tJlmSfNRk6Ug7
	/Tm3IpQyuf9cJL
X-Received: by 2002:a05:6102:2a5a:b0:7ca:e2c1:9a0f with SMTP id ada2fe7eead31-7cae2c1a9demr135533137.17.1791454756312;
        Thu, 08 Oct 2026 03:19:16 -0700 (PDT)
X-Received: by 2002:a05:6102:2a5a:b0:7ca:e2c1:9a0f with SMTP id ada2fe7eead31-7cae2c1a9demr135521137.17.1791454755764;
        Thu, 08 Oct 2026 03:19:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9a1d65daesm15254111fa.20.2026.10.08.03.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:19:14 -0700 (PDT)
Date: Thu, 8 Oct 2026 13:19:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v5 10/13] arm64: dts: qcom: lemans: Add Iris context bank
 subnodes
Message-ID: <4l4rq6uz5f5tfdajn6k2rhbbrnkj34rjezxbhgyttvs6yqeqiu@ok7s5hzitxnl>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-10-0322ca5dc10c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-10-0322ca5dc10c@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MCBTYWx0ZWRfX6I1St3kUa7PH
 MHvmGpcvT9B1c/2CvfRyRBovEsQZjyYqMFWlZFqYOfhLyTlDXMgTfmyDUhuuo7J7Tq9+rz63/tm
 MMk9Zmcw7PGP0yodwXGKEie4KAvBKak=
X-Proofpoint-ORIG-GUID: VCyUNxU2TyqIpAR1b-bveeLGIw12BzEM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MCBTYWx0ZWRfXzQ+kJX5H2Cz4
 Cq1RbREIXuGHrpYYCDkMQmV/fQ2OsHUxPD9ztn2BXsjtIrX/dSl2DGG6oovf0VbKZrwyqtRGpBX
 GyetT6+6cyR/Otb7Tb81W2CpnPwqW665SvXeFSB0yWZOhTZL1hM/dNrenoPNIXrdLmEuw79t/dL
 kR/7qfuwbbuhfCU6G9RlQChVNwiDDhKaj8gZNdtr51CssQfkxhqNKXJvBuVpeN+dZtI+BzT9zou
 H0asQZMrLT71jPe7jUtdgAcIqh7FpK84UFhBANvP6n2SHnYHR9W9AXXKGs/LbICFMAAK7USh2U9
 u6WCSoGqRKefYF8QqK6bVStYGYWGBIKhtwdMNtxS8sdul2VeTh8uGUejGvlWD4caynk9Q4bOZQn
 /51fCSuYOyIcDKOJGh3lS9Y1N4WSjqT9vtXcSUrK1zwCLWAPpeSGJie7Iu0MeFTizLTBoC1qnMK
 8RsiSM5gupNQZqmJ0iw==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac76e25 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=G2U8quZLHxfXJRKprjwA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: VCyUNxU2TyqIpAR1b-bveeLGIw12BzEM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080040

On Sat, Sep 26, 2026 at 12:04:09PM +0530, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | pixel stream addressable range (0 - 3.5 GB)               |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
> A single "iommus" property on the video-codec node puts every stream in
> one IOMMU domain sharing one IOVA allocator, so nothing restricts a
> non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
> that boundary the hardware faults, which shows up as unhandled SMMU page
> faults and spontaneous reboots:
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> 
> Given that the address range restriction is for specific VPU stream, it
> should be ideally be moved to that stream. To achieve the same, a subset
> of streams is now represented as subnodes, so that each can be
> associated with its respective addressable range. The design was discussed
> and agreed by mainatiners here
> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org
> 
> In the past, this limitation was addressed with an iommu-map approach,
> with the iris driver dynamically creating the devices. That approach
> was later concluded to be a hack to avoid having subnodes, and was NAKed
> by the iommu maintainers. It was discussed in detail here:
> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
> 
> The video-codec node includes address-cells, size-cells and dma-ranges
> to declare 1:1 mapping for DMA translation to the parent.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
