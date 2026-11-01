Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793562339;
	b=fJ1ZGX496baeolVFXcrkWzyDiLYjW3+nZWWHpm1IIe1Xv8LanWAHTGFKDHrdkRHprU0u
	 7bW4WBGNX+O8qMdmdQZS+ILdAHmA6HuHL0Fc4V+Jgc9dYFs7XpH5Q54Qj7ziRvd/Gav1n
	 cUBgzfnpRtsrgYz0N4yIeY3WZrYmLymlDTSXyyMNMUjNhhpsM1kAN73WJCVUHlxhRR+O/
	 F37T3Le86phYARNBIRCyqQnxNsrtA4j7cq9X+zrcovda0glN1FqEA29/8LolziY7bclAr
	 2rLbGo256y9CgdC8oLFwUTdcckatJYpyfwxevuVlhwvRky5F59hIK9MoqoszuDV7plQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793562339;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ne363uRV0Uu5dBRIJngUIEyq8MSL3B2gNct0ddDnFxg=;
	b=w83ahiEmB2wqy6iPYs2Rc72P7UfOmqZNXvrpOaYAy3iBfqCvwMvHlj6YMyVyHAN8twXv
	 04SqhvDAyHBipEd3F42ae7v+YFIZAISaIdj4GemF+N0YqJjYa33zlQyuyFk7Wm7W4+oEp
	 zQ3NfBRgpkqL5ej6mf7l6nH5SceSd3zYCezSUmze6R74aR5RrFfb9nGc1p97S8Q5e/z6s
	 0jR3rw1kep3zlkhLFN6rcyA6Hte7uxc/BtsIx5pIBNleUoOojIjMs5LrDJZT+nF+AKlNE
	 4TAwDCkI9NapnluBP4uzfVoJ8PNC2kPHWzWEhG+1zwFYqbDrbWGeJ/qOtTtrcQ65gZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQiQkx0o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M0nv6dX7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4989A606A324
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 19:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4989A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQiQkx0o;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M0nv6dX7
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HPxjS2019560
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Nov 2026 19:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ne363uRV0Uu
	5dBRIJngUIEyq8MSL3B2gNct0ddDnFxg=; b=cQiQkx0oLy4c8tJpcRr7aL83KMi
	54VJie5sxkKiyuF3D7lI/6ZF3y4bN5rZOJkkyt5ILvhlHyeXjwBsRaETywSfFD8C
	oQuqFb+0yOpdwgoSz5nQuXtlGXZN9FtDCoTSReiBjts09lJK8VvEdRJ/Ds6egjLa
	ub0C7bi6mQIiz+nSCs85cIiNYYBGFSxuzsGZStJG5waf5/PUuMXcbI7D7RB/IhS0
	xnQUr9pc31XQMIkx2OOQtWEuwTlx02vOWPALA38AsOTb9n4YvyY0wCdKZxcoba0Y
	IKCc4XIbbGUkhQ+iRGQ8evHUSH5Qq9Dr4p84oiMGTx9QLzQgw4vhkCHt33A==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6m6k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 19:45:37 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-679b648598bso4023276d50.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 11:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793562337; x=1794167137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ne363uRV0Uu5dBRIJngUIEyq8MSL3B2gNct0ddDnFxg=;
        b=M0nv6dX708wwA8gxBSbZZGfQGWo/SJIZ+bOOXGMrHMuz8d2q7G02M22hvBGLbFT7gS
         v3w8cKT+jLrotX+R4CTSQQ97aCfBv13TcCpSzsxN55ULlroTyJqcpLfu0mzS0W9X+ZDL
         KVz6nchHsRIdZZvr5z+mX+6nhM8wSAf6tBp8dfKpX+SGG77tsqBgIz4tUUlDCbuswoQT
         wMwMH0G4uP6DbPQK+A02kAV9qPiTul//OPCyiGvJMMpZl6837MhO6WDXq1SiCAx7pYcj
         Q6JU4BDu4c5Y3W6EHVWN+4BV43tjM91YIzf3relLFV/WFA6ZIpwibAugrRHKbfdWLZ5w
         yfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793562337; x=1794167137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ne363uRV0Uu5dBRIJngUIEyq8MSL3B2gNct0ddDnFxg=;
        b=CntVgmsdmfGMGHjToHA2u/9ljyvIJGh9iV81/T88ngenxD7WpnUh8XU+zTaKauUily
         mZffB08jqJnF4v4kZxvPpGxCpBkXVVqWPrvPmbkcuCgk/NhN6FCwmZWJW6yo72yWzJF9
         POz9xF99dMQaYytP4inc7k/M+DbvoRxshN9di5H3QdaM70CHadRTVYHWpdNOLOfD1jcM
         Lrz6ZdcaYg/S9SXkXEU0E6AUeJdLBT+ZeYr//9p2nHP6f7PFSk8igSh7nnoPX5K4DQju
         iGoQ66c3k6Vun3WwnkEHpbsryy0SJF7XCA5JZ+WFNhbFY1T3fbcq3pZLkBxh/GW5r4XT
         rQZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkDQHgo94taaY+145HYEJ1H6xuFbyyb5LDGd0OjyEv4a0V0H2O3GG9czJwYhBOT7QFGQ3iya48SOPUyZ3N@vger.kernel.org
