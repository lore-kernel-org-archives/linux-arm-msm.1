Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484654;
	b=OL/X1ep/VitJEgfocOTovjLDARdcwCh/pa8Mtyazvgrup8Do4WdHYih5ueuCpQNDiqWX
	 D3yaFbEoQvQpgnRxLGeAj7gKwQDV3kRJkaKThD8tzNZIYIZM54Xy9UzEUL3RmJn8nxlYu
	 bcLbS2WchG9S1OyRl0QQ7vv//lkfzzLa5JZ5yJabpWEbqj9uDHNnb1MnYMAqh5l2uqSvu
	 AirT2eoHlcJMX5fnTzQc2zdebc3okrLj4g0HY4gYNLy1tjNi0Ntqj0XED2cdRgh3fstPK
	 kmaGxo0Wv3yZBRZOdnYbl9LGczuPAZq0WZaQAPyEnWu3eb2tX7c6MVJAYn7kGXgOCVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484654;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WTVUgaKTlYixZEjxttBBJ2Zx7JpChm4sT+rOhLp29zY=;
	b=nI0YeXUemuHT5UL46szFkaSqudlFYGu5BNb5qug7e4cbuoGJdzwvCaWu3spylhjrXbnE
	 Ek0sdjsXgOybQHoZuQUaVCKujG+HT2dKs4fneXmSWFojZZO2IF8t2sCPix2EztmbozcNM
	 EJx3zmFyNVMbv57aawnXuwj03q2KabUpyNLTgvnT1dzcK95etuREtd2UMbXE6cCBT3by3
	 LRXINBrIFiOU7LphTJomVDNOeJAZw18hy1Fq4b1Pf90+s0j8XAAgBrOQ1SWxwJkZOny1s
	 o/vL+w8XS6YbdS+IhwQOKrWOMrBMsIF2Dn0lWjrcCShiffb+YMdini+SwnG5SPL/cKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="E8/oxoUs";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bh7Xx15v;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DB4606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 11:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94DB4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E8/oxoUs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bh7Xx15v
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAfJwn1953697
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 11:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WTVUgaKTlYixZEjxttBBJ2Zx7JpChm4sT+rOhLp29zY=; b=E8/oxoUsZdrmfVrj
	4nLtKrhOG9FZ6nbTzxObxl3C52NPDUwzT3RfaG3E04iWVoEdRAY/kRLV3gDeErEN
	EdnDNNWUKtIn3rSFWi/DEtx8ft4NkBLHWf1tRkpoMnu7BIFRjjcFierZlUXwmJyk
	gf4DZWh/11dEiSkQnoEHU/53bTgxxLZcnC7E3qrzyIOGsqQ9F4EeV4uO3DwVZIA3
	DzQw3+jA8gzMwJZlJzBzEU0g732KilaA7gFmjrblYljRRA84fXaYZoF2rI8oJaKI
	3XI+02fyMmqvyffJesb5ff7L74yRdY2MKg+cf9B03rXLFCMiKk2jnmsXV0ScWIFp
	oLCJ/Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx3086v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 11:57:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93df7a9466bso33583885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 03:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794484652; x=1795089452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WTVUgaKTlYixZEjxttBBJ2Zx7JpChm4sT+rOhLp29zY=;
        b=Bh7Xx15vagypsXdLyaNVsJtq3yx6e59n5foGSvP/6iWwcLk+bri6CcDfKJNTi1ixrg
         8LHE+NogN6fDOKyiehtWnaToFj4sgJj65I+Q0ZIkNhFpDEKtIJdwC/vqahsr/Yum2FPA
         R1K8qDN3GxzzXuG43KiuJHQDyt09kEr6ME1qUmx6Iw63Kv3I9+hb+jO27RoE6XQQvTrW
         K5kbQB+mjp+VJU4gKbKgIqHX0m5g5IgEHPTfQCt0UKTH01E03hGs0biyFQax2350gQ8o
         JTSVAHOQWuAKvE0fC8EPjQtk1PxszA5PqkS0NjFr9zQKy7JOVc3JQBFQmrA730NySihs
         F+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484652; x=1795089452;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WTVUgaKTlYixZEjxttBBJ2Zx7JpChm4sT+rOhLp29zY=;
        b=X0SAoq7Nis7kch1WkL+anj9JkAVsd7F8AeKXIhj3fxR8taT07UC/JLbStP91FW11Kz
         jXNwHD6iuzpJQhm145TjIVZwtAZinIzN5CDU3NyZOOejAtE3ip+8MNZNI/LdYGXn2FLL
         Cz6reiZWCo8yaWfcpK8VSpVnBdkIBgUcHnj43Vf88oFxyQe02xI6GC2Mh0wecu6kch/t
         oPGqV/St4XmjaebKDfxYKqbA7XPe2WlH6FpMPVaTTYscjpJelDuhZ4fHlrREduG3SXAX
         cuNrD/Wp4Lf1Du5PXgum74gVrPEZ7Os8+IuVaRzwnqmvGA5p0RftrsuSClYXu+QuI6JX
         hubQ==
X-Forwarded-Encrypted: i=1; AL+hErE88eLZSGIz+SXVjQobdunOE8PhPX1SeYjKlxu/hxeWFDAm/0H4/3T8MI/Cqqbl29GamrGKWLx4HGK7K/RW@vger.kernel.org
X-Gm-Message-State: APuU4Z/aBoZOalM9G8lExu9fj0DOuphvEBxMwWg/wWkbWC2/ej40lu5S
	Yds2jQCqmR6eBlmceWelSo90BQyv474N+5zeILV3YN8Wd1MEica43CYs7Wya4FdO/ihg7Yu77z0
	svyp6fpsbOjUNIR44G+Dam/L0LHxJqXMOTne6BtFUIA/gPNW+D4dLZ5z3ud2vA6PQLBOe
