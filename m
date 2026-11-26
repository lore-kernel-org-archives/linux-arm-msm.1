Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702024;
	b=5SZtB+oVLhBYHwrLvQB5N4rvPp8fWzIBRFbEkbgYr7wkZ1t8w6ACTE0mX0hQtZOYRI80
	 J5ULVRNQY1p6OiRRJ5BxO/g+/JBDmobZYBe73/LchA12EePZzkrxU+B82vRjvltACNxFS
	 3A0xg/3ChwfoxTXYlAx4FO5r+GvSjloI8o7mWJKD5pQrx0Qi/vo6W6LmiCQ/+iloni4J9
	 O+7epjaup8JzgP3U0VlTcFcigdgcdrpBFUmbm8dmmXBp3oawlwQAwsZ8FGEC3/PPsYvPJ
	 YFTNJ0/ALuXaQksbv1LAIyVq43/TaV75Ckoz0FpKX9wQcYi7XoaGS9NyaBDmjsu8/3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702024;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=b/PZHGfGIFkdgNf1wrqHkIre2ZwvIEblkzjiciZb8Xs=;
	b=V2aP3mSexJl7QmoQt9gd8QRNQEvAePzM7WiyO8MYRo2A+CChad62DQJjhxb/z295qIGs
	 Lo88SmzGFJz9Z8Fwqxe6FdIDiRliSz4fiWhzpHqrvUdv65Zib5iljnyDtebx9xPJL0E59
	 cfVQv0VBDbFbkQgb7+N0CkeXXCV6NJ/6lfDRGFqVTMrlkryd2kwEi0sl+1ve3jcV0Z8eK
	 JzkiutfkTcZp5PaLNc1OriR3VpoWtfMuPajjJxbP0fLobxuz+AbFYkuLJ95pJdnyMkwop
	 IaytHIbBst8933nhxhRDWpjtOHzqzadhHiIp42Y/FV75y48QO2OxjJmm7tJPdz3v8tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sw5kGqNw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X3PNFDfV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91ED5606A327
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91ED5606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sw5kGqNw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X3PNFDfV
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVlpq3278884
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b/PZHGfGIFkdgNf1wrqHkIre2ZwvIEblkzjiciZb8Xs=; b=Sw5kGqNwFaTKAS2L
	IZeVisiDBKK82mwemBnbAy81qlmiMN1AUImIrNYT8pIEECDfD2aeT8YbyKZClQBA
	YPFS1RIHxSQhwZU7QiDamzxat9Qis5zBBXWhy5Nel4I7GOepm+pL0a9nktatsEM1
	XQZY+WwB+gtFisxUW19/+B4nWWimQdJGjV5v+U4hDbes6QmjOR41MHBEISAFQa9s
	bLhJIwwTvK2lad0UlA7DHEyihXQKlAMKkpE6FnUOwUTssr6HoEZMPgQZoGSf1L+r
	ifwv/DD2adf39rK5CfjoZHc+o8ACMdFoTcLRQD6b2lkKGInx+YUM/BfV+Vz+zMU/
	B1JthQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7g97hr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:07:02 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99e12db7450so137445241.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795702022; x=1796306822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b/PZHGfGIFkdgNf1wrqHkIre2ZwvIEblkzjiciZb8Xs=;
        b=X3PNFDfVk4txNkaGXm8Ur1KS/Rr6/X4nwpcMwLVIkM5utJp45jZUoie9WC/Y3cMkqT
         CxSn7WN/irAy4s47D9aWm7PMsnnwui2W1mEg9dQhROoDKSWEFk9w5DZht7t/ftwXWBMx
         rzu9mf/m5CQRi2ebafUdOj4YuyE7BFfi7wzzCBs4BM04OLF0jeDy/flhl4d3LGgwN0t3
         Gg8HbLH2ShmjTvNYZHbvFkTYFOvJcpgR+79Mo6G3ZRyVeUJbNbXFaYtNKqTmdDsy8Kiy
         T2Py/fN15gKUXYH3Y+Zq+rOGE4WXPfBEkFN8eNj1B1kuB1qp+jzWBTJiLjlOtTL9f+/l
         pNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702022; x=1796306822;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b/PZHGfGIFkdgNf1wrqHkIre2ZwvIEblkzjiciZb8Xs=;
        b=UhGIlTCFL2gSIqjzPdzDDWBfNp/opvbSm8p1qbqkJx3I0Xvk4rTvg2eHdCVYFXCGCE
         +uJIlgNQP2stFbRR/DQGtvTy/8smy1L/yNZ0Eqckt0MsoQXqSXsq9LE4gAiVx+7cCy9A
         WxIZUQMgjsn0FbMJKjmzbPI7I6xtaGxVB3S3y0hg4lP2vVVwjcsKjYnqMqd2+0c924G9
         JIjbvitmcB1zDQRkhOtKeGKJLy6tyDQbYe/qMeY05YEcAtnAjVj0FBPcuIFo7AsH4ck3
         ShXpbrOv3mQq8KDzg9yj1CbMmrRoMljcEm7Uk2tp2k6TU+fuFxla6eViReihsJoDrtu5
         xOQQ==
