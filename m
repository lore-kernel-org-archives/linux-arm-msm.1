Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794239264;
	b=W5+7X4jw9QWLXZFEy286Qv65UfY3+HksKLZR+QOVKpdHL3AgnEPmYN+/YH1Na76CpmXU
	 v3UQ5D3cxXBTz88i5j8/k+CvSrMLOn+yk6qsmsufsnd/9E+8gWa4pdxYf8j6eqYZzJTOU
	 tkifioc4Fn9jUbJQcrfy0g9mMfeCfmuwNfSinNxfhpOJ7IbY5iS9e9uw4xlUMkF5SyOFP
	 sZA0w2L254ni3FEo7KsKhbXHykzNHQdGMPukG5+9iMsO4XqZfSszX9upJLlwkJ9gQnfg9
	 2pHCuRP3/5j51Fcp5sIt5oBuev8yf/JIUedir8e0NPf6y8IIUMmL7eytkdeTaIs343g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239264;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mBoR5s6oMFRgFxiQj9Lay5NRlrAbxIjp94cmKVZAPUs=;
	b=u09Qfd70Q/PNgC+RvmuUThfQEHqn7OGSjzW2igRXBPauHZRu5P2yRQEf7KoKKwAfgIuk
	 ZYW3ON+y9oHbJO5mhVUTTy2GNuUlg6vcDMpS5Z/lka+c+/ofnMfSCDJzr3AeqOQ45OHwM
	 Mghx2TDM0ym2vNKGojqX0XAqiUOMFKgv47R0P1q4TXj/GgjnqP4F87PHndSXitrWTN7nT
	 3r0zNgJ0+qq5XQaaB39i+DpJBSdNWkFtZNcRuOl8Y6HIEJTIc7+AJi0xnXIZkE7xkHDtt
	 Si5f0oL9BIV/eeWD6lqGCFsGJ3mJ3YcZ8YLydFYeNgxaGlShaShZ5PHJcZh+UFGoZKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i9cOGYDw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kzv6+DSY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165EC606A325
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 15:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 165EC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i9cOGYDw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kzv6+DSY
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFBku022884
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 15:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mBoR5s6oMFRgFxiQj9Lay5NRlrAbxIjp94cmKVZAPUs=; b=i9cOGYDwelk3Coqs
	Lnm8maHufdSmKU9agpzwAvGEnrGe1g5maoL0oTeVD2vMKitnjvDHsdPqVeSvVaeI
	8nr0owWuRV8qvu3XZ25Qbi3V4RogyWXbuzeeqyOrkViAgfS2pQJe96Hj74eVjOQX
	bq0SN1Pt8Z+6XxT+aLfgNFz5p+vlBgxOf19lybW5u333SlW1ZvHV3+qO3TrqqIbZ
	ocpDF5hn9FSnNyM7KsdzYX85ruuSxU7+zvrLBl3AGbGSpypeBdxqmoJvhts8qywP
	8glHvw+f0GasDtS1A9Ktp7VJF8hXE38GZ/yPi1Zg9j7yntBx/XJjX75vgZG6qtgV
	nJ9Cpw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydh0sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 15:47:42 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ece7f075c4so298698e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 07:47:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794239262; cv=none;
        d=google.com; s=arc-20260327;
        b=ImzF8jAcmtR/vSS6+uUFpOBjV4kPZ1hof358oACJVZYgwenzdbDsr4V9uwGx//N17A
         2s1wce+FB/34oo0IeOnIev3aAVt9ulPTTl1gtQ+MVJeb6/qCih14TPyQnZ3B7tTMmqew
         nEu/vTfIeTEi8NB1KZFkOlolFYWOx2A4liJlg2Nq7trs9HRISdcTey0TUhPdsEzJv2dZ
         /vTkx4OGmJ+m74XzFdvVUeW3ALZAmutWaX1S2tZ/8KS3Bu9T8utTZZ3hS3k4lkeOpJsQ
         pD0mg+l4ABLF1oDeZGyG8Q2lQdaYckPT4UxuPoN2xg85TRzoXY8aUaA4v08sZzbGR66X
         gREw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mBoR5s6oMFRgFxiQj9Lay5NRlrAbxIjp94cmKVZAPUs=;
        fh=/XLUO7I/QCqaXzcHwxJrSfuWDADiWTla78Ef0uaMZAI=;
        b=og2x2EsWpM/pl+vsiIrJTpmf63GT2aacAVTrkB955dXt23r735JTeTfonhRFwpXkJl
         hwwfYl2adW84PqqsQOFmA2c75NcyzXwWwKAsWNHh5uaQgrV259vQvEyqYL1/PyFWzbKf
         PApcCq3qHSdPNr4pQF/n7TcSIo4ceX/YbaeY6ltYJrpYnM34yrp0BHrjoKoCM2qV+K19
         Za8fr+QJJND5Hv5vK6ZoWwkPH0LUXn8IH8L9talxx8pIwLpakVl4YCQYCqLq8aQyGAa0
         J86WRM8HYDIXlImiyjS80MKnZMtAoiOseWwPE33J/SczkZYM06WefErEjuelE3Euat2W
         N8gA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794239262; x=1794844062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mBoR5s6oMFRgFxiQj9Lay5NRlrAbxIjp94cmKVZAPUs=;
        b=Kzv6+DSYorJUfmW3b/1Nd5IkiAlsIGtF7TF05V0gXbGaSirHRr2N4ZksG+s2hpxScY
         YEX/AzYU+99UGqwoo/DhDRyn8wQHXOWrBjLTXdXAruUGdR2esmZBU22e7mvrRRJnGqcT
         GAHT5inkSAWezPVFdAxpzcODRaAOeT18XKi7Sp8r9WJ+xPJpJBXFxsKFLRPO59659iAD
         tSMIOp+mwJl6EsoXixAxik53nCzleje645Rk6MfGaCxoI1BocsbYtIBeInifRU6+558x
         1gSYtIjsjlV6NmrQUkzc7pKEcJPoLbD3qkXmHMaB5p2kFRmhFaVvhAjqAlDWKXlGVdNP
         lH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239262; x=1794844062;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBoR5s6oMFRgFxiQj9Lay5NRlrAbxIjp94cmKVZAPUs=;
        b=ABlGqhssQQXCwhXHZwJXTtipVZmwTtdONJSultkMAuHe110dqXc2Xm/V+9SaDpjWzy
         zjeEBSWyz9geHTNSQSg6JEpuUA+R1e8CPJQEDsJtYyYJ2R8H9oOdu3hgeysGdyMDgwAr
         XKR32v9PvDg8JYbXRe5se/VYxRy/qe1i8ewA1LEizuPX3o5AAcgRIq1923WTIFFSVpfZ
         vBJ7evxszY8LYTCC/K4Abq/e+WGuoi/SJ7MAkzysC5LvgGMKdrNGSVgZMbKvuhgP3VEj
         vVQ2KVpWjohRFio7rIduRqOLVeEnV+8cMtfOR3WUlgG/3fZVQObs2eja2HyeXOliuKCt
         eDoQ==
