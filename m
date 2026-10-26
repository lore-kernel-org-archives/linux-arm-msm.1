Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019450;
	b=kNwt46l/HmhhGhXPytVPbCHLnglLvJwaFjjitqStQDQ2OlKxHye9NYsz57wAvSXcJugg
	 0hwtexXFOtnxKM5v9AKUJTNezNeadtfUCGw0VPiv4UkyKDbKpHjtnG76KQNhj+DVqAVid
	 Hx8rk85bTDsI3FsURx6iv6NOlE6rSJ3qS5a3Htf9ihGrdlvP+WyMvIY/tIl3G1NHTgOMp
	 O9Vc2Z8HCETYoPB9Mx8jVGV6dlqTn9JeGF5frZbMAEq5MY7mH1+orLwMeQECNbqjntn9Y
	 e8Jbd4AGjAV8DWwfuSeDMakQjppUgbJbWtXA4HZ2fJIZ6rP7ZFGeP6Dvv96I2DiKEdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019450;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JJlwZv7Mylo4VPK4tdb9i0GZw90Uvr+DmjdGxjCMtLk=;
	b=yaqngxq6qbbYnPbW4qXPUDgK3Vr7RWvpBY3Kc1GgaC1IMuAqcnPTKnGZfi55C5dO8zeN
	 Skim4yBEP+HiIbqh31gwPsmjWR1nYfCRG9O7q/vyojJ0lDoOMPlk6TRtD6jLF21uKzT6e
	 b7ThssNa2v85Rn+GfH48vj0E3/18vraxnFtaasOE8OTQRwIsC0CnzPRkq2PXBg32mYACi
	 o1zUdafWDFY72CPB8zltvtLTqHuuSFLHDtDAra13v/kCzkDIgDmNBoXsLQy4BofOzfIem
	 vKHyItgwHguOUt79Q4FOofBbzwm+bWVru/zN+SdKMq9AweKjjBzqSG8KnPGm112Z3Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TbziUNIG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DkfXNezO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AC2606A320
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00AC2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TbziUNIG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DkfXNezO
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtK3J2541799
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JJlwZv7Mylo4VPK4tdb9i0GZw90Uvr+DmjdGxjCMtLk=; b=TbziUNIGgiHvLESB
	ZPmHiiqdkTrLmmrIuf9C5GfcZFcnqXlW0MYtifFIntpmAk9D16anYzdRG3Sp5gPY
	+4INz5pMfmWmcVHc5w2JUCmEZiQxNNPX0yG8aFTrb0E1VAEIqy9B8EtvgIIG5/VU
	bjjfMP59ruXvDvQvHL+VCIvwjwcaSPKZE/O6tTXSir+tjKsgedBhUXf/Sc8BGB/q
	NkjtxVwCGEaypanIvL58FCIapgR+IQmgHTebSUIqEpJ7Q33Rnu/F3qaP0rcsbDgf
	3mMbFAklXJQGo04WMian3TiQkndbjYH4C7zU1c8zFV4AJ68a+pGLvWwtA3xDxSkB
	SsO7sg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjdagub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:57:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93df7a9466bso30679785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793019447; x=1793624247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JJlwZv7Mylo4VPK4tdb9i0GZw90Uvr+DmjdGxjCMtLk=;
        b=DkfXNezOeronfwK9PBsKPy0ioyXt87OnhP22qHrdAZIFM9xVFySgQRXFG8Sa2UofKh
         b2zMDssqSU/Cnw+7Qh0wmVi07mqfmaVsBSCh5p98/PBhJMTnu6M7CPL8idGv6qj4GglQ
         88I8n4yvUP8UO22ngLlUGmtX0jskcH+nEayhovmFo7jkJdvUwJBnXYwbbcAkT03CiA63
         HNgMx5r143Xz5IKnL8ltN7bS9IKq36ZHEd6dFTa8P6e6rnTrPfs0gu4vThStDPvjYoZb
         G4ugvh0WzXUBdnS7zS1+uWH5XIruTS29XQZSq5DGLxArOJPLzl9BgDfuBF2feBaKgU6/
         auEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019447; x=1793624247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJlwZv7Mylo4VPK4tdb9i0GZw90Uvr+DmjdGxjCMtLk=;
        b=EfH5LxFvwBxmPpjlV0AaVBtlS4AiTD7asF9eG3DLaxIsGfOp0ocNVLbrVoZ4axAf5d
         feBQsmuxv6b6TL01XU4cxZWsQEJ8yiXlbmb8aXFk0t15CoZkp00A/EJL+VQdFbsr6IY7
         qMCrPmWsY+iPXCOXJ7g7RNO/J03Z8LEf/8MXcvwRQBLPhuXVaweUE1vLoxiqHJd/NVYN
         kghkzWjiGEWW8fifkxD5se95NvWF8nC4bbVq4TjopLOh0p1pCDzBB/TLKbDuFuGF5d6y
         K8zl+ObU4VGXRJvdgLUGoL9p4OiP/VWULb+K3sN6kzmD0Plk3z//5gprZrWmnS1xJMOA
         iojA==
