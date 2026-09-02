Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707CC287518
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 10:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344429; cv=none; b=iC1rKhUIUOT16LjSih3aOHLfvMnkIGC2HRfWdXhjUZMAAs7mkH8oUo6JDu6yLCi/NATJ1tEoXEyuFe3beIpVelFKLr+8GlPzujrQ/RP5odoFDWn51Qy5miyzUoeGDPgHCwKYmgmAYiXe9+BMTNyhtnnl+W63irISbd1DtThOocg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344429; c=relaxed/simple;
	bh=Gl/eblPX1ENd7RHGdBYgjQjGQ4WWSbsmq2Tw0xLJNTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ppy25ogjqVOFUZDk68nV/ZjdOMZHnl+P2VGsX18u//Z63HqdYkouv1gnkYIhjnB3kz43LlyQvQOYpW0Hj3glpC8/HXwIe/45UoXcIZeC+jMqw5+5NdWgfClony+C3E1EsnuYBpWNHOGjIVPFP+AJDYiZGJN/MRM5mBbL9ndXo/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=juTrCFiW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SS62O1hs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="juTrCFiW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SS62O1hs"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829Ms6X1143103
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 10:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UatKS6EJFQUBnBNuylWYQ1B7yyNJd+dkywKevNEdSaE=; b=juTrCFiWv533CV0a
	wablqA4MrIxCGKL23hrdzsX9xiB8W+QgWZ0dU5rC5W11cZByjSnLt9jemqEaSomW
	dzS7vy8Qi6KmeBbsC5pZL+eGF1GFgZ2G26U1JBzARbMzRGtmrq7eV9//gkW2V2k0
	JV/me8DXtmmAUNQ3Ex0aC7w9wo3CvKhu4+iM8dxrfjTu2QQGInO59W5cHaPqdpuy
	FAGrZG2Ljz8FRD6wx4f6/PYzlZ2RrnuTYwnBvxo86oW8UEfuJx7XWgZZu2jqv4h4
	gR29ByVgxNdRIv3f9X7NcnXO3TJu/7naa1cpO9WpdjdSsqB2FHFwY0C/Yx89ceic
	KTQo+A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge37j3cb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 10:20:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930bd2bfc45so28082885a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 03:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788344427; x=1788949227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UatKS6EJFQUBnBNuylWYQ1B7yyNJd+dkywKevNEdSaE=;
        b=SS62O1hsOqgIHfR3SHnPOtGM1fARuJfqQ07CPpffj9sQE1JazyPCoIzOdtWlV71MhA
         q/Xqr6FDTW3nlruelbYWXdRvh+Dtf9nyiQ1VIdbJZRQQvXQNr5QQ5MZhvXCbrIn/jGdy
         NR6TmUoVedVG4xx8BhMlBtKKh1qGXDuYhuZ+WQvQgq0+aOCjJ2WYLxgosmHth/ncXBEY
         4+HpUIdzZIIAP5a9x26XqcpG4EJuwOd6WjZQsTxtqvYyxeUSAS4Ww6D6nJC/a1BC33Pg
         YXOiiifNPZXtpMUD+rcQ2jwEeiZz+Hq//pzTwuM3UCDR0OnKafjjoZHIPEyWZcqysHNs
         BTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344427; x=1788949227;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UatKS6EJFQUBnBNuylWYQ1B7yyNJd+dkywKevNEdSaE=;
        b=RUBIZ/Oax9Mr+qOF4Gh92V/cuQPz7ivrmHz/Jd4CnqExBBlSKCb5z7TiYsKnetr37r
         kMAwrtMYFjiEwp0WW5Vule6gntByj3ITI+FyzWnkMUDe463fx538njnJHqblqoQu0ijr
         WHcnJSjto2zJVNjg7aA/hdBE1TsrPLwHnuEePYpCiPGAJuuh8dBZ4pUI1nj4kaEAw3eK
         J+E0zp9V7e51QMhiACJXhr/2qiibkQ5LK3AehhW70MIvED/MyA09ca/vHlYP+AvadNIB
         iYyNenIDWFlg4e5p3tKw+Aug68YM2EzDzexKO9PwGuL7opxcjjP3wkvmtD96zyqWEI+8
         t15w==
X-Gm-Message-State: AFuF++nL+A8oL0C7yQQRLiAtU+IAyBzPNkWXogRGaSZN4rPtxSfA0sPZ
	pCzYv6fizaoS9Su/fHpFZ3oSt1COX/wbEzS8xPgbb+bXnhjwHindiTOYOZLxzfsyTFD1QhJaPZE
	I45Euayv5aLUjAojdrvQZC41MWgIYz9mWGQjgf52JEbXvfCfNj/Tfw7mE794hCytSs/uc
