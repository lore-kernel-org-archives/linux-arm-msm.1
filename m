Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02AB3BC68E
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 19:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784834337; cv=none; b=p8DY1VGzHQSDynLaTHK6Y2PR6d+78Pl38B4tycVF+3dGgn8Vmv/8V7rXwB83RwNdSYX90sZefIeZDnUbuMfLJj4pE4aglMnWgPRkItRtHMUvN6ELHTD2q3iCWZAoB9x3kS2O0Ln76j20Ya14UgiBD3VfcoiWyribjZwiwFXX1xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784834337; c=relaxed/simple;
	bh=62MH3ErigjlRTtTQVAj5oD0cUicYxTuv6jKO7iogfzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o8LVSBQLseHXLbei6skQUlPdXN52dyDeLFEVSNPLLXcVgbUBlMXF3apDSr6Bo8CvR809FC8NCMaUwKTNdCYJWKb2vS6oxdHyPe0efk6lZC2/PQRe8Wn0t0KJmxG34LNz2XfFxyCWikRq5DUgtRTkJoYvzN4VePJyiJfgw1XNPx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rg+n2qdR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YsiX0/aq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rg+n2qdR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YsiX0/aq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NIm2P8828057
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 19:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zb/ry0UeGYL5zv8gKcX/rJF/
	g4FlRmPl6+5B6sl8am4=; b=Rg+n2qdRlrji+8eKrEkcLKblsiF29tBmbvoFuEY0
	O8YbrvjNqa68nZzJSSOMWGeeV+5kWr4HLHAOmGRo5sFatVB14xtH65IIz96PsP8V
	rnyrAFFTuyZ7WUSmmLZ85eBgpZHm9c7hgsjwiE2sNOZxUg8XhBb2IOOzZgE5y8Ej
	Gk6NpDlS4UB75CTcCROpfDbolcEl8zjMDt5hCCX2yFG2dlbmRen1ibjB6aF3XCM3
	LcoCvMS7n+cKv8NlG3xTKQp4aGpY/kidtF+j3Zd5Ju8/tKZYDeL/Mbhdcuhjqwwu
	l4YyyxztXeR9AMFuPvcCev0uEknQniEqRoOcz/eutt28LA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqamrf48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 19:18:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-522de3c645dso27015401cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784834334; x=1785439134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zb/ry0UeGYL5zv8gKcX/rJF/g4FlRmPl6+5B6sl8am4=;
        b=YsiX0/aqGlVzAJROBoSepu82BOssR11ETWAqpkoiC8YR3+TGNn7kY3eTf51DRJ0O2N
         Rb4P5L7kw/euvJJXm8Fnjn/ImMafnjEA2zL/GO1ipI9czOtztSwYbzYoYWLye27u5lYJ
         stQv6H4azhSQQwkUakrSnSoZvan5rOkaJLXR0B8Ia7/AA+Wr3ym22pBN6CC3zD5fwAiK
         XVikpQ7FtrACyaGPiTuO+tXTk7ENGIoXNvpes9ZPCr7wPzR1CsMTaqU+MPz1pQv6n1wD
         UulvVgZaUlm5G8Nj06i0uC30gH68zannwSPDVosBCIv7LXPuiiODthO+3NRZo1r5B3gH
         ZxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784834334; x=1785439134;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zb/ry0UeGYL5zv8gKcX/rJF/g4FlRmPl6+5B6sl8am4=;
        b=fYH3HwLgYagbELAokc+yUtAMlAYlcfOriBrue9TAQF0yIPdTu2hWURm2XfQIpe8UgU
         hI3jAjmVwXoPTRKoWlJSGtAJHR4HTzcfS6uaRTEXxLS2LlaVDr08J9peq5ClogbZaH9c
         uDpZedqsASdCBZ8jIk3ze7KhuD9M78QhARlqsgrnsKOHvXOiF++sd337sCLgCUKx0BSY
         pVPouLuXhkRTh53sMLrHEirDYG/mPh2o6AuB+8qXLr9dImEEvNZ4J0kwVKDnuj5lea04
         n/X/o6ubN5drXAdD5IDS5q7Tcrk3AdXYlZDKVWwZ9/kf4AbKlV7lLBeEBVvnAWN/4YV/
         T1uQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRYSLGMCjDnb+he6IfcQr/W3GJwGpS24HODCbfiFiqU1rlcuom/RFEHG8KLYMiUGezkGClGUT+xh4A9z+x@vger.kernel.org