X-Forwarded-Encrypted: i=1; AKwUvByj7AQb/DFhoFdI6IOu4uE9HHmoRQ+5CyrHtrsC9H4M9WgaS4Unzp1ZgaDgHxK6kB/EL4W1Wxe+3yZ6KPMp@vger.kernel.org
X-Gm-Message-State: AFq9FYIXocTKbjdhFqm1w17HzMuXcl7hezfzHaf5/HWvozKdYNTWsk3G
	Tz3PgdS0OOaRyzfS13gik6TOuV9ZRUjEkDeQrKpK5HX523IRLw/7n9mWSCi6vyiMYGO28bu7NnE
	O/W3DUhs/iFyHaSXvymrwtFTN3SXLnx54pFjV76knzMbXOVVY5XPPnBUnj7pvFUPn42oG
X-Gm-Gg: AYBFou0J6KQ4BiBT6gCtBjnhQWrJjLnQDd/jY6SuqWiVH/RuCC7ygdYla1zDUOhcnOM
	rWOajM4mdHL+ZQbyFedzRrdXSbP7OjHW08X7WpZi2PqvLWF7guF0MA6oetnA7WFZpePH26/xxIB
	PcmOkw+9YkwdHCAnTrJVlo8Bglv6DqeG86jZXhmhqfg8AQuOWyBX/ZV4qMJHgxm3WlpLuXwvTMn
	R+aEvlPMy/+/K+pMllA0KTjVDRmfuT2vDrLc1bv0fc25epBNPJTLaVVx2x7un7zxKOUy8FGSuoP
	MRC6wMavbLO9gWL3HevF/MI+P2cvUgzTR8+NcVyyWxXkvcctN4A20ecA077W/5HpQH2DnVia2s/
	eMiIfddiNWENzIED+qhrQYA==
X-Received: by 2002:a05:620a:8703:10b0:93a:14c:329c with SMTP id af79cd13be357-940ef7c179dmr1033548185a.1.1793019447165;
        Mon, 26 Oct 2026 05:57:27 -0700 (PDT)
X-Received: by 2002:a05:620a:8703:10b0:93a:14c:329c with SMTP id af79cd13be357-940ef7c179dmr1033542285a.1.1793019446570;
        Mon, 26 Oct 2026 05:57:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd6573dfsm316345866b.52.2026.10.26.05.57.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:57:24 -0700 (PDT)
Message-ID: <a272a425-0d1e-4409-bffe-19b77c0f2fc0@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:57:21 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm6115: Add missing MDSS AHB clock
To: Michael McAllister <me@michaelmcallister.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark
 <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1792852079.git.me@michaelmcallister.org>
 <7f99fda6f99d6053db240f2f1ba4d7b71da72261.1792852079.git.me@michaelmcallister.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7f99fda6f99d6053db240f2f1ba4d7b71da72261.1792852079.git.me@michaelmcallister.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8u0TagQUrT6hHarNq6atZtJQl_ZJtSb_
X-Proofpoint-GUID: 8u0TagQUrT6hHarNq6atZtJQl_ZJtSb_
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf4e39 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=JwJ85b4fAAAA:8 a=EUspDBNiAAAA:8 a=FTenTJsohk8IYGkfYDAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=qg2vb7sgHZQYDKbllo_a:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MSBTYWx0ZWRfX5Qy8+e2dM8PC
 p0gYXcDGTX9tijzw4T34SyuoPcgh2jLn7RPMgSc1OZsr6Xn+ivJp9dVwDFbzdWSqQZi8V5gGNC0
 nD3YvL/584Qoz/pxu8rSmKPzo/wBGfQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MSBTYWx0ZWRfXy4VayHIMHWIG
 3ZIkx7ZreYv9RCv80AqKLrNWRsiMd0x7eOx1Nsbad4ltryNfe1bDWqmUI4BrdPIoPWMiVKKo5jd
 039tN+fi48EnjLLAwTa1rCqYxPa/VqWpcrSwHIJFDO2ZWyoZCfWnQe9RemQjLqTa4Kd0zsFvFrg
 xNYjTZd+CMvNJkOY1iLcoekIe3AT5RN2YCVuX9Km7IbEGtOLBli/go9BEq8cJfvntS047xk3y3x
 F9THAOz2xQTuWTdbeJzYnTrp7Spslg88HLW0q0BwR7cxZxbl7jyIObBP3yuLtMIzs1bUiFOISPX
 iXWkBBHm/Lg0VIldU6UUG5+WZ0V0OrNzTJ3wIOSPsIZGQaQVwZkH4tsma5K0SufBmpnqyCvlBHn
 DjZWgU1JzlkoudKNu4+t1j6h86myLleg8qPwjAuWhB3+Jygzn5omP/6xuDHVVjZWlyJSEkroaGd
 eFuxznta2s5G9MlXobg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260051

On 10/24/26 4:27 PM, Michael McAllister wrote:
> The MDSS node is missing DISP_CC_MDSS_AHB_CLK. Although the DPU child
> already requests this clock, MDSS resumes before the child enables it.
> The MDSS hardware-version register can then read as zero, causing
> msm_mdss_enable() to skip UBWC configuration.
> 
> On the Motorola Moto G10 (SM4250), this results in garbled compressed
> scanout after display power cycling. Adding the clock restores the
> UBWC configuration and makes compressed and linear scanout agree.
> 
> Include the DISPCC AHB clock in the MDSS clock list so that its existing
> bulk clock handling enables it before accessing the MDSS registers.
> 
> Fixes: 705e50427d81 ("arm64: dts: qcom: sm6115: Add mdss/dpu node")
> Cc: stable@vger.kernel.org
> 
> Signed-off-by: Michael McAllister <me@michaelmcallister.org>
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
