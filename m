Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7196341A76E
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 13:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785160555; cv=none; b=MehUEn1KV4xZhMlOmiIUSKARC6xu1h1KT7F+qUfl4H8FSwLSF29mVkA66Nsk9tSlBmByD+eBTmWLviEYOZ8jHMZKKKA1emjz2Ej59+ndbJZO71FSj3vKAYRAVKbIQpQ5D+N4BFp3vgn6TVlgjsqSZ5kwAQ9y9/yfM42CgQZu+Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785160555; c=relaxed/simple;
	bh=tgmjNeM4RX3moHUqbuO/yW7mmJhG09+PPGsCcilaAs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0illbcaBlgkTWBtbOBzI8kp2fkSqADRWFMwcCLmgBO0ddfH2f8oqHrfeIc45bC8DHu+KC1keNkFOtiH4+vRTanm1GdUocaU5qsDFCFK3IZQ47LWT7AUSHUublUbt7H8zlp4K6huEwuDjYq627UCSZYiw6CvEzXMPBZqghOGMJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lIWEDlJM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fpofVy0j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lIWEDlJM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fpofVy0j"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlaS23414011
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 13:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pkdWnQuMpd+iBrUuzN6qCMfq
	8QBHq95joAhH8/IHLoI=; b=lIWEDlJMUMOGG9hTGlYBziKueCiRCG3/k+Fnr2t3
	TH7vCltg7/HmslvNngNA4lSAcdMOKlAO28IjJksPtRhpal3guLTRL/udcaL9UKfP
	psEz7NWY28VEVuhO5lPvl3s9OT+euqIYjSNn17kLdKIGd8ht81mUmoRESC+dUAT/
	MhE5U1MmEYTleS2j+UGUaVP8VKuyd41fKx/Jp0zFma1ta/mFTpyTpOPhmGZJ0+80
	Xf2/ZcIZlagtStdxbQ1vHTlkVZ7Rxp/vtUhd+1AlYqdantfKSWkI06AuMfkvj949
	uO8eBJsOp3qZph/17JEJeBuEV2O73L2cdb5vA1orkGC7Rg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4v68x9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 13:55:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c12e43b98so34654091cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 06:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785160552; x=1785765352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pkdWnQuMpd+iBrUuzN6qCMfq8QBHq95joAhH8/IHLoI=;
        b=fpofVy0jPEIisZru1E8gzGe1TRJHxnRwim5Xr71dZMlZH5liZF2+JaDR7zbig1ateC
         UKsKWbVMZhUS+7AMsJLGUnQYNjo34/d8rv7pAxdRUnEkQ8fW9aCwV/rNxd+aHouzGdM+
         en1a/ytv30ZIyFsG0CqK9MTR/4yQYQeC+S74hsdeaP1z0F6Qt84IueFBiEjUR/A4WowL
         cGS6bO3VOonaZepn+jWtgbZlTzjTcSacCt1206mynzHoOHnBaZDGegmm34tdgzj3RDsm
         O5/2qrgT9dmgQ7jgC1OPv17VnjeGbjykSS6xEybLJtDzctNYoC6E3F1fQXmVCd1ddlTs
         nGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785160552; x=1785765352;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pkdWnQuMpd+iBrUuzN6qCMfq8QBHq95joAhH8/IHLoI=;
        b=Ohf9t7TmD+nmjZ0V20Xs6pB/G59Icgn/2SrfndISRpHC9rBVTEzbza9GdwgsM6Y8uP
         sT6jVMZjQ3F2wBRpWv5hAvRX+EwwnXU6+Bzgc1a+rIQOy0m8JjlyxcNCa4b7gJjevqTT
         qdYLnQrNbB3OSCzbCwdXr4tgdbzIgPyLf8aAIVmqOQrjharthIq9wC/JIfPDaXV0fRgY
         sAj21nI9dRHtCHxmJ+VO3QqZY0VK6BTARF6GWubyuy8o/m5pr5wElCRIoR/9PjKoUlxd
         QRoXQ32t3of6mFPLV2/N07PAPpoD4DcWB0bP8fDyF6tu7JmUwAsBxbE5D99ehOt/LJ2Y
         QBfA==
