Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219593;
	b=A7PbFVrEjqJr2xTpn8BU0Qg5ZljatqnEg9Kbq7JTbys5pv43dInC/GMBxWaC/vNxV9X5
	 0USMqCvNLwWUjCsQfLM42xZXVvp2QVaax66K7/cBXbBMfCQMJhgR72ph4SWrDHhl7E50J
	 6hGwfbpzG44TDt0sVIFLenfvxBAl2kTdpyZjiiXxyX74LOnwwqRJ+1BlvB4Bumr00Y5tl
	 4hFEaJGMwu2JnP/40gOx1GAnbov0zy0KET5cX7G6qRkH+E+kboo7B5W91WT5nv4Jk73yB
	 PGvDpvsr0lzbJUFeTaccCPqpzYgGdXsRLDbcz51Pcd4GH9rx1OwTypCn1NDiLM1lGKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219593;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yqUT9ShqE141fGMH35+gRcVtxZeKmd2zqhiyjQqkbnA=;
	b=3r8mx11GHjby0LVGHq5zzInRtMWh7xGZZ3BKaq1qkAu0vIBb8n0ev+beFMfs0lx1+9OR
	 8pl71xH//q/bEkgJxFAurQbQyKQyq7VStkKkIUgGDHRsIY+OnyU50VET/DaNH7w/GNCj4
	 ghOxeyDED0D64p3lZQYbR28+Q/lu5m9szHsopJSny913WA6TZKlHHUE9biONxzy5gNzjv
	 1lde6ldPrRHeC7CGa8Uxt5dlFUJiCn1QFw4ZPkkEKQn1+IpBhKO5HNM2HHuhYsSuYRzoL
	 Oia2f3chIlUYxT1pgO7t13Fy8MruS+Unfb6SInoYu/Ndzm1qHtJyc5j03zixaD4FuUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lb8IhuSf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lr3nq9bZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696A1606A325
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 10:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 696A1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lb8IhuSf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lr3nq9bZ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99usP0550769
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 10:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yqUT9ShqE141fGMH35+gRcVtxZeKmd2zqhiyjQqkbnA=; b=Lb8IhuSf2GJlUU39
	6/SxUsyX1AB986J1wjCqXviD6ihPbVZBOgiWdgTU5gEC4GpIdt/n0tbDKmadVgyC
	qLFjUGVRlcEEgawNthi3DI0lNwZzCa85V6TMRCn/kOrijcB06Iu0cDdVazgnAIBo
	4yxjCqyhYtgcIwHJZxARKc4lTojNE+PhqbGG6IIn/VXLzIc5vbVTlJCMVprgeOqM
	KSAWOGgLvFAfG3N1pMu4Dbv0kxydAp/iV+ZEmqHVa1K1nFvoJOnLOETK2bMV34YU
	Nf+0TRyl4XbJa32N2hjLr+HIoiy99C8q0R2kMnkHXrC+99S+FrPvZub2UzHPxmRR
	Ci40bQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm2pk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 10:19:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2bdebfc5so20375985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 02:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794219591; x=1794824391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yqUT9ShqE141fGMH35+gRcVtxZeKmd2zqhiyjQqkbnA=;
        b=Lr3nq9bZg94VEu9/z2Z3tDOXCJpu81ZnpHcNYn/XKI954MdnjBDMvlO5ub7xp9FOUM
         Q7ul39xYgXeKZi1X6Ah7l4Uraps93OZL2jbiY3wpprOAt9jbJo5P1Lcd0NUjagz24E9C
         jTyT3Q1FUL+MeazWC0B6luX+gLxDoy85BND5TdQQGyVdEvkyw5zbIdPhyRnpEEXBeo6t
         fZhTZ4+WrxiZtPjgLLLF+rb8lxTk4J49oBRT0TNs88e0f/KqewQ7CFJfHW0VZNC+73pA
         Leew7wQDniSeXsQd6D1hWptVNg5zU2D0r5UQTSpRW7pRFIUqE3f+RYdEo4uXsuqYOx97
         tnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794219591; x=1794824391;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yqUT9ShqE141fGMH35+gRcVtxZeKmd2zqhiyjQqkbnA=;
        b=K5fkf3G+PIhsp+QBlKzCh7DEfzprA0y91Df3VtfZr3O4dMFS9ZkHGUpDcF0x0QPeXY
         QCbB9nwZkjRyJBTKYcrXtgpk1aP/q9KJQBnX13KM/s3LN22ttY/ulHRt6YxMvtKTLnJi
         wPIuqJyzr8AtN9adETMnfNbGc+PA+YlK0EZiZnkhypt0d7Qftc/Se739VvLS8WSRlRf6
         HO/9rFYCBkZ/+CyGHAmPb4xx+nt9tNOdTBnKZ3W/LcDw08sKwC81ee2FStgEyDPVkIO+
         rjGgpJO1qaWba9+URnmHjMfRHkFp4I37ScJVUzsWFtJDNxfxNjeY68bADrstS2q+NW/v
         62OA==
