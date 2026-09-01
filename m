Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD88142E8F4
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 16:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278537; cv=none; b=rUd4ZRnOBRAzv7bVak29V1JIMw5f73WcW1+vxHZwnWSzlr1CZvF/neTMPkZLwb9D5s600fGCY3zNZ3so5JpUkee4/sin4nUcEqJ3PLbYZ167snmw0e5oCY0LZiP41BVMU9WE/Mzpa6ovCfb515BoIxk6GuXERSR/8oA7VOl5uV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278537; c=relaxed/simple;
	bh=w4mM5Ssoiev7XYTuaP4BQ0VP2VrO/qBImVxraWj4CfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ThsZM2hIZBVoHRk5djmR9FxGVJbuSpXpfxnSVHSiQ7m9qUogxSo6yP+Rva/iwCjaO903tKHBiX+2RsnC3/rk1K1cOPpWALF1E65km1+w7S9yer6osvlI16FQaWEiCF5HtNbzfeRLNqVTxamDJH2uvc8xdy/u612QPJ33EHSCEXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ODS6pkaL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MR4EipQc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ODS6pkaL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MR4EipQc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E9S901638707
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 16:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IKh/1/UdmgSx+3b5IeB58V3xIU8nJoGkuM7zr/rPEQY=; b=ODS6pkaLPLTANowl
	4iG9bEBSYyMSSlPy++dbr0cyqIYAWV8r0MY0D8036Bwex2TlbYbfUWCWCILomsBk
	MdCocYYyRH9W8I0UiJWUrWU07EH/2NM5iwMfOb0Vw40Of3BBQpUPQNn/6DOmF4lA
	VLu8jqXfRCAUfBv6ZXF1Xk3UfGuMhJROHsbTwce/tY9b3+Zpemg4Bzip6ZBKSzAd
	BH9xn5iCtBEla5Xqe3S/e61ftW5nYx7KuWyOLtNG/yejMHtRbzqTq1ElYr+3WhzR
	CHIFaSIxpwkqINM/k2C1OOhBNWgr6u2woHV/sGlA4weNcDj1OWDmp+FXZRvQUvwQ
	q1iutQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsjuw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 16:02:15 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97cb0a317c4so91686241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 09:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788278534; x=1788883334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IKh/1/UdmgSx+3b5IeB58V3xIU8nJoGkuM7zr/rPEQY=;
        b=MR4EipQcxoLgA0yz1BZ5Roq9b7knFm/ExNTqIIs3QoE/ihkO2O2AAnVgmIFyDBPDEv
         +crxzfEx7nFH8/HcCo4kl4sZxpQrHS7wilju2wjkKaJ37+Q8KAuL66+O6N0ZuGOLkzzn
         d/wx1/lLhTB048IGv9gZux5jYyg9AIhrlgBcSv2z9yFoEmAKssk8JG8Aq1np9K2fhX9j
         nEa3O1EUIlbHKtiG2By6sY9uotXHXxuuPJXP8oNnHk7bgt+tjjwJO9L6cnfF5aiheywO
         DsrDWtY9bt4/OJr/uyZE5qbGvZ4RUnoQRSMiZxoEbUnsb4d00vKYaltbLEv1RI2vmlj/
         KYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278534; x=1788883334;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IKh/1/UdmgSx+3b5IeB58V3xIU8nJoGkuM7zr/rPEQY=;
        b=rMXo3nVm1SqZVjV1K25fTz9qwOqwDjfam5v+1TjKN3xaDIcJetxG+xj8ACnrJt7Szv
         22vXObdzaWBo36WngrMZLdP1COsw0+p+lizRIzA3L3xH6wOThxYNrLppmeFJ2qWjQrpW
         I2ocz5P6HBXazH7ejeSG9Vmsae/gD8JpHczuatoNqCkVa4BsmF71mUYhWn2UOe0W2QQt
         p94aWrasU1aJ3tnx1LBtN08cIF1WyJprRc/t2Ac+ts56v65EoZ31nfGTBhYRmHVTp9pE
         pGy9gj/1y6DB+QQWx2DNxuYYe6f+LAR3DIRFIk0TPM67I4QT46c5sfJXFC5hr8vBYk5V
         sEHw==
X-Forwarded-Encrypted: i=1; AHgh+RpPh9PivP2NFdIZRV2eEYyyoWw546tTM2DvrW8JYJX9xeOynEVzfK/9tEmyg9149z3m6rezJyn1ODvFqtOU@vger.kernel.org
X-Gm-Message-State: AFuF++nHNmVT1CsxdFO1qTzAJtT4Tea/QmZzijPD74qBRD3DnUCb058V
	1Klcsm+7LPCtTNS24iJ30L6a6yJRGySoRDcrRr0omVEQF/tRQvCrqF+CowyNHZTFNcgl08YCOxd
	WX5SmZiGKHm6P9Lm3u22/XmNE5a8eMyAsRRCi9j3rjtOMjlzrkYnpv4k/fl9oDXV9PV7I
