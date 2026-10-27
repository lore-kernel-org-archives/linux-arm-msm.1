Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114761;
	b=jBQLNb3dAbtO6RlJo9AGzXhulHu072+UjY1K6E2Lrb0wHwn7U3wQYbvKHYUDfQYe/9Tt
	 Rnc3tHfaAGjc4HwrTv6o/QtIsbNtD+9IF8vxRq25YX1EfWXSTWAzwTSf1kdB6lD2HwPj+
	 XGbF1MABLHIfoV/4AnZxZua/tCjmlS6M9FiP7oaOKITuYpJjxKhQRpMbrHzSoRnwcTqIh
	 vFT9WBlt3LpBbzQYHN6b0UmhsAavracEZntfkqE09k/Q97z95I9zlwq5Kec/O73hCmjuJ
	 b95kuOj3+iv0xM8WAHrMzZzsN4oso6pPHWrZuUfCrH/vCA+q2/AboXyMAF8TEH8gKow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114761;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3rkZRJrRIMFJtHN7Q3UeT/+V0Hg/1Tzp+aXrMpL9biQ=;
	b=CRaMvYm+iQlQM5BDkxKhNaZAQ4AoXHpmUS0fKlMHmh6Uqn6dkVs3mcvtMlWGADS/MMXF
	 TkkWOJHIICPwjlwaHxPb/4KRjATWqnlD2ag3GcwlCPKOhWj6m9y2KvmzNnPbZKG/rxJno
	 oujZ/Ha2usfdvd8GTuTFuFPZ5Cu3Lun/K0O6bexKzG4TjQrCUnpvoh0jScbcXREWr+J1a
	 pxPUNFLl5cs9yS6Dd8ZB1zMCygYDCY6XiB5t/XnwPd85NiG8mDoFF5rYyuiHYtOOVrKpi
	 8ejE6yH+V1dVx+zRhxOmvIgUV1Ffzlkq8sI3NDAt9YP3ndVi9vh7ixaQtUi40fglaZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IAaIK2LQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fkp4aW73;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60915606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60915606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IAaIK2LQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fkp4aW73
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFL0rb1061078
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3rkZRJrRIMFJtHN7Q3UeT/+V
	0Hg/1Tzp+aXrMpL9biQ=; b=IAaIK2LQuupkR0d59j2dTJm+872fnmF8tN5tK2Xr
	BfG2WDrLVt7h1AjTVsw1xQVvprY9JX1RxBF3ElYN468tPBgRK6zcxYQtFj5lgMl8
	3dUrOhOiTkDdlkQpmwQh/b5iS0cxC04dBp+MBy58ne3n4e3P6IowIa0KYdh6A8oc
	d7zvM3+ZDM7ogysqSNgiTc3CLjQ2gat742hsLgCBVZHzZnFJmcgcCiZvTX8BbRg/
	WEj1P+vtl/uUWzjxmSK15CujJS0IOXjMkmxdT8C2zHmyTrCv++PfL9nM2jXFoguG
	fdvbAekl7osBdnbF5Y/0x5OvwUVCpV97D+1zIBxMN4puXw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54mhkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:26:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf7856ffso1015789685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793114759; x=1793719559; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3rkZRJrRIMFJtHN7Q3UeT/+V0Hg/1Tzp+aXrMpL9biQ=;
        b=Fkp4aW73Ic93TMynKTPrKZOWzU7Ez5GK/sQazFdXjao7jUGQR40JtbfiyZKrrh2Q1u
         rlnTVyIb8zHJFPCbOZguIaXGBaZKoY6Mhy3UuAzKC02LZAj73/fGIQnskVvPkcpQI4Ot
         hvi+hBK9QsPODoIBEwXK75rBjCpKvKPww69mJ0j+VgoDiToSYUEg5pybZgsmKg3+nT6E
         boWfP63Yf6Ow2GGnpI9k8fbkRxWU4UuElMDVK43M8XdoxUHbZndvZJvgw/fuiPyAxfqP
         1wj7JenIjl814XkGx+FS/RiPNDOq92R9/wZJphVOecoejXrtS2QMSQn6X4Sb3/XUPxKz
         /xVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114759; x=1793719559;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3rkZRJrRIMFJtHN7Q3UeT/+V0Hg/1Tzp+aXrMpL9biQ=;
        b=lsQveKxpxj/QbXjw0Yd1QZ1mVrF3WaOLInwmrUcDxzHZDi+qNNg3st0WDCJSiGgAO0
         jPCIn17+Oe1DPhcfrBbr95tff4NLeF1ZUD3MbsSChiGuu+FmgKOie1TwqikOjBQaG0mc
         cHu9Cq6KLBpXFgxgYm5FUOH9+R/NLrFAFbXcqjJ/KP+s/SpH+T4y42XBY8NAFxbmYFcM
         lyvWGFRJw1glJsCRyb5rdXrBpQB6WL4JCuOBUOtnT+o2h7mukLXqOPIpPpKGHl8NjOPl
         UL/pp/bVuXeH0DlkYHeckmtwG3mty+dAZt/mhGQLY33jKsn21C6oYLDwOSmtG7d0k88t
         T4cg==
