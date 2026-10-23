Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756558;
	b=PY19GzRu1m6Zn2tyk9V2EXR1BxuExOc+olZUPj/3Knp4cDperVavvoaqBES4nNlz5jei
	 wZuiFh/VydPIMnsmJ8CtljzkKkVof9+4xUtrYJPHmpwQzXyUX0gWuu2Jjc/KKEQg8IhLX
	 vUEWia0kMOjSbprQWuMEMK27Y3+VaFuCOdgapHptsvQ1AefGqESoxoKNmubZqZ7nkxvej
	 zqbKzsCPXtySFoo0q3p76geiNjvcth11EGS6drIqP34jIF/acP9D30I075uRIEiqzM71z
	 8St6SvxRxO1fdqjpjxmWxgB9FCowsNJtoYN/mGHrllqvvq9bv+v9rYbg8z5as8Hy/1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756558;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0lfjro51D7Qg6x2xly6IGeYnaVRKofx4mi+Gn179GOg=;
	b=FN2AqzEvNSdyVlY6WI9aDybgKHgZxkpEy5K8O0I5vaFIRppwPZ1Z5ZhHwcYtBt24ObKl
	 4CUzq5xpmmmjptiWpsfIz/4AMTKdj02x7rESJhXCh7hIHkR9Ks/aCDpeBUom9ZWj7p5WD
	 sf00pJefNA1yMySadoDDSJk7vKuQtNtS0tUUzPLR5MhTwodQNAi/PEZ9bfLTYq5yA7RHs
	 WBYVAB9km/9u9m7c93oh0Q+ReLfJvhaGnJ0n3xXsAUQlZpDlCTTTs7RgVgn9lwoJgEK9a
	 ERjbfgnHIGedwv1Zp1Iz/Or/cltmILEukPd1DdKVLMHAfrmhwrJ+K03gGn5MJWVc5gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cJKj8NvR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cYaYOz3d;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40592606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 11:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40592606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cJKj8NvR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cYaYOz3d
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAZP92509114
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 11:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0lfjro51D7Qg6x2xly6IGeYnaVRKofx4mi+Gn179GOg=; b=cJKj8NvR2w+BX3vH
	+aQ4/rwe4iSgxxjXPyYptap1oi8ylQ+JWRjwFhCH4f9p/5hzCx84yZ5T8WByfr3e
	hQWOMHlXMxxAseNvApfRTki+4bd4EJdrAj3jXjQb8sQORdUov5EK7MjlkLWbTgwa
	QpiMarlh6BIUdOu0PEYscJ/j8oJSVXisuCa6qiy/kCYiGrbopZOO9f2Ms4l6NUYy
	TdsMKwQ+jb1mQHAsXNaTaIf7HMdv/DJqAaDoSWJ/RXOdbFCS86TyZo9VyVQKVWtH
	GPkL1L2LjaALQUBqeNw8dNZs6aE8f3UFbku/7kyiyq6P+IUCizodMfx4ZjYACj4h
	s3YbHA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykaxsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 11:55:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f3960dca5so19007785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 04:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792756555; x=1793361355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0lfjro51D7Qg6x2xly6IGeYnaVRKofx4mi+Gn179GOg=;
        b=cYaYOz3dHrMA8QLUy+K0FHR8wkiPvoNdfuBbrASgNBtBKBjOkIF3JpmPeEBiWdsxUE
         hy/90shQOe91me6DwoBXoR284ZTCD5Sw2OP1HuYkAI8I95XSxhr58H8e2Mp8pTNlWuLk
         DSdTOcb4weaX/qPhFpTpvEwtRK/jTypBT8wuelV4XNc5i0ku8qTPL6KydsMLjDLrzGZd
         AiTUj+LJfScobF+l1eNK2FbFTiFDzy7lRKyk2wcsvH209mOMHLeGs2h5GFbb2Hli4K2P
         P8DV/K+8fx6LrDVrx6Wn7kcdovqlFMc/RYne3i2PtGIEhd8rOeT7QNkl3px5q42GJXcv
         Y1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756555; x=1793361355;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0lfjro51D7Qg6x2xly6IGeYnaVRKofx4mi+Gn179GOg=;
        b=JfDFwpU5EPqDRiN8ckhgvvAqxzGes+gWy09F1cFeGFdPm+bFBvoaaUJlTzeOrl9yfC
         Tv3dZ6J3CBiGi37WgfPt/aa/LX2mLQAu9aoTLAWW10N3Ojn198hpAJpPjGwTq9usqvGF
         +orKrh/YHN8AfX5OHSSs6VmW/3YSUOW28IesLGNvIB09QN1ebR14erfnbrPgRsusYteC
         qSwQVwQ/CkHDLpg5Av1p71OCkp256MWFc4IZM36P9Eddnh1Y6+bms8Q1FV9aKZ4vSQFy
         dVgvAxvpzd6hcxy0AHLQYpoH/Vdd+neGTivkvvpr12LF97R73YzaYyUGt6CkBlfUa+Yz
         DjDw==
