Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECCA33C1AD
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787052871; cv=none; b=DPAC/pz0VHLuIo7rcPFF4ZI0fagriY/NcQ3V4N9JtV5gnW1/qKT+ss+TR9Osyp4lWTcmg0L5KoCZXJEvp+PCYcdzRrPdsoUHKJvDnfqUDVGt+r3j9eqGlk8BKbJwrGfu9hAHpngVAECYX9hRgCEd/qxbOtQd2WQj4bw7D9R0Jis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787052871; c=relaxed/simple;
	bh=dTMkw80f1Tv+3rvx0Re1hQ7fMXnuWq60opG2/27MNlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFfoiYSEE1dKHBsMeFSaMOi9kpCtitR4SQ7AHtaJXTwzobqjjEOv3LcWEODVwd62EVgJa/f2rLGd1Ytvjzh1fiULKaQ6ctEf89Tz4/DyFhfDtiG0bQ4UHgPOkF5EOobZ/ZxjRSuPqLxmqopbuzMxvVgL2CRIGVeIcUrW21AehtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=STh3g4Is; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F7QsI44H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="STh3g4Is";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F7QsI44H"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABasV1336398
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1j9tERMxb8x/UilY9s2W+k0K
	iXo8GD+EWlKCA/SvldM=; b=STh3g4Isn6yZtfBha9i/CeCkzH7V3UkCCuU4IaJR
	jjjRE+m4iB0DIx5tLkwDmCaWl6IwFJ7So+E3bZ7xJ3azHsn0SmrW+zRYHusbIrNn
	RtxNZNNwJnq1KNJiwsYpByqIwh7SYQ65Kf7g6TS+D8f5uJ+fvkHjYVkXE7/5VpKv
	g7kogyXB148Pc1VPs4nA7vZQ9tngVtbNM9wQu4DZGmsSH1SahPp1yfi0AOfigax2
	57vY9qvNYXgh5H7TuOZjkqc9saXKRKmmBqSSPwET+lDJzPZIZiOosC4XHxP7afvH
	hm3+6878NVx/P8pdFm8kXeMe/xVpUtPVmfCIjL6y9omK4A==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fvp1tcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:34:28 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66b28f439c9so10859007d50.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 04:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787052868; x=1787657668; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1j9tERMxb8x/UilY9s2W+k0KiXo8GD+EWlKCA/SvldM=;
        b=F7QsI44HjKEs9HPKGahCT6zpxSa1ggb3y3q6YxRmzqIaoXqBwB5JMPQOUhTnY8voKA
         3pF/w+yhw/UrtBbe0BSs1ArTSVTBmNDXyoDbkrGU6D1vDPHqcAFmG8KLRq55jbhkDsVM
         B0OufKvVHtWqnt2HGyb2bNjABox8+IjbMZyuFWFdGfu1M+QSCE8w67W6OuplxsyakP4n
         KwpJwuh1fufbnSWJEHWE66SP/gaZvIGE6q4HQSHpZpyIpPoHOI9xQnPLE/4hZUw6Vp5H
         NEdljscvijJO/nBqzi5vtqt98NLQofPawXS7NMZCPqJBPBjYlQf9+P2wnKze9Sh+XVzj
         Xfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787052868; x=1787657668;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1j9tERMxb8x/UilY9s2W+k0KiXo8GD+EWlKCA/SvldM=;
        b=HAFVQKscNhhlo8frlmskrU/tf/crPypG+9gmzC+oOZ/S7Q/U7DDHMLSNWoMeJalrIR
         FTplMOLzszSI2qr83ek34Rep9vAlt/WEMf1TIBEpQ6VYMF4dsfX9EuwkqqXlFu4kKf3u
         t1qefwt2cEuzYfKTDpffhp0HFJTN4WDzicTt37FXNWVgvUxmPKnO9LP2X7uY0ZO7FHGk
         +Yo7MTQhNtklFiosLtsw7DB5xyyRbCR2li+D4Vu29RyJlm7tcrXoVLp7x6hVc+cpGCfp
         gNzpGVYXaQRjj+HjGQrWAFAaj4co6Ef3u+3DWh38xoi3wuyfhKkXsr8Re3mvbw5tDaNA
         eevg==
X-Forwarded-Encrypted: i=1; AHgh+RrfhhDr2usGTFXgklld2bIaoWtDT9tiN9liJAK2TPSW2UrQc9Ab9BqpGz7Ysx9wNY4mC7fvTeihHnTd7u/o@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh/6d+ggCIiPAn5gI8UDoeDfuR825NCW5ZS8uchP5WoPVEE24X
	ahRdyFjsPT+B0PCL3Awc0EWLMxG6FwGR8r/VV8LcYTJaqg+JVein6dbV646I6CSh5gnu8UDmEs8
	dvJC4bkKRD9jZb/27xsPmubJKljRYcyOmGmadLZQxkKHcfWKg29HQif6RpUUeAeK/4hWRspB120
	ogEFKktQ==