X-Gm-Gg: AYBFou3p6lz2qPUQDkVmJ1TvHYL2U8qeRqkMqpJxfih6EpsEifj4QXWLpWhj76IE15U
	JwS0xoJp9wpWtKgu7NNIC7P6tbQnk2E2gepTYBQ8BrGbzJckmS/B4MTS1q9nQ3YI/IS4ut4ZFdw
	jccdUPzwKJ95zM1khBPfr2PhhWeexQBBsy8STFvN/X0dMDVmmWQYFvmc3Sj2zgE33GGwM+lojda
	jbB/Bb9bN91iCDb3/KNCgS+YqJqdErWQSUD1rPcERh+lZ0DPNQm0XKttoHolGWul5AaOgUvwz5o
	XxGexXj0lXBoq7hc/a+tfV2hl4WxcPvZsvEirJjnoyFD7A0CSQU6kXtI8SRegaTcYJ5FhF7RLhI
	BW1Mi4wKFw5h1x4D7vdWp7o4lUksRym+XJZru5ztlnXbh4PYrGJu43SRcd9kfNmm5oNtHfoA=
X-Received: by 2002:a05:620a:7201:b0:93f:740f:5a62 with SMTP id af79cd13be357-947b005d221mr898136585a.6.1794484651643;
        Thu, 12 Nov 2026 03:57:31 -0800 (PST)
X-Received: by 2002:a05:620a:7201:b0:93f:740f:5a62 with SMTP id af79cd13be357-947b005d221mr898134285a.6.1794484651068;
        Thu, 12 Nov 2026 03:57:31 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b75775fcf0sm3467729a12.0.2026.11.12.03.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 03:57:30 -0800 (PST)
Message-ID: <b64cfe8e-7274-4a8f-8add-ee1b60522c42@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 12:57:27 +0100
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
Subject: Re: [PATCH] pinctrl: qcom: sm8650-lpass-lpi: Force runtime suspend on
 system sleep
To: gopi.kanala@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261112-lpass-lpi-system-sleep-v1-1-438cb997e0e9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261112-lpass-lpi-system-sleep-v1-1-438cb997e0e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af5a9ac cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=GwXthRHL4ZZd3--2RZMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfXxt59aaAvX2Kh
 5/rrqdi6mAXb/i1G3TJ3525iIEiAlc1njEfVcLW5esgsKraq9N9p078n3an2DViMimaypLru+1B
 6y1PIGY1un5sTEI08Jsx3wvQtMILnRRvN8jCpinD1KbYc7jAZXraeNwo0oI7pi3w8s9yWvKAwpK
 UsaiN+SB08DgFOPO6FrvzJq10nH+Zw7Yz6Lo3PMfBuvwnY5L+uJ+dfjnuWB01gpEDexj7BVHejW
 tZuX0IOgGtJXGRXmoVTkUk1NU67XZeT+osKu/umhEibD+M6y3J5ch9qrl0MBM4t11VdCGksLf44
 V3WRoDDcJDSguoILWu9PI7ijDOQT44PRiD3nvaq14gmAnoAeAgdpp0179Z4LTjw0X9MhrwJSxdu
 6FNtEH7sAM7lIBZtMYnE1ObtqXM6imB5VmxBBRN30fpyE0BQ4/auuFQRFL9FUgfgBiJK6sAY9ut
 YyONSlGDqv/yhVKRiOA==
X-Proofpoint-ORIG-GUID: oTxkNhbU5U7rSzwLFBQa6CCDY6fk5_w5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfXwbil8IPZomLU
 lPFSExyUMRhj3qpiC+7pX53nNGlDXW9XTF6GuUxJdYesL4dEHXo1rO3CtURO2sInsUTGj3RkY/L
 jZ2dg0Wa03YvaGU7ExB+5Mj8t6oUtsg=
X-Proofpoint-GUID: oTxkNhbU5U7rSzwLFBQa6CCDY6fk5_w5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120047

On 11/12/26 11:51 AM, Gopi Chandra Sekhar Reddy Kanala via B4 Relay wrote:
> From: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
> 
> The LPASS LPI pin controller votes for the LPASS HW_MACRO and HW_DCODEC
> clocks through pm_clk and only implements runtime PM callbacks. Its
> consumers, such as the SoundWire controllers, keep it runtime active
> through their device links. If a consumer is active when system suspend
> starts, or is resumed during it, the runtime PM usage count the PM core
> holds from the prepare phase keeps the pin controller from runtime
> suspending, and both clock votes are held for the whole suspend. On
> Glymur CRD this keeps CX and DDR from collapsing in s2idle.
> 
> Use pm_runtime_force_suspend() and pm_runtime_force_resume() as the
> system sleep callbacks so the clocks are always released at system
> suspend. Consumers are suspended before their suppliers, so the pin
> controller goes down after them and comes back before them.
> 
> Signed-off-by: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
> ---
> Tested on Glymur CRD with next-20261110. When s2idle is entered right
> after playback, the LPI clock votes are now released during suspend,
> after the SoundWire controllers, and restored before them on resume.
> Playback works after resume.
> ---

Should this extend to all other pinctrl-xxx-lpass-lpi drivers?

Konrad

>  drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
> index bc7889c993d0..e33d4360c094 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
> @@ -220,6 +220,7 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>  MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>  
>  static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
> +	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
>  	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
>  };
>  
> 
> ---
> base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
> change-id: 20261112-lpass-lpi-system-sleep-70c4d2239abe
> 
> Best regards,
