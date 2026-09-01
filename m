Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFC23CEB99
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 14:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273559; cv=none; b=kzMUS3E8wNbXISnQ3UeeUAQs5kDZ9mMtMjjG1GLjooHXfKHMQpBXQnVy7WoCS+Qb6nmb+FsYMmHPj5iWxdtaBc3qACX7pE/4RA8JhOFBkMg/gXj6fJdgP/ATWKfnsdzOQ3pPUmrppTDU/rIdRS6ij1altnvpTJc3fbGWhKB0ny0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273559; c=relaxed/simple;
	bh=8Dl2fx50tBCCW/Z6siNyrOzFG80MjNxpL5r7YPLF1Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BHyiWXvoCoBuVzEBd42rezNsBSbM7W6SRKxE4DNo/njkkyyI+WpHyg3NtKgJyik8EX0ZuvulaqgQKaSM+nmJLbQ9JrG5iGPHfn+Tr6+FO6qpMN8G2ueVxxEkBcTruPdm5duL+abvfkaH7gO9GuBKuxeBgXQdHQKYp17QG7iNLWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WqXsfw/e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kb+OU2xD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WqXsfw/e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kb+OU2xD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E9RXm3004267
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 14:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fV9PRxEUNiN84sI9N6/IsE9F
	UGfoQAhpy34kXAt1Nk4=; b=WqXsfw/e//gIC1Re6XF1fhw4aUFv2lryP5UNewhq
	p9Ys2DlsGUh9gcW+73JHYSrUJ9xfOE57/qVxmVmDLU3nt2fykE9EW8cMDBhgxyGM
	RZ0M3XlJ9j59taRBRUGTXA7kzmDvSTWkKoMvQQhOGl6ChwAULBfI1PexjaxXuSHZ
	FiIxKvO9a/8aNdQGItebxCnnPuJ4745u5/sJVNJJnoD+AyZph3Ju0+F7qqymM3/0
	KSTQ5nZrZmR9sjq6Q6y0Lvt/q+a/ZHnibMG/kYOHUaw84lk6MSK1FV4rW5CQVVCs
	TrmQhb90/HH3F5ikb8j08bPhlWGY5SJVh6LNppQ7nvcKPQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh2maj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 14:39:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0aso1793508a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 07:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788273553; x=1788878353; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fV9PRxEUNiN84sI9N6/IsE9FUGfoQAhpy34kXAt1Nk4=;
        b=Kb+OU2xDkLrD54wn6E2juR0hTEODWDHxqIr0rPjr2O6pkHSBOkmf+QPoFQfDyI32fe
         SsoREb0c6XfNdeHqacF3Nt6zhkqyAuXdjVJolUj8LSatV8CP+uyVEJ7aZ/0nbOunHS5p
         Za1XWt5N9wrqWa4zM4oZrZPjJHQbytdFtiJooG9/XznsKdLX/CAtCLSCcZvSZP8v+VGV
         SD1NzA3YVGZpDlXYtoTyHFVnTWYj/krrkBemo36bvXE1uYKwcLR+hqZd5f/Ot1OUV9bv
         rZYrc05Wg/pz99xSmXv0fQibjS7EpcpFyzNwVsb0UmiLLDBAMFoe4H2GVTJRhj9GoJPW
         H2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273553; x=1788878353;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fV9PRxEUNiN84sI9N6/IsE9FUGfoQAhpy34kXAt1Nk4=;
        b=IBkHG0ipRhf3nsNNVK17ikJqeAJjfROiuCo6lR4NdJYavz8lOdQ4EqSa9sUlac7ZCL
         1reM4o7ozKwFewp+uLjQwvZqKiGe0hI/7yIRUxVEAu1z0zWDb7QkQkDSnCkdSTjnhMfJ
         96VfHtI9Mcrrzj6Z67D3aysG1iEzZW7qO6DgiQcGA3/XnKNnkIqRMwImrErOeokX7i4k
         ekbFXxsBFJXEGuIFamSP8QenaO0wzCCEI9YaOtDCzxJgj4AgsgY7w3CkLw1eogHMlwhw
         2w3DWWcySnBAbvnldPgxeyTxR5EvIjkifmLg3PKCRta2vDytMwJGexmTgKq27+glAVs5
         tvPw==
X-Forwarded-Encrypted: i=1; AKwUvBynpYzEzPdnL/THUCUj1m1YSUKkU6AldtX9pnqZG1LlrQ87HhTNXV4nem2FlG+1qCqPIpMAiDpDH/2NFeoz@vger.kernel.org
X-Gm-Message-State: AFuF++k6e+5jpuB7RplMDU5TvNU/iuPcxsqFtixC9QyYlwQ8hDae0TxQ
	TODDNuXWJ9YgM5feT1dwvZgGj86mWvEu+u26b6bStzlR/Baok2fxuonDU5D72EkTl99fxVJnjhq
	FXUppsGXxUsFBcRMKOHHy+n/0MVxCJCHkoFYZI7fOs2j9+8mHn5qKjKv6d4BzRQ/TggWY