X-Forwarded-Encrypted: i=1; AL+hErGCMcvkHSqaSvzIPvF8pKBczWC2KGiAMmDQ/fdVcHAYJ4h8Enk1CoHYcL/cJ5ZVW50Xigwti1GF36GGJJBO@vger.kernel.org
X-Gm-Message-State: APuU4Z/oTyF+By3Rg3+L5BLzY3zDyoSTzQkMV9i7lBBcFtFLnr8q/2ck
	x1lDH572dSCCnp0GKBQ5487kk8+g1hwh0c02KaXsQIgIrqUKLvIeeoaYuRoh/EFdAeFGdCanBsW
	a94LgpQ2GQhcFEHERB4UsGaGbdA/YuOVbo0fAvsxLc9CO8aTn188AMPnQCbzFyfb/BL69Bg2Spy
	bHWD2OmifkfK78niGyd9eAbAUBMW16Se4rr2dYF/wVVjI=
X-Gm-Gg: AYBFou3CxWT//yZYv82u05/EFbLn8hj3SEkxRWyE87coIB5YgYIbvp8Gzs7cfjEiABY
	QfWklUmCnsJUYW2wisgZ+s9Xe/x1iafQmpomagi9SQVpMdNgLUffjs4rOAOLH7j45Cj3NXfxbAT
	k8OPZnWtZiIJcVZtWxatg3zTaQDuNwZfq6v424rwcgvlGT8ygXI1h4Vp40AQ==
X-Received: by 2002:a05:6122:32d5:b0:5ea:b294:f0ab with SMTP id 71dfb90a1353d-5ece7143d92mr1480891e0c.2.1794239262138;
        Mon, 09 Nov 2026 07:47:42 -0800 (PST)
X-Received: by 2002:a05:6122:32d5:b0:5ea:b294:f0ab with SMTP id
 71dfb90a1353d-5ece7143d92mr1480860e0c.2.1794239261690; Mon, 09 Nov 2026
 07:47:41 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:47:29 +0100