X-Forwarded-Encrypted: i=1; AKwUvByBGJlaLT7VhBB9kTaO6bLju8iefwkREshLIaJ1MkR3DFK0cdy9fkHBrSNA7I4tqhi9IC2DSInmpQMsHTen@vger.kernel.org
X-Gm-Message-State: AFq9FYLUixpmeBrjlWEICoM5fv2g41JqrJqQqI0GYkK2HMgE69awwBkc
	Pou0uNiXTxYcFLZf0aKcNguuvdLvu09ldhmJP8hoXEG23m2mCcw95S69700sd32jnK/hXAok/cT
	K1Nt8cyHKRgBUKsd9K6VAG8Z56CzeuDs/Ktb3VhFN9lKWLUuvNvg0pwljsZ9uAFSSoGqv
X-Gm-Gg: AYBFou2fSiMlq+vuerqqkZ02PHkhiDnZ1wRkaP0Ee3ZZcPRHn0VNKRWotQTz7vlQ+4K
	RsQcM+kQ2Vlx+Eo3dO3L2HJYGEkccQRCsO6bgvbYdGbsmKnuB8x07giPKnOR0brRjljMchhlFhq
	2P+zeRdBuBwn6uOhCl2pXzPO+POEokEfKoe+1Huzc4UiQlYWR/Ge7zehw5BJ4AmgHa6XMH/h+kP
	bUe6iuvzYHpUW2yki5dJWbo+B4Hqu1wg12sPBvbpHRcmdIcpzlp7mr8NCrn1ghRFKAISEA5G5+w
	4HGbiVp8TPYcQ/4gZlFPE9GjfIZ9watsBt+NVa2nIerXBbJVXK5r3VaL2brFUQzm3i44tljMGIv
	Lh19PfivtvkDW2maO
X-Received: by 2002:a05:620a:29c8:b0:93a:17c8:a1e7 with SMTP id af79cd13be357-940ef8f0f5bmr1573173385a.44.1793114759006;
        Tue, 27 Oct 2026 08:25:59 -0700 (PDT)
X-Received: by 2002:a05:620a:29c8:b0:93a:17c8:a1e7 with SMTP id af79cd13be357-940ef8f0f5bmr1573167785a.44.1793114758351;
        Tue, 27 Oct 2026 08:25:58 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm288934095e9.15.2026.10.27.08.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:25:57 -0700 (PDT)
Date: Tue, 27 Oct 2026 17:25:56 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mani@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: glymur-crd: Move the PCIe slot
 supplies to the Port nodes
Message-ID: <w5wuuxf7pkjp3lvlmxh2mek7k427pod2ldirs4fwcsivigngtk@aorbeshgymwg>
References: <20261027122410.62219-1-manivannan.sadhasivam@oss.qualcomm.com>
 <20261027122410.62219-2-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027122410.62219-2-manivannan.sadhasivam@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfX4czOqQnm0DSz
 PhE7o/4gqEtnVBDtvLSJJLZYXQAevunyLKuA8qgrr8qeVjs6uh/bjYq/4ocYrqjfIcGYCa4Zthe
 Xkq7X+6EZfukBS0BY0IESl5bJCR8E8k=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae0c288 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Ibfqn94CS5QR_ObWptoA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 141CXtHszL4ZFgWLvWfvGvTaqJf9ih4o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfX5tPYVJlDufIw
 /+BYO6hmKkkaqaUUax1cnDO2L6z1HlhooiKp5SJuVXcuiXhguBjl9x9EEfjV0wXOCznANYBYKEX
 JwFmXCcijgo+A/J7xxvNOAG/B39XZaIAKB8IHhhcwOSd1//ot6afV9xuVDoLyGiP+ZwyKOuJTQc
 gC3XUjMJ6YR4qrMBM/RZdlfli4fzl7ZZGBdaFE2btyLVyeQVYwz0VfS1VEtOROCD77BxJWP0ymR
 XIxTZVULSXlt5B1u3y7VIuVATUn67GaHkaHdeICqJ1Sel4RZ+1kNoAfzXOK5gqI6ZaQcrz+H/LN
 v6fDrNVW6igKrii6llAlyrcAY6aCu0Pc4S/9x7iLu91U5ijJFfRmBKRGES6zG4+yrf3357gZp3P
 fJ8vT7NneCpCuwwP9JwY6K5LqmRz+6qeFR/gzq2ie1QSuzEjS1v2FWRrcAc5zfEQLMGjyQtTLur
 hbwDCDXOWOmRI/LXXZA==
X-Proofpoint-GUID: 141CXtHszL4ZFgWLvWfvGvTaqJf9ih4o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270061

On 26-10-27 13:24:10, Manivannan Sadhasivam wrote:
> Since all controller nodes have Root Port nodes, move the slot supplies to
> the port nodes where they should belong to.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
