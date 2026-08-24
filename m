Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEF61A0BD0
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787559111; cv=none; b=QLabz5R2MZt5wTZmPSwceCb1ghvY00mzXIcJjQ/KyV6O11ggP9vrtfn3VBwZfgG99bey0+WzODmZKwNIE9NEjgJv5Sm/hxtNuy+5k6YGHfGZA9DYeLMQ1SzwF5Mpmd+Bv48UuipXJZ7BPpDbvc8829CnXl7pB440y7KeYkP4T1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787559111; c=relaxed/simple;
	bh=+e3Xgxb3LMzHFlTmYDiN7cTxW7223i6Wfo0ZsK7TIiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a57pWawcb4XxjduGrg3MUW33pjnf+1eEsP/+MP7dKTrUsrbxEi4lNKKaurAeoS0jrCcpuNtBrsrnBeUXayR8U6Ui5Fxk4sCQ+xcIHOaStCIjYQdD5ECQa8l0XsLetryMKCYY9xvS6iI1EO9XwXS3XwLk/KyfShpa8ptGecZN3Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mlyvvyH/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XO1PLuPz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mlyvvyH/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XO1PLuPz"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5REii2602049
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yJFNTI2OWzi1gI7SQwWtogP9
	F97USQ9uOEOKburO9Bo=; b=mlyvvyH/Bua/Oy2/uU+5nW7r3O26o0/IRCUIAQV5
	/ySJwr74ILXExQoa+yAPVHbWMGp4WaEkYch9C6yCT+cpHOpQOPZoD0hJWDvqic8w
	qSE2huX+unzSoUm3Zxf/FMusK1uz42i/v69V+KANxq/eAF0CFi1sGsov4+0BC9cw
	NDeSLvQpTEnmuj1qw3xk6MavsA5YJOai5/vDIkr0kmZ45ChOIZcvDhDb+fqwRXW+
	L7zY6p52W8KVSNyKbmFMrik9tXraS8eayzGlDdwrqatcJwRBqSdxwxabrAlaARTE
	HCh7TdRJpYZVuRA/YoTZx3NNACRyrUtCVBgSqOsEj0N7BA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744wwws7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:11:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0408254aso57018761cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 01:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787559108; x=1788163908; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yJFNTI2OWzi1gI7SQwWtogP9F97USQ9uOEOKburO9Bo=;
        b=XO1PLuPzTR13mt2+sgA5o/YA3O9pYab1tWxN1V3a9f1R7QRf6gVcWzSj4n13jSUaAw
         Wsjw/THgm+XLjCQ3nSVx6YwcpvSDTeQVbPnXzL73qzv6wtwBH9wDxXtr2xQfb9QKoyeU
         kwgEZy0wMSXIHV9j6G8p/0Zbg2w3DTV08UPIsKvVCRwkF1pMQePe/2AWhGwwYcFCv9xg
         LDFoM69T2K8pU6vppJl3ivRoYjZKlYuSHZnd5S0V+voIt8W8YNT+QIl9APXG5Rl0JLlx
         n2o3K0QmNKGaq73MsfJjcIVIL2nXkin4A+FOg9qW14aSaciZ4PsV5Iu7gITpx8wotO7c
         RX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787559108; x=1788163908;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yJFNTI2OWzi1gI7SQwWtogP9F97USQ9uOEOKburO9Bo=;
        b=giGWh0fKg3RJWfGXj6kZxFnsygZLrm1yjJCZ0wop+b9bh+WG2LaIcBmUCc5F0ERqq9
         tSjUaHIUN/0SroS+H/8cby1Rw7VKFCttrw2cL0tv3oJEveThfKXczNFmeuYPyWhM5TE3
         BEXGXpSEi47R+t2k1uGADgbN2I7jC8B/90lWMEutKh4U8wiGObw2zUpNX/wCmO0f/7ct
         M6u/PsJbvvxhEQG9joB+OTiw3kX2U1Eea06RhZd8nx2K6pHMB6Ge8ocWsOtZz4mlMBPw
         lnQ1qufm93DZ1m+JK5p4vzB3LUG5mINhCS+1HB+6lp3KO0DAErR3TEmunSgCl44/MXDX
         Rhww==
