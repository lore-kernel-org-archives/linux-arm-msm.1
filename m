Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5F049503C
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 16:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786638390; cv=none; b=qYmZQfdnhK9wLKGvpaIjkcRwO3xcA+SptXVd6jD6piV4xFIfn4WyAp7tNiApSKEaNHxn6jV6k2fYSvnirXav3fZAOOcpEIB0Ircki4ykynxW4q2fQ3htO4f3qiQWhV57qpi4VvU8PrvkH6zorlIeI3D4W2NHAJ8XM+UE3qKYqm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786638390; c=relaxed/simple;
	bh=eIUJTWVfIK5NoWbIj8sZsZZIkRY00tWVLfC6o8gUNho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iMEJv3kNonmORIFJaVMnbzSREnus6gEVSkSFGDfrdIAc6JS2pIUV4+WJwSoWVQyK4l2w/dnVaxPzTsIrzHO0YbbMLCYBCVM6Nv/Jkza3j2Zvn+1aIGjE5jhHl53PJtYoB86Z4NUqlJDaSihaLnWnxUyZRIPoc4+5CLy/Qpyh4Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=byomBt3V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gZOMEAw0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="byomBt3V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gZOMEAw0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFwgNq3248787
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 16:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6RfxM2ertZqIr+2plkalpmps
	fFAQnAaF+gcYLua2ztA=; b=byomBt3VpgmEO75Eav+uM5WxGNaJaSzHFLXCVFhj
	iaLxn7f9B/Lt32VbKY2Mf39PzdfCKGRunJ3NHkfSpntJeT2F2IgeQIzromBvs/ij
	GU7Qhc1jFQrgCu2uNuRwmvjMqzzOtuev3psln6gA4UGRwZaAiJ08qm2VdTSBGQzH
	n4dc9j9NmEg4cSbKX3JEVy2bIMMot0Dp0rrdIcpVIlgygQc0D8XIqM6Pv2/mFxqf
	JQ0rNFrzeaC7Je1W9C45f/nUXxDTXHMbJElYi6nKiT4NZOjaHDspCre4yJwGExZq
	r3Zn6R4zhdlbs7sEI1zib2WhiNeeqnGbNcgWqTbZ2/6EVA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1h1ur539-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 16:26:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-529ae8e96e8so1212931cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 09:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786638383; x=1787243183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6RfxM2ertZqIr+2plkalpmpsfFAQnAaF+gcYLua2ztA=;
        b=gZOMEAw0vafhZz4oN302/hTBfhZ7vW2hZChYi7AA60YQ2F6aUQoYdX+vyzn8+41JhC
         rDUuyHQbrlFIbRkosFP8BRrUQX3nv1e77LgDXNJvcstDxYGTqOtcl8uMGvAQ2tZUXcAh
         IArXgos6yUUmd5QNfR42HkNJTmZhuOZnk+6XQK5kto8E4s63pHTSPY8gZjuuTZwlw2b0
         QrOIY5WuBbiWmm5d8j4p6bBN2jpE2NQ1EsiauyXvc2Lw0Y5vRd4u31WoGQVydx7e37PY
         MJXPGIGGejOK4bpgoZ0iPLcYE0VAou6VLhnMbnXrFnYd6D1GZpIYQ1xdQU2xTYTifP+w
         pYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786638383; x=1787243183;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6RfxM2ertZqIr+2plkalpmpsfFAQnAaF+gcYLua2ztA=;
        b=oWW4bt7SLZl7M+FbTa7XPT5uPGnLrUDB8QH0ClSvsr5EJSJiISgTpwL0dd8rE/lxXD
         R1zTdjO6x7mIWcHFADmuCVciIJ6E1Wp/K+30eYqfY6FOnfQoyFbMvqosl0/QtL/AqTkm
         bT9calcc1+Kwns91K2OA1XF1IyYBoXv9kPUfiLGpP/ETBRE+hAkV2bOQNyg+LNHnn45J
         JYMZbQ7HDD8lUnfU1uIN/kSaUdK7EYhbTncw3TdPw71ek/8QXWXXkuZEQPYX3RcbCuXq
         IF3/6vZ5um3tUHMaB8dP0/2GE09bpBA2WsEJqRaW5UGNdbTSA/R8h5z/JRrnvZDgLdF0
         0MWA==
X-Forwarded-Encrypted: i=1; AHgh+RoA7sksCNISWKLEA2zjvhRjGZt/0NDo/dLulKzK0jSdnwx03bbwPB1RLaJh/ZEasPKQAngMpJ9bt+EYN4Su@vger.kernel.org
X-Gm-Message-State: AOJu0YxohW+R/QyBYR9fK+q59ljEsD4WQMyjjmOBVQeGyrtmbfmBjSOw
	zAmm4dRh3SNvH5GVtGPIzP2q/YI8wxadLzVM5QyzNs0m3oSX0QcIZzPgJl68RSC9chc2jOC09u9
	9Nc9Udm1DFu/Su40IOMWx7ySWTdhMVpQqk2M6g/iQfUrJTglVLSCOWuh4PEMeBiPYUJKENz4qz3
	/3