X-Forwarded-Encrypted: i=1; AL+hErG7j8n+cxguzyd+yTDjZpcHN1pa7iUMNvfi3p5POEQyuFU0qigHJv96pwiu5UqyzF08TtMn7u9mcYZbzJGm@vger.kernel.org
X-Gm-Message-State: APuU4Z/savgi2JV/Qvnv4VdpBJ6tIu++Xh7wbsI9NcJFJez5+wkyFwC+
	20+fgz4MBddfsto8JxKBkrIR9pyMeY8/Xks6J47m9j7MPO1t7AAlijkP3HgawhoOb8xTjbMGboM
	CTKhq4iauwXJu+SuzExAUJ9hIfMV5DWLvcrloto5hau81I5WHtnJoq+o5Q8gyBV9n6e0V
X-Gm-Gg: AYBFou2rEjk1XXt6+ZJ50yoWCG4Cz0WI+UtZSzwUGwmY9ZmytVTSJNi6X2e9ForJIdT
	t6k3H95MqcZ6tq9T3Z1SuiAxS49BWlvkcb6bElyNifOJNnNhuFtJxsud3Ur+JkCnxjCn2r4uzeU
	CCd7QAjborBtmMVdS9k5PlrQy76WYP3EQyq4qVuz0/2J7IURu4v0uyntLrEjH0098yqxvk3373k
	HyC/EcPCYFZ5Q6LnMXooCKniqie14mZb10OMmBApmnOMR5Cu4bMuntT3CRHjFLTPPNMzVChhOhw
	3SrKAiAML/s8bQRtJZXcz5755Aq4LIuafDGQOUuGj2l+exmHWgtpRSWTyDd0JgpXZ2NZq4KWXYw
	iKsSSPA26RoZyldNUk6wV/8bfS7zwx3C/tGP5OoYJPTvLSJEXKFYldAbjQzC6UUDCUvzgUA==
X-Received: by 2002:a05:620a:a897:10b0:945:dc04:c4b6 with SMTP id af79cd13be357-947842e6da9mr510547385a.6.1794219590598;
        Mon, 09 Nov 2026 02:19:50 -0800 (PST)
X-Received: by 2002:a05:620a:a897:10b0:945:dc04:c4b6 with SMTP id af79cd13be357-947842e6da9mr510545085a.6.1794219590095;
        Mon, 09 Nov 2026 02:19:50 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a4af502sm146889866b.55.2026.11.09.02.19.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 02:19:49 -0800 (PST)
Message-ID: <7dae5091-6d51-4bf9-9a94-bb2d98e2ad28@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 11:19:46 +0100
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7:
 Describe the Embedded Controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
 <20261107-t14s-gen7-ec-v1-3-f4a8edaac447@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261107-t14s-gen7-ec-v1-3-f4a8edaac447@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX/fm6Ic3UGtEQ
 ROnIC/VAxJYEX6oTrd4i4PiIOq6RgUMR2aXugbRWchV07RCZH//ehcGrF8SxxzaZwqh3s8qHUbW
 6MhOJKfkXY0s0nd2e36PX7G8y6gfmvc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX8OTeTUwzt8zj
 QamoAOlULEwYTFxrcuzlXewNwWZ+OQv3khfWxyjE73M8ek/DDlLgzDpzOWJlT4u4IZKgMApV58G
 LTXnGA9dGL8mDGJy8CKfpLmob3dfoBvqwrvq9KSYzj28C+vyKLWcG5Xd+dcAHkBscUBnHVcr0c3
 OD/wJ02rIPpxy7B/2TeNvJ9HnpYQ5dIjJXzR41MHbBydqtBVtpnTZqYsFDwTMj7HUppSFjI4Muk
 hgbGbQT4sVkprwICkE/68cASQSIuywH2w3L+a6h2jTjJ0f6HjrTLVbCZuErDx9KPke1DMxFRR/0
 lgrGouXso4bIB1sGQ4GvnmX/ujh1E8WQMvxC7SNSTBNP2HxEOK6B/j7ulSec9YDpZpePXdyEto2
 N/8NuSLbzMj6OqcioySgDOqwd4f2BwcUTxc/Vk71QNpXUQdpoq0/7KITkBST9j4bkADnj4niPk/
 4r7Q76PLlafZzbw9ULQ==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af19e47 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=J3gOo0Kj3gncQIyMurkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: jNUviEP0MpinyEfxJVsYr2YzVDljd91I
X-Proofpoint-ORIG-GUID: jNUviEP0MpinyEfxJVsYr2YzVDljd91I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040

On 11/6/26 11:01 PM, Abel Vesa wrote:
> The ThinkPad T14s Gen 7 has its embedded controller at 0x28 on QUP
> i2c9 (ACPI \_SB.IC10). It uses a different command protocol than the
> Gen 6 one, so describe it with the Gen 7 compatible. Its interrupt is
> GPIO 66, as on the Gen 6, but the firmware describes it as edge
> triggered, active low. Using a level trigger makes the handler fire
> continuously while the EC holds the line low, with no event pending.
> 
> This provides the EC hotkeys, LEDs and keyboard backlight.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

>  &lpass_vamacro {
>  	pinctrl-0 = <&dmic01_default>;
>  	pinctrl-names = "default";
> @@ -987,6 +1005,12 @@ &tlmm {
>  			       <44 4>,  /* TPM */
>  			       <139 1>; /* TZ trigger */
>  
> +	ec_int_n_default: ec-int-n-state {
> +		pins = "gpio66";
> +		function = "gpio";
> +		bias-disable;
> +	};

nit: please keep these sorted by pin #

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
