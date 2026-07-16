Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B77A385D88
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784223489; cv=none; b=pl4eF/UCmCzR5+HRXgSfNlev0cn/V3/zzWNwwIGk55Jf1y3mDFS+VuKT12/nToUcAnGO788eqvfiyMNmTiL6ippD3cX3vhAPAX7d14g6/xSj+hLnFVvf5CGigM4Qf0InjUHmFCYvnKbWmI4nHQXWCCjeeu46b60bludUyefrLwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784223489; c=relaxed/simple;
	bh=6FgCbhLKPWL6HdYEE0uVEcv7BSOVLam8e1gtAgoSbVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pXUxW1rEEiXluuCHHF6H0szLIydk6IVqlHq0XOKk4zUwtYREHpUkf8XKrap9qVEjf3nutTdzdWw/ddLKwwm7C9paInGnCT7zA7xOXhq2Z0EAz9NCpuWjDu/1a0iqfurusEt3D9fAz9b1NYsm0GdZEcHCuk8LT5rGN/qFCfIdtlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqvyMABK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pt6ogdmj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqvyMABK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pt6ogdmj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GHZkAD3544544
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jnl++uPU4YLzHydCt3lheC8qNri33hrwHeTaAVYdS+A=; b=iqvyMABKxSSfmCFZ
	I+MSvG7ELbBj3M8PNuXmhC4q0PpBOvEzbh7YsqjYdFL7jJ0iKVvR2y5Ij02mVorV
	jFt+kWA8y/oswQeRy4+mjXJbIpOy+Ue/PfigduJ33Y+k652/gpUIG5srmoO1y8hw
	PZc2/TWCIs+OTMrxy6Da0RgAClYdl07kDr+IW2r1GOuZaQY3081O7bJAB1L0fyFF
	9dPqiVDWgBNxIOgC5DU4CsseEaMi+AYJYRFegZ7sx5apE+A0YLvfu81F8Do99E15
	ifbluxPJ6J1j9fPfVVGsjyMwTimLs0QLcDDRUh5X3W/3B/Wt7WpMFHNFQrCu+qS2
	aFTorw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u800ek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:38:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e68cbeb53so140958385a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 10:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784223487; x=1784828287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jnl++uPU4YLzHydCt3lheC8qNri33hrwHeTaAVYdS+A=;
        b=Pt6ogdmjIr1iEkE+Rvvn5tLEElcnY4OWhDstdrbviV55a0LBMSiAXAoeWsKsk9v+YE
         Vg4yAVvyXeZlOXHk38IKvFiX8z+izf+BjLJvmeSufnIMxCvrkTGL95xiUFp8VUKy/uvz
         pRqrOy9RD8/oqGIus4oBIVvyaFn3i27cKA8ZGDuMNwEOAa8KxI9y6YDJfpOLgqqLSR98
         KrwdD3YZ/UlAOEdo8XEkmMWXzskLD0vhUhUr6puUFNQx1eMNfd7GXmcLh1Dqagwgi7Wp
         8CU+f7+fG+6flrjhRoSwXE8WHlk5CoTtamJWE0lhmzo5ANpeqcTWIGURFFeEWFw4RO+X
         w2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784223487; x=1784828287;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jnl++uPU4YLzHydCt3lheC8qNri33hrwHeTaAVYdS+A=;
        b=RBA5Sg/LvMfaqonyGXeF2iSMlTWBZ1w6lyVTFhS9ue0B4sThYBPFj9HyjQwy4alqnd
         4a8ur/i2vAyD4uk0RHNreT5A7UShSoaBqRsJm/drajdsmhOFniR261hcUsUTlbfNNN02
         rAJQp7ZiBLenBFA81kPbFYErzqbryy5nB8p+rGi/AAk3ZgqsGqbo/MWPwOsSubOwlmxg
         PllX9cjjatdPN06dBNP6oRDUL42avUruk5jpkn4rJevbsbNYR5t83+RTz5RROOAdSpa+
         nWLhGewWNaZt2SdGvSb8ePsube3bUWkKlS36kr+/AJS9CUf6Glc3dIaH6lcEFgg+2GEB
         eg3Q==
