Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788E030B529
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 01:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791941311; cv=none; b=aNrFBrT5l3qVNbVB2f3eGNv23iqalX3R8Ru4EW66A3BSA8KH1xP4NYswshT609iuOX5oQKGCHypERueUzpjezhOaEvPvOsOmv61yWpD4pMekiqp7p3rZ9MaBv13CDbXMASPwE4ZqI2bLcOLFqifh2+EzjgqqUlp7JETfj2unK2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791941311; c=relaxed/simple;
	bh=EB4FMaSj2Eq4BOT4nid6tbYps7Q08LHkZpWOLznh87w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WPfnj5UjmKsSDzZ81e5j4GeIxn+bhje7a2OOXJrzhQSye7NZM0bU8iBQqQSzyasQR0uI4ZMlnRzKTrBAnn4DMH/Q+UKsX65Rxlz5LB89dbIBCqEUoxaBmWUiLd15JXmu8HrbF0dMmEd+jtZhVdEuDbXd1LIDzfD/PEyyha/Bel0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XNWQclOV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFnq7UUd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XNWQclOV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFnq7UUd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DHNS1j2333507
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 01:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rgFtdCHlFEmrliTYjBmLINo3
	xN9OuOGBDuGALfW3hI4=; b=XNWQclOVBusiQovhlnn14imiJCnV2m3g8y7uzv2X
	/X70p8bmyAIX5mZzx3ZdJvXSFRRcyEVl1t/LZ2cW906pSgsCefHcw+TeXToaKtAv
	1pIVXMqZVQX1/bGKmgPt+8NVRuMdAnHg2BFpHlciV6/ZMXzCCSijvizCNbpZ+uGE
	Cgj0ae/hkCOI6Jrxbst5enyJDk6otADWmHpf0csA4X+DqckkDZBbZFo8lYMeKEOH
	qVAEmma3csLl3hRLNy13fyLMgJv9/3Trto0S2zoZzwnG0Wo3NbUlcOpkwD/xoV6y
	5WjFEbcFG7P2gD0OkzClZGrMOUcJhDSeH2RlFNN6f8F8NA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s0hhpwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 01:28:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea9ea9d13so608522785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 18:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791941308; x=1792546108; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rgFtdCHlFEmrliTYjBmLINo3xN9OuOGBDuGALfW3hI4=;
        b=KFnq7UUdAUjWzYJuaF7S8qwUTCCPtnqmfHbl0/x8yIhsbpDKxJvauEGQTyIdem4JiO
         FlNxBzp5XRUiA5O0gPIaBy+8Nu/7PYotGISxm1fGus70otMgvRldUmlVLeemPpqBitDc
         4UofP+E85vvg7qxhKwVilDsBYEOobRNDwIRSwLbd08WVJY/cthxyTCRAT+dDX0Wf1/sK
         Z5ryYR+YUxmOdDbJVXgQZiij6qW8GDYwZADixqJZKaTl7q8PcQGxMpaeMZKsMzBxe8Ll
         AaciCmWoL/xtSKhFNlmNpzypmSySX5T+hpwjGQkc+Z/A0tm7CAAQVJSfuZdQ2/I6DVfG
         BeNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791941308; x=1792546108;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rgFtdCHlFEmrliTYjBmLINo3xN9OuOGBDuGALfW3hI4=;
        b=WErgePmRJzKTIx8NqAB52y8jnu0GPxCPCPko66LRPlHgpmnhd9DfxtMJnu6S+pzB2T
         8xO63Z1voXpk3YYwUvdZiUqOCyH5MF+u+/gnfTe70qcBYM6tuQciah6E8T0qJiS1rJfi
         dmQVDlQCVOqKyPGGylCjRt7+fbdzJvUtu38sPoiAP7phU1ej+F8+8D6etj1Id4n7+aFf
         Zu7u7Mc3HcRxVmQD1bJJh6tDujKErep9oTkH2E+5NCIa41EYgNA5yldazMU5Fl/r5z8q
         vX//KPdZ6/devpscaKqXYqnzfYdwDDXUfqfAUATlrHAeT8zQsHYqiiAsfdRAarWWpy3Q
         HEug==
X-Forwarded-Encrypted: i=1; AKwUvBw0kyOsc9hL9aRttfAH/atyiYI4pfDzY0T56in0RY7vNgvyEbAou2mAVlRTPtL/oFl8fWqmgGL19FmafZnT@vger.kernel.org
X-Gm-Message-State: AFq9FYJhxkv4ilMIzrGxDoY+S89IyziRz2NIU8TS6QtgvrxCgsp+k71i
	QYsgoTjZT30dVLMVr3SRmjea9imV3uhuGx9S6iM64mRng8dbnQZQ3+Zy9xD9S5B7P4pfXnTZMJq
	5Yyt8X1LMOsFszLRGrgZSmPX3vEcWwbrXUYu/ogckoDeS6IPRZrUU0buxSLpzFPfzO1cCpEn7b9
	Qb
