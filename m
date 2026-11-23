Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461673;
	b=UNs2wiBhC2pAtYB6JtU0ZF2FFX2dYb7IFkKF9zYJbsx80t1B7Ag2XNUABOCOw9wtY47w
	 kW+h68CXeavbx3pF6QoY4Z2qAX22pV7rt2tvlvW3LjpsEphdfKpuAdpV8lDunE9F4rdku
	 KTMJ9nHUxfslKFBtiHnL8EFOHs3DXGc64wVL9C1CS6H3MdWv/NiHXXn7iNwOamTmp9vl/
	 ggYJ0QWFsgLtThZP3hml55jnFUNyhxuh++WC8mmcPiNcXw1Yj1l4AVfhce5o7e0lHpej/
	 izBtdXGG7IbjDeu6GVqnrBKVuiSjGUdcuEB7hzFH4K5g0M9hITTOkJysnQ3ul6aDZ/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461673;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+w2oHKX7khEVelfhN/5lzN7uXffLARt2uBhawgZmWH0=;
	b=il1rE+ZhzI1+m0yr7m/EEPMCzool5haBeJ7Pw8cwT8b0dSuOP0YU6bhE9+tvw9hlKC1M
	 C42NBw79xY0oOMx82g0AxOMrH+Ljl69QkmgbdaC0qVd2bba1Na5/sfIuswFDLn9YiuJVf
	 HpJ/5zyg+mCy+NUedUKaLlPRIZJicdpysuuwQaSyD25c7OgyV2z9PBhC7aAXKHUX7kwPO
	 FE9C3lJx9BM5p287Bk+hTlf/Gibi/auTZBBRC/YgJeznsNODDeq+z3+rwyzZRGn0kLpTn
	 qjJQ7uaA61BM7qS/fguXvVQ+xpW+cxbLxe+yrLZw9rKL8Jx9BMHN1qGxifxL+jkRGRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EnS5fuCk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i2dSCc7+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9DD606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F9DD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EnS5fuCk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i2dSCc7+
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGtCT1861560
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+w2oHKX7khEVelfhN/5lzN7uXffLARt2uBhawgZmWH0=; b=EnS5fuCkPPHmMcAc
	1PQi00QEQIZpN+D3wUtebaKQnK/T3CJq3qdEk1uV7pP+o/CfPfWejo6IeiYSpKX9
	alTkAFcN0dAAdt0kt7YV3SIpLqS3yLkpn54znWXCoGYfEVUzjQ7bqLROEmH1hPT9
	pJLNnipFow7Vbdb0ZnI0shFMjy77umrgkJ3erl2q0afDhMYC1fr+267SynfT9UAH
	Gt65X13eH30K4lvQg+JzHEOBz8maiX75LPwgrmMRGjGfPyd08cPADNXTwxLMj3tE
	7SttL++XAMG/A63h2hrNUBBWS1N4yBsSFyM9Azum+IRsFuOFmUB6P9oC3gvuNNdW
	Rp5DKw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a31rp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:21:12 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c97957d83bso145503e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795461672; x=1796066472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+w2oHKX7khEVelfhN/5lzN7uXffLARt2uBhawgZmWH0=;
        b=i2dSCc7+QkQRAbt6B9A8r9VBnFnWRSAucddFk1ysL+Gawlrmps+dsWUD1tGbv6ELF0
         NEu1GiTwA4zf4L5v3FFGZGaWbQHsl6Y+wPxXMXFuPEvAcSqPk3wsZXI5aMcneXsNf0B2
         oaTmtzDMqYGaTS3CI+WReJQkczeuP5BggWckCT5gltx47iqap7MboLTnY+ogQRABiLtr
         0faL54a/tHSWUYRrbd+CSuxYLtLUXJ32qAce42wkkNuWndgpG1mAmpFrt/5Agn87VH1q
         Ff8mS6dOuwPOCe/sZPeOkKbKDc8eGaMYQlxcPFmko59YmjmqihozKO4uf1otqu7e3zPx
         lo0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461672; x=1796066472;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+w2oHKX7khEVelfhN/5lzN7uXffLARt2uBhawgZmWH0=;
        b=p93NRJsDcthNDmTErhFV5V4+bjzv6+gf+KHSFymwWrOI61aDTIdsZFSRP6k9meQUBl
         ZtbATWfZRh8odybfy7oJQBNLtdT4lxmghPLw5OnkEpFm+NA4CMGa8ECUvLvYqbcncLjg
         PLZM6omim5poN7KH/T278iQoPx5SVqryCidZ67NQBIrDu5tpjkIFqC5ty6H596RSKf25
         s0G19ztec7pCa8MMld/A0ZxzoesdzGYGQtwAS5en0olTGJNKB/H2uSz1XQB8UzljB9lJ
         y9lRU/asz47Ubcnc4GZYaBEC0Iz2+t9g9vKxhb2hPdVVdOg1HNgbW8uzFC5gUYgpA9d6
         EN9w==
