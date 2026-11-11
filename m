Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411623;
	b=vAH9Mp2hkBVqa8xfMG+0iMGL0ZnIqjj5DC4isjfAi+s2aeGwa3Pg95RwIsROAzYXNVXN
	 6tohYZKa2P3545Zh20gjI75Fw/HFTdDyMSWb8z4fUh6drFGpG6TdVMTGBBS46iZ+IIORq
	 G5nvuzmgYJ89RY5nQUzaQBOYvC/TtUs1ddd0DmSj47oBLftj+npPdBaLrNGkK/2uNTt7P
	 dzAY+TsXB0y35JncYQoqFCqkL5UT+J3XvlmJNcYKU4jb5gJFFiaS+S8lqvXcsuzZGN2Yj
	 2kQVM3V5alpalV5EIEyt2kx+yey0voSDXJk7/dbi1FhjBDXGSkOjkfMxrjFqkeg+nEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411623;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FA1mHnF+XhN6ttPQgBr5HKBiaAsWpxa3gFD/i1WYPj0=;
	b=eNTCSxXaXweTrjCz4lThYQGkYvguYqD6X+wQQsxpKX9lu/ZZhzy1ihkaO90lN6jm1LYx
	 MySBqOWPm5eKK+oaYPD8aswVONVPO7zokh5RPlvaNSbyvXldi/5kpsKarPVO+ZZiovpuu
	 HjFUaHpgf7VGmFEkoohrBsjiKneNpTkTQdKxZ6T8LXLxgQJSomkAi8W9ZdSP7zKgapurA
	 AQ5EmQT8Czb81APpTHzfSyV2VuMQ0IL3HjxDkqCfsXPN/HOwRLksPU9h3ncWVLaxWUdaP
	 6acUAGz2yXmxbtpAPZQG7LWoJExTY+cqVTqcT2s28ciIYyWDzk81tQFJAvntDcMKlVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cmpR6iEg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MFenZKQg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85D860A2601
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 15:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C85D860A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cmpR6iEg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MFenZKQg
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0Gha2316186
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 15:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FA1mHnF+XhN
	6ttPQgBr5HKBiaAsWpxa3gFD/i1WYPj0=; b=cmpR6iEgItva8d+V7jBmgK1yi8y
	WvWKre2w6PsPgtBTgaWEfwSO0WB22pAYq2s2wXs3kZvVCkX5vyZPsceblbDezrtC
	Uo1bjE4le6s+Cs6UG2u91KzJlCIpbgksbaaxbI5aXWXljnEuGZK6dEQsNZalwD7x
	rZqqCj6g/0yiNTjNUYGDGBeEnYf9NV6FkQrFjqvgKxQgMbhCK+UoDcbknPyGL6MS
	ZELlk2uFR9s+0h3eXlEdSPpR0yjqQMFKrxyE4n782+dz4jPoPOCCGiLPzCiDWtF8
	S0ztZ9CHejo3GRM7n66kaQoMlStB5k0fSGcUOFal++DF0xbQzuqV4Bs5j3Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdrh3fm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 15:40:21 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2dffa1186so195263137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794411621; x=1795016421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FA1mHnF+XhN6ttPQgBr5HKBiaAsWpxa3gFD/i1WYPj0=;
        b=MFenZKQgsGUlx4zDEDXADzZBOjSh+qOulwQvtjrmv4ViEkiAO1p+20RCrlv8ybZywb
         3LpiZNkzvZhXmNPtKQ7b7lhlgbeQ/LAXawMF3keNqKYSVqoCNkhpUsxGUrZoZ7hfPnH3
         /I6smMb4IQkDh92FFNt1Ukvm53ocl9RyWDrCeIB77eB2g6wvt/W+BTrYjZPbMCiZXLWa
         xLvV66huARM+yv2Xa+pt+QXR6v8lZCxhvTh4JySqFDz1lc+qyuct9JMcIP4EwyFyGC7R
         MxyEgbdqzqoLyTxr/bfY9KEQMBb1NPXYN47bf0zIvzp5Qq1gtJPDgqTdAwLjgJo6hRbo
         xWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411621; x=1795016421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FA1mHnF+XhN6ttPQgBr5HKBiaAsWpxa3gFD/i1WYPj0=;
        b=pnCtTKwsLx4o+haTrV3Vln7hFOBsHjAb97MB/d6C5/WjuTD7YEKmlGuTG7w69Td5Wb
         VG/uc8jIPHSIjbByjD1BwT+iZvDwmRAbSckrqPxsWj6tbewSrweYGNuxCGF/bEe3rK00
         vFVXW9p4Mhk6MpY6IU0fYYY0U96tAoloFEi7kQKd8orQpmsCDYkGYTJVrszV0RjSmLyp
         esJsFzXp6CBqWpbx/0YxGivc9TrdwNLsU6I8lzB2+VWuh2o6xj8n0ymfaofNwvxxhkx0
         GiPh7j4Mlo5ti2OycSQNsZMicEPrJAQtEZc1DwLx/4i1voBkre2DgMPtLnlU2H8Zahhn
         opAg==
X-Forwarded-Encrypted: i=1; AL+hErFNcfZXifQysZ2fk+YFA0leBVibGBaOjZLJhWiCnWROPM2CA6Q9UvOTHUs8CAL2ZQc/TqQXTKp54WvnYdTR@vger.kernel.org
X-Gm-Message-State: APuU4Z8jZyvL/n6Bq+Jxe/kiEyvpWth4sKB+gZJANCUHKZAhtTzeBN/B
	T/35UXdlervuETJEr07sN9SyrT0tr8SBMYteLgBA/RGqQSThikhcQHyP+mdrlhueMOavm6tkcA4
	gwNaLkACexXOrOR95ThciKq9loUA5VWgjGBXhAGT3GDySgkJtv7gYt8k5KyKjviYodCdq
