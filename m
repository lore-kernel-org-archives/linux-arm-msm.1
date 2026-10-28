Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202040;
	b=bdo5ADVlWXY9clk3NJ5d6gry74Tbkb7opwhgjaZM57lH8P21miH5SLfTf0r227kwlUv6
	 9q+Iyf8aVJOjYJxefaA6QzufMctIM+uhI9Sg3SIjOaBOZc1rQBhhlos7N8rChB14IVLRB
	 u+CV52z3zZ7i6sNsLZy8HMN0EmvkmQ7G7u7OpH5uC2Ua4QX2WlXogNRsustnLa8M4ftjP
	 k5HEGJVf1wJWyWRc5TapAJsg20sMVcuEdW5WfOUlszXsiX+y29K+rIy1NRmSbtCOznBvY
	 BT08OZ6sJXS5g7lRHkDczSLzcAiS/aQSo6qHJ83LhH+RwNnWl6G+/TAN9wg5mXCXOcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202040;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1kMhiK54X0SbniX8ZQXXSsd3G/Jlwe3p87DP8IY0FHM=;
	b=gmKz5cJuEkujm3n5rAKL54c9P2fdw84ZRmeJ+iPDukahu/4r5Djd/JLxe8/UxXMhKrbf
	 HmYkZ1uuAp2zBLuxVNLf7r6ezJPHU2wxquY97CqLebKdWlkBpBsfC4xvS4ipPbGs8stSO
	 sNyxaK1JPjkUskgj8Z1IvspwktGetCZOj+V4GQeoy/rDeteh0lFqoxxhEW1YsXJgDuyOB
	 3RTpDhvFvxgdzP9Z3Jt4iOvJlMnO85zidtVWMBa1FqxyNhlmJpiVHiAu4RW8jW1kIddSE
	 la935UPpLT0qm3F9bHHXDUbsDaxNQ62M74RZTrB2G4P2hGBjhk/VdTox2KGOY0snolw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PgeVx0VL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a+ddBu1M;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568E0606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 568E0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PgeVx0VL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a+ddBu1M
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SF9uQM4164748
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1kMhiK54X0SbniX8ZQXXSsd3G/Jlwe3p87DP8IY0FHM=; b=PgeVx0VLO8vCzUwF
	tMyB3jGpL9zIaslqt9um98HscVyltNYVrwW0dilEmNtKsTnJt62+cABWgcPbPmJo
	AL3MyXGHXLp6wMPZ8tyldAQ1hr0sCI0EXMdYc45CxmoQRN4XZN2zpmU42V3F9+bN
	320HdnEW6CZTKekbDavuLpIRS5OZPdA23aesX5ZmtRnzgB1PsSa7gpkerev7PZL4
	xF1MBg5YzqAic3+6elLEGqqatEMNOk2Mm4HIz/TKqnW9yfV4jNYx8qk8My3PnSM9
	WTAWEzs4hDR+lxgab09+qMpXVDQjdPHauknYK36WJQHTumyuDnvlwA6tQALKvx58
	I6O4Qg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtngnfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:40:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so203344085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793202038; x=1793806838; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1kMhiK54X0SbniX8ZQXXSsd3G/Jlwe3p87DP8IY0FHM=;
        b=a+ddBu1MXZQ0eIed2kPyglRdXFMyk1XRdjz5WpbC1TOBrEvkF797E0SuyJxKyoytw1
         jpR7D4X/1NETv41nLSYzuYBRVSyroejKWdQp4i+ZKwbAWyLDfIGgqSFK/NXvQmKDpDtK
         qshrakXiMCQ/jbZY0d0ZaWuYY82HTKsS25ZBguoAZwd0PpcWtFcNKV7d0AScbWZsDn3H
         fRNGr3O9FVC76EABQ0dxxoIqHGU2HpkZKcfTE7AnhjzrGWVh854HdD8UMFJxgt3qE/qk
         t9dZIJsI+J8j8R7aNBSrNkGqSD+sj3FDerXTNi8ouD73IwiKlC9SDpCiNRhyLgFwHcmH
         LcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202038; x=1793806838;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1kMhiK54X0SbniX8ZQXXSsd3G/Jlwe3p87DP8IY0FHM=;
        b=Zgx5VUdQhF2t18SimuADdOzf6orC8K5crrs7JYnONP1nY84BaF1lri+SgvBrp46UHS
         Umo+6VKoZUCub8jHpyXxOI3+3DkGdwBPYcHZoXY9IOFB97rdcpOkstt1XZ8CXKc+5dYz
         PJEt+gNYiiwyj+fELW3cXjqiL1FGUvAMiBJa/1bPmuBiogPg5V7z7W9PmY1jEZXiELcc
         nWZ/ps0FghmLZ1a4jp7D43rMTuCZnoo2/pzRaw0k48sP9AyJwv8ReKNDEwexASEc3rZM
         IyZSnrMdP3vtZohDlJd6hlMs/Vx6wk00Se3q0mthDTmDrXheefNLqcTA28ClEb9uhljo
         NbLg==
X-Forwarded-Encrypted: i=1; AKwUvByv5ePqHqc7ldHnHLsqzy9lw+VSdVZbvZxapusdWHDqoERCdZ5Gohd79nJ4AHMKdRkNKtf5QSawYyBg9Mgh@vger.kernel.org
X-Gm-Message-State: AFq9FYJHohIuPBJc+7tU9FYgSgGrdA4xjZepCEelynJu5HUGFYdcGcJ+
	4PpVSbfhneqV3VWbpB7qy/xZb64M7Vlgf3IfriVoUYsbJLj+3An+NTPZA86blwbPEBJyytatLDJ
	gWIgpFCo4rbgFN2jDJKaW/2vkWK6+iRmQPTCQpPNBQPDrj7uhlzTTrpURKrzNqCah8GNh
