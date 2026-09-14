Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F60C477E39
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394295; cv=none; b=LkVuGWxOcKbhrEMgkyOUMgPao3ofo/dWagKOcZRzMChZRcfnhLb8mboPFGzTuDMTi6nU0L8xnRuxpf7eBy+DLybzcx8apY/2TzRFadveMNpMHEwoMn5vtoAVVXaUFubZ/vXn3EQge3b57oe597UDCRRDTGAkcq1E7qzcZyXmQEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394295; c=relaxed/simple;
	bh=jzANVhxi3U0Q7co8WVjMrCO5T4ohItLIgag3THjnhF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qK0JCRx0aXBqtO0PEVoCoSHvY0dwVPwN92MgtJ5oF70hpe2HgSDBJpl1oiR7jinB5FMX1JSY0OHL1yoDMCUorBKVY96pi30SaUYdr/RSVDaLxdqMoXkWUxHRuJ6DIuCELrPeVqmyqWvoSuXwZHqsVo2WIa5RVcSoZ9gX2T9C6qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NUsnfwhN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ci/U6rG0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NUsnfwhN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ci/U6rG0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0h7d135640
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c2IAtlPzeg741fpM1oZzwHcy
	AEmoxVX2ixWPS+m0Rk0=; b=NUsnfwhNRJ5ILfIr9EoUJAYFRsSdUYqH1nVTbGny
	A8rPS/ZwlcHX4Pu87LLqA1NhOfafq7fUy/CKd5LIbztza/nWqBaqjI0YRw0ReKlj
	H/GSDu9we0U5hZKiW1XVLpULtBPl+GgfQzL1prDJzKGxvgvW3qvMJDSbSskaNS70
	arPpaic69QERTuGKbZcFLJczu/f4uNLS/V6YkHHlahsRxn8CnDfrr8E8I2z219kP
	WvBB6llbo4pl9ZoBNfKLFiUBtDeTAz5Ro2lFwjHk9FznUX+wM+1p2N5sTN+3ZFS3
	5bH9LZiyWGWPjhdT/SgdKmx0BPWC4rCUZuqxH5WX1jxvFA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq8vcx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:58:12 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97cb0a317c4so489075241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 06:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789394291; x=1789999091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c2IAtlPzeg741fpM1oZzwHcyAEmoxVX2ixWPS+m0Rk0=;
        b=Ci/U6rG03wydZV9GHcXnEi4pnXWaOVCsTiSqrMI91G+dbQQ/ntGdK1xJvGDA+3/44P
         tQk8Nh/wSAx52mbtLkoop8EI+A2S3naY+m3f0beQhg7rsLdd/0Hu4/gZ676DYJHdy54j
         WB6v6zB0ov5RPxrKy7NUuyNZ1VwgCDeY/VMGQfsPx9GemlbUbdwTaIhqhai0vgG8l5wS
         PfEq+VtGuz9GDZLGFg9oxA/SbS8yWieYyURhj2caKF5l8/f0bsEwGHlhG6BhR/dNqGPH
         sTkVeim90vOQ6q2/cqcPhuAXO42GzIs8kADvKaZjQScZO0khZBwyZAqeXkgfMo8VQoPV
         MJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394291; x=1789999091;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2IAtlPzeg741fpM1oZzwHcyAEmoxVX2ixWPS+m0Rk0=;
        b=Jg8rV30mc+TYcTleCvtDNO0yFplhJxlyos0yHyLSjeoPz45/MhFHxhCaRuhRpX4ia3
         ZVPiTPiRNjut5sjvFMBEvOHg5VAcKTC8SwzT6uObsqI+UEnmL1EohbyAPVCP8MT+73lp
         1EK+Sz4WOsBkDTSAdHHOshyIrQ+k0pM/0RGujlH9Ecot+O+o9yuBRRu5k4i5VVVfuZqi
         p3qnNkOmCTlV8dnTcP8zCa3xkOdl0+koSe1iL0EueRglrz7LPZVmKZz7P+jVp1arINin
         ILkg2yCmxk35ElPpH2REL87vgZSGiYajB6oSnzUONbje/xQWdLHxDXBQUYLEQ/S46xYO
         uVVQ==
X-Forwarded-Encrypted: i=1; AKwUvByfovff44RMz1HOEH7ljBj8+lhcT2a7KmjykeudtkVBAvoIqCntS3+63S5neh+/kgLrnaQBTlCddcLVbvur@vger.kernel.org
X-Gm-Message-State: AFuF++nwl8oN/Nzm26y1O8/4vwl4zXc2l0Tu4MhwlURacdTW+sRrAiqs
	uAkc+GBqGQeHUZkfv1Za830YpnENw1uFfhzRlTKqK0s12iLtP9bYECP5r+faJM2J+Cq0MQXsUZj
	yN7mI0yLKNdicI1+5lbHbxn1ZymCeW9sjL4JF2y1DOO6CDzmMZ8xjhlYK42afhERxLyeR
