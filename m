Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260243;
	b=BMlJOyolb0WHqv0UV1T97YKqUFaiEA/Wq+r9yVNrn6FndxcOeTsNPfdH8ic5T4fEcVlL
	 rWl7kS9ZG4DgxBMSBQqPBIH1jx109vkxFSDRJ3Bx/cSAWV0KVEvUTbJ/z9tRWcioLRazX
	 sJ9DosIoJFpx6c8cFnCJwIrxXIwFApB4IXTtGjRQBY0G1ZUGOWhBWQuC4jYML3cVaTSC0
	 eQfLr2RblZh32kHF39SzzTkjLXqUGXf3eG0b1+S21ExpGNesIi+IzwuN7p+lDlXFOEQYf
	 JrJ7GETpv3tCeZee9tiPjkNj6koTRheRkYvJmWhGULJnvLRBEZ1qaFjpZcWKdgtxpIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260243;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NRjITIPkdmWIGWowLy1TC+g49D0fUwGLw1HxPYp7dRg=;
	b=dAOtX8pmLOP55NYzUt39iL9iHvcSSrpIYAOHpjvGQpab75lsgb1KHjFnTijGwhjkGGeC
	 RonlnnQyQpC+ONFbyPhMhUgaOH8RXVq8rk7HyZV9qTy9DRTkbg4PgWDdTQc7QKZpDql6O
	 r+FDBq7wJWhgb4ifWvP4AwQCGJZSI2DqbL/Vdy3byFJQMw/afeVrk0XBnvJ0Y92Pg46UV
	 sAzoG0z1JwARSy2fKpZRSd5q3XMQDEFuz9tZXvCkRba4G573sSIfCaIHXbp15xl4wHkJO
	 zqxVAGlqmawLH9RS8h4MEIGxC+yyJMSq6OVZuxwmACTxdwxptmnu+7Ukw0YaSjGuwnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H9GB5CwF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Dq/YHesS";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E534606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 07:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E534606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H9GB5CwF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dq/YHesS
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5GpPh3294100
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 07:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NRjITIPkdmW
	IGWowLy1TC+g49D0fUwGLw1HxPYp7dRg=; b=H9GB5CwFLiO5T00Hz8eY6N8cqBf
	Zq+34UgfeztZ0VA5dItQCf+rQHeTHWp4qsFS7FsHIA1W/jF1/zKydiN+bhS8FEHw
	9wZ0ClUjLSKCVL+GCkPWz72HdTm0QR2lpn5xFlAkLAyX8szPqIwGXiEUuw+hkffM
	lR8JKMn2WfihnSjWhSbggLU/wVTK88GhfY3ovaLXwBETgVmyqyAgejiIGu8Jqm2O
	fQ2UAEFHVpQZ4eMMVbpS+Biw4F/HrBHnOZfMCzJ7fdqQzlmUQNZjPI6dReVW7Uar
	c3LUVr0pG8nmulbfCrc/VR4AZcavxUO970pMTxs8QKMCjmtMU1r96gZKrHg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkxshrq27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 07:50:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1e62510cso440331985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 00:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793260237; x=1793865037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRjITIPkdmWIGWowLy1TC+g49D0fUwGLw1HxPYp7dRg=;
        b=Dq/YHesSlruM8oYYOdePIQ3WMvkiITNBWS5lRuDNeNWeKahCRRZDk77HfhE2qz5Zvc
         +EEYnH9gPOlRSASOcK2yh+4yuQxOmXmSXXWRKPh1RD4WSrApyXEDUgWPRJmk/m6kUqVE
         vQwIcaUt65MKuagLCfhuRD1tS7giY4rtAXeBLuzsh7SCucVehqXKNn9CMjRHpDDBRSsm
         kgbglsVbuMT/IDJh7eMazhIHBwCOigvlORjC/O1arU8FrmxyyhkLJurLNop7HKOfrvqJ
         UebP70DSVlvQ82XGkpyjiVPjy8qitbahkeLCyJayfpTrm22pyhC58b0uxfxrflQzzsiZ
         4x0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260237; x=1793865037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NRjITIPkdmWIGWowLy1TC+g49D0fUwGLw1HxPYp7dRg=;
        b=hSc/B+m/KxwCZYPUGbd7fHE7509p+6eCsndreD6ORWfVCEdmqapONmaYKrEx7y0YtF
         ywe7E9LHf68jXA7UBMzDi93OaIpWpro0JiklSSuO5cCZSFMEFXyB5lULM/ytASU55q+G
         mCNOpe2gepuQUPjT8yCZ0ZSzoAheYbDkSBMzDDoodhZiLfnM1RDf++djnVzSL06BUwns
         GxdJKWkwYvwBOSlgdG2pe5DzFedk9Lyi3FrNkwGHfvZ6bdnkO1fa+lKwz2w1KOn5HEnH
         pd/+aYTjbdeF+R8XZiajJHzYw1nrMp8d37bl32wioXgi02r1amuQEgN/btUd4XeGZRsn
         lEyw==
X-Forwarded-Encrypted: i=1; AKwUvBy7a92CksODUsfsTA/H71gd76+ft3ozsvRA6y4Bd70oeqqU4oAibohHq4eHu3kst6Bj/eNpNeZPuWLOosSV@vger.kernel.org
X-Gm-Message-State: AFq9FYKiR30PZR8euwOTA6Fn0HBuTicKOFdheMEzKYoTAWv8V5SOv5mk
	pV/Xs6z8Mc4WFNyDMmXAedYmZtDmbsTSkGVrynrT+S28O4rCAOq8jhCG7fpj3qjv9xgQHcF6pQz
	kObmfd6qeF90lgrNmp+3hM0FR7HUTBfgpgkbCySIoPgdtZnB97+75hWx+JZwDDDMCvzVI
