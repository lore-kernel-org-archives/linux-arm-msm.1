Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956639;
	b=rJlU79gv7py7W7OAIW1iqJNnT0vdE9LIv88Pt6lMIJks7Zxi48/QNYxhhuOILI3RVcVJ
	 F4w5GcqTnvE84YocGlk1MeejoJKahtORo9Wfsk7dOK1yJPAKbovb/PldRuV/mz7+P5/cn
	 K79BmEGbInEtidQTeQT8IKJV1AQ6sATgDV83EKV/moQ7Annl9KU2vjCKyALsphynucnbA
	 Gvj6RvOTl5u+7tLEsxLrYJeHqOwfclo4ceM07F/HR0I7iH7a2ld2V0wFJEsZwlW0qKDGs
	 5lwt1CibLe4omWYASHaYd0eJQROl681HsqaqIVuqxp21LQq/8a+2UcDR/g5eYnqEtvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956639;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QV5hhgwDtQTt5SAYfrerd7IkI7JI7kVQtItIdeKT6D4=;
	b=3O6JRusVstd6H6CcxCzhxKeTBSdhWmBV/cypVbuWZpTvQ6m3BbdzXxDNRd8exp9UfD0f
	 sVrNy5MR5YXamxxQvbNKwWjuvuN/Vsmhhx4P0ohchYxsAwacxTqdNJD1u8Ev0nZGDSEpZ
	 nW/8/XMLb1WWWSxTnt56nVwt+VW7YQjOi3IUHRMATuUj1NOCNDlJw4UD2eViq1f/GkCTP
	 8Vf422lVejS5cpOBuxF33thQeztRy61ZneuHza+XlLqivRwZko9XGujIi+Cm+J4pwKlLa
	 5QKO8m+vvjiU4Dt/CYQxTJc+V+tsDDmA+G2aLAzWhkKUfMyyj+eczL4dycatlcTywPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=edHJqB3a;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=chRZodAF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9450F606A326
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 09:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9450F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=edHJqB3a;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=chRZodAF
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R7Z83243884
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 09:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QV5hhgwDtQTt5SAYfrerd7Ik
	I7JI7kVQtItIdeKT6D4=; b=edHJqB3aL3fPedwRbjfz/LmF1f33hPVcRqgR6F3v
	cMqwNkwgetZYNJAoQA1H/6E5t7YcJZW+c49T7vw5m+khdhzRTCEn5bXJ9yK7BYLb
	oyiP0rMEtHtJGfEmA0Im5mN+N72Beyp+/2mInQoIahf6x/04P6tPS/jXmyv+UkEC
	m+uMECtgiQJ6Xn3cSivZ/c+Sn1JDIPXDAMe8HeQbyPrbxSg4CyIS95pYZhbsu8q4
	3ZgHze5AOq3O/NE2Zk0x53NbbTEDBYDMpPWPqDDZPNjS1G5XYvg02g5cX76MCA2g
	6O6vXAidFv91H9vwe28bHAkgFVO0gi1uhEnuNZ6Wapj2Og==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa21d4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 09:17:17 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b25d977b91so896627c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 01:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956637; x=1794561437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QV5hhgwDtQTt5SAYfrerd7IkI7JI7kVQtItIdeKT6D4=;
        b=chRZodAFFY9zXiIlerVNoEEzK4VsdnIIHDuYWD9y2wBS9U0FdimmDwBbZpFtfQLQwE
         z0/KU5mAHptEUDz9MpBa1BQRiVWhRYqeudT5K425SvMAWIH/tYBhZwz+LOkjxjs8Rspg
         nA3O2MrnBznr13jP5ZPbA6WtSNdJA23Nwkqt9FkWmVRnqaJo7+xOrX/W62XarSEegIii
         254KlNd5l6CwkEyqk7YMDW7UxiPOCZgg/4LoUYU+ZBd1/rU3PGqAtsw4JH7MPXpkYO83
         sM7LMjB6wp2OC7Sp370OPM1MYvuMYA05kQPRzQR2cRgxVF1vwJtcfNLWK1ByLMm+l641
         QM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956637; x=1794561437;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QV5hhgwDtQTt5SAYfrerd7IkI7JI7kVQtItIdeKT6D4=;
        b=Tt/RxzNc5De1SzNmUih/RwzQqL0sCPs+VGzRDIEwX5tdhXT+5auWUVn6iDqJggBpHX
         lqvoGqBSPoppo3umvUi9n+mmUsh6tGEzvhxpkdl6p90HJFJWTjLasyeTnKZvidtIGTsn
         y40GG+DJGdgG4donWXooKUPeQUmDLn/ExwV5gzxME8BYi3NzH5DnKRLNviAYaSPK6nn4
         rJ7jrGTWV3QUrz4FtElVYtXg4veDHPoz9jgPSjTkmiLPyI5uJeKwe4axnquDEaUxNpZg
         eNJJcQ+mumLE8u5vNs60MFlwP/5GZM1cH6Bl199oCl9TT8FR/ReIylTRg0njr3Cl7WMf
         ME+A==
X-Forwarded-Encrypted: i=1; AKwUvBwQPw934TPg1ZAAZ22ZxXwR9lqqTbDeDCkssvUkDkH3d8+OIFXWHgYJiY22tI0x+Z+tWa7N/dQGLj+a2FZK@vger.kernel.org
X-Gm-Message-State: APuU4Z+3E2XOLvvC1VXDAlP2ISaRoIfIF6vJB/TOhuMbCuztaYkGWvS9
	PgDu4oP1lgVFaTjoioURGVSIWhB8r814LhuPRVG6lW/rgca8+Fn3kXSPAJnRg51U2RnKogFF/jQ
	GAiEq4NSf8J+g9tnEjNPDJ8USE0nBmV/tD1YpN4XHW1BpxyobdW6eAfcMu8u8M8d6XFAu
