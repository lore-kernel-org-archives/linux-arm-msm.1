Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197408;
	b=5MktjY0dcIPzZYDjoh351gY045ZKQQOvwPtQobrYejgnsCnT7eHzSClsCxZvz43twWsW
	 dag7vuAX5ml/mYXDC4WXyh2Gc2uAe9zasvur7sI1Gq4ide40aq5P+VeJoQvvkXC88En75
	 BvBo23+RAAzfmtjQ2h6nsDpLoyP4ACq+TJlUjzt759tpftcERqUeB9AbDDgaxCyj+5vdo
	 n0/rvvTyPOVN8PXiYERuHVojt5Azc2b+YBSKSHqJhjPCcfFioVpcA3+/AzSX211cUrUTH
	 jAVUYP6Dkdib4AgMVhN7M2n2b/rzAyJ2/qv3sis+w43iu2F/rna/Ay1a/IUZUtocGQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197408;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4Al1cJvSPJpi6xUcSP9hpYsXeFbQquqZX2nU234sBEc=;
	b=0v1q3lymlQ1rBuRE4N3bWcU0Hpm4z/pryUIEEH67TH3RCHdcJc4nhvj6pUED6P+HGjX3
	 4DMr1Pti0GQL32mbs3kMGtGcIJ4LBZStoWGnQXU/41jCdM2QAY48VzyWWJ/Lq4YdUl3a5
	 /aKJV6X+6mA+Ygm4lHYi9T4F/i7T+kKlFZFkYY1tsYRQZYhfTwJWKxW8TG5Ke91Nearc9
	 cZrCVSRS0n30d40TCX+rgslnVflaXYyfgVCPLsKEbPDPf2i50GLiehpPv/53MGtm1pZWo
	 GjV+N/Jlmep5vR3sw8EWknOL2xxjnfWqZoW39MHkuVcbkoOvhY59tbRily994iil1Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wt5Z0Nf9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="F/m0NdMZ";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFAD60A2626
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DFAD60A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wt5Z0Nf9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F/m0NdMZ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe31n691872
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Al1cJvSPJpi6xUcSP9hpYsXeFbQquqZX2nU234sBEc=; b=Wt5Z0Nf9w4m/p01v
	hCNgRezvewHpHBHj+9SM1eZnOUB6+h2WjJ2GWPdWV98IC/fqJ7yzlME+Lt9jafI/
	NQnjqsrvaY5oCYriuWpwWrfVx/3SeQfXBuAKHINyiHyDUo58EE4PsI3KBh0H9QUQ
	SuljY10Eo+eOzRbwgb0FsfQHLw6gwInFt5EkMsE1jTy7tSAi7bfQw3qqcbRQXQkF
	FoWexBqZ9Tlrk7M4/g76Uvv4JO6lm0e0nXKsF3ID0NiYjc0GVsiJO0lx/gBvGeeS
	k7bLZGQtHRHu74TRnbz5X/clQ3AU3BEhGnB/VZmsxTYzCVslAPlfT1pjCG+5ew2x
	pXHNlQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be2va9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:23:26 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73a1cf1638fso19028137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 07:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793197405; x=1793802205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Al1cJvSPJpi6xUcSP9hpYsXeFbQquqZX2nU234sBEc=;
        b=F/m0NdMZWNJLx9mojBUigIoHQKIun4Pi95Cy1U4sUxUOk2wms5WfomswHrm2qngo4Q
         ra3UXoEuJ/a4F8exJtkDAhuDNFN3WlmnfmJ5sgcVhsyClkggg2+FxsOfP1YIqYj5D1Gj
         74mfQix99vqJQj4fclR/90V3TkUtgXA6sW/X9KGt9AbETc35D2dxTLZvBV07sJHb762v
         8LXm+myaXa3dVXo6mUTf/pnC/MaO8/jN/oTiip1TrsliZwT7OCtNETebQpXzGirizXzh
         Njaz/Tl9DWvrfvjQbTEaVmjZa4sjMuiR85Nv7P+f6q0HY79sKgmf52jOrpPN2Un4tL3a
         27qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197405; x=1793802205;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Al1cJvSPJpi6xUcSP9hpYsXeFbQquqZX2nU234sBEc=;
        b=kCLO7hfUlLHgX8WHo28fg8Rf1FT1iNrelmJ7re0iHSw3mEkFXWPd94JfcD7euYd4HV
         0QcvUqn1UZilsqt/9Ry8EpGtCizuyLKXUfwoo0wFH9B8X2q5aplSvcPpVb+KnwwoMzCI
         /XTQidy1OGx50RgbmCxi7SeSsiGe9OHX4iUVyEm2FrGiuWzxJaV0w4OJMEB7K97As/C1
         dyJbdgkom8TU9V3q6YAVR2kF7lk8wIFIuS1ATiCkrY+0rl3QVMGwYvMBdHi8UHQTvgoI
         Dj8P+qC9IWtLHCG4ofC/CG2VxJc4sFGDU3Cp9yOb8/CBl5CHR5eD7MLORsjec6T0Ds0b
         lqDg==
