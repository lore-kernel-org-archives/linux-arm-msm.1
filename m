Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEB540B0E5
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 11:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786966852; cv=none; b=IC8CxEaRGV5VfANuX2fn7KcsM3vV7cLNYeknEMrdwfVW1Wjv5pm/l7BdG2M5dPTcT8gY8aHGFre4FNzrbFrq5c+8PnZ6ZI2/Kv7O9GRkaZB8uSsvn+4kKhp6zX0RFmN93GMAKwmsDH77wBqKCx+6oulERRdv7I3iGKE1Hj1zFKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786966852; c=relaxed/simple;
	bh=Y7OjEwilJrsfE9L/92apqI0vRrbbUF+OOklPwF7x+YQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hGsbIM0PRYMOR7nB4OUCs7/FNhCE2DfONnoJg0QjPiNhWEVG2hxxdVgcBtbZuIFG6gpEphCGIVUI2X1lBeNIbu12BGFbQn9SkvgNlDyNV8x2uX9srE8GrqBusG2OnE04O534msAKXcxgEs8WaUi3Vs6a/M8g0J47hhGz8SEGwic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N2dM5Qvh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ChmgoWTX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N2dM5Qvh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ChmgoWTX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H9djU82278909
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 11:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGcPbfwzVeaXPPONPxtiLfIGqQcm259ZEgiBE509QLw=; b=N2dM5QvhPUnc1rIt
	ZtMx3Hnd/cTSmFUgHQirwStzDGxxb9fg/Rx4pPgYjXRoszWu6NEo1+ZEdaOl1Oe4
	9h4Q9PELZPOALSzhjViddoyVje1I9U6FMNIbMFG4PCxTkFCsIsc+5C0lkm2ty8V8
	8oemZfMjZAMxe2YRnB0IsPpDPfRahl5MV781bcAIR77yeabKcTugEuRULhLSnaGg
	1AMj66nIDMumJRt+OTo16D41F3zlPUw1EkxLGBmAdcinA1V4RO7N6ii4p/Hej5Rd
	9YYtTm+QBVEGiczZzFvozw5snYnGLPF3iOg9r62dlntyv7DVAvUGD80HCm8Qe6zs
	lhGtyg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y778mme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 11:40:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfa45b280so8349501cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 04:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786966849; x=1787571649; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IGcPbfwzVeaXPPONPxtiLfIGqQcm259ZEgiBE509QLw=;
        b=ChmgoWTXLCUiiNA8T8jALmrhy3WfO/sC7f+rzNCsWZB9n1sowhRJfNwk9h8vEyeyCs
         mVT91cRAKELmkAEuHeevXVkd/RZ0dXp1/wVM5kHJQlc5+rWwBLb8wKtP4H5RhaNGCn40
         NOgIwmLbu2thAal5xI6/GGEXaScTdmtor4BNWcf8bMAbyXKyblteTgO6baqkjmDgZDd7
         ujC62dvfNxc0m/+A+7yY5okQb3nW8JZMXpB9Y/mLBx4RyXoDcln4eQ9F6kpbXkJ7TfHG
         uWLvPkD3ndZql0BRy6DKzTWZVed87eZxAjyTbwjZ6EEOg/6MHgQ5za3v1LX9aDFfJfmb
         3O5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786966849; x=1787571649;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGcPbfwzVeaXPPONPxtiLfIGqQcm259ZEgiBE509QLw=;
        b=CBWi0XrbeLlexW/59vsKt8Uzqj6XX2OHeXDLH+Qj1Kae6gMnGJ8bgf1IO59ZVH01hE
         vyodVt6w0gS7qop8DnyuD7+IX27IBZm02AXX9ArJAKEDlLXygV3Va4wkputHqZcoAQJv
         3511d5Ma8t/9RuPbSIixOZzM5gsA0W5ttxrurzCqCKBCvmzQvlrvPh6jVLj041O9axoR
         WxkkXqgWW8als1o/aedtgyEgrTIYf5Z56NaIAN87xZbFN3tfPDHfv9anghfBaNulPoQU
         B/Pv1ISJJdiui1csJ6ZD36CxiIQTvtIF1hqNJZi0cCr/CqH2oi5q5rLvuKggYbO++uXK
         YdZw==
X-Gm-Message-State: AOJu0YyP7bVDGiue5+7cgrZvnGvGH8r4tCWrJBwACEnBBZwWflIqlVUC
	f79AwdalMW22azoSIoXGkidPXZXOlpDUm5C899wqAcjfI4FiDMrFr90Z5HDFTd07Xeep7MmFyJ/
	SM6r8qUn7UT51rHRTN7mo0etsU75t3C55qkURrqNBjIJzhLN+FmJ1alWkv0pd2UPQaQGu
X-Gm-Gg: AR+sD10lnU2OS4JPoEJMvk6P2DQzI8nqf6F32s6GpMqEcXnbrLI+9cNi9bliH63S8mN
	H58FpqZeH2rmKbXpJKXt4M1GoRy+01876jPvDWkXvWFX9mHSgi+ZqXCqVfIfkvjzNinn2gL9QQr
	ZxI21yBFfMyvm2sC8CK1Or2iR7VkdfjIjIdvn86OaVsyC9Qvex6tqpwykqG4e2ewc0NqIefVeaW
	oDQvgKiQyui0MJW2mSA4icuSLZ6z2ym2rJR6WRYSxy8FghatUmKH9BqtnZShkem9U4GRVXtSjPp
	uNuz/CSrox4K4FUWCwQU2wwmbTVHSQnq1SnN3Mfc60bFK3wVa2pTJIB5G5A8JJGtLxPNp8mhcLk
	VW0turxkqOjBBZ2KosjMnvR8M
