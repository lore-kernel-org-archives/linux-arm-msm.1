Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7FE4A7C93
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 11:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790594452; cv=none; b=AxlmEkmTGZyaDFnODQE44Yce1Mb1rK/tqr15/hIcIPwbkJjmnHue/r8haBCA6RpJt5zlv+eRtvqftZ/gySipPqKkWFeGfJ9uexVy3SMG/2Rr2RD1R7vR7lZso5mvV2kIPo+Wcwc7thnzEU0ZbeZ2xc2sSQzUWDUHSfP8EnXwfcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790594452; c=relaxed/simple;
	bh=9IqF3819j2ygp601ofWPZWHL+evCZnmwp5OcBplZl0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tLlb+I7Z4K1YTr++Xs/7CzFlxfsSF+OiUcL6YRKYHAN0aIxVhIKVqHv/q2hFZZKhUFtjUJ/+6Q0blOJvA/WB2YPBMbZHmVrG5FglXzV0H+N6VBgw5+DrNo0ByjWpJ5Gl7hX5+EBE7/vF1W/RPRXeHyfra9oB+9Aja6CIlaLidPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dGqUILAH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R7fbChoW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dGqUILAH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R7fbChoW"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAJVq2404444
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 11:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qPso9G8Y2iqX226aLF2wFKAr
	aeHtAaZ5eheUmmWUNuE=; b=dGqUILAH89LghPjRZ3nLKZq+3Sb6o3v4knl+ualO
	Pfspx1VVNq+ydAq8PaFM5Mh7DXkIg0EHd9oe8WAVMH4tWVRaLtWHt5MBG50DWcTA
	2JpQkJNt7YjhhOcBrpLcnAf+3L+FHNfQ1Dmi9Q0fcYheomKby4H25rKPfJf6QpkQ
	bME9y57HtCfXQXT53GCZswwa/Jzz6Z9PuxauMUURdyUFtER+a26MlhjJxYJX1stB
	PSTJTdied1meUi73fetsoZY/k+3AhX6gdKgfqf+r5RQ9d36VkqnvTOfo3oY5Gb8N
	BLbvfnsawsFk5EVeJCjptIW64NCKX2aerthbFG5pjDulcg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj6t1857-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 11:20:49 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30f1b904861so4306661eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 04:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790594448; x=1791199248; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qPso9G8Y2iqX226aLF2wFKAraeHtAaZ5eheUmmWUNuE=;
        b=R7fbChoWWggoPYxWr7i5VjPjHiwRQ0Wp/j3gX6K4tv3ljZWLtwESTVQkcoHBSwRBhj
         yXnN1DAHgw1CF0K9XasbBrBaGpuYIfFSod69U3tM9iFu26V5jHYdVlWUyYbYLX4wHH0X
         E86cBSEmO5H/hZBlQhZ1Vc7bv27vZKglQzgWSlCj3+BDM+sC4Jc15zawCcUN1POzTj4U
         U8R8z+x/MfEqjDrjPOyNBwnwAIp8mZkkzcTK4/K17YAyw2yYPAuokHN6UJNwmEkZrRQH
         RWqXfI0+WwqzfrDvl0D7hgCthtCYlg1f1K4TaS/iqRRIkd/10hp8N1Y/o0S9C4mV8KfN
         b++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790594448; x=1791199248;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qPso9G8Y2iqX226aLF2wFKAraeHtAaZ5eheUmmWUNuE=;
        b=UPotvswcXdlH04DBxD1JhGa/QTbEL142xNes2z57kP+hY0oFj7cSJGrZmrS7W+P/Vw
         FyJtmfwZHBw2eF/wgp2TfFoA37Ug/B+YZA1zW3Y7WeTo3EYmXiP8LkE0VwR8+bzWC+Ys
         LQFM1BAPrK1trUYkIFyTfuuOSAnFEa8iTufQkatkUaErv8x8fxj74y1ZkwXCgdp3+KQQ
         Gb43whgTaeZQS7bNQxQHu5PbxRc77oKIcTta/KqJtp1A66nJynpyWUAT5uNZ6bx2jive
         XIBW5tjFPHfbrkDtvcCW5wMuvh885koB56dU2b+7DWUCzx+MWpkvpafPYhe2+nS8n008
         ZfIg==
X-Forwarded-Encrypted: i=1; AKwUvBxAB4cVEzaxA7CQpcgvNa2fVja0lD7zuj0X5wVXg422+H1hT2zvAo8WK3L+j5BhglWfBd2hIY406Aciv4hT@vger.kernel.org
X-Gm-Message-State: AFuF++mJVu/2kVcStncDVHl+glmWKcC9In/ksjZCXe9NiEHvBY3Ix1Yj
	oyzhUjumg6HyUgR1hzkzZWJpe8BlwxMRB9+3Ng4Qh1w7Srl5W9Mx9t/UnsRoICi0pXOk/TXHD+q
	H1O08I71aP4HyVbMWtsMrRUlyrnPNuTj+SeN2097zdhwovCcX3WquxrzNlV/G7cHk/kZI
