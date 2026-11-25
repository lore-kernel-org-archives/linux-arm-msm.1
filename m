Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603785;
	b=oQYNSSDZCk+F86MdIagJugkLxKHLHBJjLl211bmKtcMlr3sV/MUlCFR1tV9nxRGv2dX+
	 pKr1dLva9+xrKBsP8ZpfgRjHGptmYNt6gp2oNoRTBAUlELzaDNQaTY1vk82dBACiCGvvJ
	 ST+9eAzN7MBw6DkJEAC/plEsNQ31IbKfNE/V7cynGWdjHISfDEBsx9p3IIvdJ/qjB38fG
	 gIyvDOW/sdC8ibZ4/wLidndeWCbWUbxEI+6V4X2mkKJQfu5ncTvirmNywZD6mWnM4bHP+
	 ohGVbkpAl7WPGheVy5RYf2rG5uTrWh4DpP9rMJD7jemVwHeiPCWmPmFi+UEycujqD4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603785;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=h0Fcz3/M+uiOmSyjDB7LDH22c/hTHLyH6qOeY8tpaH8=;
	b=OPHn/tfksGW+CxpqiPf0yhccZ9Os1f0+HZgaIXZTf7uLQHzmjU2eDSeWfixgd+TEPKQj
	 8uQP23Qwm/U/XLMQL46el4YtCyuLlXtgPD8QMvS5CV73CHPVt9pBdnqLdzuKuSyLV4aqm
	 7ka+F7+CRRPvXg2nFfSX0Q6qySul0SQm5o4ShLNufpz+Kc5zGi6kgnl26Kp/VxcE4uISL
	 SexPsoXun+Vru34GhvmW/IL1nwCQCXwA/c7mPG7K6Yo9mKOVdAnxI/7h8+w0o/u0mS3VY
	 GpEVbP7wogwZZCLqHbQ2x3ENmYIvwsU1IXrn7SSZpijx25/A3dtaxuhio+ra1AXn9Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="HsoW/V8C";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="EHdRund/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D33606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47D33606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HsoW/V8C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EHdRund/
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mlvn3611460
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h0Fcz3/M+uiOmSyjDB7LDH22c/hTHLyH6qOeY8tpaH8=; b=HsoW/V8CpuiMFw5D
	wLxNlxpk95W9vXffWpDy80+NWOF2t2SVcVjn8RUZOrz5oMIj/o1yewb2CNMNYcUy
	ybed+vv0a53bCLRiENwkqKSrYe2iKNnSLilwpT69/6m1QcLypDATD/jVxe8IzWKn
	q1Fv51nA2QwMoeeKCs5RpUD0gNKBxx5JNPHQ87KlqEAUjHDmQnWrMhcsJnKZRUiL
	NnU4mQTpSzXaxdv10x6HC0uiFBkwkbb4Hg2JspKZ11qb++8/7TET01t0BwW5zHEP
	4vwgGo1wngVXrWgy/ay4dFl0Cpb6KflzJV0DTG4mOAii97nduYerZcyVdi3kEfh8
	V5IVbA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsb7k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:49:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94993a54a73so50913085a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603783; x=1796208583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0Fcz3/M+uiOmSyjDB7LDH22c/hTHLyH6qOeY8tpaH8=;
        b=EHdRund/CJcF6w4AGXIYhwxuzOyYvAPHIhF5UhkNeRU2GwX9EGzkonHTvRGkJq4oNN
         WE2tDKUAsdtnY65xSyp6uoboApClU+ujU335geC2nVWxjOZ442B4dcf5CbrNBRtoElDI
         XcTUS6u20wqxdKqZKd03LkrZHs2Q0sAj09cxhwuam0B1/1HegIyVeA2IpQLw/wMXT3cg
         8LJLSIZiqrBMIIgrVZX7F4PsLn96d2I8kRDdXBI802mOgitUOMJIWfAaOWyE7IhOm/j+
         WYL/nkk1jdPbtjlvgJVIr5AsuVfQLqiwiajUBEj7aAhEwuuPPyyQfcyz8WQsTAReji6d
         zPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603783; x=1796208583;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h0Fcz3/M+uiOmSyjDB7LDH22c/hTHLyH6qOeY8tpaH8=;
        b=XS5o5SCdh8Sxi3CAavI++5wlkm9jIVs5Lo23t6nYmz97Jzom6J1dp3mMGFosmo/TZw
         D9216r9BBuULuSHquMYXUA4rGBfP3uHjOW4xG3DXZBX2rFZ310RxMUFDGcX+x+DTieWb
         JpJQNtrp4j9cyAL3oBcHJJSTiVis3Oa4v/0l4oHBqpOLOGdCd6i2RQgw3mvc6YGAztda
         EZA1HaWS8Uwmhf37yfPErXMn9BP4f2laKSJsNWuPL9boVfAubngeQu40tY0LaMqwaZJl
         r/3Y/ScG7+rfu8WWSU7RA4UIdtuNkwOtVYmjwlXXcMihFvtEgwiaTS20HmkHdCbe1OK0
         7Zvg==
X-Gm-Message-State: APuU4Z+352+lt/SJC8mDJqsbHuw1EWFHx3RBmcvO05mw58i//9siGyKQ
	fbJNv27phcbw35efyUYZjI/BzO6LVBmVQxsM3YutCLAL3F6Nbm4hSVT0h3/BjiosyXrTM5xOZyK
	2UOxS6SzZjlGm7CB0V+XUNHL51CHYK/gLZWJXX+TTSTgZ57J348GD554x8S457qKnVGhC
