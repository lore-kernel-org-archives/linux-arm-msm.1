Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6352F290B
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 06:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784184464; cv=none; b=ltOCjAIngImIBOWfXiL6B//JPnQe53o8AQzIRvaFb93p4QJv4Qrf3ws6L1/D5puRQ8hc6zyuGjG1o3AR7ThVeUohFX17yaFoX5GTAvGcWOzgnINeuO72C55n3hmg3ZrS0YDvh05rS/T9W7VOz54t542hrihwsEkewTacRGro0e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784184464; c=relaxed/simple;
	bh=qAMiaXRikbhi2a8I0S//Dr1NE46jknV8BsFBBvQxi+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MwUt2PqJTZLfMh4BmJefDWVyWcawQBlpBf9fjxSQNpKbVfOweR+2tQpMNckWOXX+BO1HqVmzVmisOnB50rv/vll2cUZnJYhwlt2bB4b0pPqVGsO7xtcxbbuq/MT2E1fOUtLTVfPIi0Uw9TaH3EK8HHWqfAkqD9sYTjKCRQFT4bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TDjrefrn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SfwGohBw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TDjrefrn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SfwGohBw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G404wQ1677600
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 06:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YaE06lxzdsOzAYkYeqtz96/h
	FbOKK6JdCC8M719sNGc=; b=TDjrefrnOafTGzCWgD/1CRYrVElUVPHJYp4GwxhO
	cKmxYv28iEGbwooY4Py45V9cA3KknPHlUfPGxtz5U82LnSN8fdpxnvW3SrHT1TyU
	y7joCi7MV/e1A19G2BBuN0QJTBn15yv/TQtxrQTITXetpka6oDH3qZSEb7wrO2gT
	Viv3eWthuyQUjWtF9FIEOnaA2SpPJfkrLLX0duAB10gvLsBDZ/HqCEaAKlmP+3Ou
	HKp+mrKnIQ8kOAxVKHDy/wZZZ0ntg08vxo+9RTnXnIhES3gB3x/nwecf8tH60/aF
	1cl+zti7uyh3+voVWXT+6DZMPPYqfrO3q0bunBTy8wV1FA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feeg1jf8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 06:47:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so121857025ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 23:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784184461; x=1784789261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YaE06lxzdsOzAYkYeqtz96/hFbOKK6JdCC8M719sNGc=;
        b=SfwGohBwf4+67dZZ2AFXpb90RcO84BzM6bO/RT1IkoB4QIWTcXJ3NKK6KvQ6C6u6kH
         x4YSy+UxhsU/GR68gZHl/5L/Qoh/zmARuJj4tFdrbWD9Y7/iMpRQPvk9H8C8IUqt6FM6
         c+dQeqx2TWDmrZqZk5dV53oQLTwm1PBwqOYR/v3bhVD9ngfPY9hS5mj0mixSJm49WGeE
         yHcxTj9MRs8MvRm/p55UIXnoYN/I3oDNaWZGJXTb0+9QVRDY7Iu5nEcduUHfu4tlUBE1
         i8JgY2plKxNxmLslPFUftiL/IcpjIVJuuO8cv8IH2DuHx2n7K3EvQjAcgoW1BNi5RHqo
         whxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784184461; x=1784789261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YaE06lxzdsOzAYkYeqtz96/hFbOKK6JdCC8M719sNGc=;
        b=amRhv4BT0zL/TK1lzVj8atcSwlcjPiCtin/OTmBzGHL7Yifl1f0uxrYfkTra3Hr4B8
         pNISZ8yGtVRVl21S5kEs4r/9ZSn2AUyBzl6ixZwiWDCsXvtJb5XT+FT5WYfqKS2b4Al5
         uo70MiuFD1kM7s62/94LDqt2zO+RfdfmwAPqHK05IwNxnH+5sQIJdpD6Mu4JLxMO//S+
         d7wEyz7ERQ1/hEIiCNg3PYD0D9xNhNXXC7TpuJDJO6pmd+bkoaXVWpiW4nYmHthoqWo7
         xBWfLLASBPSyiTZYmRvo/2e6agbLEIPxRv+zrirubNHLgUmUuYhsfMG2nF4N/7PRB06c
         o2Ew==
X-Forwarded-Encrypted: i=1; AHgh+RraGNjBRRde1G4kYLZlIO1Lsh34QtwVGoRZQRFU4MtkFrp1gAbhzmYM1Aqr4Rag3AvgpXy5wtplC07mEWz7@vger.kernel.org
X-Gm-Message-State: AOJu0YwdzjYIZ73ywk831V2SWQBpEenVvyKwPkLAaLbK5ma5LRrkWVQT
	gIXxTR3geLVP4PZQ4Wxjm8fnhSPMvjdqrMjk7S1+fArq5cPKwyt0RCzexmFBppSNEIqfHKQSmd0
	8g7dc8yoW4dvUJgBwwdF2tBXfpaGLwCetz/e0mlJODrVlZQ2wf59b0g/FALFoUw6+AzJg
