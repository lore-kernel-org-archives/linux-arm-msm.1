Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D79D4DDB45
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657898; cv=none; b=QM++CLnTdTo+iHo96sHmhEMpauX7AO7CNz/sZPh+/vnax65SCTeDQC4WAb5RUYmCksv4MJ0xrqaqDP4a9EvjhOLyRlg1uAtohrG5rJ5YTJQZ4ENRDNhY4g0VPKGWEXtktH14CJ6hm9xFUzMTsYoVbmRJRzysxQVAEyR2jpBG8Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657898; c=relaxed/simple;
	bh=BkBRbohW+ge2Ns1SXXgK6pQXi2hgI7Du/+1p/j7cAWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=InYGhKztPJy/UJYAInIID9mXinQ0Nm7m3ok9PAa/+VQKerJ73un3WrE2LKVp2YWjtFtg2s8h46Zl/GSxzlQG6nI6EqG3TmpkJRZh3OeJsnHrfSMEVbbnuGRe8ksSpRp5tToNMjpHQ7TkbuyjopdTgZoM76f1mQUw2zBesoNL7nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UWwKACoA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gfIbAFGp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UWwKACoA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gfIbAFGp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HF9wNh2024669
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TODua4nGQ3TmNmyodhx+/f7Y
	LgdfUdTpQGaVzKED2rg=; b=UWwKACoADMpRyDhH5JVYwFpNGOr/geBuU78UJG4x
	uOyqMlxRJlxLjs8k5usiRb8qmYPn4GhTEtXF4HJIOVKXKprpqQEhO07YadkRwc7g
	o75wqi0qHR5PRB0sKtTWNjOlM8stSzUusb8qktmp13QKpgpjYDRfGBQo/OC84fkk
	akIZiiPz/SH7rmCI087V2GBdG/jcTcrQOjKnwiAscDlsg89sxrDNpOK9NzBOtkEl
	ZL0FMDrZctqxyxrInO1NKEyYXqJ+NIIZjSeW2hNS9qvV4MuO7cSB8VRC9idcul//
	6K5s+lEm9KaUnmCYNtBfuYDywSS2PHUTQT3ORJzrc6yzjg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grjkt008w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:11:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93903622880so192771285a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789657880; x=1790262680; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TODua4nGQ3TmNmyodhx+/f7YLgdfUdTpQGaVzKED2rg=;
        b=gfIbAFGpqSjQOF+2H8KR0buBbuGsH0+j2DBGoOZDbFtJcODhcGluuY3kclnNDqWGf4
         N8qxZGuXb7qHeiElwzARzDYDzZLqSCWgn1PnIbYIaTFQL9G+6oX1ypUkho9GBsr2Rr93
         vmJA6yQMitLidlMywZffVFY6TDdJNF15IRi1l6qNse3HidkPHAm5LkfVTP5UowxQhuCU
         B5WDyqRucKyCxm6HUs27wIAf2145mm7N8wjqDHrlDgq4URT5oyZdnLnWfPpzBuuMPasS
         KNvZp79hBv9CJxVpS/Tjd5ZcnXfxIVcoRRuqjJ1Qfnnf7rvAsLwRkA8o1HEBHi67O38M
         lnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657880; x=1790262680;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TODua4nGQ3TmNmyodhx+/f7YLgdfUdTpQGaVzKED2rg=;
        b=VkhjDIvALxyRJBNJXMjBySV1RV6AyEYPAF8u1+S87e70FjiVcH5DNt+0Tm44uh6qth
         mGrv6E1Dcu4z7dtynQrxcCOfv4hGpQ8c1tSJ39pTFf64/LY1iCABb87Ih/SYqShQweOG
         9gyvSg1VFbRwYKcNGW+xkwiGG4UvdaQrA5imS7LOGPA94hTYe0aynvhS4SB1AY6GdfqC
         3jZFnlGcMDOnfBjkoBNqMUf6s0e49/2Gowwsc49lHKEdKGgYwpJo0r/9U9AxTa2xFhHO
         82+72i2Qjq2lcgljfXDcFqqSx75riyiA39WoBeKKgQ/mnNHgJbeabCbHtwc3Xv+3/EIu
         yZAg==
X-Forwarded-Encrypted: i=1; AKwUvBwDB79Cv6H8mRz5/mGgsyqUa3TeFubF1k0ZNaPbJE4+y30VZcMVivCCaJxGDBUsXMY5U7DSpfYCWTcl3HZZ@vger.kernel.org
X-Gm-Message-State: AFuF++m9XYYX1kUXM0ik0h8griCg+RIPqpZeP+AW35DDQ6vWorp5staj
	mfWKAiY3qnqEe465PPf0iPDmY47sgtQIjDECZf2OiByNs28peXgzrI7hhgjCrLIe0M8f7MzCpWT
	H8S2cakmAzBEsiMkeiZadYfhpCZwRiJ6SQq5vissi889tAUgCGwv1luxJQh5I4yZkXZH/