X-Gm-Message-State: APuU4Z8b7CnGVZUnNx/hqnyFU6qrd1p5Mk5ZzA9RZCBeCCJiH8jHRzvw
	H1OQTRiQ3NpDrO/amm8tlb9Ai5QQNST5TiHOx32sFiRp547USQ/1Fru4EGxyZsxygUiOn27WIQd
	VDrPQLLZbAo3UYUaJ2D+68PSfboBTPyjA44XadkMBiBNhReaEBBlri73ZPIRA0S4NpgBM
X-Gm-Gg: AZFdTZd08oMj6tESXgEloH/5JallaoMM9yZLkOkSq8YdAdb8vptQkFB+w2l4w0clI2i
	vQ9Hi9Hbqj2VPNhQbhThbYJLntLA6CqAMeLCEl++Zrro6ke8I+GxYGCcizzljNB44qfVxfCd75y
	FZEmDh/KG4x/mWwqJM6BTlyd/kuFsZAp/iZpwW5SSRAxBKBfqSw+kLsUKoeF/j7im+zv0c6pfvz
	PCnedSc0evI9nBmOVSBj1PiIoeXiyGr/AXWwtpMU60gmpqNGV7IXQcnjazK3ePBvsR43B/iUzgT
	r2pJBon4ZAVZJ9tXwVLCFcxNF6AoTFVyuHZMhNNf9UcIpsiUUokXOmc89U/OAGOrk5tV40IErfa
	mOv2xfKEK/FFNNdj1F7l+QJCYmqSsW1mHWjBaHPABQdt6ED83sxNXOTzSrj05akPWin5PRbmD3l
	R8RAtrkP8=
X-Received: by 2002:a05:6122:8882:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ee8af92398mr13218589e0c.5.1795702021728;
        Thu, 26 Nov 2026 06:07:01 -0800 (PST)
X-Received: by 2002:a05:6122:8882:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ee8af92398mr13218529e0c.5.1795702021169;
        Thu, 26 Nov 2026 06:07:01 -0800 (PST)
Received: from [192.168.0.242] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906e4ce6sm364063685e9.4.2026.11.26.06.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:07:00 -0800 (PST)
Message-ID: <cbf38851-d20b-4242-95b8-28eac985d21b@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:06:58 +0100
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
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add Molokai TLMM driver
To: venkat.yadlapati@yahoo.com, Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20261123-molokai-tlmm-v4-0-eed6eeaacc70@yahoo.com>
 <20261123-molokai-tlmm-v4-2-eed6eeaacc70@yahoo.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-molokai-tlmm-v4-2-eed6eeaacc70@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nGT9qWVo39hUmxnucYcoOU2n7kZlaqqx
