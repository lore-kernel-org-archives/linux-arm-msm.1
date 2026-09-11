Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6877C39B960
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 13:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131996; cv=none; b=HPF4zkrMHCq8Zpx66QPG+IJH1yYqkdB+JciAy4xU17uYpztgAcMpXbEfFrqzLsyOSkTVJW/bdcnKerPQAMhy8/3CuvKPHO8UBBxvW46Tjj1OrhyL3FHLbFVAAXPYYvZk1dD++HHQwTsOwnp82Rhgek2QgcDOEctm4QohkRnkxS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131996; c=relaxed/simple;
	bh=qICWKUu737Ia1EDZlzujjZzNrdGaN8xhxK+YsoZGgjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GSbnQkWeEC4EfL/UCdyZtEEnn/Sp8KUddMbpkWlpd7EZJUWWTiTQ+y6OteeqCBTuEeFrdD7sddUZYqIgV5t1IFmtRTXZ9q60liH8NuwAEdYB2YlOG7OeYBcTLWYKneBmcV0u+5SMZN3KmNpHG3Hvc4mP2u1mIr4mNxn/wOS2P+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lF1GvCoW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=it+cGZpZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lF1GvCoW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="it+cGZpZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCiTlJ815072
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 13:06:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qICWKUu737Ia1EDZlzujjZzNrdGaN8xhxK+YsoZGgjo=; b=lF1GvCoWCkpCsvKS
	9ue1lQ+CIgIApluEwM92BCXOT6vpzqc6JK0lNJujwC8VFNZMzucNtcILzSoJPVdT
	8AirGO4CpufyG49jS2BdfFrSVEPEPc7uhn/GQF53gWKTXlfLAtZJELApv9iih5LM
	aS6XqsEDCXDbBz5poekLiG0ASzvVuo1SZLy2GFD8eCV7E07o+iwoehhOS+fuOJjW
	e2nO5ckeXyhqXXDGgCrhPQjTu6qlxkuJZo7c/HYuglPm5h/qxDCuPpG6819izlSw
	39gyO+Lx074QuDOdHxGQ7MztdTjvMlHu8fgqqPGN29QC51iZQ9Fga0XubfX/Gar7
	Ca0ZEg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd39usc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 13:06:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so1756244a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789131987; x=1789736787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qICWKUu737Ia1EDZlzujjZzNrdGaN8xhxK+YsoZGgjo=;
        b=it+cGZpZ9GWPpVNXRl5RXbHeddXHdZtXDbccp2dobjRhqD7Gtl26Z440eRQjDngVcE
         3/7IJ+vIBqlLVYb38kyCk3kXkwLqa8Z8yQ+aL1LXrFwUlQEC9RE+EL7MKrnMYsia+1An
         K/gdt/jMLF33MCTO9q/ZquxgzhDXSSo5GLpSXGkRjZCOTlSC7mK4AfNDSxkyDg0qo/o6
         cecMOVfuJx51qxINiX66m6wsbKLoVijfEgfBC4z2iORmJUruiZm8btXkgJYHBgitmzY7
         cPjq89xbYCj80qJ6juIt9Cb1sON6/o15gu53TJubeBKd9U+eVmuNyPF+ux4tIJ0oc7/N
         5IIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789131987; x=1789736787;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qICWKUu737Ia1EDZlzujjZzNrdGaN8xhxK+YsoZGgjo=;
        b=Gg1xzK+/frcwLm+2QU746GTCHeeXQz5qNmmRQiHUwZ64Yh826o/OmenT9q/emgdzC6
         WmggfiLfyaQ9po4o8MovicepZbIuP07xATXNKAkyie79TmhEHNaKj5EhG2GYnrhb3gbv
         avjKSK7p9oOf234Pp5lAC6t4eI0u22R0vP0G+LEYvmWhp5O+GRoIw4UEHFIHHQCp2jw3
         LGGw3ohbgxiMvm/Hg8T8xY8ZeKud2ljZMby0tOevxuPUlRsVYVkdulC2U85QrfFE/YJT
         mrUp6HCtb8xBW3jMRz35hzz6I/g0hj5LsBL5+6Hqy3DkR7A4KX0+gcx9SdNvAb/rd6/i
         CxwA==
X-Gm-Message-State: AFuF++nQqgzDpJqdqLfFnOfxfG99B9X/7ZHhvTLqmQFuMmdS/p+8u3yz
	Mio/zxyHHVL0jFQQGRTVZU9vr5fFzjp+gHX4LBzd3z/FnLJnoj+9rW8CRRnuSwOofkeklOfZUGn
	awmcptKUnHbwr/c4AlBKeVYc6NX+g2/SlmL7Q8cvSlO6Y79zTLfIDiIo5FyTUMn17WorX
