Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A9A41D13B
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042329; cv=none; b=rM3Id/xh1kp3vSoJW6MFIfSowgKkC2yKRSlqU1/3l+EN1LYOPIhojGGMBlVUlkb1bK1Kxf99MKL2YJVa4xNOVCsrKUvG/lkP/fMJkew9Wm2Lu1vik14beXi+j2wXeeaKD3jL0XKoZ2V0bypqPYq4Plh5g1yUdhu/x9mPSQzmq6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042329; c=relaxed/simple;
	bh=qvV3xM68RvU2/pgZZw2BG+Ugd+rpYybGwNhzYpB0hjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KxIkyFdkLRBredSSG7QQlnTIRwapRdB4GfCxI79ZJTUVoxL6D5PzwWKoI9Hg3+HcH/G3lroXwomiT7BmUrE+iT2Rb9PfF7LJiBGhkXV6RXvza00fZhuqWPq5A9uBn0/2cNWW9WOjqTQShD4ezVlAQRgT3rh+N1FnVJjgcyKtNso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oyDFi5/5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EXdaB4BO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oyDFi5/5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EXdaB4BO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BKQr547282
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N9sDXi7RWuCc/eU+m27D8sATScrygYetGNs5pLhTApI=; b=oyDFi5/5cIIQP6lH
	AuFccvYs6L2Tv8D3SlyDKGxnmS9dGR8hg/QcmXW1yH+OocJGTmYVY4IHI6OKwvt1
	mTXLedrOk7yfK5ajik2/RiNycWew04C3FiriuFH/QdvD8egTetweEtwNBjhMaa1t
	AUs/8VCCtb1Ay3nHR6NysLcxMkMtVuJtPXtKa8sJc3cwr1VuLe/3VTxcCQx9LbdL
	G2dYvgHZLL3SzO6W12zNOPSFZqnEcWoE+yk56RnWDQyU/qdIOeCI8EDfO18rgE72
	NuTXRikZ1huYsasjbvDzPEuagmpPXeXlLfRTMVcdfEl9hmriw2ecZ0HvV0NFPSCF
	aYWwtg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4g2p1392-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:38:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930b81c13b0so31397685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 01:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787042327; x=1787647127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N9sDXi7RWuCc/eU+m27D8sATScrygYetGNs5pLhTApI=;
        b=EXdaB4BOZOFjMs14wKITTqbmBZOOKLsTew6cxyYNpO7dl2PWPdbCZd0MONtvQs5Xpy
         87JhOxdLaQk0mAR6Wc3Boj703qaXpGUEWW7j1GsHi1eTxavYonVqs/8qN9sW/t7o8ZWQ
         /kwV/LGjivVC3z7SJmemEge5GzVQS/3zcooAAo1sKM07QviM1qbgNHCJpWilRwtwVfUj
         sx2iliNLfzW4Vm+cBTqrXdii8agKB2UeM7p7C8l2cZ76hvwfHZBe3rca3XlO/35oepZ1
         ip2XxkKKf4nZWIvzcHtVjWFVPcobtSEj2LHFeY80C92H8i72RBKy7jZ4EpjcH+MZHDkw
         o4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787042327; x=1787647127;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N9sDXi7RWuCc/eU+m27D8sATScrygYetGNs5pLhTApI=;
        b=ABIt/TLrjoxDXPuMIwZ7XsdFmLD4xiyAhmSICxp3Uw8bvDEIa4IxshvZW8jRF+xdnY
         jqcam9bJJ7osh+5Y8Rz5t9AS+lakape/vgFvMjG/TzXUf3Ds28vKCpoyfrzIDChR1TCQ
         1y9FUVIzu7p0P9LmM+rBKJnmSWwnbDpaSYOZdGIdcOcgiSH8XCCjAC+3W6GjpSMIkDKn
         LzOSXDIr/Ik4YJRb25MvL+6JkgXcQWqUN19uJAmnS0TM4Rm7hx83FTtsZQhEIMzuJGln
         ZG5vTHStRw8JUT998NcKUl8+P9QQJyotBmKUMLuq7dqiXGOjlDhkFSp2SUw48ciHkDKW
         eDcA==
X-Gm-Message-State: AOJu0YxjNFUV7Hou4v7FkEJF/O6glIwcoxNe7svJvhUFpa/o0JN6vu+3
	ZPj4PeuLYFwe2hSTD55UP8syAYqFoi+AB/PRqsFNSTRMatG6jKvb8ic+QItouDRjk+Ty9Oa1AJo
	aOD9oBcBza7o5gzbW/fBcL/5N3zETHcP2CRF+y5QRgbrfj3O8UU1fWB4M9lnYHKiK5LWv
