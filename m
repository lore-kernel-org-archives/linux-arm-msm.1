Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603821;
	b=AFD/o2rsA+joo7V1oyFSImda1O/aq0GKclb+VSCYJZkxk2ByLYWpT3hhGBkzkmpTwysu
	 qwHolbd2nQJb5Rm9wQ4UVlF2PQOdw714WZ8H1R5xExDTy5Qr3ucQWjhjoAZuslAwaycwv
	 ugDDNt+jRNotGRKjsUqS845sJzrkqbeU8WQIzPCiKbeAm8iR9RooxNcNB8jKxxHSs9sPv
	 R2HVU7Kzs2dUQ8Jh3Ly3Q8qK5+bFtRFcM2EN8qnWxEF3kff4oDwNuejJO8as4+I51b9s6
	 ZD3QhmFLRWPGyyA+IkrpeHvCKCYfuYpASfgNyZoZC/eSZapr38q/2zDw1MN4pn2KJsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603821;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OiAsjt3YYNCcqsogzXutVsvjLsrVcRbH4FRI9PAlqx4=;
	b=4s6LiNCHTY+W2rAx4zlTLzLedpyjHV+XMebNg8xtQhbQX/jYKGDlpc68XnvEvdEbakPR
	 304N72U9XabkuINMGgAAMOi89PPZ0PC8k02O+MxW+wPiRROst29fliYnBZxEFZjKtemtK
	 YUufyM2txVuWrbTEWX1nV2VXwC1ZSZ3ItsEwwsVsGrFd9E5O4lQmDSsft/hEC1+prlP7a
	 Rl8UKmmBHEILtuEu3v/XjGoErc8475Z14AfzY7qvR0RrlqxcnJpEwFLnJwp+T10K5vef6
	 Hlgzno+UrUsoaUhzJH0L2MBb6naUGGJosLbCRXxG07GWvTuPbUzxsoN+WpwJKuswKUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ebZCQ2lp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NTpfwP+D;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4C9606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB4C9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ebZCQ2lp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NTpfwP+D
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mNIP555513
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OiAsjt3YYNCcqsogzXutVsvjLsrVcRbH4FRI9PAlqx4=; b=ebZCQ2lplJzbE/FT
	B07RgrpEEfdgeCzfUMTGYui0apgiyHgiYuTjn+sXx7Dic/V9fb5CLUmucvQAQ4SX
	Nwi8ky52KvNixGTIamDXDJ5NRyKB2xyZYolp1Cc1yeUB8zRd2sMzu1PKwdo/Mmda
	5dTq71cYDL2SZNcTKNUAnTRH8pVSyDlgxL04tHywoAiOPEfHDEARka+PCs8Rs0lR
	EfP1J48xreU8zC74A8QNR4fU5y0I0pvRm12hzG01V7iwzSFNjukJIm/2PcCGiw7q
	Y6aL1sz3lFyS5mDyqpcxZ0fkLI0sl6JrE+k62dPmvQC6tCGxg5gZ3bwFGUi2aOIm
	V2WYoQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnrdr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:50:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55cbd8c22b1so8492721cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603819; x=1796208619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OiAsjt3YYNCcqsogzXutVsvjLsrVcRbH4FRI9PAlqx4=;
        b=NTpfwP+DTs0KmDBr9zVz1d3hF/dyvToLBayX4veQroxPvQtm722TwJcXc39pP7LeTx
         QGwau/pO7RtaSDsdvoy2VqYfob7gYo97exvMh9X4svSm4tLLV3yL+34wFA9mgCE+6ohU
         Yb0l/tFLCuw2TLT8pEIRAOGjwZLXPgUk5yy4s1U+qJL8ZDd55K6Paboio7Br3mfWEYm8
         ZZj3uJw84HHr7I14pYyiauh5kzvlswINH9O0m5R3GlrO1NvslTtgMVoBGJQo+RsGLKh3
         RLZp5u+Hz0jrVPrdc+9mCpQhgch/08QvduplKK16wYvORvIhaSpraAjyxJ4WxIiG5f1N
         B//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603819; x=1796208619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OiAsjt3YYNCcqsogzXutVsvjLsrVcRbH4FRI9PAlqx4=;
        b=P5uXhynwR9/IdOEMu3+HIiLzKWPTvw4SpX3ycLg5IhiNF1ribLSkJLUBkN9tLucSXX
         Hrc+5BMZwSckNGj8XCvSYGNuhtnBs/OgSvZBZ8wGGYVyCe9sFW8fvav2u+doVgRCi3EN
         mL4Ojy3e83cc9UPQRCASPCElWNtD8mdvqLB9id9Bm4JLa3r5IOu2M4MpxVwrNBbILjkQ
         k57NTCVsFjxAbQJGua29Ijon/03InqdOWMXtwfecwPTkPqqPMYF4Lg9fRTKmGJObt1U4
         zaKzGSgmGRKzXpuH/CrCaVX4RdTD/g48X+2YQpAHXsGqrZlYXNPexmWUKM5/GuIKFqQO
         Ukbw==