X-Gm-Gg: AZFdTZdrrwMAyDdtFv3dXaGS558qAjcX/gNGSg/C7Ic7/KpdVBLBtpI3M19kzs4uCAG
	odsFOYOR7Pgn/V7sEqjGH88x2EZz8WlzS3ZXMx3J9wuSWiNTEMme5rd0S5/dkdbM2iE5Kmg2Npw
	xqw05InsjnRfCTLflJPSwqACMJ211LW6pic7hzQckTx7iQJNucjr1w7Wkxu391plCYySMiW9rQi
	Vh2giA9znsm8DnJ8NwGKh6QGfv6zdCFRV3zjXq0ytCDNj1fQN66KDRhjtdfuwsv5EuW0+Gayvu4
	jZGFi9H36a2Imd/oFI/O/Jcdj7q1hDHAfFMFNuI3zM2jveoEyxzJ+bjXTVN1TFllM1ezIR1YvIf
	hpvLQyycvUBje2WodG8wRW+F1j/HUhyjJCKSaaVUSuCgZG45DiG9HvEpdVlp6xyusTvJGvDc=
X-Received: by 2002:a05:620a:a017:b0:949:7642:6de7 with SMTP id af79cd13be357-949ba85c0b3mr3323736285a.2.1795603783343;
        Wed, 25 Nov 2026 02:49:43 -0800 (PST)
X-Received: by 2002:a05:620a:a017:b0:949:7642:6de7 with SMTP id af79cd13be357-949ba85c0b3mr3323733085a.2.1795603782968;
        Wed, 25 Nov 2026 02:49:42 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm618256866b.8.2026.11.25.02.49.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:49:42 -0800 (PST)
Message-ID: <8fa6e8c9-213a-4af3-b1e0-9b6c3aaa2821@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:49:40 +0100
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
Subject: Re: [PATCH net-next 3/3] net: ipa: add SC8180X (IPA v4.1)
 configuration data
To: robertijtsma@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261125-qcom-ipa-sc8180x-v1-0-48a889acbe6b@gmail.com>
 <20261125-qcom-ipa-sc8180x-v1-3-48a889acbe6b@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-qcom-ipa-sc8180x-v1-3-48a889acbe6b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gw4dgVnGHvR2S1iLTy5tYk_lAChlOWwA
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b06bd48 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=wqfpHMpB0Ti-P-UBA1kA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX+3ik6pFS1QZk
 mI+FbNvGfBSqIAcwd3cpO0+MFQgUd5rT+lfu/tyXE8Qq/075xLfew2Nuud9/0NjcLHifEhF0U/L
 obXiTCJi0cJHHM/LQRZsBHupbaCuNDQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX2VdpHP2mY51L
 jj/7g317W9++A66G/WY6ndMAUVze/tSFkdh7k75Md/E4u2noSqXDgpvtejXgRBNVXtw8c9gYhHB
 1eC4agM8kjV9GzcORdH6dmrg+b3Kaaq96GI27dYz3N7t/ViH5EZHwyPWuEDi6Cs3/3bzisWEUiE
 Gik1BtT35zJk8vt/vaLtTQy7CTRicbe28pR58jFDHcuKxNd065LIWv+tWe+j55QdYcbd8tfUWYk
 vj3Lo7EL3hqpcln4hB+2IkwUoxYqG+fIUQmw6Lcnnp/eXO9CMP1OTv69ne7vvhzZu4OTxQxnKaI
 eVLzYlkzeK5+h/mA8lYLH8qXs/YYLWEfbOQxUAx3fU93iK5kZvAV0ByCHNQ54ZCRZzy1lGXGVl6
 eZmDpN/dJqIlHz9Q4QVmk4mK+M1MByrS69SH74JbsuRqS7zsAAiooNHqTju6dxCEGFH8gCUQDbg
 6tuTp601A77lgZd5EyA==
X-Proofpoint-ORIG-GUID: gw4dgVnGHvR2S1iLTy5tYk_lAChlOWwA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250042

On 11/25/26 12:01 AM, Robert Ijtsma via B4 Relay wrote:
> From: Robert Ijtsma <robertijtsma@gmail.com>
> 
> Add the SC8180X (IPA v4.1) endpoint, resource group, shared memory,
> IMEM (0x146bd000, 8 KiB), and backward-compatibility configuration table
> (ipa_data_v4_1) and bind it to the qcom,sc8180x-ipa compatible.
> 
> Register offsets and endpoint/resource limits are derived from the
> downstream Qualcomm msm-4.14 poipu/sm8150 IPA v4.1 driver and SC8180X
> devicetree tables, adapted to the upstream ipa_mem_data layout.
> 
> Tested on Microsoft Surface Pro X SQ2 (SC8180X, Snapdragon X24 LTE
> modem) with rmnet_ipa0 MAPv4 and ModemManager qcom-soc QMAP bearers.
> 
> Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
> ---

[...]

> +/* Memory configuration data for an SoC having IPA v4.1 */
> +static const struct ipa_mem_data ipa_mem_data = {
> +	.local_count	= ARRAY_SIZE(ipa_mem_local_data),
> +	.local		= ipa_mem_local_data,
> +	.imem_addr	= 0x146bd000,
> +	.imem_size	= 0x00002000,

Please defer the imem configuration to the device tree, see

6f82cb4ecdb4 ("net: ipa: Grab IMEM slice base/size from DTS")

Konrad
