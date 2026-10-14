Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817714BD340
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967697; cv=none; b=idRfF3zwPA5PxDo79ks3+GTI5OK7qume13tdsi3mnUZVdtTx3RVSaeiiwETuXxLxjCxHvxAVrKaUiPfP3xGNRCBKQAnmBGhn2ROFkx4SoZubX3iUlQXptmUIMErx4Ngq6wJ9gb+z60GqzwhH2ibOM9ZG9I51peK0KAwEZvjfrs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967697; c=relaxed/simple;
	bh=ZGqvc7d+/iYrqhuRbrEYA2op0jAtZ/zizqGfMe9nFrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SVnQYkleFiCEWjvQ4j7mbwRbUyxu90zgYFTvLJc8eStZiRnYL87sK5m3AOH4+O0jJXIJhNQDcpQbVdrhRbChpwvHoxYJmFcDjg9jrtLNCVLlK7qbipmyM5uUJX90ni4etEWzALlwNBnqNqLK2aU2xpmbs2JDa8Tie5XP6ZuNvkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YbdfmR7q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NcC2o7ei; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YbdfmR7q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NcC2o7ei"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E6jS6V2088499
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iv3MbPKU2HM6gGRdqb50h6fRVjR44ldB1k8a2yxCqGo=; b=YbdfmR7qFW3G1rkd
	xmFuSJ2t92YC+447QJXN4AnFyDwRGXJEEKQSf+qjHKVVHGOKuxLEzofy1ukzFJct
	POuUR9Hh//xyLs7vIQ+RxePCDXbADKxzlPdH/87KdqcSFeRrmiuLDifz4nfzglMj
	8mYliWndv3ZliitjvIPjeN1i4E+OylEZ7xL80dJSQmNbizI1Zpp+fDS2HDRDbxs/
	NMknhlL557L6rPlbwSJjL0Qt7s5f+Js3PZKLMSst6HHX1DueoJ6vfs3UTUZHqdOc
	UctsWm7C+uCF1EbIk1WelpaixW38Nhu+5v3tjT17q7kAMSZkAURostJH08ZQcjrP
	8zMxeA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9x49hxat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:48:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e93f67358eso4115885ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 01:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791967693; x=1792572493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iv3MbPKU2HM6gGRdqb50h6fRVjR44ldB1k8a2yxCqGo=;
        b=NcC2o7eiTghpUOBD4X6Dsj6Le1KI8KPwLZr6Fg1EsfV6yPNxv0sSLc7o5QNh4ZKe94
         ymO2/j9UUvF/ssamBZt8cCdcfAK5zosrEBcwsM+2S+EjMHh8HeTqsHW5YgnHiJnkNoPo
         GrKyQMLsR7sKcaQ0YARbqvuZOInqVJVuuXU+elMGHcclphRCxCfaTL9Xv6w28PN0q2uG
         eRP+EA1W6RNMQ4Mzh3poLoMVoCvswNuxFzIB0DrwLkjXjc3sR4zWT5DPE3swMlYmGkhT
         pHjo6EUWH8+KHMLzpr4BLEVmk2soe8xCApXjj+T+G6z73UMdMYtcsG8/ubrutBU4Mi7g
         VEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791967693; x=1792572493;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iv3MbPKU2HM6gGRdqb50h6fRVjR44ldB1k8a2yxCqGo=;
        b=JifQA2Aj49wdCC68Z1b/sdynY/R2hyhpm8UQMliFIkSqeb6stZ2G88PoZoFM6va/9a
         yQsZR2lUmi9n+2hNXVsol1gJ3ZPBNAasKbpl5RZyhcp7/7zr7TDHo1JXAMYlFJCx4yzU
         5jTV1UaS+9wvQ45QWMXLt0y1guQyTqLHGYuRVlhFaoNRqzkQFSFzc4Dx+ULzQ+j4X7XU
         BRFDpokOcHKVSyHOpp4L1bmoYJs99/679y/rUMkAs4v/yWxmmyu5okHLI69286LDD/yP
         eyQCLhI0Y4wvdf02RLMZg0Frse0lv8y+We0CBaWCeJrKeevQmq5YCu3WQf2MV/+NbkLb
         ETdg==
X-Forwarded-Encrypted: i=1; AKwUvBwN7SJgMI1ZcsCF4ziI7xgj2G3GmldNSO7tWVk64gAgljiiv3kwSc7WC+sW8FXMkuooiFHSqrgmbsbat52e@vger.kernel.org
X-Gm-Message-State: AFq9FYJk0DU4V76tHX28LevWboxUEf7pc5V2hWdA6jASk5KPOCIY3Afn
	GrSZwGp2FbbOB4i2HmGCkW3wQ+1Igiz+LncO7q1+NemHonNJTVuEgr7dZ3k9Uk1TSkc3vyco4yR
	kL6CG8iNhFBEZrIw4heC8Op6vCTB6tc7mSmW8jE6YsqQfVUIDMRgQ3e1fFz+IqXc5fjy8