X-Gm-Message-State: AOJu0YzKiS3aWsWb5kj5x8OhP6YDq3VUtfUVbYHyWnlo4eEo+ibK8xgz
	wQKnTjCpuXLhO+3uqqc/NROfDznK6TebVFJ/WK/SA0SEbqFe/MqNBv3hfhYDKsGTI1XUj3Zvqjf
	iw4OWV9Z6eXgEuqx7WFXFkyszTOOV/3x2YP+cGc+4sln/P5gxLzIasdnybBF0Y/K8tblh
X-Gm-Gg: AfdE7cl1pvUlCOFU7TMcwoKVL5to6LMq5vFgfyPxr2oSbIAf/vStG59Ek04LEA2dVz9
	HlmEXaXgvAx4oCkPeXtn256+4NTA3zd53Wtte3H9roukQ4i+szwC+v7Qj6gkRH1c7wYvFkviEer
	gDiqiYD/08iksM0uoIhEj2NiS2xXs5rPEEPI0ECbkRwzp0dn3ug/vYtTxIim78kEzlaKDHvc4Qy
	FOtioVIrjFE+pvfbl/9lYq396bbFLN8LOXFXHrNQbdNDGXm7H/zW6IlHJ3KkGKwyNw66wTn59a5
	sFR9xN6OJAagntd3o/oRASKPwerBp474CVWjdpgwB30irdH61XkRAX9Q0KDboKM8H/3550076kn
	q27tUi/WpjWG4HsAx3FP40GaK
X-Received: by 2002:ac8:5889:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-51cbf0e84aemr183952591cf.3.1784223486578;
        Thu, 16 Jul 2026 10:38:06 -0700 (PDT)
X-Received: by 2002:ac8:5889:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-51cbf0e84aemr183952271cf.3.1784223485998;
        Thu, 16 Jul 2026 10:38:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16871262bdsm267180166b.3.2026.07.16.10.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:38:05 -0700 (PDT)
Message-ID: <5f81dc87-3f90-4f3b-b152-ddf6478e8b69@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 19:38:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: Enable Primary USB controller on
 Shikra CQS platform
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com>
 <20260716-shikra-usb-dt-v3-v3-2-13f73a0571bb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260716-shikra-usb-dt-v3-v3-2-13f73a0571bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE4MCBTYWx0ZWRfX2+ZpQ1oyV1fW
 LvAIBFH2Ooi7qfjun6xg3f2FxFCVm5/2qb0vy5hja0sorxOtt4jrYbZy4CzLjKxU87A3GLxzi+0
 cmercFRKZE7UiUklNOxwaQbBYt7hLVabGCNR73HM5kMQk9XnQ6Vbp3HYF0OTyRmOR1BSYPXXf4F
 FvzfWLNe9GGR3LBAFFz6pkILlFB3X7cF56lIck6pm2AoTJAFXIR9C2lbFsdX2OrrlCTnV3Uv8cN
 sMFHf4rYE1igX+jQnNwG1iXGPjxy2BMJvSnquXEJrojPQ4R5DIU+YJHqcwgwN5J1spnGiYUTWvg
 slXCc87MwS0agTsVEu85C8MuOWMX/EJQSx3xUaY8T/AZKs5l66CV7lhtyCDD24sP1WgRhIQTFj5
 JHkVWljMkRlBxzslqXcZBg/UWwRoHMCxj5K6DnCb3IqVhXLPuj+yzxNs6mpIIKEvuESLK3XB8RM
 Ga0l8Jc1vMrqQCpn+0Q==
X-Proofpoint-ORIG-GUID: mHr7KyZtKPT08_zPImilFXOZmQFrVpEk
X-Proofpoint-GUID: mHr7KyZtKPT08_zPImilFXOZmQFrVpEk
X-Authority-Analysis: v=2.4 cv=VMvtWdPX c=1 sm=1 tr=0 ts=6a5916ff cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=tzsdobHbv0gAxwO4FHYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE4MCBTYWx0ZWRfX6sVrvqvtu5p+
 z2cIUTojy1ILkAZAmqVDyhff0PhsTVJEubimfy0zUi+fso7AWpf8RqXYWyX2mgfbwF63KpvHJ4g
 2Df8sRbj0UZSvqdUB85BpdNP4yxg3oY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160180

On 7/16/26 6:29 PM, Krishna Kurapati wrote:
> Enable primary USB controller in device mode on Shikra CQS platform.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

