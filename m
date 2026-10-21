Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591167;
	b=z8E9jG9ladyiiHlUTNBEvcBQVYL5DFdTZSfUxBnmCGBQubDfmFN/o7Dbp4QDwU4Qrbeh
	 +UDXyuVwRXNg299QENdnl1U4RfItAgDQ5nawFynOw+bAki9YVX++ehUfNsDMyls+KVMf5
	 Ut9LkABRoobEMGz6Z6e/29kMvGqurb/f25KqWAgqTSn8eb3mAYp8n19qyPdEN4MqHeq0f
	 NpYw4eWIx82cys9r9LVs0IcJImzkD/8V/MW+yqy04kQvI4O3SYOb/84ySSCd6TVsGBfqf
	 96+5aXkgvndRYFy4xVGOunGmeV/OnT/TiYnkDtsJtV1vI/BH7YB/Db8G1F+7GcoXBHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591167;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=v7pESOuNoQ7+2mmCjub8hEr79x+EvIKeMwX6F60/Bkk=;
	b=Q9J1J6dwAEOaxJq2PpQXQCJMzImZ+DBDNLMmuFNU3q47OG5NtAw+mznVva/fjUC+iIZA
	 YjAmnr1pwrWNFFLqkuKsxBZU11BVpEsRLNa2iJDos0OQPuXdZxRlllI6lpx3qH+ClVfb5
	 NPpqij9UbVOZ2JAgl8HOnmSECAFZTDrq0XaRdzJFUdkkkqpLA9SZC6YFk7DsHjofPO4/h
	 ivZK++YJm65NiEk7TkW0PbRcN7a1/F3lZ0M2KUEmtXZm9m4+XtJDfxdc8/5ReTrYzLp1m
	 G2T2DAZVJ/weFzNbopMID7rc24rdgA1xdx5ydSo87OZsdptEhSD7278nqMLkxITNpIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HipwKjsa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xc92wjmO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B110E606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B110E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HipwKjsa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xc92wjmO
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LDN9pJ402771
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v7pESOuNoQ7+2mmCjub8hEr79x+EvIKeMwX6F60/Bkk=; b=HipwKjsaFTPLlEni
	mKbIfwZBmmxxgZFkWfSwqs72ZheXRop+st7cnpzo6zrP0M6LO70KS2wXXNSzwjsE
	+2y0/aS5l/5pRd0G9R9v6ja9BUidUh1PG7noWIdn4acWUvvnjhKduhbpTawAd5G/
	b+lXPGThKktduR3WAEtE3aSrmOYAnO6sys/xP93f9yeFMpqSkjm+oa8Gm23Q5n1M
	GnNZ552BhxARmlbtitdGmNrSrQWm3DjXS4PPg/jkQRiCDaxSNx4ZNSStPwNz/Ua1
	dOa/597Hgf/xoQGwiGJF8iQ3fA9T08Vhd7E4/Pp5R+4xKyihA/JfmJDU4b5jcRss
	8kzCVA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vr4yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:59:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc50fb0d2so14346685a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 06:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792591165; x=1793195965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v7pESOuNoQ7+2mmCjub8hEr79x+EvIKeMwX6F60/Bkk=;
        b=Xc92wjmOZgrL7qjpfUAbZYvpffg8xd3EcpDEbYLHP/pubfyFVFPftTb4r6kiKaC4cI
         CKVSSc12VwbGdfq+s5q++25WcDyWdpfjw9L1u5qS7AlaxBBHRozHm9bEdIsMP15ho3NM
         MOYUldAvdGKfPilzvEzU/CW5qZUEuyNitnd6AJC6woOYaJaUvLyIwNeS7gza0cTEaunD
         qOeVby20lC5ZeprHICPlSYIyygt9slLilxl0oplp61+yGgXLV+33G1sAhj/QjePUYISF
         HG7MOP7+dzcWlScMxr/zi5NmJD0lXYYna9Y/wtjWqRsuImcjNyDLfOoAeGGuaGclnRd0
         XwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591165; x=1793195965;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7pESOuNoQ7+2mmCjub8hEr79x+EvIKeMwX6F60/Bkk=;
        b=QQaXDdEfujJqX7ZphQxJltMMne/Rf8lCFFAaCj1/aCRgkvaXivMan6IdNKXPQ4pCuO
         kZ7TyBGVwTI8V2+gaeUGb94MwAMYYu8oZZiOaRqSCQac1OiDdC1Pejh01CKvOq/yLZR/
         BZa12zuhFmOlO7/O8IoFXmToqm8f6w+nb3u6eCwYMcA7qnJA6El7jQMgnqksf09es9UF
         9NeR8509CwN3BY4qfbb9pTB83Uk6ZHfEvcDtPqZFfg7Fb4pfzHkkOSpQoWbRcbpDfoBp
         A78OE5NagfxlLU7N8Im2nwWYI7O8tTzjubafIKG3gWXLo4QcfxH88P0/kVkDlSE2w+V1
         0ASw==
