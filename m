Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501961;
	b=K9hCQ2QbGG0BaypsW0Ruf3rMrg87fgA4kh5ZrQ7UdDI/e17WDgSLOklvbwDpwq8jM+oj
	 GjmwxxCifZHUeqWxqDIh1mmMJKKu78oeYvJYWch+NmKbaqj8KM/VeQLr11x65/Xn7mRh2
	 mGFdsnvKoQGmOPgu8HhnXdf4Lj+j8fRqjBtLsNZhNVCa5GzAkOX17YB8Nmg1CmOqZniqZ
	 203BUN0DWWMIcoB+9rf8FUoNHoBSFW+jsGaMVBWptDjWAIOX2fFbnLV8ZtAdSrektZiGD
	 ptwYJ2YlWaFb5PI7sIZG0rODxFqgKo2e4/b1c5mdp3tgAngkczL9FAKeXm/JO8Pkkdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501961;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UW1vQbaFWJhWbULotNLMo4piEQJWdZbWypx45nJnwSg=;
	b=FVNIPSFKNgAaO6KVnm/uaGDOU6SBtAuDwY8cFzr4ig2Nfp/O4jqxxXepBOYkLyTTld2n
	 qd40ckqbLfxorH1sjqufUARK9J1FBrAjuIIfjnlzO/6ZNG/Qz7PsBZUBMo2NNgd89OIyK
	 0zWyGv2pdI/OcGq8EZSl9fcKzuh9Srw9ZulUJk5IRNEE/KSjp3lB19/oWAEg/B68mdmES
	 Kq8vCrRPEv6ZvvqeLEw0qtvZdXuewHdJOFpr5uYsyDzfmPTjamOrIpO8B3TCx/rFS+6Rt
	 fSPXt5jPduN1ISugOn4DRQzBQNPo4C/aIY3rUiBMAt8N3QQ8keIOIZm1gZ3Iu2LXyAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="MP3ZJgF/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CttkPhLZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E8B606A322
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:12:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65E8B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MP3ZJgF/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CttkPhLZ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDAKak1732265
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UW1vQbaFWJhWbULotNLMo4pi
	EQJWdZbWypx45nJnwSg=; b=MP3ZJgF/FAlQUyDw6+XzcQi5v0bSP+XtRuLy50Le
	fzNmSB3NjW6qchpcOAY2bNp3FTzVpERDE1qbj9t6SSwrT7cQersODq6vT1aBbwwj
	EVImjOpK1o54RHAaeIpIMExbMjyaypbz9ARdxGL5DoYeBcDziJor30LsL80y/NpY
	cizTIJ4RED5a20FCSFytRKs7FMp8oA5qf6UAJbKXgIRVwIZkRbBEqCm4uPiknK7P
	ur9OkWND1Tm48bsnGb6GLtrsPUeL0Lb3l6Rxg/eTLz8XqW7qFm/Bg00rJSr4t2M/
	eaZZy5WZkONdeNv6HOr0JN++S8KfnS7SfolkCXiyTyNYwg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2kj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:12:40 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf45382794so2614635137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501960; x=1793106760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UW1vQbaFWJhWbULotNLMo4piEQJWdZbWypx45nJnwSg=;
        b=CttkPhLZfpnX2Ae+1gxBfAcHoIhbwLTV+bx8gTovNjS/FvaUH40K93fQaGpUQjuE2O
         zurhAZ6E+5cbt+/ycDYotvtTkL3ZgdXSqU6mY3umpKxYPY7AFvKr9FcUe246bnAm2IT5
         002D+Aiz4zvaDCA3LLArIIKjOfIoT7V8oF0Rey7EeU7QPJyLcWEsTIZPNNtvtNdzE6ht
         MIKzs8On9BSCJ+9wOaShmA5Zhp4y7RESZij5omuHFUPzECt9gqjO/1ElqT6sbAwdk8ef
         grG7CDcZhrdnhU7MNwwyE/U+Rmo+A9EVEzgI8Uhh1NlYRoK4IBq+yJS0T9iZsfWnN8ZU
         W8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501960; x=1793106760;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UW1vQbaFWJhWbULotNLMo4piEQJWdZbWypx45nJnwSg=;
        b=aZPI4MwKl1tkEFMg8s/AN3QsjrR9fAs0DBsEsyqiG/W9B/gpN1kCflJI1aa9mqvIU7
         7rPIa4l0R22MQgVWo5z5wOGOCjPV9SRg/N0gTVjzqtmO22IHp0E4dmP7slYT1/m5b2Im
         hEuFl9b/ruSBXFV4BV/7Sy26QGCyqDYG54/V2pcAjUTlcyewjdjrCRGDGm5XeyOrFFly
         70gaY3CHXJyBI50LmKqgwqZ4B2kEqbhsLO6mPjHAD6p83NAh3nWhXGdGu4DqHX2uVequ
         sXMZIjeR1uiz2AoCJLepi+nH8o/heGmBj8RGDFNDGPpK6SydCwps8auohdT3t/jczjxL
         KQdA==