X-Received: by 2002:a05:622a:118f:b0:528:1ea6:eaee with SMTP id d75a77b69052e-52d852b4f2bmr165577541cf.1.1786966849235;
        Mon, 17 Aug 2026 04:40:49 -0700 (PDT)
X-Received: by 2002:a05:622a:118f:b0:528:1ea6:eaee with SMTP id d75a77b69052e-52d852b4f2bmr165577101cf.1.1786966848755;
        Mon, 17 Aug 2026 04:40:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d8588499sm543504a12.14.2026.08.17.04.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 04:40:47 -0700 (PDT)
Message-ID: <08bc7c0c-4e15-4e76-8ed0-34dbee36a6ce@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 13:40:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] iommu: qcom_iommu: support non-TZ-managed instances
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
 <20260809-msm8974-iommu-upstream-v1-6-87f5cd492560@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-6-87f5cd492560@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA4NyBTYWx0ZWRfX/BZmjmnjDxBr
 6mzNCCIekxyUujBkEcARqyq75BYrtEZ07qHhrTFonOif9Xl/YVbVZn8xB7ClHfoFG4U1iWfL6wZ
 Zzyxsn7sKR9Mlu7CRusereQnZXQ7m7zqmR7p7l8Ucl2AnFV6JAIiaN/ZIHYMcrBOb96jAQLzsNs
 27TFKMnohxt1Z96qm2RvmOVFjz2eibt9s/R5Yq+D/LSVYsptmZFj5TVAUi79IVVbU4uDeweS0RK
 BwqBzq8MPsXUemX8tUyjeyKydvcsFoAFt0YrZPaaoOFxaQCN4wrcBdtrnowJV1ACHp3ImdW3PfB
 sIb3AcFiUfignfn55Uvo21h/fvMCUyWLA3450Q4r7V8BzA+9J6sqx25iZoHrXtJW4o8H+yLuFsP
 ToQATMuXdtJQ9e8QL8MmFFo3fU2C+yvVrwfMfNNvjExj1/SoWPxk7OX+SV0ZM4DTFsLhAKjyQs5
 3BIutLqQEFCnU4hNQLQ==
X-Proofpoint-ORIG-GUID: C0xnOxqGYohPcbqcP1aHxlFZ02Ak9oEJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA4NyBTYWx0ZWRfXwXSCoQrkxpnB
 FdsBuK0W2gW/uyew8bMGeEbKxIs9Y5WqOHn6a8SWhqKS9/QUige3tvfyTEJN6VB+u3eTkz4gtSa
 XUxaCUlUW6T7hZCNhviOWiCmcbW1w10=
X-Proofpoint-GUID: C0xnOxqGYohPcbqcP1aHxlFZ02Ak9oEJ
X-Authority-Analysis: v=2.4 cv=WNhPmHsR c=1 sm=1 tr=0 ts=6a82f341 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=DBckZHbuUVvodCrkklsA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170087

On 8/9/26 10:15 PM, Dmitry Baryshkov wrote:
> The GPU on MSM8974 has never been usable upstream because its IOMMU
> cannot be driven: unlike the MSM8916-style instances this driver
> supports, where the secure world owns the SMMU global register space
> and the OS programs just the context banks after a restore_sec_cfg SCM
> call, the MSM8974 GPU IOMMU is not managed by TZ at all. Nobody sets
> up its stream mapping, so attaching a domain leaves every transaction
> unmatched and the GPU faults on its first memory access. Verified on
> the APQ8074 dragonboard: restore_sec_cfg is only accepted for the
> secured instances, while the GPU instance exposes its ID registers to
> the OS (IDR0 0x78034404 / IDR1 0x10000003).
> 
> Add a non-secure programming mode, derived from the downstream
> msm_iommu-v1.c driver. When qcom,iommu-secure-id is absent, reset and
> program the global space at runtime resume instead of calling into TZ:
> clear sACR/sCR2 and the global fault state, invalidate the TLB and all
> SMRs, install the per-instance stream mapping (SMR/S2CR/CBAR, with the
> downstream MEMATTR/NSCFG/VMID/IRPTNDX values) and enable the SMMU with
> fault reporting enabled and stalling disabled (sCR0.STALLD, matching
> the downstream terminate model). The stream ID map is per-instance
> configuration data since it is not discoverable from the hardware; the
> SMR index allocation keeps ASID == context bank index, which this
> hardware requires (downstream msm-3.10 commit 4d92ea10aac3 ("iommu:
> msm: Use CB index as ASID")). Also set CB_ACTLR to redirect cacheable
> requests to the L2 slave port, as the downstream driver does for every
> context on this IP generation - on MSM8916 TZ owns CB_ACTLR, so the
> driver never needed to touch it before.

At this point, would it make more sense to retrofit this atop
arm-smmu-qcom.c given all of the differences vs 8916?

Konrad