X-Gm-Gg: AYBFou1JdTdwRjIVu2/+V83Jecf8iYLHUvWN3Cdy1STfBb3X5t86Xx/UeZiZFQiELOM
	xpV2kVzf2sgD4WTEPOMTmzU8HHfi7nkBYPYnPyiLezhBc9h7QUFAkXI+wx6ISyqkJlbILORwWhg
	3Mayxrf6hHxDYx+0L3rFpJ+2LJnDAcJjZ4ELu+WcoAFhtmqprftH9xe4bp2N7iyJ0kTurTZwD1F
	W98yFpOwjnAfzj+ahvdLoyFjuJWlh03g9+FnKj0Ayk4rYAalpTCQqRC2Tp8sbdQU0DNPci1Cc7y
	mSkbHoFk58tiQhk480DddqlvRveJk1OIcCRtlevLuN3ogeojISn+ud389NkP5FKbMUgA9omNm4R
	4DqUSunUTx65zsKUIW4G5B6ma42TCYAKWyn0kOGAJvrIRaIPYd7igLLgnngm6oSWsE7HCwP+6kg
	==
X-Received: by 2002:a67:e106:0:b0:7a1:f980:e934 with SMTP id ada2fe7eead31-7d4fb287de8mr763505137.16.1794411621064;
        Wed, 11 Nov 2026 07:40:21 -0800 (PST)
X-Received: by 2002:a67:e106:0:b0:7a1:f980:e934 with SMTP id ada2fe7eead31-7d4fb287de8mr763500137.16.1794411620618;
        Wed, 11 Nov 2026 07:40:20 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c52fe41sm5288525e9.5.2026.11.11.07.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:40:19 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: Re: [PATCH v8 5/8] arm64: dts: qcom: sm8250: Add JPEG encoder node
Date: Wed, 11 Nov 2026 17:40:18 +0200
Message-Id: <20261111154018.654669-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3ti6ntq6ztczilnwv66ak7ohl63mgw4tv4mdbsiy2hrkqqqjow@rmkwrasthd5e>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com> <20261110163909.78085-6-atanas.filipov@oss.qualcomm.com> <3ti6ntq6ztczilnwv66ak7ohl63mgw4tv4mdbsiy2hrkqqqjow@rmkwrasthd5e>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX4OvUj/Dg4J9W
 0rEdKOoWCoNmbo9+3M+bTFetXgMXGqxCmVAagjF9CuPr6ssrippegp8M7yeszVccfaVi0Pn4KEu
 rdsWSt43GSNDERJvPw8cFcEuDCI8/Sg=
X-Authority-Analysis: v=2.4 cv=PoQG/AM3 c=1 sm=1 tr=0 ts=6af48c65 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=AU935lpaGaaCzQUhO60A:9
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: Ks-se8kgoTSNT0r_dzhSIJG7FGc6N16o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX3PWDnkCKrRTG
 1aHf4eUYr41PWIkmxujYb42XY9nsNbsGgRu+7LiATb6jcO6gKcKKS2MTFdO/aTvqiLbAFL7hOsI
 /+Hb5Y6l7MMBjLAzK37ptR7mpDsfTUDSo1SC3UH9XeTiRDqmK1IreErbRLsZ/bu+B/hZAk5Y1GK
 qzFeYua/EZi+jiiRV6OXXKJ4/+pYyuFXU1g6mqOHOftkBKyu2jd39PhoucP6anM0f9FQflvyfzq
 fArqan7oPvAHad5a9fmMOvutCRtPD6QgyoePKXO1NC+7ntqjA5TH4B481FMVp8KpROo1dfDtPyh
 ROwDF9t25jj/NAaBx/RJoDnTUvdaLqsrMCHOzjwDy0U/nosudeCu0VPS+RWbBMgHa1QkINJLr7n
 As/TcG5pbqrYprlWpZJoFzC3H6n+V7XA0r2jEf7VkrhBceuH606A1yxMl3FtLlbemTYfWV+3Uti
 wce9A1nt/GMohK01xHw==
X-Proofpoint-ORIG-GUID: Ks-se8kgoTSNT0r_dzhSIJG7FGc6N16o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110062

On Wed, Nov 11, 2026 at 03:14:54PM +0200, Dmitry Baryshkov wrote:
> > +		jpeg_enc: jpeg-encoder@ac53000 {
> > +			compatible = "qcom,sm8250-jpeg-enc";
> > +			status = "disabled";
>
> Drop, there is no point in keeping it disabled. (And the status is
> expected to be the last property anyway).

Ok, I will enable it by default in the next version.

> > +			power-domains = <&camcc TITAN_TOP_GDSC>,
>
> TITAN_TOP_GDSC is a child of MMCX. You shouldn't need to declare mmcx
> separately. Instead cast the votes on TITAN and they will propagate to
> the MMCX rail.

Ok, I will drop mmcx and vote through TITAN_TOP_GDSC.

> > +			interconnects = <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>;
>
> Use tags instead of 0.  I guess it's QCOM_ICC_TAG_ALWAYS.

Ok, I will use QCOM_ICC_TAG_ALWAYS.

--
Best regards,
Atanas
