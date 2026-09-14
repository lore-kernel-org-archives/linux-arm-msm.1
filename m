Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E884772A5
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393714; cv=none; b=OmRJBPMli0yPQOnDprY9hqeMghrjFDIIdJv1H2uWa6ybYLm9zXH7hDgl+qwaPLakbcd44nUs5YM5xSnYqQzzbjwzBntURjAq5FBlInA9nxXX5xDTkYC4uhne0wzauhspgbjLpn+ebd7NoXIjq8teRAzp/wpvzPU7yHX1v0usFKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393714; c=relaxed/simple;
	bh=wTtt26P9/YFB6Zh8WHqX6MNSaxvf4tRs4sEIMdB7qe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tqVOMdo2o4bd7+2Kl4K71kGIMaEyQYbgdlmoHPmsbofWg+IBhO7vASrI5G7ErKNx0k9qPRZEVoJELYqMOzTgxzfp6c92x+qwXfVwX90kPiBf5UYG68ivwDbGDOwqgYr3Ab2VrHlCt9Zn2CXAz8+gtZJlMmXEqq+wY8PuxrAVKEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GuqmraSg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FSpd4d+h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GuqmraSg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FSpd4d+h"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0Txp1761392
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mgXTfcLQ0D0zx+3T86XCbLuz
	91+Iob/1aPO996gOmTQ=; b=GuqmraSgFp0wUDk8cSY8HASx0yMj591K1BCA/wio
	EdOmlz2xZ2/t/xZkMZq6z8XmEOSvM7ezVtZYS8J4CBEYReToPD4s3/JjmTZMev7F
	huVxjpX0DmFMS13CohEX/t5Rw2eeEKpqfoUsnwSd+8Ivt1TdI5qtTFnI60+ENaT6
	wUKxZgRnKsyruib2KnwGOpoJq9i1Fs2REmHy30l+dAnNvF47fVdIUtjJQbFsNsFr
	cwac2IgXOUN4oZ73egSUhjm7TvAUNkHpLEpU+G5cG53aw+u6Vg5a1aon7r1IuuRo
	cbiGgYxyL2kM0gi0LuTRsiZO3k1eG1YvsyIExgkvub1WPg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex8xvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:48:31 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c58ce17b10so4131451e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 06:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789393709; x=1789998509; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mgXTfcLQ0D0zx+3T86XCbLuz91+Iob/1aPO996gOmTQ=;
        b=FSpd4d+hS4mUSRORxt1GN1+aMU6upboJgdBaYycTNpb+uEcZT+rPITCNTmdDOW4arq
         Z+mlxp4V0ju85W98HP09pB/UQujOS4BO6otsd0DYZCG7cPj57kc+apLzmd2PMoodt0W+
         DGgHBTnoTmi5DwS/DP5JjhXPOK04vdzREvOGwnPVt861E223Z33c2s9TYtdc9q0/S6fh
         gBfu5Ooe2vusVqaqOQwCAaAYz8kKI6cWpNK7bpHMQFGO+QZftzJQyw/ROi4NnPGIj0fy
         /jscmg7M1ZIP5cXyn/exKCcwgERemhctyEaCghcCZ0pAO3FU6PM0mJwDPNY1bH+XP326
         2xpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393709; x=1789998509;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mgXTfcLQ0D0zx+3T86XCbLuz91+Iob/1aPO996gOmTQ=;
        b=Wwg+StCXOaz+ow+69maJ1y89wVl8ME17XELZzuJi99PVoKwgBfNJCYu21BpIQlVwRl
         eAMb6sH6Dyt+/1w/4xn+caijaITi4mgR98+Ju9AJNXG9Cn43Qahae3OShIt4p2x0WoZh
         fidulTByTifVqimCIKI+Npcmrgo9/dW5Gr/dIxoeoER1XaUxE4kjQZraWS4/hVUXVdrK
         bFTH//TPsccez2y1AhIzUYL8qGWumSqbtCDhAC8pEaQDXa3as5SWXCG0aBvWCQqK7Ig2
         tSq5qE1s4Hl50MpALVE9HHGyHdMHuOc9DjRIqLFMqzDrjcGQ+MnlaWUGeN2Z4ndzzQkh
         jH3w==
