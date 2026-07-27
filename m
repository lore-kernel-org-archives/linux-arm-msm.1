Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C9138888F
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163071; cv=none; b=AkHNtKJhkcfELCmvxoHrW+Dehf2/ibbyd5OjTmyvo3K9mGKXoZqD0G5KbYKoNTBru5Sp93KgVQVdx3BJ935MyTb62KiPss//drs0NbJsRB94gYVnkbQPT85J6Cl0kIoYkZNKT5WfpdPJTI1RJWVAZuRkGaRfU7ikkhNb0Da8KDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163071; c=relaxed/simple;
	bh=/Sd5w21hE402gi0RTf0vvE1rTfytQaqkAENCHLuji6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YyEKgAb+WrE1xtaVzMx2e56j13XFr6MuBIdQNpGRWDLneZHjsr2JxikszbwV2E4DGwcVoTwXyuRHiSiYkXu1bep+K+WZRJ9X++eJ49hLQX4GPBID4m3LDUG9ENbRgtfCQ8qVaMxCSbnyQKspqbIAKqGdUVt2t21cyuXThybnPKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cjFFqkOo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xmxi7i2p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cjFFqkOo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xmxi7i2p"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDm97X3823624
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E7eI3nzvmuur5DVPsNlaE7CCEVxLlxW+4krkIHKY478=; b=cjFFqkOomjkUB8pf
	7VtSPMl2YzD7D4tg2zqb0wxHUppeIqsvxT497XA6VNOV1UqVN3Qc3746XkzL7jsm
	zl5jsHUNuPwuyx+SBAgI2LmTw7x6p78p125EczbJ8l4YlKMtkRr7oI++2U6Gv9TQ
	yflVe3tlEGcPTWDxqqFlYIDJ9pCHgZagFr8yxspbuoUft39aL6LoxOUoDUaD07NL
	oSi91Pishz0IVY1HvcfndN5TMv392LCKSENJX74aN9KPu8dUwZEGfo1EbkyLHghS
	qIhWuGUvFPdbfZkUPhfMu6Yyuhhu/NdDV2MBMbk5iAhE43plgeJCQYD/qrTUd4qs
	GhACzg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4nbs6kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:37:47 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7530aaa7212so38201137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785163066; x=1785767866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E7eI3nzvmuur5DVPsNlaE7CCEVxLlxW+4krkIHKY478=;
        b=Xmxi7i2pkA0SMqtBpu9GVMwkocgKUgIl3wUAtlJcAko0ToW4p3lttqe1Ysma4VFZyu
         p2encNBToIo7EFMLykajHXq9llAgN8k5hX8s6zhiCF/2GHqIRsmNAhip0O1Fu6iGUEC9
         hDJoIIjox8+MuLIB3+QDfb51JTqJ7FNKWQEiojRYrs/y8RHE4YEYZlQ4kR15TVFVkn5g
         Kw7Nhs3wxaG/yB92EIqg0nJTc3pHP1qwczUZD9YW3g9yEwV2so4qPf7ejMi9daS+NcGx
         hha2qWX8td1mpLOxlXiuBYaOXNu0WT6G747PbXkYNQ9dgip3ciZ1NCJO7Ei1XpN2zC5B
         9TWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163066; x=1785767866;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E7eI3nzvmuur5DVPsNlaE7CCEVxLlxW+4krkIHKY478=;
        b=PQkG9L/vh4ssjUawsGRapVVtP6KUDtSeqEGsNV8dp04xi8ainaC0FfKAzx7ZmeGO0f
         sgzSxkO+iilw6P/FgcNBrdor5g2L/N1F2Ng5IcvefwyDneHgvEvxHoUugxg0XrAaz5Dr
         XxldhQujyRH4XWx5H1TjYWzGOVHfijfTZCVW3tnuCQwsH+a5E33aVf37jRA0N81leFcD
         KiFW516uDn6MhpYbpHAHA/U2uDrY2eZvHeDsVGi9yGgLRt3NrmIR00R7iKANz1FXT1bf
         qd01sdY7jd61+hDddEqaxSpg85iWppBK3+ZEfMZYKeW6FIFGRpaI4RICsQos+3XekEIX
         NRnQ==
