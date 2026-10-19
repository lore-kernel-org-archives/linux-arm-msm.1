Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC36849BB7C
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 10:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405558; cv=none; b=CQ62KWyycA7ZOZiUePIFx2XkPQEW+7SYKLAcTeGhFXAvtJd4sdNN2BT7L8fHREqbkRJmDyiRvt7NJwt1mEou/d2SVRJD9ZpAec8bNiMQw3Qp2Nz+LY62QLRt8fqetWD7+EvZnRpMLcF+3uqUbnnYi6VbOLEVXbOJ/44sQ+7K7K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405558; c=relaxed/simple;
	bh=Vo/uF4ySZmOhhCkcQc+Kd9NjByio5FnJ+xP6tRUVNLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UclLAMt+ovx2DVlO/9mKMfaTaLTY9O6EQVBPvup90eUHBrhMyYcQR9ogqL+mFFzSYryBTUEAFiCBykejuLwKAUXllzgoUiOR4+POA+rDkBPTB0V/RSiTNf9qSriPtMexbcbrh4foo3b1opa8wQUx366OLtMZ1V4IKxTTqYNzWvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=njCQv5TF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QDDbSqe0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="njCQv5TF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QDDbSqe0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P7LY1896608
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 10:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9sY3QVPyUK7h4K2JFOaaQnKC
	YHYUA7K+D02U/VBIUsQ=; b=njCQv5TFfHF76FaNOFeqvgHmreYG1QltOpW+i2AK
	Tnv+T6DCYzrnnM1xG/sTs5sz/HnTORv/zvmVck7l9HNCJR31M267Hqeb1S2876Ot
	Y4eKWIg7aq6iHM0XxiYzDIsd8kuKerhJbMYKsJ/ar9pYlx58f3MuGggdXMfmXtG5
	kIm19rUCLP4xqBaZCm+VmyPF/WKbJQ0zJL0OTqsfCyoqrkGrnMiVKjZ4UeyzcIMt
	LjjXZLF6FQXAdUCrYr+85S3M1ikaioBmUwbceoOvq9pnQDMDsf0T36bqJ8FVbp6L
	iyMzEWg+wTeXKwizUJQ31A5vydoqHTu69L2YT+YqEMFUcg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdbvr9dnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 10:25:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ca9b53afaso694347585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 03:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405555; x=1793010355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9sY3QVPyUK7h4K2JFOaaQnKCYHYUA7K+D02U/VBIUsQ=;
        b=QDDbSqe0UtLBWjzn79jpneR+bwXusxq9mR5NuPV6xj9eUV4Hn9RFGyg4dROKC17Ogf
         zSBktsH1LqHLS1wXwx1dAuUzh8zvVYNnapFstCI51fMfZtk80p+bBjomDsRy52WolsU1
         wS8gd4DnIIlO/pXbkMoV0/17q3kvjSFoM1rKr1F5P7uytxR8BOpZFwlBLITyUZeLixtJ
         mA1VK+lWXvluYcs4qu/hB2pY3Net58zsmXMajxR1gvnzOZVV2+ZBZfvZnPfsV9OdlAR6
         QK8UByN8IsT0JotObCuhkTbzp5dTx3s/YAgZ9fFxBEvgJMVES08hKrb5nvXc4DVfVVxX
         r2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405555; x=1793010355;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9sY3QVPyUK7h4K2JFOaaQnKCYHYUA7K+D02U/VBIUsQ=;
        b=rBcIf5RbyAbDIXr8bMSJZKrVMhabvco5NvZWcL71aCBCwkaIa0deSdWLXjEjWqs45c
         Lwf8wCIb3DGRkYF3ZLu2lOqSNG5tKeJzOfgbLLCuqPaXfE+i/POyjSbwP5eLgce8ohNY
         dLBHZwemQ+7AiheXk8awL+OcM1V7pxAChVW/wTrh0zT0VAXjKPbEuFsaTqPztuNqruJi
         7wqHY8/RrrErnaFLjB/+v88YZ1hhgVLpvisphmPibj9jrhjjzxDXWPxvCqrmtU88lJmz
         1ocz/xmTECqHbMHJJOA24oxNmdYrVRPhzrXE3b3goT6NSzqGwkiH+6tvSKQQLfKOtr0k
         TVeA==
X-Forwarded-Encrypted: i=1; AKwUvBxx2RhdA7YM5ayZ51TRK7CNIQrTeSIssKxbBt658W2SsOyLGNIcOL5dZcoFB01E+W3pMHzaeA+rm88mG73E@vger.kernel.org
X-Gm-Message-State: AFq9FYLYc5Wz9nZnpecLu6dngVZKjIIxCMFA3jv4j+G0Rx4gtE17eyMY
	10lvGSIv0f6jsEALMhBdCmciFjUJ4UJi2/Fegu9sCdx9T389ciJM1IeJdOTnWmiSf7g8kIIAU1D
	x6WQVujNvPdWZ6t259kKkE21BcXXY6J7gDEtTnF/ojjfyHwujy0KfBpMpLFVm6iug/rup
