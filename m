Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D112386450
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030240; cv=none; b=c/4y2/kXJj7oKZ/co6SZdsy63jezrtEFJAIT67euGU9NTRNeTL2FPekNVQKELhGBDYkml6Bycf49+a5RXVewxxtF8B2+Ha9ozUVtlSSW6kIi2YS8QcvmUuV9FXG3bzF+CiBYTI+A5lJHPpB6Z5aeh9VN2xF4GQ1IsrhVFtqTaEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030240; c=relaxed/simple;
	bh=N88uKLZFsr/eQme2dS2SHYUBJuv+wPfdCIWa+hgH/Xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XZRXSYtnT5MXRxv7qVe2+oXew1q4NoZQKZHxtzVGhOOyU14eYSmFck0l4NeDw67s96AVywOqBllK2OnlKiDVfPG4lgaJJ5gElbBQ6mrrb5I+lHtpGqssA6cfLl5HqYae5pTsErg8dBvi50yFUDGEHRlvdxVhVkbFPYWoDxCaoWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nHkHA4Xh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=REsqzs7b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nHkHA4Xh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="REsqzs7b"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GrIN3520301
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K5FApJZEs8acSqYIh6JPQNftQsWHjTMnAOU5BUKUB5I=; b=nHkHA4Xh6TCyikqS
	Tz7a01TXy7FlCuV8obnbAT0ztKpeEzBqyhBrWJEd2vjFMrYQGXlzZUBzFyJ46yes
	aP9Yw9oJ+47OXnbfaoj8ibYIeh/KNaLk4NT3Fl5Gm/y6TMKwrEu5vrycGC/o27xv
	7pGpu/g3wLU5o14qAkq4QO7vlK+WzMsO/9B1YK9txh85205ET3jKAUlOLffdM+tb
	AJ1xj6BW8ts/cxe9WIOp96vgGJtcgAOaJzJAzJDAiryQLWD3VqNL+ZwyI1sEasg2
	WiL5vB1kiQmxEoumdk4YEix1QKgGT2un9O0F1qJ40l3TV27k4+64OTJXQyuPt+5D
	L7cv5A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfk1c3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:50:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930a312222dso77724185a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 01:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789030236; x=1789635036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5FApJZEs8acSqYIh6JPQNftQsWHjTMnAOU5BUKUB5I=;
        b=REsqzs7b+e9tNMbKU2kem4NaKC2hzKrNIvUff37wEZ36VK64aulKqzjhup1Jenj6zn
         jMhpgC654U9EIMiZqbu4aPXaebqo+Oa/7Ph5rplfePhcwVOwTXiIfPsFTiNdbpXVf3TU
         bJVer2H0Cbs3DNPCk8mdNC9KPvd/337aatyeJWDbaXKzXFixdaHH4Eqr8LyN9MIQd1J+
         xr53NJXvnPouNyS2il75XSpIGt6yqhF/mJtDdSUHTTogzHHaK4IfcBANMOC4SL0ev3rI
         m4lX2THKkUcLCkZs0YUByBecheps4XPxPUZOHtRMAaDvaU7Jwz5vulstWTnIsUFMeo+u
         S7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789030236; x=1789635036;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5FApJZEs8acSqYIh6JPQNftQsWHjTMnAOU5BUKUB5I=;
        b=Gx7Ricx3rWA+Tgm5zFiLJj0IWSrjTutPWGNWeuTkC7IgXtVSfaQkexDmj+pObl/XSe
         YH5pPJfnDYlCh1gwm4i6J60ChbBS4BA1EqZmnWhwAYDj7++2zq9QbMVW8u7+Pju4sTD8
         v2czTCSjaHwAoRXYyWK53V5yP/yQjzt7CN4XpWe+EAQh5dB9QSW2c7ua6wTbQeZK1/77
         46JrSYNkXA2A0hojcnN5UW5AIBD7RDSTdqie0PLUl5+Uu8aXPo1eDyqFMG9faTmO5uLT
         en5kJX5Zg5q1bI4S3vEDaXLWr2+fPedOPl04Xy2dhC7hzNlm6d3+t2gqM6xLadFYg6wI
         fT3g==
X-Forwarded-Encrypted: i=1; AKwUvBxHz4LyRUkteLl+kmaKJaTW5BAWyHV4Cfx2Am++fj6B2besMm2QD8DZ1z1zR9iMuWsi7J7a6RypNI5ck6AG@vger.kernel.org
X-Gm-Message-State: AFuF++mu+dVQhaHhtUdad1H82oj3B6cMMl3ENkvRw8rU5clM8ZOwf0gh
	cwIXdYgLScdGDOVfFl9TA3VwBCG7Ytwwn1bXSpFaMRMKz5fdMrDXhYNXWeb3wrhaxte+hIGofsH
	VAgY7eLCzS1k/TH8ihrWEQ5xrAp+CewwFA6AO2DxMrv64/tLny7oeBUxmVRS38PBJlgFp