X-Gm-Gg: AR+sD138tHjKRjgjZUC8QjtDG3FzBaEp15Yc+CplAP6I7opveRklz3ex9iSoYv4siqO
	9ymmKy7Nvk6cdGWh0fQrBu18nuzPmnP3HSWoxNIKwPfB3JTX25zli4V2D2mUUCUCyMozWzsCZvE
	sBmvatjef4bXG+f+1IZAomkqKPV/UF/4XCEawgn9UlX0XcJb/Jxd2HQ7EtLRJ7RGoaKWnBtWMS0
	lcv9/BsmT2t8eS/Wc9Vne1ZI+1gLGvPnxhQ3mOorFyDpwJuZX7atHT8fOA2mghA8ZsbO6RHwHva
	Q1ijmtNFYY1D9SNOu3bcBwAScKwUPpCfZKtBcMDwmGkjQy9i0zcdt0WXMFbSVmL5rOpw2nl4IfV
	9iK91fjI7/GoyTjeEzJrUeg==
X-Received: by 2002:a05:620a:4387:b0:939:5fd6:9382 with SMTP id af79cd13be357-93960ccbe4bmr256778185a.1.1788344426599;
        Wed, 02 Sep 2026 03:20:26 -0700 (PDT)
X-Received: by 2002:a05:620a:4387:b0:939:5fd6:9382 with SMTP id af79cd13be357-93960ccbe4bmr256775285a.1.1788344426102;
        Wed, 02 Sep 2026 03:20:26 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f9423f5sm812539a12.22.2026.09.02.03.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 03:20:25 -0700 (PDT)
Message-ID: <5492ecfe-3c3b-4bc0-ae28-1eab79f6936c@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 12:20:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Talos Lyra EVK board
To: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Akash Kumar <akakum@qti.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20260901-lyra_upstreaming-v1-0-e3a76dc9e21c@oss.qualcomm.com>
 <20260901-lyra_upstreaming-v1-3-e3a76dc9e21c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-lyra_upstreaming-v1-3-e3a76dc9e21c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kICpHizFRyrgN0qmz8eOc7rsXKdJI1of
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MCBTYWx0ZWRfX7jZIo/BZAri0
 R47MePbZGlCFnewN4Lmg5VUGHRNuwyxRKWyKxSI4Sac70Z+Lm927of8sCbEiw2oyUx09TkD7SHO
 x7FWCK15M/SL49WqE34KSeExYRat8RE=
X-Proofpoint-ORIG-GUID: kICpHizFRyrgN0qmz8eOc7rsXKdJI1of
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MCBTYWx0ZWRfX4qFWw7QEecHM
 EogBEbeU6mydjlebBpL/WD746HP6omM5zGRvA8suQIJD8OcPaOBKdZQvpj44rpyYdREN/lOgrKY
 bZneZupMTYaujYBuYZdmExwaAl69FaH88EppvOO3PGoz6Aatq44SuVY9dNum4mLnUzSG/FHMMo0
 pYh463YYkm3kUbRG0TfqLLLMD1RltPxOdJn4k0Z22q3q0+2bRrwLbz3iLhSUnhCY68drHpvgqTQ
 qoej9ePPJ/vIex6QWKxbeK/PC0rQBbu4rRA787qX7Z5KbEtaJKcM8qjozAz2MH3sfrUwxfGvw1O
 U2oSuCI2M6qs4CaAUAzpQN64u7GbktBMQytdv5c6m3VSrdDY4aimleL+o7aGL+S2ZT/m7qjApSL
 V5CtTHZqeujMWRrF0FalNxaBpdG7ddRpB7sCIu51vTqCy+bjXUznpqNY2iZxnywHbHZdh0+6bcz
 IYsHcQrqIiPp1xVfqew==
X-Authority-Analysis: v=2.4 cv=PKg/P/qC c=1 sm=1 tr=0 ts=6a97f86b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=xvvC8mGeTzBMa8I3sMMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020090

On 9/1/26 3:44 PM, Avaneesh Kumar Dwivedi wrote:
> Add the device tree for the Talos Lyra EVK platform which combines
> the Talos Lyra EVK SoM and Lyra carrier board.
> 
> This device tree adds board-specific peripheral configuration on top
> of the SoM, including:

[...]

> +&i2c5 {
> +	clock-frequency = <100000>;
> +	status = "okay";

nit: Let's keep a \n before 'status' consistently

Konrad