X-Forwarded-Encrypted: i=1; AKwUvByMTlD9eFuFwVfEmbGPmNSDDnuZNXjFv/zbEhG9aA0NDCcjX1tUYhSx2EM9hPmAOPFscU1fundp3ZATNDz+@vger.kernel.org
X-Gm-Message-State: AFq9FYLo0G1xDFABlV1Q0gghxKPNOTDnRkDVXO9FrchQk8PAqyQCEkQc
	XOw6QdyJuZUmOymJkB/ijwQwZ/FDA5Rp0ix3+SFJwiH6vkSmTlTs8tUOKODrPL1pyqXjCnkAHiz
	7lhWfDGU5JgdT6LjeyhOCFbBlCXVuI0vjCKTPPcDEEVoe88mB+6/sFmaBAdlntWmoCUeL
X-Gm-Gg: AYBFou1fS2y29uXXKrzDgRZAkS3G3SD2PHdbsxjVxIk6hzeuLLR/Gg6gbHxoYRHmpLm
	/YjAacIX2w9Fr5QdtPG+KWUJtvU2/8r/USbABuL3DmJNu3GSj3N/F6W9msFgnM3feGBGWN3mTrL
	DbhbDgBSqmxry+XqFtTAlu132BO4Oh48MqtYGHhdTRlkqFVx5VxkYK9TWO8HKIJ50ov+cTomIUE
	mou6nLnUKJqDIeBQWg40YoCNPINgzH7dW3pyeCcGlXBSGdSoipfufmtLX9byH2ZQjL+YcDFce0f
	s32Mib7WB/ea6qNHyMkBDGVXtcJx8UVN9OwPIb8M+SqYtzhQ4eb77clzjwKDwRrMPBFlNkWv2Bi
	nrsoXabKBxHmjH56ukj5coQ==
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr481259085a.2.1792591164892;
        Wed, 21 Oct 2026 06:59:24 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr481255885a.2.1792591164457;
        Wed, 21 Oct 2026 06:59:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b403167e3fsm904154a12.34.2026.10.21.06.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 06:59:23 -0700 (PDT)
Message-ID: <f275d9de-a51b-400b-83ad-298d0fc9eda8@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:59:20 +0200
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
Subject: Re: [PATCH v21 11/14] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-11-04fd28d815c6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-11-04fd28d815c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9SI9zl-EcpDDUX2dMPnj50U2Ixdp6pZ8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX/+kcN+qtxozq
 BoGG9HsCJ4IqUIAyuJM1rUONQId+RxQ6+rFVeApDlVOuFfWc3V9JAjqr5oIJVxMrtr1kqN9mqVc
 PrKMv8KInOdPYKLxayiBnQWsCr6p0BA=
X-Proofpoint-GUID: 9SI9zl-EcpDDUX2dMPnj50U2Ixdp6pZ8
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad8c53d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=wTWGZ2-w8gThuRR8FIoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfXwp3ENvpUgOat
 XWRhH3nZzvbsq8VaEblFWT/Bdt6+l41ikOqfEBtaqkX8Jlu5DCvjvkrhPbo3m0BYK28TsiRc6Ev
 BetgH+V5QoZrxYi2fI1HcloqU5zfRAkLzFH88scdR2HZoxWrWZ1p957Zbbk+LYbAbmyCORuLg/p
 87ZX5n1CC7B/L97SXCljPo3OIw562q9NQveXNBclepMgeRtWrFh865C0NoxfscXk34TXfaOKfiD
 HjRFZpU2my1cI7dJwwoSwXSc8rjkx5knGOUf73y8XM3gHZpkHVNJ3WOpTiTseGJ4SHIq+etdiMm
 lSIoluOldDmiKGVvmidAawzj8DiK6CSa8W8H+mRjbOc7YQimXdqjF3FlOYDxqbe97IEva7Yq3X3
 opyO+G6OGkYn9AQTuNtRm1jcEeL6RZV9zCfKUk+H94gQOiKiM8mffgshWrx/TiaUtX/+Djle1CM
 A8NT/rqTNmZSLwMlLgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210055

On 10/12/26 8:45 AM, Hangxiang Ma wrote:
> Describe the CAMSS and CSIPHY blocks on Kaanapali so that camera pipelines
> can be enabled by board device trees.

[...]

> +			      <0x0 0x09191000 0x0 0x20000>,
> +			      <0x0 0x092dc000 0x0 0x1300>,
> +			      <0x0 0x092f0000 0x0 0x1300>;
> +
> +			reg-names = "csid0",

Please remove the stray \ns between each pair of xxx and
xxx-names

otherwise

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
