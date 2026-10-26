Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027519;
	b=Cb4qdGtel843jqraACX96cdbaDiXaEGH452L98lYMy+KYKfstxkyTNjNuA/KOwFpibYR
	 8tK4zMn6NDLjd+bw8RIr/1cl98RBFw6kWTyDNZ+xZVD9eOq4yUaKZKvDS4qPktYX9vAhm
	 J12q+CnLQC1OOFu48ZucXvjLuipVWcYfqeDgcSGhQvwadunYeHRyQKEwWnhn5G+2mKHtb
	 TWZgRNhT4hqhprgkvxYhIyWx3U9SMtVk1EJgigjtU64O+y9xQZ91Jlh49SV6t1iLTwxCZ
	 JAbGl8g0l1RjtGyW4WY81hR1aOToL0CTdaLxH5Kt1nwm551IawCK2DZqMP7n/6Zziaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027519;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zI748uxWKPPDTZ/WsRErMlRZ+qLc7z2c01W+e2hpsZg=;
	b=jGUnqjT9TSCsnDetX3A3rA3D+05w5AVGBQwDNXNR95pzLP2cKrGsypgUGBSTRnRRqnjr
	 URkylHakWnXZeI365Iitx3Vjm8zoiaqXSKvownEvYyAzNHdtK8XCpondF7FSBuScsMyk7
	 NbuqiKB9dfmPfYiAD7HYkjqpu86m+hcLCo98l/ksEBZ05S5TjxbIkZDHn1tnY3VOHN66S
	 lhlcymirQ1a0eIECuLgyNsJQt7m7h0sliMp/ps7/NiQcxQaLdFYWO9wYas33gY/OazVve
	 dpOp8im2fhzH2NbnpQfB3mmLDuN56v7xMwEk6UimtMS5JDlWjFtGtXWYFpxnT5JPJig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DyWaPPud;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SadAXZ5S;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3DA606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:11:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C3DA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DyWaPPud;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SadAXZ5S
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvcIn465835
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zI748uxWKPPDTZ/WsRErMlRZ+qLc7z2c01W+e2hpsZg=; b=DyWaPPudMv5hXrWD
	yfOs0uowTvmp5SjVQGyCK1Xy7Cg0TbbU/L2fUVWIk6+PCjGCaCcbukFB8GkQONVJ
	Qa7Kqxbl0scWGiN5FKPbYLFr7HmQIMQxOIX4Xmd03gnCDF3YgVBJcRTX6kerdp6C
	kpMXU6j+wuXBIbiDOrB93tJqnj6ImBFNeLKRlRLq6wEJRIcANruTZRpySHyVkncA
	RNqmHEIm+6LPBQZPk7FBUSAD/H/qn6aDghRUg7D6/UG88DOoFycLG7WRaTfAPaE5
	aoWw8TlTd9PJWBSKvCaVRmN8GSQt4KHLePGSkJtQGtq9InN5mDwDpuQYCiKge8cX
	3oyqUg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshpu0u2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:11:57 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c97957d83bso164532e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 08:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793027516; x=1793632316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zI748uxWKPPDTZ/WsRErMlRZ+qLc7z2c01W+e2hpsZg=;
        b=SadAXZ5SgIr5jwuMkiOeSkSHJmcb0rDb1bc+ovNCeIuziVQfQLPTM23kbDBHOSytXQ
         dWjFrDVr4rl2EPKtR5zV7QMOLW8e5+Og31YChxP2ODF9hX3oQ5up5/S90F7FsPSdTdFt
         /EssU+6lM4c+Ivg20C/AKBpl72z2E482kbEjzFFfPKgXDXIiaVCf40oiPx5TVfafTvIv
         rJojLq+98ksuEWMwCsBYG81SZ4hvQ37TBcSj763DjnKm+bAhbso4wj6i5db9G7AVjOQL
         esSKRwRNTjmAN4oaZL+umcIsLW1JpylvY2noSnIpF4u3OSTLk8EfszGd2axS96x3zOGg
         TqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027516; x=1793632316;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zI748uxWKPPDTZ/WsRErMlRZ+qLc7z2c01W+e2hpsZg=;
        b=QRhRwhn/Ge3Hk7WL7Zf6b0u2CfyiICROcHKYjBhy4e5CAgD5PyE8i78eVYzKkD95+N
         SmBW8K69bPcdl7pro+uzzfwDUYKCVw2yg0YJU9CwPrVaAob6OA4dcbaqDPJw+cT1Blfe
         tb5t7wjkdi83uB22SdzT6MkGRmwKDDag/EsI0cu+IhkVSWY3CbEJurmdR9vgGlOsoKp+
         GjOAYFhxTw4NZ8c4ess2coUVgWkhV10Smlav0aAfUdUwF3IXjSJhlBOCKPpmRY6fjxpe
         YTEniMmtgXJ48T5o2lNUwlO0DK7Z7XbRB1ghxzbl6OHKDL8bqxFRssAx2W0SRz7Pdc3Z
         Sj+g==
