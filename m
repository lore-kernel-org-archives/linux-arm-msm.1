Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772953;
	b=3zzj9xbywuCDHYcUIRRrp+d8jwO4r1B5cpdh9Dhyp3W3NAAUoREjELxVW+buJMVfMFSp
	 LAY7KHhJq40zcICc+kWrHVRamJV5tSbAXB/rbQUoZy2JteNE4/8oP0ZRyDNChzgIGzGLC
	 /7e/zMRfSV58PYJ+NRqHtdv6JFyLfrOaTVuDemOvnp4ixtBcZLhng2RHP4ty8RlzZBfR4
	 Ct4Cii6/Xzd4MzcQbfiGlG3k1oNiw4rPc5hptl6W68O8uopGK9kAgdh+dRryGAYExX7SC
	 ClwzmNogbpXY6OIVYBygvkFmt0wuJPMx1WA2Jd4Y9Y0ez8FBsV3N6/R3IM4W4e4Y1JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772953;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wVlqWYb0itOLHGsCT6XgTueNQgxMfN9z0WOmdqIPsIE=;
	b=pfENM6nlGxxTBUtVV1UpGfp4wbszMvhwt+cF9MtT18nCuJTcewJvXMXewcb2g+5XxdhE
	 snXe+9gnbud1jFbALjhwaQNzboJpPrfW2pJOViAjpyQg3InCEBaboI3rvzlmJePWatjlp
	 gPvteWJKB/uM2OUZWoSg7NKkIovvVVDFqIRP3QPed/rLNLIaGPQf6ccuMOcPmU+QvwgsK
	 /6bTrAbqyN86y50LZFkyt+o5wQOvAGZ35cdCK7is58Kjq/VBJSOjxiw22ysfJadrUKJYt
	 uaf8MXhVoCVWLdePx7J/KiwcOsYQJYlD0r5dexOhNHI6ZotXxl0MJ1WV3dEyYo0ptjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pS8KIHNO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aRgFUk+9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991EE606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 991EE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pS8KIHNO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aRgFUk+9
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7HAog1076841
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wVlqWYb0itOLHGsCT6XgTueNQgxMfN9z0WOmdqIPsIE=; b=pS8KIHNOrymvcij6
	7BxHEPv474G6idlFeiJguPzbiWdeWevglg2akgyFgSOgkSnrFU2DV5/9A/9MeyOO
	8aANDwJPHQFxW8NxZYPqT3wxI5JhlUkkln68A4UKvjFRN0LFg1e7nXROcppvpJUi
	+y2/sf1tJM1ZXK6LXlyzSJvb4l7nMF+SJWxidG462XCebgWUMdUiNigPTjJuPs+F
	DYVV/fLqT3OVH6PMuZVSq02o+IXjSsDvWpUN0LS/MdV4c6+fgtUmhrWUOmZK+rP1
	MAOFzZgdvd4KagLPFPuq6KNLHYOfNkUDJBSuD+dbEmvZlyP7OWo3StiqX5ta3YtU
	Xphqnw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55tafe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:49:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b49dd1e77cso4507292a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 01:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795772951; x=1796377751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wVlqWYb0itOLHGsCT6XgTueNQgxMfN9z0WOmdqIPsIE=;
        b=aRgFUk+9DcxBGm1e/EGhIsWAL4kKztfNfweKvFtzQRff14CcbzInEeD9eQqr5X+MD4
         YyiS+y5tduCEr48hd91sBLfIwlkSmdMU+TcNQ0XiIhpSJd8LOoYdjLFF8R2g13AlANpk
         Vfk3ruWdMCs0V1E/3ySM104sSR52NpJtRGlmHdwKqQJ42x3IF0jkH80FUpKG9v064nGc
         3XgLHpdM42IJ65J8/fXlKApGxX/YjJSBSygP8Ufz/XRySHn3JbO0V3yi8IMBmnp/Dyn9
         undEiR0Aoj/3KGEX4Br3XMPHWx7vQljEkhA6JSN8D+hygO+KjecfjhKjNYImtC8pY5jJ
         Sfag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772951; x=1796377751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVlqWYb0itOLHGsCT6XgTueNQgxMfN9z0WOmdqIPsIE=;
        b=EkxmlqboVPNKNN/XOEB/ceddpBkt9aH+T/0KuZJd0uf6qYiloXrQEzGVobWJqFRHcW
         ZAz5mJNT7NmFtQ+W8ecqdspTpMqLWosbAwhK0S/qO/dZx4U1HutTODMHcAnQp3ISZJZj
         ZgO3069r27/1Qk+w4KdAYBF8XX1jLpP41Ua5z3uhgRNFqYJ5QUpzKsUAyejuwYqEMWmh
         YRqiqBZXal2kHysPflemGcmCQn8qHCd7TIXKjVT0eJVyStVHu2+bGt8v0FC4ahLes8TB
         VCNRkQnWtVLjWDK2zmoVKgmhYseBeri0MHDpDd1LgUouUMN3DGUTCxoqXcQNkgBQYDMX
         zwcg==
X-Forwarded-Encrypted: i=1; AL+hErEce4kLJ2VKZe3GV6UWFdJ6aEHS0LR/lEvQSLYICMmZMqonCupdU5ug56+InBqqWD/8iPldGu7TAXy8XlUn@vger.kernel.org
X-Gm-Message-State: APuU4Z/35wdFrC6x6nHoQeZVoinkdb+8CPqznvPAPJT03q+Ir3T+Gd3S
	PxuqPAf571b6bNuKH4zh5OzAAV5KIikU4mBhsR+Rvovhvv4VzJnKmyxk6zt6BXVSKFyNhlIp6sm
	9s2nsmRyUkgANV8LcpV7J50rqIWz4APb1qJO4wspNc++G1C9/s0gtiO/UQ+18dV9js4GN
