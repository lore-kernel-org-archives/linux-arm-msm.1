Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E426357D0F
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806497; cv=none; b=PPkioS8Nx5HgHngGSnJV41uFiJxS6oubPw4Ccjkljn2+OoUOUfr47aRlw1CCEPBWHOyMSUEjoU8CCOGWzxQViQBglux0Ye/UAZ299gJAr+/+6FcfWfz/XAaPJqe2hYdb2L/PKKPDa6Nztl0bAFejlXG1j6H/0rtXYZ9T8WXpOH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806497; c=relaxed/simple;
	bh=Z5sJhmFXLLRBr6ct0ASzImSOYf6PD/pJ035AWH7eKmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DsdFcU+9ijeEVRmxjf/UeBJ3svKZt7ySHxDYSmAnyWMGGIrhsYoLQFeTkg8wp/qIhpiw4e+2UtBiT92shlnrf5gtEca4NXE6XrzXARAeUmzoKg7LnQNXLCmJRSAnsvk0wlQIMQYj+cEzrMEofSGLWWeC7kH6iGf76GptvLn5JEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IYdVptU1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DhIFEIdL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IYdVptU1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DhIFEIdL"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0FL01236346
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IrhbNqEncl4QgLdWY9y6kNoy
	1o0cUezfb3qsSmxywFc=; b=IYdVptU1X3ctYZlug+/fezFcYqfNDBBu52XN8al0
	c9RscLH71bIGCzoDebkynxcyhIXqysLpsNa98hIdbTtK9ja8Aje4NNExG//5Zctd
	4Zq9SdFya5NZex3cpfWW/ame7QTFdJZDrxYrx/wR1JWfQHU8bYOh1sScmj7Gt67Y
	y6NpG8IohRPrauwJmlIyT+RTkrPints9vvDiSbh+F0eHfp2RwmVtvmoVt/hHO2fg
	i4By1JCaJ30kYO1jUwurkICJpNTUNLpU9XX3Sb4RfMkX7OU8gRDlJsfqn+pYbCwp
	gbciaxfsJQMTDAZMUg8ybXS1goVA1RoPpRdUvpAXkOvWYg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6djud0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:01:35 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5d9f5706703so108520e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 05:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791806495; x=1792411295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IrhbNqEncl4QgLdWY9y6kNoy1o0cUezfb3qsSmxywFc=;
        b=DhIFEIdLIfNXRHXGsQaQlOxZ5zieLF17/9O6Gk7PByyYcujwZI5QotTghToRVvF/ck
         LDDedvH8doyAi4r52XdYTQv2OoHD2yG5EeG7tpIS3FubA2t9D6qDsuc2nEV+2SDwf89s
         lrsVPUJ0MYG3SPT1U0lbgVRXYTOzHWjnO2C61BVUH8yHnjEjBoXQzzXMiHlkdt/P2AQw
         yfb879dvuPuAwWkR9TmIMjUVZwMe5iZeZxcrPNNCm+H7TxOFdApH2LJciFacE7XTqOcL
         1sCytXMn/QwAN/rkR1mWas6yu1Z0EHDSf5ivASbVoaYvn7+rnyPCN8k3PAgm3s3+5wp4
         SM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806495; x=1792411295;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IrhbNqEncl4QgLdWY9y6kNoy1o0cUezfb3qsSmxywFc=;
        b=JAB2521sAyPAxAyVP52XcbQZt7L2QOkkOf1DyGx1DGww2cx5GAYH2Oa5cc/xDVf0r1
         bSLN3JMdHhET/bAmPEvDoSNmg9xNckCJpjFagAljlstSG1PfR77nRVxGWn+RvnIxR7aS
         FiLlcO85ObWqIGFhRpDa9UQH643/NXrLQwXdX6f+E7e1eJvBktdoJwTQOIqqAyBgaQBu
         8iQ/u9QhKFLx0/Zai7BjFF/pkFcpOOvGcZRVxRzxSa5WK6TGp0EkkCqKbEexppkvji3K
         dz4UTfz2bOi9xsrwnnmCiSowhPsRferXETXJiQPtJ0Aq1qb5GQ5M1sGOo7A3OKbUBOF6
         ZHeg==
X-Forwarded-Encrypted: i=1; AKwUvByet0FIgNs8eBTeqgoKlkuLmpfiIG5MSZpY7BZMw3b2uaF/aehtFbX5XP4kpDdMFsvYT30A0bNLzEXrUEzB@vger.kernel.org
X-Gm-Message-State: AFq9FYIAwQgw6t5LRgScwubPOPDHkoXsV2/IhWWwwZ3Rrn977WOXnqbb
	FcxAEZOrwhm4tWKBnKGv7ygkFjgBBPPyO/ahLBXfZwLFoWOzuUbnCMrCbVIkz4Nvd3zUZ8lJZM9
	N4ImS9rUFokjaU1p1NLdpRuhLvrx8jyz3y7uazompvESF9ZrouserXnTKdRA0DIBb8X3R
