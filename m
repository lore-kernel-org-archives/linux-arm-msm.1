Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471743;
	b=m5ATv+O4qcswyyFkMHaHzIL8UZvCY+y28R56BFpubT0N8n3gN5Etz0qbNPb4F5YtMvEs
	 WFrOsL539U50fmpXqs/J6TFMP2evcHpqsQGqafiP12qKyZOvxSvRwqxGy/x1AExFYaou6
	 WF4kMG14auZlRxKxo1v0S6cG+Bi+xL0lu4Pt+JqTe+COPb7JwqPKxUGDivt9yY3RUiHJQ
	 Dec0ojt+8Q+Z1SkvrBxhhHP11RUzZ/JjQrxq7gPKCSXm8g6rMQ3HK76FCnvE8DTwljWFB
	 8HrE8nNsWMWpjXitcvDV7Kw/Fb1in9pn9YjoTbLdJ32QmUXh2UkLrcjzrk4xQsabKYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471743;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AVn3WXTCePSez5Rn5noeCdq8yUKomZ/xweK/qX5fOHo=;
	b=0XQxh3z6oKEzW+F+iNeZbBcR9ZPka/7BtVzQ9JVM4dsGwAx8dBXQnzqs6996LJqco1jW
	 EJqbu1d//0iCVJM0qGlk2YJvcWep3g83g/TeZbITrEBOemdbIa76SMuBHQwM7jpobK+XD
	 M/Q6t6sYNtl6MGOIENvLO7lml+HTONw0FwYcV3IIagJwZ+vJJyfiiMBSTStgUs0wDRfDU
	 bjw37uEf2rlNsZthbf2WvX8bwVfXT+Cx0qgZgkEVLKYoAMLkcw+v4JRm/bK3dL8G5Gqq/
	 GR/Abizrthj5RAgU11TiwAKhlQgnXVvK0Ydnl/MEqVMa9x0eONCjQ+KsnnUh4fPyriw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gcrjIu7i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qz71xTK5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD64606A331
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AD64606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gcrjIu7i;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qz71xTK5
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZUE64149288
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AVn3WXTCePSez5Rn5noeCdq8yUKomZ/xweK/qX5fOHo=; b=gcrjIu7iJ/yFq0D8
	tnf/bIqZRxIaI+rObX9zTYE/88v6CZeImHvG1LHH+93xtUWfUyL10VkfoFi7sAkd
	hkW1l0clQxGmz24CHnOIrxvnlhBmKYDDCCIbthgPxWXkqeUN+KMLjEmzenLw4fg9
	eeLbB8Im+ej4JAdswvMe06nb8RDsdAGoBfadaDZeo7fwGRkqXW5K+J6GD/ZUlczd
	EB2Jox+7lDI//NwfnG1lNM6G+A9/bsec8KxI6HTKevmk6rrFmp0lXBUeQO+5W417
	rMMGUeZiv/oiLatKTxOz4zuFBDN5OfZVX088TwcPMW+qsIKILVJpph88MMj+PArN
	hu2eog==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc62guq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:22:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b167bc8e16so2537328a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 00:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794471741; x=1795076541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AVn3WXTCePSez5Rn5noeCdq8yUKomZ/xweK/qX5fOHo=;
        b=Qz71xTK5loOYszReJvCsgieR5AKIcTJEzYIX7HeAOiTS7VAkmj/+u9GBz2mMLr4YBY
         Znu+6Yxc0Upld0CvcFqUMe2JAIUfvdgY32crtZejiYy7aMBOvlH0FVQJqjev0NmawrIN
         ebj+OGLtthqZWPV4qaDlOvx8uW/QXOgAdlxnRmPdqhQD5Q65fRcIhHygF37R/97gFrMP
         0/JhBEjMNb/fPEMhYflZICcJYQrAzD1uLAMPNFizEtQUaLlnj5wHzzq95j6wWB7z82i5
         pMay/tdRdclofc+s2/oT2baHeizprnZPQjmBRwG30yD5raq82ueqt3Mmi/yVmYovWTDS
         Tjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794471741; x=1795076541;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVn3WXTCePSez5Rn5noeCdq8yUKomZ/xweK/qX5fOHo=;
        b=B/TJD1/gFBxawAvbNyxl2dnetAFkYNIusGA3DoBaroZOueQjGxjNxug0Pi8WNJw1QP
         93nFJoQiU9eHdECiBZ4U4+W8jUVfonHu/YMGu3Iyru6UeiWOhWrBMABslhBH//HO9Dcj
         Bn9HDvMMTDW6mQU18U0Xz0xfT4fCXY+y40iDxmi2HbldIUfJTIW9shegAuQVwJDzXMhw
         K3UTJJzWE1p3X1esTY+NwEUUChflwkp0+5jf8WtOXWiTuHg7NKsjR6M+/OdvabJFE2mX
         UjFY1Zld4YYhtmBRA3FZLyZwSXHYPK/rNfbNj/5mPRY2IDbOHv453nb+ITQJdHWp4cUU
         d6zg==