X-Proofpoint-GUID: nGT9qWVo39hUmxnucYcoOU2n7kZlaqqx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfXytjlX375oWI3
 SFJaYqXxuazdYiMsmIGvERxdTT/P1Mn/xnC4P5kIEl3ym4Kdg68+C3KAAgmddEzg2hO+Wii5EtO
 Cgbm+gCCVRWirS0HmMOBQahRQIZupvXKM1p78D6jUt5+KgaV6YGls3UacoWcZQatAz7domFiGCJ
 brIo1hTz2U5hNRGU1JYppJrFzLG7CO3ofXZ6Kc3t8qp+eqvzF9ac2RGOmZBfGrCBCweYAqwIkwD
 XgWkVycQ/crsSW8KtErXFOC16MnCnjWY4hnM46G1a03khr3+JKxv3XGrGkoEIIqxT82qk1Q2WQJ
 vXfLpOP+XZGoMu8QkQzJwV7UWhqQIheJhsL7CtNHo30eVvUGHZl3S9Kmj5Ut5obLhYpMGCf99dA
 wKZtCYjqNOk9MjKl+EjJPjBHtnUvUcrsPNPxvM7tjc0010z3UQhA6TbB0NYm5cJx/OMovZMpqxl
 KH3n7ycSn5gm1hAbsQA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX2fUObKjvC+vI
 4Bgu6iZgQMixulECfTWrGm5YJGmBLg+5rSESbc1475wbCsUFZ+LDn188TdD0B8WnWp0ygJIcWC9
 L3E2rW3NlLfbG5GjBqLDg9dkGSuxbiQ=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b083d06 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=CjxXgO3LAAAA:8 a=XEbodZ_ldB3zFuGnKb0A:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260055



On 23-Nov-26 17:03, Venkat Yadlapati via B4 Relay wrote:
> From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> 
> Add the pin controller driver for the TLMM block of the Qualcomm Molokai
> (SM8845) SoC.
> 
> The register layout is the one of Kaanapali, but only 35 of the 205 pins
> have the Kaanapali pin functions and the GPIO to PDC wakeup interrupt map
> has no entry in common with Kaanapali, so the Kaanapali driver cannot be
> reused: with its tables, a wake-capable GPIO interrupt on Molokai is
> routed to the wrong PDC input and never fires.
> 
> Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> ---

[...]

> +/* Every pin is maintained as a single group, and missing or non-existing pin
> + * would be maintained as dummy group to synchronize pin group index with
> + * pin descriptor registered with pinctrl core.
> + * Clients would not be able to request these dummy pin groups.
> + */

Please drop this comment

Feedback from an LLM with doc access:

- Add gp_mn on GPIO127 at mux 2.
- Add gp_pdm_mira on GPIO35, GPIO146 and GPIO147 at mux 2.
- Add gp_pdm_mirb on GPIO63 and GPIO72 at mux 2, and GPIO88
  at mux 4. Keep each mirror route under one function; do not
  create per-lane functions.
- Add RFFE0 on GPIO138/139 at mux 1, RFFE1 on GPIO140/141 at
  mux 1, and RFFE2 on GPIO142/143 at mux 1 (Konrad: maybe
  let's keep them all named rffe?)
- Add grfc on GPIO79/85 at mux 1, GPIO138-143 at mux 2,
  GPIO144/145 at mux 1, GPIO150/151 at mux 1, and GPIO152 at
  mux 2.
- Keep qup2_se5 on GPIO17 at mux 2 for function qup2_se5_l3.
  Add a distinct qup2_se5_l6 selector on GPIO17
  at mux 3.
- Keep qup1_se5_mirb on GPIO202/203 at mux 1 for functions
  qup1_se5_l0_mirb and qup1_se5_l1_mirb. Add distinct
  qup1_se5_l2_mirb on GPIO202 and qup1_se5_l3_mirb on GPIO203
  at mux 2.

Konrad
