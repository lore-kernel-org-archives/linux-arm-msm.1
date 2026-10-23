Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792739753;
	b=ivZJHPzsaTbThUEk/tqugUq+a/eaHSLnDN+rzgxgDJ5MVk1/mveCvG3GRXXLJH8p8b0E
	 kWc59T/GuqkLXy+SwIhAKvlJdDlx1u7fyie6vz3I/FQQeYj3dFr2HR60EEhzk04EKuI+m
	 92+o9YGi/D34h0Op9NoDjJ8PSafuHYGpRpb7ANbxy361lBRePs5yXbpzM5I1dqzAm2RrV
	 pyU/mdS8Jmv2nSczIT9/AxyKcYfUF3UDgGIRPeizVan2Ml71jDZ7aW8xa4x6+Zd9E7M0q
	 ieKjJTal2YfJXmqz1QSNdHIJXopUYPo/KfuctHnsWjHIOu2fkNAvPL0eM8OFa1Lcggg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792739753;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=emVHzhFuBmzNbJfl8jaY3Tt35lmId6ThMENQGGl8GI8=;
	b=vdfvyIN7Dj9b6zViJCFrxsZjZMIMbgTvpI/tK2jMu4h1FXZHMESj/bAZDrPJiDK4UZtE
	 3+DSge1eFkvReXptQVQijqq2JgvLuFz89iDToBmfaLCayUkOMe3H+diNFbUa7OwGTIkvL
	 /fmxRn/vnGhjr8Zzob/d6dO4TtfrmTk208SYMXOvIEygtBNLcMJPSgg0cIUXGw4L5t9J9
	 IhpURvtn4TBKLtdNeeAkfxONZ24yaik00BVIedWKt0jFDPC50T3xU1ETXo3CtC5ZF5vhg
	 b4rX5FWw0ZfBVJG6FrFerDrjwVim+M462jg13ilJJS1zx+7Q3G8HYokLJm2hRVxww4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JooB3BEN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NdJ9sFtZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E81E606A31F
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E81E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JooB3BEN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NdJ9sFtZ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FWim588326
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=emVHzhFuBmzNbJfl8jaY3Tt3
	5lmId6ThMENQGGl8GI8=; b=JooB3BENF2M6A+kMTs+lcpmhxo45lK1YVBhiiWUz
	6oOPEsndL57QUVmC25/WlQOLn6wEoJSJZVRWPGofaNphBkiCvQvIeKD0po9c8Lw7
	aCQkFpzl5zS3ui6GoqwJBdrockwrqRVuYGXvZ91Qa0S7nCUR24vQMk75J53f61XH
	G5n4SO518jchVGwClNlxe9epKA+DA2aFYNCemKjH3yTS9qdD/exFsOGlWimghTJ5
	zBxNtB61CKbLQHN2M6TcBgY0C8BPnDna+2vRg9wC9kJbzZhODMhKWv8k+DV57F3A
	+acndsY1AwMi79TKIpbPNQ6OrEMj8FDtz7b/SeBbQB7dMw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmaswu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:15:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1e62510cso127465585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 00:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792739751; x=1793344551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=emVHzhFuBmzNbJfl8jaY3Tt35lmId6ThMENQGGl8GI8=;
        b=NdJ9sFtZdSBjkiRWvDN1DDFmBZRlKH67dY8o0kMqfSB5Pt/tiX/0IdbtFX0H52MVJI
         NzTq96s/NV0ro8asGpaFFW4MfeyGXWB9rLXKtY9XgnEOz5tb6P698/c88mKcMgj2Mau5
         H2tOERfhYW5Xr05gzXYydo2/F9XvCJE+uCZ2AsdSSkLbBuaFu1Maf6S3Amb+mPP9DKuC
         VoN2lFnP8wMe2i8ka/8e2RmG2yq1dcnqF6Olkqa3fsJxrYuH70H2yN1o38YO2//q5Lqu
         eNS5+fZd9jDp9yfOTkm4ejlvxzRf/P7Xh6wHCvIxvrYTpe2dFcy9TsS8i8Nz55N5MM2U
         HFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792739751; x=1793344551;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=emVHzhFuBmzNbJfl8jaY3Tt35lmId6ThMENQGGl8GI8=;
        b=vRlXQ0N+W2V71wU1b0XSosAwtUXpbX4iqP+ev2r8PY4JGJyoBCHI6mpoRt9qGLFaTA
         0SQmwuV3ISdzOr3UZ65nREGgG7k8ZlCAlkXPwS6qYoLRoIa3aAUTCcJYiMrj6mp4kemn
         a6y9O0JjaMvAggBw1s4NOlH1XLegLKlL7lIFrSVg+pTnZDY5h9pz34I+stsHfECwwQeA
         WuI+vmxMAUNw6xdPB7Dz34Q2NClD0MKOchN3rzST6w5g24KwNQV7dCHEC53VGiPsjZb9
         lfETZTzz1nmIa3YR6C6HqVh3rsJ3OZ3P88uqxCqX2tmqhXGSkU1RYFqC+rVkd6r//mF0
         yS4w==
