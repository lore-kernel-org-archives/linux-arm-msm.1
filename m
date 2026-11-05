Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866205;
	b=s6F584MNxOXuRe0MZrivaIAQB0B5TODfcv76kQuNDFR1Ig6/9wZD2xbzZ7f2eeV7CpGL
	 DzcgJdIePwygI1v5dJBqOVGD3/klFcAUnHO5lliBack+ev6zcxphTu1OYocLPye4SuSrz
	 mYFzKAjFkh4/8jhlue1JiiARw8BPdPaYhygE+BBV/Vq7WYs0124wIZ3SSSiVcaT7emJUm
	 C5m50VFxlsBFQsGGD2+ey073XBCaBuGuBl1daWAWI++d518rB+HtfSuF6gpDW9onVJ2j9
	 DSsNy3oAjylCOdsIYgGi3+DAu7BqceZHbP6snBSxls8quRqaV1fk6iXFlsgJSOamYSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866205;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5Lp6dUaP1Ia8j38qqsE2ncWy6Z83aplFa23kRPGo0WE=;
	b=dLLLiuy/PwP8ScGI71KVNNa052x0YZQeDDsuWYy3tye2gcPAJTxHcjxNyI7gM1kYsttD
	 YAAvwcUJecoVgnTA/4xXRvBhd6aSrbhsccT1YhYn4+jC2pctc49td8sk70V8t1DmnbYjP
	 4dgSTyj4r0Vbv53Bb7qi0fvQ4G9jKzusS50mFsAfYgJPTEVGT5t9LUG8wAzK79xa2mSHf
	 joWAQvz2UtSM9Yf1JUAfJlsysRtim2INtSsAS9YcRCRFGOjgeojib70H0uC+SfOavriHu
	 A072sy+JT8zMc6S7BKr5y40EKy0K1LxyAB+75wvAVbmJWHYSdA1AhHyfzRcyy1ndM6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RA6xXSPB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=afgVncg2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875DE606A328
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 08:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 875DE606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RA6xXSPB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=afgVncg2
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UFaO4179289
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 08:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Lp6dUaP1Ia8j38qqsE2ncWy6Z83aplFa23kRPGo0WE=; b=RA6xXSPB8IgDwEgw
	iFql28FVT3DV3YG/OHZ1WIg6wkOABHxSY+Q0KboQnI0ACfyCI9two7veOTEQZEaX
	U/xi2F92jWc8cMBtsymeLEF73jAAZAmZGdMJ1yKrWDcVanhn1PxrweklJoqjLgbc
	NGsHOtg9B8jMUvm/nPiCZ7FeSMTZ/A8AxLxOpyAfm96rG37txWWWcGUepW/W6vKp
	fFc0/6jxU2YMYTr4z+EIUTZNbsPhyOKu2SDSpuc/Jb8Y2XehR8evDlFB9tZFWPKL
	UgtaQLM79FouqKXLyNXMYn2yEDVzZQfhIqItkbYDAPChAtpb7RRavAQRlYEl78Fu
	Izg74w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr4bn4k2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:10:03 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c99c10e33so2946336d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 00:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793866203; x=1794471003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Lp6dUaP1Ia8j38qqsE2ncWy6Z83aplFa23kRPGo0WE=;
        b=afgVncg2ppGg3emTNFc9SrQpbvFA+9cgZWue3TkYdXavA4h/ccjekoV6b/rL4WRq30
         1MasAq6HxpSncWZzGh6tIG1FS0GVPJtLzijN7L4Lo1JJdh8xGHnxsVbYKes4aNY3OUXa
         ldHkT4hnH8F4QRitDvXyeQn2KcdIISlj+x4KkXmLdMzGg7wi8PC/jAA2vNaq8WvqBDI0
         Qi3Mc7qdkj10mPOiLMpoZHmf4RvUJ2usjP8vZxdEHeCSmx99T+RmLMUNHykPTij9ABtS
         Pnviupom3b7CRIVP/XqfXNTp1Eq37h8i6elm2MGP0ubNmC88ipqhStsNc0Dh30VDQNlM
         zmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866203; x=1794471003;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Lp6dUaP1Ia8j38qqsE2ncWy6Z83aplFa23kRPGo0WE=;
        b=j1nie+m2qrfgYUhgAlzD7hStUrNxV+mOhYbQtVG7hu5PHbC5Be9koc2PpeGGxYIl7w
         vyDGylQLkGzQayZlhAcqyBbITOrKI/B+6FPXLGi01UytY7OdOEDpPBywPogH/E/BrWSR
         YUEbZnUswTumE0q7mZjFM83t8UgovUb+vFQwdUA/jSUsIQQ3Z+dlhlA/vW1xOzG6g0uv
         5WUtC6ly9Xl5q9GkqCBxiDRuWkyy2qWxPegBOCsm8ODHJsmKKxVleF3lxTpARVgmWCex
         ng3akeI10b193kVwsetqwfP4DK3sH90W4GkUl4X7aHbwtzmMk9HYj7A2j+hZqDKjcc14
         6hTw==
X-Gm-Message-State: APuU4Z/sY0PPTi1+S1Fc0C4NaAZVOM+GqG14ZPurph0zc2r6ppdK1q5w
	Yb+u7/NtkAJRkxVoVO3pPXqWvOPW5ASMmziTTOOdDmtzZ7PIPIekaIToclGoM5DTQM5sWtXd3y9
	8TRNKnVzv4ZPFxRofrdlnyeeX72xvcrE+rrtqLtKU0WEcdiRZFToOHcZijt5NwMSJDdbp
