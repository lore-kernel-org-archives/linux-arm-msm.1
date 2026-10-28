Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793166736;
	b=012jCuSKons3VSWEJbA/6c68h4mbK2TABx3VQyxAa4UB5vpjni595Y572w4hQIUgOPPS
	 rfL9an4BMUxW/ymDeOQSSfdJEsbxPC2u/Oi0AQfaQPjHY8qgaDcj/ectdhIrJiY5tkfwc
	 Ha/T7r1JJOvAmgNjUcNTJMXug810+FP/WTMgxBHkCOyi2nrMoxTQP42L40M+x+q5TReUY
	 41ujdsZ8k4CivC4l0VquuKQ0IE/J0Z0UB7S7XqbOmHwZYXdeynhc+sqU4eRsD2sD42MHV
	 fTJR4xmG5i6oUHrOOM4bvLnKin4cFAg+h5Gm/G19OZZy8HHvJVn5xVRp6X5OA4mWcvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793166736;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IYwAwKNsQ3Zd8ZLk9m7XPS8ilKZ84ltU/SVOXi75RGc=;
	b=mOr2XBanZ+xiaCu0hBlzKq4Nv3YjPQz3O4ZaYDVvnd0i6OM5IVBd2YdD4HpgwXbLySZX
	 sR+hrYXs89jAO6U5ToTfRgYJqeVvn3xKMbw8xWFiAsExqKI8mARrPx3fkwk0cb7afOSA+
	 MiaGRFmtpk+mO95D4YIK31HUeiFGowMTSi0gzWz2mLnXV/eFNEUDe9umQw+w/y0GFTBBl
	 tHOdQdPlWeQiv/0NttkdmsPju/DBR9Kv5WC8rfFHR5Y/X4Rly9jB/XTzUatSNHp8JbEpS
	 D8cpCIqZ4O7F7qbHucNZOb1QmF8OtuQOmHR57w0kiejuvYFeW+RF00OhSktoe3qrZWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mxrq5ZP2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YvKlUgUO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C4B606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 05:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86C4B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mxrq5ZP2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YvKlUgUO
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PVPF3936453
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 05:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IYwAwKNsQ3Zd8ZLk9m7XPS8i
	lKZ84ltU/SVOXi75RGc=; b=mxrq5ZP2SPnzmMiC/Qy696KseD1ZZy1gapprx1mU
	zN/p4ufefQGsT1/fkhjgx7wuSqBcuyBDgjt2fZZ8OSt76nRpeUI1/HLQcfGdDUCo
	RWw2f+u39CrgcOIkt/stfVvRTBVpBWhm8+32a1mecHUZxxO1gr1+ntETzfdc4Fwf
	yBNmLmFK9hpll2pnVKxQbl2SnIfatRZEVDfG90CBE9hPvYS9SvjW8859JIPOT0oB
	jDeGM8Zx9CGD9dGsLi3t8Ch/vh7NTrLgxTcoSUso2ZJsLi8VhZZWMleX8/2e6pys
	jYDviIBiopLaauIsC+viTaxu9+3ZICjOI5HHNbWCc3TvGw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be103g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 05:52:14 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so1255433eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 22:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793166733; x=1793771533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IYwAwKNsQ3Zd8ZLk9m7XPS8ilKZ84ltU/SVOXi75RGc=;
        b=YvKlUgUOCFN0Um6M7SsoFnS46nPqCpb8MD6PN/fnH3Fb88HIAv9OL2D08m92eMlJNP
         NC6kHKlMsafI/UtBrX860eNv46hLHKUUOiDtC0XdjmTLU5lN0i+cl9Hiib9HZY22KjDQ
         7irI9xIJ3ry2DC3r89g48EzLpWIC++D9dQ6sqjbxbPCa41liMi6sG27kh6tvsWqN2AOe
         tDmzTIR5n5UPViAUMBNPGePx3tfs+C3L0R3aRYPxdLoboSY051iVdGx6krOtDw+vuy1K
         +vq46tPcCj31/p/RhUYxqcqr00/E8FPEHoc+0tjKUi6O4W1m9ibGrOj1lqxZErcV8UVS
         9PGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793166733; x=1793771533;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IYwAwKNsQ3Zd8ZLk9m7XPS8ilKZ84ltU/SVOXi75RGc=;
        b=kGOarPpML7gjjp2bgC9WS8QlDY1BVoMl2MG+T12mFW9xbQZ2O3mJc3uXh+NAJp+TIl
         /OhrUXDzt54VV1/5rZSFpCQypX+KeD+my3g8XcFO3UotPRT1VsZ2cfhLX3b03BIkkhkp
         maCQVRkMERiu6RWT/LYqBeUSeKOm4LK72niog4mgA3UvlAzZiNQ0/9uukNsX2g2tuw26
         ce/1YczXIYAPVkv0GHgkkdQfhqlrbLJ3r1clh4ZJtOhyGwQPUKU4B3Jqf5q3BSZVqIe6
         TXG4pjFHa6Tmp4R6tlTKiq/VINS9X/R6cTsjP9K/0VsSHA+Og1xU8O+LZg7/VpG1bVgS
         xvUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXv1dqdDiCtvWcZxdC4ySokitVcezHRaSCXV/uqhFm1/8Z3N5/4499ZhbAzFIuUjSWo58GAN7PQv1dnY9V@vger.kernel.org
