Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C3F3F39E4
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 08:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339236; cv=none; b=K/XI3o7cdFtZ+3l9S3cocEpWBDhA1xvT1pvcvcYFZk7Tt1LJuhGM6wgEGStcFbOCTMwPT9gRyiF68i0kGiwqbrU+qr0aEngKtS1O4CET5yXM/hKcn9CyOi8xNajVpFZoaxf0YqWdnVwKtgY8JHHkUxXgJQZqN9tFietqDsFrN/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339236; c=relaxed/simple;
	bh=dLNPvtyLfzJQYiYO1+leMhmhyqiin9MHtSdwsymE+90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iGwAscJurfQ/YxV3AaQ69j6/HstKc18zxv9Mokq5osaU9cIeTz1KejpV/u9yt8g6dEqQfiDBjb5/XKnkjU9BisHX+fJ3eJoE4ry5za9CkaPSyASw0KnCFtHau+Q6ut/22H6LNOB5cfgADfheqLq5v/BKzsWSHIUZkUX6alv8ZFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MLQR9UWG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LuAKxuE6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MLQR9UWG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LuAKxuE6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VhNd960667
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 08:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ROXUs3SwZXs49UllWw3FErqQbUnANYqcoInUD6cvKSM=; b=MLQR9UWG/RYTDl/g
	LlIxDSFUIfsVHOosDshPqn5D0kS/IaxMD4ukwvBe9qclL2M/bBK/YCZBwiUc196M
	sre97ye8MnVuHRYuU2kQfm4xJtsEkLr5FocRxjUwEHz31e1omWQt4fAA8XbTAL/z
	aaexd8Z4ZRrGn+KFJyLW5aceE4il+/uyQymZWrj3vmSWMukpF/3SvQ8s8gOwN/KH
	S4JWlbPsJD1UKuEUNYUUHDJ0AXOwtqX4Uv/9hFK+HDuZJWzn1ilvfzhZOaPj5LVT
	3qhghN3/lpYbvZGryQvGJSxBEmGy17pmKx3w1BG9lw71dsRLwqIskN8YawrytD5e
	rWGjsA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge3n0u2h6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 08:53:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51ca37ce4c3so1882451cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 01:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788339233; x=1788944033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROXUs3SwZXs49UllWw3FErqQbUnANYqcoInUD6cvKSM=;
        b=LuAKxuE6g2SB/p7c27FLCDr0Cl03l664rPmh1Iz+SXBPBtkcwTdm3igzvYhSu7HRDp
         0hcgDJ6EvIVAtlA8RcykDiBZHiF6i5t/ZBouty7QMlwk90F3aGXOTy1AqjO7u3vQHtkW
         SjVIpgmOzWFwMsF/nBNCIV3IAWXZePXrzv4PbZFW3vhMFWz8QhWujFiIYlSKDbO54pCG
         mPiIludy1D/qtFSt75EMrJY6x87EAYaa9TYMs6Bgvu0JhFWFrjlaq7U4R9xKXoaneGYo
         yJTg6FMn92QWb1kZr8d/xeGJqtJCtynQyxGz6u1SKDazFP4H6AngYMdZdJvfx5ZpyUim
         B4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339233; x=1788944033;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ROXUs3SwZXs49UllWw3FErqQbUnANYqcoInUD6cvKSM=;
        b=H2M1TTifOVwhdboIPTGh6ketm/9fL+jodKp7jUoXS3VrQJoaFNF2INWHIfYp9O0jre
         A7w9lBv/I/eFu3JbWmpQ/X7aBhXStRkp+u8NRwh93u9SO9GlRimgI43LC8+hYH78tQFD
         RBqW99QIiTso0Sz2RUopsycjokl+zp64VU1Snfb8cJUxQwLchSgS3Rav813EDivZaQNf
         A5z7UTePZZnTHcS9ZVseIXfoI1MMPcVGV2sPAMJAbhGVG8jO5pQWNqOnRYN4S6u7Ik81
         EWQGgS7gn6ZErbWSG3mfODhS3I3ezw+eidR2mfAzFfMnYP4c2k0+uNTjUCKNX3KqU4bR
         XqjA==
X-Forwarded-Encrypted: i=1; AHgh+Rqccl6ALaowbOcbfPWf1xikZWi0iyMBcnhJEsa4b2ISD9X84yXSEqTM/FAcdn+3ZVzqD/pUkC3HDMQG/WHt@vger.kernel.org
X-Gm-Message-State: AFuF++n8m+9H58wSclI6f6rwnL1LsEQDytYmuTZxpIqv8gCr4SEg9ymb
	FbbbsANv7/tCyzzRR9wkNX3LhOpVXGdk8RBDhFoh0a0JpVceiuMSTkE/M/HEnZ38TCfIV3pY6fW
	ezzoxlG+Vn8V0MrNT/ADfjwpuc/yMp3XLwZ5gLwHIHwD1TfTXFfi+b5WpNvXd0DTNCoR6