X-Forwarded-Encrypted: i=1; AHgh+Rrw1RLywjR3dL1rKwJ+2/Af2UpRwCmTuGdQA1bTfDoIf5VU/B5c0TqD665FW9iah9SoOwNpmr9/1SfXJJQz@vger.kernel.org
X-Gm-Message-State: AFuF++kHe6c4f/4FWtlpDH4+eKfY/oky0Tp+5V/L7oN/27tkFHtwNayj
	CU44Ow+k5KqCYi+FPZHIgta70esvb83GeGra1tHji0K5zWHpv5duAKkRPFeaZP17Uh25Ey8iarP
	eoExWFP+SlBGZ3iKgaU01EK/RWA5jOac1d9XYzrCjpxcwSK5m+nbTAu7y5AFmK/vpF+4M
X-Gm-Gg: AR+sD11uNAsSVsH1ZaialbAzmiZRN97wbblhLBMvPsxOwicXtUmwX8x4vhIOiT4i5vt
	uycrvUgWXFwO2UhQmFmFE86a3EqO2eAm+fppej0e8dr+uYp2CP1EG3/BJhE3x3m8sgjtW72aJja
	L6opr6SZrXXBSppwfeBlDzoqHI297dzgb4XqLJFEqcHTVBWPRwMpq8LJ/cb1z8ug8trd+noHqX8
	HlwCA/y3RtAsOBxjCanv0J5IFJqp6e/HcouiKeHnLirlGeUYH6BMQIuMQu74BfIZyXAk58SodAU
	cXqarP8jfJeYhP6fERIBraFjpNJvGyjW5+lbYw4uTT+PvY8UlFVfQTmY2zEDkNFx3dV22zb+G58
	0agDKMlt2y+pC+G4=
X-Received: by 2002:a05:622a:5810:b0:51c:b91a:33f9 with SMTP id d75a77b69052e-52de307be8dmr327017401cf.13.1787559108246;
        Mon, 24 Aug 2026 01:11:48 -0700 (PDT)
X-Received: by 2002:a05:622a:5810:b0:51c:b91a:33f9 with SMTP id d75a77b69052e-52de307be8dmr327017171cf.13.1787559107817;
        Mon, 24 Aug 2026 01:11:47 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606a905sm1281575766b.13.2026.08.24.01.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 01:11:46 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:11:44 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Add EMAC CNOC APB clocks
 for Nord
Message-ID: <atahvswxprmw7bggfihchccl5pvmkta6d2fpsadmnldhw3wjuk@chsmbftw4olp>
References: <20260824-nords_emac_apb_clk-v1-0-290767386bf5@oss.qualcomm.com>
 <20260824-nords_emac_apb_clk-v1-1-290767386bf5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824-nords_emac_apb_clk-v1-1-290767386bf5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: B_BPosE3KD7ALGCCqaO-dbQhP_zQZdDX
X-Proofpoint-GUID: B_BPosE3KD7ALGCCqaO-dbQhP_zQZdDX
X-Authority-Analysis: v=2.4 cv=KuF9H2WN c=1 sm=1 tr=0 ts=6a8bfcc5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=j4fkHkYekRfnvDGNaiIA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3MSBTYWx0ZWRfX3cAigtX8/nGo
 BfbTS2MbE0ADAppKABzGoCHHHK2mC4vxCnar6kTGT2LRVxSxK34NRBPtY7nzlr8b5CD3/kNddSY
 A0OZqRLe/0i9eC2FiqZOy3D8g6QkIyennyc1FTaW0IrlhMokKJNrFfJzRkNEPiM/cqWPg7J9uQv
 Ev52gvFvwUNF/QQdsxbKM6QsfrO9vKEMatOOQhizfrJpatETmsaUPMva3OLAFvF4IWcTKtTiCPb
 0rgCjzoMYXxtQFry2sE66ZeDcLvM3KWftGVKcNLzHPMGHGe0vJt0nyzveM/F4JyTlgSJAxMB/S2
 fNjmQw+OuuofhIs2YKro557ib0+zesLqZFprxnRtofelzHQXQyXRq+JJTWZCRRhPtNOWjNjC+On
 Axn83oeJnTFGFOhZ3UzcXb4Rg72YDoZkZMZF6E8479JRB/UwbZmU2q226JMRpCvMweSu+kGNhL+
 S6km/htxN7+Eh5QsjTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3MSBTYWx0ZWRfX+6TLsF8+bprb
 YEWxhxRD9tn8z5cDD3g7XyoOs/FGK1oSOCc9EsIEFHLivBE2WXOeKVxnvwJYVyhS/w2Uitw+T9V
 fO7NyQgaNeozK4sOO2DZs0yVfHRZlwY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240071

On 26-08-24 12:23:29, Taniya Das wrote:
> Add the EMAC0 and EMAC1 CNOC APB clock IDs to the SE_GCC clock
> controller bindings for the Qualcomm Nord SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Fixes tag, maybe ?