X-Gm-Message-State: AFq9FYJluis5ZMmmP2298YuU1lTM29+M03QU4u854rntztODHLEzjIwh
	j0kOkq3COyjE7erE7e8XOF+FV5SfH/e7+XvY9yqqmA8gRcK47/6W9Jzh0sBuKaHEsVBmb5n3bgT
	RARY3+gSt3YMLjTZO9WhABjnlrtHm83DfCW2uWpGRwY6hlUc4NWqVPOsJyPeXteXnFOA4
X-Gm-Gg: AYBFou2Xs9iUGIhBQjEMSzldGiKISYFNXpoykNn8pQIdShb2HuQPNG2F39OPlImmdCo
	AODi6YxlDXVdCjAEc/a7v5U0olu5b16bUi1ISrfCdmS/mtkL8kLiwL9XdzQDXNtc7n/CNE65WeZ
	sSr9tCjAmGMxBiaRAj7vh5hThcEnkG9yKmfzcqLxAyDfsuZ1SLz9342rgAjJqFbpsHLpk948/x+
	iiT+pacQ6jHNDR1P9reFgnceAkfYrU/08mbOdcvrADiyLM9dbVSk0QQyUu5kYTZEJorRg3aN8oX
	HH3y81VsZz3lw08AzS13Sj35xn96r+R8c5g69g1pZnOvF515S/bp+WmO8Rl3jf85UCzriJesWNG
	dMbnd1uSAOKIBVDJ3dAtPEyXhU7wGzjWm2Qk6YhK7x866hB3eTF+X/MKkimERwFGHyea5C8Sac4
	fLqZfJkmqEEZ+uDk2/HqEo3uC5KV28E8Zq0bJNjqplvVEQ1EUGmkqedwJ0jhXU9j7X+80Fi2uEL
	u1/jw==
X-Received: by 2002:a05:7022:5f1c:b0:14c:efa5:ee7 with SMTP id a92af1059eb24-1a6cd77f303mr1693486c88.14.1793166733293;
        Tue, 27 Oct 2026 22:52:13 -0700 (PDT)
X-Received: by 2002:a05:7022:5f1c:b0:14c:efa5:ee7 with SMTP id a92af1059eb24-1a6cd77f303mr1693465c88.14.1793166732662;
        Tue, 27 Oct 2026 22:52:12 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d76814bsm2295526c88.10.2026.10.27.22.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 22:52:12 -0700 (PDT)
Date: Wed, 28 Oct 2026 11:22:05 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ilia Lin <ilia.lin@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cpufreq: qcom-nvmem: Allow generic OPP
 tables