X-Gm-Gg: AR+sD10BhRbk/PZVcdb3LzygQb+TqZ9jmyEaLC0Xp5aoB9m96V6tsXaJb251y0xffy2
	3WWpAzcWQODNilgHgD2+8k7UPQ5Zh4ToZbBxfwltzZtaUxX5oLzzZrcEWO0gNq1MqT5vfqtL/fa
	K1dejL9OePcBvjuKoiAlSsWaC5zz4W8dnqrF9j6raB+yxz8T0yjbQbnQ8DyCtSYlglExsneQbvm
	ghvSrlDrK6FUoSr1LmLfYOQHfdYEluiYdTP+7HiK2PAn0rV3BHnPbIoCnEhcnWsLIfD4bFEj1Hw
	SLJjQnwcs3HhABHC7tuwIoUsAe8V0O2TeHnK8oqxMrI8cSg/EOBhPpu36TrTv5zVy2SbcsYvXsS
	nGxEn9vySmLXYQWuT46bSWZa/JA==
X-Received: by 2002:a05:6102:1589:b0:778:5e58:ec46 with SMTP id ada2fe7eead31-78596dd6febmr11326045137.2.1788278533809;
        Tue, 01 Sep 2026 09:02:13 -0700 (PDT)
X-Received: by 2002:a05:6102:1589:b0:778:5e58:ec46 with SMTP id ada2fe7eead31-78596dd6febmr11325986137.2.1788278533185;
        Tue, 01 Sep 2026 09:02:13 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:fd4:cb20:f8d2:dc94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10f08sm77090785e9.7.2026.09.01.09.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:02:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/2] pinctrl: qcom: Add Hawi LPASS LPI pinctrl support
Date: Tue,  1 Sep 2026 18:02:09 +0200
Message-ID: <178827852464.39834.11620315583830437575.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260821113548.2686650-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260821113548.2686650-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0MiBTYWx0ZWRfX/bVMu0GPOHYR
 Oamsx8t9qp5vMQ8iGY5L5p2HXadhi/Kgwc25xGWOYTvhLvw5aVTgXFQXdrakS8ebwhObyUI3nZ2
 P1vzlN1h2yI7YST2GB2z5B/hD8THv4E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0MiBTYWx0ZWRfX7fu9ayV7BQTy
 tzbgo6UMI6bOIQMmTlTp27ioXdf5vbOyj44ZBlaojIxQoaezvuTkQNfYh26Eu6wQ/cI5qtJdIZ2
 77Kdu5obeS7mzPZVMk7DsgTXr/NhFIqkF71gLWuXaXaSIo2BmHClCs4zJZU07lu6dzpDNAplBpn
 ufoc2z+01sdlFauZKf0qioke8aRl02HFEfTexqWB+NnBvBdufveezmQiDaCsvv182JX/yflTiwB
 9rOBNxHB1O0oTlrrLn0P+Qwfhiw3fXsB/l51Jzca9jAFV3/ArqdESofZUxQGnGz+lhAkh0YO3VV
 +X7mBqDX2GhbLu6Iv8DPfS5hTZLzVUdwEgGfKgMirc9HeAecFqYMU6Ub8QvHTHp/rJuCAuJg4/A
 /eqRT0sBcH1b++kBiYmb6oW1/3IfivWY5NntQe+bPr1TcQEOl3xPua/zTkZ2UukbCUS0ICnq1mg
 poETBG51qqUMahq1zmw==
X-Proofpoint-GUID: 33fXd6vqfPl1SwwYcZCQXa9PvXGUGKm7
X-Proofpoint-ORIG-GUID: 33fXd6vqfPl1SwwYcZCQXa9PvXGUGKm7
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96f707 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_3pKljZcgwLS8jvdWFwA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010142


On Fri, 21 Aug 2026 17:05:46 +0530, Prasad Kumpatla wrote:
> Patches 1-3 from the previous revision have been merged, so this
> revision contains only the remaining Hawi LPASS LPI pinctrl support
> patches.
> 
> Patch 1 adds the DT binding for the Hawi LPASS LPI pinctrl controller.
> Patch 2 adds the corresponding Hawi LPASS LPI TLMM driver support.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: pinctrl: qcom,hawi-lpass-lpi-pinctrl: Add Hawi LPI pinctrl
      https://git.kernel.org/brgl/c/a67c78364f8b3312d36c3518fe839af8f8385101
[2/2] pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI TLMM
      https://git.kernel.org/brgl/c/6f168dea0db7bf35089a7fe942f1df6214464fcc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