X-Forwarded-Encrypted: i=1; AKwUvBz7IiYY/ECVh87bOCn+7qmvIUjjepct8wH133z5mrPVi+AhqEJeIwpO5fiZFm2AJz+fuKmIUWEiQtfXiXoC@vger.kernel.org
X-Gm-Message-State: AFuF++nuDmXoSir2V4nJGLpGC+p2j3bTCeaD91a06gDCXhuBmz8qx8SI
	mc25ipPqkbb9naECmqWfKzpwx+ycJerPzlNyzrprYmkEWI0ISpHgfMZsmiBeO1ZwwHWB81USgjA
	eHGmzWFlKd8viMVA6/2i+XmH4v/x3vOAeR1usxCzXzYa/ehEZ+hefqRcPwRh9ysiP3p2k
X-Gm-Gg: AYBFou2m0FwvF+sChQRFg7SrJ5GVmwpO4DmNQEgD9n8vb4sQP01gkppSrjHAn0FuQ5/
	VeCchfOtG3fWBwclklMFa6FsbbVFEvGnpDdo4faFIhoxpCCbDj72g2US/ZMwBvOi9LgRQN05xUu
	kIIufgH862WhwH1bK+bMXpGOUHIvSs1zOnu0DBp2T2PzXqrRIP3h2e4Mcp6tNnlTs5zGqp4wn+9
	L/C/udqIAnUcwiEpZta4RmYy158lhgF/3g3wSXYZgMZXBtCqlqp15kItZF8fwgFEleErpn6GlGQ
	Ew2fvNDQKmMpMLCRU4g5iXU9+Gt4c4redgOdsQHym6uIEFGHdjT2AA8NYsNRDhcbfXGqMte75CX
	h67G0hDf+TgtA/A==
X-Received: by 2002:a05:6122:4909:b0:5c8:3a2f:a497 with SMTP id 71dfb90a1353d-5c9818a8132mr2352697e0c.0.1789393709481;
        Mon, 14 Sep 2026 06:48:29 -0700 (PDT)
X-Received: by 2002:a05:6122:4909:b0:5c8:3a2f:a497 with SMTP id 71dfb90a1353d-5c9818a8132mr2352577e0c.0.1789393708749;
        Mon, 14 Sep 2026 06:48:28 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb330bdcsm28037041f8f.13.2026.09.14.06.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:48:27 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:48:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: qcom: nord-rrd: Enable PCIe controllers
 and PHY
Message-ID: <ua54c4qtcxrly2qyae4usdc5f45vrtlpnog65ym2int5jpz2wc@3yxj5jrcwec2>
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
 <20260914071944.164217-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914071944.164217-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5NyBTYWx0ZWRfXzKEug3aIkOcO
 Btwn6kw9MJqKcCvjbhnFZJT2HCgXB3shMrRlg8NO6dbL4hb4btKBNwU9XH6bA5/HleB2eD6adCQ
 NpGbUgOctEY19f0c6+pxBafBYJLOjpmMBymTovyr4abyMtCQHkGZaYEa3RSQN4i456GOxR4l1/y
 U6qyvcAByVlmwbHUDd2W1XpVuRvK9IKaCXIFyCVIGE1HlDRbAfM/Jxl4eqa5x+222RPbeBo8qEx
 tCvj45tlUirThJsBDuYm/iVR2q7pCwGHkesaLUpLslhkCT/0qVCGT1suci8inzxYAugBofjJeB+
 P0ycMfbR3uTl+2tx0a/EJXKGysO3rBRIA06RIIC1BCSrDSwoOWCQCw8cdg4WTOou7U591mHZw9G
 HQryd9NH6yIA9l7Ms1Iw+WJLE4oqaWxVVoq3RK9FLwL9uVLgeWt3R0f+OhCVG23ogzfKyfLJSah
 O/oikO91ShZxioOil2w==
X-Proofpoint-GUID: kPVMHAptKKViLuyRyS-dmii0T5RtQsPi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5NyBTYWx0ZWRfX7Yb36PydktFO
 z4xN+7Uz2czJx2SMTTqreBx6OZYrxD5nAM0Pmz87F2f/LAtbocOEyYIugHKEyfU5X90SuM8JW7V
 HZrX6UO4gJHTYo6eXkqAaawUQJolmus=
X-Proofpoint-ORIG-GUID: kPVMHAptKKViLuyRyS-dmii0T5RtQsPi
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa7fb2f cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=MrLAvLjqEOgBX2ddU8YA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140197

On 26-09-14 15:19:41, Shawn Guo wrote:
> From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> 
> The Nord Robotics Reference Design board routes all four PCIe links, so
> enable pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL
> rails, and describe the PERST# and WAKE# lines of each root port.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
