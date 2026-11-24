Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515291;
	b=yjZvTlNQyOKOV4YXQs1FyMJ/mHcKon8BPUcDb9PE2Fmjs8VSwZdbxZtz518+97KzxBH6
	 JUwdvVU+ZjoXwN6GO5/UwyWaQV4Vbe+vyOeTrLTCVs3TESgrBVCoKaxinrUMendjA9e3p
	 +WecTIvj0h2F8QnobUPSSMaW6BK3/KV6dUVxSl42zbf+Bi/KSO00EE7gzJQ9pFDNtdtDP
	 eDIeOh6PxjNEjF2jK4tjlTA4o9n2yP+/4DCWnADks/OMmRT49AnHn1PRtO2QacbEaab4d
	 0FVqzVs7p/4uzOqsAmYkaTjd1ZNZ7iHUlvFOLQ25BHoKzYvsAngqNF14iwwlN3hqv6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515291;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qk5z0LMGZDeAjOO0is3KJcdYLiEOWcWt97+nTtdMwHo=;
	b=mQ0sYbn6kJGIqE5V7IP3E6GkIMKQIy8xiKc3Slj0OsnvlHqS/QgxOfuZ8bd9N8FKV/2e
	 JTBCKBCH2KfCF9b8eaLA2bDrmDQEdpt3PJCB9hCaeW2z3/vSuutDddaiaDeaMMaLyiFKK
	 5wWNG5pU46e2VKoKFC9i1sA8Rooxv0SkgBY6usogWexylASaQKKeEzwdqNFKi2d+s/xxu
	 5J93GCf77pJCr2zWFS3jgdEURG18e7/AhIOTfPeMfF4MLnIP1MSOWM6BW91KvDoPvH2+N
	 ZNe+c1SzeDFLxF45ZXU+lJwyY5xHkczxc5E999NqMbhltvScLB3KFkhcQXSI3PY/Ytw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VFR3B1R2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AIRDQFzC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB91606A6A4
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCB91606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VFR3B1R2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AIRDQFzC
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8G5qG196999
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qk5z0LMGZDeAjOO0is3KJcdY
	LiEOWcWt97+nTtdMwHo=; b=VFR3B1R2Td0bQsw1M1DnPcEQpKrSI4aiQmj4+Dgq
	palLmVfgzbVR4pKHEFZI4XMw0Q0KOGuiVjjVBG98f6F1wMaNpzj++zqSufU/JLNc
	pvfDtW0fz5OygALJ3Fa0v/s0mJjS3kNSklZOj8UHj6Ux0hwf2LSsW9RdZde3nyeU
	dbnOpF8YLR7KMxajzIdIK3sjm3B1DpiipLPqDs0q3Gq5A8DFKcH+7nla1Hx/x5Sp
	7if3aSkguDALLfpaD9iNarxrXUU5M5AJgemnZErBDx1cbpcLlNDD73hRZQimNpfk
	EFJm+or5mZI7fk6TN5gfG+Bv5rhU8fPYthNUH3h4yoej+A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukrb4p3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:14:48 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a5005fd0f8so2321799c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795515287; x=1796120087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qk5z0LMGZDeAjOO0is3KJcdYLiEOWcWt97+nTtdMwHo=;
        b=AIRDQFzC6U91Eo9MLbSCG1Gn0VN08OOH6jlM/Ti54hjIYmsmj5OIGymJBQMkFm7KXm
         AU8tXHOfl6c74hnOPoVsMDiMnt1zsFTrMko3uiyOAUTaPr+5QHUyYUgk2GXVXuM+P8ri
         iQLPl7wPBsisiJxIKczmfVw2ImMDz1KCf0SiADDtABNSfXBTQ7jIKOBsIEc4Lp3qVf8Z
         yP/jpUuhd+CXwRxTYd2av5Z8e5knOTUyiJjSQlGrvOcNjecudY0iD9n0TH+8mI0OYtvV
         E5vIL4V6D9gcajujn2XQZX54nnzcmnMP64pnxwk3EZWZNCoq/EYZfePHt+/t3/fK/MgB
         ohnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515287; x=1796120087;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qk5z0LMGZDeAjOO0is3KJcdYLiEOWcWt97+nTtdMwHo=;
        b=zOo+Dg9ZXVPTKn6BSRKQKbaKAlxfF09nNVTl/fbbG+KJx+Ddsl+2VIu7oLAP3E/44X
         6Zs34T4XtDDh1nd/AYa5ch/8BD4eRfSJvgggj61Uh0yoNlTO32FYisRAn5OYLLzYkVI9
         2wDc/+CzAijE3KBf25jSDlTiOtkxFqeXkQaqcCdsOiNyo2FxNX7z0l5nj1IZ93v/eKva
         8BwKf9oGqewJQU6IGVC8GT1VFsSck7ObbQApsKAvNTi+3jSrhoDF75jqLyjKUvAcCe5h
         JVcilM8DSIcl7y69TvFeskptw+x9UkaFnZ++jmQOxmhEBtW5K7C6CIqFkw2qHvHjmlQA
         VczA==
