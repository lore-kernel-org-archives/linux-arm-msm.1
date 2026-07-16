Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A2541F7FD
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 14:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784213372; cv=none; b=c5dPz4CYycpzOXD/TKbYfwf5TOxwyYXISGCk0KC8+NMryhCvlWg9RhEv9+WyHty/7GlfYqksmDi4VtkeieTrxdINnTL9V7Y77lEWOUSEnPcWSHawlWfzI12KClNUB2WzcF5Iw6Oe0T6VAplA3sFk4HY6Twh0F1qgTpccvmaeRs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784213372; c=relaxed/simple;
	bh=fsjE3NE8koqyjOM+n1+CuSx4kksS91L+ouIjGrscda0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CYhAvLunFdULQs8OLggpYz3/2jlIckVi/xi6HEW30YaCSNvheDi16/p+mFk4u3b+EIEI8R1iNwAEGN3/OTQJtJlcILMlV6nZZgEDCQfkCQjmk2yg9Z68h3MQC7CWGwVKE1mCluPILOb9paMsRrxdhoZAUxqy7TuNU/H6Rud3RbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djR4efOp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CqJ5nngK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="djR4efOp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CqJ5nngK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJjQ32569344
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 14:49:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jw5Kr1vOUYwUB+mfOp+2DENlLMaDIIjWPw4f1rH0pj8=; b=djR4efOpqXC6a2Xs
	77ZNNskCe9e9XWn5gEI8qRp05c9zGM7Ar84MIAUemwZi0cfxmYjPJ0cAI4CRj/im
	WVk241AKyJWn4B4NGlc3YuW4ZODCiWV7vapawM5iD5icDdyzO/0JbNtdOLmx2Ths
	CT6fQwz7bM6KuQyRsGJ7pRhl+e5eSJ0/ZMLg/tvs9uZFM42SSzSwBm1vjp29x6iO
	ivCchGQ21RjgS+oD4HIHoq0LCQzvUCaaviXEU3BDV9519Uq7lwvxzn+emy1itKBo
	kpra3niAnZk//Xgilj9z6V6mdSCqmTQbXHPPuRced9btL4YTyHs1omEAj7s8N18S
	Uv0k1A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fed0650fp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 14:49:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c07313be5so12557981cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 07:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784213369; x=1784818169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jw5Kr1vOUYwUB+mfOp+2DENlLMaDIIjWPw4f1rH0pj8=;
        b=CqJ5nngK1wuw2oxj1gE71bRBW7m/9/Lq3raYTFF8sJK71TBzlmzW+GjxEp9SPcLvqq
         8m4LKAFNU4CpI6heGqXBxZIfo7kNeRkk/uvZkVE0ZwND13cgTflPP+SpnrI8ZWfdFR7G
         JAej11/gyoNBagvKLOBPfmkfSVdKTwSXs3zATq/gZ5xFxJp5XSssigUJy0KtYi9z/960
         BdowtuRn2uj3pyBB9YaOqQJ7R80o0DZJpWYNe7XQlBlVtsE284snVtp7pFHp8hrlwvPy
         klhzI86KzI9SGmMXDIcctxh/fwk6Oltfk2RCyXJtflUYZQ335nDgM9OxRHCgRNSJQTeg
         CnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784213369; x=1784818169;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jw5Kr1vOUYwUB+mfOp+2DENlLMaDIIjWPw4f1rH0pj8=;
        b=ZD4EhbsvYJcDsOR/acfpR1HfGFTnwVrOffRRK03sKSOVCYZkrz8Lby5nnwQI1+tEoB
         j3mI5DkidgzHY30ael1vAWWzC6qcfui/0ECcjwX3H9jGG4lzZbDKTfDnCs46gSuK1WOi
         JuILLysuODOVVAsb16MIuHgJxsQ2Y+yYY1c+yz8OEozn2sm8x31HEy64Gt1CNXs9EL9l
         4S+UMywSue2+I6+soN5JacsvU0GMsZE8urjUZr3FHGhzP6tq00PtpeSK034fZ3sUOJcI
         MPskCmkzewRqFdq0N0WHrsg/o7XPl+id6FmiQX7Sm9ljKbBKHvkNcyPjJLubENI7kw3h
         609Q==