X-Gm-Gg: AR+sD11O1zl0IiBaPwaF1/hlPgRv1NdqhDyCZpBcYxEt5mF5w3m4n6qejkJT5ZC5Pf8
	4gvcLgClW9/XvOBfNwkqpk7sTvArS1RaofWz6EVnX+wSPJPwJSxtOjPuWkv9Cayvi0rA30Pfxib
	1LoL25fnL769aUcrwwEPk/WACcG0XnOqIUgIPJEm4AqO1vcLxPXysn9hJ4RtM0IvRdiooRsrRbj
	hrLWUVxHCFj9IzzWT3ixcMI7TZVMrmBFb1VE7t3VPmdRPBKhueycjECDdyzEIYnZq6RgPDV6DR6
	NtUzOn/OVWtR4BxJW7XfHAL0NZ1vXn7dTkzfA4DaZIqTAXPDU3SdtcPggPt+F8uLiNTUZ0hpC5f
	SIYU+UmX6hRHvjqzc7K3UvA==
X-Received: by 2002:ac8:7fc1:0:b0:52d:9db2:7924 with SMTP id d75a77b69052e-53036b81bb1mr17656201cf.1.1788339232496;
        Wed, 02 Sep 2026 01:53:52 -0700 (PDT)
X-Received: by 2002:ac8:7fc1:0:b0:52d:9db2:7924 with SMTP id d75a77b69052e-53036b81bb1mr17655961cf.1.1788339232055;
        Wed, 02 Sep 2026 01:53:52 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f942fe4sm715364a12.25.2026.09.02.01.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:53:51 -0700 (PDT)
Message-ID: <857bdc72-fa8f-4dc5-ab9a-16ecf2903a24@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:53:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Add parent
 supply for regulators
To: Luca Weiss <luca.weiss@fairphone.com>,
        Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
 <20260901-fp4-regulator-supply-v1-4-68288ab70aee@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-fp4-regulator-supply-v1-4-68288ab70aee@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfXxIQzpNWn2N2z
 1JwEqo4uyYKIyFgrO8LYzoW1ZtgAOgej6pOL4nyfBxJv5y0XbkAaBU8P1xDH0SBTrmxsb1/9jxz
 y5AITkRTPe4cD7DLbs+vNKwFxSCXJD5bcd1JNvmwHyS2B9mGgv1jgjIj+3tFVheEWD2uUCxbYw9
 kdjOP/jejRvGaSzmHix1XOX5g/tngORS67qFHU25QnOwcu23GGj6RsE8Berj6cbgYFB6ri2j076
 uJMkkwA6KFySOdGE5r/ZReLsmLryy7InpdB+d0ZkYTLDa5jtHaDszz8q5BGpERb4mtTcun5J305
 nmmYtnBv9GEE/6I/4jI2bm+oHjIaS+Gyf4ekrM7we7W8cAF0iz7F4t9h/KBsHtrhjKr40bwLsXL
 weg2jfsJ/K/zLE5qTx/aP8xHKKAOGXW0571+iHz3zajzvKEUjAtcX3XLvPKK5kX4++/uxZ9Mwnc
 VeKNDi4RX2363CiHXEg==
X-Proofpoint-GUID: 1SZuge6htzcqNMGU0KLeeVcgrh1UdFMO
X-Proofpoint-ORIG-GUID: 1SZuge6htzcqNMGU0KLeeVcgrh1UdFMO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfXx/gEVfCX6Rw8
 VnQJC2x9sbx0oASDOJ2Kk6kNls2TMzLEGQoQJomF7BYW/P5skOwnaueTTeirGOKTZpWacmpNTpN
 e+90JXxH+dIqybW8zcZBk6lGAHXnwjg=
X-Authority-Analysis: v=2.4 cv=R9oz39RX c=1 sm=1 tr=0 ts=6a97e421 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=fBQ15DjUyzdVHG486VYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020078

On 9/1/26 10:58 AM, Luca Weiss wrote:
> Add the vdd-*-supply properties to the rpmh-regulators nodes, so that
> the parent regulators can be enabled when needed.
> 
> The regulators s4a and s6a are a bit special. They feed back into
> PM6350, but are not modelled as regulators (or anything else?), so they
> also can't be added as vdd-*-supply. It would seem to be possible to add
> them with their "Default on booting voltage" from the PM6350 Data Sheet
> in the dts, but I'm not sure this is desired.

Yeah they seem to be strictly intended as being part of the internal
PMIC power grid.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
