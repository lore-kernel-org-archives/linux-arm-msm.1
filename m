Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E6E3A873C
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 14:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740672; cv=none; b=iJK5cSPNGYK/EpU8PwKLQu8kn7ho2mM5EGRRxlY8mzppEsAl5Wmffj6cavjCgNRAz1H9VZwfFIVBZTU34SpRa+X9Q61AxGDepkpmfJDBtmiVl5Jozy/0ZuBYNYi9iMNsXFxr+jqR9+J6EYBShZgORuvzO6cawrXYX76XuvKiA6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740672; c=relaxed/simple;
	bh=HCnsPH9Um0ZG08qyr7R6UQ8BhsID58x7zuxQpv0mkBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cbQp35y5ld3RnALf+yXQDJ4KavmiraYsJjqyacAGnlvRR0fH0jSTBpMIVish/cHMHutk0w+Elk4QDTYPQIH4ONHkzBtlCUIGeZ8MdmCuhZjLhsdE7irGlS0XtmH2VinUeSSrM7DAYa/F5B2uUg/bTtLGibSP+5pp/J3Y/MePVEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h8vjvI+h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hZlsMbuz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h8vjvI+h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hZlsMbuz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOT9J1900365
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 14:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zg8ab/uvVlUMvrE4Dl9YaZiPUZgCfIt39bL/qT8QwzE=; b=h8vjvI+hCtyQSqIt
	/BpIsO/apRrzPDQlk6taMfJvhv0e+2LTtyQhJ2dBpADJjIxdbD0y/GuFJS0LrbW+
	FoKJfsV8X8EILUyERuC0/Wqd0rXAkdiWUofD8Rgv+3zYr9hj/VJT9JmlOVmCRFF3
	fkqI3oD5BfttQK1PDQdsru8ypfBgGAxfcgdoeWhpkmZJkqf28mjDYMcnxGX95TEu
	GfsocAtH9MBGSn0paSjoy+S879PeC+TssMZCa0r7NBGCQzskbdKPAB18/1RVP3gJ
	WBCJeTapQHNQooXcz/DnzfnEHw4jtM+OE/ISaTF5gcysKgK2BtIntePvjjWO+GBI
	U/i6dA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grtdpu0yj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 14:11:09 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-79cdabf7d89so762441137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 07:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789740668; x=1790345468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zg8ab/uvVlUMvrE4Dl9YaZiPUZgCfIt39bL/qT8QwzE=;
        b=hZlsMbuz6/bwyuapVsqUqjRUNGtmAB7PRP+kpJuTW/oLCkR3636gAmdZ0qAkh37ZyY
         F/BzSAjaNiqUpVLPXWUGYte8VVRQFa1/QQFjQeDiCofZyx06NKUHJyihRzRhwD7GElRI
         O0JXJ0mehOlO2HvqmZjUbL6RgewazG89L1bBahZpxyCGSabVvERUY0RUoSoeNNpZIqRJ
         fnaExX2SoxTiJ2GNpEUrCiPWORJKBfOpJVRIfNzc0w58LOK7Qv4u6s25FNPxcFCZNwzx
         Cbq4O1pH6X5mpEkHAo730KAJAexFVf4s2M9lKUtnEb4/vvcX3k1uw+ER2j+/PAaJo6Zq
         LUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789740668; x=1790345468;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zg8ab/uvVlUMvrE4Dl9YaZiPUZgCfIt39bL/qT8QwzE=;
        b=MClsu9w5B6H4XimEcPEO2EbJmtFiME21CIKO+HmEZw1auS3lBCxJjO6XNTthnXffT0
         W8+AcA2cMpoKbFbxiimrDfVZUM2DQ/VeYOz7lVpHyN+nKfsJ3bW67ddahzoz8oXA/nz6
         RMNKCi95QAkT61NowUYfNWIFBQ+ediglIoDYhu9irj0UQX+RK5mj0vB8Omeboa2FWIVr
         ljiL+k42SJeLx9GpEPf22oDZ02YmeKQ5B3LluzMXf9cHC8ibNnUp1A60y67DCffF4L4w
         wHb8PW4jCVabLoXpHu844e3MOUOQ9hWsnFI2Ei3NOZTxxzdANtF+Q/5akU2kB7PVFWID
         3MbA==