X-Forwarded-Encrypted: i=1; AL+hErGV5HilREJ46N48lK5r5GkQjsbxbY9aKPn7mCY+g+TgofJx7JytBj6pmuRKHct5vvie6LPw3NCXlQtSoIf3@vger.kernel.org
X-Gm-Message-State: APuU4Z/K7EqkAveYX3Zex7/XbrM9QhyCNsjwc7dTc66uHQ22pUrjDGBH
	ZKW46grmfhvIjvIAo4Me12NzNy0u/tBLIgPNFcBF0gNhfcqdMT7/3UbUuKS7sM/NGFKTaj2lelW
	C0bOl8iB8iHj2nkrfWYRjwyNgH4rzhvje8p9RKYg9mJOBTUCk8OPp/prbFfDDd6mhY37C
X-Gm-Gg: AZFdTZdyL4awOVsP6BTRHG4WyX1feBQMu8NlvREoLkuWwnukOvU01y1qwkShnI/pk5+
	ePF42d/xt2p/m9hwbLt5hxlNB1V8r/jzTf1I7/w8r1gEWe/BfSlhiZ4MFWAVRHzNQ73oINVXhjg
	I+t+313u5Ik8wBnWKWJl8a5+b44QRGnyNGgNK++cts3pVQeBAttnb4UVlVGYJOnaFaMAvJisaLz
	xtZz8HAwvv9gcYCFrOgEjz61ZhAjr3/nBBXGAL0cscAT2i0lJL934wB0bwLvJajlXU/eF+RfvOl
	YY3fDxjIFryY0+m9DBtm/8W9DQzIZOAd0gnPzmh+99fx4LwiuGIa9yqi9V5fuDbqZQ9rA6Vm2NL
	yWwaNpprdHQ3i4gNgAmBp8wM8MGFFfnzmjxKkDRK4XVnLt4u25oN41CK47WqPNYhZJvXMvEw=
X-Received: by 2002:a05:6122:553:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ee8ae12633mr9546152e0c.2.1795461671626;
        Mon, 23 Nov 2026 11:21:11 -0800 (PST)
X-Received: by 2002:a05:6122:553:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ee8ae12633mr9546105e0c.2.1795461671135;
        Mon, 23 Nov 2026 11:21:11 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbc67sm5754903a12.11.2026.11.23.11.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 11:21:10 -0800 (PST)
Message-ID: <e62c6b40-5c2c-4a31-9d44-dd4770486de7@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 20:21:07 +0100
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
Subject: Re: [PATCH] phy: qualcomm: Allow compile testing a few SATA and
 UNIPHY 28LP drivers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
References: <20261123190541.262138-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123190541.262138-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX7dqE2Hyzh7gk
 B8baCTh7+VINNoOztY41FZfY1zJ+xTuFgtxKq4lD2GH5XcJW6VG0d6iMkiIfg28w2sFLxEYeUBM
 /3yFjJ3F8GnxfA3hmEFQJ4gUQ1pfjR8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX6Ur7MYYNWPF8
 6Rvc7Lu8xdPZgV6Y4hH/rhQcVhKbQEnisRmSaFH63UTLyNVFv1C2jpXkMAyluqmiMNS6Ugw5QIA
 dMm+UcB0Elw+MeT8pWRiNJJljvbBZMPfeR79WYIIIJPoJ4qlLgBmJbfmjQWetern+lrWxl5AxJY
 F7JKnHLppVOwVMGieGEXilpBB6qQiyEXC7kgaR3r/08usi1mW42w083oAoQSFW1qPphzsflafUG
 +FzaWu2F5iR8Gl9xvDIlmR59sL2uhV6EfeFQUuLaZacIQ9BiGRu0t9T7wUexuGtDf4ylPV60JDf
 vAYIgkx/rT/5p4GVQm3IJhHZGPLzPfDnaYgpLymi/J+dSspraj8Ic5tO8f//t8OAd36BZKHHKMo
 QkvLE8gKdFvHvLYobMrXBkvFBCxIRAk3Lw/fgitwHBGaouosVLxJ+06O19FI0xWAnWXpmZmCilN
 JCcFqzCLMNiRGcAe8gw==
X-Proofpoint-ORIG-GUID: WfQc45XorBDrj0eIvc11nsizJB3D1LZC
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b049228 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bASQEeq-Kk1eUeroIz8A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: WfQc45XorBDrj0eIvc11nsizJB3D1LZC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230077

On 11/23/26 8:05 PM, Krzysztof Kozlowski wrote:
> There is nothing architecture specific relevant to building of
> PHY_QCOM_APQ8064_SATA, PHY_QCOM_IPQ806X_SATA and
> PHY_QCOM_UNIPHY_PCIE_28LP, so allow compile testing for increased build
> coverage.
> 
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
