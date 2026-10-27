Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099546;
	b=BM063OMk99CrfDzrjQLBOHMAsF6lDlQ2whbuo7ofcO5JZv4Cj6V0BX+8KsyPUWNJ84tm
	 zmfmuUQ2m9FmEAaqiZfapm1AzqHwNXYwPQ9lb0zHbSVzmtWXfYXW2A5Y/dZGvc5CbEHkI
	 wYTZS8/+xkfGirvy2qp0dhJwK5j16MVxkGrXd/MtFZYrleDkD81S35BIQxKIbAJ/7arbp
	 EJ3xA3hALg8ui5AsY96aR3U6PWRIMuLBoSfHoxPptmYE8VkfXAlMcwo/iw56fZ9Z0UAuM
	 Mqa22TCHBtgzx6XctVCmleiUwtq3fHvVl9ZL+Goeye5UPKgfW1wGci6d8EL5YmkkaDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099546;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5LcItJXuNXFQ1eh8RpKnheo0zJPTojpSv8nt0cOFZYU=;
	b=iXwmlb+ioKzbuLZyP5tMJqvBv6zBqkrBbwCeQUfDelIizM9zy1RRKcP58MJrAtmDJxJ0
	 SgVIGgMjWvWHgDodW+J/T4RY8yz4us8mLXjyB8lgktS9OBgIH2krP+VferheYW5+DoJnf
	 aBs0sYQx+mRc1PprkGgLGoB8yHU7TCZgPebzevpcD3VENeG+3o4x/MZlhoaSNLcLl9htM
	 bLRCLBKK7MZhcvfpLj6T5xLE5J0UTpCdr6ycmPjHYY5HSB99apY/+krU8yTSpeULZxwj+
	 eCbuAdQT0BNBytPAMTfkDwsRPgG5U15Q9vpyXqxxT7SOqfpkttnoMzDrHCFEFvGfm2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WVwAbHdu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OLUBIBMe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860D2606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:12:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 860D2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WVwAbHdu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OLUBIBMe
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdvsU2523905
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5LcItJXuNXFQ1eh8RpKnheo0
	zJPTojpSv8nt0cOFZYU=; b=WVwAbHdubapu1ysJDNo6+QNjAk9/RtUim9IQOBEY
	2WgttqTaUtEV0gY3NVeZdHNWhRP62xUWprrxsKfJRq0+bZ/jRLnjqx1syqaIch8d
	S8QhCaAAb/yMmCKNQeqYR8oqEi1hGOw7cvbZNUMZSBuooyKPKnaYb7Xvu3eVw+Bl
	hCVwNdwAi9XAhTcyTmytAHsMc1pDg6DTc6Y6KGxbLIqy09ADacDMSs1W9FJD6MMo
	RCT+DsOCTUY+Bm/3rKPdTBF3rLG8XZR6TdU1ucNG/uvcVqtnxju5Wohz64YXBTZp
	FZsY6uef2QHqGp9KtR06WWSdeaK0s9399p3z9WXXoR4ZgQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw20s7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:12:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cbf2fd504so767788485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793099544; x=1793704344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5LcItJXuNXFQ1eh8RpKnheo0zJPTojpSv8nt0cOFZYU=;
        b=OLUBIBMe8d+uuIMgk/DLnmaj+3M/vrzbGMwraXN2ynLZw/JtKMp7KAhOaD0k4QIIDj
         yoPml9JSw1/Y9LyvdThIf3m/qMuvhPB7Jm+P78SWNQH3WjzBCBNRXX74BKnoFQnzhL8V
         GtF0ty5EGYUQzwTBRAWStZVhyPdPvb2g+CZSseEccRiO4hGahMQa8OsVyx33IQD/Rw81
         58Zn0F9RIfT2RAiNlLczx+NFT7ohwEwvgxrYzCgk9nhE1TJ7iUDflHD4Yv+n+9/j05p0
         H2iy5Y/X203byrN/GX4f7PjViiT7+7annNm27Jd5ELSf4ZyNqSTrCMpwoqit+CTZ8C3f
         U3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099544; x=1793704344;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5LcItJXuNXFQ1eh8RpKnheo0zJPTojpSv8nt0cOFZYU=;
        b=TNtpXFnfeMmKKoRdXi1hPauP5DSe1hScvZ/uAZHm41nSertJh7L0teqQRoivfOi84w
         LHvzyGk1lTQIvhJTgkyBIIy+In5Bld6xyOZryWK2oHgO7G8sOr/FUsLTToxturuc79kf
         UiTnP8neQqyO55XB+xT6nZ7VICBKlzx5NPOEaw5e9WqCaWNJvacQcuznhsl1TNEeAFBO
         c8PbbHfajANdXlryTZZS/qH4G4cHQyJbIEkAbGEWXOVonNMWJ0uzt0ABRbqbJBti+RdK
         0ktpRYsg6XJtlYXkgtxq9431EJa5UlyZBmIG9Hwb1CIdolbSADda/EFZVHwEN0R652U8
         0B5w==
