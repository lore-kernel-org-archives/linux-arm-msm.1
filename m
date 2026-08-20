Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B69B3EC810
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 09:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218332; cv=none; b=Rc3sQ/AJKNUnDpZXPIF64MrpzJdHH/gnasF17B5u/Q2T2zUJiHrB6sqI2+OTKxPsTzhMEunSGx0hCiFLhRRrNjWT9eLdmC2Uj4orhqhe7hAG7mAHhPIbXFvMQn/9DXQt+QRciDHp48JJdMmdsk8vQY3Ky49AlgOwb/ZjvWKnIv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218332; c=relaxed/simple;
	bh=hZ6uac8KvPRXkV9vhOLj7nXAkbqQbTg7tlS1trEqZEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3HbxU03l459bdVgAdgFGULYGTGOyK/XN2vgappvVUVBpzjVmBFHUJs9coSUOO8HWv7aMogp5xGwDZRVtQJ2Lunz3EVU8RqFEyIeZ70ecqn5esFbCfCqX4ujTwX3cEdGd/25biMj0j7uIclwq4+ikCuMYHowY93r5NvGiLKwtMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E3phCS9w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a7OA/cZI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E3phCS9w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a7OA/cZI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6ZpO21258605
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 09:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=73zzu+rzJFAbor3RD8lFIDp9
	aOc9697rkNpBh9N8V4o=; b=E3phCS9w/25IRarG2tPwxxa8UUXhqCVR9tF6ghUt
	MKPTrIFSONLLxRVAX3r9shxTjT9Gx3UQUHyXOnONUr3t5G+bdjiUNChGFw7PeObs
	6nkFjBRrJcyQMLpNxN3u4nXdh1ieuMwWd0LYrt5H6qOHmyRAwBYxRyNnYGoYVKy4
	9UHlNQkF85IOjswXZuM0AConAR9sPOsdY4tIlxVsccOpWmUGPV9PI8OGnGWLwlEc
	hsoaMjQTOqb8ny00uBUZosFGBIlO4flXpPZKAz7ckFqwEs4YgB0R0DDcfiUg/Zvo
	wlunJIrNNCpeKp3k8jzTbg7RUWczJM9Bnb2zEG1QgmZTaw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es643m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 09:32:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e820609d9so229059485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 02:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787218320; x=1787823120; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=73zzu+rzJFAbor3RD8lFIDp9aOc9697rkNpBh9N8V4o=;
        b=a7OA/cZIFXpmngJ9KmzBlku2jbmBc7Ys0ygLptTDe2M7+dxefkkQydWJoEmSn+0x6U
         ZKFe2W4LQCfb6ELkpdCkXTdZdVY+bmpz+83F/W5NgQwFO3OZeTEwQ1McJzywa1Y2PU9i
         /Xx7n5ucRTpdD2ct9BRRTqP8ofNHrpJjNAUhdpZVQ8zcVdYOlXiLChsVc0Mtc+w/1bnQ
         nueVwnCRTcXO6H5IYaiw9pPLHiV9w/Cm4TbtrjNkv2Rk40vl2D7HPLZin4CBl95YRyU7
         DEcl3w9U/0Uustt988DU1Ch6EGyKImsHH7FnBUMn8YTPoLCBkMrEfFdMIvHkrV/NvPGq
         0cVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787218320; x=1787823120;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=73zzu+rzJFAbor3RD8lFIDp9aOc9697rkNpBh9N8V4o=;
        b=VSkKmWI6RwOJODG5acttGRICZLU0fmX+QmCrHU/kyik68mmVMLyEn2CsWfmvcqwjqh
         iETNTP10CXg2o6GHvMvlqL3cHd0Wzf6UF5Ql79xzyktRd6d8egW0gO5OFuoej6tjKdFR
         13PqEFfOSbPctkaghy7THYFgHEh5fufSEEblxqm4oeq68GsV76JsC2WUwatoCWk8k2N0
         bBVYMHP+6KG4xT4FhsNhSVKf4au5F0UtY1X9vNCkoM46lymAomJbtEWWzThyXQzl1aaD
         FO/xHUDseuOFmzDJRRm5FWbx4LCfi79cuEZtJgr+P/2x8RI2ZzPyo9EVdCSfAPfroNEI
         Lq8A==