X-Gm-Gg: AfdE7cm83iDocPZi2q94N1uIXe5Jx6pCnuw5PSCBqWyiuCkRdZ5hWZPsBXZmxO/v8ZU
	dhu0UDmBP6AG8bF5cze9fsvq6jjF1bLFW70b1L7A+TpMAGfg09nnUNZ0VIVH6dqv/OX08hz0kHt
	QWlDHptk6IXT0iI9ox6pE9mxPewRcheo1mPe3R5Zs9WWbgbbvCy77yA+vo2wqnlw+o7xuPGKoPP
	e70xFgBjys7CcJ80L0z0ZfyXKxmGwBVUQ4npDdflTkNsY7wm/FJNyS8GRKRS3CBZjLR1iiXUQvU
	VTpgpFUMcQ4i+mUd0UoWra3CMjnrcjEkG80GEveHSW3JGS2quFfzTy9k+w30NMwfg4KWRykVi4S
	NZ6V1od5aK+HMdlCtGDBfpJuhgSA=
X-Received: by 2002:a05:6a21:2e14:b0:3c0:9c19:65c0 with SMTP id adf61e73a8af0-3c36c4c567cmr6578855637.72.1784184461041;
        Wed, 15 Jul 2026 23:47:41 -0700 (PDT)
X-Received: by 2002:a05:6a21:2e14:b0:3c0:9c19:65c0 with SMTP id adf61e73a8af0-3c36c4c567cmr6578813637.72.1784184460519;
        Wed, 15 Jul 2026 23:47:40 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6e9edfsm8110337eec.28.2026.07.15.23.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 23:47:39 -0700 (PDT)
Date: Thu, 16 Jul 2026 12:17:33 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Md Sadre Alam <md.alam@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Enable quad SPI mode for SPI-NAND on IPQ RDP boards
Message-ID: <20260716064733.3nzgioduu7kruglv@hu-mojha-hyd.qualcomm.com>
References: <20260716-quad_dts-v1-0-74d86792944a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716-quad_dts-v1-0-74d86792944a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA2NyBTYWx0ZWRfX6c1LbODWE5un
 jcBX6viwmYwWE8Ja3mpJZqPhb7cSehWSMtivAgwu6VAPsGaQ1kQOF7YRKPS4mrEPTPbwJ+YZujv
 9V4vFwUjB/XvfBV/8YqCcJFik7PLy2mfc75x/slOByEVh4/aXCyzjIUIB0845AzElGbNJwEjWos
 YG91RGVozIrZ3v9aRFlZRVmFXPaRhETyZevjShqDmlTER4Zy42Dt5d6gd/XdeDO+XlKHea4fH5A
 IcgJgUS3hdP0lOin3Nt2/YmXpqnw9j1Xc4KlpCycvDcuxO1Mt4lkcGSGBEZ9ZU9RtRMH591z8Gw
 eQUkhHy9Ezp0YHj9674oaYG7FZohq7lSeyYqr32ZvqzI+s2ZIRceaDLXApZ2xOIVtcaDmWapS9g
 1i0BKSkZ50wwjxBWN2CzWvX6X35QdiKHUnioOZ0Z3TXwmfjigRKhQ6g5mn41u3dUQDBLxJ6wjl9
 f81yKJz1Ywk9ygpy0yw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA2NyBTYWx0ZWRfX0l4t8MzFsw8U
 tQc94JBwE09AS5zYNNgqv0fCmMi29dNuCCKnUUBldD8o7A3fxHiFcGUiP/fwLfLSqFDg/NgfJ1E
 nCp0ImttB5A4qdUhk4komaCdSGtjzUc=
X-Proofpoint-GUID: DLzB0AuhX--E9VurDM4Y5-I7VLV_GSF9
X-Proofpoint-ORIG-GUID: DLzB0AuhX--E9VurDM4Y5-I7VLV_GSF9
X-Authority-Analysis: v=2.4 cv=SsOgLvO0 c=1 sm=1 tr=0 ts=6a587e8e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UvOjeE5WzWDoS12IaKkA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160067

On Thu, Jul 16, 2026 at 11:25:11AM +0530, Md Sadre Alam wrote:
> Several Qualcomm IPQ RDP platforms support quad (x4) SPI transfers
> between the QPIC SPI-NAND controller and the attached SPI-NAND device.
> However, the corresponding device trees do not currently describe the
> bus width capabilities of the flash device, causing transfers to fall
> back to the default single-bit (x1) mode.
> 
> This series enables quad SPI operation on supported IPQ reference
> design platforms by adding spi-rx-bus-width and spi-tx-bus-width
> properties to the SPI-NAND device nodes.
> 
> The series updates the IPQ9574, IPQ5424 and IPQ5332 based RDPs.
> 
> Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
> ---
> Md Sadre Alam (3):
>       arm64: dts: qcom: ipq9574-rdp-common: Enable quad SPI mode for SPI-NAND
>       arm64: dts: qcom: ipq5424-rdp466: Enable quad SPI mode for SPI-NAND
>       arm64: dts: qcom: ipq5332-rdp-common: Enable quad SPI mode for SPI-NAND
> 
>  arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi | 2 ++
>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts      | 2 ++
>  arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 2 ++
>  3 files changed, 6 insertions(+)
> ---
> base-commit: 19827e7930a5511c68e12aac6e4522f3661a1709
> change-id: 20260716-quad_dts-6bac0484c08c
> prerequisite-change-id: 20260716-quad-ec2765317214:v1

Above does not help.  Be explicit here in the cover letter by
providing the dependency link directly.

> prerequisite-patch-id: 912ede01168ddf0476ba69ab0db786186073f817
> prerequisite-patch-id: cdb88acd348e7dc5136fa9b94cc06dcafb0f478d
> prerequisite-patch-id: 932ca3dc3893df6de25928b24c7c24550907088d
> 
> Best regards,
> -- 
> Md Sadre Alam <md.alam@oss.qualcomm.com>
> 

-- 
-Mukesh Ojha
