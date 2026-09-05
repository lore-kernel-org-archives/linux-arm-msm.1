Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EFA25CC74
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Sep 2026 05:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788587364; cv=none; b=fDf/5aCCq9vNxKw0e46qJG0Mizemy8qkkhFVHQ98xcXKY0N3Ang2vdJq/2sTiZwTZmPc+hdGii3zgyqiKe94mvUvFWgSqsusItAAhm/19TBqxugGWPrqq88vvEH+SDEofSwOWxvmBajKXOYRngUTt424giPH7VAJ9KqxSf4/R8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788587364; c=relaxed/simple;
	bh=QsTgVmF9fGNlHhs8Dotl41agIQun695iLSHi1YGphuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YMDIBIVT9thSFFEYydQALOO7qA0TLO/g+a+V0xKlVKwJxGsElfEyPtPd7ugsAMYbroD/j0k5Jger7TeG7iel+NgFAkTjO53br4WehPabVgO718myFYnczWdaDjvzj0iK1hhWibTf8cVu2nFx3XopoWnw3wJA6UXUwlSd2W1dA9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mVKqV6re; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q3riFkxP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVKqV6re";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q3riFkxP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6854q8pI1633831
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Sep 2026 05:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=52LwPd8oEeP8aoMnp7OeFQ+L
	TBv871tOQHiSe7XaJQc=; b=mVKqV6rexTYjLUQtZchTmL4fsv16ScWTpEQc+2Ep
	QL/5jAT3so9YJwRPo4L4+bGCqy9eq3eXF9+Q8C4eBk5Nbso1/svOGkctGFy/GX9+
	JoyQQRrBkFb/e8t2iHD18rWAE3IFZNY9TVfs0vDGB9KQY7KAUTXtUy2VmlSrlw9l
	1Tmt/3jWRC617sPZMJzrEpmijiKrwCizA8ST+bcaXK6dTX3c9FH0Obm+vtuauply
	ZLuph5byIU8KTyQQ6BLphCJm1Zf7rlX0kvc4N0FN/hmsekSDoA8AAHzUGYqIJT80
	LiokmLwxsH6gdckFgg0y6oci40Zrak+4t8AYFhdNDk7MQQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggb5v882p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Sep 2026 05:49:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93494cce712so316095085a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 22:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788587361; x=1789192161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=52LwPd8oEeP8aoMnp7OeFQ+LTBv871tOQHiSe7XaJQc=;
        b=Q3riFkxPxsFwHnHbKolsH790zFfjT0EKDPTRxN9HKpPdQwRT5a6FCV2kO344z5vWMB
         AufGKbadGvPAww2exxpUvXBriZUkjrUcNAx0Odx/PtYPAhrYDLkcHtkRCZOualaV2Gto
         Mdv5Soe5M8cBwpBumu2DpA9uXDLZ13VsdhPO3wWbXgw1GFClBtZ8E9rAOmWinYOHLPEa
         VzO6jKI2dSZ30e4Umq8EnLbrpUy+RNy9xFd21r+WtPPZJwZIVKM0ls7z5KRomKeb3NWD
         +WVzFKs6uKJM9fSaVP+eyekPU0fEmCcTA3I/nFLNdYCCy4ArVWt/ROJ1O+9CFr01NnEJ
         EuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788587361; x=1789192161;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52LwPd8oEeP8aoMnp7OeFQ+LTBv871tOQHiSe7XaJQc=;
        b=ovPJmspomDNmb03fz6q1qFFJ0lQbfNuhog/I11wHCl9JIdbOoD4i9ZLGjf3w2XWv+0
         rjyayjdMMCSWplCidcL1aRb0/Ih8jiJo7LpMxwZ6wLmfNwImkuv5L3U2nX7aZjVJ8TPd
         hRbDW2kpC3qtcNDnJbQgyWlyCPgWg8KJEuAjsCOT3BWvXGLqrzbwFiJfvp5m5ZaJnojO
         /8UqLF3o26j+ySEKE42n2us1hVfvq2Vb3iimKjHGRUXO4FV5KSC4hkohUnINAj4w6aR+
         6Wam+kWfC4q451Rbxq2oij9H/1Q1nZv+ALVRCHQwZI/rG1chGgxCFZ+5R+e7VZX9Uo8I
         gZoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmhCUm43rPpS4oLbwpqE3knlKYxjT9Gde4eb2G0QCPRx51wx6m0cw8IBCIdqmgl3FL9517leOwg7XhEbKB@vger.kernel.org
