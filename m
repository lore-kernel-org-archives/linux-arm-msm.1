Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447268;
	b=w0z82+0h1radzdKFyDQk8zTku3gn1Xdc4q+EKg60kfs23b+pJuo82mw2Uu/e1qoI1Bz+
	 5PQ6aVr9x3dV5HX+phBKtz/Fb6O8kcB3hY8PKppcMmfJ42tGOU6PZ1erq+dgt+wVqXjqJ
	 AKiMrE4tIqJD+7++xzrx2a+Ur2A5wLExou4pcgbXHRdRGP1smGRdDfwfdqLwr/6Ymgwo2
	 WKIFy32eEqPRHPjZpMZs3Knu1wJSckU5BPRudznFIDMGLJC13TswfGnKTYUsPpR6vbFy3
	 N3cbU2VRDFQ0RQ3eBn/8rOIDdhcDNOEiMsl+z90N+pE3HqEkJ9JH4ynZyBv0QHN+lwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447268;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IdyWnBJTIgrZY1jF9JegcJlwviocUMY4EwnV3tMGDMk=;
	b=P4QxUcEISKeW1avtn9SyG0pMVS0yv8GhwLA1WcuSfF/w/vYUTixNv4B0G2pEQYgOKYwi
	 WHerqjwbtxejua8i+iGnSJMdCGKgq4wLf0T8fA98X2AdMmEoegq28hxfVWgNqIUL1GfcH
	 fFuM+kngE7ezI3gbJ6/1VtOrl3hgzHCvUWI7vIuEWg+9iwSQLVfoy2+Mk/b9y14tD85sB
	 pb3iPENk188pzPjs3E9Nb0UZn9E2BAgDyPnWoD1sEvzJXj4LnW+iBWxlxEXzKcBGcRwfm
	 Zx3uTXSvvH7vZxqoqTqdzjgjqfL5ZoV/tMTRurdZusnPZIsr5wHTRYJjSsGt6pfuQyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z7rhCiUm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d6ZxGWPi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6857606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6857606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z7rhCiUm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d6ZxGWPi
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLJA71461427
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IdyWnBJTIgrZY1jF9JegcJlwviocUMY4EwnV3tMGDMk=; b=Z7rhCiUm1Yg2sudi
	2PFkyr/8G2GSQ4Rw42s2N0EEBhXHuCXgraAr7/chrPArc6k1xjUap6408kqVKf8N
	bZmucUTooXeXiCaPET0e12DVrfdO+xM8CgT/1uA8Bin/+lX78MeuOTgU+tX3BKnp
	woRsr0MVaNFnKlf7+OcaJBEib5dlY3RC/Rv1UAt+imNWfpbObrT5lmFCrSQnUdRW
	kmb4qRTCQfdSm36xiRHDrKC0672pJn4zNknHviC4l2oryid8EkVfEG7o4ClqcCRz
	lC9GUrpy26uwxg1m01uZ8hO04kt4DVwCWiWqGiOXcH0etGd7/o8pRRX2YObIi1x9
	nudJaQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a1yp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:21:07 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-53a04574e10so180916b6e.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447266; x=1796052066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IdyWnBJTIgrZY1jF9JegcJlwviocUMY4EwnV3tMGDMk=;
        b=d6ZxGWPiqbNxaw5lhbK8DQAGemnqRRPIeiJ5GTZcv+h8E1sgfkr63clTz64Zvng/nv
         BcU2LCU3DHOgPxBzvwFhS9mNzBYK48KoLOPFDlK15SQjuh9Y3bRsL2tR1w5kHsCzSd0G
         DsPF5MTaMNcEXn1DHS21SlpgGI97M5E3BmkX1UYBuOOYWZSrLOyj3a11Djc5kAhWwVSm
         6CjyTgvp+JkZDHOj8GeS1fSy9YSoHauHUZkuv05R7lOK8NoNDSLmQJFdnb1Js0cE12gy
         d4HDPQVgM6jIP6sPFlGSX2YNpKTpwonSI5a4Qo+yhY8LL+zTh9emHltPxqhf2fuuJxvi
         esrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447266; x=1796052066;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IdyWnBJTIgrZY1jF9JegcJlwviocUMY4EwnV3tMGDMk=;
        b=tEVW+x8IDmfeMbrADTiLK/JwjQWDC/4pvujRKmk98ZnfK38g52RO9n86WWwduUmffr
         laaYztdwPPcH2ooS6Gba3pEpvdgG/+5KTi2oa8bqJBKbPOZQl+SW6GTV8fJtH0l4MiZz
         /orA7LRa4WranTdbqsY1gHG0B6uH45J8HqwpEgbQF24L0Ls/zOBNpprag4UbI2nbq4if
         r5ZIALjyDFdBZQMRMLmO7JKm5DsRIPSHGGtP1n0b+GTDdtpNAi0tvfPIeBlcYJq2Q1nm
         eKUo92PvvsM8M0afAZNNHK8xuDaUczQG/kKZZVOo/Ze8aJ3YDEsk1lt7nPtDEdehjwo9
         5H0Q==
