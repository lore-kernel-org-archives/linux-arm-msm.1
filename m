Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE0842122B
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887311; cv=none; b=ddkjGq0lAO3bIlMxBdb9m0X5lf5aQslL04EdrcJN0cc9pls0MTIJLZZCP87KeagXipEa8nyKO/8ehfIsiqV3lGwmmu/MjZWCEgNzNx7ZTTEggU9nQob7oTPEwMLIIlzpPRUbLZDM0TyV2jpvBjszD86gQWElJ2lgG/bn1PUacRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887311; c=relaxed/simple;
	bh=NDDyimJay41Q8YbZxA74mfwjIjsKdQBWWx4V87lUn34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nadQrIuhvNETQSFJCtEJPsqhKjzGb2HSe0fW8sMMN+ucuKrVx/W6rwTOTCSdufqxQ3R0Fg6uSy+3mYnw5E+lwTkM699zopFQAf83yGoHFDjI1MDHGD5gUAOjLbgSx5zBhLKtd/GgLrZF2X4NJvRe5DoCrT5F15IGKJkCdG46bjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ch+CpLRf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h4Kgq9/L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ch+CpLRf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h4Kgq9/L"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D900IZ791170
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bpe8qQ3M5h1iDZEhG5mujR04
	iapwZbDf0fYwJj5/lTY=; b=ch+CpLRf8vZUGgf56aNlWN/1uHUr4tjEFSawUP0G
	hvgrzNqir+yvF+vo8626EQ6D/RSR3XUhr7rAIuQCOJ1um8YKFTPhUhNNtHKI4jvJ
	wdMCptXNiaZqoApCOJOxNmJLnmECRM/b+Lq2W3sh2hOe7tQPW2ewzyswVPl65tKV
	JPeNqlcUO+DO0CI84F1s10yXiFA7HnT5tS00xjcBxYM0tF6W55W6KmH3PnZw9uXj
	HLEZqYLmYIA5ubqTQNoy+h2nhpBJZg4qMS8zAWNsLoluw5WaDfAZRiUbPEbbXY6/
	pEihglGTFqFeFpWudux8AF/AKJ6uq+++QS6JnbQbSoYeIA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjrcpa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:28:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb71b1443so614058985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791887306; x=1792492106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bpe8qQ3M5h1iDZEhG5mujR04iapwZbDf0fYwJj5/lTY=;
        b=h4Kgq9/LAUE5t7ffD6r6TMKYpdZEhGFTKhy626+kR1qeOT3T/l3Py9dIJpmGCLyvPa
         txJCdT6jfinyZI5+fYBe6tJH0Lu4+pfzwD1zX6wr4eeIsd35OwXH/YRO7HBwrEQCnQYL
         geN4Qk44Dwr4xcVNk8T+Q8zQ8hy0Iyv8RleNMVEe5h8idFWrHazIF0uNnLivCWsJ4qtH
         juhI/Rt+VDcRRin+qc9caFLmJlsLpc6CjARjpiaY+1VFMu3dtKWcw5sTQSRqIp6Ep2DJ
         D5hEozpoRqLI0hhM6WBIZa3u4KDYOP4Kj3ORUKzq6jOOyOLYs4cJsv4l+IxQ2+q8S7Cc
         7KCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887306; x=1792492106;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bpe8qQ3M5h1iDZEhG5mujR04iapwZbDf0fYwJj5/lTY=;
        b=bjP6I4Y6QQ5qAlxRkgg+VD70xIzDpKqKKlCNsz602l0QHxt1r5An2vGDNi5OPK2h0z
         /AkJemyN0vVeJAklLT12O6wz6fRaXBcQIGbhIqWFWvXxYMzYVNY9BMEm/O3v+FPpeZAJ
         FLToRbY+j7i9Ks/+7UIzT7GajHSFpMYcwcaspV4ErMtmX2IYE6HSva9TXXYKd5Ql4pSH
         2JNmC/ceDmWVJi7KAZOcck0zrE77+dXwb8z2X58Mitt0Dp5YEWAdUBAuPku/qX4U0uwX
         BdUKRcxy9q7TqB5DBpo81CXc939o8/TuVVz9JcZdiTKOL4V6D90iPtlUxqQ52SrzZOV5
         vtHw==
X-Forwarded-Encrypted: i=1; AKwUvBw9Y8p9Umy3RHgkqFBFXsqFhLd3vG4kLEJLdTTgoMDCCtc1n13nIVN5d7DCOQXySvZk/DDhb7MV0tFEmIIX@vger.kernel.org
X-Gm-Message-State: AFq9FYKXWelw8O5Cn+2QdCYnrP3cf7Zw9WhoCX82NFeRvvaXcP1r5zfh
	KIInIKIEFTES/63p3N0EYRVSC8cPmUQzm+KWnGZ87iYcddYUT5/9ErYug/gYkgS2/DQeHQJDqYS
	WyYHZoKhkn1Rc6Ex0ARXFtBl70Jbuz2McM7oG4dktAW+zNrObXTdx+E6+D3XMd9jyWr1L