X-Gm-Message-State: AFq9FYL0+hjsXF5nKLouV53mOzprGdyuEpgy6zNCI3+b3sEZDEwZ4w2O
	DuXJBKyQJ/8lzJOLdwlgazvA61awbM7b3g9L5DIHCqc1mzer6USCOWBqIAeTc+AEfEdQ8N+XnG+
	o2PBfoJ8ex59WCnUMnvZBRLJJsfNae/B/8mb4gACq/lqNHX3x5c9aanhs+YzQ1ujVOFrj
X-Gm-Gg: AYBFou1OIQp52nJned9quRNpwB30mp2p93LrQaJFmdNOdVDztcQsadAZ+FZfggKqSIc
	4FFLe31mDBpjyVIxb6r28jlTPnOVYbhl01qDVgPwjBMGsagDMTwRw8/KWITK6lCsHx4oZRa2ln5
	sjr09i8nd/6CjiknSr/KLnfOAtC9M2kdPvFl5fyuYWgikqCMG8AVzSIqBC0Xgv661pCAK0g734W
	BYbXbNMPVU913qQj2bbmZDBD+2tDXSeP6xpJW1z1WjhZNwbyd3b+qJUrPyGKXprpNErWQXDY+Qa
	03QvndvzjN+hJFJvHx7fU4XJjC6CatQ3ZY1/ASdbjlnFMUt0ZmrEcXHY8v/24tb42sefsQwVSHT
	mT21bNgsg2R0DuAZ5Mye9Fw==
X-Received: by 2002:a05:6122:8617:b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec2506ae8dmr2821919e0c.4.1793027516472;
        Mon, 26 Oct 2026 08:11:56 -0700 (PDT)
X-Received: by 2002:a05:6122:8617:b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec2506ae8dmr2821858e0c.4.1793027515922;
        Mon, 26 Oct 2026 08:11:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66c6dbsm327506866b.59.2026.10.26.08.11.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:11:54 -0700 (PDT)
Message-ID: <3650f273-d361-497b-8db8-7d5ca96283aa@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:11:51 +0100
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
Subject: Re: [PATCH v12 5/6] arm64: dts: qcom: monaco: Add OPP-table for ICE
 UFS and ICE SDHC nodes
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
 <20260824-enable-ice-clock-scaling-v12-5-09271f583dc6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-enable-ice-clock-scaling-v12-5-09271f583dc6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MCBTYWx0ZWRfX29kUq6pAGL8N
 7D34cgAjyFhW462YO6QQRvRsJN2gvjj6UgytMiimi9okE7XHghiTrVPXe3u+xm+T56Yr+SSgt8Z
 Kv826hS/xp7m0EhKja7rvzVU+Dv6r/A=
X-Proofpoint-GUID: OIncmIaejHsC0uCY3hpsZ-oF8VRNfWeB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MCBTYWx0ZWRfXzwfjTv/8GanT
 YYKTv0T/AYWJpnCQhYCgJgLwgKxGlMkCGRdHPrRg9TP46hsVct7P6xfKARYWi2DZztFjMkFgSeP
 Q0OAGXuWRzw5N6nIN37Snk1SC89fs/eqU00KZ1v/qesmvniQsBEMhqKU049Ab89mwX5kXTL2Kpy
 RfHDAq4MOFs5k0jU6U4eQo/XZhMZVEYQ/nGi0e2Ii4T3FISv7ZkVyK+pqed+WLqhHuKAxE0oCtc
 3bcTvsl59oim2d773yyTbqLrXKHBqN0OFGYDHv/WNZAwYDsZkGpsU4qNoGMerplitu9EmIXafb+
 qdcLZtv+wvRbNO+MoiI9HYUwZHRTELBzFetsv1tNsse81a5sOduwwg9xhchS9j0rvRrDuLunJQE
 EcKmdrwQjHLjGOqNXRaGEiAU0pa46vgyhhPJwFj+e0v4iWnqT+9OYCs+qSzJZis9OvZmr7DLMTE
 Jeq6le7UQduKvCz22EA==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf6dbd cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-W0wxAWcNmATYll7EfoA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: OIncmIaejHsC0uCY3hpsZ-oF8VRNfWeB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260060

On 8/23/26 9:47 PM, Abhinaba Rakshit wrote:
> Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
> an optional OPP-table.
> 
> Add OPP-table for ICE UFS and ICE SDHC device nodes for Monaco
> platform.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