X-Gm-Message-State: APuU4Z8dhEr84ci5H5FIJ6l7LJM+me3CBToau4BY4phA5JzJ3V0jtsVL
	vazir9/HeoUW55zyyUtYCRnCrtTnRWehVHrfkub6I69d2jIj8Gbcj68oZyoOsrQABUMD+BxPE/6
	GUjbQawekQdhBXyF3CB6oKrZZwc8AWIUk04oVBru7HMZmStIV41iuQD7XtLbhEJIRKmBS
X-Gm-Gg: AZFdTZeUfBBMHUGkLFAU86ccNaJK46AUpQnGPMjoa4cWn+vsei9DtSYslKtGext7R95
	ea60+yQP7Y+pdlsWTaVv2faMDuZ0bqEVgXefQWRvld33h0lIboeYtYuCowOntomCAjsqfm249hw
	jd4S6AAg/d4EE2+XjRmfx/pabBDxycg5xInICImMHNG5gMQ+hT8Ad/dw55d5E+RuVYxYAzCE+Ch
	cbtcuBRghB8gGIaUonmeEUuduQIUUXprSRlogXsP0os3zVtrYpqTippghn4zRzw1e2HdnfrwMI1
	8MraFdgMWjHIQcDR675uk5P0sDWAmz6TtdZ+WqwDSFFQdLi+BoOqZIZGkHghj7mQrllBj2w/CCd
	T39Zmv3JgzR3dxZh2CHGjLE+QAbQMja85KJjdNyNCYsJVQOui+IN4zUZEh+SSAZGtoN5jbxE=
X-Received: by 2002:a05:6214:5348:b0:921:2319:36bc with SMTP id 6a1803df08f44-921349bac89mr369725226d6.2.1795603819262;
        Wed, 25 Nov 2026 02:50:19 -0800 (PST)
X-Received: by 2002:a05:6214:5348:b0:921:2319:36bc with SMTP id 6a1803df08f44-921349bac89mr369724756d6.2.1795603818795;
        Wed, 25 Nov 2026 02:50:18 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea31e4sm624414666b.39.2026.11.25.02.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:50:18 -0800 (PST)
Message-ID: <7246e6c1-544f-4b6b-9eb2-26b0b42f5b65@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:50:15 +0100
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
Subject: Re: [PATCH 02/11] pinctrl: qcom: sm6115: mark egpio as a GPIO pin
 function
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
 <20261124-qcom-pinctrl-egpio-v1-2-34f2c06b2658@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-2-34f2c06b2658@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX2/ungMX7aeq1
 BuVi/8sWdEedQIGzY1YWvD3HF07bTJ4mESROpjeDNU2FOoUkg/LEYvKaT86xQB1ouaX0zgfUtcc
 /CaNDylsNCVsKG5OKR2gFJ8o9RtEYAds5zGjip4BJ1mNrnWDUTYoZpz2DHrN9xb/qjToytZ7odZ
 hKNpU7DWA6icjT42ZUQU30WKFDxVRBjsit5eTLgzn6lpbzSbnfKKBvgErJOZdPmBz8uH70TB7zp
 6Jeg07xRkciCHtC9PLriEI2VWHgPo8JgiQp3WBx9lpDZJEMsv1+wK4FJYu4mWudCFAZhT08yVaw
 b0wWgEA0K+bUPxnfkr/YiKnszFJhKlGxmPqmEazUs41piRwNteNjfHjL8d3Fz0cTk4BF1IUZKCL
 sJAZtu2t/trpdR8AZm/lG+a8X4LhBsO9KFRu6e77+WA3sxlKUZ61NuEXXi8K1tBneEmovDXnHJJ
 rI0QeyezKqFWaiMJ84w==
X-Proofpoint-ORIG-GUID: RQmh-jBwZ4019dd5Mkj-ZrR5U-2zGUpB
X-Proofpoint-GUID: RQmh-jBwZ4019dd5Mkj-ZrR5U-2zGUpB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX3Re9joCgB3v4
 tWVnkFjcht1Ql9p2gxZDhT++M1D8hEI7H3iIomrvx9GaiBOLfkV52TvdMhiz6D3MBLvjWPiDsNU
 S91hJP72y3Vv0oAOKNkIjdjFSdtjlQk=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06bd6b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=TBji9Qi9O8DpM7T6nEUA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250042

On 11/24/26 3:29 PM, Bartosz Golaszewski wrote:
> The egpio function in the sm6115 driver is registered as a strict pin
> function. With strict pinmux, a pin muxed to egpio cannot then be
> requested as a GPIO.
> 
> Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
> be used as a GPIO.
> 
> Fixes: 0524a508b2cf ("pinctrl: qcom: sm6115: Add egpio support")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
