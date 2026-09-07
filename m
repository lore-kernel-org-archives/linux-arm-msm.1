Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FF846984E
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 10:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777753; cv=none; b=pePunCespBOpgqPyMVvUYpYF8TQ6SNg5Ir/trIGnS117qRxDnaVqCNuCqvKw1nTQhvuz2GQrXAmnZOI4xstiPXUpt33UnrDLUmtzu8m5kRyxCwX3c9/YhmV5nQw5ETLyARgAeWW0GrFoEZF18yHNUGoET4WHgL/vm6Gpo7ME9FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777753; c=relaxed/simple;
	bh=ozR+N+I1Bjiuz4/cQVCEFoCWZJrPMxo1R/fIuMpKg8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s9RULGkYyqV0mdB5To7LXGRQz3DaSMWTDh8SgGyAIh5M3MYIZs+VNpUF9+yObpSPpnua44zv1inhP6GPKPwtFeshHJcNditqCEu+hBB8t2B3dbVPgC8VS16csoIc4F0YhaWBT0a9wgu+RSl+79pXX9hTFPtnJDADLDCDZihfQLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OFoXXChX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GK7fmfab; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OFoXXChX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GK7fmfab"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bXRF3713216
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 10:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qpyEpJBVtSyYB59cPODVufFyZlVpTWQhTeLIXPfAKSE=; b=OFoXXChXRPt+8y1t
	rCu9cL1pFGKGkTKvKxdZBRV246LUlczAHolkAGwlz1CLhkvfmPJBwd7cKR8xCal1
	tyQaGXQ3sJBf2SQLq/nHMv51KLJxDmpBvRyqKp03MyCQ82PCVb8UguX2V+r/iIwU
	uT1H2WjsrGqudOP9JCXb4sZg0xSJtyTK60AAmkTD4brzfbiCwxL06IQg5OO/aLtm
	Dd/Qrqbwymo22eh/Z20F6GNI6hK6KlOHYyQKZPVxnff8xP5dqXVrT2YnQaD6KUf7
	8DPCVZHqJeHXccoKfoYJhTjdSWHOCvt0Fi/dWKOnALyESzp+pqKKLq1DYCCa14Tw
	PjMpGg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj1mng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 10:42:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398fe469aa0so5583273a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 03:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788777745; x=1789382545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qpyEpJBVtSyYB59cPODVufFyZlVpTWQhTeLIXPfAKSE=;
        b=GK7fmfab1GMx66UFtSkttr/K8Qs9XrlsnPnolAVWbB1vt/JT05II5gfKDFAxFsPueR
         jneoffmGfDFnCYV+1XqvZNxpvJt5ks+KE+gqAXO15L51Zck/ybMzC7Hh1uj/MZZIyhY1
         qYQ+Wt0syvX3Ngj3I9PfiWL4uMF8NtAVcMNAH04bhbYWt3vUMW/69o7PmsqgyVD/DVQN
         Yfvpc3iOKsIGitJAkBybsPkA1QXPB6/IoQfh/RDUyX0d0YhtPoG/mTO+PngCNQuo8AqQ
         Xfny8NLrSximqQrRYN1Dmf8PG/aYieUfq/GLIHsmFyWiaXO8tBG60hDOJsgLdQ05iB5Z
         LVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788777745; x=1789382545;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpyEpJBVtSyYB59cPODVufFyZlVpTWQhTeLIXPfAKSE=;
        b=Dg+ymtwGw9p8sSk6gK9tyqkRF8c+YSHyluS5d7B2kdDoAWI9vXbVoDVHRzuc/mVLm7
         gf+9xyJOWiaDSZRPuz1yROYIvmBHz61HrquvTwc77SDTaaPYvQIfgu5TGXmXT1pNfKw+
         /gI/ebDmCLASahr59WgO45pQX4/TbOWsZG84qVkBkfRTqdrUBKb08PzLLtBuDrDbcZiy
         8wYehm7A/gmDicD9YLBLkLZ7JiQPwDvrjpS7rwBXAKvGVDsU1u2sZUP+3BdCA8W6L+dA
         rJI3dBNtk6J2K2ZOL3mi+qEFpBJ3VbCkUy6vkS3+wBdj29Mlp+QttMrltLS/iYG9bB5r
         b+iA==
X-Gm-Message-State: AFuF++nhs/kYdjqjvKJ9sSxaakI/9+c0fj2HovDbRByuBcmbs75XlD7K
	dhuqkufU7ZojvYiZvl/bRb432vJJyMWDccEcfM2Y3lEDFnmEdu9hed5+RXButjIJDUx+8XwVoKl
	+d9UR8eGmYEIwhgqcc4hcO7SuazVom2IyzWmXJQ8SZ0r6zyDSDzcP3j2KJ0h9j+1fY2jC