X-Gm-Features: AclHuK-Kr7TGoM1o4LoUqHv6QGn1qOkyGnkGREVNczQg09-nH_zkvO-sNuQEANo
Message-ID: <CAPx+jO-WLCnVecquKbVaCcErbhuFt6OHFUmzbgNHjixx0r-wMw@mail.gmail.com>
Subject: Re: [PATCH v27 00/10] Implement PSCI reboot mode driver for PSCI resets
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MiBTYWx0ZWRfX55kvBpmsP5Lc
 OimS6/4PF4Zm4/YtIquebwJiciA8itYXkiiBh81FYyAOOEIefntjja35vjcUFnlOz63TDIwYzwq
 l6rtPhkUO0t6jbiZ9szTLfzb2NoE4Rg=
X-Proofpoint-GUID: wSh9eBIY7B2gLccVVa5StrylWT0XleRY
X-Proofpoint-ORIG-GUID: wSh9eBIY7B2gLccVVa5StrylWT0XleRY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MiBTYWx0ZWRfX8d41LTaCcR7f
 TM/7xvWNWwdJYED4GeC6uuNeW24BB85sXhQdMppTaSgCU8hdvWe7iVvlYrW1Cewrf9xv5cYPF01
 JhzSda3mPSFGxYMnGuuFWvM9ssysR1So+GuGfuoR471d/qq92zEHeN9e+jyIAfMP+DPNtIaECj/
 qHw8/1X5lGtvOTaG0C3/P6Y0jkaBw0ubt8godQoIry/RTXwAVMI3mq7rUJh3hlYXbn/KRYFdZbl
 xKr1nCqmQ9I6PxIXdnFpvOGGW5llX68ab1MQT2QXy517wbovOJLg70CSrWmgODH/hP91WHvXwhz
 579ySMRNhdPZnRnMppObO0Q9POsOvj/zTyO4gu3kXyl16wsXuVjtogqNtJ3lCUMyzxOPPI283VD
 PKmxUFrrnQFu5slFaI9na3MgspCorKmi0ZB25Ni1c10sjtBf27V8Qp2eIopOtPYTdzbl240bvN0
 vX1EwCS71e7NnT+dhuA==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af1eb1e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=7LcMNQwP9uozhxO2aV0A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090062

On Thu, Oct 29, 2026 at 10:01=E2=80=AFAM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> Userspace should be able to initiate device reboots using the various
> PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
> patch series introduces psci-reboot-mode driver that will induce
> command-based resets to psci driver for executing the device reset.
>
> The PSCI system reset calls takes two arguments: reset_type and cookie.
> It defines predefined reset types, such as warm and cold reset, and
> vendor-specific reset types which are SoC vendor specific. To support
> these requirements, the reboot-mode framework is enhanced in two key
> ways:
> 1. Support upto three 32 bit magic values as arguments. This enables to
> support for a 32 bit reset_type and a 64 bit cookie).
> 2. Predefined modes: Add support for predefined reboot modes in the
> framework.
>
> With these enhancements, the patch series enables:
>  - Arch Warm reset and system reset cold as predefined reboot modes.
>  - Vendor-specific resets, configurable via the SoC-specific device tree.
>
> Together, these changes allow userspace to trigger all above PSCI resets
> from userspace.
>
> Note on introducing psci aux devices:
> Based on feedback from Bart, Lee and Ufee, PSCI child functionality now
> uses aux devices instead of an MFD driver, with psci-cpuidle-domain and
> psci-reboot-mode probed through a common PSCI aux device enumerator.
> Reference discussions on this:
> https://lore.kernel.org/all/CAPx+jO9Hi2R_UnCEhsXLwf74c3RTb+RodaJ6SOVXbQX_=
eHt++A@mail.gmail.com/
>
> ---
> The patch is tested on rb3Gen2, lemans-ride, lemans-evk, monaco-ride,
> qcs615-ride.
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>
> Changes in v27:
> - Removed unnecessary headers from psci-reboot-mode - By Bart
> - Rebased onto current linux-next.
> - Link to v26: https://patch.msgid.link/20260928-arm-psci-system_reset2-v=
endor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com

Overall this looks reasonable to me, but I will take a closer look in
the next few days.

When it comes to the merging strategy, it seems like the best way
would be to funnel this via my pmdomain tree. But I need an ack from
the relevant maintainers to make sure there are no issues with that.

[...]

Kind regards
Uffe