X-Gm-Gg: AYBFou2Kk3ha4PckvEo5oYNfkAjRRY5QSIY0E/+uYmZl6HPzRu8k7aAYEgnafw2kOtV
	9HT/RoK9VpD03uUXFKUC5x/8lRsbZH+T8zvyaUjogAWeOID1MXlNchk6BJp9EE3Jx3Fdv7t6c4N
	eSemBi6ty566xoBtsLLGytSk4p0K8b6pfi1TFk9b3Vm7NDtL6yzBvuf1GIPcLF3hfTyMsFQG0Uq
	xrpjjDkZb/M5zpG6t9dzXu8QzjYKg9/Ijp27D1QqVQYa77EhocMm8xFb0S18TLTWRyUO3YlLZlX
	Q8FV7ipPiTAJpB9pyXdaFSAZOBKpnDNO48d6iWAI+lKROp5T25n1yDeJiuywQjAD3H9tF+gdPI7
	mlBEK1+s1aqUDUw==
X-Received: by 2002:a05:6102:b0f:b0:785:c39b:6a1 with SMTP id ada2fe7eead31-79b5d8a21afmr1616321137.6.1789394290947;
        Mon, 14 Sep 2026 06:58:10 -0700 (PDT)
X-Received: by 2002:a05:6102:b0f:b0:785:c39b:6a1 with SMTP id ada2fe7eead31-79b5d8a21afmr1616260137.6.1789394290407;
        Mon, 14 Sep 2026 06:58:10 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ed106sm26430717f8f.1.2026.09.14.06.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:58:09 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:58:08 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: shikra: Update rpm-stats
 compatible to SoC specific
Message-ID: <adop4jfhmxuvlhuyei33vsq67fv2a47emmp4zyqrfi6i5lhrrk@3klirxgj7d5z>
References: <20260907-shikra_stats-v4-0-3825351f9740@oss.qualcomm.com>
 <20260907-shikra_stats-v4-3-3825351f9740@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-shikra_stats-v4-3-3825351f9740@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5OSBTYWx0ZWRfX3VcfZ4J6VDSn
 FLpJpArYcMkdGIkT97k55WXjlzprNawbPMptFxkrhFAvWS65hzktndNjOr9vTgJ5nMQzxJtGHMV
 0XAdDHvdq+i8tt7jFSH5ZfNuo+Jho87GDd0VPzsdWGSpPUBkMNwELHzrfftmKAWqjD0mx4N7kk9
 Lon4JvOi+JQtFOJw5OcyWtBwZP2pM6NavaXNs4W+zh+EAyzi1ZRoCefXChs/Qm5MsEbywep+1ay
 q0prAd1MINthXm8Zi8PWehqbhUUDc7KnibRfL2HUXSxF26GH1zXP42pvt7HQVKlzLrD0nlYSEgg
 CceHNLoP+UNtZ135Q0rWwagzicU2b5MKv/gwUKJCVcr1PpaB+6aFldPHjzRIrlLFMa8YviF5NYH
 xkvy1eTxztOFBluN+xIrs90bhAW5x3BJpT//1Mz1XR5r7o1SgRFatqGD/JWFJ5vAgDoR/YVQJAM
 ZAWHWZBVb6zp5rKJzEA==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7fd74 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=5Q0izQ4MgAGUw91kEtEA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: JVYcGObfH8mxjML9OulQtlv_8Q5pBlOn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5OSBTYWx0ZWRfX5s3EJWGDzw6B
 v5GGSQ6E3E2Ahz5LaRiz8biwWoQvOnJ1pEul4AXklsII5QjSCII3HJhXYa/6s1CBJlzZot0aCPG
 qvu43MseIjVCvJGYoCrAMR2RKNJ+yyY=
X-Proofpoint-GUID: JVYcGObfH8mxjML9OulQtlv_8Q5pBlOn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140199

On 26-09-07 19:17:55, Sneh Mankad wrote:
> A generic "qcom,rpm-stats" compatible only reads stats for SoC level LPM
> stats like vmin and vlow.
> 
> Shikra SoC specific compatible allows reading individual subsystem level
> LPM stats along with SoC level LPM stats. Change it.
> 
> Keep "qcom,rpm-stats" as fallback compatible.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