X-Forwarded-Encrypted: i=1; AKwUvBwxa7/CSeKhu/52YE28/88TAN2RgXaL0xRqFGSCMDskjec06kpf/5Hi/lfMZD1WZPlGcAhMj11UcSyJWXYm@vger.kernel.org
X-Gm-Message-State: AFq9FYJFCEqMK4NspTjI5FBlwAWqdOWMppgPOsD6puGkQPlryPoxoY/c
	WzeviRy0kYC3MwZ5pXZ4KMYeiFZucJfaWLyS2vsdelDyVdRywM+Yf/VzKYzoFxxcFO0l7kBFwXQ
	Q5Abh9xS9YyhJalIVGMt14ROkejGYsRl/ZQdfaJna5uBZ7cbYHN0KT72lbkuMAePutlWF
X-Gm-Gg: AYBFou1634yd/X6c54UftG6v4mLsjpnLk4RtCrYLAacHm/cJstLy05byltguk8iDl27
	0IG5ecjWSMULTaVRQ25Zy44Om4VvaCbrw6EPWXqWhQVkDYND9W+AnqU2ZznMuKPq/Z0kNrVgO84
	4OnujGG/RA8iBXR9apzuddsx5FQbT3HpnoqXvluYfI8ZpgjBDzmoYDuCuTqnRQu02+16p0eB90H
	iLmvlu8s2IaS+7lXGbptP8bf7/qzy1mQepqOEdfXrh85DAeYO8YC/cAE89uXMH97zav10kjhHeu
	1UlYumY4uBNBBv5pjSoafjJ9dDX6ftooxYK4fXnN0RQVaVa29d+AhOu5ywKVDR3E2QQwnwSQLqW
	4g3ofnMxCjwdmx/B0GSuB9H8g1HndbGSU3fYMARZ1X7xIv7UYyBcCagsLeBlR8R6erQ==
X-Received: by 2002:a05:620a:410a:b0:93b:fb3c:2d09 with SMTP id af79cd13be357-940ef995afamr1483248385a.66.1793099543705;
        Tue, 27 Oct 2026 04:12:23 -0700 (PDT)
X-Received: by 2002:a05:620a:410a:b0:93b:fb3c:2d09 with SMTP id af79cd13be357-940ef995afamr1483242285a.66.1793099543110;
        Tue, 27 Oct 2026 04:12:23 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fbb725sm259014395e9.0.2026.10.27.04.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:12:22 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:12:20 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: sm8450: Add description of pins
 with MCLK function
Message-ID: <rtjp32br42qz7xtfj4jwamvbzfpqroxuk3le5kseac3rnz4n6h@gwcmaiarpo7i>
References: <20261026224957.1115370-1-vz@kernel.org>
 <20261026224957.1115370-8-vz@kernel.org>
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
In-Reply-To: <20261026224957.1115370-8-vz@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX7wQmXqlQYKeo
 PBcGjO3CaGzuYwBh4df6kWe9RroxbXRzwBK2xnYuLRsYhhOqfxK0FGefUnj7rZ/YphgxS8tpWUs
 s1dy9GS2aEKGBzePx0p7rWvkZlX6Y8W6iuRE0G7/YvH3lURrvxAjrtPUAHkPiKnVRYtzfVeL+Pq
 QjnDdeSL54Sgr8moh6XtwpJAM3AEXDtVSOOJtmMkxPWGb5zTqHoFOkLWwiB8ZMHsuWhNxuhCCSk
 XEHhSXXTGvgrDM+W71SkjQmEm3SGnpiaZ4i0tbKYclzAlS1clXHuhm/TWL0hbTfH5DgFoisShhC
 hZ7HMmWDtzRnqmMbX5obIasxwfwlkEZKjI7Bih+GOTV6Bc22uxQEtKU5bu4QvLUvxHQVNIAq7Bv
 +JD/H8H3goT9j2a3wNKpo+2569/xEcDn2hSBbURjzmt5vlN68RXYsE8lRz+aUFzY48zI54y6H8c
 fcP97zCpeHUU7xtE1Wg==
X-Proofpoint-GUID: eJQ3_--ZlxkdW8Y2z3Z9-R-nhXh9KqkE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfXyDvKSg60qMgV
 wpZqN5DLhpF6CkVRmruIyn7GI+4CxpWIqY4RmT7XvzSaj8LuE5gyY44ONeMyEik6EvbqOQqO9qn
 P5zl5KF8bE6UVYjOcjasUVhk3Ypxrz8=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae08718 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qZm0d5fHY1XYkhLSR6wA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: eJQ3_--ZlxkdW8Y2z3Z9-R-nhXh9KqkE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270044

On 26-10-27 00:49:57, Vladimir Zapolskiy wrote:
> Qualcomm SM8450 SoC provides up to 8 MCLK signals on GPIOs 100 to 107,
> add the correspondent default and sleep pin configurations.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
