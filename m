Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792983108;
	b=G6C5vSlm02A6eLeVFTeapmDc3XGwg248U24wGC8ZV6qZSBip9q9wGKJ4zbN9qMscXENy
	 MhgITaYrYY29ZRW+oaJ4adI128Dq1uhYABqqy4tLHB33pc5XmTZRtMpTaC6A39g0czPHG
	 I2BBPxtbQHKAevBECjoTTTU0siOawonL0OpgiiugCxtfoqyFHPjp0PbKNvAp8uEAaaR6d
	 ZwLUeLgtfcmIcdAr0782FSwtAzrRGvFi4vGK3qmzCe+qCLi2p/jOY7oxbj94H+HXwYFBF
	 PC+u+2jjfrZF0oq3HokMdLYRKxqdxVmuB5RxxhDMNQR2VQreMS2xkSICbJ36ycc7iGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792983108;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IEkv/QW2n3UCakr8PhLDY+azEONjvwOgumA41eOj6t4=;
	b=4FUHbEikUZnm0Tsop8MKwsfPPnppVDS/G1qU5tf6J3qges1u+9M/5f6+56siuRIk25KP
	 doQem/esBUMEQ09rGdoIDvI7jwQkyc8lIHFwNpq+4/tLuX/fd/Is9tBuJo0Zpl4RtSBfE
	 gJo8hbupBXloTEbAqPdaORsVX+NA8dPtZp/Gfl4o2T4DyRP6+Qg+q6JrX9BTTb2fkG4WI
	 ZICItTrrlRJjR9UgVqlyi6TFmBeiaEq6oHdVrrZS/XqwoUzL30JEigzNQ5PRZWLhaFniz
	 colIT8R2fvNRc4QOz445qg26akTOB6fKLBkT6WqY1SzM3H7i4hKTzoD6r0DtDK1o3dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FmeYuR8y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CF1Bh6hc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74A0606A31B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C74A0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FmeYuR8y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CF1Bh6hc
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q2KVRL3015081
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IEkv/QW2n3UCakr8PhLDY+az
	EONjvwOgumA41eOj6t4=; b=FmeYuR8ykUjaHHqWfE4YEIzloPqx/S04aCNCs7l9
	5k3Ozn894zbngFZATQeonfgl3dupQD3kLZfZrUGHrh2z42EWrokJ2Vu7k9P9jPx9
	Ib6CzBeJeSUerDQPH0+6g8COTgc/RRu4EFTpcpHa9lzlfziFIOMqgA0lG0zmioBu
	nJ9oiEg7RpIg7F1PtTLLEwrYLHAfgHV75+K/vsowKW/RJl1Z+lm4cvcc5LU2K/YT
	CNwH36yJXijEmMIlQQqCvWEcNR8C8I6hYl8lbDcjmRdpvJntuWWgCmCEZl9kp0RT
	s/1EM1uYAzAaHDgveHNG7oqticVZed1ssWdGna2ZpQfZzw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkmsck88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:51:46 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c902e0da2so4392358eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 19:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792983106; x=1793587906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IEkv/QW2n3UCakr8PhLDY+azEONjvwOgumA41eOj6t4=;
        b=CF1Bh6hcT4RHZGf7a0ynatK3sXT94RoS9qGapTidRFUQKp7wewqjtBIFLbTOLaeg+H
         lyjJD1/LWCvj5B6Mrtmcer8nuOyIaLcerSnopVmc3BML2aTzJDRBYriaMl4h6ROQyT61
         SU2Lv7OL+8mSNcJfUDt1yTDDmDahxtrOgJCVdnvjH5G69z+3/kNTJMKc+E6v4dvJMLFf
         M+rI1JHdwqQKlSdo1EqRMXbzRLnkEcW2znH4b72bL5H7xRRVJgZ88tv5ztZL2+sy92EE
         27eWaIYZDeyj3YuKc6NR8xlVvfw3jT9Mw5LkASZV9jCuXVFb9feNGBdzdqyLzr1ZgWA8
         tiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792983106; x=1793587906;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IEkv/QW2n3UCakr8PhLDY+azEONjvwOgumA41eOj6t4=;
        b=IUYdonWHb0ppXaGiss9I4tExFEE/McIDIU0BZBgaAyD9zZ31iSI1pMBVAmpqci4p/V
         +73sAWlIQAKDqL77B83OXStG9gVR+55z6vH8hNs0Yll1WxWAOj6SM6GfdexwSoecbx84
         acyGFYsxPUtANvWk42je5TuVUZTUJRzaofywDXSWLtymkgJyn2sOyFmoBF2gbohpeeyp
         oVjV+iN/F0nd18DXhW5uG3RMr446vBxFldsaZoQRIjnPu8WnJH5rvjIoM+rOS7J1XkJu
         N1ZnyOovMY6u+CoFX5uUYnCkoRWFONtlaQ+t9uKwohd7gfmvoEf8Vizqdi/4BzjCmxpd
         zQiA==