X-Gm-Gg: AYBFou1/Bz5OnGIdQAemFpctbCYv1nFGkra188M85sLQLH09JtD7kKOgt+RIWssQXwc
	toc2hOWanjcr3kidDgso+IU9QWxzCR0jrZFAQeOxPpel3kQWGhygrRvsbsNBmzZYkGcjLzIbXR2
	fvt6vnZ7aVZ7lL+lPux2eYdkmmmHzKq/yLdDURwqTKBo63cALlph63K27VydJj6mWofNITD8JtX
	213MacRAqFBPw9uqLckpU4EAWrMTRP2r7mNtE1ARtIz8IFVVrvvS0WWs2YXrVvecPU9tqD5HLXM
	jk75XX5UAGlnp/Dcs7usKBiAj1sm+I46ypjrQw9KC+c5JDWvZCWCHwZGt84iJTTW7A9ugSoEg0y
	8QcTzrXZj+QAy4jQRfu6PaCW38xM8
X-Received: by 2002:a17:90b:4c51:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39b26204e5bmr31099094a91.13.1788777745430;
        Mon, 07 Sep 2026 03:42:25 -0700 (PDT)
X-Received: by 2002:a17:90b:4c51:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39b26204e5bmr31098665a91.13.1788777741381;
        Mon, 07 Sep 2026 03:42:21 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.41])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm35559357c88.2.2026.09.07.03.42.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 03:42:20 -0700 (PDT)
Message-ID: <9ebc94f1-3ed8-4a21-a84e-ccd46f044927@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 16:12:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] dt-bindings: media: qcom,glymur-camss: Add Glymur
 CAMSS
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
 <iIEI9RqdlqSAwrBGxsv48s_r9QoTRP_IPoifu8PCol261xGqyCULXGQaaMYndhNAFA7YAzraXTr-UzZhguWz3g==@protonmail.internalid>
 <20260907-glymur_camss-v2-2-75f7982dc983@oss.qualcomm.com>
 <3e619085-3311-4acd-9493-e849875563d7@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <3e619085-3311-4acd-9493-e849875563d7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExNyBTYWx0ZWRfX+n/aLMsfCpur
 lQPKVxcbaI+1YLkcnTWzPN1G4PfO4p4ZIjWnYE7ZFOP5SO5RfSuEvtXsFHHuWUX7gm5hp2T+oSa
 Yca/xu0fI7LuJveO21QQs9QdWG9O4rys0e2kPkBeyCWkXK4O+nHtm1Y3eihjMCUxgDuYif94YKr
 VAw99/OS0TH7t+npYS84Uz6dkRP2G7cOsWZqroRAUUlfwOfNNi6HugrPMVZyEk0X3hXX5tk8QLF
 ck/PJYSsXg2NoKNB1lDz/lN57vQd1dXZ84u5NjYi2E1sYDUoDE0G1WMObPSuryt9SFLMIenOX+2
 WPCTu4HMlRs4HfzfwklgtZeRPkJUwmIVkQFBWhL0HF2rbdDM8rccdWNluqrw5ObdoK8YTnRfkw0
 4P3KRFhmxyvgZ1bV7QFixMYlx648UX0ogElsbvVu6e6A+3RGtgqlHgYF69tN0d0XsD9vIhSriKQ
 S//eNUXxehoOALPVJPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExNyBTYWx0ZWRfX+lBBflsWwo1d
 UWosODjvL4pXoSN8GrFlzY2qb2JQOfAfdukGyiQ4Q0r1fVAtypcI9NnBGIDlr9vXtKIbjg8yDti
 WLIDuvoTw6lMNaPBSnnQeQiprcE2Odg=
X-Proofpoint-ORIG-GUID: aDwp4Bmg66YqdxUdUXHmgvs2EaiUstwy
X-Proofpoint-GUID: aDwp4Bmg66YqdxUdUXHmgvs2EaiUstwy
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9e9512 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=HcLy/BXbbKFjgnJyaMb84Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=trIvJVA2E7aHKB3H3pMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070117



On 07-09-2026 14:59, Bryan O'Donoghue wrote:
>> X1E80100 supports both the legacy CSIPHY resources and the new PHY API;
>> Glymur uses only the new PHY API via standalone phy@ child nodes,
>> so per-CSIPHY clocks, interrupts and supplies are absent here.
> 
> What's up with the commit log here ? There is no legacy CSIPHY in this.. ?
> 
Right, Glymur has none — that's the point. X1E80100 supports both;
camss_detect_legacy_phy() picks the path at runtime by checking if
the remote endpoint is a phy@ node. Glymur is new-path only, hence
a dedicated binding without those legacy properties.

The example shows port@0/1/3 → csiphy0/1/4_out; port@2 is absent
as CSIPHY2 does not exist on Glymur silicon.
>>
>> X1E80100 has four CSIPHY instances while Glymur has three
>> (CSIPHY0, CSIPHY1, CSIPHY4), expressed entirely in DT.