X-Forwarded-Encrypted: i=1; AHgh+RpKpcMqwUKMpxRaG15dgeKmNURYGmVzPcOJtzYhcwPKPudIWVDwuRCTwwKyRXoanQfADYccFId+oJXsYw59@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3HR0+TZq4QKRIWGZb3GRXZJ1JlaQwm6PriSbWWnINrsKn9v6j
	+Ac+GgS1eKvMaZspSaW7ylkHA6lIo/waJLVyJWaxGA/P4WA8DyALtZmnlOc9cTeLHt9TtNypnqD
	BEm9rvSh2WUjdwiR/cB7WVdDAMcZeQV8079rrj/JUl+E9gPIBQe0EQL/GItKIP+hC9ix1
X-Gm-Gg: AR+sD12jA+L6uXocAuwAwDXguGlb1blJRi6UD8GUxea5vL5/hdTlf0lDc8ljhTIUXHE
	CdVU3Arun+U9Y0sSjhfOIab+K6NJOYUr1WD2wcuspjfB+Zd9PR+aMBsx02XMNP94kSh9Ww4jNUJ
	qSJUD/1tkbHkqU6Ri9eJ9QeLHoN9aUf9shKN71jAPdU+3S41DY9F797/i1RseF8u2b5MADmwsPj
	2AAaNfMudM39bA0pPKahEd5zSzMyjU1PuwbnC8WRMb308b2bM55ZSpnOSo2RWG2RlLcVj4MtCjc
	cIC6umFD10RvJi29MTNHfhbiW2Px4LCyuF5zJifezmFPf8vPl4oaiopwQMerotQPVG7yf+52MR6
	xlXs9K+lDmL88DsQ=
X-Received: by 2002:a05:620a:3712:b0:936:9f47:e908 with SMTP id af79cd13be357-9371e259c99mr940645985a.19.1787218319931;
        Thu, 20 Aug 2026 02:31:59 -0700 (PDT)
X-Received: by 2002:a05:620a:3712:b0:936:9f47:e908 with SMTP id af79cd13be357-9371e259c99mr940640885a.19.1787218319338;
        Thu, 20 Aug 2026 02:31:59 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b20bdd75sm36843015e9.2.2026.08.20.02.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:31:58 -0700 (PDT)
Date: Thu, 20 Aug 2026 12:31:56 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Enable dTPM on EVK boards
Message-ID: <2ed6ai5ms7bvjlfi4fq7o37jmcfasrkgkniyzskkjr4wpc5hpv@ypnwmx5rvru5>
References: <20260820-shikra_dtpm-v1-1-40d96b8238bb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-shikra_dtpm-v1-1-40d96b8238bb@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=E5/9Y6dl c=1 sm=1 tr=0 ts=6a86c990 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1fqHp006aO9jO71P8i8A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: MifnBRL6YAG3hBEKD4ByGVsiN8UIKgj3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA2OSBTYWx0ZWRfX9Ch9IDU5hDVN
 zAdG2XIZmslzGv4+4JdOEVpA1dV5xCzPjlUcuzxCaIfnsm+sMPgM2bL2kyKTOPgI11S2iW9v0SA
 S8nUgoihbYS1p/SP3RoUJhis7AfW8MYGTNCFQOEChPJtoG7rXPCG327IAh+LwxBJQnWjmm41QSa
 mfaHq6SreRqezf3hZNTLZhnRJq4FcN3IS7g/rw9mHapQiVT2MmhabEeh/wisGbBWDit73bX5ZiJ
 ws0VFx7JUXQnwSqxGgr+HM5/XqRFWL94n+UBn+at3e3VRRuLz68G3fWRxDrCYG02hcMNpvrEYUf
 xkKBG6HKxM6Xw0H3YlZgFDtAtN1/H4lvbv7YzCg2fvfQv2IkJ4sdkus0V+LFizIRHkCAvg/iSZh
 NXtqHWE3pvzmdT2STx+oBA3oc+Ihe55IZ4KxJNGCnLYNdgU9X7bXtKxtp9nAGzOZ1GQNCUoxmle
 rdzmhNWqwFlpdDeNe2A==
X-Proofpoint-ORIG-GUID: MifnBRL6YAG3hBEKD4ByGVsiN8UIKgj3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA2OSBTYWx0ZWRfX+o7vJepF6j+X
 Bfx39d06vGFnLHJUdwT7/sxKLu8Oh5KB1B3xMsHCZFLcStGfEBY9bYwfFK9P5sdzcFzd+z0zdGz
 PCFN4N0Mh6c/w3yI8+DpFaPutvZQcUk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200069

On 26-08-20 14:46:07, Khalid Faisal Ansari wrote:
> The Shikra EVK boards (CQM, CQS, IQS) carry an ST33 discrete TPM
> connected via SPI5. Enable the SPI controller and add the TPM node
> with the ST33HTPM compatible and a 20 MHz max clock.
> 
> Depends-on: https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