X-Forwarded-Encrypted: i=1; AHgh+Rp51f7JlbHbIM8A4W8hc1wZIrOYfB7pFuEnnM9YYCDWXHH7ccS75lcvqO3SDggTR87XN/VEm8+q0e/ETbm/@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy1yzqT44bUgiKMrFlSoYtbTysfcNyOl56q2gsH6DYSW1EfN+q
	R2e6ULjaO8y9y1tYKaX+R6EADM3V+5fysB/pXtdayuGOlUNBxrDFcsqSPD60zzg4HE/ttLDW8iI
	rxpDibmnH2WFAomc8RTyswcQ71RQuyXrQJqZz33wgh8tTobrQwL3P8KkP7PaI0dlaBhQmMAl01B
	MD
X-Gm-Gg: AR+sD10EvYq1Nb/PX0ujTCj/539IcwV67mUcukupxGuY6rpr2tMVx73kboAb+HnnMw2
	Om1DqdJotNql5n6hEor3uPMsGsy1+JtnUpYf/tNro3MBzdxsT/P0IA3ACNQSspAIhlFF31KhxoS
	CcUK0Z6iOlThFP7B/hoJ+RDYSm0itpnqpn4Os9TZ9AhZnMipf58dEv8u3VqwLjuQTWDCddYnvcL
	jx5VK3HFGKPVscEdd3JST8mFSM4t32MA3pLbB1965ZkNr5NzoaqRnsOKIY1OYS2kt1N+twGMNn0
	2P9Y99zPHtgd+20Eeygx+kQuxSShhBlsrauo4eVN1xH5JTawzZHglCUYxYcZLHug5pxHCfW1+OQ
	D5CnnUz1/5XB+3Ow=
X-Received: by 2002:a05:622a:5889:b0:517:78c7:d93a with SMTP id d75a77b69052e-529ccb0d75dmr10017951cf.16.1785160551693;
        Mon, 27 Jul 2026 06:55:51 -0700 (PDT)
X-Received: by 2002:a05:622a:5889:b0:517:78c7:d93a with SMTP id d75a77b69052e-529ccb0d75dmr10017541cf.16.1785160551242;
        Mon, 27 Jul 2026 06:55:51 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c67339sm51706327f8f.31.2026.07.27.06.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 06:55:50 -0700 (PDT)
Date: Mon, 27 Jul 2026 16:55:47 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 10/10] arm64: dts: qcom: eliza: Add support for MM
 clock controllers
Message-ID: <raojtphmpetjitaiaf7e77qvs5zhv24ga4wix5klndbkcy5t2i@tcyrm2xzoape>
References: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
 <20260717-b4-eliza_mm_cc_v6-v8-10-5cca1bef2e48@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-b4-eliza_mm_cc_v6-v8-10-5cca1bef2e48@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzMSBTYWx0ZWRfXxV6wSEQohBNQ
 62Cq7Ol1J+kqEkpx7ZOLg4KvQ78Enc2ENNlBtpdblm+A7fsxnMU7/R0YhCC7PdzttFc6ylYHUxN
 5Lw3MNAYgnmtSkBfguUSUhAwnaIPHMQ=
X-Proofpoint-GUID: 014rGHhCbxM9jV1lVoeijBAwUqcoljDq
X-Authority-Analysis: v=2.4 cv=ev3vCIpX c=1 sm=1 tr=0 ts=6a676368 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=XF3s6JUOJAP1l5vmAHgA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 014rGHhCbxM9jV1lVoeijBAwUqcoljDq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzMSBTYWx0ZWRfX3c79oj2CG3OH
 W7THtgkfE3KgODbhIs3iCfwebxJXWcagUykC2xW0o9c4em4ZlGQ/juJ3M26sbGo6ZDwTZUhPZB7
 ZXfLM45PctCxGTqnM8vB9vXtrER3nf9QWoUHoOjAx2P9+2IZc2JJCIVfujmTQyh3Y/l2Jcxi7TS
 kpMDEfrxLQV4068G8/VhvgfREEQ26MPuPewsX5xYoakliMfqVOmxZ5nzYgkFwpgrD/8nq7IsNi+
 vC8DgYVTn8Bi8lO8ZmXA504ksp4bwpwXegsrC9MB22AGNLU0zp+xC05Y3jkDhTL65Dl779/ZX6p
 plmm7nVdOqW/8HwBANAt9GLAj7h8y8DbC/urAuUyHb2f9mkt6tMsvAEcs75RfGlgddTAr+bSPNc
 lvK3drOwFyrMbBh7XG0SJiQHf1oENuLCg4s8Ne+9t0tBe6e+zyL5eTrrIAac468Vu/KOLK/opyT
 usTW+BtOJsk+pskp6zQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270131

On 26-07-17 13:01:54, Taniya Das wrote:
> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
