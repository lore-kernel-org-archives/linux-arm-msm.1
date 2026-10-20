Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482064;
	b=16dmPgPBv+XmsmTWwN/hmC3Q10rthTOjyYydq+XcV+C3JJZibOioMb139q/Uj5AA3yye
	 QXILt97dTRcpiCdHlaDfyq2vhiBiO4qvSk5aB6pPr6UlYwZFNXY7P+sB0BkbsXz0ea2Ky
	 K6+dRrrvFYGneI03/pTLsglGkVQMk3j7evY25E9sUMIjAC9ny3pxIGnIdZSPvkQtS6Avn
	 BF4iy8bAmhq93fqLstrhyQK907qF/D/u7kfQSJ3mrkESRzL08uBAQo+XCO2M6qEPL/+wy
	 wF94vxiHUmUBd5pn7xNsm8bFicS64cRAC0Hd0oZaBgSatgscCV+H1ncxtUQ/HS2PzSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482064;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cp1Y8xvBrewZXXFxU4t9Ix6XbCVRlU6BMPwpq9aQl7A=;
	b=PP7lR+ZCj/x5HaHryE+t4HbpacM8gDRAfb3Xzlg26vkNiah1EQae00lSN5VUufbi1Sg7
	 qXyG6gvjiLeEcYi3tyQfLPnuwSJLKkh/GOegrkvBPuYiiXlkQnD3N/y9i3Eqb90WshBUf
	 UjnVFOZmtjvdcehOImneOj3fwOLvOj3Vo8rmk1VUTRliTB+49xBSEXF5mhy6X+8dzWS2L
	 ACq790BUfTVozqo59yfQSy4xmv7fy0R0dAho5lnwD8J4ZwXitV1fwxhEfYcyjhIfWvh/U
	 fAjeLY+aFns+siC6Kgso+1VUquR8kgHkYG920CAkKVxrsOK7b1uwT0RbLrmNriRRIjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MaH755m+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MMcLl7FV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFC5606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BFC5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MaH755m+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MMcLl7FV
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tIeu2877952
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cp1Y8xvBrewZXXFxU4t9Ix6XbCVRlU6BMPwpq9aQl7A=; b=MaH755m+J3aEMTH+
	PCxxT72diq2tT11z6JtY3r4IixHNeqlOVpN8FL0r/Vplgxek5zVIVyCT1B75TrYw
	Hk7z4linNXb8fESvkTT3stNJ1Z3FUqi32CcSj9tf9OgNswHoxfvtl01SWReucujX
	s5CL2FpWoSgRmwvt/qCUK0GUaX2pmlhAp7W/rdnlQQwtVgAGg9Z8vD/7Uyqy+vOD
	C/kpja4oV5nYoLrq8Yp64KCeqjJ5OvCWbaeN8yiILhyF4IIWk95dJ30wHkpr0abW
	POLu82aaM81+fMIzFx4KLsLGqftr4b6gyeGWZm7v6ckUN1+FN3l647lkdt+w8+WC
	IkbdDQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pse5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:41:03 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179d9bc964so8367456d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 00:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792482062; x=1793086862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cp1Y8xvBrewZXXFxU4t9Ix6XbCVRlU6BMPwpq9aQl7A=;
        b=MMcLl7FVbgkcNgibqy4w9ZJZ0SIvfk/Ig2s5LcO26HqwkZnVW+5KAIV5iZK005GOJv
         K0szqBVIuNpQKPX9MbsyVPckJAlSCWX3IYCr7MVbPYKeWJ3dsH7FtbKrvo2bQsW3J2N+
         IgTRm+EsfqUuK5ylXENiVczpZO5gyY2MsshLjl+NeD4h+B1JKPAd279UZJTNTuZY/wxX
         u9QMtw2Xt1+EkeVg8y20RsiYzZPG0N43fo88p4aHkE8uzi4tLna3bRY+aOjNynvR47ua
         f/vFpP0KQW8D+VYtfhCmplA8+DU35YtjM2dU7KfcjfulZrzqo1pk30Aubm5wEf5xk3Bp
         MZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482062; x=1793086862;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cp1Y8xvBrewZXXFxU4t9Ix6XbCVRlU6BMPwpq9aQl7A=;
        b=OSR9orlj1TIozrFWC4kuD4FwIBExKGT6SwAXMcTp+uKelsIwVBBB85GgXcdivFAy/n
         JjcaZaVKnTdHAAKRWWxbs4Cr0q12bA81Zm0Dl5M4m2Z/sIH1SsoorY/Q2+mBH+yEp/3M
         tIxpcGH4peVMsbILObQeWczDgJijdtqyfMIiYlIhIlOjN1hLafKp2maNAe28F5vjTKKp
         dxoZLgjQm2frsdrNVHjKgO8hhv9mSHhlSGR6M35/IVBK+oIrOGOd/uoS3/dLf8KyNRdI
         PnbNOsB8yP0Nqyov+krNGzIFiTSjUrON68Ti/s7sLrkb2zO738u41YFxSKaq+NxP+zmd
         +eHg==
