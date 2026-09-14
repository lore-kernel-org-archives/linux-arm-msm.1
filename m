Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E3F37B019
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371420; cv=none; b=BFe8cxPo9peKoo8+7Qc1RoT8dN4fxqiVQKTq7Z7mB+D8rScYlU+iQzrBJXnJqvTVf63ar92mIofuCVVzIQPHyM+P0gRgeP1JPYKn4TAD8LWkA/VedvbiNBNgRGPcWXxLIdd+yP/Zf7ZBWK0cVkrSy3ULAGsOqhxzQ8f0F+HxQCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371420; c=relaxed/simple;
	bh=aSsL7rH+5SD4ws07ph4c6ndDoV5PwOr9X6Do/Fjxf8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=min8UYNiKt43t6Llb3tYTADlkym8pZCwv8c5acnBkqD7VrIHyr754KM1rI3ZWvmTxr0qXkyOcrKggrH2rIAsDUY4sMhNY8eKQ2kfJsJJePaqeWi6jLvSpEYIj6qNxmW6Ee0TfixNMYkOlbd5mY+CeTpJI+pDxC0WEY6U+M2epdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hyaQNs4+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aWJv4YRv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hyaQNs4+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aWJv4YRv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5il9f3369254
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fr1yzaJs+rjZLZHda9IeRhrD
	ixH5hc7r7hGKmk257AI=; b=hyaQNs4+KTzwP5CIMJJlRtLzjQmC1VvZ8uNPGjMG
	D0RckwXCbSfglMXCRPU/oFXInBoYlsVbuhGDoYlSKix0phOAgUDC4HbopvV6fCq5
	t8MVEc17yrdEUXRAYCjQ0z5SqHJY3dKhBGIDxdwnoB29M2TgxdkrMnzVVnahoANp
	jsBaj3oKAQR3Ou3rk072daU9Iy02JpVzexLJ89O4FdGIOe0l/9089OA6kc4yBC1k
	Yfj5hZO7ujoRyF4iq6LkJUKmWO8vOSp59rY7Z4avnjKm7qQEZvYuL0agFUCa2VL7
	tYr2phRlUDtZ86RjRAaBlD27drJoklHDlDTiD40VuOUSmQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd5jkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:36:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f3426a7cso503959385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371414; x=1789976214; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fr1yzaJs+rjZLZHda9IeRhrDixH5hc7r7hGKmk257AI=;
        b=aWJv4YRvIvDrMCPIq1gL0LRA6hmJjKstkDdixDAx/3xIboaCr0vbSf4CPO0nd8LhJ6
         GnYcbtZ1smEu2UKc3+3ccYLGxJ0njSheLfBSO3nyqcc3R6Jiypd8bxBBusWmyYC+75TN
         P6g0Mio53hfai1RbgdEZWlVrr71Kl6Xu/ke+6H1JbD/3edCjACOUHMon0bsw7Au4Vj1q
         wxrs91C8lOqldt39lQI5e966xEz1BDR86sTMFB1YxSp9aib0mxTS0XUovi2ytYm61QC4
         1e4UzPctZa9hKM+hN/rR2qN8Lq5rMN2xeWXQn0L9BkV7xdj4arkMAMFj1ei3JgMcLRyC
         yveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371414; x=1789976214;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fr1yzaJs+rjZLZHda9IeRhrDixH5hc7r7hGKmk257AI=;
        b=aCsFBlBoT2sm5QvAej/veGhX1VJMthhfpcQXBb0chNHsY67/IybRLhd2kNzLR00g2u
         aIWG73YR1Hu2KZSZOt3pQhx/AuZARvxdIGDE38FsSl+9N7Q6WvQUtdDDGY3ZRUSICo0x
         Kwmj5MXgweTTM/YdG8n2EeH+0PMHqInCXiTo1gy9QB8Ze7UFW6gUP09iWPE9GVc+BQss
         yqBxU0B09o8k3i2POAJpGi+/WlKyJMxtroz86DsZzagdk1EFYa3fKqFPwksKMezg6kj2
         /NhAGAl2ViP72PXeL8FzhjJ8lP+HBmfYhvmL5MGLHYjrWUSSQl1ycz5G62O8jaukWSiQ
         T0rQ==