X-Gm-Gg: AYBFou2WrnNlP6KEMfI40kb7O25bAbRqIrjGD1kpDqZySOEAz5XofFQx6PMV6pUkIsk
	0rodriQfW6BS1ljkWPXDMP7Ju3HQDgdprshCIQVBgQlfP+xrH8vMIA9dG48gCJntot8g9KMoKJ9
	gNgc4pA1MG/FWYJ+hmlmbFldSpcP20KzdT69RmfRVy4P1nCc3p1UWjcgrqqeF7u7MCSLYrQPkX/
	1yac+XLBRYTRW61XYfZ4nWyPbgt1y426V1zwztN3z5o+weOT+1E94hL8AaL0QV7FpjsfQLNrpLA
	Itd5UAWYnuUbZJNriA0+GgJjyQRjtNhusBGyL10Yq1uXEklNM5ACillhDfR2MClQYrMP/oZ8LLl
	DMvx70Ba21hwCBzCWy50iwKvbp9Dm
X-Received: by 2002:a17:90b:384d:b0:398:e1f4:bda1 with SMTP id 98e67ed59e1d1-39d9c22ccc0mr6566244a91.21.1789131987257;
        Fri, 11 Sep 2026 06:06:27 -0700 (PDT)
X-Received: by 2002:a17:90b:384d:b0:398:e1f4:bda1 with SMTP id 98e67ed59e1d1-39d9c22ccc0mr6566169a91.21.1789131986710;
        Fri, 11 Sep 2026 06:06:26 -0700 (PDT)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98a58d23sm5906289a91.2.2026.09.11.06.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 06:06:26 -0700 (PDT)
Message-ID: <1d556871-2a93-45bd-9e37-d35f48be0291@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 18:36:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: llcc: Add LLCC configuration for Nord
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, zhangfei.gao@oss.qualcomm.com,
        shengchao.guo@oss.qualcomm.com
References: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
 <20260910-nord_llcc-v1-2-30fd1cca65fe@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260910-nord_llcc-v1-2-30fd1cca65fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Bv8IUoX5 c=1 sm=1 tr=0 ts=6aa3fcd9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=OxrQ4fpuk6iiGASJZ2MA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: m7T52biCHLHORNgVEQ_xkm6SVg1R1Lse
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE4MyBTYWx0ZWRfX8Hcz8Q3GwDZs
 XShV2zbP25nChfumPw/lmwpPhde+wHj/3pRMCAmShMay3bw9tSbSEdrEicyWv4lobitQR0PylOZ
 4gBGz2Ob7M2PYwjaciB1ZCncDCGN//0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE4MyBTYWx0ZWRfX3f74qnTY39qI
 0PqKEGdsjBY1HdhRgV5X5+ote6zTKdZk7tmqkMShH9xEls5rK5FAcblrRYM9AEoXdYaqgS0zUNB
 ljhCRBg/61xmlN0uwXCFgzvPekuYjsAeCIJOmeryUgJvUA4+o2XMtLmD9l5CvzunQgJQJMvWS/I
 TTxu1sqxNdzcG9ONv8asUiZxb3qR6QrPC7nufu0mCekpU06vl7f4P5skYr6R7fT7Jbsnp7z7Jn0
 ulV9nwOHvvTQS1wXqnIgvHTUAZgtvLWcv7pFo2JBaoUpoXSMUMz6kdkczvjOHMLg1EvtctDlOaL
 W96C74PXD3EP3zHFDXB+ragUpSWqw69Uu+mA13e59XuTOCumXOlJ10mDwbAHJ4EZe1oSED1jG5r
 yPDDBroWf8gqt3coT1ApLlexQBmnXIpGP9CbKSeZ9YLhjY2KlCMf5ozHQznhKM+UXBGVR/ds1TU
 KfxMiccipz8Vie15CfQ==
X-Proofpoint-ORIG-GUID: m7T52biCHLHORNgVEQ_xkm6SVg1R1Lse
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110183


On 9/10/2026 6:30 PM, Anurag Pateriya wrote:
> Add the sub-cache table for Nord, derived from the Nord AU (Safe IVI)
> SCT table and limited to the POR use cases that have a unique SCID and a
> usecase ID in llcc-qcom.h. Nord has the CFG0/CFG1 pairs and the full
> ALGO_ALLOC0..3 set, so it uses the v6 register offsets.
>
> num_banks is set explicitly because LLCC_LB_CNT in LLCC_COMMON_STATUS0
> is four bits wide and cannot report sixteen banks; a wrong count makes
> the driver map a bank aperture in place of the broadcast region and abort
> on the first broadcast read. no_edac is set because the bootloader
> leaves the LLCC EDAC registers locked, as on Glymur.
>
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
