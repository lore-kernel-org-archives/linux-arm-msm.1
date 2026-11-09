Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230727;
	b=FQnVsx5AQAiq1XVjlUeh9xqdNiPa3ojikgcKTLo/dzXME1al9agMvI/ACPfBqVO1g5eQ
	 88aAcv1u6WVZ0NaGiGNy3x5UNhLn5cErigU1KaP4TLJziDr1ivRQjK5/t/5+pfgQJ4U6u
	 iYclNCBs559G5/I8E62xPPB3i+Jw8XBUcG6JeRW8Z/zj8ojum0tvVjH+0sw1ctsNPc6+h
	 gs7VrI5Da7IoAX2jAsETYrVDz3IvMCpxn9rbHCnCoiEQBopBtVbqLiiY2UnD0ltj1xvd7
	 8zdrk1qkwa1AAOa6k1uzYa7pJt5asxaFwAiq+SMsS0EAVz6ZyPhudWUy/26XNme5asw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230727;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NdZ8WAHKIgu5R+aDU/V3gQzILOqggd2CA8XxwJMUnaQ=;
	b=eAONy+25EooWBoaGo5R5e8QxBnNpIr2glb+en/f6neW5Vat5dNIqp1TefA2VzPoT53jm
	 alBsqBb0iqLZMdOw04TchS8lc5FNdxjaiCx8OMkKg0xIibP4Md6c4scE+OU/v2wzzj9Vx
	 waO3B+ziPn7O4xDdu2BO9YlhRGmT3/nY/CPTh4jxwH9IcDIlafv4ZTP3epEKuM1NI103p
	 nCC389s6ULns48rBLiozZtumucdSeDihn6HU29corrksX1EndzMdEf3lj4b0hlHJ/vsGq
	 3730Dn2O7m1TLjGUvvyH9K0agFPx0D05ZUmCTlkg0bHczXR7EyAbl3eUi6nqvN+36pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A2N2BIXo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BgRV4ATi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831C7606A323
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 13:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 831C7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A2N2BIXo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BgRV4ATi
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF6pC3461061
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 13:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NdZ8WAHKIgu5R+aDU/V3gQzILOqggd2CA8XxwJMUnaQ=; b=A2N2BIXoUnriedoY
	nvImvyBq6MLBI3geSgtYxH5RZKhfcMaG0vsTBKMAy16jprOQcUPaRFVHv9Q+Bc7c
	9RVbhiugOesjDfoOk0DKijIzl27O6d3sQEDo0YagaYLj2IXdsZfiSgCqeK9hd3x6
	SH4yPrjvn+7epiaqm74ZYyu55J5vxnFaxw2Q8HEEefIMmq7kR1Igs45s2cuzhOjJ
	jTB2z9R15BPpausQeZXVq2FvIrAcer8xjs6hPVDzGlmkmXW+g9MKSM2MTCKHQi2z
	8PU5bi4SwFeQeb0J1wmrK5f2JUO5PvM2Rv3XdxZJE4n9aRk5AsITXIdJ+Zk9TNb6
	dijq3w==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0rr83m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 13:25:25 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eaab6f56c7so31017e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 05:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794230725; x=1794835525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NdZ8WAHKIgu5R+aDU/V3gQzILOqggd2CA8XxwJMUnaQ=;
        b=BgRV4ATiSKwfrl7cGC+bmNesECcZh+iXYgoqzkzyhDQ4xZa6ViwF1ZfFzDZEhkWjzw
         kbn82FFDEMFtMoNt9PWwNi0Th+IQ4y4oHVBhjOiVrcIrKPibVmOWycl/724LibchJUM4
         9bDKXwlcXNgfz/bL98Fh+KnUC/1EUYJB01ZzyDVsTZkgdYS10AqOFUtDqYmiLpTqkoqu
         nYAmcAK5AHG7D5RjNvzETOwFHKo5hp7T7pnl4b2l4ViWX9X/V4hCSvyDiMlo/FYSj7/Q
         3YwLcXO4h2P1kXsjHbvX4XV4T3qij0doz9jpUvVVpU+k8uSvPgwBFU9tJBMHjS8RO8hf
         BJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230725; x=1794835525;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NdZ8WAHKIgu5R+aDU/V3gQzILOqggd2CA8XxwJMUnaQ=;
        b=XzualO6GPm0j1GNlEuBtPhUKw2H2F5O96KjKHvf3OBfGKa63+5CiPirM9h6qeyJ2XQ
         ZT3GI59Skelcs3AHjuYXo1IGpC9K0P5p54cExPKvcxWb1yPkwFRUaQlpm5seLqWNeUvW
         Rwx+FZYz9nqohHYLpfp/v4f3IHeYMkBVrTwEB9qklDDWGkGmTnnEeDGy1J5H1yQjZTvZ
         pSwFAzvLdgrUUvhJJYCHCBjBgf2rpTSZfhuby/6S7/FjbjJj1J5G4j+nE67+A1sxY9nQ
         jRazA+Wq4yyjXvi9kPmPbqYg86rb7fuDMGMBqEktz2NkhZMoo8Pkvo3xUDHGtX8yqZw1
         wN7w==