X-Gm-Gg: AR+sD110Dg+RDhTvr8yLozF6cU82o3YLFOp6AoaldFu2IT/mnOSIuULBujaapk7OyGr
	MBLQI0kGYfL9zlHc6jdYSm9edc7+FoFiDBMqHirVG5PMcSctyoFGudtEHMgW2KmwormbmFXsXYr
	Z+Ypdn9KLAoorll98TqPQZFrVQbYo+CtM366qkom2HX3EDRcb8xkkk5lb661JliqicaThyYWRrH
	kgxwyhUS+/IJayE8THo1Hka3HzjmrdQ/4pbkGM9tE39oBQI+JxLqAMLg6H/5BMPShIC+75CYTCp
	asa/aJolh/RUNLa9gRY5Diz3ZJWPiQ7lnkEPI2HOmSBAz4hdmSMPSrl6cciXZGdLwRKzWisL/AB
	IlTI7lQbQeVjlZeVASvBnsiBw
X-Received: by 2002:a05:620a:3183:b0:92b:14bc:7936 with SMTP id af79cd13be357-936d22401efmr2303230185a.1.1787042326617;
        Tue, 18 Aug 2026 01:38:46 -0700 (PDT)
X-Received: by 2002:a05:620a:3183:b0:92b:14bc:7936 with SMTP id af79cd13be357-936d22401efmr2303228785a.1.1787042326184;
        Tue, 18 Aug 2026 01:38:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fed68f9sm152768166b.27.2026.08.18.01.38.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 01:38:45 -0700 (PDT)
Message-ID: <15740cab-8485-4887-96dc-b5895a7d7656@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 10:38:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: smem: Fix signedness bug
To: Ethan Tidmore <ethantidmore06@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260818023441.891274-1-ethantidmore06@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260818023441.891274-1-ethantidmore06@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IUggbRfV_usvVfKgnZNIXK4_GLMpsF5T
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2MyBTYWx0ZWRfXxwj9JwzH12kf
 Co7pqtKrivGZRFKhkIyTWT+HNDwLsJmiOmdhK3jQZrjo7q+l0dvqfyD3yzZo5cUpk/NcpdSxL9p
 R/poHx5iTkNxSgZ0aJVG6a+7CvBPOks=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2MyBTYWx0ZWRfX7vwFzd0xPPBz
 T7vCGWir25q7SLZ3EawUhZM5s4BJSuPRM8H3jpfzDDApLD5xnXxqdfkkQb1RzEZh7YrO++Q6zvO
 4jNnkqYeTpnUU9ekeIBkQFVNnio5hqA0jll46MPQi5pLVXuqg1IGvky6BswbFmv8+kwjgGFDDEW
 vYvuwV4ywSjLcSatUmkEzAq2yhxIna3NXxgEGXoQ7BlSZ0TwSP75qVxJNaFapaCLxC4ArQtk7Yw
 FIOoJcfV0CUpbo6QdfiVzyqEZinnRVqiquYVtGG5fuAxYTdtMenYHXAGy+bl7keUK2jVAMKUszU
 ihCfKfuTOUMdi/jlbO6+IzCTVeiZk5rjExkT2ifZd1ylai40ngiJ5C2A+88RcTHo1Fz863ihSBF
 YsvYclv0fd+7KLd4nzAE/MnpAW2SZjDNw3VyAPWhJJiiRfhGwR68cSBcjpfz6YZk7WVQsDbb0+E
 d8FK0Zt6KeZmA6MPWYw==
X-Proofpoint-ORIG-GUID: IUggbRfV_usvVfKgnZNIXK4_GLMpsF5T
X-Authority-Analysis: v=2.4 cv=bfRbluPB c=1 sm=1 tr=0 ts=6a841a17 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=0uNNTOp9MGPMGIwATOAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180063

On 8/18/26 4:34 AM, Ethan Tidmore wrote:
> The function smem_dram_infer_struct_version() returns negative error
> codes and 'ver' is an enum, which makes subsequent condition (ver < 0)
> always impossible.
> 
> Fixes: 1d234eeafc56a ("soc: qcom: smem: Expose DDR data from SMEM")
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
> ---

We already got another fix for that:

https://lore.kernel.org/linux-arm-msm/an1toQ-acGR0kOWj@stanley.mountain/

Konrad
