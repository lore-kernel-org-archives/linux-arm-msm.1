Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CC240A92C
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 12:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785499518; cv=none; b=ozEEm7tlljmK9AC+T8egVTOx8v2M8NNBzeO/qQrLaeASHWMyeufPW7RpD5W2Ct00ui051Jfui1e7ebXDP9OmJjx56S0pFR4IvqlLtcIGsM9OixDcA4fyifyr6YbBSO3hKCRb+yAu38CTz3tct3zq/1iRX7+ofjvG54bstW1RhwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785499518; c=relaxed/simple;
	bh=wleJuZLO9H/CaQxehYvbCC/E9Z04ytG6+HtAeIk8fQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aYLkim+dYPFdxop4C5c0m2DD4Ba8v7idQWNunEhhHozgFOkdE9KfMwnxipF/iGNRSwUtFoR5PO0IDzNxusZk6tWFR2vuz28Xzy24c/w8EGmaIaLPcyXqlOHictQN2X2/4DXpsp2QAU+9T+v1YeR69qSi+LG1U832Ub5wGLJQz/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IA2kchoj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q8DYToyh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IA2kchoj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q8DYToyh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBMFjo3855640
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 12:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hr3aCpdxUyrgaTTWCAJwD9kyF+EOVeotexYst6/AuM0=; b=IA2kchojIdO9GNOW
	O7m0Xqcz8KnMDUS4iiCy5S0z2fLet2aYMUFbkfzQ9U9awNHGU1O1r0twoALPj30d
	HNB1ld/vCi4PuTuXwZ1DkJoEK3HYmmjCUTiFq7uwwNxJxBvPgTqIb2++zHrAvQN5
	fT8oyBoj8Di/csTtjzXmtMZ06c3KJy6qtuPJ5Ge4zPiGl2uho4nwNwpE7PeJ3UKY
	GuuoUscW30NKz2AVz9mJX4CVIdif5pZf1OMfwyIfIR4z9ao4/I96YF7zfK+w9saO
	crbqOVmfIRZFLU1gLYXYT8fcjCqGFlWftYW8phho+lcMlhEko4GT/U72ZSKJVKtk
	DAyb5Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frtms86cr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 12:05:15 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-977c01fee74so8719241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 05:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785499515; x=1786104315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hr3aCpdxUyrgaTTWCAJwD9kyF+EOVeotexYst6/AuM0=;
        b=Q8DYToyhDulUGlCfaE/pso0/nma6J12mra9IFet30L2HkH7osrzLlctnOEGgEKXyDz
         xjG/0apbpCUSmsvi31eG1GGyjfQVeGiXZlMwGlawQnrYcNK/FS0NpKxl3dAQw5ouK08A
         lBvCSBTk7qkXPa6qwfAgFLYIRTz1nqCDuhHgYTWD2N/j2HmiPzvR25cYd+7SVnstKJuc
         uTD+kXwj25SfXT/l3Fu8OHgwliAbNiB053KA7ri3hutrR19Wboxyn3pejTuglnW/ysJK
         GZWmS/FVmQmJ6E/aq1e3mb9YSRfTh6c4m3Y5Ow4s5H9yrPl43sexDYnejONBBez/+2EM
         3Q6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785499515; x=1786104315;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hr3aCpdxUyrgaTTWCAJwD9kyF+EOVeotexYst6/AuM0=;
        b=pd5+nvg1cmQstqc0ea08y4LfvSV2BLNc6tMqrUp/v0ODyEmgbb9SmJMOmw7jPR2Z14
         r/F9jg9icI1pP0jO1qa8MpWN+Y/V2wOsXCnSO6rtb+VHXl0wYJpgTm3uyYnWjcIiUI7M
         kBWUV7CUyMc8ADqlfNIA9d6eLmJNaO/0X70p+OtYBpFOKXTR/XGWw9++H5AJ6Sgrg8Zv
         5kxP9XYjRhbw+59hSK+hsHmpf8PYCRoIzOVueUJkhh9TEEzXoTXPgukz9RKjQV69IaZv
         g+K4E0CZ285GagMnKRYu7cllkToaSq/fkjccLjExjPC82Dl3HFlz9ZfVXyN7A3EAzGS6
         AA9w==
X-Forwarded-Encrypted: i=1; AHgh+RrrDDhb4NUgZEm+wIVErFJUSrzLoR0nsgScMAlml69cUAFwxMP63xnHNNB+pgWcw+qz+rs/aHGF3rvWwgTY@vger.kernel.org
X-Gm-Message-State: AOJu0YzcpNJJPrhPlejhgYDuQT1DPTun5dRLzAPoq1+bGPyg23seYWq3
	+Hd/w5YcN7S9/Nb8VweQShCsgfX/UUCxxtPJYmuBVhyLmJi8y2PQthP3RB6bSBG/rXunFB/buLD
	oSl/gtcHe/wIs5VK0pC21E66a2gEgZwDSG/H1PG2HGEnJK0mtKdbsRjxkikPPJpfX+Twe
