Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FB4272E53
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 14:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785334585; cv=none; b=XezSxNTMjsKzO9NyL+WGWQ8fYtHi/x4Rqnk/CP9QLbWeIUjHxck/yGtUdxHJGo3hb8dCmG4HRCGExG5sh13QNdUbTDF1ADK/6tdMvpx8YkzUM2cYlV/ZgqVBcQFeJbrH7kYNDYfTLf5yBtKhGlTdEtfWC4lHZs8iQbnis6p0rTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785334585; c=relaxed/simple;
	bh=JMIBpb1ExvceHVp5GEsXb2xACewrO/rZ1p899xf1kgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fF6gD4Q0UDzaQxFnJvxsjiAi1/VkQApPw1ypnJKhYs52RsgEOhuNxZZi0p1fdxZ2fidLY16JHX7502iCI2Hk0qorgYz+hy9htZadwST4CJWt83h8XWRnGTJf8MHm2sVO7vwwgS/CIQhg3yX8WboFtnZy6/Zu937ZN726UWSMxDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LXQ9/lMZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZYbcuJ7D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LXQ9/lMZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZYbcuJ7D"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TD8Alq1932574
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 14:16:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/dM3LZtY2QW3bAxdQMQdlfK2xSOQdG1B50QWVPiIzAM=; b=LXQ9/lMZI7HFosOW
	4pIbkHrfv3c16Bb5yujlY4SCPRf9KbvswEI5Y7ucHd1/ym1WpRNCBuxvf3Xh5fg8
	Gqi4Y7v9BvTrnXNkfl0JRVTeSUQXQkv4weM4xbTt85nje78+/A4SiehjFgsP8uVU
	MEPK+KfNi2JP7dTPHt6lFxpX4hXdF7sOOt86E0XzOIBB5qF7DOFA0544wNoqSxbm
	gc/GkWBk81oYt+PL/y0MqvQOg0Zsh0Ao+YklyZiP/DCLalMUA1ko14rBachACiRH
	tQoXRlIIY9vTTB4Gg6oqOvbxCgLWUujbJkxzDhS1EQQonqA7AlFVCd0r8UGqyI5J
	y/6K+g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqh2kgk5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 14:16:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51e9d892f0dso3100111cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 07:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785334583; x=1785939383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/dM3LZtY2QW3bAxdQMQdlfK2xSOQdG1B50QWVPiIzAM=;
        b=ZYbcuJ7DXofT/3Mnb5V1dIOyAJCivaxVu2WmROCqRhrRzV8IjucY/rW9Oyl3oylXav
         gwzexuztD7rHUvaDgh3nd7ae7W8ccZGx3KZZaeusP31r+2Dv6e7LljgMTbKVkMXEnk2l
         kqXengwZHQJM8BeeL9E4VzJOE8Wt2ymID93j8HzYCV0lVytVA9Cs/V/1c6vBYto/ph6X
         PI1gHgV44h+WkHcJY0pAg2T0dsB/NdH2K8zm0ki17v+RvmIpTxbBPhHoBf5VXD1gt3xZ
         107Cu5dTzMN51k7R+5FX+ywesJuTOZb0OARTAkoeiP/JhKfENW7+Ke3Os62KXVhe67DU
         1ttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785334583; x=1785939383;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/dM3LZtY2QW3bAxdQMQdlfK2xSOQdG1B50QWVPiIzAM=;
        b=IewsVCWiOLlrTf3WW//FX2gEYB306dYajNoI1ELsaRp6YEL4CVv26VhAcmcmsoJ89Z
         zSxKAyKKrwUtcC1N8pPdb9xQrV6QIzkTmtCaKgVufjPWLqTM7btr0JQMIshCn7gkJMUh
         MGoxr0lpawXVJDaqGGiYRJQgBs/xeZQioePhN6RrLoJGX155PswRNVXfrNyDIAurzbWd
         HwqQ9LPBBV4i+Ka136N+QFl9TTrQmzc81rGN2zQRksWU9YXoegxsW6khFax30qeze2zq
         zviiJIXQrqL7rBSfqDJTtaSmljoRPvJC2uSVHsO6SG5av5aFtWag0Ygm/Vjwqc/6el1Y
         CVaw==
X-Gm-Message-State: AOJu0YwUlUaq9wbpSzScvMEFRlXC6o0qeGjJumSG1UStI4+OEApX+fIL
	TxgKbB0VOGh59zQfZJhEZsYyg+E23IjfqvtQSXtHAwgMlhk/3glTtFL4D7Uzs7KPr83ULPIFjpt
	46rViP25hAZvBaOsCLf4sNWcm6U96R+osTDktBskK/qiWn0jtlF8dVVH49KphCsoHy7yzWUeeaH
	dG
