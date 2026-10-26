Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992701;
	b=tMyPR4MszPDjw7n2GEHJn4t6JJgi5PhKpL5XON/7RCFcyQOuldHN0i+5NvADUcunvBIn
	 6Z1H6sve2+hFVhKbIQs2rIPvKdhrKJ0fJYW5BQbROgHDcgOf2giV9QP5YwiAaC3+3D+3g
	 USe+PNLG7QtPdf5cszdVtdzDzgHmMgS7GdaZ7sJNXv4+NudPoZ8J8E0lolZNkIDZQNVMI
	 8vQKGWgYc2O1eOZP+GVSQ7tHyLQwo2JtuJBO+42bVaadVAXOAqwF7E+IDNl7xiqyxWsf8
	 BjIBk3W8yoRrUG4yRBzcnQMMi6235nWGH5yQ/gPcz/nVD64LcCEELLIfWS0tgVEwfpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992701;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fyq5dGa+rOs8GKUpJEw1gvY3K4JPA9zickD9AlO7hlY=;
	b=0LEPwHlr3A4OgNJH38z1nMFvHOeVl1q69vDr04cG4invab+upikvgAB9jp2P5BT20MmW
	 2E8B2WpgcPwJ8PVYX0queXAp6FLm8JVtQ32EGkMX5nUbLlE4bMx0RJMLIjUkjnToFaTRJ
	 RaPyytr+9LOUMdUCNKGfQJwWRJ5pxwSzLUYaKzqeX2xrxRrFDuNlGJFolm+zMRi8VpH2P
	 Da+bo094muJbIRf7TM2p+Rq3owUftdRGOUJhe0f8Cmu/XJRNhWYKjUiKBTwVSn9VnJ3fD
	 +hih2cYzudRH2QqG4VFbektEhSglySNCQE+hbcGUAoQ9ojgXCpSPI+0ikwDiUtI7NXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ecqGBCl7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RXSuNdi+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5A5606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A5A5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ecqGBCl7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RXSuNdi+
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b7mj1907871
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fyq5dGa+rOs8GKUpJEw1gvY3K4JPA9zickD9AlO7hlY=; b=ecqGBCl7iDU9pDko
	eAYWdC2ecPWqVsHyt+6amofgkQW9fS4tZz/1Py6ef05r8metQAO5TvfgmR4qUHcJ
	2Bajust7IfA6Kd8TEfUAMIHtmWurqvWK+gFvMRvYktMA8Wd62DGXugX1ex+DUqwy
	L1+cxYsqmuMBgiwRkaSoB5XhGil90xwgua7E3aXKR9NzLLkQpDVru4eI+VKPw7HV
	/Syg8httgcppGTUoYh+RS4ssoLRDiEfoUtkvm+iWwGmsVNnbIACilNx9E2hykk4w
	snN4upute0OS3g3BvP9lPyqfJDkrwID8OKXbjyso1VjMnU7397nJndoi2HMrDfNt
	zsFIwQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm0gmydp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:31:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a065e2933fso3870575b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 22:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792992698; x=1793597498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fyq5dGa+rOs8GKUpJEw1gvY3K4JPA9zickD9AlO7hlY=;
        b=RXSuNdi+h/q6CGMw58LURa82rcDEtlgaN4A5C1Q3gYMxNW5WsPkZbQOYkPQ5Qi+QEX
         5jI/vOc+qhPE8BVm9Von+wktI7UJlmXgw5XgJzg5U7HR7Tvi8KrCnyXxpt//rHBDvp6P
         jC6qi9VdszhX6rBiyQAlnksgvi9BwXKfRCPWMeprMwn7TmTyFz9MWadnYetlrq9Fy3bA
         QA2JteW3SIYzVqC8Pb2th45/FSVl3mAm5OtPCVZkm9vKfhPPvn0Bjvl63NgmkecwE2co
         sTdfnRVJzBYuY3BNoHpWpdSz83wVyA4Gon3Op2sjGP+DYOfMSYQVYGz667r0RJO/MiIv
         Ug6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792992698; x=1793597498;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fyq5dGa+rOs8GKUpJEw1gvY3K4JPA9zickD9AlO7hlY=;
        b=Qq4aQ7OWvTgGa5+jGvBxvKcKj9fkoGjwWPfhaBDnA3cItbrnKrXAhThNgP8ttsv28r
         D9zaJhi6bSeu+jhjcN2DzQm5DMTS5z27Dzn60KMIOJz4qecgqPuBZFnVa9M6GLFPtQUQ
         1Foiyouvr8W+kO0mMuXA6yNJXai0MMaTvax8ep2t2Pcl/KmH+s6gB4HSoLFBzfBKMA+R
         0irrqWx7qlBIJ4Np7VY6p2rJWuQ28mb9cYeXFI8/xsne+cRVHKcw4imQaOk6QgroNKfY
         6YtCChgdYEJqDCb4LvcliSRYv8unxZMsyaXuv3mJRXg8HflT9eHbNSeNME1bj4S4SmG5
         kpPA==