X-Forwarded-Encrypted: i=1; AKwUvByerN88SLrSlrEGae6JS7ZotL/ApBXv87+/kyMDkeS0CSl0Hnlwd44Cok/APcZ5F5HflLMnVf5IUc237IJ6@vger.kernel.org
X-Gm-Message-State: AFuF++mCzLgsbu/X78m5KlqG9agWsErZJ47k4yd1IJpABdguFhVF6Z30
	52JOcaMvOBxqAhtt6U+HvYa3VCZerJV1fFNhO+yLnO3rqwwfFxjSawXBhy8FCLYW4ftzgYInDGT
	WokiZBfwrR1N/waH+kCaR+qheZ3GaQFVs9flDoVEhJhSVYqk7is/yTeVm56X68QyOttuO
X-Gm-Gg: AYBFou0+BWrJ55e1fipLqG8qFSec+jzXw1PfnTwNW4DCS3I34kiwJxP2wS2bumM9Oqv
	q9X/4Ik5m4+XF4WxNpTbak+N74ljHT4afaBecM3Dj5NSvbSmFSMPoKeEcPQitZUsQePBwGcTojX
	TpuVpRFRx2p0DqWKgecu3lvHvE++gBMUie7sKxAUwEkr9Q8yKyOGVwzp7C8KRxzD7tglKyCgeOT
	fc6oT4aQCIz+PjJ1pmwVRvHcLU8Vymvw5iwpN3fRCmkFGP91wwZ+gUMzZjeM79hx6IN7cyt78ta
	rgwX2MP2NjyjoV/eSns7Q8eVXT35YlaOYK6ZRXhgYgiEdfBVLgeOEuAYdipntUPiyZtUSWXP4/z
	FtpM4gPoAbsSOPw==
X-Received: by 2002:a05:620a:8805:b0:939:6dea:374b with SMTP id af79cd13be357-93a29bf8ec3mr182576285a.47.1789371409266;
        Mon, 14 Sep 2026 00:36:49 -0700 (PDT)
X-Received: by 2002:a05:620a:8805:b0:939:6dea:374b with SMTP id af79cd13be357-93a29bf8ec3mr182573285a.47.1789371408699;
        Mon, 14 Sep 2026 00:36:48 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a803c5sm186263595e9.1.2026.09.14.00.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:36:47 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:36:44 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 06/31] arm64: dts: qcom: sdm845: Add domain idle state
 names
Message-ID: <xckqlfn2kld23qsslwypherdgznlyf5xmsuojv3oh3djymllpw@v5cryhdebc7w>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-6-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-6-660c31187819@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa7a417 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX8SV5DWudHF6L
 kI+/npWfOyVp2EwG54Bn/77652IuQB015/z3u2LBs0+LOKl/ztEG9z3WwsNA/iSP8+/DZks+LM+
 3x5RG43UdHwluySm7FtJatFcKqOLWuXFjR4yDCycDiIc39D4lllX//33cW+P8C7gBdhECCsRhP9
 fVSqJlN5B6W5NTDFlN1MgdXpCvq9YiXdWNB1FrvJ72X9z5ySElWIqaVVnlbS03706T+NjGic/Uw
 pB/GJnpAnh1glEO+jNRlXqm1yh0KgxIbJZFiJtDha1KMimEGA/r4kQCkBF0VcdluhBCFej9nGrm
 H2+C/XA+k/WaqKY+aqQQ/QZ2yqiWRfjuXyj8+VrGsSSytItRB+b2sSJJRyTGV2u1Ert7FrNtakN
 5EdJenyxK/8y7rhrFOUD33mn/zE0wRLVI0y2fRBnDxpFSdE8yTsl6PS3Bu722Ul3JMz9xxcV7Zs
 ba2/mRv3+t8G0VtMC5Q==
X-Proofpoint-ORIG-GUID: G3A97g1MGTna9Z48BDjhJ3OaGVROrL2F
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX44ekX5rbqukq
 FAmdoWfdnh1ToGmOYPzOvfDlzZD52FftiVkol7m88UyIxeeuP844Zb7bBHIrFPJeOSiJEkzb8UI
 5Z0n8fWXk6R9bGZR/+OausGo9QFoT9E=
X-Proofpoint-GUID: G3A97g1MGTna9Z48BDjhJ3OaGVROrL2F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140106

On 26-09-14 12:29:38, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