X-Gm-Gg: AYBFou10NhhpN6t9xTBVwbiGf+Y/woybRedWuBb1XhleQPYGeYKgfRB5Jae5cvdxju1
	OnR76171T5vSM2qEeam8aD7hrxqkLyS6rNe7+RMfjMa508DluWwMyzeaBAOHzeVZldaBi9hA5Ga
	jnZdfuA78AY1O7APBpLxuGCam6CCbr+cFPBAY/lpWci6A8S7gUVvNdzBS+YQpL2ZSOwJyzqA+8H
	yQAzjEtMaPFFV378Le00xXBmg4fxXI2UwfWP2PIChHIwTi8mgRk4JS+3A/ObC3hgtemUylw1ny4
	qSZkONcHfer8SefNAva25u0O9xdiY6iP+N0yK6t5wBkVMdyx295C3sujjdv2PA4452SBDCbOWpO
	BvIigfW5al9U2+II5QDog62cB1DR+1KIrOGWCQ4t7WvGfO9GmsOhPIKuGEOFqX3nHKvZls4s/hx
	7uegPM/JxObJRZ
X-Received: by 2002:a05:6122:510:b0:5c9:a60b:e5b9 with SMTP id 71dfb90a1353d-5e91f47b4b9mr2298533e0c.9.1791806494407;
        Mon, 12 Oct 2026 05:01:34 -0700 (PDT)
X-Received: by 2002:a05:6122:510:b0:5c9:a60b:e5b9 with SMTP id 71dfb90a1353d-5e91f47b4b9mr2298466e0c.9.1791806493076;
        Mon, 12 Oct 2026 05:01:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddeb5604sm2853885e87.63.2026.10.12.05.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:01:31 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:01:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Sayali Lokhande <sayalil@qti.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: talos: Add Talos Lyra EVK SoM
 platform
Message-ID: <7sumgith3zgt3yhkv7ztlxwv4obowr6ed3vxshfg2ineiiakjd@n6a4gvnvksng>
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
 <20261012-talos-lyra-evk-v2-v2-2-dcc9316ebb59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-talos-lyra-evk-v2-v2-2-dcc9316ebb59@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0NyBTYWx0ZWRfX7qU03CtndcjB
 HBKRF0L0o38/OMXCRQDr2jxhOyKHMCQeitRWqCX9uOG1eqfqLxRwQtnZEDsTcaqgvXjPu8LLp6f
 bCGi9/F7KJKiyDHvnh1bc0LCYnWx5Rl3b3qyldjhjx/hVoPR/AHY8fOStZqg7Pgdgs2BnnOii0y
 CgPqcyABixQPkxtWFJtgDg3vjYqdZvKRScaXroU92o3GxA7KgaxKwkwdJtQMy89Yyw83I/fRejb
 jqSBZkECSQg1mzc6ZMCbdvnY+vEuEqGl2O9nHrmx551cLVj1MJZ9fuaGvYwxUp8spili2USkkHD
 MSdKO2cg0WSa0FwS0XJRSO0wD1jY7qLE5CMw/29Cvz8zzmWV5zG1HI1gCSVO5+ucsY7TrzVM2v8
 vbzY8ptVOOGs/bHs42DXkh4QGC/mEjfoAvTUYbnG3dfEx00AXygcUAmK5JGqHQpz09kBKJhernC
 N0QCe/ZD+IQdMQmzzKA==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6acccc1f cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=AFMKbBOjxLGfIDlROosA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: bcA_lVVWCF_jFaH_jSj_nRXKpOhh9v9u
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0NyBTYWx0ZWRfX9gL3D8WfLbuy
 b2sPN4OKNTKDCOv6fKbU1tKKb+MGjAdHHo8Z1+D3OKPWJmbLp85mPtFOBipFGEeyKR40Pk69Vay
 s9PzmeoyF3AP3D0NoX+7wmcZXEzR+AQ=
X-Proofpoint-ORIG-GUID: bcA_lVVWCF_jFaH_jSj_nRXKpOhh9v9u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120047

On Mon, Oct 12, 2026 at 11:46:27AM +0530, Ruchira Revdekar wrote:
> From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
> 
> Introduce the device tree for the QCS615-based Talos Lyra EVK SoM.
> Lyra EVK SoM is a compact compute module integrating the QCS615 SoC,
> PMIC, and essential connectivity, designed to mount on carrier boards.
> 
> The initial SoM device tree includes basic support for:
> 
> - CPU and memory
> - PMIC and board-level regulators
> - UFS and SD card storage
> - QUPv3 (I2C/SPI/UART) instances
> - ADSP/CDSP remoteprocs
> - GPU
> 

-- 
With best wishes
Dmitry
