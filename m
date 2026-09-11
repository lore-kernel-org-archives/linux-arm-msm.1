Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918F041CB5A
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789108735; cv=none; b=l/48v7yPhts5us4YiMtyJovThQgrfk3TuMLYwFTghzYs6iw8eRAI0Qs+SGboWnV4OJycC45GM9tDJpVfpOuISFYErpnCDBzx7yOTRjYtgujFRUcUt2FWompCNci4Nfl9oy/g1J4VmbIBz5BPZwrl754Pb9Ky+/vVc0FxZfsgtww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789108735; c=relaxed/simple;
	bh=boItcdYNRLaSDuwJMrKPnlUGr8rAib5wS1PhfwnS8Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4EVS9/k0kyA+XoQrcQKgYv2CpCZ31xV3C6SUvs4YznGMaGUGZkS1LJmX3nIfUBjWJhrUgCIDU1yE0R4ZJ/4t4SBirogrX6QnjlSHSTnb/uEtw8YDKS02fKkhLbIba2Oo80xnnI5aewY/v3XrS+EqnLGzvwWWad2wRDjo+MuoVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VnDl+VIV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y/j8LAIl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VnDl+VIV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y/j8LAIl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B5JBwT4002403
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ob8ae5B5IDk8sQgR+LZlULkW
	3J30ZZBC9EfolVLI+LE=; b=VnDl+VIVtzAQ4bhwY9DN+xH1ZvS9blAeL5TWt84b
	M6ZE8am+zOFdLdyb0OBeS3hgJGIi9s9aWP/ZR43pGGiHSenOCkdH5856efFJRVkW
	eVKCbyxyVhOZrGGZe4T4fbANn0l5GP4OadHTcOPRGWs41ypj1qcdJuJIxhmI1PYN
	4ifY/7RPiM5NL3Cp0sxIZXKhczAoWvVyjuSJ4y3yII7K/U/VPpe3Sa3ZyK3RNdc2
	6Jo+PfUowgJ1S8jIS6E1BmqFfUx7Iipn4HNXH3tQ9MSKMilorEzPgz/yS/8nfvDk
	sFDwNgosuEBbKIPW+4xHQpMdh3GqbqX3e5xKsbVknBD0Lw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd389v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:38:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce7dff6253so20598475ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 23:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789108724; x=1789713524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ob8ae5B5IDk8sQgR+LZlULkW3J30ZZBC9EfolVLI+LE=;
        b=Y/j8LAIl0ulYZ4m5SXTEYW0FQsSj0zbczzUnXE5Bnh/6UTMahoeCJrcRh6ml3JGfEk
         Fl0CnFb1opzhgYVh7xnbyL0QrxBK6uZ7IlNrl1h0paLX4lNO3CK8Lx5RHxHNBNdf1vmQ
         HXO0uCjI610+DyiYGgzLFwoWBlYq67JFbHECFp66Bg/SLBNCGcGk/+b8XfQLES5pn981
         JEolgYJ0YvDxxgkLc4Pj3pNGNIWhDhsXP7hXKW5q71PRcK51XrZQKOHQEKeaXLUrIDii
         0ObdAuKd/7q7mGBAyG3cPYBAYVNp/ILxpA1hm0Pmte7hBJW+MQQEJbopTmgF84ybSwrr
         0PBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789108724; x=1789713524;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ob8ae5B5IDk8sQgR+LZlULkW3J30ZZBC9EfolVLI+LE=;
        b=Nzw9d/vldRl1fSxzGcdOjsfUQy7mcS2Tj2r8TlNu4cguUIIrk+OKsXu+T44vwFGIHa
         lnN0hHBWpB3goUswLYAs2u9IIJmRgooYxaK5pZ18lywzUYItlWXjihEniQpj1d23n/19
         F1nJKgp3bMNuGOf6h1aYPyV0tmL77kee1Q4xWESpwYVlItoXE4Yz9EGSekT6zSavT0Qv
         qeXqnXp8YDDV4FIm4wfJbrLvmVDIJF9QvCMNfi8OjQMHqGoWBSWsR9D+gsVfGdwlmwVW
         smLfKVPkZatw+OZU9hvqNwdpOWO38rsT5Fs49bVAx0/V+mSvl/Y9tsLDk975bJV76ULA
         MDeg==
X-Forwarded-Encrypted: i=1; AKwUvByDjM50oWAy+eBr8/nPy1gC9EhrREITisepZPHArtrjE4h4jCP6Lki9EtZA1KiDNjVZbF68/PH/aT5oPGd+@vger.kernel.org
X-Gm-Message-State: AFuF++ncSfsskQM0FCLS9kuB0CaTD+/8sEHo5I6WcBGYL3rxnr1y5LLD
	xPh3zM53g/EHrRf6EuXstzYLnsWWKJrobEQISYiymuVbDJqjWi9k2jcTUf7JCXhR1hOp7TGYnXw
	Ix+eSB7M/BOU0d41Cr+GO8oeKB/O1b/oIrpi99kBJk+60Hw3HZI+NTeEXcgFSv1goaDAA