X-Gm-Gg: AYBFou2vJ4rPwY6Hz3Q72Z0Ux1WaELpQ2gNh58yGEwO8f9nngLLNQaRLzpKNH/dU8gU
	v/QD8pKs3Jw0s13R7ecTlNBhpc07wvjHcHZL/OoANU0ZnbC41Urg4/LtSFsjmz+mS19gwkRBvUZ
	j4w2z4sW4T/S2Qhtho+/0VYPCN6BrEHssfg/mT3xWjJfK7QymBDDKGxe5K92cLfy5ICwOUO7/bE
	zrFRBMWc51WpxNLSWGfjkf3c9fgKK0+WbotoLZYzH0DUi2w4YqXNXMRrYgnCBRQNXIRZLVIlBzU
	QtExJfFoUPg7rogNvRuCs7foQLf+2hzfB8EJI52Fx81xv3p6rXaJ+c7XUzV2CHvZlkWZK3DAHSs
	q8XUjPmMMQqhmB3ClM98KVwErYyVMwIv6I9TpVc7sN6yUzi/f4zHcOwyiHh4ae9AeNg6a
X-Received: by 2002:a05:6214:c2d:b0:91c:6e94:3b51 with SMTP id 6a1803df08f44-91ca47aa2f0mr413080996d6.0.1793866202595;
        Thu, 05 Nov 2026 00:10:02 -0800 (PST)
X-Received: by 2002:a05:6214:c2d:b0:91c:6e94:3b51 with SMTP id 6a1803df08f44-91ca47aa2f0mr413080546d6.0.1793866202158;
        Thu, 05 Nov 2026 00:10:02 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac6d03esm1527170a12.24.2026.11.05.00.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:09:59 -0800 (PST)
Message-ID: <b2498fed-5420-44a3-a215-02438b623ef6@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:09:57 +0100
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm7325: Add Samsung Galaxy M52 5G
To: korryasdlerto@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261104-m52xq-dts-v1-0-b198f02912ff@gmail.com>
 <20261104-m52xq-dts-v1-2-b198f02912ff@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104-m52xq-dts-v1-2-b198f02912ff@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX5+CZNjhPAXxp
 EFgXvK2ReSt1xveRBvEkuXo4C404Pwn45XwfeTYBHkdNrRc3dCz7OVqYXDORhuU+0xzD8kaJ2Hm
 iF1M3hKCPDf+W9CMmYnawUIAqJhpeHTIAvCBH221IIpT08XFySipk7EUuX996R9ESa8TDPqKgdy
 XyP92hI8bCoatt/+5ptH4NOXrZpt+g/uuhnz07KU1BLHNKh/oWIAbXd3FQSQuhVZ/zufNfjaMDh
 336cd9eHiIfpgyV/NKAaTdbbHntWwRluSkmCyyEKdGNGJslNmiSqx9HlKl3X6wGuKlKfz1HA3jC
 CFfcGYgr3+lu0vy3vZuxOQFsgvdCbyWWbE9lxHD6yacDRV7OyrHGQnW+HGDcr9WO+hUszNb4NIE
 mj5l3qwA1dEtDELBcxDS+yIoOZI39X8papPwaK4awK/qGJtRrbuEDVBLUFZYHt3s1U4NJFfzHQR
 YzF18j5DGNrpwv9mz1w==
X-Proofpoint-GUID: gqcsQMgNQU6Q1ZmH-pr-MHaDwZO4KPaO
X-Authority-Analysis: v=2.4 cv=IcUSymqa c=1 sm=1 tr=0 ts=6aec39db cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=Jnuh3jzrMT71hIFIYhcA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX3jfi2zv7pGuu
 7cQ1XYZN5x98QvKYvLB6cBLIdU3lyG6yBKlpUzOyWswa+9Gy99FqPVSaLqDCRDFNVhX2iSVXxRF
 DlzbsgEWTSCbjYrOwAbtLc1OboTSpqA=
X-Proofpoint-ORIG-GUID: gqcsQMgNQU6Q1ZmH-pr-MHaDwZO4KPaO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050032

On 11/4/26 7:59 PM, Asdlerto Korry via B4 Relay wrote:
> From: Asdlerto Korry <korryasdlerto@gmail.com>
> 
> Add the device tree for the Samsung Galaxy M52 5G (samsung,m52xq)
> smartphone, which is based on the SM7325 SoC.

[...]

> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		framebuffer0: framebuffer@e1000000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0x0 0xe1000000 0x0 (1080 * 2400 * 4)>;

Drop the reg and unit address (numbers after the @ sign), since you
have a memory-region handle

[...]


> +	/* NFC chip power, switched by TLMM 42 (no consumer property in the binding) */

Please fix the binding

[...]

> +&usb_1 {
> +	dr_mode = "peripheral";
> +	maximum-speed = "high-speed";
> +	phys = <&usb_1_hsphy>;
> +	phy-names = "usb2-phy";
> +	qcom,select-utmi-as-pipe-clk;
> +
> +	status = "okay";
> +};

No superspeed / displayport?

Konrad