X-Forwarded-Encrypted: i=1; AL+hErFf97cp+KynNBr6aPsMWwlh+CIv8hSpKdMe8u8JAhx8Y9DGA/vTIELHOEW3U6je3LrZKtaf2hlgOcfE0DgP@vger.kernel.org
X-Gm-Message-State: APuU4Z/bl4S9JWnKxrAFDyjo9a14Hg3yqaDpvw+y2yVH9IAXoj3Sj5Ps
	BCHOYz1I8E/9r2eDT+N44a7rjBb+yv/BdoUbgc4gwjwM6jFO7yhQEwcvPOIFnBuzmDWIdZX+pGw
	PyxYb3jNI1Xapur0za0j7f38WsZzZQry/Swq0A3GxH0+ZPPLFivl35WRcB9/Xu7Ma/gUx
X-Gm-Gg: AZFdTZeRtAAPyBuj0X1KI19z1olezOuKwtZaBOGYGUfLBayKa2opIrvU5FcaL8XoSJu
	7d9An4y0JeWq4PcmMzfhG355zZ95s+ymvEN2EvlGEDdFDjMHTa0HjUyhyVbMG10KZc8AcBeESwF
	TWZ8ynL+GephbWBph2o7gSwAXqJHAXXy+5UUY0RtKRwuUrz0PuZKyUEL1X19V/QkiH9ATyHhX9u
	jycHlLSVWrsYyduQuONGGsBgO3xpq5pfCpgjZayl6EvCw6/7N/ECeamdRt1egEjO1NMsoCtdd4g
	swQjrcmOY6yAxecSB18Cz6J3jt7SC6kaS0Yxp88RO9emtetPkfQKUqlpTf6W27Crto+CDGs8oPL
	v8lAO/7G1392X8BnIaBMWEcwlwxTN96AnhhKW2h90fTkpsM1Kqh+aXH0VIm60/bt+3XKHoxqFoT
	/c
X-Received: by 2002:a05:701b:4555:20b0:1b5:3616:5961 with SMTP id a92af1059eb24-1b556823656mr14255583c88.4.1795515287237;
        Tue, 24 Nov 2026 02:14:47 -0800 (PST)
X-Received: by 2002:a05:701b:4555:20b0:1b5:3616:5961 with SMTP id a92af1059eb24-1b556823656mr14255550c88.4.1795515286532;
        Tue, 24 Nov 2026 02:14:46 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm37791810c88.6.2026.11.24.02.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:14:46 -0800 (PST)
Date: Tue, 24 Nov 2026 15:44:38 +0530
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
Subject: Re: [PATCH v7 3/5] dt-bindings: remoteproc: qcom,sm8550-pas: Allow 6
 iommus for SM8750 ADSP
Message-ID: <20261124101438.n46ncolgnghojved@hu-mojha-hyd.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
 <20261120-shikra-el2-v7-3-9d9000eb50d4@oss.qualcomm.com>
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
In-Reply-To: <20261120-shikra-el2-v7-3-9d9000eb50d4@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfX1WDhqyvuSKfb
 M2Qh45uX/4kIhy04IsKsg/0Ng9kwb55iyQnmYoqhmJ7sHqn5OPZDhqI4S5vT7psfkCn/IFzHa2S
 Hg7j2kuExKwgK/Q1EMLMBLlYKlHpLN8=
X-Proofpoint-ORIG-GUID: jbwHZCGPjP_MHX0vvelbDlbbeH7luyoW
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b056398 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=RHyrlyLPk3cZOz1Q9CoA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfX3LEczSU5EybB
 KXJfTlzLD3kZbGnttYlXHI3WstbpZeITOuglnTgyyiAa29NfQeHEk1k+ILFNJxw7M9rqSIWJzUi
 u0rk9Aa5MtDNsvj3UQHrTpp57E+AhuUzlAF66cpeonfTBWjZAhEQ5cGnE62NJBR016bilw0KICh
 KCM6vZc1SDKfNjWp7Ldwk4QG/zVx5oY6uGYMCi1dbQKNMX1wcYwVbvRhxzfMpHnTPCFGU1WDZRO
 NL0UDPTJbpLFV0KHn+hCjY/DrwCAAi81ndYnVtHGEXf7gZaiRfsE2pb8ppyyp5lyGE1sz1R/UML
 cagY6Z5bqWEfjnp9cH59SIp+9oDMDNojEdQuAJKa2AM8O5G8YW3NVTXxGVxVRmJp3z52Erqgsdm
 7kR2S4qiaH/hbm2+UYtGg6TRWjMzTiaTxT9foGVJ6Ux9c5ZJo/ZBZgETq7DNxT8insFY2TBMy+h
 ZztcKkGptpRjX3ltStw==
X-Proofpoint-GUID: jbwHZCGPjP_MHX0vvelbDlbbeH7luyoW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240039

On Fri, Nov 20, 2026 at 06:50:51PM +0530, Komal Bajaj wrote:
> Remote processors behind an IOMMU may use multiple firmware streams. On
> SM8750, ADSP uses six IOMMU streams, which exceeds the single entry
> currently allowed by the binding. CDSP uses a single stream, while MPSS
> does not require any.
> 
> Allow up to six iommus entries in the binding. Require six entries for
> qcom,sm8750-adsp-pas, disallow the property for qcom,sm8750-mpss-pas,
> and retain the single-entry limit for the other compatibles.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
