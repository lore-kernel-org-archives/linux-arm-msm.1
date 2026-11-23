Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462935;
	b=FzZiNV7AxkOuW96DA1bOmsyqdvNIUnSdAQuKPHgf3lkWdm7bAHK7SrhhUBaN+GZFM+OR
	 cEiOektkeILw3rSwcBYbJI5TpRMdQWW9fsvoBMPe0o0Axf3tGXz1C5wPyKzLXgfGeLNsN
	 k3hcIiCU9U2I0UlCAF8v2WITKNzf9rRb/RoRpKE43QPwiBvjDllKVv5UmsoflDhysk3rZ
	 il1S1E6yW5l8hykmqvfrzg44xM1lzeF6mJFq2MDicOuYyC16a2UIkwzEclXLYQkDPnNHy
	 qe2JgRk5zkod6AaRqYBt0yfeW/GhRQCtYmOMYQXn1MQDrsmJtNvd3I6AWilinFVe/DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462935;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TiJHHZoWYTxxWc307M21mACD+manX7RHfmlFNEd6ixw=;
	b=Ab+G7/qlMiV70Riu1AIOOFgyITejuRSVgpq8yVtt8lbt+rTjAiMubx1f48ZRabx7kBom
	 1tX6FHiuAOsnHXOJTplGhAqm+smT8Uk5Mt6FzaylH7OQIDTmdz2jwsajm/Dq3dWIGp+B6
	 Z9l1sHnDu6qVETIeFF7FyZ01O2jW8KKj5qFlbUA01qYWJKUYRJPhUQqp7FlZyJenabWHG
	 sGUK40afJw86ckBSqghyEIasUnMFpF7XL5wjYIoAF96dZbd78d7hUVvZJ6qqJSr0578Q3
	 lrkX3CwU1XnIx0PkAq6ZZppJD8MrPk4DOd0qnvv06xVfQV6oEZixZwk9p8VEJzXg6MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ln3J9Mbz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fJledeAD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE7E606A326
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:42:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AE7E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ln3J9Mbz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fJledeAD
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGtGj2340262
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:42:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TiJHHZoWYTxxWc307M21mACD
	+manX7RHfmlFNEd6ixw=; b=ln3J9Mbz/Ri2MWC4Bqf9PAdfIdkWPONzyUcCiZt4
	FFQbUFaYfbFupBqSQIKQelR+CcKaFRG3ls9jggcGnPr9kLsDb61FoUsEJhChY/Lt
	8A8u/9DA8IM/QYMAu/12GJbsT2s6ojTMmD8HVcVJ1oG6tQioFqYqEO5K4I/cXo3b
	sQMtVbGe/Otl6Fh+4Bd+lS5BsFxnk2AOQzz2Y0KWGLbHOfeZQT4RyzK+mLd3qYRL
	soTv4XwtplyZKWaTyJD6PF/hkYRn9Jz/5m7PQ7sOKMyUEsvo+Drr++uofaBhid4r
	df8Ly4zgMFDsz0ibhPfx/ObtuJAraO7Vs+nJqS9HO+SoWw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx3bj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:42:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55cc3c32e15so40715241cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462933; x=1796067733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TiJHHZoWYTxxWc307M21mACD+manX7RHfmlFNEd6ixw=;
        b=fJledeAD/Q337FhEdpWoMXcQ0rPoA6Ruw87iHoL0Lf3C9voBR+fWVdivt0mA1LvS/r
         OMGmnroslL1fIThUgG68fQwO9AIQMm6XoU/MEAvzkKlYqlAK8PpXe+BvA0K+NXdPWmuf
         H5VriLBey3DPfAJ7PCq9fzGuKCS7zvWpVVDm4XLkncmqduPINzsV7U23DhLnyVFysyct
         DswrQ+yKhZ3qZF+Pm+iQZXhk5Qq7SRxYL5oJ4HEX8pHoQW1wn9gxM2wOrloy6SeKai9W
         +babPGDPewrUCUE1y574zyiTRdrQ1WrbUV2Hsx53dXQMZptJ/QTrGtt+jPrCwPIjtpaY
         8Ong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462933; x=1796067733;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TiJHHZoWYTxxWc307M21mACD+manX7RHfmlFNEd6ixw=;
        b=XTwqVux8ShWMFG9eKjnVElz8l4wDER5BekbeAMjTe80FNz4y7j+xKz1SurpdZ9wxPf
         c+WnUAOLObG2V3TnSv16LNBXoZA6MuSWX4+1nGItfkvM7eeu7vzSzJSkiruDVMtOR52f
         fy+b/h5BF4qKZauFohUEtjWJGlY/jEulzSCgt/Hh+ThrMLzTBMimfiPHsA+n2QgCu2jX
         a8mReuSiSsgNyylGspwBe9BOfYeGqrf4IrAt9j3J0yYluNAaGl/tTaxUXkD0r2gpDi9p
         svbsNSC8yDdNxaFteHmFnygvP7J21ssrQaj8MtcPlGb5TVqpOf6IvhwU27GXBhMFfltD
         uPPg==
