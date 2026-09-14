Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E85369D7C
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371738; cv=none; b=j2DC4+y4wBeLijU0HOZaccVHoQ+m8FWstZ4kKh3UGgjd55Ir9We+Ohh+S1uwn522n6ynzLQXWrMWvnxDE/sf8v34PY/xBttCLAWFerS9SSNzpVyMOfE8FZmoYjO08ee/UR4U3BZuw1zNuUgMk/k00rPaLlQMQ5HR3GeKOWnq7jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371738; c=relaxed/simple;
	bh=9dVBNK9W+CBPCLmmp3NOmV0wGLXOczzNZNj5nKU42Lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kVdywJVehGPlOmKJbiOsRb2n/8CUDeKWab6fU+DZlHs4CaPLyakTEFUliqsds5BQgfwy+mRzsuHoPPTHJIBm4UiGvR4H0JSr38oNOJQW07N8zzOzwUtBH+NHlmcjZ3TM50cpzSL/itG8gA1mIUyvlojVWKOvYrIUGq+Tj16QZx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bkROjClV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J6E8pQQL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bkROjClV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J6E8pQQL"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jSAx237673
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4RxHDRPQG5GapNsDYLOilk50
	BfaWg++uWdw5jiML02w=; b=bkROjClVznLYfz8iLdU/kt6duMSx+31RKIq+PWIZ
	h9G4ftJejB5gZ31ZsYe6ph7EezRESNiUKiX7yL8TmyqAIsZaK8mxMAe7/t4ksbiO
	oLyy9DU4hMaxXP0TLt+CFO08LgCUC+Wi+i7VfBlglY1h1X98YAy4exK7Uqh+4Sgb
	bCJsAOzarMOuk3TAOme4s9caq7Ges2wSVUd5JxtyPOkZKdd2D99LmHU39Q7asHIn
	YkglleKiJ1jziGnoHAkV108YIeWiAK/YHqEXaNx4/qq60BrKYixPy+qlqYAnKpei
	+6IDkHS0WCyUbvmccI+/3JvmUV7P5AE+4rrFffwt6S4s2A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnkq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:42:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a07b5b5efso266988885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371735; x=1789976535; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4RxHDRPQG5GapNsDYLOilk50BfaWg++uWdw5jiML02w=;
        b=J6E8pQQLA1NicDN2/G1Pl95m6nQxHU2egIpPgmqja+dBJ2gWVvbGP1bkZ8+Ho5HMS+
         zquvPUJL07Y7tO4vjTZYfSWkCKGXRPg2lASyv6rhGKgAhYtAUyMtYGqsgsAOyZEZ/DKw
         6hEPNo2U4/vt43nKyf3k7zluubEgJy27bcl7nH+I7WQqTplGZo5KyZykf6FnJD6ZtN5q
         yD74pQsPL9PXRj3kOoSZhJXbPzpgOlrQCycdlQdWpFMKycny8aGnsgUtlUqGIDPlNeWA
         utpil4N4zWwq86sG23IoDJFpAUfsOvonXEJ0tN1TxyLn8WJIlHk2uUynHEeITYtHCRcD
         nLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371735; x=1789976535;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4RxHDRPQG5GapNsDYLOilk50BfaWg++uWdw5jiML02w=;
        b=s+WewQcRtk96CP2Bb4Ncw1Vj4woe3rdnbeW0znyEjhT5mdGxdH7jClYmvmE2FoMFjz
         vzSdsvfEU2fdDEdcRTN1abhXRDe/IxlnB3oMoh0Vi4QazS0IXmVta/9QkwVRP6THMh+5
         ipqcLfxagfyOR0oZa3F0jEyvtvZiguPmVrl67dIj/FJGMnITXVpnbxXke5iTe1l1HTzy
         nZHO06UGsl+/5W1k59tgybAxy6Eky9+wFdAR6ltUGzZ6LAKLk/y/PXuo5u3+f1NzzOjN
         nGs1n1X3Jf3in886MQ2MRKIayEozvewUU0RNuYcLfzIR0hG3gtWMsxhttlzud8ujqWto
         BwMA==
