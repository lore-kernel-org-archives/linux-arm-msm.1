Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B0C48B389
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787157988; cv=none; b=NKlqDfkoC+HIRViNJ8QWxVX4C2fNenncbgwfsz5n5chSGlRsDIw1TBy7yVsbsKFrs4P0NWOqqQcYp9adTC3+AgclbFgiTiNQ1laxEOy9qIGRMvZraCIVUCgSLhliH7k4vi9gZWUyxUKdVwTRXAh+ggzYAb4SGzDvWHE+v/xvewI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787157988; c=relaxed/simple;
	bh=YiTvsfFB7bNds/Z7SfqqQe//GOmHOJ7p3LWjA/KuCSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+w1LTQLo8yggjy+Rq77+R3f0eBLK5ddFMKHeUHVWpDhLJU1Vq07VwZDhL1UugJna6UIEIBlBRLg1KPuMAiJBzjx7gIsojWgaFzfxFQoyKHIMvZ/TW6K2PrG3nUuFfMfk8NQZQlzpNLLYRzHKdFYFUUCkZpotfgqMtHw47YAYC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OIkjmvRm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NYD2lw+F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OIkjmvRm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NYD2lw+F"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF1g8a212231
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YWfB7Q5tO41La60/0zJuXCpM
	Dt5Vkv3MtkfEPltGlWw=; b=OIkjmvRm49YWv1pNRWsrCxlS4N8xG+AG/vKnxjPJ
	1A2l8ADC3//jXZ47rV+n/EM8Yy9ireHqLuu8FOO08sqGGrHM0I4rCSjw2LXHU+Hy
	apaxs312Pif3Z06rYm7WNsHYfJr57t8iGhr/SOeByClmYvWxvcMFMJ74KrbHS9wt
	WJq2erG9BEDOEVMPYKT/CohgYaCAxYhFufVK2vDw4CypW+1oeS40dh1o6jeUiqaN
	HAQA9n+eBNUl1PUbRmlQFnUmUVu2tMQf4i+Nt2vJe8X/UkUf9hWAHdbX8cD6ywum
	WQ3TAKUDVH8Ifb/MSZAHpPiBv7e/528ME8g/O9+mM24CQw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es4gkas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:46:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so256427385a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787157985; x=1787762785; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YWfB7Q5tO41La60/0zJuXCpMDt5Vkv3MtkfEPltGlWw=;
        b=NYD2lw+FFHDNww/GJD8I5H9sGJPDS1qqq/rXQt4O4eMKMoKJBkNvJ8YDw/v2diobzN
         QoAT5HJu0yjBHztxhOp3OFQi6LMgz1X68TZTBSNT503qL+Mk9AV5vNgzcOWmEdrk24kk
         8yhP8re1ZgoEcVJa/CQVjTAfzLrjZBHcsGuTrH4vWtY5zh5ZAl/YX9CI0MuVhDcL7kY3
         z0lgLPqvuPyhmFOHwLiS4JWjAcWgtxwUgEijrpY4P03lIreulcMGx5VcbXk2btZjYH8h
         nTZ2ibk6QQ1pl8q0N3s2wQRVwAYv6pxpegONJL41ys5xTlrywgQBbQ+pd94pNDNIHXH7
         PgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787157985; x=1787762785;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YWfB7Q5tO41La60/0zJuXCpMDt5Vkv3MtkfEPltGlWw=;
        b=RzXDomhyR6UlGsE1QF/SILc3fp7cCkNyefIF5F2I5Ibnsb9uUXA+f8Ub+xHaLA0+D0
         3zmI+SoGnxPZdK4nulyf4dGhSREtGR92LcFDCLD82SdSl0DKiv6UM+enVGrRZ//SiaJi
         vCwZdBtvPnPecqRRPA0DHs430wjuXwrHkQJKnnIUeUuyXcPfYX0vvawtMEU7AUtSEcLj
         3uhgupEvuXjgkVb/SGEdHrsD7KlDiK8tgLfHp41wlRX9GxMs2q8kXetivftX2lQpuiol
         IZKLLUFivvmakTk0ldbZHlL7YSsBag5edG3Q5xpap2HcQb43axG1fqxSJ5tJcYOKvMJh
         Wz5Q==
X-Forwarded-Encrypted: i=1; AHgh+RoiNyNrQNZcskpeFhZFJGWPo6zRK5zN9THZa29AKgk6iJgF2bGoCVPQlmrKjq0egqQvcT4NrhqGQRDfuusT@vger.kernel.org
X-Gm-Message-State: AOJu0YwylnZ+CgQB5urBj5bcX5GWoQKpdoSMDCWF5munGgroQOaSZoqk
	K3nhzKw2bfIV81Mog9AoWhieE+27Kvv85vZZ4myxwCa4bxm+xRFNpaUMvUPsyONJxwBSgOWxrh9
	LaTKTkDbkwl0VXg2FLVWT0rS5f+/vMquEvV1cEtfIr9fu61qd/N06efMd2eIyXKNyRcfS