X-Gm-Gg: AYBFou2PHSGT4toSb67UrRdqT7fOty8yhP6S4EgWCUMWDrkCbawXo9JVky1Mj3BZJWt
	OEqKzbhzdwnoO+mpCT6TdrR0v4NLUeb79SZi0cp7S5Jdcu1YxN3T0sE5Jal0Ajm39iQW9f7VD67
	Sjiygv+zx1jQHwNsoiDOJsfZKaZYXuuC6jwrLMLBbvGVkGzf5xjxjM1qkDFvIIS5OedQ7hB8SWd
	I9b4zgvY6d3eV86CytC0GLer3M9T6egCqLpaTADLpLpphnC7iOBYn90wV0jhxzo/GahcQCfKtEv
	pofwrKno0PlJpdBfQ8UG7yD7TjrqafokYL/Y6rNP6So8/YqHJvGIIWDKufGdriX/4kwYJ6gARpE
	Ltu2+hARFQ+HjJvOqRc7JmJ5g8rQyuEv0ZyUuly6P1OgMig2L2bwdp4o1kY2gGboJzw==
X-Received: by 2002:a05:620a:4723:b0:943:eb21:cf25 with SMTP id af79cd13be357-944089436bcmr392008685a.12.1793202038361;
        Wed, 28 Oct 2026 08:40:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4723:b0:943:eb21:cf25 with SMTP id af79cd13be357-944089436bcmr392002285a.12.1793202037535;
        Wed, 28 Oct 2026 08:40:37 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f41895fsm674315e9.5.2026.10.28.08.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:40:36 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:40:35 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: =?utf-8?Q?S=C3=A9rgio?= Ferreira <ferreira@se-rg.io>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Ettore Chimenti <ek5.chimenti@gmail.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-medion-sprchrgd-14-s1: Add
 PWM backlight
Message-ID: <wb3fxm5mb6jcmf3cr2djmp7wkjuowhcdjjb5safy7xymq36wkw@qsrlcebvxf5p>
References: <20261025-medion-sprchrgd-14-backlight-v2-1-bf2979485ec2@se-rg.io>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261025-medion-sprchrgd-14-backlight-v2-1-bf2979485ec2@se-rg.io>
X-Proofpoint-GUID: UkWk170Ff3ts2P4S3niMQ07hu6pZjPL-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX2zpGg/KqpxIJ
 4mrrWoh5ULrlH1KItyXv5ClSWwGd5M2qT9xAhqfiJ7agoRyNmSVOkLJ4BDdqKiLaZ2F6EQRwuL5
 IIY9e6pzeYNlX53GMJ/J0YgwUXpZoY9+4FMAX7eYVXeih2h1lS8RpJWPMJe71m0u+dmR0Wwkm6S
 18SiZL8q4DjaSQOx09hkB5CPHVgnuo4ptY5KmUpqpK9nQFsLGQ2ceW1I+ZyPJ3z9QAFgXplh9VG
 mfOQ6rUhaF41eokqyhiS+OOX/MIZcALVH+RKBkcK1OU+ZLZtZdZ0ovwygyFRyZ8PsZVJ4sYffm8
 MwGP1O2i+nJYWNrgCdgh5u5nwS/RBuIJApdpHZLWrgtfVJdr0oewuhN/sXxsw26JUSKxFaZtGHR
 13fFcZvSBsi7GDXQa2pERh3h9Io8S4jcBBdp2X4V/z91BuZmr8MHN7Cl6vDXTC/lYPxMTQaO8dh
 DOq2/tkcF5dNw9LJJ7Q==
X-Authority-Analysis: v=2.4 cv=c/A+0h9l c=1 sm=1 tr=0 ts=6ae21777 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6K7-PZ8FUrUA4GMtlBgA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: UkWk170Ff3ts2P4S3niMQ07hu6pZjPL-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX2lKFHQ5dlj1k
 fJ97X/aO1dr8GKgpimYmwoMSbUY6QPMhvXsMctlV8+4Mt6Jy1cNdgMTDhrVI6W7WfdpFGCiH9Wz
 soD0fGLAKmpnC4cQFumLS+c9UnCXJwY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280062

On 26-10-25 08:51:26, Sérgio Ferreira wrote:
> The eDP panel (CSOT MNE007ZA3-2, IPS LCD) cannot have its brightness
> set over eDP AUX. With no backlight phandle on the panel, panel-edp
> falls back to the DP AUX backlight, which registers dp_aux_backlight
> with a maximum brightness of 0, so brightness control has no effect.
> 
> Brightness is driven by PWM instead. UEFI leaves PM8550 LPG channel 3
> running and the PWM output configured on PM8550 GPIO 8, and drives
> PMC8380_3 GPIO 4 high as the backlight enable:
> 
>   pm8550 gpio8 : out low func1 vin-0 no pull push-pull medium
>   pmc8380_3 gpio4 : out  high normal  vin-1 pull-down push-pull medium
> 
> The panel configuration in the Windows ACPI tables confirmed this.
> (PMIC-controlled PWM, PMIC 1, bank 3, 9-bit, 2 kHz).
> 
> Describe this with a pwm-backlight node: enable pm8550_pwm, add pinctrl
> states for the enable GPIO and for gpio8 func1, and attach the
> backlight to the panel.
> 
> Tested on a Medion SPRCHRGD 14 S1 (X1E78100): brightness control over
> the full range, brightness keys, suspend/resume and restore after
> reboot.
> 
> Assisted-by: LLM
> Signed-off-by: Sérgio Ferreira <ferreira@se-rg.io>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
