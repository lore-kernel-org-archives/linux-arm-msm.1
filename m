Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFC5403EB5
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 10:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787566169; cv=none; b=mEEyzc9s65eIXjHua+hCjW1LpWdCAUUWEzXu7KKpFCjUDZC0nPS4CaSJIbSnr+O8mTafTlapqkRY8Eb3zUPyynqAZYdBkPVDDWBroXMFb9v/Ta30Si/zvE0XX50b9J/6ytDOmQ9DfUTYoSqsWx3o/nD7xaUAfZDijifY7Ubl2y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787566169; c=relaxed/simple;
	bh=4k9/WOTwCcXxhBlXiBwh/LpS8ZNvmnS/HSTi5J17PB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=obHOjasVmIcZDRCDQMUoLROGSV7rlllxAMn6DPlwQozGMJMiJFSpS/FSMppqyR8HsR0rP6sEz4DQzFgAEymYL5TOAV4ZoVdMmD+WzyOxSLS8/vwqTJJkhDuO4kaA8zNlQg1IllXXHY3NHvoQwy/SE7rWtPgKqd3aPCQOVBJIvCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XBHrLBor; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aOILMNny; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XBHrLBor";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aOILMNny"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O9WNr22035997
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 10:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h5tI22mJ30rv7Ei3QVlB85GQlgZBKmWx6lwfbgTaRKE=; b=XBHrLBor44cVg+nH
	zk7bnSuQyBItXhgYkWCprrd5gKz42WpYUyvxw69bvEvIUKfa1sO2V9RjUeh5kRN/
	Axm6jD9jCNdLAjLtbNQZOfy0c3xcWoQpO0sk/HyIe0TRhmGi+UW0kuE27FZzfxHw
	VKRhVFt362py0tFSn4UPURE3Ub0sEucAuTl73CXSTk53TRyYPzWqseSOZ2vVvG7L
	xflf3jzPzGxoxm9OF3UyRefisfK2lq09pzJGyFZc71CWIsQB60vrR5uRgBLDqe89
	s3roI4IahSJt8x62miJiNTrPutcpj7hwwZkdp6H/kK7PyjL0JDyGYWJX826g/XV1
	PmixUA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kdsg4j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 10:09:27 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-756fd28d906so81808137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 03:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787566166; x=1788170966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h5tI22mJ30rv7Ei3QVlB85GQlgZBKmWx6lwfbgTaRKE=;
        b=aOILMNnyhHKM+CEsPlCpAcNdbpGPi0tqaKHx47Efu8IVw3SAXUUrTFULSJymNQQ+FR
         ibTZ23J+QStmWJeIjeKPs9VvFUQTFMw5wIYsTuka+Yzx9FCaWoX7d5oU+322vj8Lk5LQ
         tRcwvj7l1mW0jR2CcnE1sHCkxmY7ExWkScwZRy08OIZK9QvzYd7GD77X0GG2TCvdTk0B
         B/DSEvdRruLECeb/StOPuHMCeRv9shMtZ5xq1S+o0Fd6LJAo5jEi9XDa58eAOk5k7xxT
         aglOwHhKpPvW2wayvLgAPwTfYJxRZKgRThNp/lcB8Cz7J8DhTvykyvKk/M+sF1t4MxZt
         CEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787566166; x=1788170966;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h5tI22mJ30rv7Ei3QVlB85GQlgZBKmWx6lwfbgTaRKE=;
        b=TL0unJmyuB2k32ir64atcoqTy/xYt9kYHibKCNj8n/eA/u6lMrw+1nctynrMVgtcGk
         A4iupso5dE5nuT1/kAGHsiDtNKvEz2nBB7874SzHqv0Kc7P0pBxn86qkBjllo1b4EMwB
         zcPIV8sp7GwSrIDwcwpL0LKNwS4ugo9iiMaoLymNAdnlpgMxmhFByEg4VaNHPwuHY00J
         Kdd1YUtmN/imerw0T1wXJoNFvS/1LGoSzJJhTeBO/UhraBi+/HFMMNeni4EOZfBfPEai
         hlxu77xhvobyVtx+szi3qrhURgqOr7YTggQFRciiJCpC/bwbjkCrxzURVnK66kfYHmz2
         ZFSw==
X-Forwarded-Encrypted: i=1; AHgh+Rqc8X8/JY/thWjCNnX4y3G+mB3mFjStgkPDdz1PKGdBuzzBCe6WnHUe510Cel2fDLMkvAvgD7U1ZHsvSgDR@vger.kernel.org
X-Gm-Message-State: AFuF++nCln72imE6UoGjbkW9Yz5EdSY0EcL1K/tUdPlySxU8hl9KOGRs
	+C2oRLQQU6K2ZN7Z59kC/QoO8fTG/fPtXj2HjAVAUxSeTpbVza7X7FpuVbixGMlkohE4hWE6Af4
	3C2lGv8s6KoqK/UaAEVtJxNfmUeVtPljpGN84OvVsYsy+zL2lXiGqut0IyLc2CGnWPqUe/G0PAO
	H7