X-Gm-Message-State: AFuF++mJpRDI3uLvGK8+rk1GJfdq+ZE9g6jKVczcNhcMS05NaoJ1P3I1
	NsLiE2zsdciFUSAvooe89JPLKbAol9ejjMhr7dmwKJkc1VAW0YhW+OUQ0ctMngaQUkR5xnNliOv
	9EENRPT0s7/UJyju3JpZ51IwiF+Be1dMIYbQXEOGFK/FC3DEbE7SpQMc0P7ozy/RZTqZ3
X-Gm-Gg: AYBFou0is5t3ZwFDU4cCxtgmWqs7XJ3ECTn1qmOct3cmdRf0GjAzDDqnRvspun4yK/i
	jyJDtPSHoupV7f/cGmGURQIjRoqlF0enfODhxdAjLIhyfk+khTaeBQ8WxqmE3hGQ/JbHA/l5Qfa
	QsWjaUqSJtG3TsQC80Ahl1YYkSEYvsBdeHAAtBTTUO/8G1MWRSOiRKoH0qVI9IzeV4e4IwJDZTj
	ojVJ1VUIONgxyoEB9cQc8+FifVwGpEpSntVKCsM8sg5PqF7vhLMJP2HCBsFqFAp32/zkofNyvAu
	HZbL8+/OEOI3WebLwCm6VVWB5XN3kspRuOuIZBkUV+ityKvBXW2KofKCrMYs+5hzsKPwAzunTpm
	802TnF9gtLqtNCg==
X-Received: by 2002:a05:620a:8c0e:b0:939:6dfa:db9d with SMTP id af79cd13be357-939804fa21fmr744225485a.50.1788587361417;
        Fri, 04 Sep 2026 22:49:21 -0700 (PDT)
X-Received: by 2002:a05:620a:8c0e:b0:939:6dfa:db9d with SMTP id af79cd13be357-939804fa21fmr744222485a.50.1788587360670;
        Fri, 04 Sep 2026 22:49:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5563c6csm200724465e9.4.2026.09.04.22.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 22:49:18 -0700 (PDT)
Date: Sat, 5 Sep 2026 08:49:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: gcc-glymur: Use clk_regmap_phy_mux_ops
 for GCC UFS muxes
Message-ID: <szdua7tz2cysqqqh2jmkds7jxbfcibdtkfmbxwzp2uozhevo4f@yyn6y53bd3ps>
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
 <20260905-glymur-ufs-clk-changes-v1-3-cdff2c67a8c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905-glymur-ufs-clk-changes-v1-3-cdff2c67a8c2@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: N2cZyeCWoEozAThdHcIiP6EiI5ok2Ogt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDA1OCBTYWx0ZWRfX/WuFOVGFdigF
 WN9bFX85ZYzTZhJmxmuacHne643H26hoyKpxjT/OvXRC0Lm+Uzb0K7odV6AIL7Xlo0vjr1zx1YV
 eTE2VvHDULfLyxpcIJecRVDdQPRcqbGYcw2y0bBpPQaMgjpaF40bdZMln74PzoqoDW3koSaIWWn
 sPjnQVFzk4LENIs/eToel0S3lnpSUu1e28lArsPgkUIA7BrikwyEXIXOlxFUY/sVN0P3ETSvhWl
 SPZnIrU1HF9a3BjyPSGa3B0vbY9y0YIO3wBdf2gNz06cemEQe0SKMe1ohT7jbGFuw7U/lbH5g3I
 Nqg3X4IYcmXqF1uF1/dOsz+nQD+w2JDelnYr5zwI3I/IBn+OrLEd0UVr+rNLJz4j00eSYYOHUqs
 l7wjLW29HItv/Viw8bbR3E2IjJPSQ8e5Vj6lT81LwCLCHAHvBBASsxuPwhvQ4wSPdY1uw9ASrLk
 onQB3h1S1kV50tfkoeQ==
X-Authority-Analysis: v=2.4 cv=UO3t2ify c=1 sm=1 tr=0 ts=6a9bad62 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vZgVdhwgRuDMrAwUH48A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: N2cZyeCWoEozAThdHcIiP6EiI5ok2Ogt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDA1OCBTYWx0ZWRfX4LxCNbS4d3l6
 NaTX2cVCT/tdg1r5h3L/fJyzGmv1/QPRVS9yv89T0Nbp5C3pqn1cBLs/IsvaN99DXkZz+g+lLBi
 FAP4kMeQdQNP1Rlzq5uT7ZxzrYeeKIU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609050058

On 26-09-05 00:20:44, Jagadeesh Kona wrote:
> Use clk_regmap_phy_mux_ops for GCC UFS muxes so these muxes are
> automatically switched to UFS external symbol clocks during enable and
> safely parked at XO clk during disable.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
