Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E2349C4B3
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818700; cv=none; b=C9Gkq6z8T2agLBVTTRLnmtsycO8qRlmHBeygu4jqJ6tUB/RUJWKbK/9Qu+dcYEdz7fqNPoUxUU9oJiLvDQ4/cKyKaUWTR+osoKuYgiJwW7F98iX5Ti6phz5msBfwcv5AlPq9DMqPifXTdHVmZ77oiOBYwkjqQCsQk5znsTxK5iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818700; c=relaxed/simple;
	bh=ip+ZMlVYX0OgkoLPssESsiu8xYgxA6lPAfELhX7CVu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tsN9wtMgqjhkZZHUSeA6lSuk4stflVp7DEjyXOO8bEyuWyosCNqzzh+mECGtEE8biHF/n7AK+EaQf5Fnnih2hrvY3uOHaI5EhdyUmB1TP1kTU6eVj7/93jMm9wiTX4t5DUrTmpohm4knzT3XWiWpcSz0sXL0Nz6hq52xlZAzpRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e9evIjk3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QOoQ7nVE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e9evIjk3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QOoQ7nVE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0DB82275997
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BuIdJzBsTot29WtX7UNLyxnvjTOPbUUbbpt1d12vZJ8=; b=e9evIjk3VxEJdvgv
	yQUwSDD2asdM/MOXXh+pRI6Vnc8Q9wNZZ71nN89JosvIZrdgCCsLnCqkX5SRAgXz
	hsaGJyKcCHIs1EsXi7voBCSOimhj2MFeVZTiEkiM05qNhD/WEIerRrYuon5PMyFx
	lPeEirSg+3fBjoQ4cG5T+pENDQIq+cv8uRRfQ15M1Y5iqi029Bw7CdNGg//BRYCQ
	VTkPNyUS8514g9y/sVoFYrHL3ebCtaR0ejwxa2Vp8q95z06R/jHrAMk+Ux6gpkjU
	oIo+dWPj8J+obE8/3lfdq+1TetLURn0AI1h+wnYBZCDyqByDiIumBkPef+8oWm0m
	orSGVQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq21pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:24:59 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c101b7f863so47105137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818698; x=1792423498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BuIdJzBsTot29WtX7UNLyxnvjTOPbUUbbpt1d12vZJ8=;
        b=QOoQ7nVEqWtkFqrGNFf9qH0m56BZr1qAMu+ScEe6RqpGSP7xiAta3I9c9Ng8WxMY1n
         I4YJtPFaSIVQo4kDNb0jn16n5/wygU1i5sCY5S0Kvvj78pyTTsKNsdRDaSYBuMgTwWfG
         wpYDJdtaScx5vHBcFhU/xQSMyou/qv7FFCn2CB9W6fMxC3tQ+o8bVFTW/jTx4wmInak1
         Jifaym2DsfYBdPSXKKjKyrUhddNsAJlPcf9SHn33Q4EcJVnzNwIlCY3hetBBTWi2ymwa
         A2L4EuQsUGGSLECVFq3bWBEudqn2G6tmLLmNaqpoN6WcQwKhaDNNh0HJe0nnA9iuqhNs
         QwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818698; x=1792423498;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BuIdJzBsTot29WtX7UNLyxnvjTOPbUUbbpt1d12vZJ8=;
        b=ES4T7AwBrE+C4k+3BIyh1xMIQKRj5phpIBBUtuX0e3dJHKg320VXNPkdxZ9olVK7rv
         t2B/POtkY1XLm7wjisgXQUbjxbdJwEpyQuDT8cxK46VajdcctOBpSJ+rFcfjQMSEvWI+
         +2QL06pwggGWGbfISH6sKm/WantkMKRXNy/hFQF4AfTqwUsK/J4ouOEKQEu4/phK2sKT
         h49lZcQFxNyxnPIAqLBw5s74fHQqQrm9m24dQzZIyEePb7Dp9cZN9l9buJMcM9S+C3H/
         rHOFTX0B5fgh1TIFkqVDWjawFNYEed/CB57w6g+N4tw7vhaS5fLZjRncK/xEBZBbXrKX
         bAdQ==
