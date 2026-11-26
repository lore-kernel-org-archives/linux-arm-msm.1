Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704720;
	b=V/IWrk3s6xC1PbvKEpEEHEPzDmcSNp8Zy/JRW8Xaa337PvyRoCxjGTcAU7r8JiGOSQin
	 j7uZdjhw3tsDAgJZ/c7jCTqzBOAXVLkrXuqVR3+hflicpwGnvl/Bme+hBdY+PlFmgP/5D
	 aesp5wePBz6lR+QSEloLsYQftULC9FcbX4yMWMZgkSVUXwU5FFCs2nl9Fbymi7AcqjM2V
	 tNq1BUAg3lLhTVxkCyER0UJBJw3A2fsGMZ8Zlx3DkKX0Wnc+DR9VuJNJpaBb9cZJLeOBe
	 baFLuilNWPdlMHvSuiGoDfvXb/s5CpQbUIShWhFoWem2ZxBm4UI5wLMuHSpDK49/HQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704720;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xI8m9vEWImI/pxO3zJqG+/ZGVgDGikFsjhT5PJEyTA8=;
	b=Nh4Hc1XbaUhFG8VbykPP1xgyMrfzuoSMPa9XfM30K8M926o4BlWblFBltih7K8ZeeiAZ
	 dRH2EkzS/w4BIodUSGC+4lZKj3rh8doeYM7iNlv2+fLBjs2ar6CwQiMgF6KjqeOAoW2D8
	 UvYB3H8dL1lig4zbLZ9d3FCSMLfimxUhi+CcH0SnEJ1iYgUofJAA/Qr1jzCYDafznt4G5
	 z5/Jbg9mpN8pdxMgYyt2fPH+9L9nBOt1vnx2CYsVJ09EZnoUqhYCplzcDS7NdFs/P2FAR
	 +svKbwfnUB9ZzyUDhldRIqDuIq9Cd6iXWDgvWNwFF6P+1JzUYa73Fm+mCTk+Do5VhUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ma6CmOqV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iqpblyhN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298C6606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:52:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 298C6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ma6CmOqV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iqpblyhN
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEVET63143467
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xI8m9vEWImI/pxO3zJqG+/ZGVgDGikFsjhT5PJEyTA8=; b=ma6CmOqVTEZCgkuP
	m5/rETLGCLHystYO812TFoucX4mUdO0JjX92XlMITVuF6EjOjNreb7B3SuhuioTt
	LQt85y43KTKE9XVpLQCBq/Q/j/uvCj+I5SJAFIUe906CdTeeW9pH1sHatp2202YN
	CcJFFIKoLH4h6CS+ojZC7JOqxROKEL31WDgt9q0uLaL7t5WUuFqynEWxmijuWWkL
	axYo7tWVVrxVq5FRjndE8o7afILN6KNXX3mRto5hGTBAJYeCge3CGF4MeLBz2OVS
	TsEUmKaadB3TumSe3PrIZRnfmxt7KkdbFPGShSQTlLgEeg47reKppBr+4dDOFaNm
	TdqwDQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahvuus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:51:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-54e4ecd1b4cso16033541cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795704718; x=1796309518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xI8m9vEWImI/pxO3zJqG+/ZGVgDGikFsjhT5PJEyTA8=;
        b=iqpblyhNJ4zEpuCy6AGzzHhRHB5JJxEjLZoVXM6tBWHGPA6S2Jf7a5dVvjdTIhpYML
         sSAV4mxelHyLC7Izt0Wye560jTtK0szrUYLWGYmdI4cP/ch1ccIOu9zNbCMWGnerM6Fs
         yPGYc9QOk7Vkxk4ydKrw94NqnfHSjCJidpRl57w1UOWIdaGEUKnKE9zbp+/ZcPVQM+sp
         uDUqPit3EqFV6wYS9aBLiCFZuFKPTJecI7uoW/kgxHsY+QAC8X49v0zeFdoZj5QQ7ZTW
         /nwJMeOJKzU8bvtRx+Fle0XAVXcs5sMSybTy/y1CnEmHvcOK4BbOoZ+0G15zBfrxSHZp
         yumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704718; x=1796309518;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xI8m9vEWImI/pxO3zJqG+/ZGVgDGikFsjhT5PJEyTA8=;
        b=JHkZpoHMa44ojv87CW9DJ8kxr0Js9Diz6hXYHNwW2/ZUa4iCbUcKUVMeH0nb8QCllM
         m0lJordn1QXJJHWcqsd8KZ7sr5/8Ol5uZrbZp/3KSaH9AaeiOmuf4wlF388Ffx6pWNIm
         vWQsvLm5g2JW+rDAfxrRYiQmShFTHFeDqdUVQLLuWkz6AOCbyXXal7S68OsnaP2pRDeO
         KUlCMLoVijN1Rw5dLnRK/aeV5EShAKEahEl0jCKSGiEAVuWNPuwaTYw56U0DZljHK/Kl
         RZy0B4KyLPVqSClL6WzM9f52qQXFc0YHxJM1HtesxdHZ1BcKe/VxtUPL0jmXQxITTVFE
         4e/Q==