X-Gm-Gg: AR+sD11UwjRbF3DkzqyMW2C10NiZRBzV3yEh7LnAv9jmQi6p3E8Jj+fh6Xr+CG9trmM
	HTgodoKmG0eQSc3IhnKTfEUFcDxYJduFLbJZzyudRShduLaq93JlO7h3OtC1/3yWq3Dz2zkrxbv
	Tn6NjgqR0InbMpL4EqIGa4KJiIbNGDvaRj+ItwCRVd4vn0ACtqtjCQMd60Wjb2Ujus4lbdUB7Mf
	E+TuhEl8KXRGlxN73UdQwc8EIzDH90Mz0eaFploB1LG07S5ki8gJB6YmKxXNDVFpfiVjFFN0Wck
	uigOJEyX97DmQwtpq/kuuLs1c6VcVa3mbAwzCrl+mybXQTnDB7zZODBajc3DcH/XWYlnSZUYdD8
	fIsrLzYm0rxc3i/TLPuJmmfkd
X-Received: by 2002:ac8:6145:0:20b0:51c:10e9:ec47 with SMTP id d75a77b69052e-529d7152455mr47510641cf.5.1785334582558;
        Wed, 29 Jul 2026 07:16:22 -0700 (PDT)
X-Received: by 2002:ac8:6145:0:20b0:51c:10e9:ec47 with SMTP id d75a77b69052e-529d7152455mr47510261cf.5.1785334582093;
        Wed, 29 Jul 2026 07:16:22 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2d76a3029sm423087e87.18.2026.07.29.07.16.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 07:16:20 -0700 (PDT)
Message-ID: <1fda6197-b981-44d1-9dce-6650939e3f97@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 16:16:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] arm64: dts: qcom: kodiak: enable inline crypto
 engine for SDHC
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
References: <20260707-ice_emmc_support-v9-0-701c86f3c25b@oss.qualcomm.com>
 <20260707-ice_emmc_support-v9-1-701c86f3c25b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260707-ice_emmc_support-v9-1-701c86f3c25b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDExNiBTYWx0ZWRfXxLgMStAbglSl
 J6g8Q+Q428jn4kNH5EvSCW60q69/YYzj5Md4Iz2hg7XKrAhQBZxxtD6tFGGM4FhVSvvHbhbSpUP
 k1jvxQqokOrrmtJ2yPnaQn7rZiMFlH5bip/7MSp1IXoT2XCgSyvEu7CkYZR4cWqvpGcpeBjcJTG
 UUYEA9/h5uBzN3/32/R+WPCVx5iIM4cAU94oHoW0nCeDfGpNfKkKNzbVpjKDO1B0TkvI33ZcibS
 pYtytklX5IKM/Ev1Dme+wG8kfLS1TFM7AtBGfdNA1t+4bvE+wBM9TCkS0sFpdq6n0Ft91Jtk5JB
 1MQQ3lse0I3dFRe3kWlI8z+BGlkHC8HcvrGaID0BoZRtSd9Ya1smeEd/GZ1TAm1sPlPMVRkLIry
 d1SM+wCeJHSN4x1bVufiMX2irSuST+2ztIhiL/L4yg6KWjmY1XMqSGfPcUA2HJCuEKP4vnTQFnD
 M8ViFTnLf1lfwmMK/2A==
X-Proofpoint-GUID: mgtNX0yFPtZDx_LXRTyd2xs4X0pwLpQr
X-Authority-Analysis: v=2.4 cv=Q4biJY2a c=1 sm=1 tr=0 ts=6a6a0b37 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ltHjZ47pji_ka9M4CCUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDExNiBTYWx0ZWRfX+RVyHXYkRAGG
 L82L7C0ectzMf+ly2ctCwnFVmay3ZlnS0K4GFohPULqCYecfyWGv445Fpmo3q5C4BI2+/U5QxRA
 ZcscaljqAu2rfLropRanmJPzmYjOf2Q=
X-Proofpoint-ORIG-GUID: mgtNX0yFPtZDx_LXRTyd2xs4X0pwLpQr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_05,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290116

On 7/7/26 9:11 AM, Kuldeep Singh wrote:
> From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
> 
> Add the dedicated ICE node for kodiak and reference it from the SDHC
> controller via qcom,ice.
> 
> Also, define power-domains and clocks properties similar to the UFS
> node.
> 
> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
> Co-developed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