X-Gm-Gg: AYBFou10f+QyBJwfrTFWcKjRu8044Qa3CoRRxkH0y6wmlPR/TL+KmkO4GEAPVPepVzt
	hw7PUNtbrMUBNgWinbTPoNyXF+VRv4eYOb1Idvgx89N8ILkD/GZ6xjSUaHp5rQPqowWheGET8C6
	tMlhvPiKhCY+g7bn0dpxxnHSIi0xiHVydJzplzI0QAxOsMFHS049z+RLiHyqr25lVpmMHl3RHlZ
	qe6IuyXGJzM5zKLf90qwGYHqwJH8Sl867GH8G+9okATzBcqCiUvDc/PZNm/xmtiXbRqtqUv4HCr
	4VOXBdBicCdt+fVwubrj2GxDHiEb0QHovhPqSD0rT8lBLu1FVJY/3zRCjJ4lcdvwBO6oNEdYMnI
	rvZlFTpe9dsNAYE+AHBxRLhShFocTC3E6hFbc2/efiUMB8mtuKmEBBHpXUT17OOmq
X-Received: by 2002:a17:902:f54f:b0:2e8:16e4:c568 with SMTP id d9443c01a7336-2e842cd278cmr129276975ad.37.1791967692843;
        Wed, 14 Oct 2026 01:48:12 -0700 (PDT)
X-Received: by 2002:a17:902:f54f:b0:2e8:16e4:c568 with SMTP id d9443c01a7336-2e842cd278cmr129276855ad.37.1791967692370;
        Wed, 14 Oct 2026 01:48:12 -0700 (PDT)
Received: from [10.133.33.181] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b16b3sm66817195ad.30.2026.10.14.01.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 01:48:10 -0700 (PDT)
Message-ID: <c2e6d301-9f71-4b4d-a6a5-6be10f63efde@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:48:03 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 00/11] net: ethernet: qualcomm: ppe: Add
 support for IPQ5424 SoC
To: netdev-bot+sinfo@kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com
References: <20261011-qcom_ipq5424_ppe-v2-0-8c7b057e2c43@oss.qualcomm.com>
 <179172392274.2527009.4852578355298213005@kernel.org>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <179172392274.2527009.4852578355298213005@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YJcKWhGx c=1 sm=1 tr=0 ts=6acf41cd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wfrYX8O7EWgUh0Dss7UA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfXyiAkGG3f38VO
 BKMjlZyWzGFXR/Q1y1xE44FjtYm0z0ypQrQGZJ+l4klsfV6mXZpdGPPRe0Ilza/38cmZdE+lDQd
 Dt4PUVjtiX3ZQTbUCnXMBQYCcaNme2YelKMPXuczPspl/uDHNXY69lzgjeDskpgEuBPs2z3oGxT
 DOadqhnk669EgboBmy2N0a61EgauHD9uRh4PGa9zT947b3HfGAq8Ah5yPpp2eQSweDc5fs8fOSn
 aXAvHSeo4oK6LCml8ugWPEI6LwkpK/stYov2GuvN0CVww1O5Gk2RiGoVTsRvFWxNM+D3NDvvtne
 ElFqGioJljlFozjCI5G1y1dqajA65t7tbVb4PeAJcISmEWsNwx1XiBjJ6X8m4xiRxokmovbBIjj
 CjykfxTxP4sFDGZq7ov58dB/ntM4XGQpJzeIVhPrSyB/cPgXGwa/9h1Apkd0i024c/BcNSAOUbl
 KS71aJ9gaU2lRwsQodg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfXwXPdFD0mxync
 eVhBJeZqJp64pvcjx2koqcY/iMLbAiFiBXrzK4yGxJyIyQNr9IJXU/q/zX3lfCHywgSg57KrJJi
 CAuFgbmFHLWFmKoyyfvP7kbF42Mzoek=
X-Proofpoint-GUID: tfaWsFpLSp1CqfQMr7xk5bbv6Yt4mSPm
X-Proofpoint-ORIG-GUID: tfaWsFpLSp1CqfQMr7xk5bbv6Yt4mSPm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140034



On 10/11/2026 9:05 PM, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
> 
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
> 
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
> 
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

As I replied on v1 [1], both issues were found by manual code inspection
and are only theoretical. Neither was hit in production or reported by
users, and the Fixes: tags were dropped in v2 for that reason.

The series was tested on the Qualcomm IPQ9574 RDP433 and IPQ5424 RDP466
boards.

[1]
https://lore.kernel.org/all/4272947d-a9df-4cf2-b890-c2b2392800e5@oss.qualcomm.com/