X-Forwarded-Encrypted: i=1; AL+hErH1FZTWc27rRdlb8OK0X86N3ovOUVi8s2dLxrDXzZiiquO5BowuBK8jUs0JYv4Rnkn+wQNm0u+59GC/McHv@vger.kernel.org
X-Gm-Message-State: APuU4Z8uMjimXQuGI/JrEcmjxPtp1u3nq1LoYGSaWQDwE4+X8MTLcmZp
	AeNlYaZHckbteG++Hb1UZoaO5RRSGnwnReXPoDirtt4xK2xTPH9VNvhQjLwkUDga7oH6cdiL599
	69BL8xXJEbXsZijNozsgZEmqNgCNgOdQ5Oc7kH2t14GSj5Pr5kuDdpPITsITT0y9HFf1E
X-Gm-Gg: AZFdTZeMBai6y/jgJiq2Wh3uUSmE9e9psiYXIjWFQzdodndwvPYPOSq+j2Lar5agRHe
	6WDoDM+iCotXjXrSeSPjMyin/QFjC01XA0MANW7C2zxEwwAwTGrzy4BcAM6fOCWZlEI2PeZ/Lw8
	pww0D1/z6eOy1CuXuZ9D76Z5YSG0mxKPKK8tYHewWCU765HFsIPAdA/p+mK9E5hW2NW4RyBS1c1
	s9qk5Ttex/UYjRoI3UhXOZXIFtzsW5jy2huffhGSZvjcGl2bKS7zpKGS+R+w3THaA6RuCeSSFiI
	96MyQ7Z08CFk4Iqe2LVJ6BEEVKL3MjeG80pMazntLg2z9bCkVS4slcMLixe/MzO27wNf/7f63Jt
	k+HgGieJk5MuXOprvRlg8ty8tNmjB/8Q2WtonS+TQRty++MtojH+KKDrzAq81t1HM
X-Received: by 2002:a05:622a:4d8a:b0:55d:2e72:1a03 with SMTP id d75a77b69052e-55d769b96c7mr239449841cf.27.1795462933155;
        Mon, 23 Nov 2026 11:42:13 -0800 (PST)
X-Received: by 2002:a05:622a:4d8a:b0:55d:2e72:1a03 with SMTP id d75a77b69052e-55d769b96c7mr239449201cf.27.1795462932439;
        Mon, 23 Nov 2026 11:42:12 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf62f7sm25764593f8f.13.2026.11.23.11.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:42:11 -0800 (PST)
Date: Mon, 23 Nov 2026 21:42:10 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 17/20] arm64: dts: qcom: glymur: Add HSC_NOC
 interconnect for adreno SMMU
Message-ID: <6obybmhvyuxsp3jarjv4z57ojjfprwss3mer4vq5x56yhhl7kk@fk4ysedbakif>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-17-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-17-be30526391d9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b049716 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=P-COMtFXNwbjGjwEE7UA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: eBmtbt9avjNfEN6T8-wTMCrWJcU8aPD5
X-Proofpoint-GUID: eBmtbt9avjNfEN6T8-wTMCrWJcU8aPD5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX907p2MPe4L2X
 f3Mc1YWXSofQGjjfsivQAzY+cFSvch5qpHxTPjjvVy61pCZ4TY4VO3ddgmyC/U5Za+mcBh7EQQl
 22BWsaLGsHg38GCokiPtAxQsm321oY0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX9K2mQw7SiXkZ
 TdhOM3PYoHFI1VBL9UgMJJmWrnNq7KU0LK0ZakmnlrRCH+yAYNnv8Hjb4AtYcBmhEhiWpt147C+
 d9hCdp1rU1qiFhMdtIHTXO9erkhDBvX89Vu3kZOoedb9/+eN+DLrux1Afe/fXFPm9L8jrMCUKmB
 COLaPwnBQcTJcLAq9ZoRWAYNcpxYPOpxgJk/LwdfbitIUIoM/RmSzcWKxzwpPDwBuMyV3TD5k2W
 hYwdTrh29D2j0qPgaBhLR9x/Vkic/wBtnZThZSlnVxKSoNbw/I1PrgLXhAmo8UAWBSwYtd4KAJE
 gpiFDNxGxVRxZ4hdhWvGRzcVD6Z4pc0nLyLvXxs1LGkGvqr/FLog7ffVW16aoMffTQ+ctuBr7Tt
 +OYxlVyXWBoMNkt8wQGz1vrBNuqkfZl3seKcqrHcowFe67gFcHk4MjkUnQmOPnvRYYKeDe21LrG
 OjtzkJvING9tX1WgU5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:48, Bibek Kumar Patro wrote:
> On Glymur the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on HSC_NOC. Without an explicit
> interconnect bandwidth vote, the HSC_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