X-Gm-Gg: AZFdTZfwn9UMF+4fM6clbYx042R9zPBeJ/Bl2Gr9LenFy42L3SiBNyEyzjwfu9mGfbL
	zbnntm2VCzYVICvalVPodKMkJEIrufyN3cM0SBm0T5BLIkYnenLQtyrVhtfjyiRpS5xyqrB1cjm
	ocn96gEVWOeNKsl5Awr2OpaXVqKezJ5ElBNXXx8O79y4GgyKnKZ7jQWmXs79yWg/PEM8RIFH9g8
	/hCXuc1XQTroxXTfNMcJBod3N2TfcniiPLuoPCAwtdXnny+Abtd3b+qunrP6scLfkclQKJj4FtB
	oCkjMIs3v+uimKhJR3yXdbmFH1jToGnGLWlnns2NMhpveySXtSNJZO/vYiQV8PeP/Qyfl7y3azz
	3LidORWxyBKkHP+rRQZaE4NSrI0EtUge5zaphLdNQYrSxunS7jJoeHILC1b9HWZnnvO5rgQW/6c
	dCBM0U7/3El2KQjL6HlbBYrjUJeVI7doJFs4xki97lH8eBx06IprjOVe7Tl4BvKhYYIsRW05Gh2
	HWU
X-Received: by 2002:a17:90a:d885:b0:3b4:6094:2f9e with SMTP id 98e67ed59e1d1-3b4609433d7mr17785367a91.46.1795772950566;
        Fri, 27 Nov 2026 01:49:10 -0800 (PST)
X-Received: by 2002:a17:90a:d885:b0:3b4:6094:2f9e with SMTP id 98e67ed59e1d1-3b4609433d7mr17785348a91.46.1795772950074;
        Fri, 27 Nov 2026 01:49:10 -0800 (PST)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm37851351a91.13.2026.11.27.01.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:49:09 -0800 (PST)
Message-ID: <6172214f-c0aa-4c9a-ade4-83dd663028e5@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:19:05 +0530
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
Subject: Re: [PATCH 2/4] remoteproc: qcom: Fix bounds check in
 qcom_pas_da_to_va()
To: Atul Akella <atul.akella@gmail.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, sibi.sankar@oss.qualcomm.com,
        quic_srichara@quicinc.com
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261106184312.100-1-atul.akella@gmail.com>
 <20261106184312.100-3-atul.akella@gmail.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20261106184312.100-3-atul.akella@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX+Vb6E5CNtEQn
 8YWHVzAiQOO7VS0j3TcnkWAEQ4urRr9n1gf/YTp9FyGNae42gkZKc/iIM7SSmYuUkZrMwthzl/n
 XHUVZF2br08E2Gde18euvHyKMu4HNxk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfXzhtmjGtdFfAn
 MiLbk+AsJZkqbhj+re2veltQs0JIiBy4TCGeI01uIgnlV8eoCOHDDf+UC6eVmENKXtjB5/Uetqk
 k0RrV9GaIQUAnlAl3NqHeukLiWp4ma9gcwOZolNgdC+HcsWDyg+2HyG+zKyAM1Pah83n+OWK4Dd
 cgqX4KoB5fhaFnrrHb1cpt/toRBJEX62PlBaXgEtD45VAqRLcTfl4WyLPhJSNn7IR9IY2DYkIUR
 f5BByCi164lovFefqZ1GU6bkqyiK6xOZJCctPMFdzmSvxh15kiX/VQ3+DyZD2lGm8lhMn9hQnPw
 SRzZwfF8rGjr88MC+61crJWMi1m0SJaL1EnvweH+Y7y6k2a3HWe55SDIaYJ4jM8mW3j1eRDGRz5
 gieUCNsBrnSGRCDmOXpkEiAbE0vBlZoLM1YxAAHB2s7qBQYs/HujS3D8E3ZPCYtNkiNDA6Cay6v
 61RY7VQZQ+POlqn46Mg==
X-Proofpoint-ORIG-GUID: YdNNaKmyy2Jy_PhWiGH7snEEf4QS2lA6
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b095217 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=E4ycadI1TCjYcBWHacUA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: YdNNaKmyy2Jy_PhWiGH7snEEf4QS2lA6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270038



On 11/7/2026 12:13 AM, Atul Akella wrote:
> offset is calculated as da - pas->mem_reloc and stored in a
> 32 bit signed int, while da and pas->mem_reloc are both u64.
> For a sufficiently small da, the 64bit difference is truncated
> into the 32 bit int, bypassing the offset < 0 underflow check
> with a small positive value. Additionally, offset + len >
> pas->mem_size can itself overflow when offset and len are both
> large, providing a second bypass.
> 
> da and len come from firmware's ELF program headers via
> rproc_da_to_va(), and the result is used by the ELF loader
> to write firmware segments, so a malformed firmware image can
> cause writes outside the carveout.
> 
> Rewrite the bounds check entirely in u64 arithmetic. Reject
> underflow before computing offset (da < pas->mem_reloc).
> Replace the addition based overflow check with a
> subtraction based one (len > pas->mem_size - offset) so no
> intermediate sum can wrap.
> 
> Fixes: b9e718e950c3 ("remoteproc: Introduce Qualcomm ADSP PIL")
> Cc: stable@vger.kernel.org
> Signed-off-by: Atul Akella <atul.akella@gmail.com>
> ---
Reviewed-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

Thanks,
Gopikrishna
