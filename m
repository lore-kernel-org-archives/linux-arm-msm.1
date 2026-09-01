Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0132198A17
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 14:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788272045; cv=none; b=NvNavDGhgVwQ5g6EmQ+qrECecbBZuQ7S+VdxC4UJdAjtO/W8n6kKhI/u7yH1PoR2Xto6pO66KlxslvZYpkgjPOKOZy7eqiRMfO4x8AWU7I87+n/k8sJj5NpFxaM4FTNWhf7GHVkaWeqtX1O/xODPtPWw3VUtNFoZlakW5vcp/Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788272045; c=relaxed/simple;
	bh=AFuhehz5vx1A+pJOU8ZcImxSZYx1uoaHVDtGkUlQ81E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dxYry6V3uetU5mCy3FvyCGVHIojTm7on2whahFX+uU4i6XDZyaqKjHvTNNtKodYww6BZh0D+AfZf6+dlTZDeNxuySoQNhV1d2+JtEwLWWcr2fzqFJdSkZIcHQoNvdEMXCx++7WX8yB8CGvtvyqD2IggJdQ6BDMeTHuWQL7Zl9wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JIkhN0Dw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ov/BLwL6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JIkhN0Dw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ov/BLwL6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E9q7x2219209
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 14:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFuhehz5vx1A+pJOU8ZcImxSZYx1uoaHVDtGkUlQ81E=; b=JIkhN0DwXxaGjOpK
	JlyvsTB+Y03yhK6pbIUAVyTVsTwTf5gci/euI+xpKunGRomDhwMLaqJXcZdKgDFW
	W4eqNHwpBkEtEt97tTtwvbBLq+PGqzhSy2GvoVvHgvuLSxe8GxBJ8kYSclE08D+f
	bW4jwSDvNN8TFVmr3xkll5gtDqnJFrJaKP2V+Bb0O68jzrUz00vt+axWoKM2DW9A
	biAHZhgFlOwFHiBirERwdnXKDE4mbmg8brs5jL1kro2O/L2UFy8KbicfXzathsOs
	3Vw3fpjhplHqc1jKTGaTMYxVa8okLRZjlFPE+UZAoJiUmx35f/bMy4iNqejUa2dm
	030/rg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndxax2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 14:14:02 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c7a0e125a6so97827e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 07:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788272042; x=1788876842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFuhehz5vx1A+pJOU8ZcImxSZYx1uoaHVDtGkUlQ81E=;
        b=Ov/BLwL6hc7GiDQ+PiwTilz/Vpqt/dV6z9/ozGIxJ+iPmNxVMrzkw3IU1U0wMB6Y+g
         hSMtr7ZNuulovQKcMGLjdhh2U87K1Y1x3xaMFSUvcgOrGKNIjNjQGTyS6zcriirqXKm+
         O1Ct7iVkb+6tks+LjwA2Vo/AhMXCulE2iWqo6UaavtloIrfBxOJvP67jy4ZjLvmktbbR
         Ae/FXDVq1AQID22Emd2uxiPUvzp6Jv7z+gUd5RQ/uDwNKl9s6dvOUEbkrd13SHt0x+u1
         JFCVbM9CgZU0Ybs1NYGFYsxAsUgXPF0Ty43BOSIfz/Tu0jvISBNKmStT5zKFNhZwmuCY
         drWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788272042; x=1788876842;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AFuhehz5vx1A+pJOU8ZcImxSZYx1uoaHVDtGkUlQ81E=;
        b=PKOqElO3cWSlILympxemMSbuThgiQgn30Ksb7YmhGbjRE9lKa/Qj7IIapvnDVnS6+8
         AFF/HWYFv6qhipVvaVs001RP7Kk26+IgO8gg5Gejh737eKf3UUgS2DdNb6zWrDeXEX4m
         TJ2pkIKPdhHQHFTL7SYZxWkGTh7AtJlTlk9cluA+IHTMGpIA9GAofyF+L99bF74RSyOz
         3sVWHQgYFCI48qAenPCtE8IPYqNnC4OeimxfKRbW+pEK6HErz+h587LSOx8NnLnjiTLl
         aFmuUWJfbTVe8U5Anfx2UFy4QvMdI9/FIfttPtEjAxfM+iEWNj8F+fK3fhxueB7E3lpT
         q5sg==