X-Gm-Gg: AYBFou2bfL7Lweci4lpsbCxOLU9ZcHRCUFN0kJpSGW485/qjSarrfEuPTwbVePA0+3G
	of+WRXv7poQSdQ0JtsjxuIyCA+sMtMK10hYXAQ8Og5E7YSDc3tPo192L7cw1nIzcrDveAICFMU5
	OkNkmM0Tqg+78LRzipqOkXG/dSswMUsA9V+G9Bu8u3cv3uDEU7+yC80NbB3HuorWJHklpYQkxWH
	tUKgoRpj4Scyoy9Vz4wLy/uL1NypYo0WqvVcssDrLtZ0Y88AB2fdtxLXTKA6ALGFLFSuOewrwYI
	Tt8+2FHVUHZa8BN2QZ/VS7PVC2QgitdIVLLFUxQx97jeiskq/QTzm6dM99fvNHbpNFEv/BnkDAX
	sQBpWT2yVRB7o3Imv75SPwA==
X-Received: by 2002:a05:620a:618b:b0:939:48e9:51a1 with SMTP id af79cd13be357-939916f6b72mr2784905185a.2.1789030236075;
        Thu, 10 Sep 2026 01:50:36 -0700 (PDT)
X-Received: by 2002:a05:620a:618b:b0:939:48e9:51a1 with SMTP id af79cd13be357-939916f6b72mr2784901985a.2.1789030235452;
        Thu, 10 Sep 2026 01:50:35 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68c3f00sm7933412a12.12.2026.09.10.01.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 01:50:34 -0700 (PDT)
Message-ID: <7667d87e-4b2a-49d8-baa6-65930bcf3bc7@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 10:50:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-sony-tama: enable modem, SLPI
 and IPA
To: Shujath Mohd <shujath@outlook.in>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <TYZPR01MB51313D5E4F5EE3CAF57C0876C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
 <PUZPR01MB51413DEFDD09B4661D9AED22C3BF2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <PUZPR01MB51413DEFDD09B4661D9AED22C3BF2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA5OCBTYWx0ZWRfX4+IjnJz+e7TA
 OZ7nrrQ+CO1K9op77G4BMM9D3vpKcU9sUYTz91IOBYo1JW68S7dPUgyx3W0fHK/4h8JsfixjxfF
 mDrHHyJbE37l97QQ4CWuEUo9UF66piE=
X-Proofpoint-ORIG-GUID: g2861lrsgU0yILuuMHADw46xXIUJNcTz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA5OCBTYWx0ZWRfX56YvDJtP0RuG
 3jpxmcN5T+JpYfyX5oDBdhjSpxs1RcRI2t8TKENmIrfF/tRpiYJ/Fht5eePldmJbeVIggfKVu/4
 u3hyRdbF/Cx+srnlfuQkh99p0gTkbsH0veVK4w81BHOYIQmYzh7nl4IKtpLL4A5XcVQ8guZhU4x
 RQUHafdXXtONcwQ/FefUCAzqgVWv2MMfoRtkPnsQkiQ6hXG3BPYhVMSh8TEp8HnxjjbFipMuTB0
 6QQsTWYe5/Adi2OxwAwVyh+POQp/pKfjIcUc8g5Sx/PSdI3HWfL0Ma3d9R8pEM4RzlBij/WsYR0
 2moe3XnwQbwgfiXan5GLdmpIMCfAIBM2wIsfj0YKSRYtYJKKUvErqWITP7OCOldYxDMUhvnunfZ
 2vd+lYOLAMusfeU2weyy7fN+HMSg67FBZ9Mp8hPqIHcKc4dFTO/uuaH63b9OId0Wa9pS5blzzdM
 1ltLja9D0zOZ8S26HRA==
X-Authority-Analysis: v=2.4 cv=H5pOUOYi c=1 sm=1 tr=0 ts=6aa26f5c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=vX_vO8opERNOMm73XEAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: g2861lrsgU0yILuuMHADw46xXIUJNcTz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100098

On 9/10/26 6:05 AM, Shujath Mohd wrote:
> Enable the modem, SLPI and IPA subsystems on Sony Xperia TAMA
> devices and provide the corresponding firmware paths.
> 
> The modem requires ta-service for initialization:
> https://github.com/andersson/ta-service
> 
> Signed-off-by: Shujath Mohd <shujath@outlook.in>
> ---

for future submissions, please send new revisions in separate
threads as opposed to in reply to the previous one

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