X-Gm-Message-State: AOJu0Yy9jhMNknj67SnrDY1YKQRh12nllJoAfPJA83DN8rQj3EMh3WT6
	jEr5cJyQq/21KvP3RUau/dI7g6wsUx8j2Lil/JoKrkLSaZj3xzO74SDJNXqnDFFg8J6wjB0NnBx
	VBeDoEW3mVZWUMRcQZLKJneu+ozsxDBnkfpY0DFRHLx/V7gBjF6UI7Lhh34Fi9oE9gwVJ
X-Gm-Gg: AfdE7clHAtrclgsCG1EbirMi3nImD/xXXXwTW960/An4V3aDPP2bqL4tZ0PjciVZdou
	DWUSGi7mUel7q5x6GQ8jEQ5Eumjrpy9vzeSoRfDE1n7d9ElsJt/Z4+MuiTsDPtT1IM3rCsNnXex
	0MCHEICHVKZ4qsov8l1xAdDDacdaln9i5sGrc2pwkFtf6/fWR9GwGEojWzuiYNU5s57L9ID/NPb
	2ti2b3PPw6VZiOStCPNsbIm1kawega1Sprg3qJP/8yPEuzqKgGtdDW/PGL5287aWgkMDvfJ/dCv
	H7hYWxtvTZ3BBrSuxAHznmv1Izj3UgwD3genv+1l5TvYKL1iKM+VCyRayaFEaBph0x/ZLOMMMWR
	i/L17iWpl0Lx1m+YwBqfJYN5Y
X-Received: by 2002:ac8:5dd0:0:b0:51a:8c9c:7de0 with SMTP id d75a77b69052e-51cbf2f40e5mr178600061cf.10.1784213368750;
        Thu, 16 Jul 2026 07:49:28 -0700 (PDT)
X-Received: by 2002:ac8:5dd0:0:b0:51a:8c9c:7de0 with SMTP id d75a77b69052e-51cbf2f40e5mr178599721cf.10.1784213368098;
        Thu, 16 Jul 2026 07:49:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16871962cesm234383366b.25.2026.07.16.07.49.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 07:49:27 -0700 (PDT)
Message-ID: <fe8f8696-d78c-4b80-8fb5-3978178533b7@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 16:49:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: add SoCCP DT node for Glymur
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
 <20260707-glymur-soccp-v5-3-053993f0c6fe@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260707-glymur-soccp-v5-3-053993f0c6fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE1MSBTYWx0ZWRfX5qBoau3yhEv8
 iLS6+Z9k5DvyliiLstbWO+B3tw+ClxxB84KRptA8gPRug9/MikaOES7J9m0w7yzIL+Pq1Sp5Zo8
 RDxnZFwBIXb42+Of66JKDfPvD8akH8o=
X-Proofpoint-GUID: 8e_QhvfL7LfRH7h8v-Hso1_MjwXsSqLd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE1MSBTYWx0ZWRfXxGd094uSQKic
 JLjloyJLEPmIn6p9nu8GsLuSOAtv8obegd0aXxRh7Vi9CopHXH8VTNIhXfJNxJskkQUGrEQ5d9Q
 tslRSpxVC8fdWBcPZDAL9AUhp7yS9axpRsx6zwJ6Zg8OR0dpUtF0IG2Q7sSbr7mpRZsP05T0rOv
 acd5E5YXp8iA10GzwmKI1Yt6r65L/OA7iyfo4wF+A2PzzgJrRYJ8WZayqZ95ebnqivTshyH1Y9t
 2LVnfr0rUuFODoInmOAlTIxoWuIRPvXl+gYCj2Fgs49GEl5AkAogjvDyFc792t/FLM6iB+imEUM
 UyKbpg4yYEYJbOQZDCwPxjjnvp00nX0QqQcy5EqEFp6FgMsN1AmnTjgiyNxHjGAMTadYfgEJv6z
 j+Ev0TMO8vB9w+0kxdf3DW+OVhHv1DlFPqMJc01WlfS+dr8vKrRe/ecKzr2XIztk2BvOhnfNyuA
 /c197wUCOOsJWAkI4KQ==
X-Authority-Analysis: v=2.4 cv=Xb25Co55 c=1 sm=1 tr=0 ts=6a58ef79 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dho3xQVaiACaCEetv_YA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 8e_QhvfL7LfRH7h8v-Hso1_MjwXsSqLd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160151

On 7/7/26 12:12 PM, Ananthu C V wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls
> USB Type-C, battery charging, and various other functions on Qualcomm SoCs.
> 
> Add the nodes required to enable SoCCP on Glymur/Mahua SoCs.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

