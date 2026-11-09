Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242955;
	b=W+yl+8NJcqSh8K6LnScoTGME4obuNpgVFR9vTARmXN/1hmcs4jS9H01tlrlRJJjJIFz0
	 WYztZ/qA81R1pWJHWy27M9eNWTj4zr7iDpTByuis87sORirdttCZHRcBtWbyWzDR+jJqc
	 K2oNboIesM+lSEGZnegmQyvABlMnAbHIsvmmSvA+usa+k93TQJZYvAB2LLALAFK4doNt9
	 UHVsnCjoYAL0uhQcbXvJu/ULVnGxTvNUtfUqJdhTIUvkCO2MGgR9pBn2HkX8FJahbLwQT
	 kIF6l8i5ivzv7wIHRauVbc58VIZvDPpd8/ARgN8KXZD+ZdlsohfWkwqVbV4bFNdvqaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=c6AwzobJV0fUKMq6G3UDWz5i4sFBbBdzjNX7/+61mUM=;
	b=ozyEvRIjkORZTiME7mughubAzteq+AQArMfMwjQbCGKiCaY5UJDLXZEH4twevPnkCV6q
	 DhkmZJwPLvsQfqwoJ5VJRCZ5p/sNd/XOJguIdjVHlJQnujGoTm9EV553mdhxBX15xr5Pv
	 ABOA8SI96nHp2/U72gchVO/ITfgDTbW2uDO2TsJeWl0iY1oFUN8VyhcA/vJTo4JsgouCV
	 +oECv7o79TjYKwSJUBSIWJhIEYeIPA9AWB5eFcoaVAUHCSSkOhxVLpC/HVnCdK9ebMuDK
	 LKeaNz5j6FxB5mWwCTl0AYKKCWVghJ/L2xGJOKioMSqrHwxAklro9aGyjX0rff/x8VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PM1ywSq6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fMqn+YDH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEE1606A32A
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 16:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DEE1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PM1ywSq6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fMqn+YDH
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFFix359369
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 16:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c6AwzobJV0fUKMq6G3UDWz5i
	4sFBbBdzjNX7/+61mUM=; b=PM1ywSq64LIJCiN33Mkf6Gy+Se0GF2jAVzVOUGKV
	PssnunQe71GlRO6iDyxNIYQab5Z9HK1qtiLpwtjDnkEr5SIOSkRgqmJhVIKAN3Lp
	h0bJs2tCL/PjUdmr7C8gtJiCsk/UVUSXmPbz/0TfxKbsUsQQozGadM8u3wE1tmFf
	uWk9RbrINkF/qY5OpdxICArsIhmCIqYL3EWoFUDOgEB+hmwN9jvCFRROkOJTa+nP
	nI9tg7VG74C9AZVwxoidR9dH89CCmEA5EfZJm06CLYW7bMh+FUiA44ChNuZRl9Zm
	KVszE/9JxkwG3WEMKnbL9nj6dguLvx6XJBV7IFjaQju79Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2jmcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 16:49:13 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99064f8c7efso783331241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 08:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794242953; x=1794847753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c6AwzobJV0fUKMq6G3UDWz5i4sFBbBdzjNX7/+61mUM=;
        b=fMqn+YDHCfdcX154sY2wAqcVBcSToEyO7YoCJP2BJ1Z3oZ9s6qRmnrLL4HmKiRB2Wg
         GOmnOKnEdr0OTAKrIzRmMpjsVFj3AsRYiIy1AE1rp9fDaLeio3wglPMicG1eOBbCBB4f
         9lCZcofcac3GJeBpDWHbkILSbqXcBhDAdqOM07R2YIbzzToQxKF16s82Ys+268Nqv9jU
         IIGcDAvWBaRrW8koNvX5ez/92nRLO09g8cUBNn5FiGgs4DtMYZMCg85OOvxiOEtvzfa0
         sYID8nBMS5uBtc9BoHEgVVY5VtakLahl1BmNoB39lx9QK1O/QADkqXUxniU4JeyDkb6T
         i+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242953; x=1794847753;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c6AwzobJV0fUKMq6G3UDWz5i4sFBbBdzjNX7/+61mUM=;
        b=c7bcHX6pMvSSVYXMrVu01rQ0oosiB8CP1Y6JCjqaNYC/IwNqVVmLu+ItHNe8arQhWv
         NKcGCwOCOth3u/fWnIocj6IfBgfvXXxHrQLgRpSvWZ4kt6USGcK8sLd8Tv5kWFHATZ3w
         WEkJBrwgCIp+IX99TbM20Au/zG3BNdtl9XzCkIUGvjXZd3kg67/XU39pzWxuvLvyHs7s
         LZXHSnrUzK8g7//uBBMBIcAcDNbA1B3Jblgyex/jDCyni4DmsCZkoV8mMCxLxHZ/JUaU
         8TdR+fF0suygyAIRTozqUuXV9y79Zdwg4ZO9VF4E84d4gOiq4vMj5RSTYut8mjeMZMTB
         IOOw==
X-Forwarded-Encrypted: i=1; AL+hErG0/vJbXY06k/18gBTEf521NNdOxX+MFTY8ZbhtCqd5JTNR99SsqjhRM8P4s3pr2kPd7/Z75hb+5z9UmtmM@vger.kernel.org
X-Gm-Message-State: APuU4Z/el9cfWFLi2U6g39dOVzML5NEDJRZeQS9ec7tmbQkkFyOO+hX8
	k3U6la/2CGLUA+La1GDGtOB7+pT5Mnu0lbgesDLb6omHlG/b9N6euD5is596j6rN7RnEbWphqMz
	/mo/kA9Jyg4w+4Q5LUlBTvlQVvp2MBv1h3U54Vk5ytYfk+/p9K1aRNNIv9Nm9+uPk9zpt