X-Gm-Message-State: AOJu0YwEVjPStCX9noo/9Lq34JRhwWRIB6mEuCUc2Ny9mM1q70Z6OoLi
	se4VMWGmQEQls2IS81UZdBVKgdLamjTxwtcLSIHwgpLwKBVCjDM+A/Vk1hghyVRgHMgttfT8pNj
	uogfGpbqUwyKQ3+arRIb6140BGNTGqyZuWqsnyv1+Ntnpu6CMOngRFlQwv9W7yPbJx/Br
X-Gm-Gg: AR+sD108XulnJdD1UylduvhgbTp/OAcqI+GdLiJCrUTdKmnUrGpF2y1SooPFXk5XJ43
	3Mzy/31oq5uk7DQi5v1tb87aZt+Cyk23uu2KrpKmxiuqlgJ91TyN0+h69yuooIUeAoeiRte3NWK
	FQlwu2fXaJxz2PpxotQis4vLOQmHiMFtyW2K1ukxQx2CARwNEMPDvvWz44eV18kNoY+Xvc40J6n
	03q/U59trWfIsj6/uSHnP4Ypax9gG6rzKusEfENHx9zf2Qvgnhtand6xgBeXtUaO+nAh5V3Tx7V
	sJ8MS4yKsKttEm+DslYg5hn1Dv8v9WAzpKyhZZudvroC759Jv+qKGlPmlI7ZPgQ+KzmVvkqDbgt
	pP/CIGlog9CoGGbdVfKf1T9BDP+353mp6IjKkgp6TE3h+n061zmC6vl4ldiv0MT5bDIQj1sFE8i
	P3qffV2jZuOefI3Q==
X-Received: by 2002:ac8:5c83:0:b0:517:9f43:4732 with SMTP id d75a77b69052e-5283ddd1608mr44395701cf.11.1784834333710;
        Thu, 23 Jul 2026 12:18:53 -0700 (PDT)
X-Received: by 2002:ac8:5c83:0:b0:517:9f43:4732 with SMTP id d75a77b69052e-5283ddd1608mr44394791cf.11.1784834332367;
        Thu, 23 Jul 2026 12:18:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9e44b97sm1155545e87.61.2026.07.23.12.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 12:18:51 -0700 (PDT)
Date: Thu, 23 Jul 2026 22:18:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: qcom: remove ipq806x Storm machine driver
Message-ID: <5o4nyr5iycpgopeo5dllygtndbp24g5ejqvh43d3mxwnxufork@zds6b6aqvcqf>
References: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
 <20260721-drop-sound-storm-v1-1-23ae4a689ffe@oss.qualcomm.com>
 <85f2799d-fadf-478d-9f3f-fb8ff91ba84d@oss.qualcomm.com>
 <6a609d87.87c5160c.1accad.0f33@mx.google.com>
 <CAO9ioeUw4QgW47xmC58dGc1_j2UPFjDM+dDRF-bggpBPFA32YQ@mail.gmail.com>
 <6a625f94.4d70c427.b2b96.9b5b@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a625f94.4d70c427.b2b96.9b5b@mx.google.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE4OCBTYWx0ZWRfXxlBMlrBRF7EB
 SdQXR5TYlDHfQpZZ139APd0CltyR4Qv0NhAm62W4cHG6tR4DskkydxOppVdBVQK3atXqc1+p2SO
 DiPcJqFJVSp+daYTVyI8GVqQWoJY7ryP9LOjMnIQ/C6NzFBOrRJCY7yDZY0zEYvEmr+ld3q+ErX
 YPpfO5AIPwtdp+o79H35jYeqrbBZsyA+M/rgCTtdtES/+Q3DWQBrpOlbJbm6vd4K9RKjhf53PVt
 roEViU6OeT1+8h1EDYjt+uS9tuRJM5iFQvvacIVCt9lQW8nTlv89zpKHXi/akH94itWx2+ORiJ5
 EGXP7U6zujoMKVHqA9ar0VEXf/+MbbomgNPXw/54jNxzetipBto04WJC9Q3COXAY3MkU2+LWD85
 aA8p8B9W6y8ebbacVkMAQMLjqjg634S8feE9aijpI+aokmvoretUXHLq4Q0dNvHKvLmLRshZoVt
 Ixqd26dlJCLDpbcUS3w==
