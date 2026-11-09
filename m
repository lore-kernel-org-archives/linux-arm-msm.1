Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213977;
	b=nhxIS7cuckks1mP8vugq8gVFNZgeBEtZ4LDO17Oj9rwIdlf7mQ0TXkHxsPJ+R5423OFB
	 +5xvHYPWLKPnjPGMIwr4jvzJ4OtSPsaVnFrxZd2eDRrWqs4GRxKeAJU8+iiy4avOxNKoK
	 4fSi1SBkR/PFz9p6r//mUOTuuupOkcCQDdRxC8+764y37m/aOFroGSx6K0Vta38Ik0BDM
	 cq/sN2U7eFsc9pkSyT3eHrPM9vzVydQqjdfI/jFfWBrNoSINz8ceftAfJ0uUJZJ8Ymxbh
	 mUAWtThUFMYU1GwJVfQIVIa1wnFyoNklgMR2e0jpvWNQzQ5SGt08tq0p7XBNZ3oGAVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213977;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6aPhVMVnTP3+PU03MJpjQMo/vWxMP+DMEwmZ9LrbkXQ=;
	b=n6YsfgUr0mJ/55P5rfY2C7LV9OndCti72uR2mWs8/4ZU06Ed3cBNLCCIT6/17QSOTKvn
	 k9AmNjZLyu1CTQqtGE20UAyHG5Xtc/DCb0kJQeJrSADzc5uhiTVXtKruRJZi6SRBcWhIY
	 UMktFlUX1P4sEPJj/fRQVoZupglY3zQKVTl9CMgnZSWcJvqZm4/oEU7I0jdHcBGjgRHVf
	 6kdDJkWnT8ziJ+XGBhQLnlUWCRLG3QfcefHgEAg8tJXnHDA6far9v1PtH/9mH4RFuEO7P
	 z0CMdpGTciIWLdo6oW8uPA+Cuixn1JUWcB6YbBNrZArpEEWx2SYqgJYufu4a9EKNVTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TIjyrxxo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hQLoxymf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE84606A322
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 08:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADE84606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TIjyrxxo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hQLoxymf
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96AFpF401862
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 08:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6aPhVMVnTP3+PU03MJpjQMo/
	vWxMP+DMEwmZ9LrbkXQ=; b=TIjyrxxorzBIRI+Xpdfe5wUX2n1ON4LGatB2aYbD
	jaA8bFqHfAsyCXksgE65yZDMeNcx06EIEtxtvq9DkpngKGbtkeljPe3Vt1gNuzQ5
	mPKbMDBnudmPspTp90VKRrW12BL6LovO644gGVaZCeuTQeduQ/KCJmZwVjLDs+8H
	d/M9aPNAoNBXb514MVzWzbB+d3SF9Yd1AC1wxuhyk9qv70AUEw41lRic+C5tvaex
	/SUPwaHKH3eRXtvqUPkK+9Pau2Blr6te+SmEdid0swwscNsspg8imktIwEGMclix
	lfEtXUyajLfiS5Zcp77RFWfIyJ8si2Z+ZLeuRcy14o5kVg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf5tmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 08:46:16 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc10da5ad4so52061137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 00:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794213975; x=1794818775; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6aPhVMVnTP3+PU03MJpjQMo/vWxMP+DMEwmZ9LrbkXQ=;
        b=hQLoxymfbK5Sxg5oZSPnefwFwTDhbffiREOzEfhws4fqMsUrZc1BNpXYKGXZrCOn1S
         PvagUviMakdlysqqS8ZSmmeYGGLQI7F+cMJK6DURqoWmiGrj2Wp5A0zvzi3euZdTi1mT
         seprykMs907qpnsxYPwk+WEuzfuYjeAH69BGbOY/7Ec7m+60+VzKEmQD4C8ReMnit1Hq
         pz10L5J2JPvfDa0EUOdhOi/4rAT2ouDtW41lnydCwRm8VqnokSNQjb2uvmylcjeQYiNR
         Ooku6ST2C8Tk5zuhXqHmJ+P7aO7nzwxG87oYLZyjz0Jc7b9LM4xKUWVFjWwREYsgxrSU
         U2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213975; x=1794818775;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6aPhVMVnTP3+PU03MJpjQMo/vWxMP+DMEwmZ9LrbkXQ=;
        b=RcLvMclpEjb2//B/JC7DZ9EKxB4VhSDtFeTCMSFycfUvQ2eYPR382WW6v4Vthd+VFN
         /6+dTekpedyM0aGPYjdsWnv+kZ3Dlkeu0UcbPKIOfCdf3NUjpABgibjUSxOTTA5UU0lp
         xe2OuhDEILfCHY70+8aIE50hgkpbmRKgp/tqulwQ4OIiZDwW6V/O7BIkFGMMx4HOsJJ7
         XQpK+9nWSf1zb7J1Qx0nh40xNHcTZtpvnh3pHsos9OxMtJ2/iiqhXJ0PlMetEvAn6QMq
         C+dsINs8W4F+yCPcs/iBJWoSNsfZ1FLzH5kHAy0n5t7HqIlZ2QylHFKp5MOKdwUeSMj6
         qdWw==