X-Gm-Gg: AYBFou1NhDygnrvJ5FMLrlZozhsozHCnQRbz0qr0pWXbYMKspPVSOfMSuUz82bKlWEB
	RnH6d02v5eOlfariFfzeEpwvfG2FJMK+F8gJsJ3e6M6Gw2Sn4v0sldG0OP69VaUwNgkU/iiNuzg
	jQCiwhIYRF1pWv+aK91fQgR0cSf0EhDw2OKrCEj0IQGoy+DozebZqZQMCRVX+a7F8rhHI7EXLIv
	go2gJSuZA+zNTBwul9Q04qGuc3+6RgOGl25EezBimvu2eRBfy/4PYvIrg1D9ajVivkz/C3NzviU
	nZiHJyd5mKoc0OMLgxVp1AHCo30PJAzS0VDZz0x/yW1bQ7PUwYYykWbWAuOkRMZIbRyn9UNpRtb
	lnjJu/Q2JrgP/LmLaEAwoDuAUSTeCSbMlHtYsiVaRO855xaZ+qqDbORpKt4V4DtImW+hWQ2pOhQ
	bR1uu6dAgNQMA4
X-Received: by 2002:a05:620a:3187:b0:93e:c12c:9b73 with SMTP id af79cd13be357-93ec12c9f14mr2216297585a.78.1791941308278;
        Tue, 13 Oct 2026 18:28:28 -0700 (PDT)
X-Received: by 2002:a05:620a:3187:b0:93e:c12c:9b73 with SMTP id af79cd13be357-93ec12c9f14mr2216295485a.78.1791941307752;
        Tue, 13 Oct 2026 18:28:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3c9b104sm42828181fa.11.2026.10.13.18.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 18:28:26 -0700 (PDT)
Date: Wed, 14 Oct 2026 04:28:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jasper Korten <jja2000@gmail.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Luca Weiss <luca@lucaweiss.eu>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Samsung Galaxy Book2 Go
Message-ID: <emdm463llmoi6vsv3zmfjddqrfaf2iubdnydsqye2n6ui56oae@frsvj6el3zvq>
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
 <fb634f17-de56-4f43-b139-3d040a35f019@oss.qualcomm.com>
 <DM3MSNLF42BV.1UV490PXB0C07@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM3MSNLF42BV.1UV490PXB0C07@fairphone.com>
X-Authority-Analysis: v=2.4 cv=GL+dgeNK c=1 sm=1 tr=0 ts=6acedabd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=dlmhaOwlAAAA:8 a=6H0WHjuAAAAA:8 a=s7BF4lges1HAnKHfQr0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=y4cfut4LVr_MrANMpYTh:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: l0lUmwZwbYSi4BxYpnWFdfYjRwolhY7Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAwNSBTYWx0ZWRfX3OAEN/MGdAQh
 erS9XHtgCHcpzVu2jxX4bvMJxXlFA1hZOZtW0Yt6kLvoXKz0ICEDV5ujJbNmqv+/FLl/BR/tD4w
 5PyFosNB3Xtt20kuoiK2qVFrEvr6p9o=
X-Proofpoint-GUID: l0lUmwZwbYSi4BxYpnWFdfYjRwolhY7Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAwNSBTYWx0ZWRfX8uBHZdfuyDAD
 x4BZlX175X5AJ5B5rCuvAOvdmjjANzyDW1BppkHpj0R+zAjTg1NNu9VfB7cB9n4rSWDAbYxfR3J
 htP9CLajemTAwUcdhs59vlnH9Yw7HA/5iqVxYBapH6JNt7M6p/GsbOlB3fDEYfsc4rMMl9wm904
 /xWIqvelzHgHXH065jJDsiKrcrcxRKVKAK/0lgBaiq5I05/HIG7EOygO9kIIFKJxB1Kjhd0LfmT
 nKMsYCSD1Js86EDVSDTmtqeoXNEIXY18syLUDoA8UxkBmtoRgzx+V6hFCjxiEn1chO8n6mmYpXY
 xJt8iKIW7OtUiBQ8VHENF+QE+s7XOugoDu3INE8HQp5ragC1guapotYmNObYEY7JdHyPpvh0icn
 kc1YfryxR6mdR/0G9YYUP4RmJIDt//pBE/epy2wfGVpjsf3rhK2brxQMup0BOifmCuP709fcfOn
 DsuyIFO79/uS03O8Ocw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140005

On Tue, Oct 13, 2026 at 12:17:05PM +0200, Luca Weiss wrote:
> On Tue Oct 13, 2026 at 12:10 PM CEST, Konrad Dybcio wrote:
> > On 10/12/26 8:11 PM, Luca Weiss wrote:
> >> From: Jasper Korten <jja2000@gmail.com>
> >
> > [...]
> >
> >> Signed-off-by: Jasper Korten <jja2000@gmail.com>
> >> Co-developed-by: Federico Amedeo Izzo <federico@izzo.pro>
> >> Signed-off-by: Federico Amedeo Izzo <federico@izzo.pro>
> >> Co-developed-by: Luca Weiss <luca@lucaweiss.eu>
> >> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> >> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >
> > Good to see the Lucas are in agreement ;)
> 
> :)
> 
> >
> > [...]
> >
> >> +&usb_1 {
> >> +	dr_mode = "host";
> >
> > Does OTG not "just work"?
> 
> Is this a feature one would want on a laptop? On a phone for sure, but I
> don't quite see the use case for the laptop to be a peripheral? But I
> didn't try it, the USB basic setup was done by Jasper

Why not? It's more or less the same set of usecases: USB gadget device
(which can be a networking gadget, serial, etc).

> 
> >
> > I'm assuming there's no pmic-glink on this device?
> 
> I'm not quite sure yet how the USB stuff works. For sure from
> observation, USB-C only works when stuff was plugged-in at boot time
> (UEFI?), and charger also only supplies any power (but not actually
> charging) when plugged in at boot time.

This means that something is not 100% correct, for example, missing EC
support.

-- 
With best wishes
Dmitry
