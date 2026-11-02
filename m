Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613528;
	b=fnKdqJVqhRx/L/iac88cJtnAkm/QpLr7onvU7l7h4MPfWJPJCSBDNF/j+G7KVxusaoPe
	 NmEZb9iu6nnkn+1Rnz8m7N2tD2Cy7MDuCvG7Gyj9p2C+sSD0Zl46KeynNfSpzkuo+8O0R
	 lf7d5wIcsTq77GHtrq3pcKJqcBBi6I2fV9Ir0W0h4ivwEEbz0lQ4n7S2C4F5Z4Ym0nnr2
	 t8BMT/xqeTmi7a7aAS66QuaTIPhrVO/0fTOBmXZ10jwrPDgxXUH0GTL61NSehQ/0rgZ6u
	 ALJW5LXdS+ijzVoFl1etLBfL7nLHWjXs+z61GpDiMB1+nUVpTGhm11+oOOxk1nlAryw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613528;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jzIkZr3x3Xp86Z0mA98bwB9IrYK6czMaDjUmIisQr7k=;
	b=QuSRJgnfixEPGpzFL/xmaNWIxLikFVPpzNUgysCXX5zCNQuU7Orjv9m2p/r4wEcCz6h7
	 /yAhjIfNOug9a367JjyyRlzhWUqf+Omkt69rZfkL5P+U/qQj49zBleeJo7wGuYnNQaTo2
	 jNoGwL+zK9ty0jVObfiCz0Jy4p7O35WQgXqa/1o4ZPGw64uVZtS+yqaL/yNgcVZt5y/rh
	 ZooO+utcyR2+O5z+BbfjVYPVcIu092duvpReHeMB1IbBf75iJHR9KSjVR4c4NYmk38S/y
	 Ur07u3tGkP3t+sCNBFC35QVd+1HgFifxqCeQ5Bx/ZDWl5aNEFUnM0HOBI1/OXjXm9Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DDYU+IvQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="D59iB/J4";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FB6606A329
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 09:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47FB6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DDYU+IvQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D59iB/J4
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A0wb3430284
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 09:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jzIkZr3x3Xp86Z0mA98bwB9IrYK6czMaDjUmIisQr7k=; b=DDYU+IvQRYoSsgfY
	xxuhpLvMBKfk8QDJxkkquXf0u2tNrUP3w6sywVqWAJ/vgf/GhWmwHJ11HdBX9L2+
	XPySOuGi0kQOsvmb8zaDHROIEMJSf4xWYOErtSQ3nJkIyIf9M3oY/ruEf5JJcbx/
	Ct1BjNTmZFc98EhAYZtvJmVC3C/IzfaeS6CRdetp7/4wyfcvnfanWS5t87ikBL9+
	RlG2ebhU4xLxO1msW+9hlrgd8Fg79S3OBm8eqoKXJJHMVekGIVdmIhGOwt6Sfqw7
	YYRUIRKKADAI6m/I3tyLlCEe+5hjPUNJ17euSIVJ29Fs4j1MD7D3QEKTX8Bn9fud
	hW7t8w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmerr3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:58:45 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c7fe5576bso20034216d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 01:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793613525; x=1794218325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jzIkZr3x3Xp86Z0mA98bwB9IrYK6czMaDjUmIisQr7k=;
        b=D59iB/J4WBanpS234LJvwRPWBCLA/EQVcMDCCgrlI8g2NICiad8Px3CKBrFoHo7Cx4
         TlSopvbQ/cK4FpUwOiQInPPM1IljqvR4tgdZX6eNo8paDKA2MEGN/z+e+8DEc7L2ILHI
         H/0IG8g5WJAjHH4V1qb4v2Ejo1dTCLSL5M9862+CXB7AGKtnX1W4KGrvIgMlAx3eIML0
         dIdAK7R9P7OjsO/e0jGR/TvLb20QuJHguOTKpWrghRJyopAmpCRabWk63d2B0oT2064I
         xo9A/xbIQZOKX+9lpzQuBs0giL0A875vctfsNcgT8Hr440M8+ihVsdRiH9CJL5Mg5Mtn
         5d7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793613525; x=1794218325;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jzIkZr3x3Xp86Z0mA98bwB9IrYK6czMaDjUmIisQr7k=;
        b=BYLcVsUUsBnjcjLcuzz5KkcGUL8siDVRTfLSWdYgkw7yEv+v/YStin7qQF8iqw7cE0
         18vjxWFEUv/cejYRfQlyPNyQUjTCo8A0tsDE60ATr7AFtGKLNkk38URoWw0qj9eplQm+
         qFrUYlnC1OzUPfomFCLtUQHaOJSyajJFhAcIB8RkeDfWRXe5FfcjG3Bs7CumalpiaBrg
         uLtwKgWPpQNCas17YiqhZAcSer8O0SditZywcr1ETbAz7FxO6lAa6O7VTjvv/p5tarWt
         yfcQAqJQfpshA3+F6+CyCtmb6rFS727Yis170RzQJl0weSO1EZZxs0xmqKqFV3c4YigD
         jmIA==