X-Gm-Message-State: APuU4Z/MXLCLFyHCPRmHS3WMtaz24as0Jeu3LmepToPrJBBf2yM82/TB
	fYUbNQbFKaBgNhtPXPan4mZ2uouWx1YG/b6tDQd0kgJUZDLWjiFecdEm5/eVuQCfqa+clEey9zP
	gdtBo00SqnKO+HMyWOsr/SJ1PVQxPFWOfFPx1WCOGtaXUyRV1cTxvPv8cdCx+GQw+j9Ui
X-Gm-Gg: AZFdTZfXYexeVgBnxjpmDHHQIH7K+KuVaFXQJeestdGPNYSQgXGv8k+euAq9Ijkueeb
	S+loDAg29UwDmvrXklHydPhE+PKqaLAo70WBxFG0XVpMpghaMR18kyVNRUywzEI/N8j+eJdJsnr
	ZSnJj6bXMifX7wL5/Zrg3IB+U09g5bnkaOnjHj2TVIZhHxHzjLSMT9nFySjshPdxEX8f1R+jo5T
	OS2TH+rGISg/nD3WWorrfnyTPVjLOTHWeo3y5nVrAxlS5g1kB2Rr3eKhekYD2mB1Jlr3OEtfHmd
	HgTEUU5HC0CEG7Daiz3cMZmLlt+AaduqwjrvYfU/rR0rQXYEgQoMowqmuLiUi/pZsRbLqO1WwdR
	1OjmPMz8emlVZfsTlGHPIWNNHw4XjloJl4TRFt6RhkJR+/JNuq2hmt17RMt6PO2L/d+yasGU=
X-Received: by 2002:a05:620a:a084:b0:949:c973:1372 with SMTP id af79cd13be357-949c9732a6amr3374723185a.3.1795704718223;
        Thu, 26 Nov 2026 06:51:58 -0800 (PST)
X-Received: by 2002:a05:620a:a084:b0:949:c973:1372 with SMTP id af79cd13be357-949c9732a6amr3374717485a.3.1795704717712;
        Thu, 26 Nov 2026 06:51:57 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6872asm741485966b.13.2026.11.26.06.51.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:51:57 -0800 (PST)
Message-ID: <874b1934-c17f-4134-98c1-fa24e287749c@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:51:54 +0100
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
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm8550-samsung-gts9wifi: Enable
 CDSP
To: nacht@dxdmail.cc, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261119-b4-gts9wifi-followups-v1-0-2e2388589a62@dxdmail.cc>
 <20261119-b4-gts9wifi-followups-v1-1-2e2388589a62@dxdmail.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261119-b4-gts9wifi-followups-v1-1-2e2388589a62@dxdmail.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: z1YhO-80c7FG1f-x85W_aNy7xPZUJcKQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX++OoLAX4t60X
 rwBC3y1CF819XUxyoa/ucK4mTg2cXUSqKVvycEUiJFDAQSA3fzI0QNskWT/kXlr1q0ukUFrZOKr
 e9/m4SSjRjJ2BA21ZJuzRkJQFL/GsDI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfXw4wHcPzyr34h
 6wtvM7v7qKU/vH842TVXVl4DnFALnuX8XY0IpPEN4tng22xTsCbT+AlZ4mBQbgh9E1VSRXlfdaf
 IRGGQsLUSBIi+p//1eV8lVNA3xxKtBRdXWnk7stR6Iy2r5hsjCvW57yBTAA0tCUtrKPKv4uItmT
 0yese0cfpSxQAYBrdkIpkYVqRyCf+WMd4pa8DZ/Fn7T3MbB9uX5WL+6IEKUiOnGXejdBFBJ+Sxr
 FWWDYy8bnsHc+uWNBOeeCv8ALWEwayAXev76VsImtJBpGs9O9WfK1V/Ohm4r+gR4CcfFyCjRhYI
 zIpIIyf+FgM9r1P2ojtmdeN5Ikq/Q9Z/SuqzBqpeY2GddpMH7Ive80QjwLXXKWh3NuStMJ1g4Gi
 uEDG4xXpZGLrGh/1iHNEE0u+Y/oFfW1t0l1eSVem24QCKdoFg5uXa62a9XrMhoecfSOHY/AYSQD
 CtV0ncptEfwAvKNdIkg==
X-Proofpoint-ORIG-GUID: z1YhO-80c7FG1f-x85W_aNy7xPZUJcKQ
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b08478f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Mq9dOPq6Hou_Oe_0EYsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260058

On 11/19/26 11:40 PM, Nizat Mikayilli via B4 Relay wrote:
> From: Nizat Mikayilli <nacht@dxdmail.cc>
> 
> Enable the CDSP with the Samsung-signed firmware shipped on the device.
> 
> Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