X-Gm-Message-State: AFq9FYIofW5vtvEyLJ0KTfPawcwxVGNP3oWrkKwbI3vpOyipxHRwsS97
	fQHwm6LIdsbbhm/bcZWJDyWpHGbs5PTyyOVceMYJJOQHaR/NTK52RZDd1Ivy2k1AKLS96lgjByY
	ukxiSB8h9+TxFP4a9JOqkEVcRTwtTtHUnW2stnALI7q6I8+vvQo3MEUG8ew1xcmaZvWZc
X-Gm-Gg: AYBFou1QEC2OfkV7sujhyMOz/Iqsabn41wUiigInKzC3rCynvlrV4WUe9PEx9Qp4kOx
	GpDVWwufqTkmkAPkxzt0hvJgsjIb1x5SpkqaxsdGDqm0TBqaHIx/7wnCkp1GJzsqWNARPuoyiBY
	R9hPGFzedHIrcJgJhnm/iY5mymOrUt3tDeciq9aVS5QFNr5+yY53EFNwOCA+jtpZw6AU4/w3+k+
	WozCTVC1Muts3HXZ21A0xRQ7jCU5LeJ10F/RdqD0fAIkXEY8Vg+n2xdEizxuKOUZ3m2I/cgDriP
	CsDkBulIeWbfwaqJKf8HHhGukmf4j1FZRN8gKCgYZINQIYp3XwwWtO+xY05WdJaEF3Dgt2321dh
	/jzI4z36wEUavdvdIHlL79Q==
X-Received: by 2002:a05:620a:a99a:20b0:93f:43a4:a48f with SMTP id af79cd13be357-93f43a4a566mr465668785a.5.1792482062396;
        Tue, 20 Oct 2026 00:41:02 -0700 (PDT)
X-Received: by 2002:a05:620a:a99a:20b0:93f:43a4:a48f with SMTP id af79cd13be357-93f43a4a566mr465666385a.5.1792482061925;
        Tue, 20 Oct 2026 00:41:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c42a3f4eaa0sm287773166b.0.2026.10.20.00.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:41:01 -0700 (PDT)
Message-ID: <ec59632a-d923-4247-975c-7ab9e23c739c@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:41:00 +0200
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: ipq5018-tplink-archer-ax55-v1: use
 'ipq0518' prefix for dts
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261007-tplink-ax55-v1-ipq0518-v1-0-0ef058756596@gmail.com>
 <20261007-tplink-ax55-v1-ipq0518-v1-3-0ef058756596@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261007-tplink-ax55-v1-ipq0518-v1-3-0ef058756596@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DrrDa2/+ c=1 sm=1 tr=0 ts=6ad71b0f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=pyv2_bVU4k4AM6XG6ZMA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfXx/lH2DTEU9sw
 8sg+ApIW8evvnvzuS00WAlGKxWdNRM8Cz0V7U9/Gn596/SGakU/EGTPLPKKKwLT6wQP5SGpR5Pm
 pMqm6ixxsqa6DZ86lNNOBbEWvDTCgoGh3ohmvBFHb2K3VoUUcrWSW7M874yFOBYcXcRJAX/Jorp
 S65gjkr1FSbi620XoTcHyYrK4E2aJ9Nou4rJD4KfIFW6dP5FsvKr0Xgot57cx5L7+snZoUEnsnE
 2EAjEPjCfkEkjB3q+OXYmFvfnJEuh691DEvau6z5E7SePkZhWJSEnMJ7CLpof3M61YSoNVEM6ww
 bddB++ewNy72XL8qLugFKeS7oMbfyaNhEkYqOiniZJCgt/OU5/njWDeHcMFIaRK1J/9FCAVK5nc
 +HS//B/px3178uwRxhBX9ePGjpxv8KvWlgTbPGamkQVnyasmAygJtx5pYw7t4Te3xWnxnxuFrx2
 aPo6yWvWcNIhl8+7mKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX6VqNwzgt2tP5
 UCiQ5BmPHvuvQNEoeZ8JxSw5HdQx6nLv/BRnms+X9WZnLoNAE70sLYWPwmcwA1cb/itMIL8IGGc
 l3qNoQGppMeLbOhyCwiXG4tgW+M/QY0=
X-Proofpoint-GUID: OAbaMWKdw3aFxXvbqY0aL04cN9yZc6Ey
X-Proofpoint-ORIG-GUID: OAbaMWKdw3aFxXvbqY0aL04cN9yZc6Ey
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200030

On 10/7/26 6:59 PM, Gabor Juhos wrote:
> The TP-Link Archer AX55 v1 board is based on the IPQ0518 SoC.
> Change the prefix of the board dts to reflect that.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

I hope this doesn't break any of your workflows

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