X-Gm-Gg: AYBFou0u03YNVJS4kP8FhKOb2NUKfDkEYdY1xfKQZ+aS6ndDJ5daDVfpFZPtvAk32FH
	lXLg9P6qmalwb2HgWabPuU/D4/EyPh0IeDwKDVi5e4NOES+JTsFER5E2NpyYSxa1JJOqNjTJb35
	c/KcmuW6/fJ3Z1JTWRbbwdKGytAmzIF19oshExYGZBvWdVjrSZHisHtwJigFiMJB6JM0o4O4wUn
	BqEkBnM1ufFfJC0c6rC8NMNpAGjrHmGEH6OFQADGPEOyXum0Zscfxk1ZNMZlM2lzTdlr8Hmqdy7
	524snCBQjqnRvr8JjU0YzU1/QKWWKhA1unI/UrALgAbMSh+7PBJFnv9yoNNYyl3CzRgDhEB58ML
	Wc6/q9HJK/Wkbqx2t
X-Received: by 2002:a05:620a:2805:b0:93e:c12c:f142 with SMTP id af79cd13be357-93f29e10c8amr1196530185a.76.1792405554923;
        Mon, 19 Oct 2026 03:25:54 -0700 (PDT)
X-Received: by 2002:a05:620a:2805:b0:93e:c12c:f142 with SMTP id af79cd13be357-93f29e10c8amr1196525885a.76.1792405554347;
        Mon, 19 Oct 2026 03:25:54 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm326947385e9.12.2026.10.19.03.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:25:53 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:25:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra: Switch CPU ETMs to
 MMIO-based probing
Message-ID: <4zgjkqvgyezymw7ohvcpvwaj55sgxnzq5zkgaoslvtu7ace524@6hjkym4l7bte>
References: <20261019-fix-etm-probe-issue-on-shikra-v2-1-b2eaed0fffaf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-fix-etm-probe-issue-on-shikra-v2-1-b2eaed0fffaf@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfXww2gqYHeGDkJ
 eBpnnm6AVROKJZ1dctUsJR73bzMji6XAPnUik/r4j1L4A4FhvC14UyWjCfzFZk37RGSvgXsTZ9q
 ds8PJdNBBz5EQtpT4GKvzatd+vNzSiY2eT6nfl2qWlnWoAfKpRYx6DYV0WLmVP0WZ8aRsc09kI2
 laQXRMgz8dF4oXG2NBp3wxKa97D2eGqMtdQud7RdtZVuV+OhnzeUVImABu7wHB3DtBFhRhGgEd8
 tG4eKG2WoEQDqachYjuuaUTTPmHoi8icZGBTsXaNbVXLSd6xfPreKgYBPJzbU4BO663KJxhJ62x
 53FwBtfyjy4BTzz8cLH7UaIY4l4k85UZ+prFVKOlRO4LgnUGIsyhzs2AOKzEv3lDw1agTJyIoJl
 PCjSW6U8dMBTKsQ/yYvOGoXAj7WWdCgkKK+86A3uI29xhZKmhU3OnFi3TqPJ4Mo7UTZqgYVThB4
 H6Mm5I/B3UVa5RCXUog==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX45fFz40rrj+h
 e5wZhQdifHOXwXHK/YYi1ILqy7RmLzWCPg8Ak/N1gmk6kLjc8OhgboQk3OvziEm3U5/eASuh+p+
 0/vRhBoKITpHzAGflhXdMuiyUx9Nafs=
X-Proofpoint-GUID: mjzuUJefI8hofxGyANrO60SQt4vbWmdo
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad5f033 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=jfv2SjV0b693ZNeubh0A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: mjzuUJefI8hofxGyANrO60SQt4vbWmdo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190041

On 26-10-19 14:58:34, Jie Gan wrote:
> The etm0-etm3 nodes are declared with "arm,coresight-etm4x-sysreg"
> but do not implement self-hosted system-register trace access on
> this SoC: ID_AA64DFR0_EL1.TraceVer reads as 0 on the affected CPUs,
> so etm4_init_sysreg_access() correctly reports the access mechanism
> as unavailable and the ETMv4 driver fails to probe with -EINVAL.
> 
> The CPU ETMs have a memory-mapped aperture, so switch each node to
> the standard "arm,coresight-etm4x", "arm,primecell" compatible with
> its MMIO reg range.
> 
> Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