X-Forwarded-Encrypted: i=1; AKwUvBwtGBucLnigHtn+SyY0lLCH47seh6TgQE4+fTsUSUNoJkLr3SSJ3pr7KquAqrR1M9gvs1ozC4aX+1lYgaD8@vger.kernel.org
X-Gm-Message-State: AFq9FYKMimFKARSBE9LqBsIJzOfVqckEZoYX+i6nQynnM5R7PhhPl3h0
	/sFaew0oLr+wfoX2LSTujTgxyc3/KbBRKwCHQG14OHJhFN6Dmk0uIAt/uVIHczHEVtjwKl9zLeg
	8AVNAsgpsdSmjl7pLrR8kBSvqKMJ6GlAGlEeGdIvm8o3uPQrGf6zRwNSP3UCQlMz+4CVn
X-Gm-Gg: AYBFou14ZUWfAJGBta7aJ2Mow1wDeJUKPM9HFwYo0AE8v+gGatcn7xGfB7cvzZ9cDG6
	pxUz9btEyryZCy0AJoqNfeIoGc68dXefzNiRINGgTK89HyeK67yOFiUB+6vyX7msaNgJDdNDevF
	A/+d94xzmRe1xH7gSQp0xO1qjXwxwve/9pUUG7xXwtR7IsDnLglU7MGzlAxRmkXC/qMBBT2oXX5
	ct0GP0KuQo6tMbAzOeHSKDiA8uDRD087kvWloJQOD3j0FR2mAi6+n72sL3u9S/pyfuQWfkEZcBR
	1QqbKlCLnWSVkcQjcgm6L9XLVLl2JDGrqJBZT383/iw34wYF/lH4S942WC0rFF/HjgBXa7WhqVR
	M9x4/pdlAJKnB4wWRzbCRV6UKhYc4NvB0xROIJvJvZnX0PlZxhZguWmEU
X-Received: by 2002:a05:7022:3b82:b0:159:f192:5290 with SMTP id a92af1059eb24-1993505eb32mr8885756c88.13.1792983106008;
        Sun, 25 Oct 2026 19:51:46 -0700 (PDT)
X-Received: by 2002:a05:7022:3b82:b0:159:f192:5290 with SMTP id a92af1059eb24-1993505eb32mr8885698c88.13.1792983105262;
        Sun, 25 Oct 2026 19:51:45 -0700 (PDT)
Received: from YUANJIEY2.ap.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5937dsm20442306c88.20.2026.10.25.19.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 19:51:44 -0700 (PDT)
Date: Mon, 26 Oct 2026 10:51:38 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add base HAMOA-IOT-COME board
Message-ID: <at7AOnFJT94NYWk0@YUANJIEY2.ap.qualcomm.com>
References: <20260727070758.528-1-yuanjie.yang@oss.qualcomm.com>
 <20260727070758.528-3-yuanjie.yang@oss.qualcomm.com>
 <ebd754fd-96bc-4f37-b390-35a952dc6328@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebd754fd-96bc-4f37-b390-35a952dc6328@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 5khYRyGlC1D6RulqXhAQyzc7zTa6jdvT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAxMSBTYWx0ZWRfX6QnYBJHT262g
 LFXSCrcKupqLMyexVlz2wEK64YfOiUjujmDskqWHqZqoYpJfiQV58LYXEB2FQY0ss9c1Fo4omez
 C25Ld5uVP7DU5soji/9aGsTXFmw9sKJ6UcJp+3nRebOmgJfqnoXsWEAgQFczZR4b8Iun6EexXLI
 4mGHKCta6zjSRFqrvTgpvg9r2mfYKHG8/zDgEna9GGRbgTksogBXpuTVw7mLW6wrJD5c+0bePvn
 ZVY5yFhCaE5OluduZ4FF6UQtb6viZ9osfrChUgFqyorneYyHp3i7ugdQNjKGnSRZYcIO9Qj7kmO
 CWDW6+nxh33I/sS7X+XALI/c6Kt/EMdzhsDnaF7MrsfNAz7jGLxvC/eb3/pcOveTPgO8+ynpTDj
 Rca4sI4/pkz0Qw6gGEt1KXql37wwnKu/gyBDoL6/iinR/8zNJJmxKaqWVY4XVws/2omJDxEE9/d
 C+xLoyt/SwYvxcLfdJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAxMSBTYWx0ZWRfXxLrO6Jyq97vV
 MExXdb7yh8FQx5EKaiynKP3Zmv5Ls21CzvG1dd5aY/cPMy8G8kh2sEE/pANGX4nEnRQDXYP7kOy
 iVsqn54B4tQXQwyKFXkpxnP23O1P+gY=