X-Forwarded-Encrypted: i=1; AKwUvBwJScImb7k9KvzgFLzd05QpP/Ev3ItcR1VIJ63lx+zTvnB8IF0NW2TdZz/nRu2ZDheIIob1U38/CDSHwlpZ@vger.kernel.org
X-Gm-Message-State: AFq9FYL6w0SsGrBVVX5MQZ4O4aEamWdVbHeQalV/AAUsPLTtNWL660jR
	OLqSU5yjn6dDyPbLGul5MD2Id9ntYwYlDv6c4JKeASQm9qFAuwwGrXh+DaGndLshTdREgSejgkZ
	DcAdBJ17HuhDc9Qsf+QfpqAZDW1Tqz8+IepzclW75IzBTK2oFlN+doLB8/yo374tynL1Ano1Wmv
	52
X-Gm-Gg: AYBFou0D+Kn9TiBnh5CTvZ5heIiqoDVTiDTHy21JKMmbBQwGqXsNR4PpPaqlag/RE2C
	JkFPLHmNEBJi+GCMJB8vkqAYpbsoNGJCVY7T33y3MWGDVIQvZX1D8P2MgS43MHb67+g3ZQGriQq
	CEMIt9mPB63cbzUpda5oG4qhT3pHpHDsN3V2/uaYLqHmh0gpL1vOC042Yluc3HDMCN3eJtBgvhk
	fBKZtSHZBTDJ9LcbiYlyJadGyhK2iK7rtFACVT526uJea0p4odl3sgdBUSths+H3KMe5I4FmK/o
	iVoEgRFYvldxJd/zpj0nOoYoQ9S8dZmDZliHJoYL8tG2hB88YY/WYqjiTck3TMc0YaFwjg8lklM
	jcryPTJUit2LTqqAl
X-Received: by 2002:a05:6102:509f:b0:7c8:448:5237 with SMTP id ada2fe7eead31-7cc36a05fe8mr2648187137.24.1792501959597;
        Tue, 20 Oct 2026 06:12:39 -0700 (PDT)
X-Received: by 2002:a05:6102:509f:b0:7c8:448:5237 with SMTP id ada2fe7eead31-7cc36a05fe8mr2648176137.24.1792501959052;
        Tue, 20 Oct 2026 06:12:39 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f69d9b1esm47118715e9.7.2026.10.20.06.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:12:38 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:12:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Cheng Jiang <cheng.jiang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add RF_CLK2 clock to
 wcn3988-pmu nodes
Message-ID: <s2a5sfz2pbyvfzlmwwteh4tptrbaphpelvd5fomfcm4tfxoq4r@m6zdxbrmvrp5>
References: <20261020130852.3049639-1-cheng.jiang@oss.qualcomm.com>
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
In-Reply-To: <20261020130852.3049639-1-cheng.jiang@oss.qualcomm.com>
X-Proofpoint-GUID: cJlWXMjbpNVWnKfDw5Up2dz8jXZ8N0qC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX0ZUAVAbjur+A
 bYi9ovEdiwcUlVb0Kx9gWg2vcXhAILG+6qf1a26jJFFNMNQ1eQQUH6zwG1T9gFYjL5yxhAVfNnU
 vlRu/OdCULFEFP9d3b+Is+0aYkDGaEw=
X-Proofpoint-ORIG-GUID: cJlWXMjbpNVWnKfDw5Up2dz8jXZ8N0qC
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad768c8 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=9xTM98GwyULmpW7hZsAA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfXxRX0DJcEtJ2g
 hspUpO5JzkidBMggbGlMtbcGgd2zcH3fguOPc99GjY09zWPLxCjAmBaMGwY+jXzO7RY9qDyq4HV
 6MQ9DCIeCSInY5JetzGhsqk31uZ6odC7FQFIGPgf/yHoY5D4lwGqvh9ui+x0v5ART0Aeh5k0dZH
 jYrAe8SdJfDgIoEJPLCx+kPkt+ch0RajTxXBoWmQ8bpuzBn3laM44lYDKfZfGiLCP2QXf0U2Gn7
 tYxS+wPxFM93fnEE25XizJ/zmkdN9J8hY9Sz33UtGPs+o3T2qGzmLfak1IXtpugKJhxNQOL4WvF
 ajWBGK8rSCeQZL2uZt5ZGDsNaJA1RiveqXrmEjzYh3mFrG1eLHCtTO9vh7imItBKrL65rMjyJNM
 Q6lzH0xXLcKdNcBxbhu/fhDb+nxYnD7VfYDABx0zwZD1JFfhdMevpl2SQjTKDke5AegsvtwlHIQ
 20dACnA2rGxCYFAc1kA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200052

On 26-10-20 21:08:52, Cheng Jiang wrote:
> The WCN3988 on the Shikra SoMs takes its reference clock from the RPM
> RF_CLK2 clock. It is not described in the device tree, so pwrseq-qcom-wcn
> finds no clock to enable and RF_CLK2 stays off, leaving Bluetooth unable
> to come up.
> 
> Describe the clock on the wcn3988-pmu nodes in both SoM dtsi files so
> pwrseq-qcom-wcn enables it as part of the WCN3988 power-on sequence.
> 
> Signed-off-by: Cheng Jiang <cheng.jiang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