X-Gm-Gg: AR+sD12DUxm/IOHtUf3lXDVf/ftFjtZ/FCIQPjUfa3nTS335d6q14lZPJ235h4fU2JD
	HqvyGIIvK7agjx72Ws9oggM3vOFptMp205kFCSWAqztDx7I9t6Vx1P1Z9SqBYvnnnEW7Cf1VM9V
	h79TrQmBs52LHoaQ9+pxyCvXRLMNPRD2ZUyOKdCASCEwNrMY7D8PyZ4ofvMbl7D6yPAhXXx16ZR
	yelJRwfYCVUT5U7zojAmY+Qb9uYcaBLMnqRFmKUo1ngwws/SPJWEo1R+/5yOtuzzw7FGCQaKVHo
	vBVOzOkhQFzDTiiUSI3+EJ+3kT7kfTto7Sw/9FVPxGT2FlxhRek8GhmdsTsJQqhTcs5ut5Q8jgn
	BKBRHc2Tu9rRdtvItRM8rLUhr
X-Received: by 2002:a05:6102:570c:b0:740:2974:57bd with SMTP id ada2fe7eead31-758f6b67072mr265956137.0.1785499515459;
        Fri, 31 Jul 2026 05:05:15 -0700 (PDT)
X-Received: by 2002:a05:6102:570c:b0:740:2974:57bd with SMTP id ada2fe7eead31-758f6b67072mr265926137.0.1785499515061;
        Fri, 31 Jul 2026 05:05:15 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c6615a1sm1224069a12.27.2026.07.31.05.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 05:05:14 -0700 (PDT)
Message-ID: <69341ab6-8b45-4c47-a7b3-7053fe873a88@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 14:05:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
To: William Bright <william.bright@imd-tec.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260723-imdt-qcs8550-sbc-rfc-v5-0-2fb988854623@imd-tec.com>
 <20260723-imdt-qcs8550-sbc-rfc-v5-4-2fb988854623@imd-tec.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-imdt-qcs8550-sbc-rfc-v5-4-2fb988854623@imd-tec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6Jp8864LHbc3QWvJQ57UJpRghyUOdSwF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA5MSBTYWx0ZWRfX+c3JKVK3cveV
 qPLD8U6LXjegeiR0XDB4aPUxtW6YGnFtlUMLvk1zZRO+n/xiZc5PIClnFfBkiBAx5uuJh5eGI/O
 719ohjsL6QunerLfKM7SC4PipBg2NKdUIuMfeLNngZEI/99fJuC6jutXBzWR5fvUYQ5jwFTbhXD
 q0iRaoM+EoUr8LguDJwh+mewfvg4CLwbBc1695IARFT/G9qbyVSzMzqOl236Q+8VaHWpnn3sV7c
 9zf0ye/hEsJEixQVCYC/sdw+QVlIABS34n6XtBRua6jftbv/SI4PuAnspto8zde8ykiWNDqUbdL
 B8uHKGcgiIQlLKZo8FVVQiTaw5w4zr7Fe5N9tOKN+jvcoo4UXDjIdV1A3+lYg20WtuF3fPhdmKR
 oEGZrTJeQjogf/xQhX9dXIxlBph5jpp4wdxuT1SuSmxmUtWLKITttGHv6lIVSAoOgPaqgZOwknc
 j+Rtv+G9yPHp2iQ1DRQ==
X-Authority-Analysis: v=2.4 cv=SuigLvO0 c=1 sm=1 tr=0 ts=6a6c8f7c cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gNcS5RXMAAAA:8 a=EUspDBNiAAAA:8 a=4C2i0tmSEkLqNy9-opIA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=VeqYHxXNbGx7SVBbL1V1:22
X-Proofpoint-ORIG-GUID: 6Jp8864LHbc3QWvJQ57UJpRghyUOdSwF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA5MSBTYWx0ZWRfX49cVkTbaEYsJ
 oMiFlWfxo2V8gsDsE8kgLrLjvd4ww36T3yuakb2wPiE/G8SJbBaLVy68OHx106KpZRgkBmeAKks
 igECDm3682icQUl4lGZKGawL4NRVXHE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310091

On 7/23/26 8:18 PM, William Bright wrote:
> The IMDT QCS8550 SBC is a two-board design from IMD Technologies Ltd
> built around the Qualcomm QCS8550 SoC. An IMDT QCS8550 SoM is soldered
> onto the IMDT QCS8550 carrier board that supplies VPH_PWR and exposes
> the off-module peripherals.
> 
> With this DTS, the board can boot to shell with a UFS rootfs with
> debugging through uart7. USB is also are fully functional.
> 
> Features enabled are:
> - On-board regulators
> - uSD
> - UART
> - UFS
> - PCIe0 (M.2 Key-E)
> - USB
> - ADSP, CDSP
> 
> Assisted-by: Claude:claude-opus-4.7
> Signed-off-by: William Bright <william.bright@imd-tec.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