X-Gm-Gg: AYBFou3VGdLv4VU1g5c94VrOFiNS2nFwKZDhrABe4n9+iVxWDCz/Qvy5TpOrOPgIEMj
	Norumn/2tHKDe4CSyXLpjVBR4p7IG40jV+yjjeblaEXNFq6oRJlv2pWsjdyyyxv9eZbH91pH9Kr
	w73F9k3ggsCbZHpagMTcVGi6eErjTO1/mJA/YHrrDAeqOAft801oq9T71B/yX2fptKeSgi8jt9V
	YSFGSw7iY7dQTpBxSCxEO2+MP7i9cbabqhiG0qtKvgo/b/lHh90U7d+djisQRtgL4L6dSmS6HpF
	+siYlIHODjvVcYqA4B10nAIgyuk6q7JoN8sN3s37Wcot/k9MGv0q9YpMRELo7+kyK3zsJVqI95/
	xyfhmMSRd4VU3MWaDpV26scoIu07S7ziXiKQcrVNmFO8=
X-Received: by 2002:a17:90b:4ec7:b0:398:a649:8fa3 with SMTP id 98e67ed59e1d1-39d77b770ccmr11591572a91.23.1789108723655;
        Thu, 10 Sep 2026 23:38:43 -0700 (PDT)
X-Received: by 2002:a17:90b:4ec7:b0:398:a649:8fa3 with SMTP id 98e67ed59e1d1-39d77b770ccmr11591525a91.23.1789108723200;
        Thu, 10 Sep 2026 23:38:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50e3sm3835825eec.29.2026.09.10.23.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:38:42 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:38:37 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, zhangfei.gao@oss.qualcomm.com
Subject: Re: [PATCH 2/2] soc: qcom: llcc: Add LLCC configuration for Nord
Message-ID: <aqOh7Wgoj7VnM9X1@QCOM-aGQu4IUr3Y>
References: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
 <20260910-nord_llcc-v1-2-30fd1cca65fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-nord_llcc-v1-2-30fd1cca65fe@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Bv8IUoX5 c=1 sm=1 tr=0 ts=6aa3a1f4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=OxrQ4fpuk6iiGASJZ2MA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 592JMyvZ-CCYrBZCfG3p4y6cZgPSxWlw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA5MCBTYWx0ZWRfX1rN92ToWCE8P
 /v63UXBRReRY3UhVY8hIsQIwvwMSWSDLieIdtorriQW5D3iqLJHCijx1UB+KKPB+JH2Q3gXjZOk
 unfapO4ruJPFeX8XZg6O8di4knnb48k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA5MCBTYWx0ZWRfX++WhbE6tFCgI
 pK8Qs6z/QxjuTQFurrseCrfLgRmTnSk3exueo5h1nE4KjgIk2uzLEO1qaKurBQvrnmHxQnqqiQN
 ZFW556IMBbUuxhS4J1jf+LolfXyzlKo2sss2C3DpeB0ciMIS35AqOsw82YtT+vu5S07ue4L0NQB
 MX3DJi71O+dQDxt6x2wOdHz+pmif72cWhthA4HcC96z86Zavgk0tHjfYrGyvJJ65WwbYQNurH0f
 ndl9Uyezw05FOtOgYSUVuxTWiI+6S+d5/ccEGFQVjkXyh4dlbYWrqwgpjdjJoUvGZZQCiiGzHbT
 8dDlyf81w3KJPQmqiUJRhuJbatw0EwGVnODGo5YsAjbUI0P0gymMBacpnYQbvSsLTB1vnyOKuxd
 NVSOd2cRosM6nli2E0DldGudWhvr6Tg1HKiFUx59JceBxhZ66wnLnBDlsmP1+a5MIQoOFYa7+4b
 wJfunyyii2GpA4avT1A==
X-Proofpoint-ORIG-GUID: 592JMyvZ-CCYrBZCfG3p4y6cZgPSxWlw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110090

On Thu, Sep 10, 2026 at 06:30:44PM +0530, Anurag Pateriya wrote:
> Add the sub-cache table for Nord, derived from the Nord AU (Safe IVI)
> SCT table and limited to the POR use cases that have a unique SCID and a
> usecase ID in llcc-qcom.h. Nord has the CFG0/CFG1 pairs and the full
> ALGO_ALLOC0..3 set, so it uses the v6 register offsets.
> 
> num_banks is set explicitly because LLCC_LB_CNT in LLCC_COMMON_STATUS0
> is four bits wide and cannot report sixteen banks; a wrong count makes
> the driver map a bank aperture in place of the broadcast region and abort
> on the first broadcast read. no_edac is set because the bootloader
> leaves the LLCC EDAC registers locked, as on Glymur.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