X-Forwarded-Encrypted: i=1; AL+hErH9yGefbov73x5MpfPWbPT67nNYdglsMtHGG5hxnNz+Mv6vlycRHnExEnC/lmdMJ1lCU1mW+VvFi/qqVEcp@vger.kernel.org
X-Gm-Message-State: APuU4Z/0xzPhm6ljp+UmeuE3r4/QEFqrDkVM0Fu8CAVsXjvPpCfB+dyB
	T8yN3eqZ7HFjcEUraP3nPFxkjJy5/ya/D9K6WXNyDwDWH/QtsxyyX59qy0uFEXe533d/H7StXqY
	n3Ok4YlSTPFPsKydK4DNvxZLfRoCx2bAcSfJWNp0THb7A20la0kZ8iNX4q6jSWYG1HlwN6YCw+m
	i8
X-Gm-Gg: AYBFou1rUVKxeSOnStfoUAydjBXyGhJmQybmOgiroSXFQWepHleZ8DPAtNPKb8xVhg6
	e831NMevMPJ2DfHydTpjYg3ReJpXmvlO/Z4+v2glHku53Q8Bh3aGx794hI618yh1j5+nHWog3Vy
	on6nf3ucf/6W1ySq8D1QSOHU31bTWa4RCmVRdFRpZNCnXSLAR+fplaXdHuB9oFMXUYEsbccZYqS
	cK5Ee3uvD48Z8jQ6eZQgBgABapq2po5stXovw5xU1seYFpHKXPnpctkueZpXqxo/1ZPImOZSzEw
	oRmllkhS4tmqlFgTLNZUz8Bbt0wdI0L3hY1fYALxXZDxWZM/e/FwXuq92aCJ60NWbmV3aLCgs/P
	7EznBqpf8/ZIVsUteJDuIOlZfXuUq4yJf5CnHJk+dyaATWpRr/x6ODBO0P7ot5zsj1IObccn3nw
	gD
X-Received: by 2002:a17:90b:2250:b0:3ac:b2e6:3181 with SMTP id 98e67ed59e1d1-3b182f57211mr5338904a91.37.1794471741163;
        Thu, 12 Nov 2026 00:22:21 -0800 (PST)
X-Received: by 2002:a17:90b:2250:b0:3ac:b2e6:3181 with SMTP id 98e67ed59e1d1-3b182f57211mr5338878a91.37.1794471740510;
        Thu, 12 Nov 2026 00:22:20 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182debb54sm3082736a91.2.2026.11.12.00.22.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 00:22:20 -0800 (PST)
Message-ID: <2ac0ce9b-f54e-46ff-9d28-511c07a4fe18@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 13:52:14 +0530
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
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: glymur: Add camera MCLK pinctrl
To: Jesse Casco <jesse.casco@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-3-e7b1f403146f@oss.qualcomm.com>
 <20261110221232.3883-1-jesse.casco@gmail.com>