Message-ID: <auGNhbKwIMGsOsbK@hu-varada-blr.qualcomm.com>
References: <20261015-opp-v1-1-f18fb6f9bae1@oss.qualcomm.com>
 <20261017-calm-tangerine-marmot-2e8bfc@quoll>
 <athPyI5nvYG4vmfl@hu-varada-blr.qualcomm.com>
 <cfc75bf5-eb1c-4433-a4d0-770c56778392@kernel.org>
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
In-Reply-To: <cfc75bf5-eb1c-4433-a4d0-770c56778392@kernel.org>
X-Proofpoint-ORIG-GUID: v2XwXq6klpb3KWGDctcMcFsaOl1Upg_E
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae18d8e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=g1hkF5I6mjiIX44rm_4A:9 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyMyBTYWx0ZWRfXxiVeAEkeL354
 azVNAAIQBAqJtj6cTAf9ubumdEUACiLjEeV+yCiSk/dsEpok0rq+nIOg6r8rWaNlAGK9VUQjtwK
 /9RnnevLzGajM//eSW24yrGf/JGcSOQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyMyBTYWx0ZWRfX82PFMAnCVVe9
 m+z9JNae0FZkEZRZDwppR8vUOppixcbv8QWN9tfikj+gXaq80JZEoy/jysKc9W4XcE8a/KBldpX
 9ZVWNYmXjWmmDr1TgwXTGsOOtuImMKN3xHoJQZAzysN0/7Msl+HhkyxoFRoRVS812HbOInjERwH
 K2pJHYVop2gZ8OWIUX7yibzBtu3uKq9ILAIjtUXplFJv0/Po+H4luikUlYtQ1zKSy9xFoVLzZcD
 r5NVbZahBpDQMmQsmB5PXrgY2Qe1y+0R1N50JZV/8JbY2rIseJH+6QjJ+MsvEyv89wL5RKQ2gyd
 hZCwkeJEABAcWH7LQqEfd//lgo+en4xE5EJg3dQaDDFAZkJmKYGkt1UHWsCz1xTB+y65sGxnU8D
 gQl6Hn/LEXrKDoWUto7PKtCgP+AOtwiZH7gZpkDL6GL9hix1l7cF+DtY4i80QgHte/N/cJklcHd
 Lz3iMNlAfwUO9M0rXdg==
X-Proofpoint-GUID: v2XwXq6klpb3KWGDctcMcFsaOl1Upg_E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280023

On Tue, Oct 27, 2026 at 04:50:56PM +0100, Krzysztof Kozlowski wrote:
> On 21/10/2026 07:38, Varadarajan Narayanan wrote:
> > On Sat, Oct 17, 2026 at 06:45:53PM +0200, Krzysztof Kozlowski wrote:
> >> On Thu, Oct 15, 2026 at 04:25:28PM +0530, Varadarajan Narayanan wrote:
> >>> The OPP table node-name pattern also matches peripheral OPP tables on
> >>> supported SoCs. However, it only handles Qualcomm CPU and level OPP
> >>> compatibles, causing unevaluatedProperties errors for generic
> >>> operating-points-v2 tables.
> >>
> >> But the select should not select them. How can I reproduce the issue?
> >
> > Sorry for the delay, it was a long weekend here.
> >
> > With the attached patch, I get the following error.
> >
> > $ make LLVM=-18 ARCH=arm64 CHECK_DTBS=1 qcom/ipq5210-rdp504.dtb
>
> OK, I can reproduce. I wonder why do we need qcom-cpufreq-nvmem.yaml in
> the first place. It duplicates top level compatibles and opp
> compatibles. For qcom,qcs404 it does something useful - enforces cpu
> power supplies. But for others?

CPR capable SoCs are added to this bindings file. Not sure if all of the
SoCs present here are CPR capable. Will have to check. However, CPR
capable SoC like IPQ9650 might need this and will face the same issue when
I2C or SPI opp tables are added.

Kindly advice how to proceed.

Thanks
Varada