X-Forwarded-Encrypted: i=1; AL+hErGYzJ17KHRGzIV33N7pX4LlL8dksgVR7oF217lJQsQgVBYk06cxeMvKvdq1XPmW2uz4S1DnAetxgFNDPbt6@vger.kernel.org
X-Gm-Message-State: APuU4Z8dOQbuauWdjrerQVrvDQmZp0ZNJMH3yWe62q4t9VST3paDcBqp
	8IjP+De0zwdzK1bFUHDIJqNQ+8meETvedSy71fvHyVAZO8dXUhPcv5lYgCCo+o/QJVB8SlRGnPJ
	cz2ajAaMxHgjkWOkWf69XIWJug04iNutV4seFrd5dKnVHjoRK32FOMc86Zf9Izgxyc43D
X-Gm-Gg: AYBFou03Z9I57xv/Y541lRDTgbVcBjaWMtDEFjQR87ypyYSSfVRiCDPrztmGhXbzrVW
	5xKUAwOTN1NZ+xXCdraBnV9JOGxi+rnrgfR0Gn/gkuxXS0ljtAx6ayO0AqfT/rDQB/p3BHJx0dM
	zTUQzO0zwh8aDpTjnmL6cmXwY8wA4j8w2dNwn8jlOEXGIpyloYNf/ry8EkkehGu58WV7wtfKdRj
	54Bd7D1PlEd36wgy0BQUenshexRfDg/PEStQVSxnJYuyC6koqCoGry50857RAke839Lzg9ZBuVq
	nAlYsvwBYuLcQaFN0amlnaVpMACsygIzx7h+d9yeniNqMrdWo/SgIKUXuG94skzL5EFx6FV38VP
	Icp+Ngs6yEZjum0FH7Wy6udbkdcb/HP+c5pT1kKNFAzMagfKsCjbkuZSPaPBKLVtTGBZOtQ==
X-Received: by 2002:a05:6122:25c3:b0:5ec:afc2:c0f6 with SMTP id 71dfb90a1353d-5ece71d4b67mr1035256e0c.2.1794230724712;
        Mon, 09 Nov 2026 05:25:24 -0800 (PST)
X-Received: by 2002:a05:6122:25c3:b0:5ec:afc2:c0f6 with SMTP id 71dfb90a1353d-5ece71d4b67mr1035243e0c.2.1794230724265;
        Mon, 09 Nov 2026 05:25:24 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a4af502sm172676066b.55.2026.11.09.05.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:25:22 -0800 (PST)
Message-ID: <f9f06d7c-2484-4349-aff1-239cbe1a99c9@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:25:20 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/9] arm64: dts: qcom: pm660l: add analog audio codec
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
References: <20261107022453.159341-1-mailingradian@gmail.com>
 <20261107022453.159341-8-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261107022453.159341-8-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7QJQuWqNf10LLHX02MPy0dFrwpOIv_wt
X-Authority-Analysis: v=2.4 cv=MpfHeGae c=1 sm=1 tr=0 ts=6af1c9c5 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=eTyHnkIEs6k_cr9LAPsA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MyBTYWx0ZWRfXy4dWc0AJvlz+
 W4COnbrKeFRwpSyaEx8gMyoW2+J1pj8Pt2x1Ht8t6kATcqjZyrhcn0guZZyU8wHmWssGDVQ1DKg
 Lw0cMzBRoWb9evVos2jam/UNBfcG9xOUuZ62oQlks1+xhH00upU0VzeUpolC2I/IGxMZcIIHGw+
 1YUL1PH6Pk4QWzq85iNVGlH68NjWM/rspPstTUmA1V2YDe2fpKaCamcOhvoG/WKZIBVXkQQ/4Lw
 0icgHjorA1zfT2Xi72Uv0qldesCmxlghgJAeIrTowo1PSjE5ColtICzF8HNNjdEFa/IRPoX5IPx
 7Ww+hLeES6Xsz3k+HV8+Es2COFVKq8tzNgH+g3x6jHGD5kPqaWQhqWVR+mh2oDq+zxz+gQKiOHY
 QX/7WUWlA0J3wqH8IKytUt4yWUn8DdYEwajlOzzz/GBT/LA8VmDGlu9vl1n/LSoUQqV/MX6Fd7i
 1iCoID3kpVd4cOkYaxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MyBTYWx0ZWRfX9UMvzTapuasg
 3SFZ8guc+eDeW7IcMIuAUEcJd6yba+4AL9nWpM1pBoYXWd0IZ5kGocGVYbGAbnKeckJ33l3ZZfv
 lc7gB7LJX8GYjJeKYkaTH34DiB/9VvM=
X-Proofpoint-ORIG-GUID: 7QJQuWqNf10LLHX02MPy0dFrwpOIv_wt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090053

On 11/7/26 3:24 AM, Richard Acayan wrote:
> The PM660L analog audio codec (PMIC revision 4) controls the headphone
> jack, and optionally the earpiece and speaker, at the vendor's decision.
> Add the analog audio codec.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

[...]

> +			sound-name-prefix = "Analog";
> +			#sound-dai-cells = <1>;
> +			status = "disabled";

Nit: only in case you resend for something else, please add a \n
before 'status'

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
