Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81024DDB35
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887447; cv=none; b=EdhFgoiN5uq+cAKt00BiYBAIimiMK/YkBAOSjWgCpsBvXJAiLEwuvX3p3/GRyl/wx8y5orqb+UqycEfF4SffAou2jyhRBCrRaXbl4rV/NHpele8B+HiraoYOi3qJ0FU4I9mvyTRsxSxsCIVEWpH9BJQVv2IKsqHS2CPMYpSjVQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887447; c=relaxed/simple;
	bh=s6lFgUCKWchq2Tr5iOLVIfwuMKBpkSgnVZN0RmocfQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iwraketugpap8o2opdfXrSdvPR7bYSrmCZnON6rvBwsZBA7f/37f8gLVv6Hs6klaH/g/mBzWbRpzm6AWrtfdWlTPZsdS8yA7RBBaljW6a7/1rxbbsAbk/qAjcL2rmD+N9LlVUT8ucK1V3ayMvwbLgxVeeFNJ3aDc1lgsHitoXvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EHjbjc67; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jp+746cH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EHjbjc67";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jp+746cH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8V02g922844
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HgwlI9xizsLKQYfDyomPoKaDb7JMV/G/kjGnCEp0kJ0=; b=EHjbjc67pHrSpEze
	NjVuBjs7uhpk8Y+M8YKX7K6sFfeF9iMdab+h1oHODkxD6wl6SygnauoZKPV19WGg
	9NwA1BO3N5cZPOk3Qcn1QIt11Am+iyQF7Got/DKVglgxuh/PzAEWOlMtgEUex57M
	HO5W8AbqKrDMJeN3co0woqsGZ5gWHAcfS+fbpV/116DXkNnxsHxAnrTuaMUrFii3
	/W9a1GcOjQMXVSwJVqkknO6K2LTalB0rzR4BBUHXyyJgefBpZOS5ZezwAWnnjwxy
	yv4inm6WJtuut+UIHzGZ2TSZHDCufuzKUythwV0if6J4GwSc/VNm1P3PVgC/OOHy
	sfMJ+g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1tf80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:30:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e661ce1dcso32211185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791887444; x=1792492244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HgwlI9xizsLKQYfDyomPoKaDb7JMV/G/kjGnCEp0kJ0=;
        b=Jp+746cHEus5vhkr2QYXqV3IuOv0RVTiYwmt5lx380vEqk9x+Msew6XX5t8540rdfo
         zVQdY9Uj47ZpT/zkgo8dJxJBgEqYQmVhXbpSM0KhLfOXk0/Aiffls/f237o3YnB38UEY
         +k27PdTflMWY5blyK0IwkVEz7L6Kgij++lQKaR61qnax6Y7nUGM4s/4/ee5qLcQ+S5c7
         n+BM6u1uDUpFxiC4vuxyOIQzsmEDgMYSCbNKBJvjTBUKHgvuiiDM6A0AVC6Qx7Oylexi
         Fj1pK0iA4RRdj/RTDUGhhjCXmBfheY9wArOPyL0UPjiTPARZt9zab8Q/Cecif8ZGI/0b
         Qsuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887444; x=1792492244;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HgwlI9xizsLKQYfDyomPoKaDb7JMV/G/kjGnCEp0kJ0=;
        b=0YRDfgyfsh8tH7xPSWgVdE2mfS+rt3Jq2xBivEagLvzlmqbbccl5lxc/XRv/Ix5JAo
         ydmzygEhLdrTupmIU8PrDyWH9SCUG0EcbPzkZATpRiDIPbeUcs/GAhwMmy8pMhWbYe3n
         qyPpg2zDq9HlTNABU1NXF98IfgLaowYD5WVVSdo/B8vlk1VHAqZ7KZaF155eN0VGWjvy
         T70qU7HPgrP6ffh/qjoxzTTReZ7sh3Y3LcHF/IiBl7C4jqJXAxAUoTsCwi6Fy8T3ATwM
         06x05BZg58V+YwZDvFqpQIflxQJEdh0xDNbNhqWABAsy6drFmaFLW6iCMv5tGJuOUVYi
         K2aw==
X-Forwarded-Encrypted: i=1; AKwUvBzzYdwFylFoaa1z/05rzt1UhM2eTdi0P9fZF6SGKDGRjmmTXMqDwgyiGcHeL7i4TuBQpp4U4XuYEDxJpDiv@vger.kernel.org
X-Gm-Message-State: AFq9FYIRH+gG4EX7/xqZhRuMWlgaCq/TD6dumTnmBpfqgBwEUto3awGH
	PCVLU+JeV0iy+XlUSyEMpfdy1naKyUTiO++pr0xNSym7bqByvxgu7VoaTIx/G1DT7qFxE7e5S7H
	T0LvbxHXXnBkVLsf0eRflBYl9sBZ/KXJ6NqrkwiaconeTpxmb/ePF/5JrkfWYgmB8YkG0