X-Gm-Gg: AYBFou3m9JzULxGsXR9XNJeITfsWmWcc36zrLomgjwqU/LWWu4+0x+FpYnLGhsxSeK4
	Glzv+BTQhO1eVYUF/jpiGKOIQ+QCrLyAmOALmMz1haJqsHtO5HLgYGTNPf9wKGZbY8b6BRtmOOM
	tOvzQ/Zw3CLCuzc2u+BE6ZiIbxT0jJx0a/ZSKDc+Nz6ZPWeX1acCLm/C5VN+MFpfObODvjuoH+0
	fvrEhlI0GoiYLaba4wlyFa9/6JNbDJ4ZYbRjMu3gTmhKYA07kLON24Ed/D/wO43evhuuMgfGhd/
	jfHOStaFjT3jO8V5Sw3xZ2mYPRDoMRXrajvch4wceonuWzDZN66u88djvNqcpCHnvR9WAOBqXKb
	9MVxpkBG9c1jHxE32T8rQYLnbUdXitd+aGiZbn+ZWHQ==
X-Received: by 2002:a05:7022:b042:20b0:144:ed03:7c66 with SMTP id a92af1059eb24-146ce680be2mr9817593c88.20.1790594448316;
        Mon, 28 Sep 2026 04:20:48 -0700 (PDT)
X-Received: by 2002:a05:7022:b042:20b0:144:ed03:7c66 with SMTP id a92af1059eb24-146ce680be2mr9817551c88.20.1790594447739;
        Mon, 28 Sep 2026 04:20:47 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-147913a776fsm20668467c88.17.2026.09.28.04.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 04:20:46 -0700 (PDT)
Date: Mon, 28 Sep 2026 19:20:41 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: Document Adreno SMMU for Nord
 SoC
Message-ID: <arpNicG_jUzh1ZrL@QCOM-aGQu4IUr3Y>
References: <20260902013858.130887-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902013858.130887-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0NSBTYWx0ZWRfXx4rOcjI318oa
 aspI3UXOqqH4QjtUYar8QC77OyfxHPMpm27mnF1Bj0WIWPZWOOB4XkgAsqmr5F2d6DwHCYJFdwZ
 8mkcioSR9WLiB7p3BOyKf4sX0ba/RH7FHEaX8DE3mU5UwZjOk6ZLlk+libgf5gRC/m+1ugS4KLQ
 nJ/r+cIyoRgumxkPezhAnTrQ/ec0rZPvQEnxbGd0BJRFoPSu1QsGpOcafLn+PtCz/fG9K1Uw/Mc
 3w9gbHIq15+PAq5dzI9eePnuWaYCQj3bBt+ZfgPQ3JF46gCLi9Y6D9RXBwqfZk3P/WM2NeY0LZR
 FT7AoS7iabnDrFzxUbcXxY4vJUocDH27M7zg+fS8xYQ4YhMANvrlB9il33CaPBQLJzGQxNB+K2k
 gJ/ZJiV0ePI8Hw2RqRUFrqZrfi6Lt6P4O2FP756r80NqGAppTMAbWwcWiu3XlvSs+ZoizUPxP/d
 sCM1lD3UllysgSpbHqQ==
X-Proofpoint-ORIG-GUID: mZSFnxE_jnRf1IUJLew-1X2N5dX5zN2u
X-Authority-Analysis: v=2.4 cv=dZkVTnXe c=1 sm=1 tr=0 ts=6aba4d91 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F8PB8KkoD8y9vLVCxn4A:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: mZSFnxE_jnRf1IUJLew-1X2N5dX5zN2u
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0NSBTYWx0ZWRfX41nMlw2YmE10
 U6czGPS+faG7yvDfqxg0Z+56FnKrmlE20sT+mS1GSZM+f2u1UcwF9X9qTT8otGTB3yEOBrKqLGK
 x9sZghKinzsD0IOUi4J9NRo6F7kV8Nk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280045

On Wed, Sep 02, 2026 at 09:38:58AM +0800, Shawn Guo wrote:
> Add specific compatible string to document the GPU SMMU present on
> Nord SoC, and constrain it to the single HLOS vote clock.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Changes for v2:
> - Add the missing HLOS vote clock constraint
> - Link to v1: https://lore.kernel.org/all/20260901140816.74200-1-shengchao.guo@oss.qualcomm.com/

Hi Will,

Would you pick up this change? Or are you okay with that we route this
change via arm-soc tree?

Shawn

> 
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index ffa33b7f4a96..214a9c051588 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -102,6 +102,7 @@ properties:
>                - qcom,hawi-smmu-500
>                - qcom,kaanapali-smmu-500
>                - qcom,milos-smmu-500
> +              - qcom,nord-smmu-500
>                - qcom,qcm2290-smmu-500
>                - qcom,qcs615-smmu-500
>                - qcom,qcs8300-smmu-500
> @@ -579,6 +580,7 @@ allOf:
>                  - qcom,glymur-smmu-500
>                  - qcom,hawi-smmu-500
>                  - qcom,kaanapali-smmu-500
> +                - qcom,nord-smmu-500
>                  - qcom,sm8750-smmu-500
>              - const: qcom,adreno-smmu
>              - const: qcom,smmu-500
> -- 
> 2.43.0
> 