X-Gm-Gg: AR+sD10QUXIgxfpGIHhTLajl2yZulxSEYDjQMddhvh4/jzXqqSrtdrhYVE9lsbMUvyU
	T6nzpZA9Qr9UdAlC3BzaHS1Q8esoFLIbSs96PaZpg1IhlUqU4CHIKUYFFTUCdHd3jfhxCJxsz8y
	0raCPaPZoV1B3NIxcIIoKoF047hVtvLuF61YgkEnw8upjeV7Xj8Y5BDZL/mpdKdRM6HqafOonwW
	VGjvvcQ6k/Oan8eyKdPjDU79RZJb4powmf6/yJik5MKa3c6dIug7Hq7MPM+cVh399WUQjqJoURC
	v32wgtKZ0zJ4R21BXLicGRmWvnBcCJWadmD3l9qZnY2Cfh9MjSppS7DbKQ4szUKdAYzr/l9jl51
	XytSUfrHkMfRQj4g=
X-Received: by 2002:a05:620a:1712:b0:933:a17:c0c4 with SMTP id af79cd13be357-9371e1de2bemr523838885a.9.1787157985078;
        Wed, 19 Aug 2026 09:46:25 -0700 (PDT)
X-Received: by 2002:a05:620a:1712:b0:933:a17:c0c4 with SMTP id af79cd13be357-9371e1de2bemr523833685a.9.1787157984458;
        Wed, 19 Aug 2026 09:46:24 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1441748sm6914497f8f.8.2026.08.19.09.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 09:46:23 -0700 (PDT)
Date: Wed, 19 Aug 2026 19:46:21 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 01/16] clk: qcom: gcc-sm8250: Tie the CX power domain to
 controller
Message-ID: <na3brywyym7r7rnhbu4gs7z42n5gy55l5u6qmaimvvc5cguofb@ggjp36237nf6>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-1-840034124e73@oss.qualcomm.com>
 <cb3424fd-15f6-4ab7-9ff5-d82e42a13bf3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb3424fd-15f6-4ab7-9ff5-d82e42a13bf3@oss.qualcomm.com>
X-Proofpoint-GUID: sOTRu0iQdPrR9-yxd4Xz01ODrkWcbrHY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfXzAVZmWTRv2li
 D1nSs/sQ3FDTORUhH4gNgZQ5Hd5D9KTH50GtSH2LfcxsgRJ+f7nw0GqfBVGN1ir0ZAlIDeES1NF
 OjaPKVduRUoIiXQAzLJq1XUnA1yCzdQCFqwOf8JZDDK0xDtMHxpTFyofpGLuylgCEF5oZUTg90g
 wHJ/nAOr3Gk1YoZ7ypnvATlaIoGaUWUOVfG89wpWqsTZvBdFungKW7Qblkn/UOE0IDnNRXumnTR
 3QA5GbjAvhNWIsBe1XW5gtroiZoJqSV9EWdQkalRksJMDAZpJn5Q43QcYfdc4Fuadz/nMR3o/m6
 GT0X7hqgywSRj3Pm6eU7wT93WWz14zf2r0nuEVm+vnATx3MfosZBvyRptwK96mXYdg9Bg6HTXKo
 jIIVJAq3LxNwlgx0ElFoe63gq+Hc6q94BZIPDvotN0GMA7UR2iXOP7VjoadyxdZL77JDdAYbxd0
 AU0PqKIfiZOnn3n9JKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfXzDv205jCNYa1
 7p3676T0GyhzorIcehpizL5t50gjLaY/7tI1lh8FQwCsqTximRltakCOLmuJehk/OZ6XzY9UHNt
 HZQD4+g3Is0kbJPFtiwAx8s2wM5wbZE=
X-Authority-Analysis: v=2.4 cv=CN8amxrD c=1 sm=1 tr=0 ts=6a85dde1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=fSiQ1cC45zYv09qsNKgA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: sOTRu0iQdPrR9-yxd4Xz01ODrkWcbrHY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190130

On 26-08-19 17:25:57, Konrad Dybcio wrote:
> On 8/19/26 2:51 PM, Abel Vesa wrote:
> > Enable runtime PM for the controller so the common GCC probe path resumes
> > the attached domain while registering clocks, resets and GDSCs.
> > 
> > This lets GDSC consumers propagate their votes through the GCC provider to
> > the CX parent domain.
> 
> Not really, this is rather taken care of by the special-cased
> single-power-domain automatic attachment somewhere in the pm core

Right, my wording was poor. The PM core's automatic attachment creates
the CX-to-GDSC parent-child relationship. Without runtime PM, however,
the GCC provider remains active and prevents CX from powering down.

I'll respin with:

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Thanks for reviewing.

Abel