X-Gm-Gg: AYBFou2Yvtvr0lHt9dOd0Mi1gExiVQqci/+B9q9dI8JbsOTPmZpu0R4i6vHaVSSLak8
	kq9yGJ1jGCZ/w8mmbszDy4SXf53HDnPhlbDSaw5K+sjWETkCWmT4ZyKRd0emJvP0JeqXRG8+IxJ
	j2N4Kh+r3X6+tsEFD+RBjwOiKBVS8MLDj5+7ygtSkwCQo1AdcLzYg31zOKxvDBw0sQMuLG13QZ8
	JhKPwt1BLmwtjSox+Q4tSJ2AoEexr3HcJz+v5ju3kqZYCpgglWkZ/ViZCcge1u+CmruJ0XtmbF9
	5rWvixtKJnQKjn8dgeGzAkAX1gc/+vhiCqo03hRP5Gchgl6h75ASl2u7n/U9SZ2E2jQkBBxlSzO
	UUhPM+CHyXyn06pTGmUGl/KAwZG39JpVY64XV9jnLiY9Ti1XyNuBNnmbWDNWn2Jifdv3ZmWt8zz
	tbSZgw+ut9EKkDGqlBzaMdfmktyd3PcfH81xj6NFDZwx4dmgv61jwWsVBndv/lCrQH8aSNhota3
	sog+Q==
X-Received: by 2002:a05:701b:2041:10b0:184:19ee:1fdd with SMTP id a92af1059eb24-1b25d28c0f3mr2485584c88.5.1793956636843;
        Fri, 06 Nov 2026 01:17:16 -0800 (PST)
X-Received: by 2002:a05:701b:2041:10b0:184:19ee:1fdd with SMTP id a92af1059eb24-1b25d28c0f3mr2485548c88.5.1793956636231;
        Fri, 06 Nov 2026 01:17:16 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e261962sm6603403c88.0.2026.11.06.01.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:17:15 -0800 (PST)
Date: Fri, 6 Nov 2026 14:47:09 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Ilia Lin <ilia.lin@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cpufreq: qcom-cpufreq-nvmem: Simplify
 bindings
Message-ID: <au2bFZv+KW626iEs@hu-varada-blr.qualcomm.com>
References: <20261105194606.772346-2-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261105194606.772346-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aed9b1d cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cSl9Pj24hSJcTmzJFjQA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNiBTYWx0ZWRfXzAzDDigGc8Io
 AZHlME4TB4dwWBwRZvf/IL69evetSNhVTBknULOUIE5492aXFnvKsWH68frp7F4hKdiN7jrqNWL
 hcsIwYdsTyic0m5RAfWPS/8lp/ln270=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNiBTYWx0ZWRfX6konpcuoIzmI
 rK+X6brSzvEGk+W9GpKS5GH7EiO9oZp4xuUuHCkeAOxeRjzMxQcrWn9J6UL6TpxUhn2B4WhHU3y
 epNW6f0gow6dsFXeR33lWgMqCWXcB/XkBmgpCFcoJhnI2kBAy+4XTGcE7wuaLoaQKyKwHb7eG0S
 PKkErFiuO7Pr1NeVkekneSOI02fe4ludNC3+o0kDL5AfSazVfpTNnl0S4O5q5buhuP0DUs7Y9+t
 VkEpaIHTR27w47Ykw7yvslN8ISkJM1hH4MrPzFfqX4p9wT2tZTl61ktxMgA9iuu/8XVjdwAj6ap
 FqTY1GUg5buBiT7cQ1cPCVTIA28Fe/Pa3u/wjHp/NWSMEV4LqOUXKODxB9635rccbvDKslT6NcI
 ekhmsRBPH4cZMmPHcrsSIN9z+yuHbsU7NfSZU3dVlAFEbtljue+Ize8U3N3d+qOvr6i2lA5r4bJ
 Jz0dXZ1F4QG215zs3gA==
X-Proofpoint-GUID: Ow0A3kBJFcHiqM0y8ZYQHiBYaGgLGABJ
X-Proofpoint-ORIG-GUID: Ow0A3kBJFcHiqM0y8ZYQHiBYaGgLGABJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060036

On Thu, Nov 05, 2026 at 08:46:07PM +0100, Krzysztof Kozlowski wrote:
> This binding selects a few top-level compatible machines, but since
> commit 389de9c5a677 ("dt-bindings: cpufreq: qcom-cpufreq-nvmem: make cpr
> bindings optional") only qcom,qcs404 is present in  "if:then:" clause
> which enforces specific OPP properties.
>
> For all other machines, this is a no-op, because there is no schema here
> enforcing a specific compatible for OPP nodes or any of OPP table
> properties: one can switch to standard OPP table (operating-points-v2)
> and this binding will not complain.
>
> OTOH, this binding has complicated "if:then:" blocks so is not easy to
> maintain and causes false positives when regular OPP table is
> encountered in matched machines.
>
> Drop all machines except QCS404 and move the subschema to top-level.
>
> Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks. With this change don't get the [1] error.

-Varada

1 - https://lore.kernel.org/linux-arm-msm/athPyI5nvYG4vmfl@hu-varada-blr.qualcomm.com/

