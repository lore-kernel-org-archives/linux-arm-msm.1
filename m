Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515139;
	b=VWLBxvmqyxWRSTOxyRTyrFx/yr0sw8lmqb6kz6d5jtKHATjguOmRupcEyXJVEVuKNbj5
	 ChZS01/eOhNnW8+3V9ygkt6vOCdWjYQmhN4h1Rfj34VxEp+qXyPLgASgAS07jiSR/JcEW
	 dZ/8/tZKQy6qi0MxBLFQOgpIOgrTH7vdolvE9Ezg8O84WOvP5RQKHBuyo6i9jbgNnrZqO
	 NCjyL0AFFAYRI2un/d1nvtCT8Uc/+hONguv7/cil6pDGW6vfPn8Xwhj8hidG0IWnDdOd3
	 hqrkO1rLt9S1xA/Id9lSDjwv2jotqQ5ZhcPEcF2kbh8A9E5qI6trZ6FehS3dfVtfVEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515139;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6430HUVLr4bJNErHixuqanXn4vXMjYSsZt2lpy71S+E=;
	b=f39nin1Hja7MKPLeroWJGH6oS0hbjFVaQc3ov2tLNFSaTGrTbHLtNW5HmVwFCTgmGvnx
	 KX66fzvV33sLIUZANIO3gDpbadeXaNZryxxD4BRd8mlkMm+D7tpobeEhWA+mntoIhiTYz
	 fAqhANWs6CFjz6d2RGKBfWqNek1Z5mjndmYJm1QnjjUgXGe/L913nNJFsSCvVRUk6RpPV
	 72/lLrevw8VyGX0TKd/m2i6hkmCgunVz6+iO1aI/c96ApsCutA/OpnrJ532MEOPzD0yxv
	 gnnyEOkLJemN9Vc3gDlWG1YnWZBNHee4WlOy+ML749xnXJKJXM6wESI0F4b9EKE38zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mDrQH1Cf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NxbjnF6L;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC1F606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCC1F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mDrQH1Cf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NxbjnF6L
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8NRDQ197015
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6430HUVLr4bJNErHixuqanXn
	4vXMjYSsZt2lpy71S+E=; b=mDrQH1Cf6c5ArPYtVFC33gvCPjdAql19E0mcdVR/
	9eqGgLp1GL3Vki8Vmur8tiKY8Tn+bT42atKTgCAIYukJpTr445Zd7CxjjLMXMioz
	VcFvRC4AWT777uNSpCPXx/rj2vHaQW92z6D+IUy7XRTIKqAgBak1a118zSetM6vd
	qY950+G8ey+vTkpD9n420XWMzELeA06V0qkqT5wCjOxDk9qgp907MGRE8cvWRxJW
	WMmIrFOLrfJVT9XfgQvZcoTfUck6eJ0ynjpHtccprex+0hvGPA1gvjFBHC1Ufu+a
	kCslzGU3S5botnVMrvR7NKdFc99pgUfswLvi4XwbSUqykw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukrb4br-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:12:17 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386b8624cf7so3793805eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795515137; x=1796119937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6430HUVLr4bJNErHixuqanXn4vXMjYSsZt2lpy71S+E=;
        b=NxbjnF6LwQeuu7VkXngzE9TKNcxpj3cN00Rgxs1BVSnT2oQg9ZamRLfNIxX7tGrDNl
         XVORXmmg81izAhNMDKzPlmTShbWDgw9Ghf/c7sFHr/jwuSeeKqKVihzurUotH4PclA0R
         +ASQKFamgg4h43T1y1M3mxCCWhqkgm2DHe96FtExyr2RhHOQao6FvmSBTOBNqtSS5K3Z
         I3uSNubetg3mZN5OXJQWTUSYvQ4Noauq2JSku4qnq0a2lK4fce9xXodzG/fboAIiCU7F
         ySeWKwUt/MX29jiWrZMFvFPetFa413fbLYsRVLjoGxluUVQZd18zaLt4c+nlOuiVp8Ow
         VE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515137; x=1796119937;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6430HUVLr4bJNErHixuqanXn4vXMjYSsZt2lpy71S+E=;
        b=GymWYl6FhRaksEyFfQCdWEr0rmvvqt5oQRLDZ0bwk/nl0KnIe0UYFRuw7dwNyEgXFX
         ctMmkODKT7wsYX2XFwYeQ68LwWwGZg9w+te37ZQ1qF2cpPZ7sYGqBkvsyVKZXaIm13SQ
         HC0V4ewalHDc5Y2M0KtwMV20pE3HOfO21jh3RL2NFmvo3Axjpaid9pcElQBPdqFp0yaM
         ogF+8RSd7lIsngLR0jV6Sas1evBybfR81w/1f/1322KJl32YyGMEiVzhEkpyjh2paCee
         Yy2KtzkAMKH1Wk/tI/EUgqWeZyQ34fEZ2jT2t9nNpnw9p/fDrP06MneIF02+tLoomtkO
         EIvQ==