X-Gm-Gg: AYBFou07rQUU438f5LGCLyLwpSTiyc6KBe5ZQkzODkmrES7dYyLNVsTWbdOOLIzF8op
	rGGsbg0Mg+GxaAYjO/NlhgTMgWimt1u1Hxxts8pnQZmWxw+KTu/3v8EQwrc7RTOQa0lUl+lOCeT
	17LMjnLXNDXKZsuKHWHwLFHg/eBqgnLedg5Sg2Ut6KBtWxQQ4eELMBd2INwQmUQUME5PDoORcRG
	fEMS04xWqdfIAk5gbwsct6THeXMoCi2T9Dp1134iJ+mXa5BMyUjzlyHxPS4c7XsSNEAavYI6b1A
	I4RgYQjzVq2vfBH3K+PyguN276nCyl4XaJ1SbUQCqHx7ZhaAOQpzE9wdaP9as408hiaDLL54Py4
	XVwEgAtzBDm0E/JLm+afSNE7sYUIAWFH/6RiSzEpUKtkCFa5GwTLVihIPbK7Ijsw=
X-Received: by 2002:a05:6102:e0c:b0:7d2:c786:5a98 with SMTP id ada2fe7eead31-7d2db07fba3mr1589433137.8.1794242952570;
        Mon, 09 Nov 2026 08:49:12 -0800 (PST)
X-Received: by 2002:a05:6102:e0c:b0:7d2:c786:5a98 with SMTP id ada2fe7eead31-7d2db07fba3mr1589408137.8.1794242951891;
        Mon, 09 Nov 2026 08:49:11 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01d8edf1sm2348025e9.5.2026.11.09.08.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:49:10 -0800 (PST)
Date: Mon, 9 Nov 2026 18:49:09 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Fix
 LDO voltages
Message-ID: <gfwbr3yicasc2yrmh3xrabiuxfhrrt22m7xpjckqpv33k3pjr6@sot7sdzzufe7>
References: <20261108-t14s-gen7-ldo-voltages-v1-1-e0ad0d528767@oss.qualcomm.com>
 <bcea16ba-019f-4fbe-bc70-9f9a29461a30@oss.qualcomm.com>
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
In-Reply-To: <bcea16ba-019f-4fbe-bc70-9f9a29461a30@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af1f989 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5gVVVXgHm4f7vdZG38cA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2NiBTYWx0ZWRfXxpmIIllgQRdj
 1+xngD+rrfVs55W37qOjEoEcQrEkR3ifJAxo2c0+okQRjgYzyI684AquJ/yzoYIotoKD77dNB4q
 jcFmAYiJzUXVFmErpdLEcxh595ugNZApcmAe0KGe4nMP0McAOHeIgL5dDYbgmrw69GxDdUtGjjz
 V8TM56qNP+bsuvDucky504tQSd9KW2jO80JUQAmPZjZ3aSdQNBOkAO4ae0qmTN4O6qhR9PMkyIF
 43wBkiBIQtFRf4P3d7iBxvwKCrnHwrNHRIFuK7EalM0wq8K60CEOMhnuBJe5qQDX8G5go51CARY
 QNUq/w6s8d8MRj3Aj4p7BtCbe7OZWXcIGFXQwWS5lXuqARKA7SGlI5yl0KJMluenAa0GQlWH1Gq
 8NIEj4qFsz/MzVrZQXnrvKoQtm/ghNjehf3WEGhUexDjlcGqZyxA6KJrndtCnv77exnwic2WAQV
 JYR7t01FX7SX1s3aDTQ==
X-Proofpoint-GUID: vzz8xn_5dkunFFu-Re613bc3eVvUNsZ0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2NiBTYWx0ZWRfX+gg8/kDfHn4e
 tWtNtnNOEbC+pvtEvSuEWH9LKKviog/2geoLtCmbhpOarAd6GaNl0dzoPziGc/00FL/0KAXUuv5
 KUKT3+xfl3CgURBjUOPRtp7prvl2Pz0=
X-Proofpoint-ORIG-GUID: vzz8xn_5dkunFFu-Re613bc3eVvUNsZ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090066

On 26-11-09 14:38:10, Konrad Dybcio wrote:
> On 11/8/26 10:01 PM, Abel Vesa wrote:
> > Several LDO voltages do not match what the firmware votes for the
> > consumers of these rails (the PMICVREGVOTE entries in the ACPI tables)
> > nor the schematics:
> > 
> >   L1C E1: 0.832V -> 0.912V (PCIe4/PCIe6 PHYs)
> >   L2C E1: 1.144V -> 1.2V
> >   L4C E1: 0.72V  -> 0.912V (eUSB2 PHY of the third USB controller)
> >   L1F E1: 0.88V  -> 0.904V
> >   L2F E1: 0.904V -> 0.88V  (the L1F and L2F E1 values were swapped)
> >   L2H E0: 0.832V -> 0.88V  (HS and multiport USB PHYs)
> >   L7B E0: 2.79V  -> 3.072V (eUSB2 repeaters)
> > 
> > Fix them and rename the labels to match.
> > 
> > Fixes: 300f5c59beb2 ("arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7")
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> Merging the power grid consolidation will fix these too and I'm
> hoping Bjorn is eyeing that one, as I would really hate having to
> rebase it..

Sounds good to me.

Bjorn, please take the following patchset instead:

https://lore.kernel.org/all/20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com/