X-Forwarded-Encrypted: i=1; AHgh+RrfHftsHLy2T6LmpZnR0C+03fqqLmQEt/F6ZJLg849svTnAUA0CVhBIg9hwkyO6AsvVwqKKxdoFMarhRK+0@vger.kernel.org
X-Gm-Message-State: AFuF++nR8MjoKFQ3lZu490kWXdVfEUDjS4loDTO3nG3zd/PtbqKq5AoA
	QsSx77c6IIkRwu9Ev3RuRwpdbu4mPhpQroWEB2jlRs6vIgl4xrNoCrf+n3Gt8umRI8nJg2Ts0Xv
	CFIRPOsr59n1sAz4SbzQSqgVZPhlNxrm8Q6/BdJQr/l4fUCR8f6+Dc+5b5RJlLzg/R78O
X-Gm-Gg: AR+sD12rIOE3Uw9HJDBEl2GIdkP7ea+kolhjrYQ0yvKUKsWKsvWymWX65jVJtEZPWxY
	LoT7i0Phq34OlnFO49luuNgRJVrJqeuhy4YgZiO5n33kz+qD05hFrQUNp2PHIV4deMsmPE4fKf3
	iVtc8dFQCygfQUmNa/i3RoRYu6z5tHBZhKmaEUr7RCFrBJG6NVBSjTkC4oFz6THF1NWo0zoNoTK
	sR7elLRp5T3HED3OCW7iLZs1Xa5Qn9Okk0uU2SEPzUw+ub4LNKCmuA09T37Ys0Qtstlg4YT7nBf
	2kM3U6u/3DBYbXW4Ps6pf5kgSgMiSS4LctWinxZ4LNSBbsdfb/XOqSXqstEl0y/ZiXX9a4QioQK
	npPmMays+kmHnl9wjgKtNDg==
X-Received: by 2002:a05:6122:6b15:b0:5bf:73a5:3e05 with SMTP id 71dfb90a1353d-5c681477d5fmr4868045e0c.3.1788272042344;
        Tue, 01 Sep 2026 07:14:02 -0700 (PDT)
X-Received: by 2002:a05:6122:6b15:b0:5bf:73a5:3e05 with SMTP id 71dfb90a1353d-5c681477d5fmr4868034e0c.3.1788272041942;
        Tue, 01 Sep 2026 07:14:01 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee75a36sm601716666b.28.2026.09.01.07.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 07:14:01 -0700 (PDT)
Message-ID: <43a9b8e1-2793-4fcc-b378-6ce09198cf2f@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 16:13:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-fairphone-fp5: Add parent
 supply for regulators
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260901-fp5-regulator-supply-v1-1-189fee0c1dba@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-fp5-regulator-supply-v1-1-189fee0c1dba@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vs1Oai6JuTg-fMSdXB8PqHVrlaQX_RqD
X-Proofpoint-ORIG-GUID: vs1Oai6JuTg-fMSdXB8PqHVrlaQX_RqD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEyNSBTYWx0ZWRfX5l6BuWAk5Ngu
 4ph01eYFio6rJcfAyCUnINRyxECUjDzyrZWDvI/FUYU8Kd4YO1cCygQ/Bbke4NFnYrG3V83z+yq
 Spvea7y/lIh4Pey2Xw1T4gpR+B6nBXo=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a96ddaa cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=9ibpQ1FT5vEG8fXDfu8A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEyNSBTYWx0ZWRfX4E3xLDJvNqmp
 qv6RDplXOcz2M42vAXS2XW7AGBAMD6VFtcLRKmfTaSoI0Q6JgE12cs8FJnwR7NqL+SyAYre/dXe
 XCGMSnbAABt8w3reZ/mwXTcS4whzkzxdyKKgsX8imKadeMAqbAlCKvS7fISFBGgxJpYZ9Z4QNF5
 A45ggBXV3ZdCw1ciJXdyFGDRqRATdNMQx9JxGnmbXskhpIDMyagvUWHE/HiyVULJyBRgvz4DOoW
 yawwKNid8GY13r8xzDHo9g/EuYKvf0dpLG2q3kr4d979hZrhMqPQxxNe0ulHv+eTdbz0AzpeHZg
 6xjKX5hE8z2RmiyC5MlLFemZ4xNjlw7lF193EQvxKSZcvnPpJieXTAho+ODtX0IvGX7ilVzFf1a
 wmlkyAqs1e0jbFKxS5x0ScVecG3lcqoOSVIlb1lDihmu/BhoryPyW9XZHNjf2LXvt6JRxa5F1mv
 PjA1oQFQYLCJG75NDUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010125

On 9/1/26 11:20 AM, Luca Weiss wrote:
> Add the vdd-*-supply properties to the rpmh-regulators nodes, so that
> the parent regulators can be enabled when needed.

FYI the firmware is supposed to handle that unless the board design
has been changed without making changes to that fw..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
