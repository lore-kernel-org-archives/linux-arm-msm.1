Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8B64D2EC3
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 11:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976952; cv=none; b=NPT4b+1e+pjcMKA4ZPXqdXr7GLFQyzdUMQJhljMdscjhfTbUIpI02heY/i6u+z+7i1bGGc6w4wWKtQNpeQh879+65W/01WV0DPShQaKhRCSAqjkKBecOTx44+SQl0sOtVAGE+APeUL8vsHovPXZ/Se+jkUERI+vxfiDa5AXEXKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976952; c=relaxed/simple;
	bh=nghA7EL28OfNEM4e9sWQAgadJqI6/vgmN/VOre/IdDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BsiA/GcFcAYt37Y/1+M+ltF4ifqo4eOI4L+IjbO+pXzrsdMS3+Ca67qT+mW/0CkB67cwzA/ieCoDCIK+LDEKVy64GJOZEqnIUz8PrG/KztLYqRBxEGzXgwX1vPoP+oCXn0xOdKo273UPKGNCI21qdVbXMvBSbhVN63t67NhQE7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SbwGiBWR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aPwWm3RS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SbwGiBWR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aPwWm3RS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E663Me3365340
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 11:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ULOvsH3n2tUueS7iXn80SHHQAfBQb3QoM4qM4FM0XpU=; b=SbwGiBWRRgrH+SNj
	luovR9GAANXHx7sK0CrljeCvKxSrqgYh3JPldEv1AFpQ72Hn/zQZg3ILsZkfAcb9
	7oI5bRMcHaBmckKiv4BQVh3//5udIgmeRUctlKHQJ16dMK11WNBNK3r56buYdXFz
	osmtovfZ19J/GrACiTI7Mv8Ux+d3J+GyJIAHWjyr4o/RZFdQ3umvq7bfDtv1uTwv
	uE+iaBxS9qN3z5OW7LUMQWhHRo33B4ek5zBqeBSW9u4tSye0D4FdgCIZLA/2mp7p
	mPc4CxFNIR1CxGe7bUZIKo2tCrTBEtZR00b/fmGYRAnt03genwEyJkVv3iDrBLre
	5lVvSA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46219su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 11:22:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc19d8e59so39765985a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 04:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791976945; x=1792581745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ULOvsH3n2tUueS7iXn80SHHQAfBQb3QoM4qM4FM0XpU=;
        b=aPwWm3RSn2w5FNoKkmmfbbeygQziH5O3QSLhUAF6RGBXmKldOnD+zUzAAPa+gaVEMc
         qsDUgVx4nYD9+qf4+dcV0/KhvaO2IABlSWYAwCHLdHFRZN2Q5YkpRscegJOelReHv8HK
         5SY/153/w+mO7pG5Mod89vpkb8lDcIMbU8R99NGtRPqMDyJS2rsV6+A6z8smMvoZI+8Q
         TudzoaCkHNJdU9lz2FY+bWiAf0ecOyS84MgQSQqhXrPAtgPPjhZgNbTgPs/I4p/myfIG
         N6u+FQCTz2w+anD5fsj3s36GAQP2Q41eukQWmxrdUX45xkzij7ltG+4xxahy5uoNs+nF
         ldzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791976945; x=1792581745;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ULOvsH3n2tUueS7iXn80SHHQAfBQb3QoM4qM4FM0XpU=;
        b=wC91SkQh32D6ZTfQbWd14lqbMNOXcm2D9fVdnnjx2YvsAJpUJWfNpm+0X4PpvTcBnl
         YVpqSc3wqkhYCXzUKl4KkzzINjR6vujYQjbrCvjjSPcFpcNgDuMlATFDkVXkUAd1B90k
         5Uk0rC/KMqxOP3Obem6uy4jkYWsclSfTdK9cgu4HFXZvpzNMIUz7B9jObNxHiWCD5+Bh
         Cjf0KRkJh4L5iXorgw6OLxQXA2lkYnmYoAvYavYLtw4kxmB+GFnPU7ShjR4M2n1fbkxR
         esl1pdTa8ntf685pR0rFizxpxds8pj3RkTTtzItbrceUuZLA62r4uKj+ym9Q+iatC81C
         ZkOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPJm4Pp+PBi+GomHFGAxGXk9r0siZwJyw0g8ftU/AJKbBh2uXultvXIyN1XoHZtUxkTED21JZ7kiRqFllH@vger.kernel.org
X-Gm-Message-State: AFq9FYIPcYxTMXMDcN9d28gYKxk5nGMIg9n8eN7ym7qopxbsNKDFkKwW
	VK4eI42AfStUOrBXJl74Rcx4dxFGLNkcGCssE4aF0i7Tu6UUkkQklAOS2Mph1jRr7+eAqhyKyB2
	BBYmSpPWbpqepAvstzuK4R3YLoQBvqdR12aMQehOnhpvgsq1xi3aq6EhbIzsGL1KJeUnw