X-Forwarded-Encrypted: i=1; AKwUvBwJEu8Cavh5mky8OkgDQFjokoYJJquBJd7GXaIYSyU624Olzk5nycsL3beKmp24zlM8lqMeDL94cGeYXnYU@vger.kernel.org
X-Gm-Message-State: AFq9FYLCh8fyQgDzjVwUB1lmRn580Crx4z9NN40GfhXgPpusZ/d2ylVI
	v1D+1ZXz2IMYTCA44WTlH/swNMiD36+Q7R5/dgtaxv3avaaNJ9Wgl8hx4nvJHea6mOLPbRLsWtf
	P3h40q7l/6GpeFr7ESIRIEfX3y/1izDB9/A6IyNQxTiavEiueSEKBOKfAgEaFw9OUmlxf
X-Gm-Gg: AYBFou0iU+FYFwy8bfi4QGt+fpyF0B4CQhRaghx5VCfd6DHmwBWLS7sIRNDJvjxrX8/
	b0dFS0s1ZvpfHJva2L/TAcEOR7Sa+7VDmeVJcAF+9cHrpFX6uOlDlpsdTjRXEFTKjYyImFKvcoL
	jtAVBrx6xycMatpGs4GrRuVSInPL9h06X0ZwSnpr4H4+fvTL9GbD0oVUNXNbmtx/UmgGJcLhLI2
	lbFP5gjQBx1BqfsQS7K3GT7XvZ/gbVnPZhbyPF1HJoajOqrQoTFO1dmt1b98zyHpPbEj2DoF5IX
	msZeug8UdYX/uzKqz84wCWemI4KntSAYbkO9srcXwNEk2wNKFAp1isYof0E1q7u0U+hz5gM6Vrx
	+B9u7stD2elGf0sJkBTzXeJjwtOxV
X-Received: by 2002:a05:6a00:a0a:b0:89e:d76c:327f with SMTP id d2e1a72fcca58-8a367a2d5c5mr4469595b3a.34.1792992698480;
        Sun, 25 Oct 2026 22:31:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:a0a:b0:89e:d76c:327f with SMTP id d2e1a72fcca58-8a367a2d5c5mr4469573b3a.34.1792992698112;
        Sun, 25 Oct 2026 22:31:38 -0700 (PDT)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36acada58sm901954b3a.11.2026.10.25.22.31.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 22:31:37 -0700 (PDT)
Message-ID: <9dac352b-6f8e-4616-a0c9-50eefbc4c0d4@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:01:33 +0530
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
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: sc8280xp: Remove FastRPC compute
 CB9 entry
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@vger.kernel.org
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
 <20261023090308.2898683-4-abhinav.parihar@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261023090308.2898683-4-abhinav.parihar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LWLmEuoFT9G2bhGO_AffkdrzMQviypx3
X-Authority-Analysis: v=2.4 cv=UfTE26SN c=1 sm=1 tr=0 ts=6adee5bb cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lp2TWI-43rxGvoCc0Z8A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: LWLmEuoFT9G2bhGO_AffkdrzMQviypx3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyMSBTYWx0ZWRfX3aerXM61qy3H
 7V5yeiCW5+nw67lb4y3FUKMjTAs1L5qRTvqK5RUaqSyfgz/LKL0BMiIMSjN/A+Hn+8MyEGsYnJL
 XxYb3HKYl+Fv04qeD4V/7rPLs1/hsplnRS8wbPMEvLnb7aw5kZquhgQTL0nRBgb2Efa1iw7XteI
 8MsXmO4NRcUdO6eI1lhvjBKO/HVEHvNspiqAeEzIo2nYqGiZTMks9V/cN5RaaDcqCDrgoCMsfAu
 u4xHl+UqLLxyEH2giH7bi/oZ5JA7TLSKr4Q0il8T5s54WiJIUBNdw+M5U2h/ljiIOyXReJZs8Z2
 6jFCSCeThD3W5tM7UzGOwrmQhzuORPGUrXQKUkkxB/zPyMwkKpYItp+dQbEQ5oIXI84pq3YO+OY
 sz7Z63AqKX0JFH8GBz0tcopIfgUBAD7mIE6dSPtDYZRh6k+F6MrP4jhFgO/5l9NVjkTOqyrFGya
 kHKurh7/wgOACmhmR8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyMSBTYWx0ZWRfX5Y9LfYExlU+y
 t5ZdQfqoIOosoYm/r5rZ99gFypPBJ95RG0M2ZL2jwDklLyv0hcuMI6pzfKm9eXIEwOJPdGUwWPj
 wLKRk34gT6/DAbkJ+PJH7+KWDfZtYFQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260021

On 23-10-2026 14:33, Abhinav Parihar wrote:
> Remove the compute-cb@9 nodes from sc8280xp device tree to
> prevent clients from selecting a secure context bank for normal FastRPC
> workloads.
> 
> Secure use case support is not currently implemented upstream.
> 
> Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