X-Authority-Analysis: v=2.4 cv=UqX2pOwB c=1 sm=1 tr=0 ts=6adec042 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TJUqZQk6AAAA:8 a=UhjQvpYGxMY_E1aW340A:9
 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=Q0W1slMkcave-rSCEGgY:22
X-Proofpoint-GUID: 5khYRyGlC1D6RulqXhAQyzc7zTa6jdvT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260011

On Wed, Oct 21, 2026 at 12:18:39PM +0200, Konrad Dybcio wrote:
> On 7/27/26 9:07 AM, Yuanjie Yang wrote:
> > Add the initial device tree for the HAMOA-IOT-COME platform based on
> > the Qualcomm X1E80100 SoC.
> > 
> > The platform consists of a system-on-module (SoM) mounted on a carrier
> > board. The SoM integrates the core system functionality through a SiP
> > containing the X1E80100 SoC and its supporting components.
> > 
> > Hierarchy:
> > 
> >     Carrier Board
> >         -> SoM
> >             -> SiP
> >                 -> SoC
> > 
> > The COME SiP hardware is effectively the same as the SoM used on the
> 
> "is effectively" or "is"?
is,

My description here was inaccurate. I have revised it in v4.
https://lore.kernel.org/all/20260806-hamoa-come-v4-v4-0-706021d4bc8c@oss.qualcomm.com/

The platform consists of an Advantech SOM-6820 system-on-module (SoM)
mounted on an Advantech SOM-DB5830 carrier board. The SOM integrates an
IQ X7181 EVK SiP containing the Qualcomm X1E80100 SoC and its supporting
components.

> [...]
> 
> > +&ufs_mem_phy {
> > +	vdda-phy-supply = <&vreg_l3i_0p8>;
> > +	vdda-pll-supply = <&vreg_l3e_1p2>;
> > +
> > +	status = "okay";
> > +};
> > +
> > +&ufs_mem_hc {
> > +	reset-gpios = <&tlmm 238 GPIO_ACTIVE_LOW>;
> > +
> > +	vcc-supply = <&vreg_l17b_2p5>;
> > +	vcc-max-microamp = <1300000>;
> > +	vccq-supply = <&vreg_l2i_1p2>;
> > +	vccq-max-microamp = <1200000>;
> > +
> > +	status = "okay";
> > +};
> 
> Does UFS come stuffed on all such SoMs?
yes, UFS is stuffed on all such SoMs.

here is the SoM doc.
https://advdownload.advantech.com.cn/productfile/PIS/SOM-6820/file/SOM-6820_DS(052925)20250529110758.pdf

> > +
> > +&usb_1_ss0 {
> > +	/delete-property/ usb-role-switch;
> > +	dr_mode = "peripheral";
> > +};
> > +
> > +&usb_1_ss1 {
> > +	/delete-property/ usb-role-switch;
> > +	dr_mode = "host";
> > +};
> > +
> > +&usb_1_ss2 {
> > +	/delete-property/ usb-role-switch;
> > +	dr_mode = "host";
> > +};
> 
> And this sounds like a limitation of the carrier board more than
> anything else

The SoM is a self-contained, pluggable module, and these USB role configurations are part 
of its basic functionality. Therefore, I chose to define them in the SoM dtsi, consistent
with the USB configuration in hamoa-iot-som.dtsi.

Thanks,
Yuanjie

> Konrad