X-Gm-Gg: AYBFou27jBAPkYcyYB1B/KflmUgswQUOnIdlmJPB63iNfnJC82bEGUY9thKK2ILqGTc
	wbp56m5HQU007+po62+pBvdsTXlBc4kHfZOdaLT6ppRCVnui8+ViblfDrPDMxkfwFP5+uywcQBI
	iW2pv9xpLxSbCv7CkfQbzJMXKDVL1ohPU+hBx9ESRkEQdfFc21KPXF7BOcL3y6r0uHzV7H4He6m
	ls/HJJz+yJMeSqTPaBU9JV6HRILkWOFjWnde2bmbgdBVyZ/z84dRNHQi5314otclxOIPeqY/EdQ
	mCVQrTVi0wQhGlLovmLByTa7whWcn9oDGCs3WowzrSgDsI+YyK4tzMZCyRSSgzsKvMaZ+NeAjd4
	eTwbtd2n/YhuvKU4=
X-Received: by 2002:a05:620a:440e:b0:93a:1773:a16 with SMTP id af79cd13be357-93bc603458fmr555163585a.0.1789657879867;
        Thu, 17 Sep 2026 08:11:19 -0700 (PDT)
X-Received: by 2002:a05:620a:440e:b0:93a:1773:a16 with SMTP id af79cd13be357-93bc603458fmr555158785a.0.1789657879323;
        Thu, 17 Sep 2026 08:11:19 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e847eab65sm99562625e9.2.2026.09.17.08.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:11:18 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:11:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 01/15] arm64: dts: qcom: qcs6490-vicharak-axon-mini:
 Move PCIe phy and GPIOs to root port node
Message-ID: <mwo5ahkfkf5qawcyfgvcitjrqvbugp6pd2bp43njgzppsvabrr@bb2fjq2oqhei>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-1-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-1-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxMyBTYWx0ZWRfX9nYPfY/EFpHj
 uebqnuTZ3bWnXGuToYlmqdY04Y2CUemfiW3dafc2wfT7ThoZAcWOorl4Ha5dLRa3u10Zi2vvXts
 eXI+vXRW9uX2lkU8RfRHkWa1t5Lnh6FKSRVrhy3FUDZh4TiXtAKx7GKzfUzZ61GZZA3Vp8RUv1/
 mo+3ncwTnhKgX29e0roGVkz5WudEetpcr+mpkqhR8kfdGzwvicpDAKnKLP27/ylId9L7f1PxXKe
 krs/akUbgf/9FKchn3ePe1RnSP6OM0JVPBwLzbs+wIibSbkkmL8Hv2NNhHNnyGyL2StNCq5tEsQ
 fT3ao8Blcs6cI6peroK5hgPLeQ/hl286pUmtJEIWOdOBv4WBjKk2td5cNeqjFIXvKnKnxImQXmS
 nTVHitHVA9tEbpPYbeCHXbRz7ekw+1crYph/tJgjTSV3W0Fityp1nIlkdtaPu9RVdm+16Q9GwB0
 JbVzPpgGl05RBzzq30w==
X-Proofpoint-GUID: fC9Y3sDtu-ApdWejRlcU-t16n7xLYcsL
X-Proofpoint-ORIG-GUID: fC9Y3sDtu-ApdWejRlcU-t16n7xLYcsL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxMyBTYWx0ZWRfX8O/fyMfh2du5
 dveYYyWfsd/ERXBtaasGqDGuQebWAgMEWmUSe0g+3PY3UmNzP9+DptKLQ/B6Cq6Dko04Ny3pISh
 4ZiGcMGts8TSkd2e862BwoaZrRIV5aE=
X-Authority-Analysis: v=2.4 cv=Y/VtIReN c=1 sm=1 tr=0 ts=6aac0318 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170213

On 26-09-17 17:55:15, Krishna Chaitanya Chundru wrote:
> The perst/wake GPIO properties are per root port and belong in the
> root port node, not in the RC controller node. Move perst-gpios/
> wake-gpios from the &pcie0/&pcie1 controller overrides to the
> respective &pcie0_port/&pcie1_port0 nodes, renaming perst-gpios to
> reset-gpios to match the binding used in the root port context.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