X-Gm-Message-State: APuU4Z9+Jbu93uW/zL6HPFMVXYYl9uhlEUFjqH0jsL0vaI+WCKtlFStL
	+X09HJV1WRMDmQu5AFODORH7vYh60ba9IjGzpWGIUCNn3Ato29cRKPje4aPAbaIM3BlaPPrHoLY
	3jWP8Jj0WuQ8bxst9zaOAn8NLLJGjGE6gFyrC+XrWhMuZinlq9fwPkdNyVg8fPSZk6SiH
X-Gm-Gg: AYBFou1scnJD2ddtKntRudkdbHy7Qft5MaQYIIi0cOjE9O0uewGVC6Gqzngs24kk8lf
	iuFkWfbEH5/iw1Q09/kgDwK4QE6qmTfMdJCj4AoK854MR/X277snaxafpVyo2yTgEC9qDncint/
	VcB59fJjoUYBPRCDn0ee2lyQmKIHvGT1Uc4Nm1Z57XWDykGddkr+6C1HYQH+PhAHaG/Me89B1YZ
	AFbLH6161UyqGIHfw3Job1bxEmLrVgbMHXd36OfDp425HoqlrGsrzQ6uWaS+sVGwhpJXZhUi7IR
	rGZQsf24CL5e+xaBlXJF0a1eaTwgg5ppEg4M+nGooQXeIwHNvXRvUpzUKO4eUVY6L7gqJhbk/y4
	xrPiwUAwzengRK6uaeHDvyrGQw9tYjcx2cQ75ivsDSUD+4zusH3PZHuHRqrtBt4pmxckWrsCOri
	ddVTQ=
X-Received: by 2002:a05:690e:4550:10b0:679:9afd:c0d7 with SMTP id 956f58d0204a3-67ba4fbc1a2mr4238864d50.18.1793562337538;
        Sun, 01 Nov 2026 11:45:37 -0800 (PST)
X-Received: by 2002:a05:690e:4550:10b0:679:9afd:c0d7 with SMTP id 956f58d0204a3-67ba4fbc1a2mr4238857d50.18.1793562337166;
        Sun, 01 Nov 2026 11:45:37 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:b450:a0df:c754:9665:1e1e:bbad])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf2e0937sm3698982d50.13.2026.11.01.11.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:45:36 -0800 (PST)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: add HP OmniBook Ultra 14-kg0xxx
Date: Sun,  1 Nov 2026 11:45:25 -0800
Message-ID: <20261101194525.4173-1-jason.pettit@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <e4p3eycp7tmwugjdei7kyqt5rkrbd4ml3f3oiferqpfpxvnjfg@ildezttj2ka2>
References: <20260830-x2-hp-omnibook-ship-v1-0-9feada71dc79@oss.qualcomm.com> <20260830-x2-hp-omnibook-ship-v1-2-9feada71dc79@oss.qualcomm.com> <e4p3eycp7tmwugjdei7kyqt5rkrbd4ml3f3oiferqpfpxvnjfg@ildezttj2ka2>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wyzTC-da0WRxVWZFe7gaOIPaeJ98wHX9
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae796e1 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=4qzK_yRzVmX5WmnSQJ0A:9 a=ukwt756SXJsA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-GUID: wyzTC-da0WRxVWZFe7gaOIPaeJ98wHX9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3OCBTYWx0ZWRfX680rCIXbIXUZ
 ENLcLUZ60h7x3+NrH43vYDMV3kenv108u2OU3BQhuD9Vot61YX02UIHRFU4bP7wlF08L/KOIbTA
 xzf767CtTPRr70UOHGXdP1seu333Q5w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3OCBTYWx0ZWRfXzrwDLvIMGgPm
 kvQVWtmY1nxfvAfGgnySXiaFpgqhEjKNYZmLSXQ6FS2oDphs6ReK57DBZe8Xf6ZSLuQ7zVDRKmZ
 Q+Jc0jFMr6IjAVea4flFQvB8/oHRoVn2xBgS8iklS7nE0tXvhHwtnnoANCSWjRiZxxr3ToQZkS7
 EYUdJEKj0iZQHe+Q9i5mYoU46Zv/ulLgv9E2nggilyVwkcxqBN6QkerfHNZSCCIMyEmRNH/g2lU
 4FNk3SI4vtzAThcq3M3V7ZLzS/nmQk4UymcTb2FvMY351EyuJ3hqBx32wkbnvWU7Dla7mZr36OF
 NiP0KRuPSubPLnC5MsGbylpmoudjn8Oa9age/QWOI9EqXIH85Ur1nFmDMKjGVLS7Q388yDm3C87
 w2v5TQmB3G8AI/YQSVUsvABAOoRSFqrMezasmQLu19hqX84yt4Qvyz7zBeGbs8vsh9c4LfgSCJP
 g0v1w2PW4Vm0ByS+YJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010078

On Mon, Aug 31, 2026 at 11:30:52 +0300, Abel Vesa wrote:
> On 26-08-30 14:56:15, Jason Pettit wrote:
> > +&usb_hs_phy {
> > +	vdd-supply = <&vreg_l2h_e0_0p88>;
> > +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> > +
>
> No redriver?

There is no redriver in this case since this USB is an internal
connection to the USB camera module.