X-Gm-Message-State: AOJu0YwXyoTV+AhqKquoKVFrmucL+LQ3MwAU1cBZ90uAx9k0aJz5Lw9R
	9ye8Idmy24PZQZFyxd8aY+mDIZoJ/lKkvQ+qSgy85Y6nrl6sDiXWC43pnuiYDeMZXp+S8MsZlte
	i2c0VOTttvSfduZMmR50Fptq0v58Ghsp2bqoh9HBZnLHO4rUqU9CCY8M+0d/LrHjiQiSvVXdc3Z
	c0
X-Gm-Gg: AR+sD11D1v9Xbbw/e0DhU+/xPqGHKbAaUeky7rPKb3g1NRhnTHaLCnu0Z2/ZtC6uPKP
	jvjmQ8X0lnj7b03kEhlWl40Xd7W7JExqEsTJPues39yflhELiU5Ge/oS39lCBRkLhhOjyDmJ4D4
	FiQ4B74ExNZbktYpIKbujT/rslC0nIVZNHeKRU34+b67AkurWVdx6hh2lBI1mW5+ihHJ5F5iIIA
	cwYVyF+RUFqla4u8fvJb/ugZOLZsezeU0WqffWDcMO20/bhmRZrs3zrZgV0CbCQn5GZVW7o2cJE
	sszmZWKVdBeKTttq+1s7H1w4454vhbU3J8VSe+jeN4er0suJUgYo9vfjXy/glVsE4iiB4Q2A7mq
	EhmzzsP1GFdTVip/wk7OIdVRn
X-Received: by 2002:a05:6102:c4b:b0:633:3bf6:977c with SMTP id ada2fe7eead31-7503db4b803mr3414062137.1.1785163066401;
        Mon, 27 Jul 2026 07:37:46 -0700 (PDT)
X-Received: by 2002:a05:6102:c4b:b0:633:3bf6:977c with SMTP id ada2fe7eead31-7503db4b803mr3414018137.1.1785163065947;
        Mon, 27 Jul 2026 07:37:45 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac0fa4sm654994466b.20.2026.07.27.07.37.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 07:37:45 -0700 (PDT)
Message-ID: <87761a9f-6bc4-40a2-8776-368ca963473e@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:37:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] arm64: dts: qcom: Add support for usb nodes on
 Shikra
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com>
 <20260723-usb-shikra-dt-v4-v5-1-5b69d9eb0888@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-usb-shikra-dt-v4-v5-1-5b69d9eb0888@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JtsjBXG_74gDKY8hmsFOfzzl3NN50Rt6
X-Authority-Analysis: v=2.4 cv=cJjQdFeN c=1 sm=1 tr=0 ts=6a676d3b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=xRDQoa3q2EOgHbFt78gA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzOCBTYWx0ZWRfXwYX3BfYvIMpg
 voaW5yakeR6XL0h3Nkgr7Tpeih7Ae58sW9nvb8AX0z8gDJJ3oL8sNChrGUQOuYuKriKOdPcoLMj
 7Zn96xnJ6mpuI/+Ypee0ggUTrWFdLAU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzOCBTYWx0ZWRfX5FOrBhLDucOx
 ZRAysOFyXDWs0aMCzWymHwi2enLTURAy0A4bTttvA8oGC/vFBZhAYgYtCY9SDWytr2TKSxeB0yG
 k+RMdz6yLPzkpDZATYzu6h83afEFfmb6Ys2w8mSwFqBCSGouDg92KrNSRc/vB/XVDAUIYu9bo/3
 Lv8MHDHffhE7aTkz6sfCOBzjDOKj3doQha3uJrfC2FbiYtXNqfZu+t6jKnJy6CLJ7wHCBCuKbCM
 tkAwwzrxgUBKyk7BDTz3n2PqmRrUagwc5TIZgLwpQPYXryyrH8MD0iIqWsQ28uOy+hCtbxfw3dp
 6Lz50QcyiI72fBR0xJb/pxPub4rB/Eq/es1+kyETXZH45R9OoE7PptxHsgxshtfxXnHYPM7bPhW
 hcka0+SeQmwGgni9sjIArn1/VUfiO6E0XwWo02joGGH/EqtG/Kw+ZwYZKF0cRTTN3MtKkV8W2iz
 GbFz5fK9X6G5in0IXrQ==
X-Proofpoint-GUID: JtsjBXG_74gDKY8hmsFOfzzl3NN50Rt6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270138

On 7/23/26 12:33 PM, Krishna Kurapati wrote:
> Add support for both USB controllers and their respective phys on Shikra.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