X-Forwarded-Encrypted: i=1; AL+hErFN7wp8G0gC3UvITg1c+46/lGQQ6BN8YuwNyMN4NfUIw7ASxZ5jhRWP/RAn701hPpAqhQK0Mp8pP6677zBa@vger.kernel.org
X-Gm-Message-State: APuU4Z9gSGxd0tGMcOjKRQnURtde0wjFF2d6fUoY/lEdbexGqSf+npfx
	aaqObaElseSmfYhOuZcnbdM4xysHH9ZajvP9WrnkNqnL8syovlB9uxMK3OJ5thusdncE92064mC
	+L1LciIELTAm6NjIi3LWrKachvTO/R04SjDaiSKlgDZMhW0FS6tqldyMyakS+KZlt/OBH
X-Gm-Gg: AYBFou0IV9xC+KtXS3ishct6j3ldc792jBsKk/xsYQuOcbRCKHorDGk2Jctl+fFshbb
	WbtnKmwM02rY6yMOuYH6pnT0onY+NUbp4qt0pGcUsxWwK16YCyOPec8o/sqn02PL5jSWFie4oX3
	XiZbdjPfUHVp8JxDzptwH3F7mNo6HBFgUYdlr9ttGxa1bD8ZFD+6jlbaGeDvjlaur5WI39qxRRp
	uKqrBQDnBmWakSvfUIm6y7RRr0XGB446r6LUrgbzA2YF1Dg4RZuziBy1T4W88YBfyX7zbz9iXmh
	OLd/A/5if6BpD85yomLDEL65lq2UGQWf8uXE6Ap4Fv4k8eLIM8haLBm50KbgC4kH3G6MZ8rlldZ
	38sC3ndys4F4LrHChhSheXKz4nhd3tvC9qc82f1kJwndHYoOliVGCZ+Pw3S4SCKA=
X-Received: by 2002:a67:e104:0:b0:7d2:7266:2c7e with SMTP id ada2fe7eead31-7d2db056341mr780343137.6.1794213974806;
        Mon, 09 Nov 2026 00:46:14 -0800 (PST)
X-Received: by 2002:a67:e104:0:b0:7d2:7266:2c7e with SMTP id ada2fe7eead31-7d2db056341mr780320137.6.1794213974103;
        Mon, 09 Nov 2026 00:46:14 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596f9a9ffsm8948198f8f.30.2026.11.09.00.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:46:13 -0800 (PST)
Date: Mon, 9 Nov 2026 10:46:09 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH v3 7/8] arm64: dts: qcom: glymur-crd: Move DP0/DP1 to
 common dtsi
Message-ID: <qemvfv2jf25ero2ru322wxvvfccipniav5miupnsspl5q6g7iv@aqojsdwh5asd>
References: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
 <20261106-topic-sip_cob-v3-7-52cd3826ab49@oss.qualcomm.com>
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
In-Reply-To: <20261106-topic-sip_cob-v3-7-52cd3826ab49@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX075NijnGaczb
 cIXmmMRehkS+7p/8B7jGol7xo+ZBgMuywqJvdI925YeRciBUCwXUuwZ/4fG3yfNfvhJMMzLK2Cx
 az4TW2d/13LEuldphobH49Rqa3Poy7k=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6af18858 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=yxH0lVdBoRGP_fzzAcoA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: 8vTe7YXDtgxaFrkBvqRjnAoSbc4Pp_qO
X-Proofpoint-ORIG-GUID: 8vTe7YXDtgxaFrkBvqRjnAoSbc4Pp_qO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX/+th+WjpE9wY
 NgvuTAWhqooYXCcDPUFneU3bNsT3yll8q0AHIqZzGImfpvnJJwceV47IOjp5Gz0cmOYhc3mUChD
 Zvzwbhcbn7XpV7jPpetJLP7D7tyibQFFf1zYZ27ftS7Wu8CPJNiug+/sRrgtmqdliGdjn6ItVDJ
 RDQqpl/0l2y226d6+x65hYOIpk243hT5GgblVT9sHlVwQh4c8SEx52T3Iw4G+8UkEG7EtwmAf+5
 ZJQJWI/z28zTfvJ9reX/MPXl7Je3fEFwGnFmhjCUhU2Yi1oGDENTuVRzJcH6TvBI+mzlHtIyxfl
 mZr/RRtiAzw+ZC8YHpATDxmEmcoo+hZ1xu3o8AYnI+REf7m2KoeGn8ZX79dbzoA0G/WkKipAnIx
 t/M4SAKBGg20P8mWs0d4I/HYESMyXhLtXX0HDFYB2Ix7uJ3HD0iwedg8KtQvSftKQzE32xXbAe+
 ZH9iL1usmqMaO19EHCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090034

On 26-11-06 10:29:08, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This seems like a rebase mistake, move it to the shared DTSI.
> Doing this also enables it on Mahua CRD (that includes glymur-crd.dtsi)
> which is very much a bonus and not a problem.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