X-Gm-Gg: AYBFou13Ej4rvKFe8g8fQpHOLIV/Z6N+2VS6B4HEDMnyr5hVe+v7JBaLBv7wKHzhmQU
	8PYmaiCEfhCZ05UvJsUm8HLn0ZuPErft3S+BnP9YeaVmogs9aKBoTCZH2Pb/XleafNrPK5TiHtW
	koeAHVbjefiOM1/fIAZms+LW/4za7IIvlj/UnCPrLpek/QrOfubvv4wiypR3QGMs1Mmb85okN/O
	z6cG9OKFrEqdRsHiaZrDMV6wDMBjJpYWTFyogMfMa7e+tGvsuV9hnz00SWQe24PX1z4i5Xh4CUq
	HTPb+fv1IuPJleEDYU2SaLsU/7skUFiwhgo5RQPhWi872T82NSngShW8Co6TKpDopVTclOJgFso
	Odig3uVjORS4uX0i9EmnO4g==
X-Received: by 2002:a05:620a:2a09:b0:93e:6618:f4b0 with SMTP id af79cd13be357-93ebd228f49mr2901475285a.4.1791976945257;
        Wed, 14 Oct 2026 04:22:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2a09:b0:93e:6618:f4b0 with SMTP id af79cd13be357-93ebd228f49mr2901472885a.4.1791976944797;
        Wed, 14 Oct 2026 04:22:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae59f9sm689583166b.80.2026.10.14.04.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 04:22:23 -0700 (PDT)
Message-ID: <056e06ca-02cd-4bc1-883d-a92bc4dc675c@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 13:22:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] i2c: qcom-cci: Add burst write support
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261013-cci-imp-v2-0-6873326b44a3@oss.qualcomm.com>
 <20261013-cci-imp-v2-4-6873326b44a3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013-cci-imp-v2-4-6873326b44a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NczXJtDwrfyIDO30pbUGIcec2kEsuwL7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0NSBTYWx0ZWRfX7xu0633JU2FZ
 oX4c2xmy4EWd3p9QkzvKGzWnhn6gi/jZMpok5s6em8DkymPZW3N5Ewk69UzgJarE4NRxheJGq7a
 yvxG0VcQ+89IMGj0zdLVM4hF1TrozV4GxWHEVaSDVaCQ1pMIcRBIck/BBfmoKEqV6YlYJM54E7y
 4j3GriNulZ+2yLav2qjj0upnsw4S8um2YSRqcDxeIqI6O4i6OCqCCL+zvwbTSVJHjfrawO7LDfO
 GX4nHJ3IUmbO+9Ok1ZwFgcWAveMt4UjlGR/20BtskgW/26aThWuTKhipvJXvlVIZaISoHYDJtfr
 9UZmm2wsnr/hEgteK9ANAGfzX/tO+TzMAmidMLUTEEID8DZkCFy7+7Bt8+BIdbi/ZGVtRzegZ/Z
 /gMyn9ONL3WkgsfkuDP486xXNu+wzDV69Isa+PdwZlgAD6afUCzt5DQB/vhmcN7MfJdnbP9F4I1
 caKS9HFxETCxiOVwH+A==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acf65f5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=_CiVM9ECRzYkMLiNPFUA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0NSBTYWx0ZWRfXzvvWIFMotzDB
 1Q6OzEv8tdH4IYBO2+iU+qQZzt3HLNGKwggSwcY55jvkhDfjlwljIRGaTZCHG2Esfnzw7rC6R2B
 lqbgi6Xkkq8fkzvohSiQFhyuTVZOIns=
X-Proofpoint-GUID: NczXJtDwrfyIDO30pbUGIcec2kEsuwL7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140045

On 10/13/26 12:30 PM, Loic Poulain wrote:
> A single CCI_I2C_WRITE command can only carry up to 11 bytes,
> so every i2c write was capped at that size via i2c max_write
> quirk.
> 
> CCI v1.2 introduces burst mode support, where consecutive
> write commands (marked as burst) run back-to-back as a single
> transfer.

[...]

> -static void cci_i2c_load_write(u8 *buf, u16 len, void __iomem *loadq)
> +static void cci_i2c_load_write(void __iomem *loadq, u8 *buf, u16 len, bool burst)
>  {
>  	u32 cmd[CCI_I2C_WRITE_WC] = { };
>  
> -	if (WARN_ON(len >= CCI_I2C_WRITE_WC * sizeof(u32)))
> +	if (WARN_ON(len > CCI_I2C_WRITE_MAX_LEN ||
> +		    (burst && len != CCI_I2C_WRITE_MAX_LEN)))
>  		return;
>  
> -	cmd[0] = CCI_I2C_WRITE | len << 4;
> +	cmd[0] = CCI_I2C_WRITE | (burst ? CCI_I2C_WRITE_BURST : len) << 4;

I think this calls for FIELD_PREP(), but we can do that as follow-up
cleanup at the end of the series

Konrad