X-Proofpoint-GUID: 7we7X0NSm8Lr-byK2bst2iOmo_oxf6ZA
X-Authority-Analysis: v=2.4 cv=DfAnbPtW c=1 sm=1 tr=0 ts=6a62691e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=pgCZHW_WQO5PacoC4eoA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE4OCBTYWx0ZWRfX4r35s2/1y25n
 PqEBR835umlvyjVAVFO49BwId8gUwamEYtaYG6d5Qt92Bovy0KO8wZIKRWg9RxPfnFnPzb4fl4p
 oaI/tEl3zBSeN44sWfbfZsahbKiRx7A=
X-Proofpoint-ORIG-GUID: 7we7X0NSm8Lr-byK2bst2iOmo_oxf6ZA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230188

On Thu, Jul 23, 2026 at 08:38:09PM +0200, Christian Marangi wrote:
> On Wed, Jul 22, 2026 at 01:48:30PM +0300, Dmitry Baryshkov wrote:
> > On Wed, 22 Jul 2026 at 13:38, Christian Marangi <ansuelsmth@gmail.com> wrote:
> > >
> > > On Wed, Jul 22, 2026 at 10:00:34AM +0200, Konrad Dybcio wrote:
> > > > On 7/21/26 8:12 PM, Dmitry Baryshkov wrote:
> > > > > The Storm board machine driver targets Google's IPQ806x-based Storm
> > > > > reference board (a MAX98357A DAC wired to the LPASS I2S bus). This board
> > > > > has no upstream device tree, no active users and has seen no functional
> > > > > changes in years, so the driver is dead weight.
> > > > >
> > > > > Remove the driver together with its Kconfig entry and Makefile rule.
> > > > >
> > > > > Assisted-by: Claude:claude-opus-4-8
> > > >
> > > > Using AI to `git rm` is definitely tokenmaxxing!
> > > >
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > > ---
> > > >
> > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > >
> > >
> > > Honestly I'm pretty angry about the latest changes on ipq806x. First the
> > > dtsi just because there weren't device (it's ok and understandable) now we
> > > are starting to remove driver...
> > >
> > > There are godzillion situation where there is a driver but absolutely no
> > > dtsi. Lets remove the dwmac driver, usb phy, pcie and everything else at
> > > this point and treat this soc like it's a 80-90 code...
> > >
> > > I will post dtsi with actual device for the SoC but really I'm not
> > > following all this hurry in cleaning code for device that still gets used
> > > and actually some company even produced new one (even if it's EOL)
> > 
> > We have no way to check that the device is being used other than the
> > DTSI present in the kernel, being updated from time to time with
> > non-trivial changes.
> > 
> > For the patchset in question, do you (or the community) actually use
> > OnHub? If so, please consider upstreaming DT files (and also updating
> > schema FWIW).
> > If not, the files will eventually go away. Just having unused drivers
> > _adds_ a burden. I stumbled upon the driver while reviewing a patch
> > changing the driver (for the sake of changing the ASoC API).
> > 
> > And FWIW the series doesn't touch the IPQ806x LPASS driver (which has
> > a DT counterpart).
> > 
> 
> Yes on OpenWrt we support 3 OnHub google devices from Asus and Tplink and
> they also use the storm driver for the strange attached speaker.

Ack. Then pretty please, could the OpenWrt community please contribute
those to the mainline. It is a quest and a process, but it helps us to
understand actual hardware users.  Not to mention that getting platforms
support upstream would lower the burden of rebasing on the new upstream
kernels (assuming that you are using close-to-upstream kernel) and it
would also save from similar cleanup attempts.

-- 
With best wishes
Dmitry