X-Forwarded-Encrypted: i=1; AKwUvBye6RKK8mZObSJ5GiF8VExQ2KyNddWVC0qOCua/89oLOqXR7PfeuD3KlX7u3aMNyusLrOaQaMyiUROdwQmX@vger.kernel.org
X-Gm-Message-State: AFq9FYJy5FLj/eifIb3gMBb4pYint5NmoNH9odPGsgUadLGfbCCyBdhm
	29Pjk4HAevbwkIuPx3wXc6pq7EO6gXpA0sRiD8f2NRAR9h52s0uz7Lhzg4VXQH4+9yTBRT0qV0T
	0advqZKJg1kujcBw6EfW6aDVA+2roZmu9MOtsBa5iqw6K80JeqWnON/o/cLopSldnIgLI
X-Gm-Gg: AYBFou0vDTgOsUWrWIfERF2l0d7Sj7rgguG3+/FoCS2uHiOuDBCAxcjU51iKrPiQVxN
	Y9uJQSl/+mTwmqEup1MdpATg+RrFCP1pNdtuOYf4AiDS2WGY845DynyG+Jt0Im/Dr6NVFQng9zU
	yQZrdeqxBXFfvqjre8bQcMzsPlBeWkhKaIsNjsN+Mnh3kNhnugHzx+PaaP866F5CnxuCXAEHeIU
	WdNxVmpEBhdoN7juH9sR/7MKv+IZ5TkWR1qeklbqH/GBXcdww2jUmbex3mb89b1HBJNEwPl5SJd
	1WaqhYu0Vvo1CdIgKOGXaA//WK5PbqP65fE3Melo6H92PzBoB/3pXHJyMV4q66OL0kk75w1HH9u
	1c7pl/40kwX3f+yVIJVuEVQ==
X-Received: by 2002:a05:6122:4a52:20b0:5cf:69d4:10ea with SMTP id 71dfb90a1353d-5e92e15cddcmr1531061e0c.0.1791818698062;
        Mon, 12 Oct 2026 08:24:58 -0700 (PDT)
X-Received: by 2002:a05:6122:4a52:20b0:5cf:69d4:10ea with SMTP id 71dfb90a1353d-5e92e15cddcmr1531051e0c.0.1791818697623;
        Mon, 12 Oct 2026 08:24:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9766209sm479310166b.3.2026.10.12.08.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:24:56 -0700 (PDT)
Message-ID: <01025d97-c42c-4183-99cb-a1d5167b1e44@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:24:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/38] arm: dts: qcom: apq8064: Remove tab after property
 name
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <458647932763c7a063ae86c88e0ec9b0c09216bd.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <458647932763c7a063ae86c88e0ec9b0c09216bd.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6accfbcb cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=FDy9pVnie5uKVjir4MwA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=-aSRE8QhW-JAV6biHavz:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX1yLBXPuWx63k
 DAl5nflIk4KzO3ymJlgAes/aACE0FkFlWtERt8FSpe0z4tWidvHU4F9kwgdjcNsMMAfWUGhD6cF
 ykyFRYcQ9KbSVOP8XmHQj3FG9yj8bA0=
X-Proofpoint-GUID: giMgwU327bdt0e4ixv4Hi1MjR0GwykAa
X-Proofpoint-ORIG-GUID: giMgwU327bdt0e4ixv4Hi1MjR0GwykAa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXyOM1EdTVNtGr
 Of4MHVWDFXYqzb4LV8th4XAND5CzPSbfDtbAqISNZdPzNwqhv66/bEm1U100rXPo44nFZVjwktM
 FQEcYMrUlxV11Ca3M2CGE21+LeR1ZSLIa48QMI+AKV8mAu5EyHpL7ftBM2NilsdKzXLJbuq5uNo
 ysb8TXPCS4upshF6GUkV80CxObv2D6XcNcbPsFWp0NUjdzhvgH+5tdheGhbp9I4gxt9SCqUEEaI
 2Sw5gGrPExxPe3gaizrhiMPIOLpVC58dS0bIo3Hph10wALQfoKDDU3xceS95Hh8pvVZfTnR/quR
 g+LQqk1QIBDWU0kykSz8ls4zm4xSuD+jNBZTbYxG7AdDWNg2sYwxEtGs6QIH5Gb90GVMCbl+xYF
 /cUEaeuMnWk5/zRjmbvK8CyWDKrGsW79k3FkeyXh1XBePsq4gVm6x2lzHpbNY/x/xz+f85bRwbz
 hTIbrNdhM6wBEDdk8VA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> These shouldn't have these to be consistent with rest of the style.
> Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