X-Forwarded-Encrypted: i=1; AKwUvBymWnZwEpt2K2SHcDyfAN41xoiffgUEe5TJK+b2cO12fyncgGiQUw/dnD63HEy5k7FhIZ6TAYtF1c0brR5O@vger.kernel.org
X-Gm-Message-State: AFq9FYJsd0zFaJQEmPf2GDZKFJZYi0yDyvEFxkvUFvWSzXzPqTP9XASg
	cGUMQD+1fb0q4FHplnuCSRH+arjdX3IEDC6CmoS1HClRQJPIxLhtUz/NgoZPuyw4xFheXWrtPbb
	5VdQvyf1RhWnUwdcLmIeVMYXQZPOK+DB/fT/gRzJQtkFlrZiY47+F6Dw9Qx1QC+eFZfHc
X-Gm-Gg: AYBFou2Edn9RDDxfTZnseB6p9JUn6wFTueQlJdZa7eRCnHaZh8a54X/ekT8pLDM+jrv
	Fl4cXXasthHSXZv11H2xaStvHe00aJeH/WHgV5H2yfUDJXwe42MIa1ii35nfXK+ZPF3YQezIqQT
	gD7Sg2DMFyzZ66E5QTSFDieUwV5XyBuP7T9A3ZALD9zgl/P5Jv7nD7Z2yeIlemMsThslQXSo/z7
	+jxU78cuc0Y+nJL/0WSRmDzjSfwD1pHWtKD5hZnfK7iWn9gF4xG4vmij3YjUjdq+ztDPncnLnjq
	81a0J6dIHGKE309hETHzz0RCS3azEikzbS0xrk26TfdMbROit5jfiKg6CJ3dNGxygUIs2YHeS/k
	sUKqsL9z/7fT4eh44
X-Received: by 2002:a05:620a:470f:b0:939:1222:b9f1 with SMTP id af79cd13be357-93f6f420cf8mr281436985a.0.1792739750566;
        Fri, 23 Oct 2026 00:15:50 -0700 (PDT)
X-Received: by 2002:a05:620a:470f:b0:939:1222:b9f1 with SMTP id af79cd13be357-93f6f420cf8mr281432985a.0.1792739749888;
        Fri, 23 Oct 2026 00:15:49 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a211be9660sm36763725e9.15.2026.10.23.00.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:15:49 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:15:47 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 4/5] soc: qcom: ice: Migrate to the generic ICE service
Message-ID: <52xwxkqrbleq3upuvyorj3ikr6xefpqc2izkdqef3dlruzftwi@gmqsgo22ik47>
References: <20261021-ice-migrate-tee-svc-v1-0-b035be7aab0a@oss.qualcomm.com>
 <20261021-ice-migrate-tee-svc-v1-4-b035be7aab0a@oss.qualcomm.com>
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
In-Reply-To: <20261021-ice-migrate-tee-svc-v1-4-b035be7aab0a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb09a7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=GPN60YVRCDtHV3IpRhQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyOCBTYWx0ZWRfX5JfGCBZKq/2y
 SGM9pZ/jhOde1nm+TUW02SROPMhjNwYs86QsUUBf3ILoD9ghpBovOIqH33ArHce4A/glRz7Rn2T
 ysLh8wfxCElV3Yn4JAKr24BAc1aV5wo=
X-Proofpoint-GUID: EdeEgdcSF47sgcfEGUWG5qe-rxQLJXNi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyOCBTYWx0ZWRfX4VpbkOtly/yr
 CDwT57ACiMV7LcRq0GVQ+5fzMM8543XV5FSdzcXt0u5gU39OR44YnSXredkst0Z8jLvehoTCErw
 BVOBASGf5heqcrpC6yJ15QjOu5SFXdecY5NXY3xXFnj6BttfTlyczpHHU2l9ajRvioNphm0Qpsh
 ImndOHL3m2kVvJR18CHR+893byE+aX+C6yPArOzNTS6ZoZKEQ/7qf0+Xu+1ryKOqsZgCvifK0AI
 4D/488ATnRft6SXBrj9QAJUhhTZlPWCRNEOR5AaVHOqw3tkc5iBK5NQEVNCoD/66u46+IxIC5ZB
 qOH5kmkq1aZp+TKZRfE6asvlBtOydNldBKifRI5EstwsXfUIuByDTcTrdApmFb4pEK/adhWsKww
 AFjvWoWv024yUAFhFFhWQMfvDD0j+2RJ9OFyTrpqMCWmSZRuY4ghT8h/f4Az3rz7g7eCNUbKH0R
 eo2DEfIOdGBUpKX0oLw==
X-Proofpoint-ORIG-GUID: EdeEgdcSF47sgcfEGUWG5qe-rxQLJXNi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230028

On 26-10-21 21:13:10, Harshal Dev wrote:
> Migrate the Inline Crypto Engine (ICE) driver to the generic ICE service
> which re-directs calls from the driver to either the SCM or the TEE bus
> based back-end driver at runtime.
> 
> This makes the ICE driver agnostic of the TEE firmware running on the
> Qualcomm platform.
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

LGTM.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