X-Forwarded-Encrypted: i=1; AKwUvBwKqfgJaPjm4CDq1rlaVCyBqCiOb0aZc4GP0GyyDHyhAP0zKEcW2IxgvFgBER3fGq8DsLM+O5gft0R20Pxv@vger.kernel.org
X-Gm-Message-State: AFuF++kX/jV4XcBxVISXkkmE7o3YW12+26EboXTY9IL2otyoHY769GL/
	GCTACJkkyI4lWNseYGEynpCXOMWfvmcx9bh30ACxaY1hO/Ns4gowYA/XzCmyiwxMNIQtOEIDrxD
	/Dqv9oQ4AtlNS29xQyqJAdHDVk/fQtty2k+ay1iXRlEhW2aNtKru2zXBC2ot8cJNgWOCM
X-Gm-Gg: AYBFou3iRa4Hg/4y1+xUWfeGWtUoWA3se+by04nCq4MtB6EFFiwUkvfzqHtyNnscDL+
	TpiQ4/tXVybic8lBdAFsPBkcsMLWVdVQ5gHgalR5BiVzR294lTSCRffWRgt58amUEPhX1378DnY
	Dz4wYD9mCPl3yPVq23yoOw4Dc0C23sUleJiz0n5UDE64ypNOHC5co5u4NuxCITe43Fw/52F0mFv
	berUcXJE/zRgkiUj6p/aUBudpvig0bMKrKqWhEhBmoyld8b52bWple4yfC9BbzulZ7m41W+dJ9o
	3kp4+82bKosluVMYTyxHwf6U8Fwf6b+ZMNXEOj1xRlNcZ5+aDuJLlF9GtQB+LHeM13UD5FiiJAs
	IxNApuEVw7rOLeT21UrBf+7UDbmmP/DQrJ6Q/ebB0ge3n+iiCeD8PrR4yP2vEOGo=
X-Received: by 2002:a05:6102:8007:b0:7a1:f7d2:e817 with SMTP id ada2fe7eead31-7a55ba4d3eemr1053369137.16.1789740668689;
        Fri, 18 Sep 2026 07:11:08 -0700 (PDT)
X-Received: by 2002:a05:6102:8007:b0:7a1:f7d2:e817 with SMTP id ada2fe7eead31-7a55ba4d3eemr1053328137.16.1789740668303;
        Fri, 18 Sep 2026 07:11:08 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:82ae:cd75:d970:e66f? ([2a05:6e02:1041:c10:82ae:cd75:d970:e66f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7d1cca3sm55062285e9.11.2026.09.18.07.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:11:06 -0700 (PDT)
Message-ID: <b01f8d1e-353a-46d4-b52b-0f16ff63eaaf@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 16:11:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: thermal: qcom,pm8775-mbg-tm: Document
 PMAU0102
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>
References: <20260830101025.191697-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260830101025.191697-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIwMSBTYWx0ZWRfX/gVNxNtQZdUS
 V1XcAMNxUYcbTKsiCE2NBioEXuaVadoL0wBtW1wHBZL04R19VR0+7kuVXmxR89qmG7v/6DA/BS9
 YPQh/saafR3VVxuSF2rNgUnYz7lfE+s8X7afQk3uY26CqZ86c6cDkgeeJdgv5TrqqDSITLTU7LI
 l3CzTHDCrGqGxVa84lvRBArlpVgbh5mQ3kJdAiBNbJVNTarA+shM5SPO50bFTz47SD8dJvL5/Wq
 CJG/1dCmGj4aW0m7oLUCEmEbeKsLEn4EWXsJ2duXjPtGeho+zulkL5gnWE2LYNKXsiNrT2vPpWQ
 F1I/9DsQ7zX5FER63k7UFN5NTXtm/gNq0Kt6BIs3J6ExvcyjapS2rPA+jcp7jWwesg2yk6yQpem
 DM3Mmkb1lnqbQsJGgEdJ+FP8ByJ0GS5a/GAGaeF8Hxpk8+v6CCiduA6EmfgDV4B4x6ZEIbe8Ite
 0zaZuOW5pY+Ul5ZccLQ==
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6aad467d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=4cE7jvQ2eA2NNYLkAPgA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIwMSBTYWx0ZWRfX5uAjAFKgRN+A
 e+qsYNv/0ifK/3hJszRrsmXSamVyufmn1JV/lwBqqGKxNVs/5bcNX/mqNKh289hUIRRr4LBAmfz
 o9cnNHMQDXaqq1CTKyl7MuL20P5ZoEM=
X-Proofpoint-ORIG-GUID: 0LuVPRZOSV3F0BLYs_KinkZ_gD3KYUv0
X-Proofpoint-GUID: 0LuVPRZOSV3F0BLYs_KinkZ_gD3KYUv0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180201

On 8/30/26 12:10, Shawn Guo wrote:
> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> 
> Document MBG temperature monitor on PMAU0102 which is programming-model
> compatible with the one on PM8775.
> 
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Applied, thanks