X-Gm-Gg: AYBFou28Z6KYmTQljv5S+qxN1HGMavkre0c3oATouT0AAAfWwi+IVuGvnTaxtTb5xKA
	8OtjhxyLKthyKiOsbJukxo174vkVcScROX6AW1juyFwIal7tcfBBEoFrgDvsfSqu1tA2krgLT42
	SzLnwDOp5y+t2rYJTxB3Dgu1fWb6/XQWHbHZCL/U6vnjNljRSU2xv16RY2nMk9Whfgh5tvTe7eo
	6z1wACHjNvPDOlgOijqV0lmoAk0a6YATvQpbtF3PWFtxW1Mcz5cfJDFzwlu0bQrVHL5ZPnyF6fR
	oVRLJkyOBoT6jriY8bkTLJWFBPvdcKGiiKdc1CoOJhDgWko0Ce7KEPI1HELekA395uJhoH/2p2e
	VqyGvKg37Q9ol5v90Om/xkPGlt4FSBNwffK+GwJfQZ5m4JEUMNuJ2ciWRqmYw5U+c5ziR/bpKgf
	TJab64uuiz4a2d
X-Received: by 2002:a05:620a:4693:b0:93c:771e:b672 with SMTP id af79cd13be357-93ebd2955d7mr2099039585a.54.1791887306582;
        Tue, 13 Oct 2026 03:28:26 -0700 (PDT)
X-Received: by 2002:a05:620a:4693:b0:93c:771e:b672 with SMTP id af79cd13be357-93ebd2955d7mr2099035785a.54.1791887305992;
        Tue, 13 Oct 2026 03:28:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3cc730esm34197011fa.26.2026.10.13.03.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:28:24 -0700 (PDT)
Date: Tue, 13 Oct 2026 13:28:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v2 10/13] phy: qcom: edp: Add Nord spread-spectrum
 clocking configuration callback
Message-ID: <ix2c336s65dqq3trynfpugujuadqcrpojef7vov2g4h4sek7eu@icwb6gfeewax>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-10-a2ab9af954d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-nord-drv-dt-v2-10-a2ab9af954d2@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfXx84c2HTPqswN
 QTTDpMKwxZJ2mkz/hVqYZCrEMVw6tpuZaI9MIe4A3V70ahGTh2UkuVVAckWdAJmd14Rw+eliLxJ
 xzJ8vUTDM0HQP1zgQY3DfW0PThPe77k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX6wh68pkEgaL+
 gJ3Ud54e1JZj/Vkw6VZ/cTRCzcqMs/5K/xkvus87SrFf1gm3W2aPgaabeC8lktWjDO5dXRX1AFD
 TTtdarRWKdn0Xl7vLdKE2Bb/V5QsOtfvlHYiaRyDTfws3aFr8N+01CvJIyY5BnCfwqTs8QVmaPa
 Rr4DF0b8CV41nzg/HFhogNpOUjpGytpWIy3WVhlYM4iZdn6IOQOiay/F7oqEsqmrWtCuyWSdYbN
 z+viRIkHmkzB3RSuugEEHN2MNfGVwubnqpe+xxzdm5VQpA1ooVt8YufHoNniVjKpPP0K2XT/EQ5
 D38oEmmVJQn0pD1ZUHh1bzE3wfuFvSfbautKHFg4EhP3D7NhciDEc2RwcESiE5AkRvGr3PLfC2P
 90pX50HlE4QFZOpRzmLBriMUORIAxuD8PwLQSOFyoFdmroz0TCUTvS3MjBDZeI6JdckvxhGftNH
 AY5OVcy7DpjQ45MtnEA==
X-Proofpoint-ORIG-GUID: hH2dOt7_7I8Rpi1IIXI3_swUdPn4hNS5
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6ace07cb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=kwn4x9jUkZ_pmG-z6m8A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: hH2dOt7_7I8Rpi1IIXI3_swUdPn4hNS5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130041

On Mon, Oct 12, 2026 at 07:02:20PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Nord requires different SSC register values compared to existing SoCs.
> Add qcom_edp_com_configure_ssc_nord() which programs SSC_PER1/2 with
> fixed values and link-rate-dependent SSC_STEP_SIZE1/2 for RBR, HBR,
> HBR2 and HBR3, per HPG Table 2-9.
> 
> Assisted-by: LLM
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 

Squash into the previous patch.

-- 
With best wishes
Dmitry