Content-Language: en-US
In-Reply-To: <20261110221232.3883-1-jesse.casco@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: S3W8GOQhfu7YXBC3snbTs1p-eN7grUV7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX1X8oT48AUBwp
 H0RQow7KR0kD2Cb0nulDsiX2PnZd3Ocopp8338GTjIXb+OyyYbr0EHMUxnZBc0CTCu53tHtpQIO
 wSG9bFyNRvlgtqGteS4siE4XK6tYZakm/MVDCAtNTdwV9eDi0SReo7F61i/wOAsqt4q6wSJKI5f
 8fjo3F1xKkLc1fKzmEe6hAbfbRhXFcQ15I8xR1zWrNt9bcKj06mNX9rALe16S9bZvCklrMRJh5e
 LVU9Rp3ujw9hYg8xv9q4kZ80QxHwvSyY8cS1hHLejzbgTOjtTlZSLlmycabHTxyBf/hon8NHDVs
 JJ19CAjJsib/CF8v5wbsSWwRQFstkN5ofS4nzZ3MPQ4PP2DjW7g8CHlgJyPtZLRmpgv7CH1M8zK
 aySsSsu8NWYfhwVBt/BF4MOE9tOJMMx9elUghr2Cj61Do0+pQSI7zeC3gzJPwmsLFah5VRMEUwq
 Dta7kIAqXSlwGHAbY1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX+323I0zg49+X
 /4sZFbK0nWAz/WTnnWhDqPi+/14F0oaFpvzfxsxjM58CmnGPgpA2izpzBZ0/Jl88ngsQpjTuLsq
 pESGnEnGdqG3eMXp8y4npFYtvlron38=
X-Proofpoint-GUID: S3W8GOQhfu7YXBC3snbTs1p-eN7grUV7
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af5773e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=smo19LPPzjqg-eG-KNYA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033



On 11-11-2026 03:42, Jesse Casco wrote:
>> +			cam_mclk4_default: cam-mclk4-default-state {
>> +				pins = "gpio100";
>> +				function = "cam_asc_mclk4";
>> +				drive-strength = <2>;
>> +				bias-disable;
>> +			};
> I've been running this series on an ASUS Zenbook A16 (UX3607OA), which
> has an OV02C10 on MCLK4 at 19.2 MHz. With 2 mA here the sensor shows
> horizontal banding, and its frame period stretches by about 9%, whenever
> the internal DMIC clock (LPASS LPI GPIO6, 2.4 MHz) is running. The bands
> are already in the RAW10 frames, and the sensor test pattern is clean,
> so it looks like the MCLK pad itself rather than CSI or the ISP.
> 
> Changing only this pin to 6 mA fixes it. A/B/A across three boots, same
> kernel, fixed exposure/gain, row high-pass RMS / frame period:
> 
>   MCLK4   mic off          mic on            after
>   2 mA    0.96 / 33.28 ms  20.44 / 36.17 ms  1.04 / 33.27 ms
>   6 mA    0.89 / 33.27 ms   0.90 / 33.27 ms  0.90 / 33.27 ms
>   2 mA    0.95 / 33.27 ms  15.33 / 34.37 ms  0.93 / 33.28 ms
> 
> At 6 mA the frame timing holds steady at 33.27 ms and the image stays
> clean in every phase, including while the microphone is recording,
> which is exactly the case that couples interference into the 2 mA
> clock. Normal camera use with the mic on is also clean at 6 mA, so the
> fix holds up on real hardware, not just in the capture script.
> 
> Could cam_mclk4_default use 6 mA? If you'd rather keep 2 mA in the SoC
> dtsi, I'll override it in the A16 board DT instead.

Hi Jesse,

Thanks for the detailed testing and measurements.

Konrad, what would you suggest here: update the SoC dtsi
to 6 mA, or keep 2 mA there and override it only in the A16 board DT?

-- 
Regards,
Nihal Kumar Gupta