X-Gm-Gg: AYBFou3g8G1UCw/RTBEUGhVPvrEQVRQ9cpRS2ixboGL8YaHxuKM3LkjskP/c/sWcVgZ
	NDCiYRlJZfnfpMaYSpPPE11jZTcOngNVgzosxP7GFdieGD7qa1nmXz1r+XVi3jCT/p8nqUECBWZ
	2jLlHhprU6EDMH7Y4mrKEeNwLqL4jODHP0C2k86RILjxZrKGkFupsj26beKqbS+9eyKFL6i9ZKK
	imZ65TdjOxB7h7188br5IS276A3fcYHBsElyQuAPKsVOETm/K65N07xThCrABvRhix6Be74K/VD
	+wa8MHydp6HTPWl+r6eks3/u0qTjyo6BEjFYpxayM0cz7HiEo4CO9+UYU12lia2U5ubyh5H0LpU
	JDbfXaNZvqzqgkTZCRmS+iA==
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr2251363985a.4.1791887443566;
        Tue, 13 Oct 2026 03:30:43 -0700 (PDT)
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr2251358785a.4.1791887443027;
        Tue, 13 Oct 2026 03:30:43 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a38050sm571524366b.24.2026.10.13.03.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:30:42 -0700 (PDT)
Message-ID: <762978b8-72ce-4836-85f4-2cd3ee4dc5cf@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:30:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Add Microsoft Surface Laptop 8th
 Edition
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz
 <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <20261006-mahua-surface-laptop-v1-5-406fc042162a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261006-mahua-surface-laptop-v1-5-406fc042162a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6ace0855 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1YZvB5OX3fR3yb4sgf8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: dAN9nI4Jww-NOwoT5EGts-WipYYng5lp
X-Proofpoint-ORIG-GUID: dAN9nI4Jww-NOwoT5EGts-WipYYng5lp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX4Ti9DN6Ny8gX
 TA3WsAzfiDDXpGEpGuLG1x8qDe/eEJZj8mTf22+nPjIfmEHEFiijHk083dEIIuLSR4Zb/fGpTbn
 KDrjVIV1vwDh+f99N+xLncQlh0YDW3o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfXwFOd4TLQo6X7
 +EHbWcS5GsjxM0DLy4yh5qpmqOQD7eeNyOyt2cla0E+vvJfDcfMpvOL6e0lmtN+OQGbQQ1cX4u4
 hpKjP2pWyVAqN6AkCUjps6oVw9ucyFp5v0T6rFpI1IRkQvC2wtmcCdrrKgBGqCoUI1BhkQW45Rs
 xsBzE6BRAL/TemFtkQsoAhzJsxQ0CdqAACp+DbRMERGfg+T/tcptJKD4pOg7K+z/jXUc6oCyApu
 WjOBdFV+tVpJFLE3QkMNQyo2DBBcVo0zSBAXhF/w9hny9ZXSCezuPfeBK8u42WluhgTTZQ2kC1t
 PWn7Z64z3CevpL7FsD+DSjQDkbquiVTxPPAdH4BSy0pqeN1UcnDQu0ZLKeSV9cJ2I/DxCEk1XW7
 e44BPusnH2iWSkmq6AQn2WZiuWzUCnwv6XCtsTrLocT1atOdq1nMWbXsSQf/7UIvxfzlbXAibY5
 7nwyIDIAM12irf+C8HQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130041

On 10/6/26 11:50 AM, Gopikrishna Garmidi wrote:
> Add support for the Microsoft Surface Laptop 13.8" 8th Edition, which is
> built on the Mahua SoC. Most of the board follows the Qualcomm reference
> design. The keyboard, fan and platform profile sit behind the Surface
> Aggregator Module on uart22, same as on the Surface Laptop 7.

[...]

> +&mdss_dp3_out {
> +	data-lanes = <0 1 2 3>;
> +	/* HBR2 channel equalization fails, limit the link to HBR */
> +	link-frequencies = /bits/ 64 <1620000000 2700000000>;

Oops, that's no good - is there a chance this helps?

https://lore.kernel.org/linux-arm-msm/20260622-glymur-edp-phy-v1-2-814b45089ac9@oss.qualcomm.com/

[...]

> +&usb_0 {
> +	dr_mode = "host";

OTG should work just fine on both ports

Konrad