X-Gm-Gg: AYBFou12btiMz8jbvm+duyPoGljMW0RhvntD4iYNUtp81b8TW/XDd+oJpXb08suzYfS
	yKpL/JKRrIF+HuxBFZUL+5nvxPLeyWFdp7ytqkshUh5oxdumEpDZKX6W+SiB6KjVFBAEhzat8e6
	yXAt6hAST2JJTdjupFmcjGa/cpIY6TsqseMx8smnb0vD5KrygwA0VC3Ye+BzdOW0v4Wcph9YGcx
	seqCriTtOajCue0Qg2Y/z+rR4i0TlCKo/6c9HmNoUZ+tIcA12mdv2qODTqI2YEF0X/52YOivnTP
	68ZmJc84+4n+qW5jLeM6UOeMEqPFP31umn8Cg3TcOZOzMWoHbgzMKbmzo+uD6VuvK/0xkOYIVlR
	C67U6cUaDTdNb3OPW1mbO7d8S8VaGRyFBItTkhuLMGnw=
X-Received: by 2002:a17:90b:2247:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-3990f890861mr6035582a91.16.1788273551771;
        Tue, 01 Sep 2026 07:39:11 -0700 (PDT)
X-Received: by 2002:a17:90b:2247:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-3990f890861mr6035528a91.16.1788273551258;
        Tue, 01 Sep 2026 07:39:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm59617569c88.4.2026.09.01.07.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:39:10 -0700 (PDT)
Date: Tue, 1 Sep 2026 22:39:05 +0800
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
Subject: Re: [PATCH] dt-bindings: arm-smmu: Document Adreno SMMU for Nord SoC
Message-ID: <apbjid_n68ySR3ji@QCOM-aGQu4IUr3Y>
References: <20260901140816.74200-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901140816.74200-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzMCBTYWx0ZWRfX7JZ64FoYeokG
 1VXtqzaWVbHe43JxqYUExPGeGfFlizUN1G73jnO1c+ZtEAKPAagidzV0bjuzNAzZVEx98D+P6xx
 eTzR3ac1JFQd/UnabBn8RgMHV96UdOo=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a96e392 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=gVtPwv5BqHs-4ipWp5EA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: dftYgDSIAuPC8IAimd__T70fuHVF6km-
X-Proofpoint-ORIG-GUID: dftYgDSIAuPC8IAimd__T70fuHVF6km-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzMCBTYWx0ZWRfX0v7nbbrPlhSA
 Mc1cVEnbQRYw0OeklnklAmuBSjc0fOlC0AzpLw0GTImKa+gTK9+0PUbcBSIlUi0R6D0myPPACfi
 LE3DEI3mFa4Q9d1AdFs6HuFFjxq/jJam+A0OPWuEFSwXv0oHWjI+lnL5h2q1d2uCGVgMkAoy8kN
 Uc36f/mZyPdJBv2xGcv3XfNCQatA90pQQybjF/8dSLMrzuURpDy7GWedoEvwtHlEtlnwUQJ7Xq2
 731ck56TMHYEGHhAD5Qr+k2edbP1xs3fDfnnWtfbEnvz+p/aVnpwfMPEGeehtjDWoCMW22RZGrf
 Qt9VJvT6fO2c0bOrSHY557T/Pb6Xy5P+vvQaiOjBVCTG5+KwCMhu//JOGK50ni4nC9H4RBLDHqs
 ItXeqgVtGFqzkgHWrm4bb8XWewRGPDYzhG3K+O1TsYK1+4gWVAqFLmMBUV6/ICUaBBHvtakJ2u2
 hED+OaHna8A0sVyuwmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010130

On Tue, Sep 01, 2026 at 10:08:16PM +0800, Shawn Guo wrote:
> Add specific compatible string to document the GPU SMMU present on
> Nord SoC.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index ffa33b7f4a96..ea338d313c05 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -102,6 +102,7 @@ properties:
>                - qcom,hawi-smmu-500
>                - qcom,kaanapali-smmu-500
>                - qcom,milos-smmu-500
> +              - qcom,nord-smmu-500

Ah, Sashiko is right! Nord GPU SMMU also has a vote clock, so it
should be added to the clock constraint list as well. Will update.

Shawn

>                - qcom,qcm2290-smmu-500
>                - qcom,qcs615-smmu-500
>                - qcom,qcs8300-smmu-500
> -- 
> 2.43.0
> 