X-Forwarded-Encrypted: i=1; AL+hErGTF+zQQImmigP2tOoutHBfoFAKkPrFa+Xhyb4mVEasivjUwchgpzyHt7G+StTRyR3N6RIzwBXJcEvKobeV@vger.kernel.org
X-Gm-Message-State: APuU4Z/DXAu+vhENhaXco45JHZ5uRm6C7OZUWmFOErlerbWKIQcOZsd8
	E4dFFuEg4zd/Cz/g82uNVaXSC7m3ZG5c5NwsmzLJId/oAkE4ga5XG87p2BhN9m9994oGt4sHGms
	mUPubUla9WpjhRKoU0WaSxKtokywzNkK5EAlDDCR5qHu4IykxPrOLvooRy1u7lLmB/R65
X-Gm-Gg: AZFdTZcolbuGRoo/FXcu4hfqnKwOXdlFZbzsMkUb58RWtjkK6OmQ7SKl/LsxH5yG8cp
	86WHgiu2CSXkHC8b/ZhmN78TohykkgNVS734gEwUKAGzCMt4Uyf32RZFelN8y4dDR/wGoc6dA7J
	cc2TfGvKMFbqERE4+F7ir3GdAZSWtoVzgUqZy5HBbssvwEyVusv8RKTSuPWeFlAG95k2x472xZL
	yV890yc5KH7thW1OCoYrEMGm4eiVVrGHm6oil9XnZzwunidZOP3KmWME2ex9t7+vK/O/dtsj5di
	d/QW91RcTvZKX7gqz6RtKVGuxKJF7vnBkWccnXuc6LEcvfpuTh3GPBW77dSlUv9CVmnp3cQy5Bd
	G15A8bRVhwfwbvVU9ScpjapBT9jTgzQ9TjS7LacPU1v/mmZ2oDyZk97ie/xi7lg/BH3F69paFZK
	yp
X-Received: by 2002:a05:7300:f68e:b0:369:21a:dcca with SMTP id 5a478bee46e88-3856e9472e8mr14256326eec.10.1795515137021;
        Tue, 24 Nov 2026 02:12:17 -0800 (PST)
X-Received: by 2002:a05:7300:f68e:b0:369:21a:dcca with SMTP id 5a478bee46e88-3856e9472e8mr14256287eec.10.1795515136350;
        Tue, 24 Nov 2026 02:12:16 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm10543902eec.9.2026.11.24.02.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:12:15 -0800 (PST)
Date: Tue, 24 Nov 2026 15:42:07 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 1/5] dt-bindings: remoteproc: Move iommus constraint
 to SoC-specific bindings
Message-ID: <20261124101207.24nzbmb7udaq4ik6@hu-mojha-hyd.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
 <20261120-shikra-el2-v7-1-9d9000eb50d4@oss.qualcomm.com>
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
In-Reply-To: <20261120-shikra-el2-v7-1-9d9000eb50d4@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfX6zrmKTnFtnck
 bnL4AHhuPA/G/IMmPEhJ01hYGaId993Bj5szhquKTczRBp6PP+Q/Xy+dZ0rPjZH0jLGuXDCXSir
 ZY0uNtx73nnwWE5Iz8bgRuRnxRrIr9A=
X-Proofpoint-ORIG-GUID: RVVnsoKmKmAHDOiVn0FEfqr2klp4bQkW
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b056301 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_043IPGYQ-q8YCy9JWsA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfX2Pd2QwhAl2jB
 4V7ZG6z9T9IvWcDh+IPxZVv3bBs3bVhUpVcStCR+ZOawbrgDit8QvzTlbj/AwII/D47oux2tt7Y
 32rDKJxuecVkV5yj2uhR7HGZ6S8YNVHBIXRQmg2lDFrlLkRkDmiWy9FaAUvfoGCWCMscdXKPqiX
 w4NhtHAp0EmeA8C2Q8z/lX7IgqiNfwrZFLu7fKtCGYLt6gXa0Fzo8oGV+qgVIfVIK3pvsdO1sv6
 sScN/WHXPWIqOjOp+R5DQGR95w2LYTUXkhczy2FU+BVTbwuaFicf4ChAAFR07ZMMmSeAQJGO/e3
 ih96i0RF84RqoIUMmGRvhuvFtqse1x4NYx/kTD31/EOzYxuEQEf6jdevLH6GuIucAZJX5w1Bvbl
 sNkrk9Iv2v79K5ML8oA8YC9tDgKMQAtiTj6Vsl1Y94ntDNfsrJ5UEjHkcf/veRj2RiiHsidwCZz
 iOWq7Z9qfBcq507u6yA==
X-Proofpoint-GUID: RVVnsoKmKmAHDOiVn0FEfqr2klp4bQkW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240039

On Fri, Nov 20, 2026 at 06:50:49PM +0530, Komal Bajaj wrote:
> qcom,pas-common.yaml limits iommus to a single entry for every PAS
> remoteproc binding referencing it. This is too restrictive for SoCs
> whose firmware uses multiple IOMMU streams, and a schema referencing
> the common one cannot relax the inherited limit.
> 
> Drop iommus from qcom,pas-common.yaml. As this removes the property
> from every binding referencing it, define it in the top-level
> properties of each of them, with a description and the same
> maxItems: 1 limit, so that SoCs needing a different limit can override
> it in their own binding.
> 
> No functional change intended.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Thanks for taking care the suggestion..

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>


-- 
-Mukesh Ojha