X-Forwarded-Encrypted: i=1; AKwUvBw8ZPBZN3bIuUc2Z5vpQ0QJVfcJcpwGHlNjbrXHEEM64YRse/DfrhciEDmxNOgFaLH9d0gx6+g18QQUgO5n@vger.kernel.org
X-Gm-Message-State: AFq9FYI/gxgelkPy9Nh4jVVRl6F5n3nlD3oTVSkrmrYQwU0J+A3GparV
	r+GF5qPB22VqRRfO8/+DTK0F9i2PYaWaOkgMIr4ueHOYzDdeDI2edf2fyiX0yEGYnEn4/uFnA4j
	5K9Ziz5eM6aYmYXI2y1ZDVCOCC5+4+YdPUu3dkB38BBHE6h8zwvafaK71I4B+JLtk/YB9
X-Gm-Gg: AYBFou1IRaX7PBi5bvgIX16BevWwFz7iAVvZXp2im0qlJ20iohdQHKomfxmwkd/s7av
	GaE4z/Xoo+F0JHdL7es/UaUDDEqHBsxYj6LaeOC6C1guB1pf+54aZXML8VHmRMIwfIP39R3NW/+
	1+1SP12SaWfTLZUDgxAMB3TgAJhyGkKcsD0lZT6VW8SEYCBDhYTvqeSxyCsqW6M9AQ8nSeo42J9
	GeIRzDxlE3uZ/5mJSOmcHnvgYsOPgAlXemDB7TeKuiY+Yx0YDkkRThBYBcYRa0Nq4+C4xsASfRR
	4Wb4kkg/NbqjhITOpLWpGFRYv/yIC9QTFWsegPxeq13FEiEehDd8yaenYYik5XNYBVoRanwiLj0
	2khNvbYAKHTD44WWI7bW3w+IbL0lsoO/MKA1xmlk+uBopl75k9vQYPa6YIq85B3+NuZww7sU=
X-Received: by 2002:a05:620a:2246:20b0:93f:1fc5:f07b with SMTP id af79cd13be357-9442151da69mr1551974385a.2.1793613525357;
        Mon, 02 Nov 2026 01:58:45 -0800 (PST)
X-Received: by 2002:a05:620a:2246:20b0:93f:1fc5:f07b with SMTP id af79cd13be357-9442151da69mr1551971885a.2.1793613524919;
        Mon, 02 Nov 2026 01:58:44 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fc668sm3100901a12.15.2026.11.02.01.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:58:44 -0800 (PST)
Message-ID: <8433ec2e-0f0e-4816-b3a5-6cdd7a6d1040@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:58:40 +0100
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
Subject: Re: [PATCH 03/11] dt-bindings: regulator: qcom,usb-vbus-regulator:
 Add pmi8998 and pm660
To: david@ixit.cz, Alexey Minnekhanov <alexeymin@minlexx.ru>,
        Robin Snyders <robin@snyders.xyz>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261031-pmi8998-vbus-v1-0-4d805e5a0f27@ixit.cz>
 <20261031-pmi8998-vbus-v1-3-4d805e5a0f27@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261031-pmi8998-vbus-v1-3-4d805e5a0f27@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae85ed5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=nHuvgkJ7WHa1mimDmQUA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOSBTYWx0ZWRfXw5KNtojErDi1
 QP5nhnSDFfR9vWuuvWsoBNukyTqfZl/nlYc5ZrEXajTJrzd22tWRdwlKBtz89QeVZ0eOw7qrmuc
 mdn+2bJgKnMNTsNShYaqgcgWwGrMtlOAYFeEDGU3U9siPwPy/AKET30QcqdLvezZblbMptyH3o6
 HEgpO3sq2qjqUrbWasQ3GzY7ewxr8uVA2uY6qq24zMb0KBrvn2muWIPs/PNDVyo4ltYUn9QPg+V
 IjBij2cuPy3vHEykuE0MWuodlluA1x+kOlmf44yuiE3Z4IAaXRgieXdPIvrDk7Bs4dSbHAi+Qza
 JIQtjuMctJZV1Jnzn++IsFAJ0098vMoiUWs9FypAlJCF5ewPHoXCt5fnE/3wXfoQFaOb7nDnB8b
 PQsOqGN5h7LGklOjlMGqurbL4HGZ6RRNoTyT/fPLQ7URvfLVgACa76ZXh7yOUK2XIrLb3B9GZU/
 9xIbc6B7QSkNbfoX8rA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOSBTYWx0ZWRfX4hhdnzVkxgfv
 tytaT64JxSitmBXL+hnxaErWu1I/nz2j0OzuX1Ywucz/4r1+s6+9Hn/E4xU9gsErpriCe6kprt2
 CNEJtJ+B9RUr49g9lI6VKFU52cbrlBg=
X-Proofpoint-ORIG-GUID: aZstzGY6OAoZljmXePDjksW0CkxvJbQ6
X-Proofpoint-GUID: aZstzGY6OAoZljmXePDjksW0CkxvJbQ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020039

On 10/31/26 4:05 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The VBUS register block on the PMI8998 and PM660 PMIC shares the design
> with the PM8150B one. Define corresponding compatible string, having the
> qcom,pm8150b-vbus-reg as a fallback.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

This is absolutely not true. They both have a similar CMD_OTG
register at +0x40 which makes the driver seem like it's working
for you, but otherwise the register layout diverges a lot.

Konrad