X-Forwarded-Encrypted: i=1; AL+hErGhlVKMuGKIQp2/3iDxQZ87FVhe5h7ADwyBXTsWuuXpZYWfgwzTC42g9VQvMFwebqe0apkpHNclsbhHE38S@vger.kernel.org
X-Gm-Message-State: APuU4Z/9uxfQDlK6FvZI7F3xQLDfE1okVpskP9FXfUUhWEGxJFCS7qiR
	scfmPda/jNL/KO26jZJWIuCcP3Tf6lH0nL9pMECR6j3LJiOSsI51h56HpoqKIY4GLRuj0LVaSfk
	/q4ToIIgju/m9KMorWCPqj3sDk0YtrvwXql8/sWz0ZvbGvmuhtfK91/CmJgEg/as6znsA
X-Gm-Gg: AZFdTZcDsycSSHjQgegXNGLnvlqVH6TpFLdo7drjj8uZFg5564dHBaYKzHONpjq4qjg
	ISycK9aFi599xGlfTM3e5U0XYYl8Xc5WifYrNtV/JkLEGfBm/ofPYn1dKFy2Lya7Lo2BH4QLerb
	v5uC7i5ofUY8V/oaIoVdZwEvdlWjBB9MJEBlFwe3nkRd4GbGJEA+BCHU9kDYirSmb0+ljHeGw16
	+Jm1Pbq1jS8ZSfJBZhhfat2vvQQKqd2zlSDLVFIzDs+96XfgccjJvsOqzTqpa/mVeeueZzGL0AX
	Bs3hy7ueg2g+WQVk11hKgtsCgi2a09B69InnHRkU3Fh7vd9vfLEleA1CcBSf3ZDiv9GKWrz/olZ
	SvDfEqqFvJ0Mvhm5miszqIJVEyG4+ytr1/OQqPXeo1sw8ALL459ULq2UMu57vbjxg7uCazT8=
X-Received: by 2002:a05:6808:5198:b0:573:2541:180b with SMTP id 5614622812f47-57a058e8466mr17194571b6e.1.1795447266196;
        Mon, 23 Nov 2026 07:21:06 -0800 (PST)
X-Received: by 2002:a05:6808:5198:b0:573:2541:180b with SMTP id 5614622812f47-57a058e8466mr17194509b6e.1.1795447265752;
        Mon, 23 Nov 2026 07:21:05 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37109c58sm5375497a12.33.2026.11.23.07.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:21:04 -0800 (PST)
Message-ID: <646c17cd-aded-46dd-874b-dbe7ae0f4a1d@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:21:01 +0100
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
Subject: Re: [PATCH 2/2] clk: qcom: gcc-shikra: add PWM XO512 source clock
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
 <20261116-pwm_clocks_shikra-v1-2-55fc11501821@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261116-pwm_clocks_shikra-v1-2-55fc11501821@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX2VDROZon4b1e
 y6WsjLHZoqRa9ep9H+fC9aXPdwxQUlvlTOtunomm6xwiBBxGigH1FTFXcj7cgEu4YouiC9urqGl
 P9T8APaJUoexjOFPKNSIkPKb/FYNffg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX/Bf8NXzj67mI
 hWtq76+xDmpR8aXDe+++/Pye25CmHSIDMIhw2EYpXTdf6mVKmfosPsuVYA737gh05Ck8M59SHgs
 uOV44ITlzyiIvjz7hjAWD5rvM/P3ojBbmj6+ZXWpHylh4NHo/Nscue4Ojyja9Opy7VDqBG0kjL0
 NVekvCPqYHq5zaU3dT0IY8RzkMFO3bN2bMzexBu8f5Hr1WnkCZu7qfF6WeDtF/dB09Ll7+Emanm
 PQ5SlF7M5EthJCOkZIpQU5/v8U+acJUjk3f1GQB5m3wn0dlgRCnIYnol0PdwCgML5lgzCt2+sOo
 yKjZ+NKsSnK79kgnlqR83AdIsAYWFvG8a7KpwkRQRBf7PubvIhpUqjmXqzwx7yGBnuQ0b+dujlJ
 GOwASxBBSEhym4JrwSI3++UmCs/kqNSptFPPV+Jp+vA3UM8mDHAntsDrIL3D4o1cpwNrbf9pH8E
 5dwbxD19QwPgaYNHtRQ==
X-Proofpoint-ORIG-GUID: vsohzQxyJQV_8Ik1xlxjquXyeZ8hi1kz
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b0459e3 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=GtvZotVShuh0uySl3soA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: vsohzQxyJQV_8Ik1xlxjquXyeZ8hi1kz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230061

On 11/16/26 6:27 AM, Taniya Das wrote:
> Add the programmable PWM XO512 divider sourced from bi_tcxo and make
> GCC_PWM0_XO512_CLK its child. This permits PWM consumers to select their
> PWM core rate through the common clock framework.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