X-Gm-Message-State: AFq9FYJXfh19g64uqYYt+OSS2Fb8QBhw5fmIbMWZFPSpEXTZjFGWfbT5
	7V6tE0jPcSXvYpImabzsGwaXBfMBwT7pgnI0NU/jc8SHVGdursW+QdnxhmmJrMbD2bAirJTeudV
	kVdpnGI8lsotgjaCVvi3kXvI8EwuBQWcwWwfsTH61VkawcmDZTcUjKdsVr2zI7DHOVcWi
X-Gm-Gg: AYBFou04x5O1BfwKVRNwsfQKEFII1/nmeZtYVeulTKD+xhOcoFAFpEHQWug31ofrC8q
	Dl+5EyID2ZOcHbW2Oyj3V+SkKH3QZbGiJZ7ic+5VJ3OIcsCawN0qi0TwkzXBoL9NkllvBmdjTpK
	t22M4l+NGo2vfbEPLcvH14TUErO1mXHvRKq53Xyej57wM3m7N5XESaP6AJAPUao9P7XEJuJHAtd
	ifJoHiGeIuimlh+UY3ZrIY0QX06bfutOvxHi8Srk9zosdvWOsccg+2ZBjJcooPSCZXi1UBwWSZH
	Fytbrv+FyHq0DjHM3zbDdII/cXFYxwb7Ay/R1VSRzQrM2A3wKvZojDeLKGuj/VJn4g/JovrrSib
	xC/he29EX+xMZXNE1Gj36PY9wu+3mrp5+tVCDfLt5S04Hqa+k3U46AHy6+Bdh8qNoUw9VlQk=
X-Received: by 2002:a05:6122:4697:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ec4c8f7e42mr1515575e0c.0.1793197405372;
        Wed, 28 Oct 2026 07:23:25 -0700 (PDT)
X-Received: by 2002:a05:6122:4697:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ec4c8f7e42mr1515533e0c.0.1793197404874;
        Wed, 28 Oct 2026 07:23:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7984e9sm603752366b.74.2026.10.28.07.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 07:23:24 -0700 (PDT)
Message-ID: <b4adf2b0-5a6f-4f87-b6a9-ed32fde3bea6@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:23:21 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: monaco-monza-som: Add ADC thermal
 channels
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261028-monza-therm-v1-1-dfe4759c15bd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028-monza-therm-v1-1-dfe4759c15bd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rQ59xSDlsxB-htMZa8zU0XHXQbKTzWKW
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae2055e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=vtxEUVkT7waMBiOsAPUA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfX7jO3qbtvOhmd
 PF8caeWS0vuh3MSsrsFWOghbfqPdXpJnw8By+1uHFr4gxPISx8a/oDKxACGL4231UUZBAuQkw6k
 4cZbLRUnW04Pvul0ZrraJvxtSzOJvHo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfX+fwJpt505v9B
 rDlUHgUXogK/YmihdVDgRX2Vdnj2iYL9fulAgfdKV2J+S4mo3/m8ykU1Oj8yvOjPztuJB/mfOQH
 ox39fqdJ4o2ZkVkLFMpk0xQGm6D6scRZhOqC/w2TPnfDFaqFnjMyoWbd5+TFF4iZGorhed4bb/9
 GLGbmrKac2X0VG3r3kBoRlOTBtSzQyQxaNu0ZL6NzBXsn0oq7ibDrkuIktnulCHPw9uRYNm8yb+
 GbC0uBw/Hex4XN4PvLqxuiKfkVwjCqfu4AHOu9dg+awvCfkLdFdNx/D5ELqxKFJJhLIzvUnAz1e
 SUJAjiYS4XP7pBnrTtdDQN4Nh07Gv57JYrR0K0NE5wGjPH+VVKlggcAwjnyHobSVkMwvNmhVKxl
 Muqgnf7+D+ex2yKDovzwWWQbHRUaZ0Y4CvdIfseVNP8xpM2PG2BB5qxvX2Zo7FxpdwRAX+LwB9z
 0heum/Ti98xeX8neC8Q==
X-Proofpoint-GUID: rQ59xSDlsxB-htMZa8zU0XHXQbKTzWKW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280057

On 10/28/26 3:17 PM, Loic Poulain wrote:
> Add ADC5 GEN3 thermistor channels to pmm8620au_0 and pmm8650au_1 ADC
> nodes for thermal monitoring on the Monaco Monza SoM:
> 
> - pmm8620au_0: XO, UFS/eMMC, and SoC thermistors (AMUX1, AMUX5, AMUX6)
> - pmm8650au_1: SDRAM thermistor (AMUX6)
> 
> All channels use 100K pull-up.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