X-Gm-Gg: AR+sD12KxodF2Tavlxjmd6bdOKtc4VBR+uAMUIZDyOAG5JVq3kanKIGvG/uttatzYZx
	TGQ+SZpR3/xyGnWtVd9vL52B6b9rkBHBZtmO3H5+qcPbhAYUl1Id7tJhGqqOnnnBuTydHeOMPF+
	AnaoYd0S+dgi0iH1Ig6ruPXzeF9Uo5ZNUli9O6eV7ceL2gTnVDcJyXOXw2Iv0VTWC33Zm3614uu
	rzjb6gbNtsRHfimIpaz4yrzQ+eqfxiXpIoRpsxgsoXvmfhx6xVr1Lh3mb0ObbWQQKLUJyIaTImW
	vt7543EC0p+0r4v0RF+bVn2CHijr97s6tGOYVQXP8kWqLIAc/VfIed5o408Ykk+krjEHOnIZg3j
	k0QAPRErygLYnEananC3vZ+AKsg7E43KV0SIPqhYNnBQi+ngDhlylDcYzU6G/GIZCR24/VkquMD
	o96qxEHyonhThI
X-Received: by 2002:a05:622a:1f07:b0:527:f4d0:4bb8 with SMTP id d75a77b69052e-52d73cf93e1mr88840731cf.22.1786638382939;
        Thu, 13 Aug 2026 09:26:22 -0700 (PDT)
X-Received: by 2002:a05:622a:1f07:b0:527:f4d0:4bb8 with SMTP id d75a77b69052e-52d73cf93e1mr88839301cf.22.1786638382256;
        Thu, 13 Aug 2026 09:26:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b453a548besm600836e87.42.2026.08.13.09.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:26:21 -0700 (PDT)
Date: Thu, 13 Aug 2026 19:26:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH 3/6] arm64: dts: qcom: sm8750: Add GPU and GMU nodes
Message-ID: <4tr55ef4n3zdcecln477zuxkty7zlv3lkzm4ke346cgcjqnw7z@25npbkmfltoh>
References: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
 <20260809-pakala-gpu-v1-3-207ad1fac1c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809-pakala-gpu-v1-3-207ad1fac1c7@oss.qualcomm.com>
X-Proofpoint-GUID: KU9cpiblCmVXK4MqkBXb2dXcViJGRurJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDExOCBTYWx0ZWRfX9/u7oyG/qc+B
 zvITzRq6gt0D5KsNVeENoRPKZ62RqLTYiQnVAWJSZozClN83trinarpGrsljH6ou3xwH+TMNn8d
 mXgi6nFH/66sM0KoSixQtJgho/0xz9wO1DvlPF77bs9CgsZwGVzjNzCetZSE3w9jfNJPdW1/wal
 Ai99ooYAKHI0orTiRG665CL+EakNWGy3MMj3NDRAqVOh9bpDFHWcAWH6VLcS4bkb3e+yVGaZ/6R
 3wGVDeiDvXWm0T0FqyQ//hQK3eIIUI1NmR4f3dbT7+cpyY3ld6fvXz7OxO9Ah2G+iirGfxY721d
 7M9OPPHya8EWDHmhXj57KUygfu9HR0GHHbPpkRiVIZwRDk96lg/fD6kpRdfM4MjD0xMlgT9q/uO
 3T+N0WfXeIDBvtl26ddCBtE7L1ZL1TuUECS7iPScTLz0TwZ9CXA1vKGr12L3qiy8U38IYfoi8i0
 XhiGS8OfsMMWoRXbpfA==
X-Proofpoint-ORIG-GUID: KU9cpiblCmVXK4MqkBXb2dXcViJGRurJ
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=6a7df02f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=qJow9a4cVNqwEOATeeYA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDExOCBTYWx0ZWRfX9bDcZP5IGS5m
 V20Gd1E/0RneJr6l/F8lyUTpnBVyzgv5or87e6siwdh1gTlT2v5Od/FxVdFxCsOYFDw8+fdeCJn
 l3v1UEuWrzWD3ZRZmbrOOnbTEBljg/k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130118

On Sun, Aug 09, 2026 at 01:53:10AM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Adreno 830 GPU present in SM8750 chipset belongs to the A8x family of
> Adreno GPU. It is similar to Adreno 840 GPU with some meaningful
> differences like GMEM size, register file size etc.
> 
> Describe A830 GPU and GMU nodes in SM8750 devicetree. Also, add the
> qfprom node to describe the GPU speedbin fuse register.
> 
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 231 +++++++++++++++++++++++++++++++++++
>  1 file changed, 231 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