X-Gm-Gg: AYBFou0SUMwbZ3ELXI+g4hWoFqJ4Nd6/c0fnVcwKfCO/+7jotG9yxUy6zGtpZHzCJaF
	V15DFbwnVntCavwtJa6gRLo1QtAPmtgBpZMSmWxlKRIuZhimdJ5T2amXAKMOarKxX+uPmltSein
	QnUdV+us0MrR3SmZkwW4nSKaiRZnEK96JswNTahBw+2XmYYQMnD5/WTZ7MQlpEObl/aSs9LXlkT
	+RGAvvulyzJ6NNg1YfsElrw+jYanA6ixibrStbm/DfSLdiaRXqfOjT0JiThsAU1sbLtcrbXvNOB
	VeErX8Hw8MDPnZkH0K6gFhbxE+wm13UKw9xmu5FS2vTGif4df+y/WEE9xFHur8UbwqoV5a8KFUG
	BGdENTLPa/AITYsCpWZcgaFygnqLP46MfWmach5F6GDd/t5KCrRHzjcGsT/DMOR1fMhSVIneXJQ
	==
X-Received: by 2002:a05:620a:17a9:b0:93e:94f2:ada9 with SMTP id af79cd13be357-94408cf77dbmr715123285a.58.1793260236686;
        Thu, 29 Oct 2026 00:50:36 -0700 (PDT)
X-Received: by 2002:a05:620a:17a9:b0:93e:94f2:ada9 with SMTP id af79cd13be357-94408cf77dbmr715122585a.58.1793260236287;
        Thu, 29 Oct 2026 00:50:36 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm31876763f8f.14.2026.10.29.00.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:50:35 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: atanas.filipov@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, Bryan O'Donoghue <bod@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8250: add camcc interconnect cells
Date: Thu, 29 Oct 2026 09:50:33 +0200
Message-Id: <20261029075033.3558229-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <6ivurpkaxe7rs5lxpbyahpst2bqzpkcb67whcymoopdgo6sjvq@xd2otcdpe6gg>
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com> <20261016170701.1504338-4-atanas.filipov@oss.qualcomm.com> <usade5zkrncpry4ufbdtaahoa2zyd5hx7tjgfvzfte2aqbkgs7@t3mej4maj6za> <3e5b7781-20ef-4e84-bb62-29a081c26d8f@oss.qualcomm.com> <x5x4av76vm3swozvwe46uq5vz2ys7bvo4bducpp7flnmhykg65@pvr3znxyktje> <a01d8d86-740e-4a25-96a4-d4dfd664af5e@oss.qualcomm.com> <20261028174523.3514860-1-atanas.filipov@oss.qualcomm.com> <6ivurpkaxe7rs5lxpbyahpst2bqzpkcb67whcymoopdgo6sjvq@xd2otcdpe6gg>
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
X-Proofpoint-GUID: kFgNgiMUS-qjz6j9XVw3sGuotaNQS80i
X-Authority-Analysis: v=2.4 cv=H6BOUOYi c=1 sm=1 tr=0 ts=6ae2facd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=tiiBXXJjtJp2WioFvjMA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMCBTYWx0ZWRfX7crUDf5Cz+J0
 ByF01jwX/o/v5AmfmAOxALTkPkPJYag+HjHMbZjzyogUfJ5fDtlHBoInQKguuHYd9j2Il2okPBH
 b2YKGv647wibckNnGWtL3CavOq7ogsk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMCBTYWx0ZWRfX2360w5jiGaUx
 7sv1DzsuX3mfg5M8GdLOJBOxpo1k9N7dnh4u+bWKzMzN+u4AyKJh8WnguqijXn6RpLwCKaOCMKu
 lRuaF3uYxumiJ5B4Nlk/JTdE/n8g0SJUQP5guxP/U0K8WgguQ+KZTci1I70GWreTBh60wYXI9du
 f6BKHlq3ZU5p8LQGIfLeBorq2FwzLocTZq7iVW5YrJ2VXOxzpITr4QSTPo7H5qxO9edtQkky+YC
 tAznmJPpi0GaU1tPfQG2jZAHvGccc845cA9Mgng7dnnXin1eNJj02I2ekjxnX+qvIsPYmsTdXV5
 KYRcMPypUdKpBGn1OA+aPqTxQ0uNKD7Zb62oKweRJdO8+OLRkbLAFHMHw6FGeTefHQZPeT5fpCM
 Vz4oZQ8cr4Ol6SdNSDJ205HHtYLqHy6dcEYcVa/mbN0tAeoLbNyUfFkXFq1SQ2ksWTpx4kupIBu
 yT1eVaEO8WOZKPWgZAw==
X-Proofpoint-ORIG-GUID: kFgNgiMUS-qjz6j9XVw3sGuotaNQS80i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290030

On 10/29/2026 3:41 AM, Dmitry Baryshkov wrote:
> On Wed, Oct 28, 2026 at 07:45:23PM +0200, Atanas Filipov wrote:
>> 			power-domains = <&camcc IFE_0_GDSC>,
>> 					<&rpmhpd RPMHPD_MMCX>;
>> 			power-domain-names = "ife", "mmcx";
>
> If IFE_0_GDSC is an (indirect) child of MMCX, this is an overkill. You
> should not need to cast votes on MMCX, IFE -> TITAN_TOP -> MMCX will
> work for you.

Agreed, IFE_0_GDSC is a subdomain of TITAN_TOP_GDSC, which is a
subdomain of MMCX. I will keep only the IFE GDSC in the VFE node.

>> Does this match what you had in mind?
>
> Yes

Thanks.

--
Best regards,
Atanas