X-Gm-Gg: AR+sD13wD1whl1/azs3O99CtuD7veewLx1zZaZ96Up+3YNdztI9rm5PwIc/kj3dW1Mu
	U/3SMqLuJwdzbIKLXshl9p5Jps7jp7CpKR9my4rVlsMvCrpCnrp4g20Yy0jTY/GRsGAce1hGRuB
	goc/q2mNWlgpH7tzpzGW8aMf4sJHwTVJuIZXRyE6d4/XbGIsHji/sCypwP61DjtG09W/uvDsx/U
	r7DDZ2SLSmWIu/np6FElrdnfARalXQQS8E9P3XJCSGSoSnwhlONJ4Y17+u4FFoRPNbNz64In5NV
	fEJ//y/9Fwq2pkKrBEqTBWaYY07at0xoVpGBIOfXNlH63vU5Mp2XTpSw+54pn632XkkHbmtK5UR
	RN/UnFTlGy7xBBk2+dSp5ahFf
X-Received: by 2002:a05:6102:d8e:b0:756:32ba:1a83 with SMTP id ada2fe7eead31-77a64968f55mr3085555137.2.1787566166256;
        Mon, 24 Aug 2026 03:09:26 -0700 (PDT)
X-Received: by 2002:a05:6102:d8e:b0:756:32ba:1a83 with SMTP id ada2fe7eead31-77a64968f55mr3085551137.2.1787566165884;
        Mon, 24 Aug 2026 03:09:25 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5b93f3acdsm1390432a12.19.2026.08.24.03.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 03:09:24 -0700 (PDT)
Message-ID: <eb9067a9-4bf5-4f24-b496-0067a6c89041@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 12:09:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-sony-xperia-tama: Fix Bluetooth
 UART pinctrl
To: Shujath Mohd <shujath@outlook.in>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, robh@kernel.org
References: <7334c260-0130-453f-8169-c07a3145aa19@oss.qualcomm.com>
 <PUZPR01MB51413F6FF89A8FA82A9B2755C3A02@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <PUZPR01MB51413F6FF89A8FA82A9B2755C3A02@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA4NSBTYWx0ZWRfXwKFJzrit3dlv
 GTUtfG7m1Oj47jpCVzDr6uwRNgQsCekjt0r4dHYODw8apRELqfplAZxfu1dFhYmb4p+sKqC6ypN
 /qrOwQ7nnmEmoGA5KL6DEtRG1MeutrI=
X-Proofpoint-ORIG-GUID: IWKOparF95bRITqtFetzvDnC_1xfrm6J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA4NSBTYWx0ZWRfX+wGGwR/Bb7m6
 EDdy8I+s12GUl7yJpkebvoTHVRBe+ubX8JKMVX3VRtrJM1cUKfP6JYWmi8g2GPt1qHoIbFttiq0
 unTPACXImTgiZWkPtSwjSds9vUCjSZL6yEGLWAVKNFu73Lj0H/5FXWJb1/gJF+65v7nyVxWsvif
 howJ/51A+LZxb/NCx+ib6Ci7i+H2xRqfdjVIBBpehRNDtDAcd9R8CCeIa6A4yKifRqmGYoZA6Cg
 7oNuFDXzbz5xLtt7mFqdt9/BpB4Q6VW4cVw8d3LU/Pcve4RWrY4BaPM5k3Qyhcxv/ihVqAfAw4H
 c4p0xXlYGwZE0wnhk22rFir9aGcew+pT6LJLsaePGtetHelc4Uotw/iZwW5NcOhxWwvcsvgm8NI
 skgg4EWBImLchKpVrtcxaWDLEqfsJNTu9WaCHPyK8LqaVwg7y2DdB+7VH783/vnIhSrWUQG4hWI
 KGrPTnSu/CgIkqGYzsw==
X-Proofpoint-GUID: IWKOparF95bRITqtFetzvDnC_1xfrm6J
X-Authority-Analysis: v=2.4 cv=d8DFDxjE c=1 sm=1 tr=0 ts=6a8c1857 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nriX_wAJsTMJyBhJSSgA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240085

On 8/24/26 11:45 AM, Shujath Mohd wrote:
> Use the 4-pin UART6 pinctrl configuration for the WCN3990 Bluetooth
> controller on Sony Xperia Tama devices.
> 
> This enables the UART hardware flow control required for reliable
> Bluetooth communication at higher baud rates.
> 
> Fixes: d54331131cde ("arm64: dts: qcom: sdm845-sony-xperia-tama: Add bluetooth")
> Fixes: 30a7f99befc6 ("arm64: dts: qcom: Add support for SONY Xperia XZ2 / XZ2C / XZ3 (Tama platform)")
> 
> Signed-off-by: Shujath Mohd <shujath@outlook.in>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