X-Gm-Gg: AR+sD13LxL+o+IpcNu4TmIm5TUzMM5PyfppffRxORZeFevK6yQ2Wh7a4bKBfWR/bN5J
	gs4+SxThi03wh9+FEfdzdrQTZtjR2rQWGQ0y2PUFaLZnkfg+GIzwe5Xw7/1F5Dwg3/Ip3yyV4l8
	3SNEJ6Yn2/K6e/g76UQbGIR6zkmZYOKMnOQ7awl4acv2EzmwU332/zcWFuT80U5kUzzxK2tdSP9
	2EbtmP+eSJfirjJ2hsWujIyZowrLtNggzydGZapIWo39QibSJDbO/2j73SGw9hDgMQwylbfTWnf
	6E9K5BK9SsHiuxEOvfH+DEHnJDcbZkyD7Y6JPOmf/KakyIRqZ3K2PEPsfeKiAffXTGD+fj45tZW
	aogUrLBR8eoMSTOeYUdEImNdsW+YcL76hpASaXdf0oH0Av0+tKtvpWc8Uj/ANOhL7kEufTR6NWZ
	ZxRh+rQBB934VR
X-Received: by 2002:a53:9003:0:b0:66c:bafa:b7a9 with SMTP id 956f58d0204a3-66cbafaba87mr1943235d50.52.1787052867949;
        Tue, 18 Aug 2026 04:34:27 -0700 (PDT)
X-Received: by 2002:a05:620a:6018:b0:936:576e:227b with SMTP id af79cd13be357-936d234d896mr3499939285a.24.1787052350642;
        Tue, 18 Aug 2026 04:25:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b1f1852sm11079811fa.38.2026.08.18.04.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 04:25:49 -0700 (PDT)
Date: Tue, 18 Aug 2026 14:25:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org,
        bmasney@redhat.com, lpieralisi@kernel.org, quic_tdas@quicinc.com,
        danila@mainlining.org, davidwronek@gmail.com, robimarko@gmail.com,
        linux@gurudas.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.vger.kernel.org
Subject: Re: [PATCH 01/12] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
Message-ID: <xh445x6lbr73cx4xxn4dkminza4bp2i5dibagq476yidfwy7wm@hjt2edzhkbz7>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
 <20260818080754.4362-2-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818080754.4362-2-sreeshankar0910@gmail.com>
X-Proofpoint-ORIG-GUID: aRjHxrBQrMPrU18BquHRM9y2LUkrd2-3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA4NSBTYWx0ZWRfX1NW+9kPkqqeV
 B58YpDrUzZitK0A5QT7QObpDE9AKCKmhvvyms5BTB0sxmdK032rl7UTfz9oM6qIOc9jgfHPjtw4
 nhtoPrcEPT/9UJGz5ftspBPWSxuLOHojFjYd6jRRM4K6F8Gj2UK8I6Z0tFrpSLFhqAp8Z2OP/Lx
 FSnXIvhvYyIkWZ3VAIeXdG/+PMOE9fnLeMoln6QfdWim3l+0i3xE421GWXfVwjOetWwAezLv/dJ
 2t3pBgUU3Rw6gDBs5MvKvUqxn1CNQdQEKG4BhG84SoORluIi6vgYNs/SsKRTY20BRrebLVIWdSL
 p+Ib/5Mxjh6i8icvVcWMqoOd/vfBICqk4I3Bq8vw32jGrQOCU5CxGoJHINCLRfXSZOLJPBF0db1
 XVlVIYD3GaOkJVlPmSXcZi7046CvsIb/B3WfvI70ydiYwFWvakKBCxBe/wt6aWaAmZC10h/yqck
 H64EBPfgRJyUYW/nNOw==
X-Authority-Analysis: v=2.4 cv=K/IS2SWI c=1 sm=1 tr=0 ts=6a844344 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=PtJjGYLjQKqNYAnhcSgA:9 a=CjuIK1q_8ugA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA4NSBTYWx0ZWRfXx9edTBTq1jYp
 RSkwYwy7oQAsXp5Crc1fkAPGFrw4GRztvgY3WFl2cDpQ4axA+otKVciWbFeGX49GCLvBtASD1kg
 aDh7HJGJtrmDgq9QyyCmE8lKnFq5gkE=
X-Proofpoint-GUID: aRjHxrBQrMPrU18BquHRM9y2LUkrd2-3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180085

On Tue, Aug 18, 2026 at 08:07:43AM +0000, Sreeshankar K wrote:
> Add the ID for the Qualcomm SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> ---
>  include/dt-bindings/arm/qcom,ids.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