X-Forwarded-Encrypted: i=1; AKwUvBxKkGrzHin4Ds5ZUNXgkuz4M47Tvb2qR4A4FsSTWEiq5NgJIN3wbiZgY4HR4UtH0ciOpHbSrBdCB7ZLTQga@vger.kernel.org
X-Gm-Message-State: AFuF++k38WuR/C2FpfRduD0a+ccQ6r6PPAwFFhnHxXB/AI5zcYyYAF0K
	6R25V/psRHTqk4ZfeMY3ADVadNfp2DREd989fvZ9exahr5MHTWwIstAdkMUyfaLnvHNiIpMdefh
	ug9p0/qhWjNv7EQRTxT3kSGVdhzHIhW61/4elqzIKSW5Whq8sLgxkI9X4hM6gnkGwzvEm
X-Gm-Gg: AYBFou0mnGcQCBG4EF/ZGlrIJtVya4BbcqRCZTVMH+uZWSe2lyEKmQ5FTuROm75RLdx
	m9K5NY5TOkHP1BSCTLpsT2mKENQ5Rsl3ur/I3B/WQgrZcq50sk7EObna4bSgSFe1esqX8zjTpJ1
	WzUUB2MUNMbokFSVU3NJ0UygtKUC7Aa2hXGpsfo1opNOEunemi6tXputT3c+d9vn2or5z/5+E78
	6hefsA0jypm6g+VX930C3C0lMZvxKHfPwALy7TjxYHqYAV6PpUW26sEYbv3tx/xRCYIWXfC6vvS
	OTYCeCbRXaMcqKBQ+Wa0/rlxxGD+fcIE+g5irSLswQqndUJ/lEZzEt4TvvKNGsKtbvrDRzpOwFq
	mHiWjEQ1zcE8POg==
X-Received: by 2002:a05:620a:461e:b0:93a:5d6:9ef5 with SMTP id af79cd13be357-93a185a8922mr535341485a.12.1789371729651;
        Mon, 14 Sep 2026 00:42:09 -0700 (PDT)
X-Received: by 2002:a05:620a:461e:b0:93a:5d6:9ef5 with SMTP id af79cd13be357-93a185a8922mr535339085a.12.1789371729125;
        Mon, 14 Sep 2026 00:42:09 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e62232cb7sm230063755e9.4.2026.09.14.00.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:42:08 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:42:06 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 24/31] arm64: dts: qcom: msm8917: Add domain idle state
 names
Message-ID: <tpu3ocpkqxoyur27iwrrpjnrrn6goia2j5uflhhu4qbbjp4dsc@lwsl7lo7eti7>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-24-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-24-660c31187819@oss.qualcomm.com>
X-Proofpoint-GUID: wjn8IU79IuJm6OG083cu4P9h0BBSt3oL
X-Proofpoint-ORIG-GUID: wjn8IU79IuJm6OG083cu4P9h0BBSt3oL
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa7a557 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX1S618rypwF9b
 RaswNy3Y7Y5TdfsTMkyRqLbKjE1U9LJIV9BiL62CmU1L0tkl5sw+Tr5pgcP4y6RsdluJYDJYNQJ
 sMT8rN00i1h8cEyNUHtDyP4hCSJHDl8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfXz2wpcDyofXtQ
 veQR8KaD3yIs0Pf2NkZO0arAAtI9IiHBljER/YxzZKNU0wjd96xvjbUJ3k1asIt40n2ZPfn06+7
 KOlzITSS0FcymRRhN/EC8Lwdehze4a0diHvJ1TgGPCzQkzHlcsZQqQXvJor0LfU/1eWyppiNF51
 2LzDoal60wTuW+nKUJykqyVpZ90NUrmZ/nZZJCfXChT4fskH/57vrG2DkVnU3UtYmpsn3Ae9cY+
 BFO05WOlld1wZgYF9JfGYf99k+dCVAEb3hSzhaYdH68Uh6fe/x66eW9YfdKpDPgbv987dfRVFnZ
 zTZ21Xaq4TCGIU8JYCYIxJEzC4gbissyqtozODaANqa3VyPtP4erxeyAmTq4tGKvugnuUafX+Lx
 cUkW8faW7W4/RrwG4IKmmyxwEt4o9seRGsTM1hQzrkFyXBGmSG1FkRLGQIYQVLN/pY7D6Zr9WEo
 zdQAI8cCHELbvq7MkVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140108

On 26-09-14 12:29:56, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update the CPU idle state name to match the low power mode
> it describes.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