X-Gm-Message-State: AFq9FYKac5S52qq7Fv5XBhzHPEwsEBAdTR93yd8pwcWKQIxb1mIUveyJ
	RiCMmDyZpM8d/Sw7xj1oo/UOzbfaC9ftFVszqIRkLF86cIpqPe6SeTtK7E2/o8GE/yCmRXQfHU5
	7QDr/Xwi8TPYsBP0MxtUuR4BkTJu5TbyARCsW0ivJMWiMkVlJ8aG6QsCePqlT+Z7c0BE/
X-Gm-Gg: AYBFou3JrquWTy0irRP8SMOZ6cAKg2Rgg22wWu55Am83ASsfzqvC++cwdmRDd+dem71
	8KEa4Fq+FsvOsxSIQn5wYu/NSOYL/EK4XI7CoZmLcjpsJMa4iy+EVz2ID45wJ5nzhMDx/YqRaf4
	rRFaPAeYW0vK9UrsowI2i/aMIdW/idtU4a7bCwb4cdp4jPkERRiDQs9+TYJ4teoCXNHzl6A8rhe
	wPjarshb3mPKTSKK7X2hsNXqAB251Vf4JngkNbYi2nBFQ14DrTUaS+4LoFpcMR0tGeVMTt57ZNT
	X7G7LoMriXPt7K3DTVf+LT9o5+GgWBBx6eTB9AdxPQPuhR22WHv12l+0DOTN1HkrZsIYsJt3zEM
	6DFWtvOtR4rfroaU8Li4zhA==
X-Received: by 2002:a05:620a:a8ca:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f6f54812fmr372791985a.0.1792756555412;
        Fri, 23 Oct 2026 04:55:55 -0700 (PDT)
X-Received: by 2002:a05:620a:a8ca:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f6f54812fmr372786685a.0.1792756554732;
        Fri, 23 Oct 2026 04:55:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5c4d67bsm95403966b.14.2026.10.23.04.55.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 04:55:53 -0700 (PDT)
Message-ID: <feb43c1a-9f1b-4181-b663-eab9e55e4831@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 13:55:49 +0200
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
Subject: Re: [PATCH v4 3/5] arm64: dts: qcom: glymur: Add UFS nodes
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
References: <20261009-glymur_ufs_qcb_enablement-v4-0-9a6ce83195b7@oss.qualcomm.com>
 <20261009-glymur_ufs_qcb_enablement-v4-3-9a6ce83195b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-glymur_ufs_qcb_enablement-v4-3-9a6ce83195b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfXzuikTUDlusvR
 zsKkAx5Yzs4cP7gRgnBnkxQgoCVRtxS4it7EACzBgGHEROm0ol+qisI2LhKU9Gp8QyIfdHr7T9l
 yEqv2OjW9jgcVfz62PLFciU0ot75OStdAgc3J67XF2AL5BvNq50bTFMXF4Y0cT9UOlMwpz3txDY
 hQmnUp6vvuXUCGFdcg5m47+TC+1hcG9EeTlsQ4hHQuzRUyUyswIA4InQJLkESPWZryyaHVvWQe3
 HcL3Nrv7Zzc5Yuaz0mPNTLgXqIDAwmcsF31twBo6LXgTeygNdRVZnAErkspvZwapJcEX8DPVf6w
 /p4Tf2HwLa/qz7lxtmc4F0cKnkeoD0OFz4dvNluAx/9Lhv4UQdruNjcyMv5vWwzcFo3Sq4FjORE
 b76cSnnsh1o9HULGh9OC1+nNyOUqwfawKPBlfcP4Gl/qZk5eF8uMnFv4KZb1wK0txc1E08JdbBm
 Qb1jc7jFHpGHvIhq7UA==
X-Proofpoint-ORIG-GUID: AZhU1xltZ3SeR7mZI6x4S8ylzacGaZOT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfX/CPMCeey+SHs
 kXbvS/wbhNLtwlqGAmBTstUWqbs/3KAxUeOLNXXrZnsOrNMblajNnxtVYM8M0beI+b6X6PH03Ke
 /N/ysyd058HljvjuJkBDyB9yRkadbxs=
X-Proofpoint-GUID: AZhU1xltZ3SeR7mZI6x4S8ylzacGaZOT
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb4b4c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=BBNwevgwxSeHGHzN-EcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230046

On 10/9/26 12:35 PM, Pradeep P V K wrote:
> Add UFS PHY and UFS host controller nodes for Glymur SoC.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---

[...]

> +				opp-201500000 {
> +					opp-hz = /bits/ 64 <201500000>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <201500000>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};

^ this should be svs, not svs_l1

Konrad
